import { floats } from '../src/core/binary';
import { updateResourceAnimationClock } from '../src/core/resource-animation-clock';
export interface AnimationClockCase { id: string; state: Uint8Array; delta: number; weight: number; }
export function animationClockCases(): AnimationClockCase[] {
  const cases: AnimationClockCase[] = [];
  for (const count of [0, 1, 2, 3, 40, 50, 60, 90, 120, 4096]) for (const action of [false, true]) for (const easing of [0, 1, 2, 3, 4, 9]) for (const phase of [0, 0.001, 0.125, 0.49, 0.5, 0.9, 0.999, 1.125, -0.125]) for (const delta of [0, 1 / 30, 0.266, -0.1]) {
    const state = new Uint8Array(0x70); state.forEach((_, i) => { state[i] = (i * 7 + 11) & 255; }); const view = new DataView(state.buffer);
    const index = cases.length; view.setInt32(0, 0x10203040, true); view.setInt32(0xc, index % 2 ? -1 : 2, true); view.setFloat32(0x18, [0.5, 1, 2][index % 3], true); view.setFloat32(0x1c, phase, true); view.setFloat32(0x20, [15, 30, 60, -30][index % 4], true); view.setInt32(0x24, [0, 4, 100][index % 3], true); view.setInt32(0x28, count, true); view.setInt32(0x2c, easing, true); view.setFloat32(0x30, [0.25, 1, 2, 3.5][index % 4], true); view.setFloat32(0x54, [-2, -0.4, -0.1, 0, 0.2, 2][index % 6], true); view.setFloat32(0x58, [0, 0.5, 1, 10][index % 4], true); state[0x4f] = +action;
    cases.push({ id: `${count}:${+action}:${easing}:${phase}:${delta}`, state, delta, weight: [-0.25, 0, 0.5, 0.999, 1, 1.5][index % 6] });
  }
  return cases;
}
export function animationClockRequest(c: AnimationClockCase) { return Buffer.concat([Buffer.from(c.state), floats([c.delta, c.weight])]); }
export function animationClockExpected(c: AnimationClockCase, trace: Buffer) {
  let at = 0; const result = updateResourceAnimationClock(c.state, c.delta, c.weight, { pow: (base, exponent) => {
    if (trace.readUInt32LE(at) !== base || trace.readUInt32LE(at + 4) !== exponent) throw new Error(`${c.id}: native powf input differs at ${at}`);
    const out = trace.readUInt32LE(at + 8); at += 12; return out;
  } }); if (at !== trace.length) throw new Error('Unused powf service calls');
  return Buffer.concat([Buffer.from(result.state), floats([result.accumulatedWeight])]);
}
