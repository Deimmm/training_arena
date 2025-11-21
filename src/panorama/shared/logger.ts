class Logger {
  private readonly name: string;

  constructor(name: string) {
    this.name = name;
  }

  public log(...args: any) {
    $.Msg(`Context: ${this.name}\n`, args);
  }
}
