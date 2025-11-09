import { eventBus } from "core/event-bus/event-bus";
import { GameBase } from "games/Game";
import { empty_debuff_applier } from "modifiers/empty_debuff";

import { manta_modifier } from "modifiers/manta";
import { soft_wall } from "modifiers/soft-wall";
import { Geometry } from "utils/Box";
import { HeroInventory } from "utils/HeroInventory";
import { Utils } from "utils/Utils";

interface LaunchOptions {
  spells: string[];
}

interface CastAbility {
  hero: string;
  ability_name: string;
  useBlink: boolean;
  processor?: (
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config?: CastAbility,
  ) => void;
}
export class MantaDodge extends GameBase {
  private activePid: number;
  private unsubs: (() => void)[] = [];

  private heroBox: Geometry;
  private heroPreviousState: { attack_capability: UnitAttackCapability } = {
    attack_capability: null,
  };

  private readonly spells: CastAbility[] = [
    {
      hero: "npc_dota_neutral_centaur_khan",
      ability_name: "centaur_khan_war_stomp",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.creepCentStun(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_pangolier",
      ability_name: "pangolier_shield_crash",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.pangoShieldCrush(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_windrunner",
      ability_name: "windrunner_powershot",
      useBlink: false,
      processor: (caster, ability) => this.wrPowershot(caster, ability),
    },
    {
      hero: "npc_dota_hero_dark_willow",
      ability_name: "dark_willow_terrorize",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_phoenix",
      ability_name: "phoenix_supernova",
      useBlink: false,
      processor: (caster, ability) => this.phoneixSuperNova(caster, ability),
    },
    {
      hero: "npc_dota_hero_zuus",
      ability_name: "zuus_thundergods_wrath",
      useBlink: false,
      processor: (caster, ability) => this.zeusThundergods(caster, ability),
    },
    {
      hero: "npc_dota_hero_witch_doctor",
      ability_name: "witch_doctor_maledict",
      useBlink: false,
      processor: (caster, ability) => this.witchDoctorMaledict(caster, ability),
    },
    {
      hero: "npc_dota_hero_witch_doctor",
      ability_name: "witch_doctor_paralyzing_cask",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_warlock",
      ability_name: "warlock_rain_of_chaos",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_techies",
      ability_name: "techies_suicide",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_sven",
      ability_name: "sven_storm_bolt",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_slardar",
      ability_name: "slardar_slithereen_crush",
      useBlink: true,
    },
    {
      hero: "npc_dota_hero_ringmaster",
      ability_name: "ringmaster_tame_the_beasts",
      useBlink: false,
      processor: (caster, ability) => this.ringMasterTame(caster, ability),
    },
    {
      hero: "npc_dota_hero_rattletrap",
      ability_name: "rattletrap_hookshot",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_primal_beast",
      ability_name: "primal_beast_rock_throw",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.primalRockThrow(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_obsidian_destroyer",
      ability_name: "obsidian_destroyer_sanity_eclipse",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_nevermore",
      ability_name: "nevermore_shadowraze3",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.nevermoreRaze(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_nevermore",
      ability_name: "nevermore_requiem",
      useBlink: true,
      processor: (caster, ability, config) =>
        this.nevermoreRequiem(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_monkey_king",
      ability_name: "monkey_king_boundless_strike",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_lion",
      ability_name: "lion_impale",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_lich",
      ability_name: "lich_chain_frost",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_leshrac",
      ability_name: "leshrac_split_earth",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.leshracStun(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_huskar",
      ability_name: "huskar_life_break",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_dragon_knight",
      ability_name: "dragon_knight_dragon_tail",
      useBlink: false,
      processor: (caster, ability, config) =>
        this.dragonKnightStun(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_disruptor",
      ability_name: "disruptor_glimpse",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_chaos_knight",
      ability_name: "chaos_knight_chaos_bolt",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_centaur",
      ability_name: "centaur_hoof_stomp",
      useBlink: true,
    },
    {
      hero: "npc_dota_hero_lina",
      ability_name: "lina_light_strike_array",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_lina",
      ability_name: "lina_laguna_blade",
      useBlink: false,
    },
    {
      hero: "npc_dota_hero_magnataur",
      ability_name: "magnataur_reverse_polarity",
      useBlink: true,
    },
    {
      hero: "npc_dota_hero_axe",
      ability_name: "axe_berserkers_call",
      useBlink: true,
      processor: (caster, ability, config) =>
        this.axeCall(caster, ability, config),
    },
    {
      hero: "npc_dota_hero_alchemist",
      ability_name: "alchemist_unstable_concoction",
      useBlink: false,
      processor: (caster, ability) => this.alchConcotions(caster, ability),
    },
  ];
  constructor() {
    super("manta_dodge");
  }

  public launch(options: LaunchOptions) {
    const pid = Math.floor(Math.random() * 10000);
    this.activePid = pid;
    this.moveHero(this.controller);
    this.setupHero();
    const spells = this.spells.filter((elem) =>
      Object.entries(options.spells).find((e) => e[1] === elem.ability_name),
    );
    const heroes = spells.map((e) => e.hero);

    this.preCacheHeroes(heroes);

    const cache = [];

    this.unsubs.push(
      eventBus.on("manta_dodge.cache_finish", (data: { hero: string }) => {
        if (data.hero) {
          cache.push(data.hero);
          if (heroes.every((hero) => cache.includes(hero))) {
            Timers.CreateTimer(1, () => {
              print("MANTA DODGE CACHE FINISH!!!");
              if (this.activePid === pid) {
                this.trigerrSpellCast(spells, pid);
              }
            });
          }
        }
      }),
    );

    this.unsubs.push(
      eventBus.on("manta_dodge.cast_spell_finish", () => {
        if (this.activePid === pid) {
          this.trigerrSpellCast(spells, pid);
        }
      }),
    );

    this.game_event_listeners.push(
      ListenToGameEvent(
        "dota_ability_channel_finished",
        (event) => {
          const ent = EntIndexToHScript(event.caster_entindex) as CDOTA_BaseNPC;
          if (ent) {
            Timers.CreateTimer(1, () => ent.Destroy());
            Timers.CreateTimer(
              1.5,
              () =>
                this.activePid === pid &&
                eventBus.emit("manta_dodge.cast_spell_finish", null),
            );
          }
        },
        this.context,
      ),
    );
    this.game_event_listeners.push(
      ListenToGameEvent(
        "dota_non_player_used_ability",
        (event) => {
          const ent = EntIndexToHScript(event.caster_entindex) as CDOTA_BaseNPC;
          const ability_blacklist = [
            "alchemist_unstable_concoction",
            "item_blink",
            "phoenix_supernova",
            "ringmaster_tame_the_beasts",
            "dragon_knight_elder_dragon_form",
            "windrunner_powershot",
          ];
          if (ability_blacklist.includes(event.abilityname)) {
            return;
          }
          if (ent) {
            Timers.CreateTimer(1, () => ent.Destroy());
            Timers.CreateTimer(
              1.5,
              () =>
                this.activePid === pid &&
                eventBus.emit("manta_dodge.cast_spell_finish", null),
            );
          }
        },
        this.context,
      ),
    );

    this.game_event_listeners.push(
      ListenToGameEvent(
        "npc_spawned",
        (event) => {
          const entity = EntIndexToHScript(event.entindex);
          const entityName = entity.GetName();
          const destory_entities = ["npc_dota_warlock_golem"];
          if (destory_entities.includes(entityName)) {
            entity.Destroy();
          }
        },
        this.context,
      ),
    );
  }

  public finish() {
    this.activePid = null;
    const listeners = this.listeners;
    if (listeners && listeners.length > 0) {
      listeners.forEach((listener) =>
        CustomGameEventManager.UnregisterListener(listener),
      );
    }
    const game_events = this.game_event_listeners;
    if (game_events && game_events.length > 0) {
      game_events.forEach((listener) => StopListeningToGameEvent(listener));
    }

    StopListeningToAllGameEvents(this.context);

    this.unsubs.map((e) => e());
    const spawn_name = "main_training_spawn";
    const entities = Entities.FindAllInSphere(
      Entities.FindByName(null, spawn_name).GetAbsOrigin(),
      1000,
    );

    entities.forEach((e) => {
      if (
        this.controller &&
        e.GetEntityIndex() !==
          this.controller.GetAssignedHero().GetEntityIndex() &&
        e.IsBaseNPC() &&
        e.IsAlive() &&
        e.IsHero()
      ) {
        e.Destroy();
      }
    });
    this.heroBox && this.heroBox.destroyBox();
    this.resetHero();
    this.returnHero();
    this.listenEvents();
  }

  public relaunch(options: LaunchOptions) {
    this.finish();
    this.launch(options);
  }

  public preCacheHeroes(heroes: string[]) {
    heroes.forEach((hero) => {
      PrecacheUnitByNameAsync(hero, () => {
        eventBus.emit("manta_dodge.cache_finish", { hero });
        GameRules.SendCustomMessage(`<i> Loading ${hero} </i>`, 0, 1);
      });
    });
  }

  /**
   * <<--- SPELLS --->>
   */

  private trigerrSpellCast(spells: CastAbility[], pid: number) {
    if (this.activePid !== pid) {
      return;
    }
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
    hero.AddNewModifier(undefined, undefined, empty_debuff_applier.name, {});
    const spawn_name = "main_training_spawn";
    Utils.moveEntityToEntity(hero, spawn_name, Vector(0, 500));
    const ability = hero.FindAbilityByName(config.ability_name);
    ability.SetLevel(1);
    if (config.processor) {
      config.processor(hero as CDOTA_BaseNPC_Hero, ability, config);
      return;
    }
    Timers.CreateTimer(1, () => {
      const hero_pos = this.controller.GetAssignedHero().GetAbsOrigin();

      const isNoTarget =
        ((ability.GetBehavior() as number) & AbilityBehavior.NO_TARGET) !== 0;

      const isPoint =
        ((ability.GetBehavior() as number) & AbilityBehavior.POINT) !== 0;

      const isTarget =
        ((ability.GetBehavior() as number) & AbilityBehavior.UNIT_TARGET) !== 0;

      if (config.useBlink) {
        const blink = hero.AddItemByName("item_blink");
        const blink_position = this.pickRandomPositionInRadius(hero_pos, 150);

        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_POSITION,
          UnitIndex: hero.GetEntityIndex(),
          AbilityIndex: blink.GetEntityIndex(),
          Position: blink_position,
        });
      }

      switch (true) {
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
            Position: hero_pos,
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
    if (this.controller) {
      const hero = this.controller.GetAssignedHero();
      hero.SetMoveCapability(1);
      hero.SetAttackCapability(this.heroPreviousState.attack_capability);
      hero.RemoveModifierByName(manta_modifier.name);
      hero.RemoveModifierByName(soft_wall.name);
      HeroInventory.reset(hero);
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

  private pickRandomPositionInRadius(origin: Vector, radius: number) {
    const r = radius * math.sqrt(RandomFloat(0, 1));
    const offset = RandomVector(r); // random direction, exact length r
    return Vector(origin.x + offset.x, origin.y + offset.y, 0);
  }

  /**
   * Processors
   */

  creepCentStun(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    Timers.CreateTimer(0.5, () => {
      print(caster.GetName());
      // ExecuteOrderFromTable({
      //   OrderType: UnitOrder.MOVE_TO_POSITION,
      //   UnitIndex: caster.GetEntityIndex(),
      //   TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
      //   Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      //   Queue: true,
      // });
      print(caster.GetEntityIndex());
      caster.CastAbilityOnPosition(
        this.controller.GetAssignedHero().GetAbsOrigin(),
        ability,
        -1,
      );
      caster.MoveToPosition(this.controller.GetAssignedHero().GetAbsOrigin());
      // ExecuteOrderFromTable({
      //   OrderType: UnitOrder.MOVE_TO_POSITION,
      //   UnitIndex: caster.GetEntityIndex(),
      //   TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
      //   Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      //   Queue: true,
      // });

      // ExecuteOrderFromTable({
      //   OrderType: UnitOrder.CAST_NO_TARGET,
      //   UnitIndex: caster.GetEntityIndex(),
      //   AbilityIndex: ability.GetEntityIndex(),
      //   Queue: true,
      // });
    });
  }
  ringMasterTame(caster: CDOTA_BaseNPC_Hero, ability: CDOTABaseAbility) {
    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_POSITION,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      Queue: true,
    });
    const cast_time = ability.GetChannelTime();
    const randomTime = Utils.randomInt(0.5, 0.5 + cast_time, 0.15);
    Timers.CreateTimer(randomTime, () => {
      ExecuteOrderFromTable({
        OrderType: UnitOrder.STOP,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      });
    });
  }
  wrPowershot(caster: CDOTA_BaseNPC_Hero, ability: CDOTABaseAbility) {
    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_POSITION,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      Queue: true,
    });
    const cast_time = ability.GetChannelTime();
    const randomTime = Utils.randomInt(0.75, 0.75 + cast_time, 0.15);
    Timers.CreateTimer(randomTime, () => {
      ExecuteOrderFromTable({
        OrderType: UnitOrder.STOP,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      });
    });
  }
  leshracStun(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    ability.SetLevel(4);

    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_POSITION,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Position: this.controller.GetAssignedHero().GetAbsOrigin(),
      Queue: true,
    });
  }

  primalRockThrow(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    caster.AddItemByName("item_aghanims_shard");
    const randomTime = Utils.randomInt(0.5, 1, 0.1);
    Timers.CreateTimer(randomTime, () => {
      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_POSITION,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Position: this.controller.GetAssignedHero().GetAbsOrigin(),
        Queue: true,
      });
    });
  }
  pangoShieldCrush(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    ExecuteOrderFromTable({
      OrderType: UnitOrder.MOVE_TO_TARGET,
      UnitIndex: caster.GetEntityIndex(),
      TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
      Queue: true,
    });
    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_NO_TARGET,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Queue: true,
    });
  }

  nevermoreRaze(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    const randomTime = Utils.randomInt(0.25, 0.5, 0.25);
    caster.FaceTowards(this.controller.GetAssignedHero().GetAbsOrigin());
    Timers.CreateTimer(randomTime, () => {
      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_NO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Queue: true,
      });
    });
  }

  nevermoreRequiem(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    // DeepPrintTable(caster.FindAllModifiers()[0].GetName());
    print(caster.FindAllModifiers()[0].GetName());
    caster.SetModifierStackCount("modifier_nevermore_necromastery", caster, 20);
    const randomTime = Utils.randomInt(0.5, 1, 0.25);

    Timers.CreateTimer(randomTime, () => {
      if (config.useBlink) {
        const blink = caster.AddItemByName("item_blink");
        const blink_position = this.pickRandomPositionInRadius(
          this.controller.GetAssignedHero().GetAbsOrigin(),
          0,
        );
        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_POSITION,
          UnitIndex: caster.GetEntityIndex(),
          AbilityIndex: blink.GetEntityIndex(),
          Position: blink_position,
        });
      }

      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_NO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Queue: true,
      });
    });
  }

  dragonKnightStun(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    const randomTime = Utils.randomInt(0.5, 1.25, 0.25);
    Timers.CreateTimer(randomTime, () => {
      const ult = caster.FindAbilityByName("dragon_knight_elder_dragon_form");
      ult.SetLevel(1);
      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_NO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ult.GetEntityIndex(),
      });
      let tryCount = 0;
      Timers.CreateTimer(() => {
        if (tryCount === 3) {
          return;
        }
        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_TARGET,
          UnitIndex: caster.GetEntityIndex(),
          AbilityIndex: ability.GetEntityIndex(),
          TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
          Queue: true,
        });
        tryCount += 1;
        return 0.5;
      });
    });
  }

  axeCall(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config: CastAbility,
  ) {
    const randomTime = Utils.randomInt(0.5, 1.5, 0.25);

    Timers.CreateTimer(randomTime, () => {
      if (config.useBlink) {
        const blink = caster.AddItemByName("item_blink");
        const blink_position = this.pickRandomPositionInRadius(
          this.controller.GetAssignedHero().GetAbsOrigin(),
          150,
        );
        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_POSITION,
          UnitIndex: caster.GetEntityIndex(),
          AbilityIndex: blink.GetEntityIndex(),
          Position: blink_position,
        });
      }

      ExecuteOrderFromTable({
        OrderType: UnitOrder.MOVE_TO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
        Position: this.controller.GetAssignedHero().GetAbsOrigin(),
        Queue: true,
      });

      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_NO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Queue: true,
      });
    });
  }

  alchConcotions(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config?: CastAbility,
  ) {
    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_NO_TARGET,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Queue: true,
    });
    const randomThrowTime = (Math.floor(Math.random() * 9) + 2) * 0.5;
    Timers.CreateTimer(randomThrowTime, () => {
      let tryCount = 0;
      const throw_abilitiy = caster.FindAbilityByName(
        "alchemist_unstable_concoction_throw",
      );
      Timers.CreateTimer(() => {
        if (tryCount === 3) {
          return;
        }
        ExecuteOrderFromTable({
          OrderType: UnitOrder.CAST_TARGET,
          UnitIndex: caster.GetEntityIndex(),
          TargetIndex: this.controller.GetAssignedHero().GetEntityIndex(),
          AbilityIndex: throw_abilitiy.GetEntityIndex(),
          Queue: true,
        });
        tryCount += 1;
        return 0.5;
      });
    });
  }
  zeusThundergods(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config?: CastAbility,
  ) {
    const randomTime = Utils.randomInt(0.75, 1.5, 0.25);
    Timers.CreateTimer(randomTime, () => {
      ExecuteOrderFromTable({
        OrderType: UnitOrder.CAST_NO_TARGET,
        UnitIndex: caster.GetEntityIndex(),
        AbilityIndex: ability.GetEntityIndex(),
        Queue: true,
      });
    });
  }

  witchDoctorMaledict(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config?: CastAbility,
  ) {
    //TODO
  }

  phoneixSuperNova(
    caster: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    config?: CastAbility,
  ) {
    // Listen to spawn egg
    // When egg is dead -> fire event
    // Whitelist stun from supernova as event

    // const eventId = ListenToGameEvent(
    //   "npc_spawned",
    //   (event) => {
    //     DeepPrintTable(event);
    //     const entity = EntIndexToHScript(event.entindex);
    //     const entityName = entity.GetName();
    //     print(entityName);
    //     print(entity.GetModelName());
    //   },
    //   this.context,
    // );

    ExecuteOrderFromTable({
      OrderType: UnitOrder.CAST_NO_TARGET,
      UnitIndex: caster.GetEntityIndex(),
      AbilityIndex: ability.GetEntityIndex(),
      Queue: true,
    });
  }
}
