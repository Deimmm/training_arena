export class Creep {
  static typeMap = new Map([
    [`melee_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_melee"],
    [`range_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_ranged"],
    [`business_${DotaTeam.BADGUYS}`, "npc_dota_creep_badguys_flagbearer"],
    [`melee_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_melee"],
    [`range_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_ranged"],
    [`business_${DotaTeam.GOODGUYS}`, "npc_dota_creep_goodguys_flagbearer"],
  ]);
  static spawn(
    type: "melee" | "range" | "business",
    position: Vector,
    count: number,
    team: DotaTeam,
  ) {
    const unitName = type + "_" + team;
    if (!unitName) {
      throw new Error("Cannot find Creep");
    }
    for (let i = count; count > 0; i--) {
      CreateUnitByName(
        unitName,
        position,
        true,
        undefined,
        undefined,
        DotaTeam.BADGUYS,
      );
    }
  }
}

export class CreepSpawn {
  static createSpawn(
    position: Vector,
    creeps: {
      melee: number;
      range: number;
      business: number;
    },
    interval: number,
    team: DotaTeam,
  ) {
    Creep.spawn("melee", position, creeps.melee, team);
    Creep.spawn("range", position, creeps.range, team);
    Creep.spawn("business", position, creeps.business, team);

    Timers.CreateTimer(() => {
      Creep.spawn("melee", position, creeps.melee, team);
      Creep.spawn("range", position, creeps.range, team);
      Creep.spawn("business", position, creeps.business, team);
    }, interval);
  }
}
