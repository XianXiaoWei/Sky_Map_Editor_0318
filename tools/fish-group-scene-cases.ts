import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import { ObjectsDocument, type ObjectNode } from '../src/core/objects';
import { PreparedEnvironmentEventOwner } from '../src/core/environment-event-owner';
import { EnvironmentRuntime } from '../src/core/environment-runtime';
import { AssetCatalog } from '../src/main/assets';
import { readResourceMesh } from '../src/core/resources';
import { loadOriginalAnimationSequenceRegistry } from '../src/core/animation-sequence-registry';
import { playOriginalAnimationSequence } from '../src/core/resource-animation-sequence';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';
import { resourceAnimationClipForRange, resourceAnimationHasRange, resourceAnimationLoopSigns } from '../src/core/resource-animation-loop';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
import audit from '../docs/fish-group-map-audit.json';
import type { ModelBakeMemory } from '../src/core/model-baked-runtime';
import type { ResourceAnimationPack } from '../src/core/resource-animation';

export interface FishGroupRequestObservation {
  level: string; fishId: number; regionId: number; sourceSha256: string; meshSha256: string;
  name: string; controller: bigint; memory: ModelBakeMemory; pack: ResourceAnimationPack;
}

const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
export function verifyFishGroupSceneEvents(data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', observeRequests?: (observation: FishGroupRequestObservation) => void) {
  const results = [];
  for (const group of audit.groups) {
    const file = path.join(data, 'Levels', group.level, 'Objects.level.bin'), source = fs.readFileSync(file), doc = new ObjectsDocument(source), byId = new Map(doc.nodes.map(n => [n.id, n]));
    const regionRow = group.regions[0], ids = new Set<number>();
    const visit = (id: number) => {
      if (ids.has(id)) return; ids.add(id); const node = byId.get(id); assert.ok(node);
      const fields = (rows: ObjectNode['fields']) => { for (const f of rows) { if (f.kind === 'reference' && f.value !== 0xffffffff) visit(Number(f.value)); fields(f.children ?? []); } };
      fields(node.fields);
    };
    visit(regionRow.region.id); group.playAnimationEvents.forEach(n => visit(n.id));
    const runtime = new EnvironmentRuntime([{ name: 'SceneEventVerification', fields: [], output: {} }], []), nodes = doc.nodes.filter(n => ids.has(n.id));
    const owner = new PreparedEnvironmentEventOwner(runtime, nodes, group.level), state = owner.objects, m = state.runtimeMemory;
    assert.equal(owner.info().find(e => e.id === regionRow.region.id)?.available, false);
    const catalog = new AssetCatalog(data, group.level), meshSource = fs.readFileSync(catalog.meshFile('CharFishGroupAnim')), pack = readResourceMesh(meshSource).animation!;
    assert.equal(sha(meshSource), group.model.meshSha256);
    const registry = loadOriginalAnimationSequenceRegistry(m, n => state.allocate(n)), controller = state.allocate(0x6300), model = state.allocate(0x500), packRecord = state.allocate(0x100);
    m.bytes(packRecord, new TextEncoder().encode(pack.name + '\0').length).set(new TextEncoder().encode(pack.name + '\0'));
    m.write32(packRecord + 0x50n, pack.sampleRate); m.write64(controller + 0x6018n, packRecord); m.write32(controller + 0x6220n, 1); m.write64(controller + 0x6020n, packRecord);
    m.write64(model + 104n, controller); m.bytes(model + 0x160n, 64).set(state.transform(group.fish.id));
    m.write64(state.require(group.fish.id).pointer + 0x228n, model);
    for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < pool.capacity; i++) m.write64(controller + BigInt(pool.first + i * 0x70 + 0x68), state.allocate(32));
    const sequenceServices = {
      registry, list: catalog.animationList(), packs: [pack], hasRange: (_p: bigint, start: number, end: number) => resourceAnimationHasRange(pack, start, end),
      clipForRange: (_p: bigint, start: number, end: number) => resourceAnimationClipForRange(pack, start, end),
      loopSigns: (_p: bigint, start: number, length: number, mask: bigint) => { const signs = resourceAnimationLoopSigns(pack, start, length, m.bytes(mask, Math.ceil(pack.bones.length / 8))); m.bytes(mask, signs.mask.length).set(signs.mask); return signs.negative; },
    };
    const avatarBarn = state.allocate(32 + 16 * 0x2230), avatars: bigint[] = [], physics: bigint[] = [];
    for (let i = 0; i < 16; i++) { const avatar = avatarBarn + 32n + BigInt(i * 0x2230), body = state.allocate(32); avatars.push(avatar); physics.push(body); m.write64(avatar + 24n, body); m.write8(avatar + 0x1ef8n, +(i === 0)); }
    const setPosition = (p: number[]) => p.concat(1).forEach((n, i) => m.write32(physics[0] + 16n + BigInt(i * 4), bits(n)));
    const plays: { name: string; index: number; requests: number; first: number; snapshot: number[] }[] = [];
    const unexpected = (): never => { throw new Error('Saved fish scene invoked an unprepared animation branch'); };
    owner.attachSceneEventServices({ avatarBarn, avatarBarnReady: () => 1, activeAvatarCount: () => 1, avatarAt: (_barn, i) => avatars[i], avatarEnabled: () => 0, cameraPosition: unexpected, initialPositionWBits: () => bits(0), animation: {
      defaultAnimation: unexpected, currentAnimation: unexpected, setSpeed: unexpected, playNamed: unexpected,
      playSequence: (animation, name, weight, speed, flags) => {
        assert.equal(animation, controller); const first = m.read32(controller + 12n), index = playOriginalAnimationSequence(m, controller, m.string(name), value(weight), value(speed), flags, sequenceServices);
        const count = m.read32(controller + 12n), snapshot: number[] = []; for (let i = first; i < count; i++) { const p = controller + 0x4298n + BigInt(i * 0x70); snapshot.push(m.read32(p+36n), m.read32(p + 40n), m.read32(p + 28n), m.read32(p + 32n)); }
        plays.push({ name: m.string(name), index, requests: count - first, first, snapshot });
        observeRequests?.({ level: group.level, fishId: group.fish.id, regionId: regionRow.region.id, sourceSha256: sha(source), meshSha256: sha(meshSource), name: m.string(name), controller, memory: m, pack });
      },
    } });
    assert.ok(owner.info().find(e => e.id === regionRow.region.id)?.available);
    const marker = state.require(regionRow.markers[0].id), transform = new DataView(state.transform(marker.node.id).buffer), center = [48, 52, 56].map(at => transform.getFloat32(at, true));
    assert.ok(center.some(n => n !== 0)); setPosition(center.map(n => n + 1000)); owner.tick();
    const autoStartCount=group.playAnimationEvents.filter(n=>n.fields.some(f=>f.name==='autoStart'&&f.value===1)).length;
    assert.equal(plays.length, autoStartCount);assert.ok(plays.every(p=>p.name==='SwimAround'));
    setPosition(center); owner.tick(); owner.tick();
    assert.deepEqual(plays.slice(autoStartCount).map(p => [p.name, p.index, p.requests]), [['Disturb', 489, 3]]);
    assert.equal(owner.info().find(e => e.id === regionRow.region.id)?.running, false);
    const firstRequest = controller + 0x4298n+BigInt(plays[autoStartCount].first*0x70); assert.equal(m.read32(firstRequest+36n), 60); assert.equal(m.read32(firstRequest + 40n), 30);
    const secondRequest = firstRequest + 0x70n; assert.equal(m.read32(secondRequest+36n), 0); assert.equal(m.read32(secondRequest + 40n), 60);
    // Native scheduling appends two actions and a fallback; actual pose
    // advancement/mixing is outside this EventBarn/requests verification.
    let frames = 0; while ((owner.info().find(e => e.id === regionRow.region.id)?.starts ?? 0) < 2 && frames < 100) { owner.advance(0.05); frames++; }
    assert.ok(frames >= 79 && frames <= 83, 'Four-second Delay must re-enable the same original OnRegion');
    owner.tick(); owner.tick(); assert.equal(plays.length, autoStartCount+2); assert.equal(plays[autoStartCount+1].index, 489);
    const swim = group.playAnimationEvents.find(n => n.fields.some(f => f.name === 'animationSequenceName' && f.value === 'SwimAround'))!;
    owner.trigger(swim.id); assert.equal(plays.at(-1)?.index, 488);
    const after = owner.info().filter(e => [regionRow.region.id, regionRow.restartDelay.id, swim.id].includes(e.id));
    owner.dispose(); assert.ok(owner.info().every(e => !e.running && !e.pending));
    assert.deepEqual(doc.serialize(), source); assert.equal(sha(fs.readFileSync(file)), sha(source));
    results.push({ level: group.level, fishId: group.fish.id, regionId: regionRow.region.id, delayId: regionRow.restartDelay.id, nodes: nodes.length, sourceSha256: sha(source), delayFramesAtDelta005: frames, plays, events: after, originalSourceUnchanged: true });
  }
  return { passed: true, groups: results.length, cases: results, scope: 'All five actual fish event graphs in three maps use shared prepared object memory and original EventBarn Update/dispatch, OnRegion, Marker matrices/tolerant OBB, PlayAnimation, four-second Delay, full original sequence registry and real CharFishGroupAnim action/range/loop request creation. AvatarBarn input and Model/Animation allocation are explicit prepared services. This verifies graph scheduling, re-enable and request records; Animation update/pose mixing, native Model resource lifecycle, MoveObjectAlongRail, viewport rendering and Windows machine acceptance remain pending.', completeCreatureClasses: 0, newArchives: 0 };
}
