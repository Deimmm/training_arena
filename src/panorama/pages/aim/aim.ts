class AimPageComponent extends PageComponent {
  constructor(id: string, root: Panel) {
    super(id, {
      isSingle: true,
      snippet: "AimPage",
      pageOptions: [
        { name: "Common", component: CommonAIMPageComponent },
        // { name: "Intermidiate", component: "" },
        // { name: "Pro", component: "" },
      ],
    });
    this.load(root);
  }
}
