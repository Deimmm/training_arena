var menu: MenuComponent;
var ServerEventBus = {
  emit(event: string, data: any) {
    $.Msg("EMITING SERVER EVENT: ", event, data);
    GameEvents.SendCustomGameEventToServer<any>(event, data);
  },
};
var ClientEventBus = {
  emit(event: string, data: any) {
    var payload = { playerId: Players.GetLocalPlayer() };
    if (data) {
      payload = { ...payload, ...data };
    }
    $.Msg("EMITING CLIENT EVENT: ", event, payload);
    GameEvents.SendCustomGameEventToAllClients<any>(event, payload);
  },
};
class MenuComponent {
  /**
   * Imports
   */
  private readonly logger: Logger;
  private readonly config = SIDE_NAV_CONFIG;
  private readonly pages = PAGES;
  //>
  constructor() {
    this.logger = new Logger(MenuComponent.name);
    this.initShowHideBtn();
    this.initSideNav();
    this.initPages();
    this.openDefaultPage();
    this.eventBus();
  }

  activePage?: PageComponent;
  initializedPages: PageComponent[] = [];
  sideNavButtons: NavButtons[] = new Array();

  private eventBus() {
    GameEvents.Subscribe<{ playerId: PlayerID }>("close-menu", (event) => {
      if (event.playerId === Players.GetLocalPlayer()) {
        this.setShowHideBtnVisibility(false);
      }
    });
    GameEvents.Subscribe<{ playerId: PlayerID }>("open-menu", (event) => {
      if (event.playerId === Players.GetLocalPlayer()) {
        this.setShowHideBtnVisibility(true);
      }
    });
  }
  public emitBtn(id: string) {
    $.Msg(id);
  }

  private initShowHideBtn() {
    var panel = $("#ShowHideBtn");
    panel.BLoadLayoutSnippet("ShowHideButton");
    $("#ShowHideBtn").SetPanelEvent("onactivate", () =>
      this.toogleShowHideBtn(),
    );
  }
  private setShowHideBtnVisibility(visible: boolean) {
    var panel = $("#MenuContainer");
    const text = visible ? "HIDE" : "SHOW";
    ($("#ShowHide") as LabelPanel).text = text;
    panel.visible = visible;
  }
  private toogleShowHideBtn() {
    var panel = $("#MenuContainer");
    const visibility = !panel.visible;
    const text = visibility ? "HIDE" : "SHOW";
    ($("#ShowHide") as LabelPanel).text = text;
    panel.visible = visibility;
  }
  private initSideNav() {
    var root = $("#SideNav");
    this.sideNavButtons = this.config.map((e) => new e.class(e.name, root));
  }

  private initPages() {
    GameEvents.Subscribe("render-page", (event) =>
      this.renderPage(event as { playerId: number; page: string }),
    );
  }
  private openDefaultPage() {
    this.renderPage({
      playerId: Players.GetLocalPlayer(),
      page: "LasthitPage",
    });
  }

  private renderPage(event: { playerId: number; page: string }) {
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
    const id = activePage?.id;

    if (id === name) {
      activePage && activePage.load(root);
    } else {
      if (activePage) {
        activePage.delete();
      }

      var pageInstance = this.initializedPages.find((e) => e.id === name);
      if (pageInstance) {
        pageInstance.load(root);
        this.activePage = pageInstance;
      } else {
        pageInstance = new component(name, root);
        this.activePage = pageInstance;
        this.initializedPages.push(pageInstance);
      }
    }
  }
}

menu = new MenuComponent();
