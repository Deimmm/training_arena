import { GameBase } from "games/Game";
import { manta_modifier } from "modifiers/manta";
import { HeroInventory } from "utils/HeroInventory";

interface LaunchOptions {
  spells: any;
}
export class MantaDodge extends GameBase {
  private unsubs: (() => void)[] = [];

  private heroPreviousState: { attack_capability: UnitAttackCapability } = {
    attack_capability: null,
  };

  constructor() {
    super("manta_dodge");
  }

  /**
   *     // Set Hero
    // Assign Manta Item
    // Parse Options
    // Setup skill pool
    // Start Random Spell Casting
    // While Game Run -> Set Hero, Cast Spell
    // 
   */
  public launch(options: LaunchOptions) {
    this.moveHero(this.controller);
    this.setupHero();

    const spells = [
      {
        hero: "npc_dota_hero_magnataur",
        ability_name: "magnataur_reverse_polarity",
      },
    ];

    this.preCacheHeroes(spells.map((e) => e.hero));
    Timers.CreateTimer(3, () => {
      this.castSpell(spells[0]);
    });
  }

  public finish() {
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
        print("PRECACHE FINISH ", hero);
      });
    });
  }

  /**
   * <<--- SPELLS --->>
   */

  public setupSkills() {}
  public castSpell(config) {
    const hero = CreateUnitByName(
      config.hero,
      Vector(),
      false,
      undefined,
      undefined,
      DotaTeam.BADGUYS,
    );
    hero.SetAttackCapability(0);
    hero.SetMoveCapability(1);
    const spawn_name = "main_training_spawn";

    const padawan_spawn = Entities.FindByName(undefined, spawn_name);
    if (!padawan_spawn) {
      return;
    }
    const vector = padawan_spawn.GetAbsOrigin();
    hero.SetAbsOrigin(vector.__add(Vector(100, 0, 0)));
    const ability = hero.FindAbilityByName(config.ability_name);
    ability.SetLevel(1);
    print(ability.GetName());
    DeepPrintTable(this.controller.GetAssignedHero());
    Timers.CreateTimer(1, () => {
      hero.CastAbilityOnPosition(
        this.controller.GetAssignedHero().GetAbsOrigin(),
        ability,
        0,
      );
    });
  }

  /**
   * <<--- HERO --->>
   */
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

  private setupHero() {
    const hero = this.controller.GetAssignedHero();
    HeroInventory.reset(hero);
    this.heroPreviousState = {
      attack_capability: hero.GetAttackCapability(),
    };
    hero.SetMoveCapability(0);
    hero.SetAttackCapability(0);
    hero.AddNewModifier(undefined, undefined, manta_modifier.name, {});
    hero.AddItemByName("item_manta");
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
