declare class PageConfig {
    snippet?: string;
    isSingle?: boolean;
    pageOptions?: {
        name: string;
        component: PageConstructor<any>;
    }[];
}
declare class PageComponent {
    isSingle: boolean;
    id: string;
    snippet?: string;
    pageOptions?: {
        name: string;
        component: PageConstructor<any>;
    }[];
    activeOption?: any;
    initializedOptions: any[];
    constructor(id: string, config: PageConfig);
    load(root: Panel): void;
    get idSelector(): string;
    render(root: Panel): Panel;
    isLoaded(): Panel | false;
    get(): Panel;
    delete(): void;
    openDefaultPageOption(): void;
    private initListeners;
    private renderPageOption;
    private loadPageOptions;
    private parseConfig;
}
