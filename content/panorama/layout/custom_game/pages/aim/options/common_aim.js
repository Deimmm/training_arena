class CommonAIMPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, {
            snippet: "CommonAIM",
            isSingle: true,
            onReload: () => this.loadTable(),
        });
        this.form = {};
        this.shedules = [];
        let x;
        this.load(root);
        this.eventBus();
    }
    eventBus() {
        GameEvents.Subscribe("game_launch.aim_common", (event) => {
            $.Msg("game_launch.aim_common", event);
            GameEvents.SendCustomGameEventToServer("game_launch.aim_common", Object.assign({}, this.form));
        });
        GameEvents.Subscribe("game_relaunch.aim_common", (event) => {
            $.Msg("game_relaunch.aim_common", event);
            $("#Timer").visible = true;
            this.shedules.forEach((e) => $.CancelScheduled(e));
            GameEvents.SendCustomGameEventToServer("game_relaunch.aim_common", Object.assign({}, this.form));
        });
        GameEvents.Subscribe("game_finish.aim_common", (event) => {
            $.Msg(CommonAIMPageComponent.name, "game_finish.aim_common", event);
            GameEvents.SendCustomGameEventToServer("game_finish.aim_common", {});
            $("#ResultBoard").visible = false;
        });
        GameEvents.Subscribe("game_launch.aim_common.success", (event) => {
            $.Msg("game_launch.aim_common.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            $("#CommonAimFinishButton").visible = true;
            this.updateResultBoard(0, 0, 0, 0, 0, 120);
            this.countdown();
        });
        GameEvents.Subscribe("game_finish.aim_common.success", (event) => {
            $.Msg("game_finish.aim_common.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#CommonAimFinishButton").visible = false;
        });
        GameEvents.Subscribe("round_finish.aim_common", (event) => {
            $.Msg("round_finish.aim_common", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            $("#CommonAimFinishButton").visible = true;
        });
        GameEvents.Subscribe("aim_common.result_update", (event) => {
            $.Msg("aim_common.result_update", event);
            GameEvents.SendCustomGameEventToAllClients("result_update", { playerId: Players.GetLocalPlayer() });
            const { result, streak, avgTime, maxStreak, killedWards, totalWards } = event;
            this.updateResultBoard(result, streak, avgTime, maxStreak, killedWards, totalWards);
        });
        const listenerId = GameEvents.Subscribe("aim_common.table.get.response", (event) => {
            $.Msg("aim_common.table.get.response", event);
            let rawData = CustomNetTables.GetTableValue("common-aim", "table");
            if (!rawData) {
                return;
            }
            const table = new TableBuilder("LeaderbordTable", {
                headers: [
                    { name: "№", colClass: "PlaceCol" },
                    { name: "Player", colClass: "PlayerCol" },
                    { name: "Result", colClass: "ResultCol" },
                    { name: "Avg Time", colClass: "AvgTimeCol" },
                    { name: "Max Streak", colClass: "StreakCol" },
                    { name: "Killed Wards", colClass: "KilledWardCol" },
                ],
            });
            let data = Object.entries(rawData).map((elem) => {
                return {
                    steamId: elem[1].steamId,
                    result: elem[1].result,
                    avgTime: elem[1].avgTime.toFixed(3),
                    maxStreal: elem[1].streak,
                    killedWards: elem[1].killedWards + "/120",
                };
            });
            $.Msg(data);
            data.forEach((elem, i) => {
                table.addRow(elem.steamId, [i + 1, ...Object.values(elem)]);
            });
        });
        $.Msg("LISTENER FOR HTTP REQUEST ID: ", listenerId);
    }
    countdown() {
        const timer = $("#Timer");
        timer.visible = true;
        const s1 = $.Schedule(0, () => {
            timer.text = "3";
        });
        const s2 = $.Schedule(1, () => {
            timer.text = "2";
        });
        const s3 = $.Schedule(2, () => {
            timer.text = "1";
        });
        const s4 = $.Schedule(3, () => {
            timer.text = "";
        });
        this.shedules.push(s1, s2, s3, s4);
    }
    updateResultBoard(points, streak, avgTime, maxStreak, killedWards, totalWards) {
        $("#ResultBoard").visible = true;
        $("#Result1").text = `Points:  ${points}`;
        $("#Result2").text = `Streak:  ${streak}`;
        $("#Result3").text = `AVG Time:  ${avgTime ? avgTime.toFixed(3) : "-"}`;
        $("#Result4").text = `Max Streak:  ${maxStreak}`;
        $("#Result5").text = `Wards:  ${killedWards}/${totalWards}`;
        $.Msg(avgTime.toFixed(3));
    }
    loadTable() {
        ServerEventBus.emit("aim_common.table.get", {
            playerId: Players.GetLocalPlayer(),
        });
    }
}
