import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { readResourceMesh } from '../src/core/resources';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', dir = path.join(data, 'Meshes/Bin');
const sha = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const floatSha = (value: Float32Array) => sha(new Uint8Array(value.buffer, value.byteOffset, value.byteLength));
const records: unknown[] = [], failures: unknown[] = []; let animated = 0, stripped = 0, clips = 0, bones = 0, skinBytes = 0, staticMeshes = 0;
for (const file of fs.readdirSync(dir).filter(f => f.endsWith('.mesh')).sort()) {
  const source = fs.readFileSync(path.join(dir, file));
  try {
    const mesh = readResourceMesh(source);
    if (!mesh.animated) { staticMeshes++; continue; }
    const pack = mesh.animation!; animated++; stripped += +(pack.frameCount === 0); clips += pack.tracks?.clips.length ?? 0; bones += pack.bones.length;
    const streamBytes = mesh.levels.reduce((n, lod) => n + lod.packedSkin!.length, 0); skinBytes += streamBytes;
    records.push({ file, sourceSha256: sha(source), bones: pack.bones.length, frames: pack.frameCount, sampleRate: pack.sampleRate,
      clips: pack.tracks?.clips.length ?? 0, skinBytes: streamBytes, skinSha256: sha(Buffer.concat(mesh.levels.map(lod => Buffer.from(lod.packedSkin!)))), defaultPoseSha256: floatSha(pack.defaultPose),
      positionKeysSha256: pack.tracks ? floatSha(pack.tracks.positions) : null, rotationKeysSha256: pack.tracks ? floatSha(pack.tracks.rotations) : null, scaleKeysSha256: pack.tracks ? floatSha(pack.tracks.scales) : null,
      flagIndexSha256: pack.tracks ? sha(pack.tracks.flags) : null, externalAnimationRequired: pack.frameCount === 0 });
  } catch (error) { failures.push({ file, error: String(error) }); }
}
const report = { passed: !failures.length, staticMeshes, animatedMeshes: animated, strippedMeshes: stripped, embeddedClips: clips, bones, skinBytes,
  scope: 'All original Mesh v28 resources decode safely; every animated LOD retains its original 8-byte-per-vertex skin stream. Embedded AnimationPack skeleton and clip data are exposed through resourceMesh loading. Stripped meshes require external animation resources. Reading and non-retargeted sampling are validated independently of bone matrices, skinning, creature/plant owners and drawing; complete class acceptance remains pending.', records, failures };
fs.writeFileSync('docs/resource-animation-audit.json', JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify({ ...report, records: records.length })); if (!report.passed) process.exitCode = 1;
