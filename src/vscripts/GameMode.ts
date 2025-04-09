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

    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context);
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
        print("game_rules_state_change: ", event);
        const state = GameRules.State_Get();
        print("GAME STATE CHANGE TO: ", state);
        if (state === GameState.GAME_IN_PROGRESS) {
        }
      },
      undefined,
    );

    new Lasthit1V1().listenEvents();
  }

  private gameRules(): void {
    print("CONFIGURE STARTS");

    GameRules.SetCustomGameSetupTimeout(0);
    GameRules.SetHeroSelectionTime(9999);
    GameRules.SetStrategyTime(9999);
    GameRules.SetShowcaseTime(0);
    GameRules.SetPreGameTime(0);
    GameRules.SetTimeOfDay(0);
    GameRules.GetGameModeEntity().SetFogOfWarDisabled(true);
    print("CONFIGUYRE END");
  }
}
