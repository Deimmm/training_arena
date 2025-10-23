class MantaDodgeNavButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: MantaDodgeNavButton._onClick,
      text: SideNavButton.MANTA_DODGE,
      snippet: "NavButton",
    });
    this.load(root);
  }

  private static _onClick() {
    GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
      playerId: Players.GetLocalPlayer(),
      page: PageNames.MANTA_DODGE,
    });
    $.Msg(`Clicked ${MantaDodgeNavButton.name}`);
  }
}
