"""Bind FishV2 native comparisons and project checks to their concrete files."""
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

project=tests('fish-update-final-tests.log','./node_modules/.bin/tsx --test tests/*.test.ts')
focused=tests('fish-update-focused.log','./node_modules/.bin/tsx --test tests/fish-update-runtime.test.ts tests/creature-lifecycle-runtime.test.ts tests/play-animation-runtime.test.ts')
assert (logs/'fish-update-final-types.log').read_text()==''
assert (logs/'fish-update-windows-build.log').read_text().rstrip().endswith('Built dist/')
old=read('docs/creature-continuation-verification.json');oracle=read('docs/fish-update-oracle.json');evidence=read('docs/fish-update-native.json');maps=read('docs/fish-group-map-audit.json')
assert oracle['passed'] and oracle['comparedCases']==oracle['cases']==493 and oracle['failures']==[]
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
assert oracle['executableSha256']==old['executableSha256']==evidence['executableSha256']==n.digest
assert oracle['functions']==evidence['functions']
for name,f in evidence['functions'].items():
 start,end=int(f['start'],16),int(f['end'],16);assert n.bounds(start)==(start,end)
 assert hashlib.sha256(n.read(start,end-start)).hexdigest()==f['codeSha256']
 code_end=int(f['codeEnd'],16) if 'codeEnd' in f else None
 assert (root/f['assembly']).read_text()==n.annotated(start,code_end)
 assert len(n.instructions(start,code_end))==f['instructions']
 if name=='FishV2.AI':
  assert f['implemented'] is False and f['wholeFunction'] is False
  table=f['switchTable'];address=int(table['start'],16)
  assert address==code_end and n.read(address,20).hex()==table['hex']
  assert [hex(address+struct.unpack('<i',n.read(address+4*i,4))[0]) for i in range(5)]==table['targets']
  assert n.read(address+20,end-address-20).hex()==f['trailingPaddingHex']
 else:assert f['wholeFunction'] is True
fixture=json.loads(gzip.decompress((root/'tests/fixtures/fish-update-native.json.gz').read_bytes()))
assert len(fixture['cases'])==493 and fixture['executableSha256']==n.digest and len(fixture['nativeArithmetic'])==16
breakdown=collections.Counter(row['input']['mode'] for row in fixture['cases'])
assert maps['passed'] and maps['summary']=={'maps':33,'fishGroups':5,'regionTriggers':5,'playAnimationEvents':10,'movementEvents':5,'restartDelays':5,'fishV2Instances':0,'completeCreatureClasses':0}
assert all(f['sourceUnchanged'] for f in maps['files'])
assert all(g['savedReferenceGraphVerified'] and not g['completeRuntime'] and not g['sequenceRegistryBindingVerified'] and not g['autonomousViewportBehaviorVerified'] for g in maps['groups'])
inventory=read('docs/Objects.level.bin类进度.json');assert inventory['summary']['brokenReferences']==inventory['summary']['completeRuntimeClasses']==0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
source=read('docs/windows-source-plan.json');paths={entry['path'] for entry in source['entries']}
required=['src/core/fish-update-runtime.ts','tools/fish-update-cases.ts','tools/fish-update-oracle.ts','tools/native-fish-update-oracle.c','tools/reverse-fish-update.py','tools/verify-fish-update.py','tools/fish-group-map-audit.ts','tests/fish-update-runtime.test.ts','tests/fixtures/fish-update-native.json.gz','docs/fish-update-native.json','docs/fish-update-oracle.json','docs/fish-group-map-audit.json','docs/fish-update-verification.json','docs/鱼群触发链与FishV2更新续接.md']
assert set(required)<=paths
for f in ['includesAndroidHost','buildOutputsIncluded','nodeModulesIncluded','cacheIncluded']:assert source[f] is False
code=(root/'dist/native/sky-vulkan.exe').read_bytes();pe=struct.unpack_from('<I',code,0x3c)[0]
assert code[pe:pe+4]==b'PE\0\0' and struct.unpack_from('<H',code,pe+4)[0]==0x8664
remaining=['FishV2 whole AI 0x100335a40..0x1003370c0, including original neighbor/target/steering and state consumers','CharFishGroupAnim OnRegion/Delay/PlayAnimation/MoveObjectAlongRail EventBarn and scene composition, actual sequence registry binding and autonomous viewport behavior','DarkCreature outer Update remainder 0x10026e7da..0x10026ffc0, including look direction/material/lighting/audio/interactions','Crab whole outer Update 0x10025bc10 and original ground/world/interaction/resource owners','Real scene/Bird hit/Avatar/rail geometry/audio/interaction/particle/network/Barn lifecycle and Model/animation/GPU owners','Autonomous viewport behavior, stopping, level switches, repeated loading/unload and Windows hardware acceptance']
artifacts=[file for file in required if file!='docs/fish-update-verification.json']+['tools/objects-class-progress-spec.json']+[f['assembly'] for f in evidence['functions'].values()]
r={'passed':True,'updatedUtc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'executableSha256':n.digest,'nativeReport':'docs/fish-update-oracle.json','nativeCases':493,'nativeCaseBreakdown':{'wholeUpdateWithObservedServices':breakdown[0],'wholeTurnDirection':breakdown[1],'wholeBank':breakdown[2],'wholeMotionTransform':breakdown[3],'wholeUpdateWithUnmodifiedProductionMovementComposition':breakdown[4]},'nativeComparedBytes':oracle['comparedBytes'],'nativeServiceCalls':oracle['serviceCalls'],'nativeCodeHashesBoundariesAndAssemblyVerified':True,'implementedWholeFunctionCount':4,'wholeFishV2UpdateVerified':True,'wholeFishV2AiVerified':False,'nativeScope':oracle['scope'],'fishGroupMapAudit':{'passed':True,'report':'docs/fish-group-map-audit.json','summary':maps['summary'],'scope':maps['scope'],'sequenceRegistryBindingVerified':False,'autonomousViewportBehaviorVerified':False},'baselineRegression':old['projectRegression'],'focusedRegression':focused,'projectRegression':project,'typecheck':{'passed':True,'command':'./node_modules/.bin/tsc --noEmit','log':str(logs/'fish-update-final-types.log')},'windowsBuild':{'passed':True,'command':'node tools/build.mjs --windows','log':str(logs/'fish-update-windows-build.log'),'windowsMachineRuntimeTested':False,'machine':'AMD64','binarySha256':hashlib.sha256(code).hexdigest()},'windowsSourcePlan':{'passed':True,'command':'python3 tools/package-windows-source.py --plan','report':'docs/windows-source-plan.json','log':str(logs/'fish-update-windows-source-plan.log'),'includesNewRuntimeAndNativeFixtures':True,'androidHostIncluded':False,'buildOutputsIncluded':False,'nodeModulesIncluded':False,'cacheIncluded':False},'inventory':{**old['inventory'],'coreSubchainVerifiedClasses':inventory['summary']['coreSubchainVerifiedClasses'],'log':str(logs/'fish-update-class-progress.log')},'categoryCensus':{**old['categoryCensus'],'log':str(logs/'fish-update-category-census.log')},'completeCreatureClasses':0,'autonomousViewportCreatureAcceptancePassed':False,'newWindowsArchiveCreated':False,'newSourceArchiveCreated':False,'androidWorkPerformed':False,'packagingReadiness':'Windows build passes. User requires completed creatures before packaging. Whole FishV2.Update and original movement consumers are compared; FishV2 AI and CharFishGroupAnim region/animation/delay/rail scene composition remain pending alongside DarkCreature/Crab outer updates and real scene/resource/lifecycle/Windows hardware acceptance. No reliable packaging date is available.','remaining':remaining,'artifactSha256':{f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in artifacts}}
(root/'docs/fish-update-verification.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
reports=list(dict.fromkeys(old['nativeReports']+['docs/fish-update-oracle.json']))
assert all(read(file)['passed'] and read(file)['executableSha256']==n.digest for file in reports)
updated={**old,'updatedUtc':r['updatedUtc'],'priorDarkCreatureCombatPhase':{key:old[key] for key in ['updatedUtc','newNativeReports','newNativeCases','newNativeComparedBytes','newNativeServiceCalls','focusedRegression','projectRegression','typecheck','windowsBuild']},'nativeReports':reports,'newNativeReports':['docs/fish-update-oracle.json'],'newNativeCases':493,'newNativeComparedBytes':r['nativeComparedBytes'],'newNativeServiceCalls':r['nativeServiceCalls'],'nativeScope':r['nativeScope'],'baselineRegression':r['baselineRegression'],'focusedRegression':focused,'projectRegression':project,'typecheck':r['typecheck'],'windowsBuild':r['windowsBuild'],'windowsSourcePlan':r['windowsSourcePlan'],'inventory':r['inventory'],'categoryCensus':r['categoryCensus'],'remaining':remaining,'packagingReadiness':r['packagingReadiness'],'latestPhaseReport':'docs/fish-update-verification.json','wholeFishV2UpdateVerified':True,'wholeFishV2AiVerified':False,'fishGroupMapAudit':r['fishGroupMapAudit']}
all_artifacts=list(dict.fromkeys(list(old['artifactSha256'])+artifacts+['docs/fish-update-verification.json']))
updated['artifactSha256']={f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in all_artifacts}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'passed':True,'nativeCases':493,'nativeCaseBreakdown':r['nativeCaseBreakdown'],'projectTests':project['tests'],'focusedTests':focused['tests'],'fishGroupMapAudit':maps['summary'],'newWindowsArchiveCreated':False}))
