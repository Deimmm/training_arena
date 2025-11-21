import { eventBus } from "core/event-bus/event-bus";
import { BaseModifier, registerModifier } from "lib/dota_ts_adapter";

@registerModifier()
export class sniper_vector extends BaseModifier {
  private index: number;
  private isDead: boolean = false;
  OnCreated(params: any): void {
    this.index = params.index;
  }
  DeclareFunctions() {
    return [ModifierFunction.ON_DEATH];
  }

  OnDeath(event: ModifierInstanceEvent): void {
    if (event.unit.GetEntityIndex() === this.index && !this.isDead) {
      eventBus.emit("vector_dummy.killed", {
        index: this.index,
      });
      this.isDead = true;
    }
  }
}
