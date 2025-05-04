import { eventBus } from "core/event-bus/event-bus";
import { sniper_vector } from "modifiers/sniper_vector";
import { Geometry } from "utils/Box";

interface VectorGroupOptions {
  start: Vector;
  end: Vector;
}

export class VectorGroup {
  options: VectorGroupOptions;
  public ttl: number;
  public index: EntityIndex;
  context: any = {};
  constructor(options: VectorGroupOptions) {
    this.options = options;
  }

  spawn() {
    const { start, end } = this.options;

    CreateTempTree(start, 3);
    const dummy = CreateUnitByName(
      "npc_dummy_sniper",
      end,
      true,
      undefined,
      undefined,
      DotaTeam.NOTEAM,
    );

    this.index = dummy.GetEntityIndex();
    dummy.AddNewModifier(undefined, undefined, sniper_vector.name, {
      index: this.index,
    });
    dummy.SetUnitCanRespawn(false);
    dummy.SetDeathXP(0);
    dummy.SetMaximumGoldBounty(0);
    dummy.SetMinimumGoldBounty(0);
    dummy.SetMaxHealth(300);
    dummy.SetHealth(300);

    this.ttl = 3000;
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
          dummy.ForceKill(false);
          eventBus.emit("vector_dummy.expire", { index: this.index });
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
  private controller: CDOTAPlayerController;
  entities: VectorGroup[] = [];
  blackListSpawns: { pStart; pEnd; index }[] = [];

  private context: any = {};
  constructor(controller: CDOTAPlayerController) {
    this.controller = controller;
  }

  spawn(
    outerBox: Geometry,
    innerBox: Geometry,
    config: { entities_count: number },
  ) {
    let interval = 2.5;
    const entsCount: number = config.entities_count;
    eventBus.on("vector_dummy.killed", (event) => {
      const index = event.index;
      if (index) {
        this.blackListSpawns = this.blackListSpawns.filter(
          (e) => e.index !== index,
        );
      }
    });
    eventBus.on("vector_dummy.expire", (event) => {
      const index = event.index;
      if (index) {
        this.blackListSpawns = this.blackListSpawns.filter(
          (e) => e.index !== index,
        );
      }
    });

    Timers.CreateTimer(() => {
      const count = this.entities.length;
      if (count === entsCount) {
        eventBus.emit("vector_spawn.finish", {});
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
          interval = 1.25;
          break;
        case count >= 12:
          interval = 1.1;
          break;
      }

      const { start, end } = this.calcSpawnPosition(
        outerBox,
        innerBox,
        this.blackListSpawns,
      );

      const ents = new VectorGroup({ start, end });
      ents.spawn();
      this.blackListSpawns.push({
        pStart: start,
        pEnd: end,
        index: ents.index,
      });
      this.entities.push(ents);
      return interval;
    });
  }

  calcSpawnPosition(
    outerBox: Geometry,
    innerBox: Geometry,
    previousPoints: { pStart; pEnd }[],
  ) {
    let start: Vector;
    let end: Vector;
    let isForbidden = true;

    while (isForbidden) {
      start = Geometry.twoBoxRandomPoint(
        outerBox.boxPoints,
        innerBox.boxPoints,
      );
      end = Geometry.twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints);
      if (previousPoints.length > 0) {
        const hero = this.controller.GetAbsOrigin();
        isForbidden = previousPoints.some((e) => {
          const { pStart, pEnd } = e;
          const d1 = Geometry.distanceToSegment(end, hero, pStart);
          const d2 = Geometry.distanceToSegment(end, pStart, pEnd);
          const d3 = Geometry.distanceToSegment(start, hero, pStart);
          const d4 = Geometry.distanceToSegment(start, pStart, pEnd);
          return (d1 <= 300 || d2 <= 300) && (d3 <= 300 || d4 <= 300);
        });
      } else {
        isForbidden = false;
      }
    }
    return { start, end };
  }

  kill() {
    this.isSpawning = false;
  }
}
