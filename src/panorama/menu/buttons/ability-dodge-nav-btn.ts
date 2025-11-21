class AbilityDodgeNavButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: AbilityDodgeNavButton._onClick,
      text: SideNavButton.ABILITY_DODGE,
      snippet: "NavButton",
    });
    this.load(root);
  }

  private static _onClick() {
    GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
      playerId: Players.GetLocalPlayer(),
      page: PageNames.ABILITY_DODGE,
    });
    $.Msg(`Clicked ${AbilityDodgeNavButton.name}`);
  }
}
