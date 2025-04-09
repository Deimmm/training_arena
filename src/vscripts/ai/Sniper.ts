import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class sniper_ai extends BaseModifier {
  private optimal_attack_range: number = 500;
  private self?: CDOTA_BaseNPC;
  private spawn_vector?: Vector;

  OnCreated(params: any) {
    if (IsServer()) {
      const ai = this.GetParent();

      if (params.spawn_name) {
        const sniper_spawn = Entities.FindByName(undefined, params.spawn_name);
        this.spawn_vector = sniper_spawn.GetAbsOrigin();
      }
      ai.SetPhysicalArmorBaseValue(99999);
      ai.SetBaseHealthRegen(99999);
      ai.SetBaseDamageMax(params.damage - 27);
      ai.SetBaseDamageMin(params.damage - 27);
      ai.SetAttackCapability(params.base_attack_time + 0.3);

      this.self = ai;
      ExecuteOrderFromTable({
        UnitIndex: this.self.GetEntityIndex(),
        OrderType: UnitOrder.HOLD_POSITION,
      });
      this.StartIntervalThink(0.1);
    }
    print(this?.self?.GetSecondsPerAttack(false));
  }
  OnIntervalThink() {
    const ai = this.self;
    if (!ai) {
      return;
    }

    const creeps = Entities.FindAllByClassname("npc_dota_creep_lane")
      .filter((creep) => creep.IsAlive())
      .sort((a, b) => a.GetHealth() - b.GetHealth());
    const lasthitableCreeps = creeps.filter(
      (creep) =>
        creep.GetHealth() <=
        ai.GetAverageTrueAttackDamage(creep as CDOTA_BaseNPC),
    );

    let mvp: CBaseEntity | null = null;
    switch (true) {
      case lasthitableCreeps.length > 1:
        mvp = lasthitableCreeps.sort(
          (a, b) => this.getCreepCost(b) - this.getCreepCost(a),
        )[0];
        break;
      case lasthitableCreeps.length === 1:
        mvp = lasthitableCreeps[0];
        break;
      default:
        ExecuteOrderFromTable({
          UnitIndex: ai.GetEntityIndex(),
          OrderType: UnitOrder.HOLD_POSITION,
        });
        this.prepareAttack();
    }

    if (mvp) {
      print("MVP: ", mvp.GetName());
      ExecuteOrderFromTable({
        UnitIndex: ai.GetEntityIndex(),
        OrderType: UnitOrder.ATTACK_TARGET,
        TargetIndex: mvp.GetEntityIndex(),
      });
    }
  }

  private prepareAttack() {
    const ai = this.self;
    if (!ai) {
      return;
    }
    const attackInterval = ai.GetSecondsPerAttack(false);

    const creeps = Entities.FindAllByClassname("npc_dota_creep_lane").filter(
      (creep) => creep.IsAlive(),
    );
    const nextMVPS = creeps.sort(
      (a, b) => this.calculateTimeToMVP(a) - this.calculateTimeToMVP(b),
    );
    const treshold = this.calculateTimeToMVP(nextMVPS[0]) + attackInterval;
    const mvps = nextMVPS.filter(
      (creep) => this.calculateTimeToMVP(creep) < treshold,
    );

    let movePostion: Vector | null = null;
    let BVector: Vector;
    const AVector = ai.GetAbsOrigin();

    switch (true) {
      case mvps.length >= 1:
        const creep = mvps[0];
        BVector = creep.GetAbsOrigin();
        const vector = this.keepDistanceToCreepVector(creep);
        if (vector) {
          movePostion = vector;
        }
        break;
      // case mvps.length === 2:
      //   break;
      case mvps.length === 0:
        if (creeps.length > 0) {
          const closestCreep = creeps.sort((a, b) => {
            const aLength = (AVector - a.GetAbsOrigin()) as Vector;
            const bLength = (AVector - b.GetAbsOrigin()) as Vector;
            return aLength.Length2D() - bLength.Length2D();
          });
          const vector = this.keepDistanceToCreepVector(closestCreep[0]);

          if (vector) {
            movePostion = vector;
          }
        }
      default:
        break;
    }

    if (!movePostion) {
      if (BVector) {
        ExecuteOrderFromTable({
          UnitIndex: ai.GetEntityIndex(),
          OrderType: UnitOrder.MOVE_RELATIVE,
          Position: this.setVectorLenght(
            (BVector - ai.GetAbsOrigin()) as Vector,
            1,
          ),
        });
      }
      return;
    }
    ExecuteOrderFromTable({
      UnitIndex: ai.GetEntityIndex(),
      OrderType: UnitOrder.MOVE_RELATIVE,
      Position: movePostion,
    });
  }
  private keepDistanceToCreepVector(creep: CBaseEntity): Vector | void {
    const ai = this.self;
    if (!ai) {
      return;
    }
    let movePosition: Vector;

    const optimalMax = this.optimal_attack_range + 50;
    const optimalMin = this.optimal_attack_range - 50;
    const AVector = this.spawn_vector;
    const BVector = creep.GetAbsOrigin();
    const AIVector = BVector - ai.GetAbsOrigin();

    const distance_between = this.calculateDistance(creep);
    if (
      (distance_between && distance_between > optimalMax) ||
      distance_between < optimalMin
    ) {
      movePosition = this.setVectorLenght(
        (BVector - AVector) as Vector,
        this.optimal_attack_range,
      );
      movePosition = (AIVector - movePosition) as Vector;
    }

    return movePosition;
  }

  private setVectorLenght(initVector: Vector, length: number): Vector {
    const { x, y } = initVector;
    const initLength = initVector.Length2D();
    const normilizedVector = Vector(x / initLength, y / initLength);
    return Vector(normilizedVector.x * length, normilizedVector.y * length);
  }
  private calculateTimeToMVP(creep: CBaseEntity): number {
    const incDPS = this.creepIncomingDPS(creep);
    const health = creep.GetHealth();
    return health / incDPS;
  }

  private getAttackingUnits(creep: CBaseEntity): CDOTA_BaseNPC[] {
    const creeps = FindUnitsInRadius(
      creep.GetTeam(),
      creep.GetAbsOrigin(),
      undefined,
      3000,
      UnitTargetTeam.ENEMY,
      UnitTargetType.HEROES_AND_CREEPS,
      UnitTargetFlags.NONE,
      FindOrder.ANY,
      false,
    );
    const towers = FindUnitsInRadius(
      creep.GetTeam(),
      creep.GetAbsOrigin(),
      undefined,
      3000,
      UnitTargetTeam.BOTH,
      UnitTargetType.BUILDING,
      UnitTargetFlags.NONE,
      FindOrder.ANY,
      false,
    );

    return [creeps, towers]
      .flat()
      .filter(
        (enemy) =>
          enemy.GetAttackTarget()?.GetEntityIndex() === creep.GetEntityIndex(),
      );
  }

  private creepIncomingDPS(creep: CBaseEntity) {
    const enemies = this.getAttackingUnits(creep);
    return enemies.reduce((acc: number, enemy) => {
      const damage = enemy.GetAverageTrueAttackDamage(creep as CDOTA_BaseNPC);
      acc = acc + damage;
      return acc;
    }, 0);
  }

  private getCreepCost(creep: CBaseEntity): number {
    const name = creep.GetName();
    const team = creep.GetTeam();
    let cost: number = 0;
    if (name.includes("goodguys")) {
      cost = cost + 1;
    }
    if (name.includes("ranged")) {
      cost = cost + 1;
    }
    if (name.includes("flagbearer")) {
      cost = cost + 2;
    }
    return cost;
  }
  private calculateDistance(target: CBaseEntity) {
    const position = this.self?.GetAbsOrigin();
    const target_position = target.GetAbsOrigin();
    return position?.__sub(target_position).Length2D();
  }
}
