class SoloLastHitPageComponent extends PageComponent {
    constructor(id, root) {
        super(id, {
            isSingle: true,
            snippet: "Solo",
        });
        this.load(root);
    }
}
