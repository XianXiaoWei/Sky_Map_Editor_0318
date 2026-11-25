import fs from 'node:fs';import path from 'node:path';import {spawnSync} from 'node:child_process';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const logRoot='/root/sky-research';fs.mkdirSync(logRoot,{recursive:true});
const tasks=[
 ['native-evidence','python3',['tools/reverse-object-runtime.py',executable]],
 ['foundation-oracle','npx',['tsx','tools/object-foundation-oracle.ts',executable]],
 ['delay-evidence','python3',['tools/reverse-delay-events.py',executable]],
 ['vertex-data-evidence','python3',['tools/reverse-vertex-data.py',executable]],
 ['vertex-data-oracle','npx',['tsx','tools/vertex-data-oracle.ts',executable]],
 ['model-unbaked-oracle','npx',['tsx','tools/model-unbaked-oracle.ts',executable]],
 ['model-barn-evidence','python3',['tools/reverse-model-barn.py',executable]],
 ['model-barn-oracle','npx',['tsx','tools/model-barn-oracle.ts',executable]],
 ['model-lod-oracle','npx',['tsx','tools/model-lod-oracle.ts',executable]],
 ['resource-lookup-evidence','python3',['tools/reverse-resource-lookup.py',executable]],
 ['resource-lookup-oracle','npx',['tsx','tools/resource-lookup-oracle.ts',executable]],
 ['model-baked-registry-oracle','env',['SKY_MODEL_BAKED_LOOKUP=1','npx','tsx','tools/model-baked-oracle.ts',executable]],
 ['resource-ref-evidence','python3',['tools/reverse-resource-ref.py',executable]],
 ['resource-ref-oracle','npx',['tsx','tools/resource-ref-oracle.ts',executable]],
 ['model-baked-ref-oracle','env',['SKY_MODEL_BAKED_REFS=1','npx','tsx','tools/model-baked-oracle.ts',executable]],
 ['model-baked-evidence','python3',['tools/reverse-model-baked.py',executable]],
 ['model-baked-oracle','npx',['tsx','tools/model-baked-oracle.ts',executable]],
 ['level-mesh-evidence','python3',['tools/reverse-level-mesh.py',executable]],
 ['level-mesh-oracle','npx',['tsx','tools/level-mesh-oracle.ts',executable]],
 ['level-mesh-transform-oracle','env',['SKY_TRANSFORM_LEVEL_MESH=1','npx','tsx','tools/transform-object-oracle.ts',executable]],
 ['transform-object-evidence','python3',['tools/reverse-transform-object.py',executable]],
 ['transform-object-oracle','npx',['tsx','tools/transform-object-oracle.ts',executable]],
 ['marker-transform-evidence','python3',['tools/reverse-marker-transform.py',executable]],
 ['marker-transform-oracle','npx',['tsx','tools/marker-transform-oracle.ts',executable]],
 ['marker-resume-evidence','python3',['tools/reverse-marker-resume.py',executable]],
 ['float-condition-evidence','python3',['tools/reverse-float-condition-events.py',executable]],
 ['logic-chain-oracle','npx',['tsx','tools/logic-chain-oracle.ts',executable]],
 ['level-material-oracle','npx',['tsx','tools/level-material-oracle.ts',executable]],
 ['numeric-oracle','npx',['tsx','tools/object-numeric-oracle.ts',executable]],
 ['audio-inventory','npx',['tsx','tools/audio-runtime-inventory.ts']],
 ['sound-oracle','npx',['tsx','tools/sound-event-oracle.ts',executable]],
 ['object-batch-oracle','npx',['tsx','tools/object-batch-oracle.ts',executable]],
 ['event-barn-oracle','npx',['tsx','tools/event-barn-oracle.ts',executable]],
 ['baked-lookup-oracle','npx',['tsx','tools/baked-lookup-oracle.ts',executable]],
 ['render-inventory','python3',['tools/meshes-render-inventory.py',executable]],
 ['object-logic-preview','npx',['tsx','tools/object-logic-preview-oracle.ts',executable]],
 ['project-tests','npm',['test']],['typecheck','npx',['tsc','--noEmit']],
 ['objects-inventory','npx',['tsx','tools/objects-class-progress.ts']],
 ['objects-call-chain','python3',['tools/reverse-object-call-chain.py',executable]],
 ['model-material-dependencies','npx',['tsx','tools/model-material-inventory.ts']],
 ['build','npm',['run','build']],
 ['object-preview-depth','npx',['tsx','tools/object-preview-depth-check.ts']],
 ['transform-preview-ui','xvfb-run',['-a','node','tools/transform-object-preview-smoke.mjs']],
 ['transform-sequence','npx',['tsx','tools/transform-sequence-oracle.ts']],
 ['transform-sequence-ui','xvfb-run',['-a','node','tools/transform-sequence-smoke.mjs']],
 ['object-logic-preview-ui','xvfb-run',['-a','node','tools/object-logic-preview-smoke.mjs']],
 ['class-ui','xvfb-run',['-a','node','tools/objects-class-progress-smoke.mjs']],
 ['instance-ui','xvfb-run',['-a','node','tools/objects-instance-progress-smoke.mjs']],
];
const report={passed:false,startedAtUTC:new Date().toISOString(),scope:'Objects first: original foundation type lookup/vptr/Float construction, dependent numeric/flow/Event/EventBarn and sound drivers, plus LevelMaterial dependencies and separate baked GUID checks. Delay and FloatSplit/OnFloat creation/loading, conditional/temporal/staggered/beat-gated output and shared logic chain are checked separately. Marker pool/state and ResumeEnable/Clump/Enable checkpoint methods join the continuous oracle; Marker transform/OBB/factory matrix reflection runs in a separate compact whole-corpus oracle. Actual call graph frontiers, registry/heap/virtual services and incomplete loader/model/animation/game/hardware remain explicit.',data:process.env.SKY_DATA??'original reference Data',steps:[],completeOriginalGameRuntime:false};
fs.writeFileSync('docs/object-runtime-batch-verification.json',JSON.stringify(report,null,2)+'\n');
for(const [name,command,args] of tasks){
 const log=path.join(logRoot,`unified-${name}.log`),fd=fs.openSync(log,'w');let run;
 try{run=spawnSync(command,args,{stdio:['ignore',fd,fd],timeout:300000});}finally{fs.closeSync(fd);}
 const step={name,passed:run.status===0,exitCode:run.status,signal:run.signal,error:run.error?.message,log};report.steps.push(step);fs.writeFileSync('docs/object-runtime-batch-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(step));if(!step.passed)process.exit(1);
}
report.finishedAtUTC=new Date().toISOString();report.passed=true;
report.summary=Object.fromEntries(['object-foundation-oracle','level-material-oracle','object-numeric-oracle','object-batch-oracle','sound-event-oracle','event-barn-oracle','audio-runtime-inventory','baked-lookup-oracle'].map(name=>{const r=JSON.parse(fs.readFileSync(`docs/${name}.json`,'utf8'));return [name,{passed:r.passed,cases:r.cases,routines:r.routineCount,comparedBytes:r.comparedBytes,summary:r.summary,queries:r.queries}];}));
report.vertexData=JSON.parse(fs.readFileSync('docs/vertex-data-oracle.json','utf8'));
report.modelUnbaked=JSON.parse(fs.readFileSync('docs/model-unbaked-oracle.json','utf8'));
report.modelBarn=JSON.parse(fs.readFileSync('docs/model-barn-oracle.json','utf8'));
report.modelLod=JSON.parse(fs.readFileSync('docs/model-lod-oracle.json','utf8'));
report.resourceLookup=JSON.parse(fs.readFileSync('docs/resource-lookup-oracle.json','utf8'));
report.modelBakedRegistry=JSON.parse(fs.readFileSync('docs/model-baked-registry-oracle.json','utf8'));
report.resourceRef=JSON.parse(fs.readFileSync('docs/resource-ref-oracle.json','utf8'));
report.modelBakedRef=JSON.parse(fs.readFileSync('docs/model-baked-ref-oracle.json','utf8'));
report.modelBaked=JSON.parse(fs.readFileSync('docs/model-baked-oracle.json','utf8'));
report.levelMesh=JSON.parse(fs.readFileSync('docs/level-mesh-oracle.json','utf8'));
report.levelMeshTransform=JSON.parse(fs.readFileSync('docs/transform-object-level-mesh-oracle.json','utf8'));
report.transformObject=JSON.parse(fs.readFileSync('docs/transform-object-oracle.json','utf8'));
report.objectLogicPreview=JSON.parse(fs.readFileSync('docs/object-logic-preview-oracle.json','utf8'));
report.objectLogicPreviewUi=JSON.parse(fs.readFileSync('docs/object-logic-preview-smoke.json','utf8'));
report.objectPreviewDepth=JSON.parse(fs.readFileSync('docs/object-preview-depth-check.json','utf8'));
report.markerTransform=JSON.parse(fs.readFileSync('docs/marker-transform-oracle.json','utf8'));
report.logicChain=JSON.parse(fs.readFileSync('docs/logic-chain-oracle.json','utf8'));
report.projectTests={passed:true,tests:Number(/^# tests (\d+)$/m.exec(fs.readFileSync(path.join(logRoot,'unified-project-tests.log'),'utf8'))?.[1]??0),failed:0};
const nativeGroups=['object-foundation-oracle','level-material-oracle','object-numeric-oracle','object-batch-oracle','sound-event-oracle','event-barn-oracle'];
report.nativeTotal={routines:48,scope:'Unique original foundation/LevelMaterial/numeric/flow/Event/EventBarn/sound bodies; FloatMult constructor sequences counted as cases, existing FloatMult body counted once. Separate baked lookup/acceptance slices excluded.',cases:nativeGroups.reduce((n,k)=>n+report.summary[k].cases,0),comparedBytes:nativeGroups.reduce((n,k)=>n+report.summary[k].comparedBytes,0)};
report.classProgress=JSON.parse(fs.readFileSync('docs/Objects.level.bin类进度.json','utf8')).summary;
fs.writeFileSync('docs/object-runtime-batch-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:report.passed,summary:report.summary}));
