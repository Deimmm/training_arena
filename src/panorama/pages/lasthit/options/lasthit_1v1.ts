interface LaunchOptions {
  isSniper?: boolean;
  terrain?: "plain" | "river";
}

class ONE_V_ONELasthitPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      snippet: "1V1",
      isSingle: true,
      onReload: () => this.prefillForm(),
    });
    this.load(root);

    this.eventBus();
  }
  private form: LaunchOptions = { terrain: "plain", isSniper: true };

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
    GameEvents.Subscribe<{ playerId: PlayerID; terrain: "plain" | "river" }>(
      "form.1v1.terrain",
      (event) => {
        $.Msg("form.1v1.terrain", event);
        if (event.playerId === Players.GetLocalPlayer()) {
          this.form.terrain = event.terrain;
        }
      },
    );

    GameEvents.Subscribe("game_launch.1v1", (event) => {
      $.Msg("game_launch.1v1", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>("game_launch.1v1", {
        ...this.form,
      });
    });

    GameEvents.Subscribe("game_relaunch.1v1", (event) => {
      $.Msg("game_relaunch.1v1", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_relaunch.1v1",
        { ...this.form },
      );
    });

    GameEvents.Subscribe("game_finish.1v1", (event) => {
      $.Msg(ONE_V_ONELasthitPageComponent.name, "game_finish.1v1", event);
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
      $("#1V1FinishButton").visible = true;
    });

    GameEvents.Subscribe("game_finish.1v1.success", (event) => {
      $.Msg(
        ONE_V_ONELasthitPageComponent.name,
        "game_finish.1v1.success",
        event,
      );
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#1V1FinishButton").visible = true;
    });
  }

  private prefillForm() {
    const form = this.form;
    let sniperSelector: string = form.isSniper
      ? "#SniperEnable"
      : "#SniperDisable";
    let terrainSelector: string =
      form.terrain === "plain" ? "#TerrainPlain" : "#TerrainRiver";

    this.checkRadioBtn(sniperSelector);
    this.checkRadioBtn(terrainSelector);
  }

  checkRadioBtn(selector: string) {
    const btn = $(selector) as RadioButton;
    if (btn) {
      btn.checked = true;
      btn.SetFocus();
    }
  }
}
