import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync,gzipSync} from 'node:zlib';
const source=fs.readFileSync('tests/fixtures/beamo-upload-native.json.gz'),fixture=JSON.parse(gunzipSync(source));
const cases=fixture.cases.filter(c=>c.input.label.startsWith('SkyHub2/')&&fixture.resources[c.input.resourceKey].lod===0);
const resources=Object.fromEntries([...new Set(cases.map(c=>c.input.resourceKey))].map(key=>[key,fixture.resources[key]]));
fs.writeFileSync('tests/fixtures/beamo-draw-native.json.gz',gzipSync(JSON.stringify({scope:'Unmodified original SkyHub2 LOD0 oracle observations; extracted from the previously verified complete native upload fixture.',sourceSha256:crypto.createHash('sha256').update(source).digest('hex'),executableSha256:fixture.executableSha256,fallback:fixture.fallback,cases,resources}),{level:9}));
console.log({cases:cases.length,resources:Object.keys(resources).length});
