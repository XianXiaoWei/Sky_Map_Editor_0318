import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
export interface CrabLoadServices {
 math(op:'atan2f'|'asinf',args:number[]):number;
 cloneModel(owner:bigint,source:bigint):bigint;
 localObb(mesh:bigint):Uint8Array;
 playIdle(animation:bigint):void;
 frame():number;
 rand():number;
 initializeAi(ai:bigint,crab:bigint,seed:number,game:bigint):void;
 createGoSit(owner:bigint):bigint;
 createClump(owner:bigint,count:number):bigint;
 createTeleport(owner:bigint):bigint;
 castTeleport(object:bigint):bigint;
 assignString(destination:bigint,text:string):void;
 loadGoSit(goSit:bigint):void;
}
import {natureArithmetic} from './nature-event-runtime';
const f=Math.fround,a=natureArithmetic();
function length3(v:Uint8Array){const d=new DataView(v.buffer,v.byteOffset,v.byteLength),s=[0,1,2].map(i=>f(d.getFloat32(i*4,true)**2));return f(Math.sqrt(f(f(s[0]+s[1])+s[2])));}
/** Whole Crab.Load 0x10025b5d0, normal paths and original assertions.
 * The resource, animation, interaction and libc services remain explicit;
 * this function does not allocate a substitute Model or game controller. */
export function loadOriginalCrab(m:ModelBakeMemory,p:bigint,game:bigint,s:CrabLoadServices){
 const axis=[0x90n,0xa0n,0xb0n].map(at=>new Uint8Array(m.bytes(p+at,16))),position=new Uint8Array(m.bytes(p+0xc0n,16));m.bytes(p+16n,16).set(position);
 const lengths=axis.map(v=>length3(v));for(let i=0;i<3;i++){const v=axis[i],d=new DataView(v.buffer,v.byteOffset,16),length=lengths[i];if(length>value(0x3727c5ac)){const w=bits(f(d.getFloat32(4,true)**2));for(let k=0;k<4;k++)d.setUint32(k*4,a.div(d.getUint32(k*4,true),k===3?w:bits(length)),true);}m.bytes(p+BigInt(32+i*16),16).set(v);}
 m.bytes(p+80n,16).fill(0);const params=m.read64(p+128n);m.write32(p+96n,m.read32(params+16n));m.write32(p+100n,m.read32(params+24n));m.write32(p+104n,0x3f800000);m.write32(p+0x4b0n,0xbf800000);
 const direction=new Uint8Array(m.bytes(p+0xb0n,16)),dir=new DataView(direction.buffer),w=bits(f(dir.getFloat32(4,true)**2));for(let k=0;k<4;k++){dir.setUint32(k*4,dir.getUint32(k*4,true)^0x80000000,true);if(lengths[2]>value(0x3727c5ac))dir.setUint32(k*4,a.div(dir.getUint32(k*4,true),k===3?w:bits(lengths[2])),true);}
 m.write32(p+0xd0n,s.math('atan2f',[dir.getUint32(0,true),dir.getUint32(8,true)]));m.write32(p+0xd4n,s.math('asinf',[dir.getUint32(4,true)]));
 const mesh=m.read64(params+8n),model=s.cloneModel(m.read64(game+0x5a8n),m.read64(mesh+0x228n));m.write64(p+0x4e0n,model);if(!model)throw new NativeObjectFoundationFailure('Crab.cpp',647,3,'m_model');
 m.bytes(p+0x4f0n,16).set(new Uint8Array(Float32Array.of(1,1,1,0).buffer));
 for(let i=0;i<3;i++){const current=m.read64(m.read64(p+128n)+8n),obb=s.localObb(current);m.write32(p+BigInt(0x4f0+i*4),bits(length3(obb.subarray(i*16,i*16+16))));}
 const animation=m.read64(m.read64(p+0x4e0n)+104n);if(animation)s.playIdle(animation);
 m.write32(p+0xe0n,0);m.write32(p+0x500n,s.frame());m.write8(p+0x504n,0);const network=m.read64(game+0x178n);m.write64(p+0x508n,m.read64(network+56n));m.write8(p+0x594n,255);m.write32(p+0x590n,0x4e6e6b28);m.write32(p+0x598n,m.read32(m.read64(network+64n)+0x820n));m.write8(p+0x59cn,0);
 const random=f(f(s.rand()|0)*value(0x30000000));m.write32(p+0xdcn,bits(f(random+f(f(1-random)*0))));
 const barn=m.read64(game+0x370n),index=m.read32(barn+0x410n);if(index>=128)throw new NativeObjectFoundationFailure('Crab.cpp',1479,3,'m_numCrabs < kMaxCrabs');m.write8(p+0x594n,index);m.write32(barn+0x410n,index+1);m.write64(barn+16n+BigInt(index)*8n,p);
 m.write64(p+0xf8n,m.read64(p+128n));s.initializeAi(p+0xf0n,p,Math.imul(index&255,0xec4bab)>>>0,game);m.write64(p+0x4d0n,0n);
 const goSit=s.createGoSit(m.read64(game+0x488n));m.write64(p+0x4d8n,goSit);m.write32(goSit+40n,0);const clump=s.createClump(m.read64(game+0x200n),1);m.write64(m.read64(p+0x4d8n)+56n,clump);const teleport=s.createTeleport(m.read64(game+0x300n));
 if(!m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',48,3,'idx < size');m.write64(m.read64(clump+8n),teleport?teleport+8n:0n);
 const current=m.read64(m.read64(p+0x4d8n)+56n);if(!m.read32(current+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');const target=s.castTeleport(m.read64(m.read64(current+8n)));if(!target)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');m.write8(target+64n,0);
 s.assignString(m.read64(p+0x4d8n)+72n,'GoSit2');let live=m.read64(p+0x4d8n);m.write32(live+192n,0x3f800000);m.write64(live+64n,0n);s.assignString(live+120n,'UISit');s.loadGoSit(m.read64(p+0x4d8n));m.bytes(p+0x5a0n,16).fill(0);
}
