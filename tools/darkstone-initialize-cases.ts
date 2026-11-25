import {initializeOriginalDarkstone} from '../src/core/darkstone-initialize-runtime';
import {prepareDarkstoneHierarchy,hierarchyBase as base} from './darkstone-hierarchy-cases';
import evidence from '../docs/darkstone-initialization-native.json';
export interface DarkstoneInitializeCase {label:string;seed:number;shader:string;longName?:boolean;owner?:boolean;enabled?:number;hierarchy?:number;members?:number;index?:number;level?:number;random?:number[];scale?:number[];mutation?:number;originalColors?:boolean;}
export function darkstoneInitializeCases(){
 const out:DarkstoneInitializeCase[]=[];
 for(const shader of ['DarkStone','DarkStoneB','DarkStone '])for(const owner of [false,true])for(const enabled of [0,1,2])for(const members of [0,1,2,17])out.push({label:shader+'/'+owner+'/'+enabled+'/'+members,seed:37,shader,owner,enabled,hierarchy:1,members,level:2,index:members});
 for(const index of [0,1,255,256,257,0xffffffff])for(const random of [[0,0],[0x7fffffff,0x7fffffff],[-1,-2147483648],[12345,8191]])out.push({label:'index/random '+index+'/'+random,seed:1,shader:'DarkStone',owner:true,enabled:1,index,random});
 for(const scale of [[0,0,0],[1e-6,1e-5,1.000001e-5],[-2,3,4],[.3,.7,1.9]])out.push({label:'basis '+scale,seed:8191,shader:'DarkStone',owner:true,enabled:1,scale});
 for(const mutation of [1,2])out.push({label:'material callback '+mutation,seed:1,shader:'DarkStone',owner:true,enabled:1,mutation});
 out.push({label:'heap shader string',seed:0,shader:'DarkStone',owner:true,enabled:1,longName:true});
 out.push({label:'original static material color',seed:0,shader:'DarkStone',owner:true,enabled:1,originalColors:true});
 return out;
}
export function prepareDarkstoneInitialize(c:DarkstoneInitializeCase){
 const {b,m}=prepareDarkstoneHierarchy({label:c.label,seed:c.seed,geometry:[{position:[2,-3,5],extent:[1,2,3],angle:.35}]}),p=base+0x4000n;
 m.string=(address?:bigint)=>{if(address===undefined)throw new Error('Missing string address');const at=Number(address-base),end=b.indexOf(0,at);if(at<0||end<at)throw new Error('Oracle string address');return b.toString('utf8',at,end);};
 b.fill(0,0x5e000,0x5e200);m.write64(p,base+0x5e000n);
 for(const offset of [0x50000,0x51000]){m.write64(base+BigInt(offset),base+0x5e100n);m.write32(base+BigInt(offset+16),0xabc12345);const name=base+BigInt(offset+0xb8);m.bytes(name,24).fill(0);if(c.longName){m.write8(name,1);m.write64(name+16n,base+BigInt(offset+0x180));m.bytes(base+BigInt(offset+0x180),c.shader.length+1).set(Buffer.from(c.shader+'\0'));}else{m.write8(name,c.shader.length*2);m.bytes(name+1n,c.shader.length+1).set(Buffer.from(c.shader+'\0'));}}
 m.write64(base+0x1008n,base+0x1800n);m.write32(base+0x1810n,c.members??3);m.write8(base+0x1020n,c.hierarchy??0);m.write8(base+0x1038n,c.enabled??0);
 m.write32(base+0x5f000n,c.random?.[0]??12345);m.write32(base+0x5f004n,c.random?.[1]??8191);m.write32(base+0x5f010n,Number(c.owner??false));m.write32(base+0x5f018n,c.level??0);m.write32(base+0x5f01cn,c.index??0);m.write32(base+0x5f024n,c.mutation??0);
 // Nonzero W values prove that the original normalization and reused extent
 // scratch retain all four lanes, instead of generic vec3 reconstruction.
 const scale=c.scale??[2,3,4];for(let i=0;i<3;i++){for(let j=0;j<3;j++)b.writeFloatLE(b.readFloatLE(0x30000+i*16+j*4)*scale[i],0x30000+i*16+j*4);b.writeFloatLE((i+1)*.125,0x30000+i*16+12);}
 [...(c.originalColors?evidence.colors.diffuse.values:[.03,.05,.08,1]),.1,.2,.3,.4].forEach((v,i)=>b.writeFloatLE(v,0x5e200+i*4));return {b,m};
}
export function evaluateDarkstoneInitialize(c:DarkstoneInitializeCase){
 const {b,m}=prepareDarkstoneInitialize(c),calls:Buffer[]=[];let randomIndex=0;
 const record=(kind:number,p:bigint,name?:string,v?:Uint8Array|string|number)=>{const row=Buffer.alloc(96);row.writeBigUInt64LE(BigInt(kind));row.writeBigUInt64LE(p,8);if(name)row.write(name,16,32);if(typeof v==='string')row.write(v,48,32);else if(typeof v==='number')row.writeUInt32LE(v>>>0,48);else if(v)row.set(v,48);calls.push(row);};
 initializeOriginalDarkstone(m,base+0x4000n,base+0x2000n,c.owner?base+0x1000n:0n,base+0x50000n,c.level??0,c.index??0,{
  transform:p=>{record(1,p);return b.subarray(0x30000,0x30040).slice();},localObb:p=>{record(2,p);return b.subarray(0x30040,0x30080).slice();},meshGuid:mesh=>{const n=m.read32(mesh+16n);record(3,mesh,undefined,n);return n;},random:()=>{const n=m.read32(base+0x5f000n+BigInt(randomIndex++)*4n)|0;record(4,0n,undefined,n);return n;},
  diffuseColor:b.subarray(0x5e200,0x5e210),dynamicColor:b.subarray(0x5e210,0x5e220),
  setVector:(mesh,name,color)=>{record(5,mesh,name,color);if(c.mutation===1&&calls.length===5)m.write64(base+0x4028n,base+0x51000n);},setTexture:(mesh,name,texture)=>record(6,mesh,name,texture),setEnabled:(mesh,enabled)=>{record(7,mesh,undefined,enabled);if(c.mutation===2)m.write8(base+0x1038n,m.bytes(base+0x1038n,1)[0]^1);}
 });
 b.fill(0,0x5e000,0x5e200);const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
