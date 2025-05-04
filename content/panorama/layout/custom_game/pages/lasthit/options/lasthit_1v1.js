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
            this.updateResultBoard(0, 0, 0, 0);
            $("#1V1FinishButton").visible = true;
        });
        GameEvents.Subscribe("game_finish.1v1.success", (event) => {
            $.Msg(ONE_V_ONELasthitPageComponent.name, "game_finish.1v1.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#1V1FinishButton").visible = true;
        });
        GameEvents.Subscribe("1v1.result_update", (event) => {
            $.Msg("aim_vector.result_update", event);
            GameEvents.SendCustomGameEventToAllClients("result_update", { playerId: Players.GetLocalPlayer() });
            const { pKills, pDenies, sKills, sDenies } = event;
            this.updateResultBoard(pKills, pDenies, sKills, sDenies);
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
        }
    }
    updateResultBoard(pKills, pDenies, sKills, sDenies) {
        $("#ResultBoard").visible = true;
        const res1 = $("#Result1");
        const res2 = $("#Result2");
        const res3 = $("#Result3");
        const res4 = $("#Result4");
        const res5 = $("#Result5");
        const res6 = $("#Result6");
        res1.text = `Player:  ${pKills} / ${pDenies}`;
        res2.text = `Sniper: ${sKills} / ${sDenies}`;
        res3.text = ``;
        res4.text = ``;
        res5.text = ``;
        res6.text = ``;
        res3.visible = false;
        res4.visible = false;
        res5.visible = false;
        res6.visible = false;
    }
}
