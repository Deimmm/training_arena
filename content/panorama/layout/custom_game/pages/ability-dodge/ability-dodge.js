class AbilityDodgePage extends PageComponent {
    constructor(id, root) {
        super(id, {
            isSingle: true,
            snippet: "AbilityDodgePage",
            pageOptions: [{ name: "Manta", component: MantaDodgePageComponent }],
        });
        this.load(root);
    }
}
