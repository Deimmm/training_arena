interface LaunchOptions {
  isSniper?: boolean;
}

class ONE_V_ONELasthitPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, { snippet: "1V1", isSingle: true });
    this.load(root);
    this.eventBus();
  }

  private isLaunched: boolean = false;
  private form: LaunchOptions = {};

  eventBus() {
    GameEvents.Subscribe<{ playerId: PlayerID; isSniper: boolean }>(
      "form.1v1.isSniper",
      (event) => {
        $.Msg("form.1v1.isSniper", event);
        if (event.playerId === Players.GetLocalPlayer()) {
          this.form.isSniper = Boolean(event.isSniper);
        }
      },
    );

    GameEvents.Subscribe("game_launch.1v1", (event) => {
      $.Msg("game_launch.1v1", event);
      this.isLaunched
        ? GameEvents.SendCustomGameEventToServer<LaunchOptions>(
            "game_relaunch.1v1",
            { ...this.form },
          )
        : GameEvents.SendCustomGameEventToServer<LaunchOptions>(
            "game_launch.1v1",
            {
              ...this.form,
            },
          );
    });

    GameEvents.Subscribe("game_finish.1v1", (event) => {
      $.Msg("game_finish.1v1", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_finish.1v1",
        {},
      );
    });

    GameEvents.Subscribe("game_launch.1v1.success", (event) => {
      $.Msg("game_launch.1v1.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "close-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      this.isLaunched = true;
      $("#1V1FinishButton").visible = true;
    });

    GameEvents.Subscribe("game_finish.1v1.success", (event) => {
      $.Msg("game_finish.1v1.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      this.isLaunched = false;
      $("#1V1FinishButton").visible = true;
    });
  }
}
