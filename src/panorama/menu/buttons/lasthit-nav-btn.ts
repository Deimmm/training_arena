class LastitNavigationButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: LastitNavigationButton._onClick,
      text: SideNavButton.LASTHIT,
      snippet: "NavButton",
    });
    this.load(root);
  }

  private static _onClick() {
    GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
      playerId: Players.GetLocalPlayer(),
      page: PageNames.LASTHIT,
    });
    $.Msg(`Clicked ${LastitNavigationButton.name}`);
  }
}
