declare var menu: MenuComponent;
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
    private initShowHideBtn;
    private initSideNav;
    private initPages;
    private renderPage;
}
