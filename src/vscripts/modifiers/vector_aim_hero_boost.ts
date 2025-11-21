import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class vector_aim_hero_boost extends BaseModifier {
  DeclareFunctions() {
    return [
      ModifierFunction.CAST_RANGE_BONUS,
      ModifierFunction.SPELL_AMPLIFY_PERCENTAGE,
      ModifierFunction.COOLDOWN_REDUCTION_CONSTANT,
      ModifierFunction.MANACOST_REDUCTION_CONSTANT,
      ModifierFunction.ON_ABILITY_START,
      ModifierFunction.CASTTIME_PERCENTAGE,
      ModifierFunction.MANA_REGEN_TOTAL_PERCENTAGE,
    ];
  }

  GetModifierCastRangeBonus(): number {
    return 3000;
  }
  GetModifierManacostReduction_Constant(event: ModifierAbilityEvent): number {
    return 100;
  }
  GetModifierCooldownReduction_Constant(event: ModifierAbilityEvent): number {
    return 99;
  }

  GetModifierSpellAmplify_Percentage(event: ModifierAttackEvent): number {
    return 3000;
  }
  OnAbilityStart(event: ModifierAbilityEvent): void {
    if (!event.target.GetClassname().includes("tree")) {
      event.unit.Interrupt();
    }
  }

  GetModifierTotalPercentageManaRegen(): number {
    return 1000;
  }
  GetModifierPercentageCasttime(event: ModifierAbilityEvent): number {
    return 100;
  }
}
