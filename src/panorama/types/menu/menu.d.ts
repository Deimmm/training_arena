declare var menu: MenuComponent;
declare var ServerEventBus: {
    emit(event: string, data: any): void;
};
declare var ClientEventBus: {
    emit(event: string, data: any): void;
};
declare class MenuComponent {
    /**
     * Imports
     */
    private readonly logger;
    private readonly config;
    private readonly pages;
    constructor();
    activePage?: PageComponent;
    initializedPages: PageComponent[];
    sideNavButtons: NavButtons[];
    private init;
    private deleteAll;
    private eventBus;
    emitBtn(id: string): void;
    static startHeroChoise(): void;
    private initShowHideBtn;
    private setShowHideBtnVisibility;
    private toogleShowHideBtn;
    private initSideNav;
    private initPages;
    private openDefaultPage;
    private renderPage;
}
