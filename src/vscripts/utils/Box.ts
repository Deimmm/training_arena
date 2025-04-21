export class Box {
  boxParticles: ParticleID[] = [];
  boxPoints: Vector[] = [];

  createBox(
    center: Vector,
    size: number,
    offsetY: number,
    isParticle: boolean,
  ) {
    const z = 128;
    const { x, y } = center;
    const width = size * 1.3;
    const height = size * 0.9;
    const p1 = Vector(x - width, y - height + offsetY, z);
    const p2 = Vector(x + width, y - height + offsetY, z);
    const p3 = Vector(x + width, y + height + offsetY, z);
    const p4 = Vector(x - width, y + height + offsetY, z);

    const boxPoints = [p1, p2, p3, p4];
    const boxParticles = isParticle && [
      this.createParticleLine(p1, p2),
      this.createParticleLine(p2, p3),
      this.createParticleLine(p3, p4),
      this.createParticleLine(p4, p1),
    ];
    this.boxParticles = boxParticles || [];
    this.boxPoints = boxPoints;
    return {
      points: boxPoints,
      particles: boxParticles,
    };
  }

  destroyBox() {
    this.boxParticles.forEach((particle) => {
      ParticleManager.DestroyParticle(particle, true);
      ParticleManager.ReleaseParticleIndex(particle);
    });
  }
  createParticleLine(start: Vector, end: Vector) {
    const particleName = "particles/custom/range_display_line_red.vpcf";
    const pid = ParticleManager.CreateParticle(
      particleName,
      ParticleAttachment.WORLDORIGIN,
      undefined,
    );
    ParticleManager.SetParticleControl(pid, 0, start); // Start
    ParticleManager.SetParticleControl(pid, 1, end); // End
    return pid;
  }

  public static twoBoxRandomPoint(outer: Vector[], inner: Vector[]): Vector {
    if (outer.length !== 4 || inner.length !== 4) {
      throw new Error("Wrong incoming params. Outer or Inner not box");
    }
    const [op1, op2, op3, op4] = outer;
    const minX = Math.min(op1.x, op2.x, op3.x, op4.x);
    const maxX = Math.max(op1.x, op2.x, op3.x, op4.x);
    const minY = Math.min(op1.y, op2.y, op3.y, op4.y);
    const maxY = Math.max(op1.y, op2.y, op3.y, op4.y);

    const [ip1, ip2, ip3, ip4] = inner;
    const hMinX = Math.min(ip1.x, ip2.x, ip3.x, ip4.x);
    const hMaxX = Math.max(ip1.x, ip2.x, ip3.x, ip4.x);
    const hMinY = Math.min(ip1.y, ip2.y, ip3.y, ip4.y);
    const hMaxY = Math.max(ip1.y, ip2.y, ip3.y, ip4.y);

    const zones = [];
    if (hMaxY < maxY) {
      zones.push({
        minX: minX,
        maxX: maxX,
        minY: hMaxY,
        maxY: maxY,
      });
    }

    if (hMinY > minY) {
      zones.push({
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: hMinY,
      });
    }

    if (hMinX > minX) {
      zones.push({
        minX: minX,
        maxX: hMinX,
        minY: hMinY,
        maxY: hMaxY,
      });
    }

    if (hMaxX < maxX) {
      zones.push({
        minX: hMaxX,
        maxX: maxX,
        minY: hMinY,
        maxY: hMaxY,
      });
    }
    const chosenZone = zones[RandomInt(0, zones.length - 1)];

    const randX = RandomFloat(chosenZone.minX, chosenZone.maxX);
    const randY = RandomFloat(chosenZone.minY, chosenZone.maxY);

    return Vector(
      randX,
      randY,
      GetGroundHeight(Vector(randX, randY, 0), undefined),
    );
  }
}
