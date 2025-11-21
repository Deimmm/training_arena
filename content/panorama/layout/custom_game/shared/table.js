class TableBuilder {
    constructor(id, config) {
        this.headers = [];
        this._id = id;
        // this.delete();
        this.headers = config.headers;
        this.addHeader(config.headers);
    }
    get id() {
        return "#" + this._id;
    }
    delete() {
        try {
            $(this.id).RemoveAndDeleteChildren();
            // $(this.id).DeleteAsync(0);
        }
        catch (err) { }
    }
    addHeader(columnHeaders) {
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
    addRow(rowId, values) {
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
                    const ava = $.CreatePanel("DOTAAvatarImage", playerContainer, rowId + value, {
                        steamid: value,
                    });
                    ava.style.width = "50px";
                    ava.style.height = "50px";
                    ava.style.marginRight = "20px";
                    $.CreatePanel("DOTAUserName", playerContainer, rowId + value, {
                        class: "PlayerColl",
                        steamid: value,
                    });
                }
                else {
                    $.CreatePanel("Label", row, rowId + value, {
                        class: "TableCell",
                        text: value,
                    }).AddClass(className);
                }
            });
        }
    }
}
