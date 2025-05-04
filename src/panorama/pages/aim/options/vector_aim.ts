interface VectorAIMLaunchOptions {}
declare interface CustomNetTableDeclarations {
  "vector-aim": {
    table: Array<{
      steamId: number;
      result: string;
      streal: string;
      avgTime: string;
      killedUnits: string;
    }>;
  };
}
class VectorAIMPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      snippet: "VectorAIM",
      isSingle: true,
      onReload: () => this.loadTable(),
    });
    this.load(root);
    this.eventBus();
  }

  private form: VectorAIMLaunchOptions = {};
  private shedules: ScheduleID[] = [];

  eventBus() {
    GameEvents.Subscribe("game_launch.aim_vector", (event) => {
      $.Msg("game_launch.aim_vector", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_launch.aim_vector",
        {
          ...this.form,
        },
      );
    });
    GameEvents.Subscribe("game_relaunch.aim_vector", (event) => {
      $.Msg("game_relaunch.aim_vector", event);
      $("#Timer").visible = true;
      this.shedules.forEach((e) => $.CancelScheduled(e));
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_relaunch.aim_vector",
        {
          ...this.form,
        },
      );
    });

    GameEvents.Subscribe("game_finish.aim_vector", (event) => {
      $.Msg(VectorAIMPageComponent.name, "game_finish.aim_vector", event);
      GameEvents.SendCustomGameEventToServer<LaunchOptions>(
        "game_finish.aim_vector",
        {},
      );
      $("#ResultBoard").visible = false;
    });

    GameEvents.Subscribe("game_launch.aim_vector.success", (event) => {
      $.Msg("game_launch.aim_vector.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "close-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#CommonAimFinishButton").visible = true;
      this.updateResultBoard(0, 0, 0, 0, 0, 40);
      this.countdown();
    });

    GameEvents.Subscribe("game_finish.aim_vector.success", (event) => {
      $.Msg("game_finish.aim_vector.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      $("#CommonAimFinishButton").visible = false;
    });
    GameEvents.Subscribe("round_finish.aim_vector", (event) => {
      $.Msg("round_finish.aim_vector", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );

      $("#CommonAimFinishButton").visible = true;
    });

    GameEvents.Subscribe("aim_vector.result_update", (event: any) => {
      $.Msg("aim_vector.result_update", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "result_update",
        { playerId: Players.GetLocalPlayer() },
      );
      const { result, streak, avgTime, maxStreak, killedUnits, totalUnits } =
        event;
      this.updateResultBoard(
        result,
        streak,
        avgTime,
        maxStreak,
        killedUnits,
        totalUnits,
      );
    });

    GameEvents.Subscribe<any>(
      "aim_vector.table.get.response",
      (event: { data: any[] }) => {
        $.Msg("aim_vector.table.get.response", event);

        let rawData = CustomNetTables.GetTableValue("vector-aim", "table");

        const table = new TableBuilder("LeaderbordTable", {
          headers: [
            { name: "№", colClass: "PlaceCol" },
            { name: "Player", colClass: "PlayerCol" },
            { name: "Result", colClass: "ResultCol" },
            { name: "Avg Time", colClass: "AvgTimeCol" },
            { name: "Max Streak", colClass: "StreakCol" },
            { name: "Killed Units", colClass: "KilledWardCol" },
          ],
        });

        if (!rawData) {
          return;
        }
        let data = Object.entries(rawData).map((elem: any) => {
          return {
            steamId: elem[1].steamId,
            result: elem[1].result,
            avgTime: elem[1].avgTime.toFixed(3),
            maxStreal: elem[1].streak,
            killedUnits: elem[1].killedUnits + "/40",
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
    killedUnits: number,
    totalUnits: number,
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
    res5.text = `Snipers:  ${killedUnits}/${totalUnits}`;

    res1.visible = true;
    res2.visible = true;
    res3.visible = true;
    res4.visible = true;
    res5.visible = true;
    $.Msg(avgTime.toFixed(3));
  }

  private loadTable() {
    ServerEventBus.emit("aim_vector.table.get", {
      playerId: Players.GetLocalPlayer(),
    });
  }
}
