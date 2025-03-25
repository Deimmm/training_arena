var menu;
class MenuComponent {
    //>
    constructor() {
        this.config = SIDE_NAV_CONFIG;
        this.pages = PAGES;
        this.initializedPages = [];
        this.sideNavButtons = new Array();
        this.logger = new Logger(MenuComponent.name);
        this.initShowHideBtn();
        this.initSideNav();
        this.initPages();
    }
    initShowHideBtn() {
        var panel = $("#ShowHideBtn");
        panel.BLoadLayoutSnippet("ShowHideButton");
        $("#ShowHideBtn").SetPanelEvent("onactivate", () => {
            var panel = $("#MenuContainer");
            const visibility = !panel.visible;
            const text = visibility ? "HIDE" : "SHOW";
            $("#ShowHide").text = text;
            panel.visible = visibility;
        });
    }
    initSideNav() {
        var root = $("#SideNav");
        this.sideNavButtons = this.config.map((e) => new e.class(e.name, root));
    }
    initPages() {
        GameEvents.Subscribe("render-page", (event) => this.renderPage(event));
    }
    renderPage(event) {
        const { playerId, page } = event;
        if (Players.GetLocalPlayer() !== playerId) {
            return;
        }
        var _page = this.pages.find((p) => p.name === page);
        if (!_page) {
            return;
        }
        var root = $("#PageContainer");
        const { name, component } = _page;
        const activePage = this.activePage;
        const id = activePage === null || activePage === void 0 ? void 0 : activePage.id;
        if (id === name) {
            activePage && activePage.load(root);
        }
        else {
            if (activePage) {
                activePage.delete();
            }
            var pageInstance = this.initializedPages.find((e) => e.id === name);
            if (pageInstance) {
                pageInstance.load(root);
                this.activePage = pageInstance;
            }
            else {
                pageInstance = new component(name, root);
                this.activePage = pageInstance;
                this.initializedPages.push(pageInstance);
            }
        }
    }
}
menu = new MenuComponent();
