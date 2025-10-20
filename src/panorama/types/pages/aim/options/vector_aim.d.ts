interface VectorAIMLaunchOptions {
}
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
declare class VectorAIMPageComponent extends PageComponent {
    private root;
    constructor(id: string, root: Panel);
    private form;
    private shedules;
    eventBus(): void;
    private countdown;
    private updateResultBoard;
    private loadTable;
}
