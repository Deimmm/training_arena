import { BaseModifier, registerModifier } from "../lib/dota_ts_adapter";
import { empty_debuff } from "./empty_debuff";

@registerModifier()
export class manta_modifier extends BaseModifier {
  private special_abilities: string[] = [
    "axe_berserkers_call",
    "dark_willow_terrorize",
    "warlock_rain_of_chaos",
  ];

  private index = 0;
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

  OnModifierAdded(event: ModifierAddedEvent): void {
    if (!IsServer()) return;
    const parent = this.GetParent();
    const ability = event.added_buff.GetAbility();

    if (!event || event.unit !== parent || !ability) return;
    const ability_name = ability.GetDebugName();
    const added = event.added_buff as CDOTA_Buff | undefined;
    const added_name = added.GetName();
    if (
      added_name === empty_debuff.name ||
      this.special_abilities.includes(ability_name)
    ) {
      print(`[DODGE_TRAINING] HIT BY SPELL}`);
      const time = LocalTime();
      GameRules.GetTimeOfDay();
      const index = this.index;
      this.index += 1;
      const hours = time.Hours;
      const min = time.Minutes;
      const sec = time.Seconds;
      GameRules.SendCustomMessage(
        `[${index}]<b> You didn't dodge ${ability_name} :( </b>`,
        0,
        1,
      );
    }
  }
}
