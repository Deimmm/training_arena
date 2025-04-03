import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class sniper_ai extends BaseModifier {
  private optimal_attack_range: number = 500;
  private self?: CDOTA_BaseNPC;

  OnCreated(params: any) {
    if (IsServer()) {
      const ai = this.GetParent();
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
    // print("NEXT MVPS: ", nextMVPS.length);
    const treshold = this.calculateTimeToMVP(nextMVPS[0]) + attackInterval;
    // print("TRESHOLD: ", treshold);
    // print("0, TIME TO MVP: ", this.calculateTimeToMVP(nextMVPS[0])); // infinity because no creeps are hittinh him
    const mvps = nextMVPS.filter(
      (creep) => this.calculateTimeToMVP(creep) < treshold,
    );

    let movePostion: Vector | null = null;
    let AVector: Vector;
    let BVector: Vector | null = null;
    const optimalMax = this.optimal_attack_range + 50;
    const optimalMin = this.optimal_attack_range - 50;
    print("MVPS: ", mvps.length);

    switch (true) {
      case mvps.length >= 1:
        AVector = ai.GetAbsOrigin();
        BVector = mvps[0].GetAbsOrigin();
        const distance_between = this.calculateDistance(mvps[0]);
        if (distance_between && distance_between > optimalMax) {
          const length = distance_between - optimalMax;
          movePostion = this.setVectorLenght(
            (BVector - AVector) as Vector,
            length,
          );
        }
        if (distance_between && distance_between < optimalMin) {
          movePostion = this.setVectorLenght(
            (AVector - BVector) as Vector,
            this.optimal_attack_range,
          );
        }

        break;
      // case mvps.length === 2:
      //   break;
      // case mvps.length > 2:
      //   break;
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
            0.5,
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

  private getAttackingCreeps(creep: CBaseEntity): CDOTA_BaseNPC[] {
    return FindUnitsInRadius(
      creep.GetTeam(),
      creep.GetAbsOrigin(),
      undefined,
      500,
      UnitTargetTeam.ENEMY,
      UnitTargetType.CREEP,
      UnitTargetFlags.NONE,
      FindOrder.ANY,
      false,
    ).filter(
      (enemy) =>
        enemy.GetAttackTarget()?.GetEntityIndex() === creep.GetEntityIndex(),
    );
  }

  private creepIncomingDPS(creep: CBaseEntity) {
    const enemies = this.getAttackingCreeps(creep);
    return enemies.reduce((acc: number, enemy) => {
      const damage = enemy.GetAverageTrueAttackDamage(creep as CDOTA_BaseNPC);
      acc = acc + damage;
      return acc;
    }, 0);
  }

  private getCreepCost(creep: CBaseEntity): number {
    const name = creep.GetName();
    const team = creep.GetTeam();
    print(name, team);
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
