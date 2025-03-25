class ONE_V_ONELasthitPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, { snippet: "1V1", isSingle: true });
    this.load(root);
  }
}
