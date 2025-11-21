export class LaneCreep {
  private self: CDOTA_BaseNPC;

  constructor(config: {
    type: "melee" | "range" | "business";
    position: Vector;
    team: DotaTeam;
    waypoints: Vector[];
  }) {
    const { type, position, team, waypoints } = config;
    this.self = this.spawn(type, position, team);
    if (waypoints && waypoints.length > 0) {
      for (const waypoint of waypoints) {
        this.move(waypoint);
      }
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

    creep.SetDeathXP(0);
    return creep;
  }
}

export class CreepSpawn {
  private isSpawning = false;
  constructor() {}

  async startSpawn(
    position: Vector,
    movePositions: Vector[],
    creeps: {
      melee: number;
      range: number;
      business: number;
    },
    interval: number,
    team: DotaTeam,
  ) {
    const { melee, range, business } = creeps;
    this.isSpawning = true;

    Timers.CreateTimer({
      callback: () => {
        if (this.isSpawning) {
          for (let i = 0; i < melee; i++) {
            new LaneCreep({
              type: "melee",
              position,
              team,
              waypoints: movePositions,
            });
          }
          for (let i = 0; i < range; i++) {
            new LaneCreep({
              type: "range",
              position,
              team,
              waypoints: movePositions,
            });
          }
          for (let i = 0; i < business; i++) {
            new LaneCreep({
              type: "business",
              position,
              team,
              waypoints: movePositions,
            });
          }
          return interval;
        }
      },
    });
  }
  stopSpawn() {
    this.isSpawning = false;
  }
}
