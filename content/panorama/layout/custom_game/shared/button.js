class ButtonConfig {
}
class ButtonComponent {
    get idSelector() {
        return "#" + this.id;
    }
    constructor(id, config) {
        this.isSingle = true;
        this.id = id;
        this.parseConfig(config);
    }
    load(root) {
        if (this.isSingle && this.isLoaded()) {
            this.delete();
        }
        $.Msg("Rendering  ", this.id);
        return this.render(root);
    }
    render(root) {
        var panel = $.CreatePanel("Panel", root, this.id);
        var snippet = this.snippet;
        var text = this.text;
        var onClick = this.onClick;
        if (snippet) {
            panel.BLoadLayoutSnippet(snippet);
        }
        if (text) {
            var label = panel.FindChildrenWithClassTraverse("ButtonText")[0];
            label && (label.text = text);
        }
        if (onClick) {
            panel.SetPanelEvent("onactivate", onClick);
        }
        return panel;
    }
    get() {
        return $(this.idSelector);
    }
    delete() {
        $(this.idSelector).RemoveAndDeleteChildren();
        $(this.idSelector).DeleteAsync(0);
    }
    isLoaded() {
        var elem = this.get();
        return !!elem ? elem : false;
    }
    parseConfig(config) {
        const { snippet, text, onClick } = config;
        snippet && (this.snippet = snippet);
        text && (this.text = text);
        onClick && (this.onClick = onClick);
    }
}
