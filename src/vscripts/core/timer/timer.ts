class Timer {
  private time: number = 0;

  public get now() {
    return this.time;
  }
  constructor() {
    Timers.CreateTimer(() => {
      this.time = this.time + 1;
      return 0.001;
    });
  }
}
// export const eventBus = new Timer();
