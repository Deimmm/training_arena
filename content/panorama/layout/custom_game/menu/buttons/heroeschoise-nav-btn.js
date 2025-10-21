class HeroesChoiseNavigationButton extends ButtonComponent {
    constructor(id, root) {
        super(id, {
            onClick: HeroesChoiseNavigationButton._onClick,
            text: SideNavButton.HEROES_CHOISE,
            snippet: "HeroesButton",
        });
        this.load(root);
    }
    static _onClick() {
        ServerEventBus.emit("heroes.restart", null);
        $.Msg(`Clicked ${LastitNavigationButton.name}`);
    }
}
