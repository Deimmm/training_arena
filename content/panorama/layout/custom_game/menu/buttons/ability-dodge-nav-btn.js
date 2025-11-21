class AbilityDodgeNavButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: AbilityDodgeNavButton._onClick,
            text: SideNavButton.ABILITY_DODGE,
            snippet: "NavButton",
        });
        this.load(root);
    }
    static _onClick() {
        GameEvents.SendCustomGameEventToAllClients("render-page", {
            playerId: Players.GetLocalPlayer(),
            page: PageNames.ABILITY_DODGE,
        });
        $.Msg(`Clicked ${AbilityDodgeNavButton.name}`);
    }
}
