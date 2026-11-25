import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {transformNativeObb,type NativeMarkerArithmeticServices} from './marker-transform-runtime';
import {originalCreatureLength3} from './bird-load-runtime';

export interface DarkstoneInitializeServices {
 /** Original Darkstone mesh-backed virtuals +0x18/+0x20 and mesh GUID +0x30. */
 transform(stone:bigint):Uint8Array;
 localObb(stone:bigint):Uint8Array;
 meshGuid(mesh:bigint):number;
 random():number;
 /** Original global vectors at 0x100d2b490 and 0x1020042f0. */
 diffuseColor:Uint8Array;dynamicColor:Uint8Array;
 /** Original LevelMesh material APIs, pass zero and zero transition time.
  * Temporary string inputs are immutable ordinary short strings. */
 setVector(mesh:bigint,name:string,color:Uint8Array):void;
 setTexture(mesh:bigint,name:string,texture:string):void;
 setEnabled(mesh:bigint,enabled:number):void;
 arithmetic?:NatureArithmeticServices;
 matrixArithmetic?:NativeMarkerArithmeticServices;
}

/** Whole ordinary Darkstone.Initialize 0x10027a7c0 through its return.
 * Actual mesh construction/material owners remain explicit services. Preserves
 * normalized axes, local scale W from matrix scratch, world OBB, material type,
 * GUID, parent/children, burn state, count-scaled randomized timing and rewards.
 * C++ abnormal unwinding and mutation of const string inputs are excluded. */
export function initializeOriginalDarkstone(m:ModelBakeMemory,p:bigint,barn:bigint,trap:bigint,mesh:bigint,level:number,index:number,s:DarkstoneInitializeServices){
 const a=natureArithmetic(s.arithmetic);
 m.write32(p+32n,index);m.write64(p+40n,mesh);
 const transform=s.transform(p),local=s.localObb(p),world=transformNativeObb(transform,local,undefined,s.matrixArithmetic);
 m.bytes(p+0x80n,64).set(world);m.bytes(p+0x40n,48).set(transform.subarray(0,48));
 const extent=world.slice(0,16);
 for(let i=0;i<3;i++){
  const axis=m.bytes(p+0x40n+BigInt(i)*16n,16),length=originalCreatureLength3(axis);
  new DataView(extent.buffer,extent.byteOffset,extent.byteLength).setUint32(i*4,length,true);
  const ySquared=a.mul(m.read32(p+0x40n+BigInt(i*16+4)),m.read32(p+0x40n+BigInt(i*16+4)));
  if(value(length)>value(0x3727c5ac))for(let j=0;j<4;j++)m.write32(p+0x40n+BigInt(i*16+j*4),a.div(m.read32(p+0x40n+BigInt(i*16+j*4)),j===3?ySquared:length));
 }
 m.bytes(p+0x70n,16).set(extent);m.bytes(p+0xc0n,16).set(extent);
 m.write64(p+0xd0n,0x3f8000003f800000n);m.write32(p+0xd8n,0x3f800000);m.write8(p+0x198n,0);
 m.write32(p+0x104n,0);m.write32(p+0xe0n,0xffffffff);m.write64(p+16n,trap);m.write32(p+0x140n,level);
 if(s.diffuseColor.length!==16||s.dynamicColor.length!==16)throw new Error('Darkstone global colors must be float4');
 m.bytes(p+0x150n,16).set(s.diffuseColor);m.bytes(p+0x160n,16).set(s.dynamicColor);m.bytes(p+0x178n,16).fill(0);
 m.write64(p+24n,barn);m.write32(p+0x188n,1);m.write32(p+0x18cn,s.meshGuid(mesh));
 m.write32(p+0x34n,a.mul(bits(s.random()|0),0x30000000));
 s.setVector(m.read64(p+40n),'u_diffuseColor',m.bytes(p+0x150n,16).slice());
 let currentMesh=m.read64(p+40n);
 const nameField=currentMesh+0xb8n,namePointer=(m.bytes(nameField,1)[0]&1)?m.read64(currentMesh+0xc8n):nameField+1n;
 const dark=m.string(namePointer)==='DarkStone';m.write8(p+0x30n,Number(dark));
 if(dark){
  s.setTexture(currentMesh,'u_texSpots','DeerSpotTex');
  s.setTexture(m.read64(p+40n),'u_normal','DarkstoneNorTex');
  s.setVector(m.read64(p+40n),'u_spotsColor',new Uint8Array(16));
  currentMesh=m.read64(p+40n);
 }
 const owner=m.read64(p+16n),enabled=owner?Number(m.bytes(owner+0x38n,1)[0]!==0):1;
 s.setEnabled(currentMesh,enabled);
 const liveOwner=m.read64(p+16n);
 m.write32(p+0x190n,liveOwner&&m.bytes(liveOwner+0x38n,1)[0]?0x3f800000:0);
 const t=a.min(0x3f800000,a.mul(bits(m.read32(p+32n)),0x3b800000));
 const weight=a.mul(a.add(a.mul(t,0x3f8ccccd),a.mul(a.sub(0x3f800000,t),0x3f666666)),0x3e800000);
 const random=a.mul(bits(s.random()|0),0x30000000);
 let interval=a.mul(a.add(a.mul(random,0x3f99999a),a.mul(a.sub(0x3f800000,random),0x3f4ccccd)),weight);
 m.write32(p+0x194n,interval);
 const finalOwner=m.read64(p+16n);
 if(finalOwner&&m.bytes(finalOwner+32n,1)[0]){
  const clump=m.read64(finalOwner+8n);
  if(clump&&m.read32(clump+16n)>=2){interval=a.mul(interval,a.mul(bits(m.read32(clump+16n)),0x3f000000));m.write32(p+0x194n,interval);}
 }
 m.write64(p+0x170n,0n);
}
