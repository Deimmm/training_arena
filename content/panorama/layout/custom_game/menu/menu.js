var menu;
var ServerEventBus = {
    emit(event, data) {
        $.Msg("EMITING SERVER EVENT: ", event, data);
        GameEvents.SendCustomGameEventToServer(event, data);
    },
};
var ClientEventBus = {
    emit(event, data) {
        var payload = { playerId: Players.GetLocalPlayer() };
        if (data) {
            payload = Object.assign(Object.assign({}, payload), data);
        }
        $.Msg("EMITING CLIENT EVENT: ", event, payload);
        GameEvents.SendCustomGameEventToAllClients(event, payload);
    },
};
class MenuComponent {
    //>
    constructor() {
        this.config = SIDE_NAV_CONFIG;
        this.pages = PAGES;
        this.initializedPages = [];
        this.sideNavButtons = new Array();
        this.logger = new Logger(MenuComponent.name);
        this.deleteAll();
        this.init();
        this.initShowHideBtn();
        this.initSideNav();
        this.initPages();
        this.openDefaultPage();
        this.eventBus();
    }
    init() {
        var menu = $("#MENU_SNIPPET");
        menu.BLoadLayoutSnippet("Menu");
    }
    deleteAll() {
        try {
            const menu = $("#MenuRoot");
            menu.RemoveAndDeleteChildren();
        }
        catch (err) {
            $.Msg("DELETE ERROR", err);
        }
    }
    eventBus() {
        new GameLauncher().listenEvents();
        GameEvents.Subscribe("close-menu", (event) => {
            if (event.playerId === Players.GetLocalPlayer()) {
                this.setShowHideBtnVisibility(false);
            }
        });
        GameEvents.Subscribe("open-menu", (event) => {
            if (event.playerId === Players.GetLocalPlayer()) {
                this.setShowHideBtnVisibility(true);
            }
        });
    }
    emitBtn(id) {
        $.Msg(id);
    }
    initShowHideBtn() {
        var panel = $("#ShowHideBtn");
        panel.BLoadLayoutSnippet("ShowHideButton");
        $("#ShowHideBtn").SetPanelEvent("onactivate", () => this.toogleShowHideBtn());
    }
    setShowHideBtnVisibility(visible) {
        var panel = $("#MenuContainer");
        const text = visible ? "HIDE" : "SHOW";
        $("#ShowHide").text = text;
        panel.visible = visible;
    }
    toogleShowHideBtn() {
        var panel = $("#MenuContainer");
        const visibility = !panel.visible;
        const text = visibility ? "HIDE" : "SHOW";
        $("#ShowHide").text = text;
        panel.visible = visibility;
    }
    initSideNav() {
        var root = $("#SideNav");
        this.sideNavButtons = this.config.map((e) => new e.class(e.name, root));
    }
    initPages() {
        GameEvents.Subscribe("render-page", (event) => this.renderPage(event));
    }
    openDefaultPage() {
        this.renderPage({
            playerId: Players.GetLocalPlayer(),
            page: "LasthitPage",
        });
    }
    renderPage(event) {
        const { playerId, page } = event;
        $.Msg("RENDER: ", event);
        if (Players.GetLocalPlayer() !== playerId) {
            return;
        }
        $.Msg("PAGES: ", this.pages);
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
