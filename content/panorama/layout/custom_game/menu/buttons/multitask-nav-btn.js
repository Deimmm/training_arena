class MultitaskNavButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: () => {
                GameEvents.SendCustomGameEventToAllClients("render-page", {
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
