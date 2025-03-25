class AimNavButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: () => {
                $.Msg("ON AIMNVA CLICK");
                GameEvents.SendCustomGameEventToAllClients("render-page", {
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
