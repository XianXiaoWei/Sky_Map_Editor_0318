import type {NativeObjectMemory} from '../src/core/object-foundation-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import * as mesh from '../src/core/level-mesh-runtime';
import {getNativeObjectTransform,setNativeObjectTransform,type NativeObjectTransformServices} from '../src/core/object-transform-runtime';
import {getNativeObjectEnabled,setNativeObjectEnabled,type NativeObjectEnabledServices} from '../src/core/object-enabled-runtime';
import {O,R} from './transform-object-cases';import type {LevelMeshCase} from './level-mesh-cases';
export function prepareLevelMeshRegistry(registry:Buffer):void{
 const ptr=(at:number,p:bigint)=>registry.writeBigUInt64LE(p,at);ptr(0x98+16*8,R+0x5b00n);registry.writeUInt32LE(16,0x5b38);ptr(0x5b50,R+0x7000n);
 const names=['GetEnabled','GetObb','GetTransform','SetEnabled','SetTransform'],members=[0x11n,0x21n,0x19n,0x1003ffe50n,0x1003ffe10n];
 names.forEach((name,i)=>{const node=0x7100+i*64,desc=0x7400+i*128;registry.write(name+'\0',0x7800+i*32);ptr(node+32,R+BigInt(0x7800+i*32));ptr(node+40,R+BigInt(desc));ptr(desc+56,members[i]);ptr(desc+88,0x102310400n);});
 ptr(0x7008,R+0x7180n);ptr(0x7180,R+0x7100n);ptr(0x7188,R+0x71c0n);ptr(0x7108,R+0x7140n);ptr(0x71c8,R+0x7200n);
}
export const levelMeshSlots:Record<string,bigint>={'100c16980':0x100402a80n,'100c16988':0x100402ab0n,'100c16990':0x100402b10n,'100c16998':0x100402b60n,'100c169a0':0x100402bc0n};
export interface LevelMeshResult {line:number;severity:number;services:number[][];result:number;memory:string;}
export function evaluateLevelMesh(c:LevelMeshCase):LevelMeshResult {
 const b=Buffer.from(c.memory,'hex'),registry=Buffer.alloc(0x9000),services:number[][]=[];prepareLevelMeshRegistry(registry);
 const bytes=(p:bigint,n:number)=>{const source=p>=O&&p<O+BigInt(b.length)?b:registry,base=source===b?O:R;const at=Number(p-base);if(at<0||at+n>source.length)throw new Error(`Unmapped LevelMesh ${p.toString(16)}`);return source.subarray(at,at+n);};
 const m:mesh.LevelMeshMemory & NativeObjectMemory={bytes,read8:p=>bytes(p,1)[0],write8:(p,v)=>{bytes(p,1)[0]=v;},read32:p=>bytes(p,4).readUInt32LE(),read64:p=>levelMeshSlots[p.toString(16)]??bytes(p,8).readBigUInt64LE(),write64:(p,v)=>{bytes(p,8).writeBigUInt64LE(v);},string:p=>{const at=Number(p-R);return registry.subarray(at,registry.indexOf(0,at));}};
 const log=(op:number,meta=0n,arg=0)=>services.push([op,meta?Number(meta-R):0,arg>>>0]);
 const wrappers:mesh.LevelMeshWrapperServices={memory:m,matrixType:()=>R+0x5200n,voidType:()=>R+0x5400n,convertMatrix:(dst,src,target,source)=>{log(3,target,Number(source-R));dst.set(src.subarray(0,64));}};
 const s:NativeObjectTransformServices={registry:R,cacheEnabled:()=>false,asClass:p=>{log(1,p);return p;},fallbackClass:()=>{log(5);return R+0x5600n;},objectPointerType:()=>R+0x5100n,matrixType:()=>R+0x5200n,voidType:()=>R+0x5400n,receiverType:()=>R+0x5d00n,castReceiver:(type,p)=>{log(2,type,Number(p-O));return p-8n;},callParentGetter:()=>{throw new Error('Unprepared parent');},cachedLookup:()=>{throw new Error('Unrestored cache');},invokeMatrix:(method,receiver,out,result,arg,argType)=>{const member=m.read64(method+56n);if(arg)mesh.applyOriginalLevelMeshSetTransform(m,member,0n,receiver,[{bytes:arg,type:argType}],wrappers);else mesh.applyOriginalLevelMeshGetMatrix(m,member,0n,receiver,out!,result,0,wrappers);}};
 const enabled:NativeObjectEnabledServices={...s,boolType:()=>R+0x5300n,invoke:(_,receiver,result,arg)=>{if(arg!==null){log(3,R+0x5300n,0x5300);mesh.setOriginalLevelMeshEnabled(m,receiver,arg?1:0);return false;}const resultByte=mesh.getOriginalLevelMeshEnabled(m,receiver);log(3,result,0x5300);return !!resultByte;}};
 let line=0,severity=0,result=0;
 try{if((c.op===4||c.op===9)&&!m.read64(O+0x228n)){line=0xfffffffd;log(61,0n,4);}else switch(c.op){
 case 0:mesh.constructOriginalLevelMesh(b,O,16,17);break;
 case 1:mesh.getOriginalLevelMeshTransform(m,O,b.subarray(0x1900,0x1940));break;
 case 2:mesh.setOriginalLevelMeshTransform(m,O,b.subarray(0x1800,0x1840));break;
 case 3:setNativeObjectTransform(m,O+8n,b.subarray(0x1800,0x1840),s);getNativeObjectTransform(m,O+8n,b.subarray(0x1900,0x1940),s);setNativeObjectEnabled(m,O+8n,false,enabled);log(9,0n,getNativeObjectEnabled(m,O+8n,enabled)?1:0);setNativeObjectEnabled(m,O+8n,true,enabled);log(9,0n,getNativeObjectEnabled(m,O+8n,enabled)?1:0);break;
 case 4:mesh.getOriginalLevelMeshWorldObb(m,O,b.subarray(0x1980,0x19c0));break;
 case 5:mesh.applyOriginalLevelMeshSetTransform(m,0x1003ffe10n,BigInt(c.adjust??0),O-BigInt(c.adjust??0),Array.from({length:c.argCount??0},()=>({bytes:b.subarray(0x1800,0x1840),type:R+0x5200n})),wrappers);break;
 case 6:mesh.setOriginalLevelMeshEnabled(m,O,c.value??0);result=mesh.getOriginalLevelMeshEnabled(m,O);break;
 case 7:mesh.applyOriginalLevelMeshGetMatrix(m,0x19n,BigInt(c.adjust??0),O-BigInt(c.adjust??0),b.subarray(0x1900,0x1940),R+0x5200n,c.argCount??0,wrappers);break;
 case 8:mesh.setOriginalModelTransform(m,O+0x1000n,b.subarray(0x1800,0x1840));break;
 case 9:mesh.getOriginalLevelMeshLocalObb(m,O,b.subarray(0x1940,0x1980));break;
 case 10:mesh.setOriginalLevelMeshTransform(m,O,b.subarray(c.value??0,(c.value??0)+64));break;
 case 11:result=mesh.getOriginalLevelMeshBstGuid(m,O);break;
 default:throw new Error('Invalid LevelMesh case');
 }}catch(error){if(error instanceof NativeObjectFoundationFailure){line=error.line;severity=error.severity;}else throw error;}
 return {line,severity,services,result,memory:b.toString('hex')};
}
