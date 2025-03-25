class LastHitPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "LasthitPage",
      pageOptions: [
        { name: "Solo", component: SoloLastHitPageComponent },
        { name: "1v1", component: ONE_V_ONELasthitPageComponent },
        { name: "2v2", component: TWO_V_TWOLasthitPageComponent },
      ],
    });
    this.load(root);
  }
}
