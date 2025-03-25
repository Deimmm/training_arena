class AimNavButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: () => {
        $.Msg("ON AIMNVA CLICK");
        GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
          playerId: Players.GetLocalPlayer(),
          page: "AimPage",
        });
      },
      text: SideNavButton.AIM,
      snippet: "NavButton",
    });
    this.load(root);
  }
}
