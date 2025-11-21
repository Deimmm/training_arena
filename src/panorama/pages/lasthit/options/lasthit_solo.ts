class SoloLastHitPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "Solo",
    });
    this.load(root);
  }
}
