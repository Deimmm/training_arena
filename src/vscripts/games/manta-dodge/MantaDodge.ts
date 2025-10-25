import { eventBus } from "core/event-bus/event-bus";
import { GameBase } from "games/Game";
import { BaseAbility } from "lib/dota_ts_adapter";
import { manta_modifier } from "modifiers/manta";
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
      "dota_illusions_created",
      (event) => {
        DeepPrintTable(event);
        GetTreeIdForEntityIndex(event.original_entindex);
        Entities.FindByTarget;
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
    return;
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
    const spawn_name = "main_training_spawn";

    Utils.moveEntityToEntity(hero, spawn_name, Vector(200, 200));

    const ability = hero.FindAbilityByName(config.ability_name);
    ability.SetLevel(1);

    Timers.CreateTimer(1, () => {
      hero.CastAbilityOnPosition(
        this.controller.GetAssignedHero().GetAbsOrigin(),
        ability,
        0,
      );

      Timers.CreateTimer(0.5, () => {
        hero.ForceKill(false);
        print("KILLING manta_dodge.cast_spell_finish");
        Timers.CreateTimer(1, () => {
          print("EMITING manta_dodge.cast_spell_finish");
          eventBus.emit("manta_dodge.cast_spell_finish", null);
        });
      });
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
    this.heroBox = new Geometry();
    this.heroBox.createBox(startPosition.GetAbsOrigin(), 375, 100, true, {});

    const hero = this.controller.GetAssignedHero();
    HeroInventory.reset(hero);
    this.heroPreviousState = {
      attack_capability: hero.GetAttackCapability(),
    };
    // hero.SetMoveCapability(0);
    hero.SetAttackCapability(0);
    hero.AddNewModifier(undefined, undefined, manta_modifier.name, {});
    const item = hero.AddItemByName("item_custom_manta");
    const mod = hero.FindModifierByName(item.GetIntrinsicModifierName());
    DeepPrintTable(mod);
    print(item.GetModifierValue());
    print(item.GetIntrinsicModifierName());
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
