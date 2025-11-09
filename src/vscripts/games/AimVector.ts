import { VectorGroupSpawn } from "units/VectorGroup";
import { API } from "../core/api/Api";
import { eventBus } from "../core/event-bus/event-bus";

import { Geometry } from "../utils/Box";
import { HeroInventory } from "../utils/HeroInventory";
import { GameBase } from "./Game";
import { vector_aim_hero_boost } from "modifiers/vector_aim_hero_boost";

export class AimVector extends GameBase {
  public static _game_name: string = "aim_vector";
  private vectorSpawn: VectorGroupSpawn;

  private outerBox: Geometry;
  private heroBox: Geometry;

  private result: number = 0;
  private streak: number = 0;
  private avgTime: number = 0;
  private maxStreak: number = 0;
  private killedUnits: number = 0;
  private totalUnits: number = 40;
  private killTimes: number[] = [];

  private heroPreviousState: {
    attack_capability: UnitAttackCapability;
    return_ability_name: string;
  } = {
    attack_capability: null,
    return_ability_name: null,
  };

  private isGameRunning: boolean = false;
  private unsubs: (() => void)[] = [];
  constructor() {
    super(AimVector._game_name);
  }
  public relaunch(options: any) {
    this.finish();
    this.launch(options);
  }

  public finish() {
    this.vectorSpawn && this.vectorSpawn.kill();
    this.isGameRunning = false;
    this.result = 0;
    this.streak = 0;
    this.avgTime = 0;
    this.maxStreak = 0;
    this.killedUnits = 0;
    this.killTimes = [];
    const listeners = this.listeners;
    if (listeners && listeners.length > 0) {
      listeners.forEach((listener) =>
        CustomGameEventManager.UnregisterListener(listener),
      );
    }
    StopListeningToAllGameEvents(this.context);
    this.unsubs.map((e) => e());
    this.outerBox && this.outerBox.destroyBox();
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
    this.outerBox = new Geometry();
    this.outerBox.createBox(startVector, 700, 150, true, {
      widthCoef: 1.3,
      heightCoef: 0.9,
    });

    this.heroBox = new Geometry();
    this.heroBox.createBox(startVector, 100, 50, false, {
      widthCoef: 1.3,
      heightCoef: 0.9,
    });

    this.spawnEntities();
  }

  private spawnEntities() {
    if (this.isGameRunning) {
      return;
    }
    this.isGameRunning = true;
    this.spawnVectors();
    EmitSoundOn("drums", this.controller.GetAssignedHero());
    this.listenVectorEvents();
  }

  spawnVectors() {
    this.isGameRunning = true;
    this.vectorSpawn = new VectorGroupSpawn(this.controller);
    this.vectorSpawn.spawn(this.outerBox, this.heroBox, {
      entities_count: this.totalUnits,
    });
  }

  private listenVectorEvents() {
    this.unsubs.push(
      eventBus.on("vector_dummy.killed", (event) => {
        if (event.index) {
          const entity = this.vectorSpawn.entities.find(
            (elem) => elem.index === event.index,
          );
          if (entity) {
            const ttd = 3000 - entity.ttl;
            const streakCoef = this.streak === 0 ? 1 : this.streak;

            const points = 100 * streakCoef;
            this.result = math.floor(this.result + points);

            this.killTimes.push(ttd);
            this.streak = this.streak + 1;
            if (this.streak > this.maxStreak) {
              this.maxStreak = this.streak;
            }
            const killTimeSum = this.killTimes.reduce((acc, elem) => {
              return acc + elem;
            }, 0);
            this.killedUnits = this.killedUnits + 1;
            this.avgTime = Number(killTimeSum / this.killTimes.length / 1000);
            this.emitResultChange();
          }
        }
      }),
    );

    this.unsubs.push(
      eventBus.on("vector_dummy.expire", () => {
        this.dropResult();
        EmitSoundOn("sheep", this.controller.GetAssignedHero());
      }),
    );

    this.unsubs.push(
      eventBus.on("vector_spawn.finish", () => {
        EmitSoundOn("drums", this.controller.GetAssignedHero());

        Timers.CreateTimer(3, () =>
          CustomGameEventManager.Send_ServerToPlayer<any>(
            this.controller,
            "round_finish.aim_vector",
            {},
          ),
        );
        Timers.CreateTimer(1, () =>
          API.updateVectorAim({
            steamId: PlayerResource.GetSteamID(
              this.controller.GetPlayerID(),
            ).__tostring(),

            result: this.result,
            streak: this.maxStreak,
            avgTime: this.avgTime,
            killedUnits: this.killedUnits,
          }),
        );
      }),
    );
  }

  private emitResultChange() {
    CustomGameEventManager.Send_ServerToPlayer<any>(
      this.controller,
      `${AimVector._game_name}.result_update`,
      {
        result: this.result,
        streak: this.streak,
        avgTime: this.avgTime,
        totalUnits: this.totalUnits,
        maxStreak: this.maxStreak,
        killedUnits: this.killedUnits,
      },
    );
  }
  private dropResult() {
    this.streak = 0;
    this.emitResultChange();
  }
  private setupHero() {
    const hero = this.controller.GetAssignedHero();
    let abilityName: string;
    const heroAttackCapability = hero.GetAttackCapability();
    hero.SetMoveCapability(0);
    hero.SetAttackCapability(0);
    hero.AddAbility("muerta_dead_shot").SetLevel(1);
    hero.AddNewModifier(undefined, undefined, vector_aim_hero_boost.name, {});
    const originalAbility = hero.GetAbilityByIndex(0);

    if (originalAbility) {
      const originalAbilityName = originalAbility.GetAbilityName();
      abilityName = originalAbility.GetAbilityName();
      hero.SwapAbilities("muerta_dead_shot", originalAbilityName, true, false);
    }
    this.heroPreviousState = {
      attack_capability: heroAttackCapability,
      return_ability_name: abilityName,
    };
  }

  private resetHero() {
    if (this.controller) {
      const { attack_capability, return_ability_name } = this.heroPreviousState;
      const hero = this.controller.GetAssignedHero();
      hero.SetMoveCapability(1);
      hero.SetAttackCapability(attack_capability);
      hero.SwapAbilities(return_ability_name, "muerta_dead_shot", true, true);
      hero.RemoveAbility("muerta_dead_shot");
      hero.RemoveModifierByName(vector_aim_hero_boost.name);

      HeroInventory.reset(hero);
    }
  }
  private moveHero(controller: CDOTAPlayerController) {
    if (this.controller) {
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
  }

  private returnHero() {
    if (this.controller) {
      const hero = this.controller.GetAssignedHero();
      const game_start = Entities.FindByName(undefined, "start");
      if (!game_start) {
        return;
      }
      const vector = game_start.GetAbsOrigin();
      hero.SetAbsOrigin(vector);
      CenterCameraOnUnit(this.controller.GetPlayerID(), hero);
    }
  }
  private listen() {
    const listener = CustomGameEventManager.RegisterListener(
      `${AimVector._game_name}.table.get.response`,
      () => {},
    );
    this.listeners.push(listener);
  }
}
