export class Utils {
  public static moveEntityToEntity(
    entity: CDOTA_BaseNPC,
    target: string,
    offset: Vector = Vector(),
  ) {
    const targetEnt = Entities.FindByName(undefined, target);
    if (!targetEnt) {
      return;
    }
    const vector = targetEnt.GetAbsOrigin().__add(offset);
    entity.SetAbsOrigin(vector);
  }

  public static randomInt(min: number, max: number, step: number = 1): number {
    const range = Math.floor((max - min) / step);
    return Math.floor(Math.random() * (range + 1)) * step + min;
  }
}
