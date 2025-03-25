var menu: MenuComponent;

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
  }

  activePage?: PageComponent;
  initializedPages: PageComponent[] = [];
  sideNavButtons: NavButtons[] = new Array();
  private initShowHideBtn() {
    var panel = $("#ShowHideBtn");
    panel.BLoadLayoutSnippet("ShowHideButton");
    $("#ShowHideBtn").SetPanelEvent("onactivate", () => {
      var panel = $("#MenuContainer");
      const visibility = !panel.visible;
      const text = visibility ? "HIDE" : "SHOW";
      ($("#ShowHide") as LabelPanel).text = text;
      panel.visible = visibility;
    });
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
