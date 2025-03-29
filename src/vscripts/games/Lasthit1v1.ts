import { Sniper } from "../ai/Sniper";
import { CreepSpawn } from "../units/creeps";

export class Lasthit1V1 {
  static launch(controller: CDOTAPlayerController) {
    this.createSniper();
    this.moveHero(controller);
    this.initCreepSpawns();
    // Init Stats
    // Create Sniper
    // Asign AI to sniper
    // Move Hero
    // Launch Creepwaves
    // On.Finish -> Remove Sniper -> Move Hero back -> Remove Creepwaves -> Save Stats?
  }

  private static initCreepSpawns() {
    const padawan_spawn = Entities.FindByName(undefined, "radiant_creep_spawn");
    const sniper_spawn = Entities.FindByName(undefined, "dire_creep_spawn");
    if (!padawan_spawn || !sniper_spawn) {
      print("WARNING: ", "Cant find spawns");
      return;
    }
    print(
      "PADAWAN:",
      padawan_spawn.GetAbsOrigin().x,
      padawan_spawn.GetAbsOrigin().y,
    );
    print(
      "SNIPER:",
      sniper_spawn.GetAbsOrigin().x,
      sniper_spawn.GetAbsOrigin().y,
    );
    CreepSpawn.createSpawn(
      padawan_spawn.GetAbsOrigin(),
      sniper_spawn.GetAbsOrigin(),
      { melee: 3, range: 1, business: 0 },
      30,
      DotaTeam.GOODGUYS,
    );
    CreepSpawn.createSpawn(
      sniper_spawn.GetAbsOrigin(),
      padawan_spawn.GetAbsOrigin(),
      { melee: 3, range: 1, business: 0 },
      30,
      DotaTeam.BADGUYS,
    );
  }
  private static moveHero(controller: CDOTAPlayerController) {
    const hero = controller.GetAssignedHero();
    const padawan_spawn = Entities.FindByName(undefined, "padawan_spawn");
    if (!padawan_spawn) {
      return;
    }
    const vector = padawan_spawn.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(controller.GetPlayerID(), hero);
  }
  private static createSniper() {
    const sniper_spawn = Entities.FindByName(undefined, "sniper_spawn");
    if (!sniper_spawn) {
      return;
    }
    const spawn_vector = sniper_spawn.GetAbsOrigin();
    const sniper_hero = CreateUnitByName(
      "npc_dota_hero_sniper",
      spawn_vector,
      true,
      undefined,
      undefined,
      DotaTeam.BADGUYS,
    );
    const sniper = new Sniper();
  }
}
