import { BaseItem, registerAbility } from "../lib/dota_ts_adapter";
import { eventBus } from "../core/event-bus/event-bus";

@registerAbility()
export class item_custom_qblade extends BaseItem {
  OnSpellStart(): void {
    const caster = this.GetCaster();
    const target = this.GetCursorTarget();

    if (target) {
      const targetName = target.GetUnitName();
      if (targetName === "npc_dota_observer_wards") {
        target.Kill(undefined, undefined);
        eventBus.emit("qblade.hit", {
          custom: "hit",
          index: target.GetEntityIndex(),
        });
        caster.EmitSound("frog");
      }
    } else {
      eventBus.emit("qblade.miss", { custom: "miss" });
      caster.EmitSound("sheep");
    }
  }

  GetBehavior() {
    return (
      AbilityBehavior.UNIT_TARGET |
      AbilityBehavior.POINT |
      AbilityBehavior.IMMEDIATE |
      AbilityBehavior.IGNORE_BACKSWING
    );
  }
  GetCastRange(): number {
    return 1500;
  }

  GetCooldown(): number {
    return 0;
  }

  GetManaCost(): number {
    return 0;
  }

  GetAbilityTargetTeam() {
    return UnitTargetTeam.BOTH;
  }

  GetAbilityTargetType() {
    return UnitTargetType.ALL;
  }
}
