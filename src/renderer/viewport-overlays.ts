import * as THREE from 'three';

// BoxHelper increments its position version on every update, even when the
// bounds are unchanged. That makes the native viewport upload/redraw forever.
export class BoundsOverlay extends THREE.BoxHelper {
  constructor(object:THREE.Object3D,color?:THREE.ColorRepresentation){super(object,color);this.userData.dynamicViewport=true;}
  // Three sets this runtime field in BoxHelper before calling update(), but
  // its current type declarations omit it. `declare` emits no initialization.
  declare object: THREE.Object3D | undefined;
  private previousBounds?: THREE.Box3;
  override update() {
    if (!this.object) return;
    const bounds = new THREE.Box3().setFromObject(this.object);
    if (this.previousBounds?.equals(bounds)) return;
    this.previousBounds = bounds;
    super.update();
  }
}

// Use the source index stream, including coplanar triangle edges. EdgesGeometry
// would omit those edges; BoxHelper would describe bounds rather than the mesh.
export class MeshWireOverlay extends THREE.Group {
  private sources: { mesh: THREE.Mesh; wire: THREE.LineSegments }[] = [];
  constructor(source: THREE.Object3D, color = 0x91e2ca, includeHelpers = false) {
    super();
    source.traverse(object => {
      if (!(object instanceof THREE.Mesh) || !includeHelpers && object.userData.editorHelper) return;
      // Baked pass children reuse the parent's original stream. Overlay it once.
      for (let parent = object.parent; parent && parent !== source.parent; parent = parent.parent)
        if (parent.userData.bakedView) return;
      if (!object.geometry.getAttribute('position')) return;
      const wire = new THREE.LineSegments(new THREE.WireframeGeometry(object.geometry),
        new THREE.LineBasicMaterial({ color, transparent: true, opacity: .85, depthWrite: false }));
      wire.userData.dynamicViewport=true;
      wire.matrixAutoUpdate = false;
      this.add(wire); this.sources.push({ mesh: object, wire });
    });
    this.update();
  }
  update() {
    this.updateWorldMatrix(true, false);
    const inverse = this.matrixWorld.clone().invert();
    for (const { mesh, wire } of this.sources) {
      mesh.updateWorldMatrix(true, false);
      wire.matrix.multiplyMatrices(inverse, mesh.matrixWorld);
      wire.visible = true;
      for (let object: THREE.Object3D | null = mesh; object; object = object.parent)
        if (!object.visible) { wire.visible = false; break; }
    }
    this.updateMatrixWorld(true);
  }
  dispose() {
    for (const { wire } of this.sources) { wire.geometry.dispose(); (wire.material as THREE.Material).dispose(); }
    this.sources = []; this.clear();
  }
}
