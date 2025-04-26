interface HeaderConfig {
  name: string;
  colClass: string;
}
class TableBuilder {
  private _id: string;
  headers: HeaderConfig[] = [];
  constructor(
    id: string,
    config: {
      headers: HeaderConfig[];
    },
  ) {
    this._id = id;
    this.headers = config.headers;
    this.addHeader(config.headers);
  }

  get id() {
    return "#" + this._id;
  }

  addHeader(columnHeaders: HeaderConfig[]) {
    const tableContainer = $(this.id);
    if (!tableContainer) {
      $.Msg("NO TABLE CONTAINER", this._id);
      return;
    }
    const tableHeader = tableContainer.FindChildTraverse("TableHeader");
    if (tableHeader) {
      for (const elem of columnHeaders) {
        $.CreatePanel("Label", tableHeader, elem.name, {
          text: elem.name,
        }).AddClass(elem.colClass);
      }
    }
  }

  // Extend Values into objects with type to dynamically create proper type
  // Page component, pass callback function OnReload to call it on reload
  addRow(rowId: string, values: (string | number)[]) {
    const tableContainer = $(this.id);
    if (!tableContainer) {
      $.Msg("NO TABLE CONTAINER", this._id);
      return;
    }
    const tableBody = tableContainer.FindChild("TableBody");
    if (tableBody) {
      const row = $.CreatePanel("Label", tableBody, rowId, {
        class: "TableRow",
      });
      values.forEach((value, i) => {
        const className = this.headers[i].colClass;
        if (i === 1) {
          const playerContainer = $.CreatePanel("Panel", row, rowId + value, {
            class: "TableCell",
          });
          playerContainer.AddClass(className);
          playerContainer.style.flowChildren = "right";
          const ava = $.CreatePanel(
            "DOTAAvatarImage",
            playerContainer,
            rowId + value,
            {
              steamid: value,
            },
          );
          ava.style.width = "50px";
          ava.style.height = "50px";
          ava.style.marginRight = "20px";
          $.CreatePanel("DOTAUserName", playerContainer, rowId + value, {
            class: "PlayerColl",
            steamid: value,
          });
        } else {
          $.CreatePanel("Label", row, rowId + value, {
            class: "TableCell",
            text: value,
          }).AddClass(className);
        }
      });
    }
  }
}
