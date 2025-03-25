declare class Logger {
    private readonly name;
    constructor(name: string);
    log(...args: any): void;
}
