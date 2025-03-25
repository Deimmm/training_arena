class LastitNavigationButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: LastitNavigationButton._onClick,
            text: SideNavButton.LASTHIT,
            snippet: "NavButton",
        });
        this.load(root);
    }
    static _onClick() {
        GameEvents.SendCustomGameEventToAllClients("render-page", {
            playerId: Players.GetLocalPlayer(),
            page: "LasthitPage",
        });
        $.Msg(`Clicked ${LastitNavigationButton.name}`);
    }
}
