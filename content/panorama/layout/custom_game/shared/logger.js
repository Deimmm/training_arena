class Logger {
    constructor(name) {
        this.name = name;
    }
    log(...args) {
        $.Msg(`Context: ${this.name}\n`, args);
    }
}
