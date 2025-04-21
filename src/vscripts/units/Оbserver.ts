import { eventBus } from "../core/event-bus/event-bus";
import { Box } from "../utils/Box";

interface ObserverWardOptions {
  position: Vector;
}

export class ObserverWard {
  private options: ObserverWardOptions;
  public index: EntityIndex;
  public ttl: number;
  constructor(options: ObserverWardOptions) {
    this.options = options;
  }

  spawn() {
    const sizes = [
      [8, 0.6],
      [10, 0.7],
      [12, 0.8],
      [12, 0.8],
      [12, 0.8],
      [14, 1],
      [14, 1],
    ];
    const randomIndex = math.random(1, sizes.length) - 1;
    const [hullRadius, modelScale] = sizes[randomIndex];
    const ward = CreateUnitByName(
      "npc_dota_observer_wards",
      this.options.position,
      true,
      undefined,
      undefined,
      DotaTeam.NOTEAM,
    );
    this.index = ward.GetEntityIndex();
    ward.SetDeathXP(0);
    ward.SetMaximumGoldBounty(0);
    ward.SetMinimumGoldBounty(0);
    ward.SetHullRadius(hullRadius);
    ward.SetModelScale(modelScale);
    this.ttl = 1000;
    Timers.CreateTimer(() => {
      if (this.ttl === 0) {
        return;
      }
      if (ward.IsAlive()) {
        this.ttl = this.ttl - 1;
        return 0.001;
      }
    });

    Timers.CreateTimer(() => {
      const health = ward.GetHealth();

      if (ward.IsAlive()) {
        if (health - 10 <= 0) {
          ward.Kill(undefined, undefined);
          eventBus.emit("obs.expire", {});
          return;
        }
        ward.ModifyHealth(health - 10, undefined, false, 0);
        return 0.1;
      }
    });
  }
}

export class AIMCOMMON_ObserverWardSpawn {
  private isSpawning = true;
  private isFirstLaunch = true;

  wards: ObserverWard[] = [];
  spawn(outerBox: Box, innerBox: Box, config: { wards_count: number }) {
    let interval = 2.5;
    const wards_count: number = config.wards_count;

    Timers.CreateTimer(() => {
      const count = this.wards.length;
      if (count === wards_count) {
        eventBus.emit("obsspawn.finish", {});
        return;
      }
      if (!this.isSpawning) {
        return;
      }
      if (this.isFirstLaunch) {
        this.isFirstLaunch = false;
        return 3;
      }

      switch (true) {
        case count >= 4 && count < 8:
          interval = 1.75;
          break;
        case count >= 8 && count < 12:
          interval = 1.5;
          break;
        case count >= 12 && count < 16:
          interval = 1.25;
          break;
        case count >= 16 && count < 22:
          interval = 0.75;
          break;
        case count >= 22 && count < 28:
          interval = 0.5;
          break;
        case count >= 28:
          interval = 0.4;

          break;
      }
      const spawnPos = Box.twoBoxRandomPoint(
        outerBox.boxPoints,
        innerBox.boxPoints,
      );

      const ward = new ObserverWard({ position: spawnPos });
      ward.spawn();
      this.wards.push(ward);
      return interval;
    });
  }

  kill() {
    this.isSpawning = false;
  }
}
