interface HeaderConfig {
    name: string;
    colClass: string;
}
declare class TableBuilder {
    private _id;
    headers: HeaderConfig[];
    constructor(id: string, config: {
        headers: HeaderConfig[];
    });
    get id(): string;
    addHeader(columnHeaders: HeaderConfig[]): void;
    addRow(rowId: string, values: (string | number)[]): void;
}
