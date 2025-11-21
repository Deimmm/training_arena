interface CommonAIMLaunchOptions {}
declare interface CustomNetTableDeclarations {
  "common-aim": {
    table: Array<{
      steamId: number;
      result: string;
      streal: string;
      avgTime: string;
      killedWards: string;
    }>;
  };
}
class CommonAIMPageComponent extends PageComponent {
  private root: Panel;
  constructor(id: string, root: Panel) {
    super(id, {
      snippet: "CommonAIM",
      isSingle: true,
      onReload: () => this.loadTable(),
    });

    this.root = root;
    this.load(root);
    this.eventBus();
  }

  private form: CommonAIMLaunchOptions = {};
  private shedules: ScheduleID[] = [];

  eventBus() {
    GameEvents.Subscribe("game_launch.aim_common", (event) => {
      $.Msg("game_launch.aim_common", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_launch.aim_common",
        {
          ...this.form,
        },
      );
    });
    GameEvents.Subscribe("game_relaunch.aim_common", (event) => {
      $.Msg("game_relaunch.aim_common", event);
      $("#Timer").visible = true;
      this.shedules.forEach((e) => $.CancelScheduled(e));
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_relaunch.aim_common",
        {
          ...this.form,
        },
      );
    });

    GameEvents.Subscribe("game_finish.aim_common", (event) => {
      $.Msg(CommonAIMPageComponent.name, "game_finish.aim_common", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_finish.aim_common",
        {},
      );
      $("#ResultBoard").visible = false;
    });

    GameEvents.Subscribe("game_launch.aim_common.success", (event) => {
      $.Msg("game_launch.aim_common.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "close-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#CommonAimFinishButton").visible = true;
      this.updateResultBoard(0, 0, 0, 0, 0, 100);
      this.countdown();
    });

    GameEvents.Subscribe("game_finish.aim_common.success", (event) => {
      $.Msg("game_finish.aim_common.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#CommonAimFinishButton").visible = false;
    });
    GameEvents.Subscribe("round_finish.aim_common", (event) => {
      $.Msg("round_finish.aim_common", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      this.load($("#PageContent"));
      $("#CommonAimFinishButton").visible = true;
    });

    GameEvents.Subscribe("aim_common.result_update", (event: any) => {
      $.Msg("aim_common.result_update", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "result_update",
        { playerId: Players.GetLocalPlayer() },
      );
      const { result, streak, avgTime, maxStreak, killedWards, totalWards } =
        event;
      this.updateResultBoard(
        result,
        streak,
        avgTime,
        maxStreak,
        killedWards,
        totalWards,
      );
    });

    GameEvents.Subscribe<any>(
      "aim_common.table.get.response",
      (event: { data: any[] }) => {
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

        let data = Object.entries(rawData).map((elem: any) => {
          return {
            steamId: elem[1].steamId,
            result: elem[1].result,
            avgTime: elem[1].avgTime.toFixed(3),
            maxStreal: elem[1].streak,
            killedWards: elem[1].killedWards + "/100",
          };
        });

        $.Msg(data);
        data.forEach((elem: any, i: number) => {
          table.addRow(elem.steamId, [i + 1, ...Object.values(elem as string)]);
        });
      },
    );
  }

  private countdown() {
    const timer = $("#Timer") as LabelPanel;
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
  private updateResultBoard(
    points: number,
    streak: number,
    avgTime: number,
    maxStreak: number,
    killedWards: number,
    totalWards: number,
  ) {
    $("#ResultBoard").visible = true;
    const res1 = $("#Result1") as LabelPanel;
    const res2 = $("#Result2") as LabelPanel;
    const res3 = $("#Result3") as LabelPanel;
    const res4 = $("#Result4") as LabelPanel;
    const res5 = $("#Result5") as LabelPanel;

    res1.text = `Points:  ${points}`;
    res2.text = `Streak:  ${streak}`;
    res3.text = `AVG Time:  ${avgTime ? avgTime.toFixed(3) : "-"}`;
    res4.text = `Max Streak:  ${maxStreak}`;
    res5.text = `Wards:  ${killedWards}/${totalWards}`;

    res1.visible = true;
    res2.visible = true;
    res3.visible = true;
    res4.visible = true;
    res5.visible = true;

    $.Msg(avgTime.toFixed(3));
  }

  private loadTable() {
    ServerEventBus.emit("aim_common.table.get", {
      playerId: Players.GetLocalPlayer(),
    });
  }
}
