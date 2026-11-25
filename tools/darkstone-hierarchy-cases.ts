import {buildOriginalDarkstoneHierarchy} from '../src/core/darkstone-hierarchy-runtime';
import {distanceOriginalBeamoObb} from '../src/core/beamo-geometry-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';

export interface DarkstoneGeometry {position:number[];extent:number[];angle?:number;}
export interface DarkstoneHierarchyCase {
 label:string;seed:number;geometry:DarkstoneGeometry[];cursor?:number;order?:number[];
 childCount?:number;mutation?:number;parent?:number;parents?:number[];
}
export const hierarchyBase=0x440000000n;
const stone=(i:number)=>hierarchyBase+0x3220n+BigInt(i)*0x1a0n;
const box=(x:number,y=0,z=0,r=1):DarkstoneGeometry=>({position:[x,y,z],extent:[r,r,r]});
export function darkstoneHierarchyCases(){
 const out:DarkstoneHierarchyCase[]=[];
 const add=(label:string,geometry:DarkstoneGeometry[],extra:Partial<DarkstoneHierarchyCase>={})=>out.push({label,seed:37,geometry,...extra});
 add('one node returns without geometry services',[box(0)]);
 add('empty unprocessed suffix',[box(0),box(1)],{cursor:2});
 add('unsigned cursor is already past end',[box(0),box(1)],{cursor:0xffffffff});
 add('separate models do not attach',[box(0),box(3)]);
 add('touching surfaces with centers outside do not attach',[box(0),box(2)]);
 add('center on box boundary attaches',[box(0),box(1)]);
 add('zero axes preserve original tiny-basis rule',[box(0,0,0,0),box(1,0,0,0)]);
 for(const count of [2,3,8,16]){
  add('overlapping chain '+count,Array.from({length:count},(_,i)=>box(i*.75)));
  add('all equal distances keep pointer order '+count,Array.from({length:count},()=>box(0)),{order:[0,...Array.from({length:count-1},(_,i)=>count-1-i)]});
 }
 for(const count of [2,8,9,10]){
  const g=[box(0,0,0,10),...Array.from({length:count-1},(_,i)=>({position:[8*Math.cos(i*2*Math.PI/(count-1)),0,8*Math.sin(i*2*Math.PI/(count-1))],extent:[.1,.1,.1]}))];
  add('root contains separated children '+count,g);
 }
 add('disconnected candidate is kept in suffix',[box(0),box(20),box(.75),box(1.5)],{order:[0,1,3,2]});
 for(const childCount of [7,8,0xffffffff])add('child capacity '+childCount,[box(0),box(.5)],{childCount});
 for(const mutation of [1,2,3])add('callback mutation '+mutation,[box(0),box(.5),box(1)],{mutation});
 add('preexisting ancestor chain',[box(0),box(.25),box(.5),box(.75)],{parent:3,parents:[0xffffffff,0xffffffff,0xffffffff,2]});
 for(const r of [0,1e-6,1e-5,Math.fround(1e-5),1.000001e-5,1e4])add('tiny or large obb '+r,[box(0,0,0,r),box(r/2,0,0,r)]);
 for(const seed of [0,1,37,8191])for(let k=0;k<12;k++){
  let rng=(seed+k)>>>0;const random=()=>{rng=(Math.imul(rng,1664525)+1013904223)>>>0;return rng/2**32;};
  const geometry=Array.from({length:2+k%7},()=>({position:[random()*6-3,random()*6-3,random()*6-3],extent:[random()*3,random()*3,random()*3],angle:random()*Math.PI*2}));
  add('rotated anisotropic geometry '+seed+'/'+k,geometry,{seed});
 }
 return out;
}
export function prepareDarkstoneHierarchy(c:DarkstoneHierarchyCase){
 const b=Buffer.alloc(0x60000);let rng=c.seed;
 for(let i=0;i<b.length;i++){rng=(Math.imul(rng,1664525)+1013904223)>>>0;b[i]=rng>>>24;}
 const at=(p:bigint,n:number)=>{const start=Number(p-hierarchyBase);if(start<0||start+n>b.length)throw new Error('Hierarchy oracle address');return start;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),write32:(p:bigint,n:number)=>b.writeUInt32LE(n>>>0,at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write64:(p:bigint,n:bigint)=>b.writeBigUInt64LE(n,at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},string:()=>''};
 m.write32(hierarchyBase+0x1d220n,c.geometry.length);
 m.write32(hierarchyBase+0x29000n,c.cursor??1);
 m.write32(hierarchyBase+0x5f000n,c.mutation??0);
 m.write32(hierarchyBase+0x5f004n,c.geometry.length);
 m.write64(hierarchyBase+0x5f010n,c.parent===undefined?0n:stone(c.parent));
 b.fill(0,0x5e000,0x5e100);
 c.geometry.forEach((g,i)=>{
  const p=stone(i);m.write64(p,hierarchyBase+0x5e000n);m.write32(p+0x20n,i);m.write32(p+0xe0n,c.parents?.[i]??0xffffffff);m.write32(p+0x104n,i?0:c.childCount??0);
  m.write64(hierarchyBase+0x28000n+BigInt(i)*8n,stone(c.order?.[i]??i));
  const angle=g.angle??0,cos=Math.cos(angle),sin=Math.sin(angle);
  const matrix=[cos,0,-sin,0,0,1,0,0,sin,0,cos,0,...g.position,1];
  const obb=[cos*g.extent[0],0,-sin*g.extent[0],0,0,g.extent[1],0,0,sin*g.extent[2],0,cos*g.extent[2],0,...g.position,1];
  [...matrix,...obb].forEach((v,j)=>b.writeFloatLE(v,0x30000+i*128+j*4));
 });
 return {b,m};
}
export function evaluateDarkstoneHierarchy(c:DarkstoneHierarchyCase){
 const {b,m}=prepareDarkstoneHierarchy(c),calls:Buffer[]=[];let line=0,severity=0,transforms=0;
 const record=(kind:number,x:bigint)=>{const row=Buffer.alloc(32);row.writeBigUInt64LE(BigInt(kind));row.writeBigUInt64LE(x,8);calls.push(row);};
 const geometry=(p:bigint)=>0x30000+Number((p-stone(0))/0x1a0n)*128;
 const s={transform:(p:bigint)=>{
  record(1,p);
  if(!transforms++){
   if(c.mutation===1){const first=m.read64(hierarchyBase+0x28008n),second=m.read64(hierarchyBase+0x28010n);m.write64(hierarchyBase+0x28008n,second);m.write64(hierarchyBase+0x28010n,first);}
   if(c.mutation===2)m.write32(hierarchyBase+0x29000n,2);
   if(c.mutation===3)m.write32(p+0x104n,8);
  }
  return b.subarray(geometry(p),geometry(p)+64).slice();
 },worldObb:(p:bigint)=>{record(2,p);return b.subarray(geometry(p)+64,geometry(p)+128).slice();},distanceToObb:(point:Uint8Array,obb:Uint8Array)=>{const result=bits(distanceOriginalBeamoObb(point,obb));record(3,BigInt(result));return result;}};
 try{buildOriginalDarkstoneHierarchy(m,c.parent===undefined?0n:stone(c.parent),stone(0),hierarchyBase+0x28000n,hierarchyBase+0x29000n,c.geometry.length,hierarchyBase+0x2000n,s);}
 catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const head=Buffer.alloc(8);head.writeUInt32LE(line);head.writeUInt32LE(severity,4);const callCount=Buffer.alloc(4);callCount.writeUInt32LE(calls.length);
 return Buffer.concat([head,b,callCount,...calls]);
}
