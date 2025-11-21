interface CommonAIMLaunchOptions {
}
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
declare class CommonAIMPageComponent extends PageComponent {
    constructor(id: string, root: Panel);
    private form;
    private shedules;
    eventBus(): void;
    private countdown;
    private updateResultBoard;
    private loadTable;
}
