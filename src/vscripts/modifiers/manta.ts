import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class manta_modifier extends BaseModifier {
  DeclareFunctions() {
    return [
      ModifierFunction.STATUS_RESISTANCE,
      ModifierFunction.MOVESPEED_ABSOLUTE,
      ModifierFunction.INCOMING_DAMAGE_PERCENTAGE,
      ModifierFunction.HEALTH_REGEN_CONSTANT,
      ModifierFunction.ON_MODIFIER_ADDED,
    ];
  }

  GetModifierConstantHealthRegen() {
    return 50;
  }
  GetModifierIncomingDamage_Percentage() {
    return -80;
  }
  GetModifierMoveSpeed_Absolute(): number {
    return 200;
  }

  GetModifierStatusResistance(): number {
    return 80;
  }

  OnModifierAdded(event: any): void {
    if (!IsServer()) return;
    const parent = this.GetParent();
    if (!event || event.unit !== parent) return;

    const added = event.added_buff as CDOTA_Buff | undefined;
    if (!added || !added.IsDebuff()) return;

    print(`[DODGE_TRAINING] HIT BY SPELL}`);
  }
}
