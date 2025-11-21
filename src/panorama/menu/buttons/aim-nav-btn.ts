class AimNavButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: () => {
        GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
          playerId: Players.GetLocalPlayer(),
          page: PageNames.AIM,
        });
      },
      text: SideNavButton.AIM,
      snippet: "NavButton",
    });
    this.load(root);
  }
}
