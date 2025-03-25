declare class ButtonConfig {
    snippet?: string;
    onClick?: () => void;
    text?: string;
    isSingle?: boolean;
}
declare class ButtonComponent {
    id: string;
    snippet?: string;
    text?: string;
    onClick?: () => void;
    isSingle?: boolean;
    get idSelector(): string;
    constructor(id: string, config: ButtonConfig);
    load(root: Panel): any;
    render(root: Panel): Panel;
    get(): Panel;
    delete(): void;
    isLoaded(): Panel | false;
    private parseConfig;
}
