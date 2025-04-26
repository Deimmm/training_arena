class ONE_V_ONELasthitPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, {
            snippet: "1V1",
            isSingle: true,
            onReload: () => this.prefillForm(),
        });
        this.form = { terrain: "plain", isSniper: true };
        this.load(root);
        this.eventBus();
    }
    eventBus() {
        GameEvents.Subscribe("form.1v1.isSniper", (event) => {
            $.Msg("form.1v1.isSniper", event);
            if (event.playerId === Players.GetLocalPlayer()) {
                this.form.isSniper = Boolean(event.isSniper);
            }
        });
        GameEvents.Subscribe("form.1v1.terrain", (event) => {
            $.Msg("form.1v1.terrain", event);
            if (event.playerId === Players.GetLocalPlayer()) {
                this.form.terrain = event.terrain;
            }
        });
        GameEvents.Subscribe("game_launch.1v1", (event) => {
            $.Msg("game_launch.1v1", event);
            GameEvents.SendCustomGameEventToServer("game_launch.1v1", Object.assign({}, this.form));
        });
        GameEvents.Subscribe("game_relaunch.1v1", (event) => {
            $.Msg("game_relaunch.1v1", event);
            GameEvents.SendCustomGameEventToServer("game_relaunch.1v1", Object.assign({}, this.form));
        });
        GameEvents.Subscribe("game_finish.1v1", (event) => {
            $.Msg(ONE_V_ONELasthitPageComponent.name, "game_finish.1v1", event);
            GameEvents.SendCustomGameEventToServer("game_finish.1v1", {});
        });
        GameEvents.Subscribe("game_launch.1v1.success", (event) => {
            $.Msg("game_launch.1v1.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            $("#1V1FinishButton").visible = true;
        });
        GameEvents.Subscribe("game_finish.1v1.success", (event) => {
            $.Msg(ONE_V_ONELasthitPageComponent.name, "game_finish.1v1.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#1V1FinishButton").visible = true;
        });
    }
    prefillForm() {
        const form = this.form;
        let sniperSelector = form.isSniper
            ? "#SniperEnable"
            : "#SniperDisable";
        let terrainSelector = form.terrain === "plain" ? "#TerrainPlain" : "#TerrainRiver";
        this.checkRadioBtn(sniperSelector);
        this.checkRadioBtn(terrainSelector);
    }
    checkRadioBtn(selector) {
        const btn = $(selector);
        if (btn) {
            btn.checked = true;
            btn.SetFocus();
        }
    }
}
