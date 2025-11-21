class MultitaskPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "MultitaskPage",
      pageOptions: [],
    });
    this.load(root);
    this.eventBus();
  }

  eventBus() {
    GameEvents.Subscribe("game_launch.multitask", (event) => {
      $.Msg("game_launch.multitask", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_launch.multitask",
        {},
      );
    });

    GameEvents.Subscribe("game_relaunch.multitask", (event) => {
      $.Msg("game_relaunch.multitask", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_relaunch.multitask",
        {},
      );
    });

    GameEvents.Subscribe("game_finish.multitask", (event) => {
      $.Msg(MultitaskPageComponent.name, "game_finish.multitask", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_finish.multitask",
        {},
      );
    });

    GameEvents.Subscribe("game_launch.multitask.success", (event) => {
      $.Msg("game_launch.multitask.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "close-menu",
        { playerId: Players.GetLocalPlayer() },
      );

      $("#MultitaskFinishButton").visible = true;
    });

    GameEvents.Subscribe("game_finish.multitask.success", (event) => {
      $.Msg(
        MultitaskPageComponent.name,
        "game_finish.multitask.success",
        event,
      );
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#MultitaskFinishButton").visible = true;
    });
  }
}
