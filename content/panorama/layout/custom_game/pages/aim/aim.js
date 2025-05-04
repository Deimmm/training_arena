class AimPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, {
            isSingle: true,
            snippet: "AimPage",
            pageOptions: [
                { name: "Obs", component: CommonAIMPageComponent },
                { name: "Snipers", component: VectorAIMPageComponent },
                // { name: "Pro", component: "" },
            ],
        });
        this.load(root);
    }
}
