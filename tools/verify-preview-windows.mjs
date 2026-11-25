import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import asar from '@electron/asar';
import {execFileSync} from 'node:child_process';

const archive=path.resolve(process.argv[2]??JSON.parse(await fs.readFile('docs/preview-package.json','utf8')).archive);
const hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-preview-verify-'));
try {
 const zipped=JSON.parse(execFileSync('python3',['-c',String.raw`
import hashlib,json,pathlib,struct,sys,zipfile
archive,temp=sys.argv[1:]
with zipfile.ZipFile(archive) as z:
 names=z.namelist()
 assert len(names)==len(set(names)), 'Duplicate archive paths'
 assert not any('..' in pathlib.PurePosixPath(n).parts or n.startswith('/') for n in names), 'Unsafe archive path'
 assert z.testzip() is None, 'ZIP CRC failure'
 info=next(n for n in names if n.endswith('/预览构建信息.json'))
 root=info.rsplit('/',1)[0]+'/'
 manifest=json.loads(z.read(info))
 coverage_name=root+'docs/model-coverage-verification.json'
 current_coverage=json.loads(z.read(coverage_name)) if coverage_name in names else None
 if current_coverage:
  assert current_coverage['passed']
  assert manifest['version'].startswith(current_coverage['version']+'-')
  assert manifest['modelCoverage']['viewportMaps']==33
  assert current_coverage['summary']=={k:v for k,v in manifest['modelCoverage'].items() if k in current_coverage['summary']}
  assert current_coverage['windowsRuntimeVerified'] is False
  for name,digest in current_coverage['evidenceSha256'].items():
   assert hashlib.sha256(z.read(root+name)).hexdigest()==digest, name
  pathlib.Path(temp,'model-coverage-verification.json').write_text(json.dumps(current_coverage))
 assert manifest['platform']=='win32' and manifest['architecture']=='x64'
 assert manifest['gameDataBundled'] is False
 for name,digest in manifest['payloadSha256'].items():
  if name.startswith('dist/'): continue
  assert hashlib.sha256(z.read(root+name)).hexdigest()==digest, name
 pe=z.read(root+'resources/native/sky-vulkan.exe')
 assert pe[:2]==b'MZ'
 offset=struct.unpack_from('<I',pe,0x3c)[0]
 assert pe[offset:offset+4]==b'PE\0\0' and struct.unpack_from('<H',pe,offset+4)[0]==0x8664
 assert struct.unpack_from('<H',pe,offset+24)[0]==0x20b, 'Native host must be PE32+'
 spirv=[n for n in names if n.startswith(root+'resources/vulkan-shaders/') and n.endswith('.spv')]
 assert len(spirv)==manifest['viewportShaderEntries']*2
 assert all(z.read(n)[:4]==b'\x03\x02\x23\x07' for n in spirv), 'Invalid SPIR-V magic'
 instructions=z.read(root+'使用说明.md').decode()
 assert 'FPS' in instructions and '250ms' in instructions and 'SpawnMotes' in instructions
 assert manifest['performanceOptimization']['defaultPresentation']=='canvas'
 assert manifest['performanceOptimization']['nativePresentation'] is False
 assert manifest['performanceOptimization']['frameResponseHeaderBytes']==32
 assert manifest['performanceOptimization']['finalDisplayPipeReadbacks']==1
 assert manifest['performanceOptimization']['intermediateHdrPipeReadbacks']==0
 recovery=z.read(root+'白屏恢复启动.cmd').decode('ascii')
 assert 'SKY_WINDOWS_CANVAS=1' in recovery and '--sky-canvas --disable-gpu' in recovery
 recovery_report=json.loads(z.read(root+'docs/white-screen-recovery.json'))
 assert recovery_report['passed']
 low_config=root+'docs/gt1030-performance-verification.json' in names
 if low_config:
  performance_report=json.loads(z.read(root+'docs/gt1030-performance-verification.json'))
  assert performance_report['passed']
  if root+'docs/viewport-display-verification.json' in names:
   display_report=json.loads(z.read(root+'docs/viewport-display-verification.json'))
   assert display_report['passed'] and manifest['version'].startswith(display_report['version']+'-')
   if not current_coverage: assert display_report['buildPayloadSha256']['dist/native/sky-vulkan.exe']==hashlib.sha256(pe).hexdigest()
   assert manifest['displayResolution']['defaultDesktopMode']=='balanced'
   assert manifest['displayResolution']['modes']['balanced']=={'adaptive':True,'minimumScale':.67,'maximumScale':1}
   assert manifest['displayResolution']['modes']['native']=={'adaptive':False,'scale':1}
   assert manifest['displayResolution']['staticTemporalPhases']==8
   assert manifest['displayResolution']['requestedMinimumFpsVerified'] is False
   assert display_report['display']['staticAntialiasing']['settlesAndStops']
   pathlib.Path(temp,'display-verification.json').write_text(json.dumps(display_report))
  else:
   assert manifest['version'].startswith(performance_report['version']+'-')
  if not current_coverage: assert performance_report['buildPayloadSha256']['dist/native/sky-vulkan.exe']==hashlib.sha256(pe).hexdigest()
  assert performance_report['computePixelReference']['differences']==0
  assert performance_report['vulkanValidation']['warningsAndErrors']==[]
 else:
  assert manifest['version'].startswith(recovery_report['version']+'-')
  assert recovery_report['nativeBuilds']['windowsHostSha256']==hashlib.sha256(pe).hexdigest()
 assert recovery_report['windowsRuntimeTested'] is False
 assert manifest['performanceOptimization']['defaultQuality']=='full'
 assert manifest['performanceOptimization']['fullGpuSubmissionsPerFrame']==2
 assert manifest['performanceOptimization']['fullEffectsReadbacksRemain'] is False
 assert manifest['performanceOptimization']['originalVisibilityFrustumQuery'] is True
 assert manifest['performanceOptimization']['adaptiveRenderLongEdge']==([384,1920] if low_config else [1280,1920])
 if low_config:
  assert manifest['performanceOptimization']['gt1030RenderLongEdge']==[384,1600]
  assert manifest['performanceOptimization']['hardwareFinalReadbackBytesPerPixel']==4
  assert manifest['performanceOptimization']['hardwareCloudFiltering'] is True
  assert manifest['performanceOptimization']['gpuStageTiming'] is True
 assert manifest['performanceOptimization']['maxConcurrentFrameRequests']==1
 assert manifest['performanceOptimization']['windowsHardwareFpsVerified'] is False
 pathlib.Path(temp,'app.asar').write_bytes(z.read(root+'resources/app.asar'))
 with zipfile.ZipFile('release/electron-v'+manifest['electronVersion']+'-win32-x64.zip') as runtime:
  for name in runtime.namelist():
   if name.endswith('/'): continue
   actual='SkyMapEditor.exe' if name=='electron.exe' else name
   assert hashlib.sha256(runtime.read(name)).digest()==hashlib.sha256(z.read(root+actual)).digest(), 'Electron runtime differs: '+actual
 print(json.dumps({'manifest':manifest,'zipIntegrityVerified':True,'officialRuntimePayloadVerified':True,'nativePEVerified':True,'shaderFilesVerified':len(spirv)}))
`,archive,temp],{encoding:'utf8',maxBuffer:4e6}));
 const appAsar=path.join(temp,'app.asar'),manifest=zipped.manifest;
 const official=JSON.parse(await fs.readFile('node_modules/electron/checksums.json','utf8'));
 if(manifest.electronArchiveSha256!==official[`electron-v${manifest.electronVersion}-win32-x64.zip`])throw new Error('Official Electron checksum differs');
 for(const [name,digest] of Object.entries(manifest.payloadSha256))if(name.startsWith('dist/')&&hash(asar.extractFile(appAsar,name))!==digest)throw new Error(`ASAR payload differs: ${name}`);
 const beamoEvidence=JSON.parse(await fs.readFile('docs/beamo-rsqrt-capability.json','utf8'));
 if(manifest.asarRuntimePayloadSha256?.['docs/beamo-rsqrt-capability.bin']!==beamoEvidence.binarySha256)throw new Error('Beamo runtime arithmetic manifest is absent or differs');
 for(const [name,digest] of Object.entries(manifest.asarRuntimePayloadSha256))if(hash(asar.extractFile(appAsar,name))!==digest)throw new Error(`ASAR runtime data differs: ${name}`);
 const renderer=asar.extractFile(appAsar,'dist/app.js').toString(),style=asar.extractFile(appAsar,'dist/style.css').toString(),main=asar.extractFile(appAsar,'dist/main.cjs').toString();
 if(manifest.displayResolution){
  const buildReport=JSON.parse(await fs.readFile(path.join(temp,manifest.modelCoverage?'model-coverage-verification.json':'display-verification.json'),'utf8'));
  for(const [name,digest] of Object.entries(buildReport.buildPayloadSha256)){
   if(name.startsWith('dist/native/')||name.startsWith('dist/vulkan-shaders/')){
    if(manifest.payloadSha256['resources/'+name.slice(5)]!==digest)throw new Error('Verified build native/shader payload differs: '+name);
   }else if(hash(asar.extractFile(appAsar,name))!==digest)throw new Error('Verified build ASAR payload differs: '+name);
  }
  const html=asar.extractFile(appAsar,'dist/index.html').toString();
  if(!['smooth','balanced','native'].every(mode=>html.includes(`value="${mode}"`))||!renderer.includes('temporalFramesPending')||!renderer.includes('sky.viewportResolutionMode'))throw new Error('Display presets, persistence or static temporal settling absent');
 }
 if(!renderer.includes('viewport-performance')||!style.includes('#viewport-performance')||!main.includes('SpawnMotes'))throw new Error('Current FPS/SpawnMotes implementation is absent');
 if(!renderer.includes('SkyDesktopHost')||!renderer.includes('MessageChannel')||!style.includes('desktop-native-surface')||!main.includes('SKY_WIN32_PARENT'))throw new Error('Windows native presentation implementation is absent');
 if(!main.includes('SKY_WINDOWS_NATIVE')||!main.includes('--sky-canvas')||!main.includes('render-diagnostics.log'))throw new Error('White-screen recovery implementation is absent');
 const archiveBytes=await fs.readFile(archive),archiveSha256=hash(archiveBytes),sidecar=await fs.readFile(archive+'.sha256','utf8');
 if(sidecar.split(/\s+/)[0]!==archiveSha256)throw new Error('Archive sidecar checksum differs');
 const {manifest:ignored,...checks}=zipped;
 const report={passed:true,archive,archiveBytes:archiveBytes.length,archiveSha256,...checks,asarPayloadVerified:true,beamoRuntimeArithmeticVerified:true,currentFeaturesVerified:true,windowsRuntimeVerified:false};
 await fs.writeFile('docs/preview-package-verification.json',JSON.stringify(report,null,2)+'\n');
 console.log(JSON.stringify(report));
}finally{await fs.rm(temp,{recursive:true,force:true});}
