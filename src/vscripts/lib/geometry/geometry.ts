export class Geometry {
  public static getTriangleOppsiteAngle(a: number, b: number): number {
    const sinA = a / b;
    const angleARad = Math.asin(sinA);
    return angleARad * (180 * Math.PI);
  }
}
