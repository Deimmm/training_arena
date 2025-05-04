interface LaunchOptions {
    isSniper?: boolean;
    terrain?: "plain" | "river";
}
declare class ONE_V_ONELasthitPageComponent extends PageComponent {
    constructor(id: string, root: Panel);
    private form;
    eventBus(): void;
    private prefillForm;
    checkRadioBtn(selector: string): void;
    private updateResultBoard;
}
