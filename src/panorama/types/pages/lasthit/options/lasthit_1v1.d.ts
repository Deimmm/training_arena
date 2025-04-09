interface LaunchOptions {
    isSniper?: boolean;
    terrain?: "plain" | "river";
}
declare class ONE_V_ONELasthitPageComponent extends PageComponent {
    constructor(id: string, root: Panel);
    private isLaunched;
    private form;
    eventBus(): void;
}
