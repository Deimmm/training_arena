interface MantaDodgeLaunchOptions {
  spells: string[];
}
interface Spell {
  hero: string;
  ability_name: string;
}
var SPELLS: Spell[] = [
  {
    hero: "npc_dota_hero_pangolier",
    ability_name: "pangolier_shield_crash",
  },
  {
    hero: "npc_dota_hero_windrunner",
    ability_name: "windrunner_powershot",
  },
  {
    hero: "npc_dota_hero_dark_willow",
    ability_name: "dark_willow_terrorize",
  },
  {
    hero: "npc_dota_hero_zuus",
    ability_name: "zuus_thundergods_wrath",
  },
  {
    hero: "npc_dota_hero_witch_doctor",
    ability_name: "witch_doctor_paralyzing_cask",
  },
  {
    hero: "npc_dota_hero_warlock",
    ability_name: "warlock_rain_of_chaos",
  },
  {
    hero: "npc_dota_hero_techies",
    ability_name: "techies_suicide",
  },
  {
    hero: "npc_dota_hero_sven",
    ability_name: "sven_storm_bolt",
  },
  {
    hero: "npc_dota_hero_slardar",
    ability_name: "slardar_slithereen_crush",
  },
  {
    hero: "npc_dota_hero_ringmaster",
    ability_name: "ringmaster_tame_the_beasts",
  },
  {
    hero: "npc_dota_hero_rattletrap",
    ability_name: "rattletrap_hookshot",
  },
  {
    hero: "npc_dota_hero_primal_beast",
    ability_name: "primal_beast_rock_throw",
  },
  {
    hero: "npc_dota_hero_obsidian_destroyer",
    ability_name: "obsidian_destroyer_sanity_eclipse",
  },
  {
    hero: "npc_dota_hero_nevermore",
    ability_name: "nevermore_shadowraze3",
  },
  {
    hero: "npc_dota_hero_monkey_king",
    ability_name: "monkey_king_boundless_strike",
  },
  {
    hero: "npc_dota_hero_lion",
    ability_name: "lion_impale",
  },
  {
    hero: "npc_dota_hero_lich",
    ability_name: "lich_chain_frost",
  },
  {
    hero: "npc_dota_hero_leshrac",
    ability_name: "leshrac_split_earth",
  },
  {
    hero: "npc_dota_hero_huskar",
    ability_name: "huskar_life_break",
  },
  {
    hero: "npc_dota_hero_dragon_knight",
    ability_name: "dragon_knight_dragon_tail",
  },
  {
    hero: "npc_dota_hero_chaos_knight",
    ability_name: "chaos_knight_chaos_bolt",
  },
  {
    hero: "npc_dota_hero_centaur",
    ability_name: "centaur_hoof_stomp",
  },
  {
    hero: "npc_dota_hero_lina",
    ability_name: "lina_light_strike_array",
  },
  {
    hero: "npc_dota_hero_lina",
    ability_name: "lina_laguna_blade",
  },
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

class MantaDodgePageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      snippet: "MantaDodgePage",
      isSingle: true,
      onReload: () => this.loadAbilityGrid(),
    });
    this.load(root);
    this.eventBus();
  }

  private form: Record<string, string> = {};

  loadAbilityGrid() {
    const abilities = SPELLS;
    const root = $("#AbilityGrid");
    if (!root) {
      return;
    }

    abilities.forEach((ability) => {
      const ability_panel = $.CreatePanel(
        "DOTAAbilityImage",
        root,
        ability.ability_name,
        {
          abilityname: ability.ability_name,
          class: "AbilityCardUnselected",
        },
      );

      ability_panel.SetPanelEvent("onactivate", () => {
        const checked = ability_panel.GetAttributeInt("checked", 0);
        ability_panel.SetAttributeInt("checked", checked ? 0 : 1);

        if (checked) {
          ability_panel.RemoveClass("AbilityCardSelected");
          delete this.form[ability.ability_name];
        }
        if (!checked) {
          ability_panel.AddClass("AbilityCardSelected");
          this.form[ability.ability_name] = ability.ability_name;
        }
      });
    });
  }

  eventBus() {
    GameEvents.Subscribe<{ player: PlayerID }>("manta.select_all", (event) => {
      if (event.player !== Players.GetLocalPlayer()) {
        return;
      }
      const grid = $("#AbilityGrid");
      if (!grid) {
        return;
      }
      const childrenCount = grid.GetChildCount();
      $.Msg(childrenCount);
      for (let i = 0; i < childrenCount; i++) {
        const child = grid.GetChild(i);
        if (child) {
          child.AddClass("AbilityCardSelected");
          child.SetAttributeInt("checked", 1);
        }
      }
      this.form = SPELLS.reduce((acc: Record<string, string>, elem) => {
        acc[elem.ability_name] = elem.ability_name;
        return acc;
      }, {});
    });

    GameEvents.Subscribe<{ player: PlayerID }>(
      "manta.unselect_all",
      (event) => {
        if (event.player !== Players.GetLocalPlayer()) {
          return;
        }
        this.form = {};
        const grid = $("#AbilityGrid");
        if (!grid) {
          return;
        }

        const childrenCount = grid.GetChildCount();
        for (let i = 0; i < childrenCount; i++) {
          const child = grid.GetChild(i);
          if (child) {
            child.RemoveClass("AbilityCardSelected");
            child.SetAttributeInt("checked", 0);
          }
        }
      },
    );

    GameEvents.Subscribe("game_launch.manta_dodge", (event) => {
      $.Msg("game_launch.manta_dodge", event);
      let spells = Object.entries(this.form).map((e) => e[1]);
      if (spells.length === 0) {
        spells = SPELLS.map((e) => e.ability_name);
      }
      GameEvents.SendCustomGameEventToServer<MantaDodgeLaunchOptions>(
        "game_launch.manta_dodge",
        {
          spells,
        },
      );
    });

    GameEvents.Subscribe("game_relaunch.manta_dodge", (event) => {
      $.Msg("game_relaunch.manta_dodge", event);
      const spells = Object.entries(this.form).map((e) => e[1]);
      GameEvents.SendCustomGameEventToServer<MantaDodgeLaunchOptions>(
        "game_relaunch.manta_dodge",
        {
          spells,
        },
      );
    });

    GameEvents.Subscribe("game_finish.manta_dodge", (event) => {
      $.Msg(AbilityDodgePage.name, " game_finish.manta_dodge", event);
      GameEvents.SendCustomGameEventToServer<any>(
        "game_finish.manta_dodge",
        {},
      );
    });

    GameEvents.Subscribe("game_launch.manta_dodge.success", (event) => {
      $.Msg("game_launch.manta_dodge.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "close-menu",
        { playerId: Players.GetLocalPlayer() },
      );

      $("#MultitaskFinishButton").visible = true;
    });

    GameEvents.Subscribe("game_finish.manta_dodge.success", (event) => {
      $.Msg(AbilityDodgePage.name, "game_finish.manta_dodge.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#MultitaskFinishButton").visible = false;
    });
  }
}
