import { Cache } from "core/cache/Cache";
import { Geometry } from "utils/Box";

export class CentaurMinigame {
  private player: CDOTAPlayerController;
  private box: Geometry;
  constructor(box: Geometry, controller: CDOTAPlayerController) {
    this.box = box;
    this.player = controller;
  }

  async start() {
    PrecacheUnitByNameAsync("npc_dota_hero_phantom_assassin", () => {
      const hero = CreateUnitByName(
        "npc_dota_hero_phantom_assassin",
        this.box.boxPoints[0],
        true,
        this.player,
        this.player,
        DotaTeam.GOODGUYS,
      );
      hero.SetControllableByPlayer(this.player.GetPlayerID(), true);
      hero.SetMoveCapability(1);
    });

    // create centaur(hp: 1000) and give controll\
    // start spawning heroes teleporting
    // success teleport removes cent hp by 25
    // If cent dead -> loose
    //
  }

  finish() {
    // remove units
    // remove spawns
    // rem
  }
}
