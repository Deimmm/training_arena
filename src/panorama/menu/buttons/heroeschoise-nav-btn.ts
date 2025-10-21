class HeroesChoiseNavigationButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: HeroesChoiseNavigationButton._onClick,
      text: SideNavButton.HEROES_CHOISE,
      snippet: "HeroesButton",
    });
    this.load(root);
  }

  private static _onClick() {
    ServerEventBus.emit("heroes.restart", null);
    $.Msg(`Clicked ${LastitNavigationButton.name}`);
  }
}
