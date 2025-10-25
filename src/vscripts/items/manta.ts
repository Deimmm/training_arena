import { BaseItem, registerAbility } from "../lib/dota_ts_adapter";

@registerAbility()
export class item_manta extends BaseItem {
  GetCooldown(): number {
    return 0;
  }

  GetManaCost(): number {
    return 0;
  }
}
