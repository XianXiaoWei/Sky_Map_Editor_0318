import fs from 'node:fs';
import { verifyFishGroupSceneEvents } from './fish-group-scene-cases';
const report = verifyFishGroupSceneEvents();
fs.writeFileSync('docs/fish-group-scene-events.json', JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify(report));
