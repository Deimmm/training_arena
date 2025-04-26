declare const games: string[];
declare class GameLauncher {
    launchedGame?: string;
    constructor();
    listenEvents(): void;
    awaitedFinish(event: string): Promise<unknown>;
}
