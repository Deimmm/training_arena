class MantaDodgePage extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "MantaDodgePage",
      pageOptions: [],
    });
    this.load(root);
    this.eventBus();
  }

  eventBus() {
    GameEvents.Subscribe("game_launch.manta_dodge", (event) => {
      $.Msg("game_launch.manta_dodge", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_launch.manta_dodge",
        {},
      );
    });

    GameEvents.Subscribe("game_relaunch.manta_dodge", (event) => {
      $.Msg("game_relaunch.manta_dodge", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_relaunch.manta_dodge",
        {},
      );
    });

    GameEvents.Subscribe("game_finish.manta_dodge", (event) => {
      $.Msg(MantaDodgePage.name, "game_finish.manta_dodge", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
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
      $.Msg(MantaDodgePage.name, "game_finish.manta_dodge.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#MultitaskFinishButton").visible = true;
    });
  }
}
