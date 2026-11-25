import fs from 'node:fs';
import crypto from 'node:crypto';
import { decodePng } from '../src/core/png';
import { writeEffectPng } from './effect-png';

async function main() {
  const rows = [];
  for (const level of ['Dawn', 'Prairie_ButterflyFields', 'Sunset']) {
    const previous = decodePng(fs.readFileSync(`docs/shader-effects/${level}-cloud-temporal-before-after.png`));
    const after = decodePng(fs.readFileSync(`docs/shader-effects/${level}-cloud-pipeline.png`));
    const { width, height } = after;
    if (previous.width !== width * 2 || previous.height !== height) throw new Error('Previous centered-camera image dimensions differ');
    const before = new Uint8Array(width * height * 4), combined = new Uint8Array(width * height * 8);
    for (let y = 0; y < height; y++) {
      before.set(previous.rgba.subarray((y * previous.width + width) * 4, (y * previous.width + width * 2) * 4), y * width * 4);
      combined.set(before.subarray(y * width * 4, (y + 1) * width * 4), y * width * 8);
      combined.set(after.rgba.subarray(y * width * 4, (y + 1) * width * 4), y * width * 8 + width * 4);
    }
    const file = `docs/shader-effects/${level}-cloud-camera-before-after.png`;
    await writeEffectPng(file, width * 2, height, combined);
    const hash = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
    rows.push({ level, width, height, frames: 2, beforeSha256: hash(before), afterSha256: hash(after.rgba), file });
  }
  const report = { scope: 'Same previous real-map camera and two frames. Left: preceding centered-jitter temporal preview. Right: native eight-phase scene and 32-phase half jitter, Gaussian kernel and previous-projection correction. Editor comparison; original game visual parity remains unverified.', maps: rows };
  fs.writeFileSync('docs/cloud-camera-compare.json', JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report));
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
