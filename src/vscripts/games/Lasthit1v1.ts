import { Sniper } from "../ai/Sniper";

export class Lasthit1V1 {
  static launch(controller: CDOTAPlayerController) {
    this.createSniper();
    this.moveHero(controller);
    // Init Stats
    // Create Sniper
    // Asign AI to sniper
    // Move Hero
    // Launch Creepwaves
    // On.Finish -> Remove Sniper -> Move Hero back -> Remove Creepwaves -> Save Stats?
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
