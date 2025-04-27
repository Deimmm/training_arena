import { eventBus } from "core/event-bus/event-bus";
import { Box } from "utils/Box";

interface VectorGroupOptions {
  start: Vector;
  end: Vector;
}

export class VectorGroup {
  options: VectorGroupOptions;
  public ttl: number;
  public index: EntityIndex;
  constructor(options: VectorGroupOptions) {
    this.options = options;
  }
  spawn() {
    const { start, end } = this.options;
    const tree = CreateTempTree(start, 2);
    const dummy = CreateUnitByName(
      "npc_dota_rattletrap_cog",
      end,
      true,
      undefined,
      undefined,
      DotaTeam.NOTEAM,
    );
    this.index = dummy.GetEntityIndex();
    dummy.SetDeathXP(0);
    dummy.SetMaximumGoldBounty(0);
    dummy.SetMinimumGoldBounty(0);
    dummy.SetHealth(200);

    Timers.CreateTimer(() => {
      if (this.ttl === 0) {
        return;
      }
      if (dummy.IsAlive()) {
        this.ttl = this.ttl - 1;
        return 0.001;
      }
    });

    Timers.CreateTimer(() => {
      const health = dummy.GetHealth();
      if (dummy.IsAlive()) {
        if (health - 10 <= 0) {
          dummy.Kill(undefined, undefined);
          eventBus.emit("vectorgroup.expire", {});
          return;
        }
        dummy.ModifyHealth(health - 10, undefined, false, 0);
        return 0.1;
      }
    });
  }
}

export class VectorGroupSpawn {
  private isSpawning = true;
  private isFirstLaunch = true;

  entities: VectorGroup[] = [];

  spawn(outerBox: Box, innerBox: Box, config: { entities_count: number }) {
    let interval = 2.5;
    const entsCount: number = config.entities_count;

    Timers.CreateTimer(() => {
      const count = this.entities.length;
      if (count === entsCount) {
        eventBus.emit("vectorgroup.finish", {});
        return;
      }
      if (!this.isSpawning) {
        return;
      }
      if (this.isFirstLaunch) {
        this.isFirstLaunch = false;
        return 3;
      }
      const start = Box.twoBoxRandomPoint(
        outerBox.boxPoints,
        innerBox.boxPoints,
      );
      const end = Box.twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints);

      const ents = new VectorGroup({ start, end });
      ents.spawn();
      this.entities.push(ents);
      return interval;
    });
  }

  kill() {
    this.isSpawning = false;
  }
}
