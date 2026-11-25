import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {AssetCatalog} from '../src/main/assets';
import {readResourceMesh} from '../src/core/resources';
import {findResourceAnimationFile} from '../src/core/resource-animation-list';
import {resourceAnimationHasRange} from '../src/core/resource-animation-loop';

const root=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(bytes:Uint8Array)=>crypto.createHash('sha256').update(bytes).digest('hex');
const files:unknown[]=[],groups:unknown[]=[],fishV2:unknown[]=[];
let triggers=0,playbackEvents=0,railEvents=0,restartDelays=0;
for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
 const filename=path.join(root,'Levels',level,'Objects.level.bin');if(!fs.existsSync(filename))continue;
 const source=fs.readFileSync(filename),doc=new ObjectsDocument(source),byId=new Map(doc.nodes.map(node=>[node.id,node]));
 const field=(node:ObjectNode,name:string)=>node.fields.find(f=>f.name===name),value=(node:ObjectNode,name:string)=>field(node,name)?.value;
 const referenced=(node:ObjectNode,name:string)=>{const f=field(node,name);assert.equal(f?.kind,'reference',`${level} #${node.id}.${name}`);return f!.value===0xffffffff?null:byId.get(Number(f!.value))!;};
 const members=(node:ObjectNode|null)=>{if(!node)return [];assert.equal(node.className,'Clump');const data=field(node,'data');assert.equal(data?.kind,'array');assert.equal(data?.children?.length,data?.value);return data!.children!.map(f=>{assert.equal(f.kind,'reference');const target=byId.get(Number(f.value));assert.ok(target,`${level} Clump #${node.id} member #${f.value}`);return target;});};
 const snapshot=(node:ObjectNode)=>({id:node.id,className:node.className,fields:node.fields.map(f=>({name:f.name,kind:f.kind,value:f.value,raw:f.raw,children:f.children?.map(c=>({name:c.name,kind:c.kind,value:c.value,raw:c.raw}))}))});
 const meshes=doc.nodes.filter(node=>node.className==='LevelMesh'&&value(node,'resourceName')==='CharFishGroupAnim');
 if(meshes.length){
  const catalog=new AssetCatalog(root,level),meshSource=fs.readFileSync(catalog.meshFile('CharFishGroupAnim')),mesh=readResourceMesh(meshSource),pack=mesh.animation;
  assert.ok(pack);assert.equal(mesh.animated,true);
  const listFile=findResourceAnimationFile(catalog.animationList(),pack.name);assert.ok(listFile);
  const actions=listFile.metaDatas.filter(m=>/DayHubFish/.test(m.name)).map(m=>({name:m.name,start:m.start,stop:m.stop,animType:m.animType,rangeAvailable:resourceAnimationHasRange(pack,m.start-1,m.stop-1)}));
  assert.ok(actions.some(a=>a.name==='DayHubFishDisturb'&&a.rangeAvailable));assert.ok(actions.some(a=>a.name==='DayHubFishSwimLoop'&&a.rangeAvailable));
  for(const fish of meshes){
   const plays=doc.nodes.filter(node=>node.className==='PlayAnimation'&&members(referenced(node,'target')).some(target=>target.id===fish.id)),playIds=new Set(plays.map(n=>n.id));
   assert.equal(plays.length,2);assert.deepEqual(plays.map(n=>value(n,'animationSequenceName')).sort(),['Disturb','SwimAround']);
   const regions=doc.nodes.filter(node=>node.className==='OnRegion'&&members(referenced(node,'events')).some(target=>playIds.has(target.id)));
   assert.equal(regions.length,1);
   const regionRows=regions.map(region=>{
    const outputs=members(referenced(region,'events')),delays=outputs.filter(n=>n.className==='Delay');assert.equal(delays.length,1);
    const delay=delays[0];assert.ok(members(referenced(delay,'events')).some(n=>n.id===region.id));
    const delayField=field(delay,'delay');assert.equal(delayField?.kind,'bits32');assert.equal((delayField!.value as {float:number}).float,4);
    const markers=members(referenced(region,'markers'));assert.ok(markers.length);assert.ok(markers.every(n=>n.className==='Marker'));
    assert.equal(value(region,'useLocal'),1);assert.equal(value(region,'useCameraPos'),0);assert.equal(value(region,'fireOnce'),1);
    triggers++;restartDelays++;
    return {region:snapshot(region),eventClump:referenced(region,'events')!.id,outputs:outputs.map(n=>({id:n.id,className:n.className})),markers:markers.map(snapshot),restartDelay:snapshot(delay),restartTargetClump:referenced(delay,'events')!.id,restartTargetId:region.id};
   });
   const movement=doc.nodes.filter(node=>node.className==='MoveObjectAlongRail'&&members(referenced(node,'objects')).some(target=>target.id===fish.id));assert.equal(movement.length,1);
   const movementRows=movement.map(node=>{
    const rail=referenced(node,'rail');assert.equal(rail?.className,'Rail');const points=field(rail!,'dataPoints');assert.equal(points?.kind,'array');assert.equal(points?.children?.length,points?.value);
    const markers=points!.children!.map(f=>byId.get(Number(f.value))!);assert.ok(markers.every(n=>n?.className==='Marker'));assert.equal(value(rail!,'looped'),1);railEvents++;
    return {event:snapshot(node),objectClump:referenced(node,'objects')!.id,rail:snapshot(rail!),points:markers.map(snapshot)};
   });
   playbackEvents+=plays.length;
   groups.push({level,fish:snapshot(fish),model:{name:pack.name,meshSha256:sha(meshSource),bones:pack.bones.length,frames:pack.frameCount,sampleRate:pack.sampleRate,actions},playAnimationEvents:plays.map(snapshot),regions:regionRows,movement:movementRows,savedReferenceGraphVerified:true,sequenceRegistryBindingVerified:false,autonomousViewportBehaviorVerified:false,completeRuntime:false});
  }
 }
 for(const node of doc.nodes.filter(node=>node.className==='FishV2'))fishV2.push({level,...snapshot(node),wholeUpdateNativeReport:'docs/fish-update-oracle.json',aiImplemented:false,completeRuntime:false});
 assert.deepEqual(doc.serialize(),source);assert.equal(sha(fs.readFileSync(filename)),sha(source));files.push({level,sha256:sha(source),nodes:doc.nodes.length,sourceUnchanged:true});
}
assert.equal(files.length,33);assert.equal(groups.length,5);assert.equal(triggers,5);assert.equal(playbackEvents,10);assert.equal(railEvents,5);assert.equal(restartDelays,5);
const report={passed:true,scope:'Read-only audit of actual ObjectsDocument fields and exact saved references, including fish LevelMesh targets, OnRegion local-avatar entry, PlayAnimation sequence names, four-second Delay re-enables, looping Rail point references and mesh action ranges. Passing validates the saved graph and source round trips only; sequence registry binding, trigger/rail/EventBarn composition and autonomous viewport behavior remain pending.',summary:{maps:files.length,fishGroups:groups.length,regionTriggers:triggers,playAnimationEvents:playbackEvents,movementEvents:railEvents,restartDelays,fishV2Instances:fishV2.length,completeCreatureClasses:0},files,groups,fishV2};
fs.writeFileSync('docs/fish-group-map-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:report.passed,summary:report.summary}));
