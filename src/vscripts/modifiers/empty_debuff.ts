import { BaseModifier, registerModifier } from "lib/dota_ts_adapter";

@registerModifier()
export class empty_debuff_applier extends BaseModifier {
  DeclareFunctions() {
    return [ModifierFunction.ON_TAKEDAMAGE];
  }

  OnTakeDamage(event: ModifierInstanceEvent): void {
    if (!IsServer()) return;

    const parent = this.GetParent();
    if (event.attacker.GetName() !== parent.GetName()) return;

    const duration = 1;
    event.unit.AddNewModifier(parent, event.inflictor, empty_debuff.name, {
      duration,
    });
  }
}

@registerModifier()
export class empty_debuff extends BaseModifier {
  IsPurgable() {
    return true;
  }
  IsDebuff(): boolean {
    return true;
  }
}
