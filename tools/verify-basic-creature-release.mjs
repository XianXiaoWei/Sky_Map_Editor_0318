import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import asar from '@electron/asar';
import {execFileSync} from 'node:child_process';
const hash=b=>crypto.createHash('sha256').update(b).digest('hex'),build=JSON.parse(await fs.readFile('docs/basic-creature-package.json','utf8')),temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-basic-release-check-'));
try{
 const manifest=JSON.parse(execFileSync('python3',['-c',String.raw`import sys,json,pathlib,zipfile,hashlib,struct
with zipfile.ZipFile(sys.argv[1]) as z:
 names=z.namelist();assert len(names)==len(set(names));assert not any('..' in pathlib.PurePosixPath(n).parts or n.startswith('/') for n in names);assert z.testzip() is None
 info=next(n for n in names if n.endswith('/预览构建信息.json'));root=info.rsplit('/',1)[0]+'/';m=json.loads(z.read(info));assert m['platform']=='win32' and m['architecture']=='x64';assert m['gameDataBundled'] is False;assert m['windowsRuntimeVerified'] is False
 for name,digest in {**m['runtimePayloadSha256'],**m['evidenceSha256'],**m['payloadSha256']}.items():
  if name.startswith('dist/'):continue
  assert hashlib.sha256(z.read(root+name)).hexdigest()==digest,name
 report=json.loads(z.read(root+'docs/basic-creature-verification.json'));assert report['passed'];assert report['summary']==m['summary'];assert report['tests']==m['tests'];assert len(report['viewportMaps'])>=4;assert report['viewportShaderCoveragePassed'];assert report['viewportShaderMaps']==33
 shadercheck=json.loads(z.read(root+'docs/viewport-shader-bundle-verification.json'));assert shadercheck['passed'] and len(shadercheck['maps'])==33 and not shadercheck['misses'] and shadercheck['profileRemainedEmpty'] and not shadercheck['compilerExecutablesAvailable']
 for evidence in ['model-distance-lod-oracle.json','model-lod-viewport-smoke.json','ignition-ui-smoke.json','transform-visibility-smoke.json','final-focused-verification.json','performance-basic-final.json']:
  assert json.loads(z.read(root+'docs/'+evidence))['passed'],evidence
 native=z.read(root+'resources/native/sky-vulkan.exe');off=struct.unpack_from('<I',native,0x3c)[0];assert native[:2]==b'MZ' and native[off:off+4]==b'PE\0\0' and struct.unpack_from('<H',native,off+4)[0]==0x8664
 shaders=[n for n in names if n.startswith(root+'resources/vulkan-shaders/') and n.endswith('.spv')];assert len(shaders)>=190;assert all(z.read(n)[:4]==b'\x03\x02\x23\x07' for n in shaders)
 pathlib.Path(sys.argv[2],'app.asar').write_bytes(z.read(root+'resources/app.asar'));pathlib.Path(sys.argv[2],'verification.json').write_text(json.dumps(report))
 if m['runtimeSource']['kind']=='previous-independently-verified-official-runtime':
  with zipfile.ZipFile(m['runtimeSource']['archive']) as original:
   prefix=next(n for n in original.namelist() if n.endswith('/预览构建信息.json')).rsplit('/',1)[0]+'/'
   for name in m['runtimePayloadSha256']:assert original.read(prefix+name)==z.read(root+name),name
 else:
  with zipfile.ZipFile('release/electron-v'+m['electronVersion']+'-win32-x64.zip') as original:
   for name in m['runtimePayloadSha256']:assert original.read('electron.exe' if name=='SkyMapEditor.exe' else name)==z.read(root+name),name
 print(json.dumps(m))
`,build.archive,temp],{encoding:'utf8',maxBuffer:2e6}));
 const official=JSON.parse(await fs.readFile('node_modules/electron/checksums.json','utf8'));assert.equal(manifest.electronArchiveSha256,official[`electron-v${manifest.electronVersion}-win32-x64.zip`]);
 const app=path.join(temp,'app.asar');for(const [file,digest] of Object.entries({...manifest.payloadSha256,...manifest.asarRuntimePayloadSha256}))if(file.startsWith('dist/')||file.startsWith('docs/'))assert.equal(hash(asar.extractFile(app,file)),digest,file);
 const renderer=asar.extractFile(app,'dist/app.js').toString(),html=asar.extractFile(app,'dist/index.html').toString();for(const feature of ['basicCreatures','creatureResource','creatureEffect','sampleCreaturePath','creature-pause','creature-stop','solveOriginalFloppySpine','DARK_CREATURE_MODEL_SCALE','poseModifier','MoteStream','MoteAnim','crabGroundContact','projectDarkSearchEffect'])assert.ok(renderer.includes(feature),feature);assert.ok(html.includes('creature-pause')&&html.includes('creature-stop'));
 const main=asar.extractFile(app,'dist/main.cjs').toString(),css=asar.extractFile(app,'dist/style.css').toString();for(const feature of ['ViewportModelLod','selectOriginalBeamoDistanceLod','UIFlame','UIRingBigThin','createAtmosphereRaySampler','uniformWriters'])assert.ok(main.includes(feature),feature);assert.ok(renderer.includes('nativeIcon')&&renderer.includes('ignition-action'));assert.equal(css.includes('.ignition-flame'),false);
 const digest=hash(await fs.readFile(build.archive));assert.equal(digest,build.archiveSha256);assert.equal((await fs.readFile(build.archive+'.sha256','utf8')).split(/\s+/)[0],digest);
 const report={passed:true,archive:build.archive,archiveSha256:digest,zipIntegrityVerified:true,officialRuntimePayloadVerified:true,asarPayloadVerified:true,evidencePayloadVerified:true,nativePEVerified:true,shaderFilesVerified:true,basicCreatureControlsVerified:true,windowsRuntimeVerified:false};await fs.writeFile('docs/basic-creature-package-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
}finally{await fs.rm(temp,{recursive:true,force:true});}
