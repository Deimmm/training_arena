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
