"""Bind FishV2 AI, actual steering/Update compositions and project checks."""
import collections,datetime,gzip,hashlib,json,re,struct,sys
from pathlib import Path
from native import Native
root=Path(__file__).resolve().parents[1];logs=Path('/root/sky-research')
def read(file):return json.loads((root/file).read_text())
def tests(file,command):
 text=(logs/file).read_text()
 def count(name):
  found=re.findall(r'^# '+name+r' (\d+)$',text,re.M);assert len(found)==1,(file,name);return int(found[0])
 total=count('tests');assert total==count('pass') and count('fail')==count('cancelled')==count('skipped')==0,file
 return {'passed':True,'tests':total,'command':command,'log':str(logs/file)}
project=tests('fish-ai-final-tests.log','./node_modules/.bin/tsx --test tests/*.test.ts')
focused=tests('fish-ai-focused.log','./node_modules/.bin/tsx --test tests/fish-ai-runtime.test.ts tests/fish-update-runtime.test.ts tests/creature-force-runtime.test.ts')
assert (logs/'fish-ai-final-types.log').read_text()==''
assert (logs/'fish-ai-windows-build.log').read_text().rstrip().endswith('Built dist/')
old=read('docs/creature-continuation-verification.json');oracle=read('docs/fish-ai-oracle.json');evidence=read('docs/fish-ai-native.json')
assert oracle['passed'] and oracle['comparedCases']==oracle['cases']==1460 and oracle['failures']==[]
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
assert oracle['executableSha256']==old['executableSha256']==evidence['executableSha256']==n.digest
assert oracle['functions']==evidence['functions']
for name,f in evidence['functions'].items():
 start,end=int(f['start'],16),int(f['end'],16);assert n.bounds(start)==(start,end)
 assert f['wholeFunction'] is True and hashlib.sha256(n.read(start,end-start)).hexdigest()==f['codeSha256']
 code_end=int(f['codeEnd'],16) if 'codeEnd' in f else None
 assert (root/f['assembly']).read_text()==n.annotated(start,code_end)
 assert len(n.instructions(start,code_end))==f['instructions']
 if code_end:
  assert n.read(code_end,20).hex()==f['switchTableHex'] and n.read(code_end+20,end-code_end-20).hex()==f['trailingPaddingHex']
  assert all(code_end+struct.unpack('<i',n.read(code_end+4*i,4))[0] in {ins.address for ins in n.instructions(start,code_end)} for i in range(5))
fixture=json.loads(gzip.decompress((root/'tests/fixtures/fish-ai-native.json.gz').read_bytes()))
assert len(fixture['cases'])==1460 and fixture['executableSha256']==n.digest and len(fixture['nativeArithmetic'])==16
modes=collections.Counter(row['input']['mode'] for row in fixture['cases'])
assert modes=={0:859,1:58,2:63,3:8,4:8,5:140,6:294,7:30}
assert oracle['caseBreakdown']=={str(k):v for k,v in modes.items()}
code=(root/'dist/native/sky-vulkan.exe').read_bytes();pe=struct.unpack_from('<I',code,0x3c)[0]
assert code[pe:pe+4]==b'PE\0\0' and struct.unpack_from('<H',code,pe+4)[0]==0x8664
inventory=read('docs/Objects.level.bin类进度.json');assert inventory['summary']['brokenReferences']==inventory['summary']['completeRuntimeClasses']==0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
source=read('docs/windows-source-plan.json');paths={entry['path'] for entry in source['entries']}
required=['src/core/fish-ai-runtime.ts','src/core/creature-force-runtime.ts','tools/fish-ai-cases.ts','tools/fish-ai-oracle.ts','tools/native-fish-ai-oracle.c','tools/reverse-fish-ai.py','tools/verify-fish-ai.py','tests/fish-ai-runtime.test.ts','tests/fixtures/fish-ai-native.json.gz','docs/fish-ai-native.json','docs/fish-ai-oracle.json','docs/fish-ai-verification.json','docs/FishV2-AI与转向力组合验证.md','docs/鱼群触发链与FishV2更新续接.md','tools/objects-class-progress-spec.json']
assert set(required)<=paths
for key in ['includesAndroidHost','buildOutputsIncluded','nodeModulesIncluded','cacheIncluded']:assert source[key] is False
remaining=['CharFishGroupAnim OnRegion/Delay/PlayAnimation/MoveObjectAlongRail EventBarn and scene composition, actual sequence registry binding and autonomous viewport behavior','DarkCreature outer Update remainder 0x10026e7da..0x10026ffc0, including look direction/material/lighting/audio/interactions','Crab whole outer Update 0x10025bc10 and original ground/world/interaction/resource owners','FishV2 real world avoidance/collision, metadata/Avatar/OBB/rail geometry, Model/animation/light/surface/audio/particle/player/interaction and Barn lifecycle owners','Autonomous viewport creature behavior, stopping, level switches, repeated loading/unload and Windows hardware acceptance']
artifacts=[f for f in required if f!='docs/fish-ai-verification.json']+[f['assembly'] for f in evidence['functions'].values()]
r={'passed':True,'updatedUtc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'executableSha256':n.digest,'nativeReport':'docs/fish-ai-oracle.json','nativeCases':oracle['cases'],'nativeCaseBreakdown':{'wholeAIWithObservedServices':modes[0],'wholePursuit':modes[1],'wholeAccumulatingAvoidance':modes[2],'wholeNeighborPredicate':modes[3],'wholeFlockPredicate':modes[4],'productionUpdateWithAIAndMovement':modes[5],'productionAIWithSteering':modes[6],'productionUpdateWithAIAndMovementAndSteering':modes[7]},'nativeComparedBytes':oracle['comparedBytes'],'nativeServiceCalls':oracle['serviceCalls'],'nativeCodeHashesBoundariesAndAssemblyVerified':True,'implementedWholeFunctionCount':5,'wholeFishV2AiVerified':True,'productionUpdateWithActualAIAndSteeringVerified':True,'nativeScope':oracle['scope'],'baselineRegression':old['projectRegression'],'focusedRegression':focused,'projectRegression':project,'typecheck':{'passed':True,'command':'./node_modules/.bin/tsc --noEmit','log':str(logs/'fish-ai-final-types.log')},'windowsBuild':{'passed':True,'command':'node tools/build.mjs --windows','log':str(logs/'fish-ai-windows-build.log'),'windowsMachineRuntimeTested':False,'machine':'AMD64','binarySha256':hashlib.sha256(code).hexdigest()},'windowsSourcePlan':{'passed':True,'command':'python3 tools/package-windows-source.py --plan','report':'docs/windows-source-plan.json','log':str(logs/'fish-ai-windows-source-plan.log'),'includesNewRuntimeAndNativeFixtures':True,'androidHostIncluded':False,'buildOutputsIncluded':False,'nodeModulesIncluded':False,'cacheIncluded':False},'inventory':{**old['inventory'],'coreSubchainVerifiedClasses':inventory['summary']['coreSubchainVerifiedClasses'],'log':str(logs/'fish-ai-class-progress.log')},'categoryCensus':{**old['categoryCensus'],'log':str(logs/'fish-ai-category-census.log')},'fishGroupMapAudit':old['fishGroupMapAudit'],'completeCreatureClasses':0,'autonomousViewportCreatureAcceptancePassed':False,'newWindowsArchiveCreated':False,'newSourceArchiveCreated':False,'androidWorkPerformed':False,'packagingReadiness':'Windows build passes. Whole FishV2 AI and actual Update/movement/steering compositions compare against original code. User requires completed creatures before packaging; CharFishGroupAnim scene chain, DarkCreature/Crab outer updates, real world/resource/lifecycle and Windows hardware acceptance remain pending. No packaging date is established.','remaining':remaining,'artifactSha256':{f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in artifacts}}
(root/'docs/fish-ai-verification.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
reports=list(dict.fromkeys(old['nativeReports']+['docs/fish-ai-oracle.json']))
assert all(read(f)['passed'] and read(f)['executableSha256']==n.digest for f in reports)
updated={**old,'updatedUtc':r['updatedUtc'],'priorFishUpdatePhase':{key:old[key] for key in ['updatedUtc','newNativeReports','newNativeCases','newNativeComparedBytes','newNativeServiceCalls','focusedRegression','projectRegression','typecheck','windowsBuild']},'nativeReports':reports,'newNativeReports':['docs/fish-ai-oracle.json'],'newNativeCases':r['nativeCases'],'newNativeComparedBytes':r['nativeComparedBytes'],'newNativeServiceCalls':r['nativeServiceCalls'],'nativeScope':r['nativeScope'],'baselineRegression':r['baselineRegression'],'focusedRegression':focused,'projectRegression':project,'typecheck':r['typecheck'],'windowsBuild':r['windowsBuild'],'windowsSourcePlan':r['windowsSourcePlan'],'inventory':r['inventory'],'categoryCensus':r['categoryCensus'],'remaining':remaining,'packagingReadiness':r['packagingReadiness'],'latestPhaseReport':'docs/fish-ai-verification.json','wholeFishV2AiVerified':True,'productionUpdateWithActualAIAndSteeringVerified':True}
all_artifacts=list(dict.fromkeys(list(old['artifactSha256'])+artifacts+['docs/fish-ai-verification.json']))
updated['artifactSha256']={f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in all_artifacts}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'passed':True,'nativeCases':r['nativeCases'],'nativeComparedBytes':r['nativeComparedBytes'],'nativeCalls':r['nativeServiceCalls'],'projectTests':project['tests'],'focusedTests':focused['tests'],'completeCreatureClasses':0,'newWindowsArchiveCreated':False}))
