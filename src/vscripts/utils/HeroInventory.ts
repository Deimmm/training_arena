export class HeroInventory {
  public static reset(hero: CDOTA_BaseNPC_Hero) {
    for (let i = 0; i < 9; i++) {
      const item = hero.GetItemInSlot(i);
      hero.GetNumItemsInStash;
      if (item) {
        hero.RemoveItem(item);
      }
    }
  }
}
