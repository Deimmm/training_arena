class AimNavButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: () => {
                GameEvents.SendCustomGameEventToAllClients("render-page", {
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
