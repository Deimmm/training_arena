import { BaseModifier, registerModifier } from "lib/dota_ts_adapter";

@registerModifier()
export class empty_debuff_applier extends BaseModifier {
  DeclareFunctions() {
    return [ModifierFunction.ON_DAMAGE_CALCULATED];
  }

  OnDamageCalculated(event: ModifierAttackEvent): void {
    DeepPrintTable(event);
    if (!IsServer()) return;

    const parent = this.GetParent();

    if (event.attacker !== parent) return;

    const duration = 1;
    parent.AddNewModifier(parent, this.GetAbility(), "modifier_user_debuff", {
      duration,
    });
  }
}

@registerModifier()
export class empty_debuff extends BaseModifier {
  IsPurgable() {
    return true;
  }

  DeclareFunctions() {
    return [ModifierFunction.MOVESPEED_BONUS_PERCENTAGE];
  }

  GetModifierMoveSpeedBonus_Percentage() {
    return 0;
  }
}
