import { API } from "core/api/Api";
import { AimCommon } from "./games/AimCommon";
import { Lasthit1V1 } from "./games/Lasthit1v1";
import { reloadable } from "./lib/tstl-utils";
import { AimVector } from "games/AimVector";
import { Multitask } from "games/multitask/Multitask";
import { MantaDodge } from "games/manta-dodge/MantaDodge";

declare global {
  interface CDOTAGameRules {
    Addon: GameMode;
  }
}
export let cacheContext: CScriptPrecacheContext;
@reloadable
export class GameMode {
  private context = {};
  public static Precache(this: void, context: CScriptPrecacheContext) {
    PrecacheUnitByNameSync("npc_dota_hero_sniper", context);
    PrecacheUnitByNameSync("npc_dummy_sniper", context);
    PrecacheResource("soundfile", "soundevents/sounds.vsndevts", context);
    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context);
    PrecacheResource(
      "particle",
      "particles/units/heroes/hero_muerta/muerta_deadshot.vpcf",
      context,
    );
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
      "player_connect_full",
      (event: PlayerConnectFullEvent) => {
        PlayerResource.SetCustomTeamAssignment(
          event.PlayerID,
          DotaTeam.GOODGUYS,
        );
        this.debug(event.PlayerID);
      },
      undefined,
    );

    ListenToGameEvent(
      "npc_spawned",
      (event) => this.onNPCSpawned(event),
      this.context,
    );

    new API().listenEvents();
    const games = [
      new Lasthit1V1(),
      new AimCommon(),
      new AimVector(),
      new MantaDodge(),
    ];
    games.forEach((game) => game.listenEvents());

    CustomGameEventManager.RegisterListener("heroes.restart", () => {
      print("[SERVER] heroes.restart");
      games.forEach((game) => game.finish());
      GameRules.ResetToHeroSelection();
    });
  }

  onNPCSpawned(event: NpcSpawnedEvent) {
    const npc = EntIndexToHScript(event.entindex) as CDOTA_BaseNPC_Hero;
    if (npc.GetTeam())
      if (
        npc &&
        npc.GetTeam() === DotaTeam.GOODGUYS &&
        npc.IsRealHero() &&
        !npc.HasModifier("modifier_global_shop")
      ) {
        npc.SetGold(999999, true);
      }
  }

  private gameRules(): void {
    GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.BADGUYS, 0);
    GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.GOODGUYS, 1);
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
  }

  private debug(playerId) {
    //   ListenToGameEvent(
    //     "dota_game_state_change",
    //     (event) => {
    //       DeepPrintTable(event);
    //       if (event.new_state === GameState.GAME_IN_PROGRESS) {
    //         const player = PlayerResource.GetPlayer(playerId);
    //         PrecacheUnitByNameAsync("npc_dota_hero_phoenix", (precacheId) => {
    //           Timers.CreateTimer(10, () => {
    //             GameRules.ResetToHeroSelection();
    //           });
    //         });
    //       }
    //     },
    //     this.context,
    //   );
  }
}
