import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';
import {candleLoadCases,evaluateCandleLoadCase} from '../tools/candle-load-cases';
test('Candle/Flame load and unload, pool/aliasing, multi-frame consumption, ignition/audio, whole Render and Flame motion/light prefix match original executable',()=>{
 const fixture=JSON.parse(fs.readFileSync('tests/fixtures/candle-load-native.json','utf8')),cases=candleLoadCases();assert.equal(fixture.passed,true);assert.equal(fixture.cases.length,cases.length);
 for(const [i,c] of cases.entries()){
  const actual=evaluateCandleLoadCase(c.arena),expected=fixture.cases[i];assert.equal(c.name,expected.name);
  assert.equal(actual.readUInt32LE(0),expected.line,c.name);assert.equal(actual.readUInt32LE(4),expected.severity,c.name);assert.equal(actual.readUInt32LE(8),expected.calls,c.name);
  assert.equal(crypto.createHash('sha256').update(actual).digest('hex'),expected.nativeSha256,c.name);
 }
});
