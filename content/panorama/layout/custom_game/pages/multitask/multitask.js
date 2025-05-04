class MultitaskPageComponent extends PageComponent {
    constructor(id, root) {
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
            GameEvents.SendCustomGameEventToServer("game_launch.multitask", {});
        });
        GameEvents.Subscribe("game_relaunch.multitask", (event) => {
            $.Msg("game_relaunch.multitask", event);
            GameEvents.SendCustomGameEventToServer("game_relaunch.multitask", {});
        });
        GameEvents.Subscribe("game_finish.multitask", (event) => {
            $.Msg(MultitaskPageComponent.name, "game_finish.multitask", event);
            GameEvents.SendCustomGameEventToServer("game_finish.multitask", {});
        });
        GameEvents.Subscribe("game_launch.multitask.success", (event) => {
            $.Msg("game_launch.multitask.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            $("#MultitaskFinishButton").visible = true;
        });
        GameEvents.Subscribe("game_finish.multitask.success", (event) => {
            $.Msg(MultitaskPageComponent.name, "game_finish.multitask.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#MultitaskFinishButton").visible = true;
        });
    }
}
