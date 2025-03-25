import { Lasthit1V1 } from "./games/Lasthit1v1";

declare global {
  interface CDOTAGameRules {
    Addon: GameMode;
  }
}

// @reloadable
export class GameMode {
  public static Precache(this: void, context: CScriptPrecacheContext) {
    PrecacheUnitByNameSync("npc_dota_hero_sniper", context);
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
    CustomGameEventManager.RegisterListener(
      "game_launch.1v1",
      (userId: number, event: any) => {
        print("game_launch.1v1 EVENT AAA", event);
        const playerController = PlayerResource.GetPlayer(event.playerId);
        if (playerController) {
          Lasthit1V1.launch(playerController);
          CustomGameEventManager.Send_ServerToPlayer<any>(
            playerController,
            "game_launch.1v1.success",
            { data: null },
          );
        }
      },
    );
  }

  private gameRules(): void {
    print("CONFIGURE STARTS");

    GameRules.SetCustomGameSetupTimeout(0);
    GameRules.SetHeroSelectionTime(9999);
    GameRules.SetStrategyTime(9999);
    GameRules.SetShowcaseTime(0);
    GameRules.SetPreGameTime(0);

    print("CONFIGUYRE END");
  }
}
