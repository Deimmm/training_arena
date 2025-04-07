class ONE_V_ONELasthitPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, { snippet: "1V1", isSingle: true });
        this.isLaunched = false;
        this.form = {};
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
        GameEvents.Subscribe("game_launch.1v1", (event) => {
            $.Msg("game_launch.1v1", event);
            this.isLaunched
                ? GameEvents.SendCustomGameEventToServer("game_relaunch.1v1", Object.assign({}, this.form))
                : GameEvents.SendCustomGameEventToServer("game_launch.1v1", Object.assign({}, this.form));
        });
        GameEvents.Subscribe("game_finish.1v1", (event) => {
            $.Msg("game_finish.1v1", event);
            GameEvents.SendCustomGameEventToServer("game_finish.1v1", {});
        });
        GameEvents.Subscribe("game_launch.1v1.success", (event) => {
            $.Msg("game_launch.1v1.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            this.isLaunched = true;
            $("#1V1FinishButton").visible = true;
        });
        GameEvents.Subscribe("game_finish.1v1.success", (event) => {
            $.Msg("game_finish.1v1.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            this.isLaunched = false;
            $("#1V1FinishButton").visible = true;
        });
    }
}
