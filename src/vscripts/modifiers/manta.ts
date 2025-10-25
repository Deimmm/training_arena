import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";

@registerModifier()
export class manta_modifier extends BaseModifier {
  DeclareFunctions() {
    return [ModifierFunction.STATUS_RESISTANCE];
  }
  GetModifierStatusResistance(): number {
    return 90;
  }
}
