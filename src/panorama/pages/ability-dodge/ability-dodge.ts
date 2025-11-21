class AbilityDodgePage extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "AbilityDodgePage",
      pageOptions: [{ name: "Manta", component: MantaDodgePageComponent }],
    });
    this.load(root);
  }
}
