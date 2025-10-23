class MantaDodgeNavButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: MantaDodgeNavButton._onClick,
            text: SideNavButton.MANTA_DODGE,
            snippet: "NavButton",
        });
        this.load(root);
    }
    static _onClick() {
        GameEvents.SendCustomGameEventToAllClients("render-page", {
            playerId: Players.GetLocalPlayer(),
            page: PageNames.MANTA_DODGE,
        });
        $.Msg(`Clicked ${MantaDodgeNavButton.name}`);
    }
}
