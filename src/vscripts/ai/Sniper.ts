import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class sniper_ai extends BaseModifier {
  private optimal_attack_range: number = 500;
  private self?: CDOTA_BaseNPC;

  OnCreated(params: any) {
    if (IsServer()) {
      this.self = this.GetParent();
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
    const healthStep = ai.GetAverageTrueAttackDamage(undefined);

    const creeps = Entities.FindAllByClassname("npc_dota_creep_lane")
      .filter((creep) => creep.IsAlive())
      .sort((a, b) => a.GetHealth() - b.GetHealth());
    const creepsByHP = creeps
      .filter(
        (creep) => creeps[0].GetHealth() + healthStep <= creep.GetHealth(),
      )
      .sort((a, b) => this.getCreepCost(b) - this.getCreepCost(a)); // Add Incoming DPS calculations in mvp predictions. creep1 250hp but 20 dps inc and creep2 300hp but 60dps. creep2 will be mvp

    const mvp = creepsByHP[0];

    const distance_between = this.calculateDistance(mvp);
    if (
      distance_between &&
      (distance_between > this.optimal_attack_range + 50 ||
        distance_between < this.optimal_attack_range - 50)
    ) {
      const moveVector = Vector(); // Calculate Vector to move to stay in optimal attack range
      ExecuteOrderFromTable({
        UnitIndex: ai.GetEntityIndex(),
        OrderType: UnitOrder.MOVE_TO_POSITION,
        Position: moveVector,
      });
    }
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
