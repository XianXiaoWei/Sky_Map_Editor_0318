import test from 'node:test';
import assert from 'node:assert/strict';
import { verifyFishGroupSceneEvents } from '../tools/fish-group-scene-cases';
test('All five saved fish event graphs trigger original two-action requests and re-enable through the same EventBarn', () => {
  const report = verifyFishGroupSceneEvents(); assert.equal(report.groups, 5); assert.equal(report.completeCreatureClasses, 0); assert.equal(report.newArchives, 0);
});
