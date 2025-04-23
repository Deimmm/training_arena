class CommonAIMPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, {
            snippet: "CommonAIM",
            isSingle: true,
        });
        this.isLaunched = false;
        this.form = {};
        this.shedules = [];
        this.load(root);
        this.eventBus();
    }
    eventBus() {
        GameEvents.Subscribe("game_launch.aim_common", (event) => {
            $.Msg("game_launch.aim_common", event);
            $.Msg("IS LAUNCHED? ", this.isLaunched);
            if (this.isLaunched) {
                $("#Timer").visible = true;
                this.shedules.forEach((e) => $.CancelScheduled(e));
                GameEvents.SendCustomGameEventToServer("game_relaunch.aim_common", Object.assign({}, this.form));
            }
            else {
                GameEvents.SendCustomGameEventToServer("game_launch.aim_common", Object.assign({}, this.form));
            }
        });
        GameEvents.Subscribe("game_finish.aim_common", (event) => {
            $.Msg("game_finish.aim_common", event);
            GameEvents.SendCustomGameEventToServer("game_finish.aim_common", {});
            $("#ResultBoard").visible = false;
        });
        GameEvents.Subscribe("game_launch.aim_common.success", (event) => {
            $.Msg("game_launch.aim_common.success", event);
            GameEvents.SendCustomGameEventToAllClients("close-menu", { playerId: Players.GetLocalPlayer() });
            this.isLaunched = true;
            $("#CommonAimFinishButton").visible = true;
            this.updateResultBoard(0, 0, 0, 0, 0, 120);
            this.countdown();
        });
        GameEvents.Subscribe("game_finish.aim_common.success", (event) => {
            $.Msg("game_finish.aim_common.success", event);
            GameEvents.SendCustomGameEventToAllClients("open-menu", { playerId: Players.GetLocalPlayer() });
            this.isLaunched = false;
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
}
