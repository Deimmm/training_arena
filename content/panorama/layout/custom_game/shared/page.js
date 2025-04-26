class PageConfig {
}
class PageComponent {
    constructor(id, config) {
        this.isSingle = true;
        this.initializedOptions = [];
        this.id = id;
        this.parseConfig(config);
        this.initListeners();
    }
    load(root) {
        if (this.isSingle) {
            this.delete();
        }
        this.render(root);
        this.loadPageOptions();
        this.openDefaultPageOption();
        $.Msg("PAGE Is LAODED: ");
        this.onReload && this.onReload();
    }
    get idSelector() {
        return "#" + this.id;
    }
    render(root) {
        var panel = $.CreatePanel("Panel", root, this.id);
        var snippet = this.snippet;
        if (snippet) {
            panel.BLoadLayoutSnippet(snippet);
        }
        return panel;
    }
    isLoaded() {
        var elem = this.get();
        return !!elem ? elem : false;
    }
    get() {
        return $(this.idSelector);
    }
    delete() {
        try {
            $(this.idSelector).RemoveAndDeleteChildren();
            $(this.idSelector).DeleteAsync(0);
        }
        catch (err) { }
    }
    openDefaultPageOption() {
        var _a;
        $.Msg(this.pageOptions);
        if (this.pageOptions && ((_a = this.pageOptions) === null || _a === void 0 ? void 0 : _a.length) > 0) {
            this.renderPageOption({
                playerId: Players.GetLocalPlayer(),
                page: this.pageOptions[0].name,
            });
        }
    }
    initListeners() {
        GameEvents.Subscribe("render-page-option", (event) => this.renderPageOption(event));
    }
    renderPageOption(event) {
        var _a;
        var pageOptions = this.pageOptions;
        $.Msg(pageOptions);
        if (!pageOptions)
            return;
        const { playerId, page } = event;
        if (Players.GetLocalPlayer() !== playerId) {
            return;
        }
        var _page = (_a = this.pageOptions) === null || _a === void 0 ? void 0 : _a.find((option) => option.name === page);
        if (!_page)
            return;
        var root = $("#PageContent");
        let { name, component } = _page;
        name = name + "_PAGE_OPTION";
        const activeOption = this.activeOption;
        const id = activeOption === null || activeOption === void 0 ? void 0 : activeOption.id;
        if (id === name) {
            activeOption && activeOption.load(root);
        }
        else {
            if (activeOption) {
                activeOption.delete();
            }
            var optionInstance = this.initializedOptions.find((e) => e.id === name);
            if (optionInstance) {
                optionInstance.load(root);
                this.activeOption = optionInstance;
            }
            else {
                optionInstance = new component(name, root);
                this.activeOption = optionInstance;
                this.initializedOptions.push(optionInstance);
            }
        }
    }
    loadPageOptions() {
        var pageOptions = this.pageOptions;
        if (!pageOptions)
            return;
        var root = $("#PageOptions");
        pageOptions.forEach((option) => {
            var btn = new ButtonComponent(option.name, {
                snippet: "Option",
                isSingle: true,
                text: option.name,
                onClick: () => GameEvents.SendCustomGameEventToAllClients("render-page-option", {
                    playerId: Players.GetLocalPlayer(),
                    page: option.name,
                }),
            });
            if (btn) {
                btn.load(root);
            }
        });
    }
    parseConfig(config) {
        const { snippet, pageOptions, isSingle, onReload } = config;
        snippet && (this.snippet = snippet);
        pageOptions && (this.pageOptions = pageOptions);
        isSingle && (this.isSingle = isSingle);
        onReload && (this.onReload = onReload);
    }
}
