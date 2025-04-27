import { VectorGroupSpawn } from "units/VectorGroup";
import { API } from "../core/api/Api";
import { eventBus } from "../core/event-bus/event-bus";
import { AIMCOMMON_ObserverWardSpawn } from "../units/Оbserver";
import { Box } from "../utils/Box";
import { HeroInventory } from "../utils/HeroInventory";
import { GameBase } from "./Game";

export class AimVector extends GameBase {
  private obsSpawn: AIMCOMMON_ObserverWardSpawn;
  private outerBox: Box;
  private heroBox: Box;

  private result: number = 0;
  private streak: number = 0;
  private avgTime: number = 0;
  private maxStreak: number = 0;
  private killedWards: number = 0;
  private totalWards: number = 10;
  private killTimes: number[] = [];

  private heroPreviousState: { attack_capability: UnitAttackCapability } = {
    attack_capability: null,
  };

  private isGameRunning: boolean = false;
  private unsubs: (() => void)[] = [];
  constructor() {
    super("aim_common");
  }
  public relaunch(options: any) {
    this.finish();
    this.launch(options);
  }

  public finish() {
    this.isGameRunning = false;
    this.obsSpawn.kill();
    this.result = 0;
    this.streak = 0;
    this.avgTime = 0;
    this.maxStreak = 0;
    this.killedWards = 0;
    this.killTimes = [];
    const listeners = this.listeners;
    if (listeners.length > 0) {
      listeners.forEach((listener) =>
        CustomGameEventManager.UnregisterListener(listener),
      );
    }
    StopListeningToAllGameEvents(this.context);
    this.unsubs.map((e) => e());
    this.outerBox.destroyBox();
    this.resetHero();
    this.returnHero();

    this.listenEvents();
  }

  public launch(options: any) {
    this.moveHero(this.controller);
    this.setupHero();
    const startPosition = Entities.FindByName(undefined, "main_training_spawn");
    if (!startPosition) {
      return;
    }
    const startVector = startPosition.GetAbsOrigin();
    this.outerBox = new Box();
    this.outerBox.createBox(startVector, 700, 150, true);

    this.heroBox = new Box();
    this.heroBox.createBox(startVector, 75, 50, false);

    this.spawnEntities();
  }

  private spawnEntities() {
    if (this.isGameRunning) {
      return;
    }
    this.isGameRunning = true;
    // this.obsSpawn = new AIMCOMMON_ObserverWardSpawn();
    // this.obsSpawn.spawn(this.outerBox, this.heroBox, {
    //   wards_count: this.totalWards,
    // });
    new VectorGroupSpawn().spawn(this.outerBox, this.heroBox, {
      entities_count: 10,
    });

    EmitSoundOn("drums", this.controller.GetAssignedHero());

    this.unsubs.push(
      eventBus.on("qblade.hit", (event) => {
        if (event.index) {
          const obs = this.obsSpawn.wards.find(
            (elem) => elem.index === event.index,
          );
          if (obs) {
            const ttd = 1000 - obs.ttl;
            const streakCoef = this.streak === 0 ? 1 : this.streak;

            const points = 100 * (100 / ttd) * streakCoef;
            this.result = math.floor(this.result + points);
            this.killTimes.push(ttd);
            this.streak = this.streak + 1;
            if (this.streak > this.maxStreak) {
              this.maxStreak = this.streak;
            }
            const killTimeSum = this.killTimes.reduce((acc, elem) => {
              return acc + elem;
            }, 0);
            this.killedWards = this.killedWards + 1;
            this.avgTime = Number(killTimeSum / this.killTimes.length / 1000);
            this.emitResultChange();
            GameRules.SendCustomMessage(
              `<b>Time</b>: ${(ttd / 1000).toFixed(3)}`,
              0,
              2,
            );
          }
        }
      }),
    );
    this.unsubs.push(
      eventBus.on("qblade.miss", () => {
        this.dropResult();
      }),
    );
    this.unsubs.push(
      eventBus.on("obs.expire", () => {
        this.dropResult();
        EmitSoundOn("sheep", this.controller.GetAssignedHero());
      }),
    );
    this.unsubs.push(
      eventBus.on("obsspawn.finish", () => {
        EmitSoundOn("drums", this.controller.GetAssignedHero());
        Timers.CreateTimer(3, () =>
          CustomGameEventManager.Send_ServerToPlayer<any>(
            this.controller,
            "round_finish.aim_common",
            {},
          ),
        );
        API.updateCommonAim({
          steamId: PlayerResource.GetSteamID(
            this.controller.GetPlayerID(),
          ).__tostring(),

          result: this.result,
          streak: this.maxStreak,
          avgTime: this.avgTime,
          killedWards: this.killedWards,
        });
      }),
    );
  }

  private emitResultChange() {
    CustomGameEventManager.Send_ServerToPlayer<any>(
      this.controller,
      "aim_common.result_update",
      {
        result: this.result,
        streak: this.streak,
        avgTime: this.avgTime,
        totalWards: this.totalWards,
        maxStreak: this.maxStreak,
        killedWards: this.killedWards,
      },
    );
  }
  private dropResult() {
    this.streak = 0;
    this.emitResultChange();
  }
  private setupHero() {
    const hero = this.controller.GetAssignedHero();
    HeroInventory.reset(hero);
    this.heroPreviousState = {
      attack_capability: hero.GetAttackCapability(),
    };
    hero.SetMoveCapability(0);
    hero.SetAttackCapability(0);
    hero.AddItemByName("item_custom_qblade");
  }

  private resetHero() {
    const hero = this.controller.GetAssignedHero();
    hero.SetMoveCapability(1);
    hero.SetAttackCapability(this.heroPreviousState.attack_capability);
    HeroInventory.reset(hero);
  }
  private moveHero(controller: CDOTAPlayerController) {
    const hero = controller.GetAssignedHero();
    const spawn_name = "main_training_spawn";

    const padawan_spawn = Entities.FindByName(undefined, spawn_name);
    if (!padawan_spawn) {
      return;
    }
    const vector = padawan_spawn.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(controller.GetPlayerID(), hero);
  }

  private returnHero() {
    const hero = this.controller.GetAssignedHero();
    const game_start = Entities.FindByName(undefined, "start");
    if (!game_start) {
      return;
    }
    const vector = game_start.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(this.controller.GetPlayerID(), hero);
  }
  private listen() {
    const listener = CustomGameEventManager.RegisterListener(
      "aim_common.table.get.response",
      () => {},
    );
    this.listeners.push(listener);
  }
}
