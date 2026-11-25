// Supplies raw real-map bytes/masks to the native oracle. Unknown native storage
// is not passed off as initialized data; the original constructor runs first.
import fs from 'node:fs';
import path from 'node:path';
import { ObjectsDocument } from '../src/core/objects';
import { describeLevelEnvironment } from '../src/core/environment-level';
import { readEnvironmentStorage } from '../src/core/environment-storage';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const levels = fs.readdirSync(path.join(data, 'Levels')).map(level => {
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data, 'Levels', level, 'Objects.level.bin'))), plan = describeLevelEnvironment(doc.nodes);
  if (!plan.complete) throw new Error(`${level}: ${plan.issues.join('；')}`);
  return { level, nodes: plan.queue.map(entry => {
    const node = doc.nodes.find(node => node.id === entry.nodeId)!, storage = readEnvironmentStorage(node), r = entry.registration!;
    return { id: node.id, layer: r.layer, enabled: r.state.enabled, hull: entry.region!.hull,
      timing: { fadeIn: r.fadeIn, fadeOut: r.fadeOut, duration: r.duration },
      values: Object.fromEntries(entry.groups.map(group => [group.className, Object.fromEntries(group.fields.map(field => [field.name, field.rawHex]))])),
      storageHex: Buffer.from(storage.storage).toString('hex'), knownHex: Buffer.from(storage.known).toString('hex') };
  }) };
});
process.stdout.write(JSON.stringify(levels));
