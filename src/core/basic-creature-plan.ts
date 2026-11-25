import type {Field,ObjectNode} from './objects';
import {railInspectionPoints} from './rail-level';

export type BasicCreatureKind='bird'|'ray'|'flock'|'crab'|'dark'|'buddy'|'fish'|'butterfly';
export interface BasicCreaturePlan {id:number;kind:BasicCreatureKind;resource:string;fallback:string;path:number[][];speed:number;radius:number;count:number;savedEnabled:boolean;}
const fields=(fs:Field[]):Field[]=>fs.flatMap(f=>[f,...fields(f.children??[])]);
export function creatureField(node:ObjectNode|undefined,name:string){return node&&fields(node.fields).find(f=>f.name===name);}
export function creatureNumber(node:ObjectNode|undefined,name:string,fallback=0){const f=creatureField(node,name);if(!f)return fallback;const value=f.kind==='bits32'?(f.value as {float:number;uint:number})[f.encoding==='float'?'float':'uint']:Number(f.value);return Number.isFinite(value)?value:fallback;}
export function creatureText(node:ObjectNode|undefined,name:string){return String(creatureField(node,name)?.value??'');}
export function creatureClump(nodes:ObjectNode[],id:number,seen=new Set<number>()):number[]{
 if(seen.has(id))return [];seen.add(id);const n=nodes[id];if(!n)return [];
 if(n.className!=='Clump')return [id];
 return (creatureField(n,'data')?.children??[]).flatMap(f=>f.kind==='reference'?creatureClump(nodes,Number(f.value),seen):[]);
}
export function basicCreaturePlans(nodes:ObjectNode[]):BasicCreaturePlan[]{
 const plans:BasicCreaturePlan[]=[];
 const path=(id:number):number[][]=>{const n=nodes[id];if(!n)return [];const members=creatureClump(nodes,id),rail=members.map(i=>nodes[i]).find(n=>n?.className==='Rail');if(rail){try{return railInspectionPoints(rail,nodes,8);}catch{return [];}}const points=members.flatMap(i=>{const n=nodes[i],v=creatureField(n,'pos')?.value,t=creatureField(n,'transform')?.value;return Array.isArray(v)?[v.slice(0,3)]:Array.isArray(t)?[t.slice(12,15)]:[];});return points.length>1?points:[];};
 for(const n of nodes){
  if(!['BirdV2','BirdFlock','Crab','DarkCreature','Buddy'].includes(n.className))continue;
  const p=nodes[creatureNumber(n,n.className==='BirdV2'?'boidParams':'params',-1)],ai=nodes[creatureNumber(n,'aiParams',-1)];
  const mesh=nodes[creatureNumber(p,'meshType',-1)],resource=creatureText(mesh,'resourceName');
  const kind:BasicCreatureKind=n.className==='BirdV2'?/Ray/i.test(resource)?'ray':'bird':n.className==='BirdFlock'?'flock':n.className==='DarkCreature'?'dark':n.className==='Buddy'?'buddy':'crab';
  const fallback=kind==='dark'?'CharDarkCreatureAnim':kind==='ray'?'CharSkyRayCAnim':kind==='crab'?'CharCrabAAnim':kind==='buddy'?'CharOreoAAnim':'CharBirdAnim';
  let points=path(creatureNumber(kind==='flock'?n:kind==='dark'?p:ai,kind==='dark'?'patrolRail':kind==='flock'?'rail':'flairRails',-1));
  if(!points.length&&ai)points=path(creatureNumber(ai,'seekTargets',-1));
  plans.push({id:n.id,kind,resource:resource||fallback,fallback,path:points,speed:Math.max(.2,Math.min(25,creatureNumber(kind==='flock'?n:p,kind==='flock'?'travelSpeed':kind==='crab'||kind==='buddy'?'walkSpeed':'maxSpeed',kind==='dark'?8:kind==='ray'?6:kind==='crab'? .8:4))),radius:kind==='dark'?25:kind==='ray'?16:kind==='crab'||kind==='buddy'?3:8,count:kind==='flock'?Math.max(1,Math.min(12,creatureNumber(n,'maxInstances',8))):1,savedEnabled:creatureNumber(n,'enabled',1)!==0});
 }
 const fish=nodes.filter(n=>n.className==='LevelMesh'&&/CharFishGroupAnim/i.test(creatureText(n,'resourceName')));
 for(const n of fish){const owner=nodes.find(c=>c.className==='MoveObjectAlongRail'&&creatureClump(nodes,creatureNumber(c,'objects',-1)).includes(n.id));plans.push({id:n.id,kind:'fish',resource:creatureText(n,'resourceName'),fallback:'CharFishGroupAnim',path:owner?path(creatureNumber(owner,'rail',-1)):[],speed:Math.max(.2,Math.min(20,creatureNumber(owner,'speed',3)||3)),radius:4,count:1,savedEnabled:creatureNumber(n,'enabled',1)!==0});}
 for(const n of nodes.filter(n=>n.className==='SpawnMotes'))plans.push({id:n.id,kind:'butterfly',resource:'CharFlyBeingMiniAAnim',fallback:'CharFlyBeingMiniAAnim',path:[],speed:8,radius:creatureNumber(nodes[creatureNumber(n,'params',-1)],'radius',1),count:creatureNumber(n,'number',1),savedEnabled:creatureNumber(n,'autoStart',0)!==0});
 return plans;
}

/** Arc-length motion; open paths turn around instead of teleporting at the end. */
export function sampleCreaturePath(points:number[][],distance:number):{position:number[];direction:number[]}{
 if(points.length<2)throw new Error('生物路径至少需要两个点');
 const lengths=points.slice(1).map((p,i)=>Math.hypot(...p.map((v,k)=>v-points[i][k]))),total=lengths.reduce((a,b)=>a+b,0);
 if(total<1e-6)return {position:[...points[0]],direction:[0,0,1]};
 const closed=Math.hypot(...points[0].map((v,k)=>v-points.at(-1)![k]))<.1,period=closed?total:2*total;
 let d=((distance%period)+period)%period,sign=1;if(!closed&&d>total){d=period-d;sign=-1;}
 for(let i=0;i<lengths.length;i++){const len=lengths[i];if(d>len&&i<lengths.length-1){d-=len;continue;}if(len<1e-6)continue;const t=Math.min(1,d/len),a=points[i],b=points[i+1];return {position:a.map((v,k)=>v+(b[k]-v)*t),direction:a.map((v,k)=>(b[k]-v)/len*sign)};}
 return {position:[...points.at(-1)!],direction:[0,0,1]};
}
