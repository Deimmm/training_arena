interface CommonAIMLaunchOptions {}
class CommonAIMPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      snippet: "CommonAIM",
      isSingle: true,
    });
    this.load(root);
    this.eventBus();
  }
  private isLaunched: boolean = false;
  private form: CommonAIMLaunchOptions = {};
  private shedules: ScheduleID[] = [];
  eventBus() {
    GameEvents.Subscribe("game_launch.aim_common", (event) => {
      $.Msg("game_launch.aim_common", event);
      $.Msg("IS LAUNCHED? ", this.isLaunched);
      if (this.isLaunched) {
        $("#Timer").visible = true;
        this.shedules.forEach((e) => $.CancelScheduled(e));
        GameEvents.SendCustomGameEventToServer<LaunchOptions>(
          "game_relaunch.aim_common",
          {
            ...this.form,
          },
        );
      } else {
        GameEvents.SendCustomGameEventToServer<LaunchOptions>(
          "game_launch.aim_common",
          {
            ...this.form,
          },
        );
      }
    });

    GameEvents.Subscribe("game_finish.aim_common", (event) => {
      $.Msg("game_finish.aim_common", event);
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
      this.isLaunched = true;
      $("#CommonAimFinishButton").visible = true;
      this.updateResultBoard(0, 0, 0, 0, 0, 120);
      this.countdown();
    });

    GameEvents.Subscribe("game_finish.aim_common.success", (event) => {
      $.Msg("game_finish.aim_common.success", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );
      this.isLaunched = false;
      $("#CommonAimFinishButton").visible = false;
    });
    GameEvents.Subscribe("round_finish.aim_common", (event) => {
      $.Msg("round_finish.aim_common", event);
      GameEvents.SendCustomGameEventToAllClients<{ playerId: PlayerID }>(
        "open-menu",
        { playerId: Players.GetLocalPlayer() },
      );

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
    ($("#Result1") as LabelPanel).text = `Points:  ${points}`;
    ($("#Result2") as LabelPanel).text = `Streak:  ${streak}`;
    ($("#Result3") as LabelPanel).text = `AVG Time:  ${
      avgTime ? avgTime.toFixed(3) : "-"
    }`;
    ($("#Result4") as LabelPanel).text = `Max Streak:  ${maxStreak}`;
    ($("#Result5") as LabelPanel).text = `Wards:  ${killedWards}/${totalWards}`;

    $.Msg(avgTime.toFixed(3));
  }
}
