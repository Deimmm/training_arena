import { GameBase } from "games/Game";
import { Geometry } from "utils/Box";
import { CentaurMinigame } from "./minigames/centaurs";

export class Multitask extends GameBase {
  public static _game_name: string = "multitask";
  private boxes: Geometry[] = [];
  private heroPreviousState: {
    attack_capability: UnitAttackCapability;
    return_ability_name: string;
  } = {
    attack_capability: null,
    return_ability_name: null,
  };

  constructor() {
    super(Multitask._game_name);
  }

  public finish() {
    this.resetHero();
  }

  public launch(options: any) {
    GameBase.moveHero(this.controller, "main_training_spawn");
    this.setupHero();
    this.setupGameArea({ size: 400 });
    new CentaurMinigame(this.boxes[1], this.controller).start();
  }

  public relaunch(options: any) {
    this.finish();
    this.launch(options);
  }

  private setupGameArea(options: { size: number }) {
    const { size } = options;
    const step_size = size * 2;
    const spawnPoint = Entities.FindByName(
      undefined,
      "main_training_spawn",
    ).GetAbsOrigin();

    const points = [
      { x: 0, y: 0 },
      { x: step_size, y: 0 },
      { x: 0, y: step_size },
      { x: -step_size, y: 0 },
      { x: -step_size, y: 0 },
      { x: 0, y: -step_size },
    ];
    let previousPoint: Vector;

    const boxes: Geometry[] = points.map((elem) => {
      if (!previousPoint) {
        previousPoint = spawnPoint;
      }
      const center = Vector(
        previousPoint.x + elem.x,
        previousPoint.y + elem.y,
        0,
      );
      previousPoint = center;
      const box = new Geometry();
      box.createBox(center, size, 0, true, {});
      return box;
    });
    this.boxes = boxes;
  }

  private setupHero() {
    print("SETTING UP HERO");
    const hero = this.controller.GetAssignedHero();
    hero.SetAttackCapability(0);
    // hero.SetMoveCapability(0);
    const heroAttackCapability = hero.GetAttackCapability();

    this.heroPreviousState = {
      attack_capability: heroAttackCapability,
      return_ability_name: null,
    };
  }

  private resetHero() {
    const { attack_capability, return_ability_name } = this.heroPreviousState;

    const hero = this.controller.GetAssignedHero();
    hero.SetMoveCapability(1);
    hero.SetAttackCapability(attack_capability);
  }
}
