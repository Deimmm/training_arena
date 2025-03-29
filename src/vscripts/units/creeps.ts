export class LaneCreep {
  private self: CDOTA_BaseNPC;

  constructor(config: {
    type: "melee" | "range" | "business";
    position: Vector;
    team: DotaTeam;
    waypoint: Vector;
  }) {
    const { type, position, team, waypoint } = config;
    this.self = this.spawn(type, position, team);
    if (waypoint) {
      this.move(waypoint);
    }
  }
  typeMap = new Map([
    [`melee_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_melee"],
    [`range_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_ranged"],
    [`business_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_flagbearer"],
    [`melee_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_melee"],
    [`range_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_ranged"],
    [`business_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_flagbearer"],
  ]);

  move(postion: Vector) {
    ExecuteOrderFromTable({
      UnitIndex: this.self.GetEntityIndex(),
      OrderType: UnitOrder.ATTACK_MOVE,
      Position: postion,
      Queue: true,
    });
  }

  spawn(
    type: "melee" | "range" | "business",
    position: Vector,
    team: DotaTeam,
  ) {
    const unitKey = type + "_" + team;
    const unitName = this.typeMap.get(unitKey);
    if (!unitName) {
      throw new Error("Cannot find Creep");
    }
    const creep = CreateUnitByName(
      unitName,
      position,
      true,
      undefined,
      undefined,
      team,
    );
    return creep;
  }
}

export class CreepSpawn {
  constructor() {}
  static createSpawn(
    position: Vector,
    movePosition: Vector,
    creeps: {
      melee: number;
      range: number;
      business: number;
    },
    interval: number,
    team: DotaTeam,
  ) {
    const { melee, range, business } = creeps;
    Timers.CreateTimer({
      callback: () => {
        for (let i = 0; i < melee; i++) {
          new LaneCreep({
            type: "melee",
            position,
            team,
            waypoint: movePosition,
          });
        }
        for (let i = 0; i < range; i++) {
          new LaneCreep({
            type: "range",
            position,
            team,
            waypoint: movePosition,
          });
        }
        for (let i = 0; i < business; i++) {
          new LaneCreep({
            type: "business",
            position,
            team,
            waypoint: movePosition,
          });
        }
        return interval;
      },
    });
  }
}
