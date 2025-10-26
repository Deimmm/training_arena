import { BaseModifier, registerModifier } from "lib/dota_ts_adapter";
@registerModifier()
export class soft_wall extends BaseModifier {
  private minX: number;
  private maxX: number;
  private minY: number;
  private maxY: number;

  OnCreated(opt: {
    minX: number;
    maxX: number;
    minY: number;
    maxY: number;
  }): void {
    this.minX = opt.minX;
    this.maxX = opt.maxX;
    this.minY = opt.minY + 50;
    this.maxY = opt.maxY;

    print(this.minX, this.maxX, this.minY, this.maxY);
  }

  DeclareFunctions() {
    return [ModifierFunction.ON_UNIT_MOVED, ModifierFunction.ON_ORDER];
  }

  OnUnitMoved(event: ModifierUnitEvent): void {
    if (!IsServer()) return;
    const unit = this.GetParent();
    if (event.unit !== unit) return;

    if (event.new_pos) {
      if (this.isOutside(event.new_pos)) {
        const tp_pos = this.nearestOnBox(event.new_pos);
        unit.SetAbsOrigin(tp_pos);
      }
    }
  }

  private isOutside(pos: Vector): boolean {
    return (
      pos.x < this.minX ||
      pos.x > this.maxX ||
      pos.y < this.minY ||
      pos.y > this.maxY
    );
  }
  private nearestOnBox(p: Vector): Vector {
    const clamp = (v: number, lo: number, hi: number) =>
      math.max(lo, math.min(hi, v));
    return Vector(
      clamp(p.x, this.minX, this.maxX),
      clamp(p.y, this.minY, this.maxY),
      p.z,
    );
  }
}
