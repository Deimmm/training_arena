const games = ["aim_common", "1v1", "aim_vector", "multitask", "manta_dodge"];
class GameLauncher {
  launchedGame?: string;
  constructor() {}

  listenEvents() {
    GameEvents.Subscribe<any>(
      "game_launch",
      (event: { game: string; playerId: PlayerID }) => {
        const { playerId, game } = event;
        $.Msg(event);
        if (Players.GetLocalPlayer() !== playerId) {
          return;
        }
        if (!games.includes(game)) {
          return;
        }

        const launchedGame = this.launchedGame;
        if (!launchedGame) {
          ClientEventBus.emit(`game_launch.${game}`, { playerId });
        } else {
          if (launchedGame === game) {
            ClientEventBus.emit(`game_relaunch.${game}`, { playerId });
          } else {
            ClientEventBus.emit(`game_finish.${this.launchedGame}`, {
              playerId,
            });
            this.awaitedFinish(`game_finish.${this.launchedGame}.success`).then(
              (eventId) => {
                GameEvents.Unsubscribe(eventId as GameEventListenerID);
                ClientEventBus.emit(`game_launch.${game}`, { playerId });
              },
            );
          }
        }
        this.launchedGame = game;
      },
    );
  }

  awaitedFinish(event: string) {
    return new Promise((resolve, reject) => {
      const eventId = GameEvents.Subscribe(event, () => {
        $.Schedule(5, () => reject("Timeout"));
        resolve(eventId);
      });
    });
  }
}
