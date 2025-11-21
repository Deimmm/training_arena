import { Geometry } from "utils/Box";

export class InvisibileWall {
  public static wrapBox(box: Geometry) {
    const unitSpacing = 64;
    const points = box.boxPoints;
    if (points.length !== 4) {
      throw new Error("Box must have 4 points.");
    }
    for (let i = 0; i < 4; i++) {
      const start = points[i];
      const end = points[(i + 1) % 4]; // замыкаем квадрат

      const dx = end.x - start.x;
      const dy = end.y - start.y;
      const length = Math.sqrt(dx * dx + dy * dy);
      const steps = Math.floor(length / unitSpacing);
      const direction = { x: dx / length, y: dy / length };

      for (let j = 0; j <= steps; j++) {
        const pos: Vector = Vector(
          start.x + direction.x * j * unitSpacing,
          start.y + direction.y * j * unitSpacing,
        );

        CreateUnitByName(
          "npc_dota_invisible_wall",
          pos,
          false,
          null,
          null,
          DotaTeam.NOTEAM,
        );
      }
    }
  }
}
