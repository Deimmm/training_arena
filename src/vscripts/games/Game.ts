interface IGameBase {
  controller: CDOTAPlayerController;
  listeners: CustomGameEventListenerID[];
  context: any;
  game_name: string;

  launch: (options: any) => void;
  relaunch: (options: any) => void;
  finish: () => void;
}

export class GameBase implements IGameBase {
  controller: CDOTAPlayerController;
  listeners: CustomGameEventListenerID[] = [];
  context: any = {};
  game_name: string;

  constructor(game_name: string) {
    this.game_name = game_name;
  }

  public listenEvents(cb?: () => void) {
    const name = this.game_name;
    const id = CustomGameEventManager.RegisterListener(
      `game_launch.${name}`,
      (userId: number, event: any) => {
        print(`[SERVER] `, `game_launch.${name}`, event);
        DeepPrintTable(event);
        const playerController = PlayerResource.GetPlayer(event.PlayerID);
        if (playerController) {
          this.controller = playerController;
          this.launch(event);
          const relaunchId = CustomGameEventManager.RegisterListener(
            `game_relaunch.${name}`,
            (userId: number, event: any) => {
              print(`[SERVER] `, `game_relaunch.${name}`);
              DeepPrintTable(event);
              this.relaunch(event);

              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                `game_relaunch.${name}.success`,
                { data: null },
              );

              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                `game_launch.${name}.success`,
                { data: null },
              );
            },
          );

          const finishId = CustomGameEventManager.RegisterListener(
            `game_finish.${name}`,
            (userId: number, event: any) => {
              print(`[SERVER] `, `game_finish.${name}`, event);
              DeepPrintTable(event);
              this.finish();
              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                `game_finish.${name}.success`,
                { data: null },
              );
            },
          );
          this.listeners.concat([relaunchId, finishId]);
          CustomGameEventManager.Send_ServerToPlayer<any>(
            playerController,
            `game_launch.${name}.success`,
            { data: null },
          );
        }
      },
    );
    this.listeners.push(id);
  }
  launch(options: any) {}
  relaunch(options: any) {}
  finish() {}

  public static moveHero(
    controller: CDOTAPlayerController,
    spawn_name: string,
  ) {
    const hero = controller.GetAssignedHero();

    const padawan_spawn = Entities.FindByName(undefined, spawn_name);
    if (!padawan_spawn) {
      return;
    }
    const vector = padawan_spawn.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(controller.GetPlayerID(), hero);
  }
}
