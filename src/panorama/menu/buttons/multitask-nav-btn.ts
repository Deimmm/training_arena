class MultitaskNavButton extends ButtonComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      onClick: () => {
        GameEvents.SendCustomGameEventToAllClients<any>("render-page", {
          playerId: Players.GetLocalPlayer(),
          page: PageNames.MULTITASK,
        });
      },
      text: SideNavButton.MULTITASK,
      snippet: "NavButton",
    });
    this.load(root);
  }
}
