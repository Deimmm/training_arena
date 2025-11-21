declare const games: string[];
declare class GameLauncher {
    launchedGame?: string | null;
    constructor();
    listenEvents(): void;
    awaitedFinish(event: string): Promise<unknown>;
}
