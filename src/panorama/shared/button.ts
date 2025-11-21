class ButtonConfig {
  snippet?: string;
  onClick?: () => void;
  text?: string;
  isSingle?: boolean;
}

class ButtonComponent {
  id: string;
  snippet?: string;
  text?: string;
  onClick?: () => void;
  isSingle?: boolean = true;
  get idSelector() {
    return "#" + this.id;
  }
  constructor(id: string, config: ButtonConfig) {
    this.id = id;
    this.parseConfig(config);
  }

  public load(root: Panel): any {
    if (this.isSingle && this.isLoaded()) {
      this.delete();
    }
    $.Msg("Rendering  ", this.id);
    return this.render(root);
  }

  public render(root: Panel) {
    var panel = $.CreatePanel("Panel", root, this.id);
    var snippet = this.snippet;
    var text = this.text;
    var onClick = this.onClick;
    if (snippet) {
      panel.BLoadLayoutSnippet(snippet);
    }
    if (text) {
      var label: LabelPanel = panel.FindChildrenWithClassTraverse(
        "ButtonText",
      )[0] as LabelPanel;

      label && (label.text = text);
    }
    if (onClick) {
      panel.SetPanelEvent("onactivate", onClick);
    }
    return panel;
  }
  public get(): Panel {
    return $(this.idSelector);
  }

  public delete(): void {
    $(this.idSelector).RemoveAndDeleteChildren();
    $(this.idSelector).DeleteAsync(0);
  }

  public isLoaded(): Panel | false {
    var elem = this.get();
    return !!elem ? elem : false;
  }

  private parseConfig(config: ButtonConfig) {
    const { snippet, text, onClick } = config;
    snippet && (this.snippet = snippet);
    text && (this.text = text);
    onClick && (this.onClick = onClick);
  }
}
