import fs from 'node:fs';
import { verifyFishGroupSceneEvents } from './fish-group-scene-cases';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';

const groups: unknown[] = [], captured = new Set<string>();
const result = verifyFishGroupSceneEvents(undefined, o => {
  const key = `${o.level}:${o.fishId}`;
  if (o.name !== 'Disturb' || captured.has(key)) return;
  captured.add(key);
  const requests = RESOURCE_ANIMATION_REQUEST_POOLS.flatMap((pool, kind) => {
    const count = o.memory.read32(o.controller + BigInt(pool.count));
    return Array.from({ length: count }, (_, i) => {
      const p = o.controller + BigInt(pool.first + i * 0x70), bytes = Buffer.from(o.memory.bytes(p, 0x70));
      const mask = Buffer.from(o.memory.bytes(o.memory.read64(p + 0x68n), Math.ceil(o.pack.bones.length / 8)));
      bytes.fill(0, 0x68, 0x70);
      return { kind, bytesHex: bytes.toString('hex'), maskHex: mask.toString('hex') };
    });
  });
  groups.push({ level: o.level, fishId: o.fishId, regionId: o.regionId, sourceSha256: o.sourceSha256, meshSha256: o.meshSha256, packName: o.pack.name, requests, sequenceCounter: o.memory.read32(o.controller + 0x5864n), playheadCounter: o.memory.read32(o.controller + 0x5868n) });
});
if (!result.passed || groups.length !== 5) throw new Error('Expected five real fish event graphs');
const report = { passed: true, executableSha256: '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', groups, scope: 'Read-only capture of the first region-triggered Disturb and any auto-start SwimAround requests in all five actual saved fish EventBarn graphs. Uses original sequence registry, PlayAnimation, sequence/request creation and real CharFishGroupAnim metadata/ranges. Mask addresses are removed for rebinding to the shared-animation comparison arena. Model/Avatar allocation remains prepared; this input capture does not claim whole creature motion or rendering.' };
const file = 'tests/fixtures/fish-group-animation-update-inputs.json', text = JSON.stringify(report, null, 2) + '\n';
if (process.argv.includes('--check')) {
  if (fs.readFileSync(file, 'utf8') !== text) throw new Error('Saved fish animation update inputs differ');
} else fs.writeFileSync(file, text);
console.log(JSON.stringify({ passed: true, groups: groups.length, checked: process.argv.includes('--check') }));
