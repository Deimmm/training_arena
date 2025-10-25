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
}
