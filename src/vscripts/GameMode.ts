import { API } from "core/api/Api";
import { AimCommon } from "./games/AimCommon";
import { Lasthit1V1 } from "./games/Lasthit1v1";
import { reloadable } from "./lib/tstl-utils";

declare global {
  interface CDOTAGameRules {
    Addon: GameMode;
  }
}

@reloadable
export class GameMode {
  public static Precache(this: void, context: CScriptPrecacheContext) {
    PrecacheUnitByNameSync("npc_dota_hero_sniper", context);
    PrecacheResource("soundfile", "soundevents/sounds.vsndevts", context);
    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context);
    PrecacheResource(
      "particle",
      "particles/custom/range_display_line_red.vpcf",
      context,
    );
  }

  public static Activate(this: void) {
    GameRules.Addon = new GameMode();
  }

  constructor() {
    this.eventHandling();
    this.gameRules();
  }
  private eventHandling() {
    ListenToGameEvent(
      "player_chat",
      (event: PlayerChatEvent) => {
        print("received message");
        print(event.text);
      },
      undefined,
    );
    ListenToGameEvent(
      "player_connect_full",
      (event: PlayerConnectFullEvent) => {
        PlayerResource.SetCustomTeamAssignment(
          event.PlayerID,
          DotaTeam.GOODGUYS,
        );
      },
      undefined,
    );
    ListenToGameEvent(
      "game_rules_state_change",
      (event) => {
        const state = GameRules.State_Get();
        if (state === GameState.GAME_IN_PROGRESS) {
          PlayerResource.GetPlayer;
        }
      },
      undefined,
    );
    ListenToGameEvent(
      "npc_spawned",
      (event) => this.onNPCSpawned(event),
      undefined,
    );

    new API().listenEvents();
    new Lasthit1V1().listenEvents();
    new AimCommon().listenEvents();
  }

  onNPCSpawned(event: NpcSpawnedEvent) {
    const npc = EntIndexToHScript(event.entindex) as CDOTA_BaseNPC_Hero;
    if (npc && npc.IsRealHero() && !npc.HasModifier("modifier_global_shop")) {
      npc.SetGold(999999, true);
    }
  }

  private gameRules(): void {
    print("CONFIGURE STARTS");
    GameRules.SetCustomGameSetupTimeout(0);
    GameRules.SetHeroSelectionTime(9999);
    GameRules.SetStrategyTime(9999);
    GameRules.SetShowcaseTime(0);
    GameRules.SetPreGameTime(0);
    GameRules.SetTimeOfDay(0);
    GameRules.SetUseUniversalShopMode(true);
    const gameMode = GameRules.GetGameModeEntity();
    gameMode.SetFogOfWarDisabled(true);
    SpawnDOTAShopTriggerRadiusApproximate(Vector(), 999999);
    print("CONFIGUYRE END");
  }
}
