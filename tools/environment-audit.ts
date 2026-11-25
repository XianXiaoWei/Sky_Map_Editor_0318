import fs from 'node:fs';
import path from 'node:path';
import { ObjectsDocument } from '../src/core/objects';
import { describeEnvironment } from '../src/core/environment-storage';
import { describeLevelEnvironment } from '../src/core/environment-level';

const data = process.argv[2] ?? process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const levels = fs.readdirSync(path.join(data, 'Levels')).map(level => {
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data, 'Levels', level, 'Objects.level.bin')));
  const plan = describeLevelEnvironment(doc.nodes);
  return { level, queue: { complete: plan.complete, issues: plan.issues, nodeIds: plan.queue.map(entry => entry.nodeId), eventObjects: plan.eventObjects },
    nodes: doc.nodes.filter(node => ['EnvNode', 'SetEnvDefault', 'SetEnvHull'].includes(node.className)).map(node => describeEnvironment(node, doc.nodes)) };
});
const nodes = levels.flatMap(level => level.nodes), summary = { levels: levels.length, environmentNodes: nodes.length, completeDerivedNodes: nodes.filter(node => node.derived.every(field => field.value !== null)).length,
  parameterGroups: nodes.reduce((n, node) => n + node.groups.length, 0), completeParameterGroups: nodes.reduce((n, node) => n + node.groups.filter(group => group.complete).length, 0),
  parameterFields: nodes.reduce((n, node) => n + node.groups.reduce((sum, group) => sum + group.fields.length, 0), 0), completeParameterFields: nodes.reduce((n, node) => n + node.groups.reduce((sum, group) => sum + group.fields.filter(field => field.complete).length, 0), 0),
  nodeRegistrationInputs: nodes.filter(node => node.registration !== null).length,
  appliedDefaultFields: nodes.reduce((sum, node) => sum + node.defaultsApplied.length, 0),
  directRegions: nodes.filter(node => node.region?.kind === 'direct').length,
  completeDirectRegions: nodes.filter(node => node.region?.kind === 'direct' && node.region.complete).length,
  clumpRegions: nodes.filter(node => node.region?.kind === 'clump').length,
  completeClumpRegions: nodes.filter(node => node.region?.kind === 'clump' && node.region.complete).length,
  clumpMarkers: nodes.reduce((sum, node) => sum + (node.region?.markers.length ?? 0), 0),
  completeCreationQueues: levels.filter(level => level.queue.complete).length,
  maximumQueuedNodes: Math.max(...levels.map(level => level.queue.nodeIds.length)) };
// JSON cannot represent non-finite reciprocals. Preserve them as strings.
fs.writeFileSync('docs/environment-audit.json', JSON.stringify({ summary, limitation: 'Converted fields only; no complete camera environment evaluation or rendered output.', levels }, (_, value) => typeof value === 'number' && !Number.isFinite(value) ? String(value) : value, 2));
console.log(JSON.stringify(summary));
