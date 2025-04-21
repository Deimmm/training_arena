class PageConfig {
  snippet?: string;
  isSingle?: boolean;
  pageOptions?: { name: string; component: PageConstructor<any> }[];
}

class PageComponent {
  isSingle: boolean = true;
  id: string;
  snippet?: string;
  pageOptions?: { name: string; component: PageConstructor<any> }[];

  activeOption?: any;
  initializedOptions: any[] = [];

  constructor(id: string, config: PageConfig) {
    this.id = id;
    this.parseConfig(config);
    this.initListeners();
  }

  public load(root: Panel) {
    if (this.isSingle && this.isLoaded()) {
      this.delete();
    }

    this.render(root);
    this.loadPageOptions();
    this.openDefaultPageOption();
    $.Msg("PAGE Is LAODED: ");
  }

  get idSelector() {
    return "#" + this.id;
  }

  public render(root: Panel) {
    var panel = $.CreatePanel("Panel", root, this.id);
    var snippet = this.snippet;

    if (snippet) {
      panel.BLoadLayoutSnippet(snippet);
    }

    return panel;
  }

  public isLoaded(): Panel | false {
    var elem = this.get();
    return !!elem ? elem : false;
  }

  public get(): Panel {
    return $(this.idSelector);
  }

  public delete(): void {
    $(this.idSelector).RemoveAndDeleteChildren();
    $(this.idSelector).DeleteAsync(0);
  }
  public openDefaultPageOption() {
    $.Msg(this.pageOptions);
    if (this.pageOptions && this.pageOptions?.length > 0) {
      this.renderPageOption({
        playerId: Players.GetLocalPlayer(),
        page: this.pageOptions[0].name,
      });
    }
  }
  private initListeners() {
    GameEvents.Subscribe("render-page-option", (event) =>
      this.renderPageOption(event as { playerId: number; page: string }),
    );
  }

  private renderPageOption(event: { playerId: number; page: string }) {
    var pageOptions = this.pageOptions;
    $.Msg(pageOptions);
    if (!pageOptions) return;

    const { playerId, page } = event;
    if (Players.GetLocalPlayer() !== playerId) {
      return;
    }

    var _page = this.pageOptions?.find((option) => option.name === page);
    if (!_page) return;
    var root = $("#PageContent");
    let { name, component } = _page;
    name = name + "_PAGE_OPTION";
    const activeOption = this.activeOption;
    const id = activeOption?.id;

    if (id === name) {
      activeOption && activeOption.load(root);
    } else {
      if (activeOption) {
        activeOption.delete();
      }
      var optionInstance = this.initializedOptions.find((e) => e.id === name);
      if (optionInstance) {
        optionInstance.load(root);
        this.activeOption = optionInstance;
      } else {
        optionInstance = new component(name, root);
        this.activeOption = optionInstance;
        this.initializedOptions.push(optionInstance);
      }
    }
  }

  private loadPageOptions() {
    var pageOptions = this.pageOptions;
    if (!pageOptions) return;
    var root = $("#PageOptions");
    pageOptions.forEach((option) => {
      var btn = new ButtonComponent(option.name, {
        snippet: "Option",
        isSingle: true,
        text: option.name,
        onClick: () =>
          GameEvents.SendCustomGameEventToAllClients<any>(
            "render-page-option",
            {
              playerId: Players.GetLocalPlayer(),
              page: option.name,
            },
          ),
      });
      if (btn) {
        btn.load(root);
      }
    });
  }

  private parseConfig(config: PageConfig) {
    const { snippet, pageOptions, isSingle } = config;
    snippet && (this.snippet = snippet);
    pageOptions && (this.pageOptions = pageOptions);
    isSingle && (this.isSingle = isSingle);
  }
}
