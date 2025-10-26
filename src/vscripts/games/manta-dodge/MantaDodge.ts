import { eventBus } from "core/event-bus/event-bus";
import { GameBase } from "games/Game";
import { BaseAbility } from "lib/dota_ts_adapter";
import { manta_modifier } from "modifiers/manta";
import { soft_wall } from "modifiers/soft-wall";
import { InvisibileWall } from "units/Invisible";
import { Geometry } from "utils/Box";
import { HeroInventory } from "utils/HeroInventory";
import { Utils } from "utils/Utils";

interface LaunchOptions {
  spells: any;
}

interface CastAbility {
  hero: string;
  ability_name: string;
}
export class MantaDodge extends GameBase {
  private unsubs: (() => void)[] = [];
  private isRunning: boolean = false;

  private heroBox: Geometry;
  private heroPreviousState: { attack_capability: UnitAttackCapability } = {
    attack_capability: null,
  };

  constructor() {
    super("manta_dodge");
  }

  /**
   * TODO:
   * - Little box for hero to move
   * - Check more spells
   * - Caster Dynamics. Using blink-dager, throwing spells from shadow etc
   */
  public launch(options: LaunchOptions) {
    this.isRunning = true;
    this.moveHero(this.controller);
    this.setupHero();

    const spells: CastAbility[] = [
      {
        hero: "npc_dota_hero_magnataur",
        ability_name: "magnataur_reverse_polarity",
      },
      {
        hero: "npc_dota_hero_axe",
        ability_name: "axe_berserkers_call",
      },
      {
        hero: "npc_dota_hero_alchemist",
        ability_name: "alchemist_unstable_concoction",
      },
    ];
    const heroes = spells.map((e) => e.hero);

    this.preCacheHeroes(heroes);

    const cache = [];

    eventBus.on("manta_dodge.cache_finish", (data: { hero: string }) => {
      if (data.hero) {
        cache.push(data.hero);
        if (heroes.every((hero) => cache.includes(hero))) {
          Timers.CreateTimer(1, () => {
            print("MANTA DODGE CACHE FINISH!!!");
            if (this.isRunning) {
              this.trigerrSpellCast(spells);
            }
          });
        }
      }
    });

    eventBus.on("manta_dodge.cast_spell_finish", () => {
      print("manta_dodge.cast_spell_finish");
      if (this.isRunning) {
        this.trigerrSpellCast(spells);
      }
    });
    ListenToGameEvent(
      "dota_non_player_used_ability",
      (event) => {
        const ent = EntIndexToHScript(event.caster_entindex) as CDOTA_BaseNPC;
        if (event.abilityname === "alchemist_unstable_concoction") {
          return;
        }
        if (ent) {
          Timers.CreateTimer(0.5, () => ent.Destroy());
          Timers.CreateTimer(1, () =>
            eventBus.emit("manta_dodge.cast_spell_finish", null),
          );
        }
      },
      this.context,
    );
  }

  public finish() {
    this.isRunning = false;
    const listeners = this.listeners;
    if (listeners.length > 0) {
      listeners.forEach((listener) =>
        CustomGameEventManager.UnregisterListener(listener),
      );
    }
    StopListeningToAllGameEvents(this.context);

    this.unsubs.map((e) => e());

    this.resetHero();
    this.returnHero();
    this.listenEvents();
  }

  public relaunch() {}

  public preCacheHeroes(heroes: string[]) {
    heroes.forEach((hero) => {
      PrecacheUnitByNameAsync(hero, () => {
        eventBus.emit("manta_dodge.cache_finish", { hero });
        print("PRECACHE FINISH ", hero);
      });
    });
  }

  /**
   * <<--- SPELLS --->>
   */

  private trigerrSpellCast(spells: CastAbility[]) {
    const index = Math.floor(Math.random() * spells.length);
    this.castSpell(spells[index]);
  }
  private castSpell(config: CastAbility) {
    const hero = CreateUnitByName(
      config.hero,
      Vector(),
      false,
      undefined,
      undefined,
      DotaTeam.BADGUYS,
    );
    hero.SetUnitCanRespawn(false);
    hero.SetAttackCapability(0);
    hero.SetMoveCapability(1);
    hero.SetBaseMoveSpeed(400);
    const spawn_name = "main_training_spawn";

    Utils.moveEntityToEntity(hero, spawn_name, Vector(200, 200));

    const ability = hero.FindAbilityByName(config.ability_name);
    ability.SetLevel(1);
    Timers.CreateTimer(1, () => {
      const hero_pos = this.controller.GetAssignedHero().GetAbsOrigin();

      const cast_range = ability.GetEffectiveCastRange(
        hero.GetAbsOrigin(),
        this.controller.GetAssignedHero(),
      );
      const isNoTarget =
        ((ability.GetBehavior() as number) & AbilityBehavior.NO_TARGET) !== 0;

      switch (true) {
        case isNoTarget && cast_range === 0:
          ExecuteOrderFromTable({
            OrderType: UnitOrder.MOVE_TO_TARGET,
            UnitIndex: hero.GetEntityIndex(),
            TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
            Position: hero_pos,
            Queue: true,
          });

          ExecuteOrderFromTable({
            OrderType: UnitOrder.CAST_NO_TARGET,
            UnitIndex: hero.GetEntityIndex(),
            AbilityIndex: ability.GetEntityIndex(),
            Queue: true,
          });
          break;
        case config.ability_name === "alchemist_unstable_concoction":
          ExecuteOrderFromTable({
            OrderType: UnitOrder.CAST_NO_TARGET,
            UnitIndex: hero.GetEntityIndex(),
            AbilityIndex: ability.GetEntityIndex(),
            Queue: true,
          });
          const randomThrowTime = (Math.floor(Math.random() * 9) + 2) * 0.5;
          print("RANDOM TIME: ", randomThrowTime);
          Timers.CreateTimer(randomThrowTime, () => {
            const throw_abilitiy = hero.FindAbilityByName(
              "alchemist_unstable_concoction_throw",
            );
            print(throw_abilitiy.GetName());
            ExecuteOrderFromTable({
              OrderType: UnitOrder.CAST_TARGET,
              UnitIndex: hero.GetEntityIndex(),
              TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
              AbilityIndex: throw_abilitiy.GetEntityIndex(),
              Queue: true,
            });
          });
          break;
        default:
          hero.CastAbilityOnPosition(hero_pos, ability, 0);
          break;
      }
    });
  }

  /**
   * <<--- HERO --->>
   */

  private moveHero(controller: CDOTAPlayerController) {
    const hero = controller.GetAssignedHero();
    const spawn_name = "main_training_spawn";
    Utils.moveEntityToEntity(hero, spawn_name);
    CenterCameraOnUnit(controller.GetPlayerID(), hero);
  }

  private setupHero() {
    const startPosition = Entities.FindByName(undefined, "main_training_spawn");
    const box = (this.heroBox = new Geometry());
    this.heroBox.createBox(startPosition.GetAbsOrigin(), 375, 100, true, {});

    const hero = this.controller.GetAssignedHero();
    HeroInventory.reset(hero);
    this.heroPreviousState = {
      attack_capability: hero.GetAttackCapability(),
    };
    // hero.SetMoveCapability(0);
    hero.SetAttackCapability(0);
    hero.AddNewModifier(undefined, undefined, manta_modifier.name, {});
    hero.AddNewModifier(undefined, undefined, soft_wall.name, {
      minX: box.boxPoints[0].x,
      maxX: box.boxPoints[2].x,
      minY: box.boxPoints[0].y,
      maxY: box.boxPoints[2].y,
    });
    hero.AddItemByName("item_custom_manta");
  }

  private resetHero() {
    const hero = this.controller.GetAssignedHero();
    hero.SetMoveCapability(1);
    hero.SetAttackCapability(this.heroPreviousState.attack_capability);
    hero.RemoveModifierByName(manta_modifier.name);
    HeroInventory.reset(hero);
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
}
