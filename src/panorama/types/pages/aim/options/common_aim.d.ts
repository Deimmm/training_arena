interface CommonAIMLaunchOptions {
}
declare class CommonAIMPageComponent extends PageComponent {
    constructor(id: string, root: Panel);
    private isLaunched;
    private form;
    private shedules;
    eventBus(): void;
    private countdown;
    private updateResultBoard;
}
