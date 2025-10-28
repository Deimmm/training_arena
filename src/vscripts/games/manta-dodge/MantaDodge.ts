import { eventBus } from "core/event-bus/event-bus";
import { GameBase } from "games/Game";

import { manta_modifier } from "modifiers/manta";
import { soft_wall } from "modifiers/soft-wall";
import { Geometry } from "utils/Box";
import { HeroInventory } from "utils/HeroInventory";
import { Utils } from "utils/Utils";

interface LaunchOptions {
  spells: any;
}

interface CastAbility {
  hero: string;
  ability_name: string;
  useBlink: boolean;
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
    // npc_dota_hero_rattletrap
    const spells: CastAbility[] = [
      //todo
      // {
      //   hero: "npc_dota_hero_phoenix",
      //   ability_name: "phoenix_supernova",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_drow_ranger",
      //   ability_name: "drow_ranger_silence",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_zuus",
      //   ability_name: "zuus_thundergods_wrath",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_witch_doctor",
      //   ability_name: "witch_doctor_maledict",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_witch_doctor",
      //   ability_name: "witch_doctor_paralyzing_cask",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_warlock",
      //   ability_name: "warlock_rain_of_chaos",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_techies",
      //   ability_name: "techies_suicide",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_sven",
      //   ability_name: "sven_storm_bolt",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_slardar",
      //   ability_name: "slardar_slithereen_crush",
      //   useBlink: true,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_ringmaster",
      //   ability_name: "ringmaster_tame_the_beasts",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_rattletrap",
      //   ability_name: "rattletrap_hookshot",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_primal_beast",
      //   ability_name: "primal_beast_rock_throw",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_obsidian_destroyer",
      //   ability_name: "obsidian_destroyer_sanity_eclipse",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_nevermore",
      //   ability_name: "nevermore_shadowraze3",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_nevermore",
      //   ability_name: "nevermore_requiem",
      //   useBlink: true,
      // },
      // {
      //   hero: "npc_dota_hero_monkey_king",
      //   ability_name: "monkey_king_boundless_strike",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_lion",
      //   ability_name: "lion_impale",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_lich",
      //   ability_name: "lich_chain_frost",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_leshrac",
      //   ability_name: "leshrac_split_earth",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_huskar",
      //   ability_name: "huskar_life_break",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_dragon_knight",
      //   ability_name: "dragon_knight_dragon_tail",
      //   useBlink: false,
      // },
      //todo
      // {
      //   hero: "npc_dota_hero_disruptor",
      //   ability_name: "disruptor_glimpse",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_chaos_knight",
      //   ability_name: "chaos_knight_chaos_bolt",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_centaur",
      //   ability_name: "centaur_hoof_stomp",
      //   useBlink: true,
      // },
      // {
      //   hero: "npc_dota_hero_lina",
      //   ability_name: "lina_light_strike_array",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_lina",
      //   ability_name: "lina_laguna_blade",
      //   useBlink: false,
      // },
      // {
      //   hero: "npc_dota_hero_magnataur",
      //   ability_name: "magnataur_reverse_polarity",
      //   useBlink: true,
      // },
      // {
      //   hero: "npc_dota_hero_axe",
      //   ability_name: "axe_berserkers_call",
      //   useBlink: true,
      // },
      // {
      //   hero: "npc_dota_hero_alchemist",
      //   ability_name: "alchemist_unstable_concoction",
      //   useBlink: false,
      // },
    ];
    this.controller.GetAssignedHero().SetDayTimeVisionRange(500);
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
      if (this.isRunning) {
        this.trigerrSpellCast(spells);
      }
    });
    ListenToGameEvent(
      "dota_non_player_used_ability",
      (event) => {
        const ent = EntIndexToHScript(event.caster_entindex) as CDOTA_BaseNPC;
        const ability_blacklist = [
          "alchemist_unstable_concoction",
          "item_blink",
        ];
        if (ability_blacklist.includes(event.abilityname)) {
          return;
        }
        if (ent) {
          Timers.CreateTimer(1, () => ent.Destroy());
          Timers.CreateTimer(1.5, () =>
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
    hero.SetBaseMoveSpeed(500);
    hero.AddItemByName("item_aghanims_shard");
    const spawn_name = "main_training_spawn";

    Utils.moveEntityToEntity(hero, spawn_name, Vector(0, 500));

    const ability = hero.FindAbilityByName(config.ability_name);
    ability.SetLevel(1);
    Timers.CreateTimer(1, () => {
      const hero_pos = this.controller.GetAssignedHero().GetAbsOrigin();

      const cast_range = ability.GetEffectiveCastRange(
        hero.GetAbsOrigin(),
        this.controller.GetAssignedHero(),
      );
      // DeepPrintTable(GetAbilityKeyValuesByName(config.ability_name));
      const isNoTarget =
        ((ability.GetBehavior() as number) & AbilityBehavior.NO_TARGET) !== 0;

      const isPoint =
        ((ability.GetBehavior() as number) & AbilityBehavior.POINT) !== 0;

      const isTarget =
        ((ability.GetBehavior() as number) & AbilityBehavior.UNIT_TARGET) !== 0;
      if (config.useBlink) {
        const blink = hero.AddItemByName("item_blink");
        const blink_position = this.pickRandomPositionInRadius(
          this.controller.GetAssignedHero().GetAbsOrigin(),
          150,
        );
        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_POSITION,
          UnitIndex: hero.GetEntityIndex(),
          AbilityIndex: blink.GetEntityIndex(),
          Position: blink_position,
        });
      }

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
          Timers.CreateTimer(randomThrowTime, () => {
            const throw_abilitiy = hero.FindAbilityByName(
              "alchemist_unstable_concoction_throw",
            );
            ExecuteOrderFromTable({
              OrderType: UnitOrder.CAST_TARGET,
              UnitIndex: hero.GetEntityIndex(),
              TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
              AbilityIndex: throw_abilitiy.GetEntityIndex(),
              Queue: true,
            });
          });
          break;
        case isNoTarget:
          ExecuteOrderFromTable({
            OrderType: UnitOrder.CAST_NO_TARGET,
            UnitIndex: hero.GetEntityIndex(),
            AbilityIndex: ability.GetEntityIndex(),
            Queue: true,
          });
          break;
        case isPoint:
          ExecuteOrderFromTable({
            OrderType: UnitOrder.CAST_POSITION,
            UnitIndex: hero.GetEntityIndex(),
            AbilityIndex: ability.GetEntityIndex(),
            Position: this.controller.GetAssignedHero().GetAbsOrigin(),
            Queue: true,
          });
          break;
        case isTarget:
          let tryCount = 0;
          Timers.CreateTimer(() => {
            if (tryCount === 3) {
              return;
            }
            ExecuteOrderFromTable({
              OrderType: UnitOrder.CAST_TARGET,
              UnitIndex: hero.GetEntityIndex(),
              AbilityIndex: ability.GetEntityIndex(),
              TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
              Queue: true,
            });
            tryCount += 1;
            return 0.5;
          });

          break;
        default:
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
    hero.RemoveModifierByName(soft_wall.name);
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

  private pickRandomPositionInRadius(origin: Vector, radius: number) {
    const r = radius * math.sqrt(RandomFloat(0, 1));
    const offset = RandomVector(r); // random direction, exact length r
    return Vector(origin.x + offset.x, origin.y + offset.y, 0);
  }
}
