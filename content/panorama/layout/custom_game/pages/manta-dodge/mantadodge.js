class MantaDodgePage extends PageComponent {
    constructor(id, root) {
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
            GameEvents.SendCustomGameEventToServer("game_launch.manta_dodge", {});
        });
        GameEvents.Subscribe("game_relaunch.manta_dodge", (event) => {
            $.Msg("game_relaunch.manta_dodge", event);
            GameEvents.SendCustomGameEventToServer("game_relaunch.manta_dodge", {});
        });
        GameEvents.Subscribe("game_finish.manta_dodge", (event) => {
            $.Msg(MantaDodgePage.name, "game_finish.manta_dodge", event);
            GameEvents.SendCustomGameEventToServer("game_finish.manta_dodge", {});
        });
        GameEvents.Subscribe("game_launch.manta_dodge.success", (event) => {
            $.Msg("game_launch.manta_dodge.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            $("#MultitaskFinishButton").visible = true;
        });
        GameEvents.Subscribe("game_finish.manta_dodge.success", (event) => {
            $.Msg(MantaDodgePage.name, "game_finish.manta_dodge.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#MultitaskFinishButton").visible = true;
        });
    }
}
