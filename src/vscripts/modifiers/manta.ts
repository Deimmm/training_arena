import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class manta_modifier extends BaseModifier {
  DeclareFunctions() {
    return [
      ModifierFunction.COOLDOWN_REDUCTION_CONSTANT,
      ModifierFunction.MANACOST_REDUCTION_CONSTANT,
    ];
  }
  GetModifierManacostReduction_Constant(event: ModifierAbilityEvent): number {
    return 1000;
  }
  GetModifierCooldownReduction_Constant(event: ModifierAbilityEvent): number {
    return 33;
  }
}
