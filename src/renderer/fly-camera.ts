import * as THREE from 'three';
import type { OrbitControls } from 'three/addons/controls/OrbitControls.js';

export function createFlyCamera(canvas: HTMLElement, camera: THREE.PerspectiveCamera, orbit: OrbitControls, available: () => boolean) {
  canvas.tabIndex = 0;
  const keys = new Set<string>(), movementKeys = new Set(['KeyW', 'KeyA', 'KeyS', 'KeyD', 'KeyQ', 'KeyE']);
  let fast = false, previousTime = 0;
  let look: { pointer: number; x: number; y: number; startX: number; startY: number; moved: boolean; damping: boolean; enabled: boolean } | undefined;
  const commit = () => { orbit.update(); camera.updateMatrixWorld(); };
  function finishLook() {
    if (!look) return;
    const old = look; look = undefined;
    orbit.enableDamping = old.damping; orbit.enabled = old.enabled; canvas.style.cursor = '';
    if (canvas.hasPointerCapture(old.pointer)) canvas.releasePointerCapture(old.pointer);
  }
  function reset() { keys.clear(); fast = false; previousTime = 0; finishLook(); }
  const keydown = (event: KeyboardEvent) => {
    if (!available() || document.activeElement !== canvas || event.ctrlKey || event.metaKey || event.altKey) { keys.clear(); return; }
    fast = event.shiftKey;
    if (!movementKeys.has(event.code)) return;
    event.preventDefault(); event.stopImmediatePropagation();
    if (!keys.size) { const damping = orbit.enableDamping; orbit.enableDamping = false; commit(); orbit.enableDamping = damping; }
    keys.add(event.code);
  };
  const keyup = (event: KeyboardEvent) => { keys.delete(event.code); fast = event.shiftKey; };
  const down = (event: PointerEvent) => {
    if (!available()) return;
    canvas.focus({ preventScroll: true });
    if (event.button !== 2) return;
    event.preventDefault(); event.stopImmediatePropagation(); finishLook();
    canvas.closest('#viewport')?.querySelector<HTMLElement>('#context-menu')?.setAttribute('hidden', '');
    const damping = orbit.enableDamping, enabled = orbit.enabled;
    orbit.enableDamping = false; commit(); orbit.enabled = false;
    look = { pointer: event.pointerId, x: event.clientX, y: event.clientY, startX: event.clientX, startY: event.clientY, moved: false, damping, enabled };
    canvas.setPointerCapture(event.pointerId); canvas.style.cursor = 'grabbing';
  };
  const move = (event: PointerEvent) => {
    if (!look || event.pointerId !== look.pointer) return;
    event.preventDefault(); event.stopImmediatePropagation();
    if (!available()) { reset(); return; }
    if (!look.moved && Math.hypot(event.clientX - look.startX, event.clientY - look.startY) <= 4) return;
    look.moved = true;
    const align = new THREE.Quaternion().setFromUnitVectors(camera.up.clone().normalize(), new THREE.Vector3(0, 1, 0));
    const direction = orbit.target.clone().sub(camera.position).applyQuaternion(align);
    const spherical = new THREE.Spherical().setFromVector3(direction);
    spherical.theta -= (event.clientX - look.x) * .0025;
    spherical.phi = THREE.MathUtils.clamp(spherical.phi + (event.clientY - look.y) * .0025, 1e-5, Math.PI - 1e-5);
    orbit.target.copy(new THREE.Vector3().setFromSpherical(spherical).applyQuaternion(align.invert()).add(camera.position));
    look.x = event.clientX; look.y = event.clientY; commit();
  };
  const up = (event: PointerEvent) => {
    if (!look || event.pointerId !== look.pointer) return;
    event.preventDefault(); event.stopImmediatePropagation();
    const openMenu = !look.moved && available(); finishLook();
    if (openMenu) canvas.dispatchEvent(new MouseEvent('contextmenu', { bubbles: true, cancelable: true, clientX: event.clientX, clientY: event.clientY, button: 2 }));
  };
  // Some platforms emit contextmenu on press, others on release. Defer a
  // plain click until release so a right-button look never opens the menu.
  const contextmenu = (event: MouseEvent) => { if (event.isTrusted) { event.preventDefault(); event.stopImmediatePropagation(); } };
  const cancel = (event: PointerEvent) => { if (look?.pointer === event.pointerId) reset(); };
  const hidden = () => { if (document.hidden) reset(); };
  canvas.addEventListener('pointerdown', down, true); canvas.addEventListener('pointermove', move, true);
  canvas.addEventListener('pointerup', up, true); canvas.addEventListener('pointercancel', cancel);
  canvas.addEventListener('lostpointercapture', cancel); canvas.addEventListener('contextmenu', contextmenu, true);
  canvas.addEventListener('blur', reset);
  window.addEventListener('keydown', keydown, true); window.addEventListener('keyup', keyup, true); window.addEventListener('blur', reset);
  document.addEventListener('visibilitychange', hidden);
  return {
    reset,
    update(now: number) {
      const deltaTime = previousTime ? Math.min(.05, Math.max(0, (now - previousTime) / 1000)) : 0; previousTime = now;
      if (!available() || document.activeElement !== canvas) { reset(); return; }
      if (!keys.size || !deltaTime) return;
      camera.updateMatrixWorld();
      const direction = camera.getWorldDirection(new THREE.Vector3()).multiplyScalar(Number(keys.has('KeyW')) - Number(keys.has('KeyS')))
        .addScaledVector(new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld, 0), Number(keys.has('KeyD')) - Number(keys.has('KeyA')))
        .add(new THREE.Vector3(0, Number(keys.has('KeyE')) - Number(keys.has('KeyQ')), 0));
      if (!direction.lengthSq()) return;
      const speed = THREE.MathUtils.clamp(camera.position.distanceTo(orbit.target) * .3, 10, 500) * (fast ? 3 : 1);
      direction.normalize().multiplyScalar(speed * deltaTime); camera.position.add(direction); orbit.target.add(direction);
      if (look) look.moved = true; commit();
    },
    dispose() {
      reset(); canvas.removeEventListener('pointerdown', down, true); canvas.removeEventListener('pointermove', move, true);
      canvas.removeEventListener('pointerup', up, true); canvas.removeEventListener('pointercancel', cancel);
      canvas.removeEventListener('lostpointercapture', cancel); canvas.removeEventListener('contextmenu', contextmenu, true); canvas.removeEventListener('blur', reset);
      window.removeEventListener('keydown', keydown, true); window.removeEventListener('keyup', keyup, true); window.removeEventListener('blur', reset);
      document.removeEventListener('visibilitychange', hidden);
    },
  };
}
