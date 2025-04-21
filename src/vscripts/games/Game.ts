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

  public listenEvents() {
    const name = this.game_name;
    const id = CustomGameEventManager.RegisterListener(
      `game_launch.${name}`,
      (userId: number, event: any) => {
        const playerController = PlayerResource.GetPlayer(event.PlayerID);
        if (playerController) {
          this.controller = playerController;
          this.launch(event);
          const relaunchId = CustomGameEventManager.RegisterListener(
            `game_relaunch.${name}`,
            (userId: number, event: any) => {
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
              this.finish();
              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                "game_finish.${name}.success",
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
}
