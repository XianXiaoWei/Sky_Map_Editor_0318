import {NativeObjectFoundationFailure,type NativeObjectMemory} from './object-foundation-runtime';
import {transformNativeObb} from './marker-transform-runtime';
export const ORIGINAL_LEVEL_MESH_SIZE=0xa60;
export const ORIGINAL_LEVEL_MESH_VPTR=0x100c16970n;
export interface LevelMeshMemory {bytes(address:bigint,length:number):Uint8Array;read8(address:bigint):number;write8(address:bigint,value:number):void;read64(address:bigint):bigint;}
/** Normal original constructor with explicit registry IDs. Untouched bytes,
 * including transform, GUID, enabled and Model pointer, remain caller-owned.
 * Registry initialization and exception unwinding are separate dependencies. */
export function constructOriginalLevelMesh(storage:Uint8Array,address:bigint,classId:number,paramClassId:number):void {
 if(storage.length<ORIGINAL_LEVEL_MESH_SIZE)throw new Error('Original LevelMesh storage truncated');const v=new DataView(storage.buffer,storage.byteOffset,storage.byteLength);
 v.setUint32(8,classId,true);v.setBigUint64(0,ORIGINAL_LEVEL_MESH_VPTR,true);
 for(const [at,length] of [[0x58,24],[0x80,48],[0xb8,24],[0x110,52],[0x148,24],[0xa38,24]])storage.fill(0,at,at+length);
 for(const at of [0xb1,0xb3,0xb4,0xd9,0xe4,0xe5,0xf0,0xf1,0xf8,0xf9,0x108,0x109,0xa55])storage[at]=0;
 for(const at of [0x71,0x78,0xb2,0x105,0x168])storage[at]=1;
 for(const at of [0x74,0xe8,0xec])v.setUint32(at,0x3f800000,true);
 for(const [at,bits] of [[0xfc,0xc11cf5c3],[0x100,0x447a0000],[0x180,0xbf800000],[0x184,0xbf800000],[0x188,0xbf800000],[0x220,0],[0xa34,0xffffffff]])v.setUint32(at,bits,true);
 for(let i=0;i<16;i++){const at=0x230+i*0x80;v.setUint32(at,paramClassId,true);storage.fill(0,at+8,at+32);storage.fill(0,at+64,at+88);v.setBigUint64(0x1a0+i*8,address+BigInt(at),true);}
}
/** Original Model::SetTransform 0x100463750. The deferred branch retains the
 * ordinary matrix and sets its own dirty byte, rather than committing it. */
export function setOriginalModelTransform(m:LevelMeshMemory,model:bigint,matrix:Uint8Array):void {
 const deferred=m.read8(model+0x32en)!==0;copyOriginalMatrix(m.bytes(model+(deferred?0x240n:0x160n),64),matrix);m.write8(model+(deferred?0x280n:0x225n),1);
}
export function setOriginalModelEnabled(m:LevelMeshMemory,model:bigint,enabled:number):void {
 m.write8(model+0x228n,enabled);if((enabled&255)===0){m.write8(model+0x227n,enabled);m.write8(model+0x3c0n,0);}
}
/** Four independent 16-byte copies preserve the original forward aliasing. */
export function copyOriginalMatrix(out:Uint8Array,input:Uint8Array):Uint8Array {
 if(out.length<64||input.length<64)throw new Error('Original matrix storage truncated');for(let i=0;i<64;i+=16)out.set(input.slice(i,i+16),i);return out;
}
export function setOriginalLevelMeshTransform(m:LevelMeshMemory,mesh:bigint,matrix:Uint8Array):void {
 copyOriginalMatrix(m.bytes(mesh+16n,64),matrix);const model=m.read64(mesh+0x228n);if(model)setOriginalModelTransform(m,model,matrix);
}
export function getOriginalLevelMeshTransform(m:LevelMeshMemory,mesh:bigint,out:Uint8Array=new Uint8Array(64)):Uint8Array {
 const model=m.read64(mesh+0x228n),source=model?model+(m.read8(model+0x32en)?0x240n:0x160n):mesh+16n;return copyOriginalMatrix(out,m.bytes(source,64));
}
export function setOriginalLevelMeshEnabled(m:LevelMeshMemory,mesh:bigint,enabled:number):void {
 m.write8(mesh+0xd0n,enabled);const model=m.read64(mesh+0x228n);if(model)setOriginalModelEnabled(m,model,enabled);if((enabled&255)===0)m.write8(mesh+0xa55n,1);
}
/** Native GetEnabled reads Model visible (+0x227), not its enabled (+0x228). */
export function getOriginalLevelMeshEnabled(m:LevelMeshMemory,mesh:bigint):number {const model=m.read64(mesh+0x228n);return m.read8(model?model+0x227n:mesh+0xd0n);}
export class NativeLevelMeshDependencyBoundary extends Error {constructor(public readonly dependency:string){super(`Original LevelMesh dependency: ${dependency}`);}}
export function getOriginalLevelMeshLocalObb(m:LevelMeshMemory,mesh:bigint,out:Uint8Array=new Uint8Array(64)):Uint8Array {
 const model=m.read64(mesh+0x228n);if(!model)throw new NativeLevelMeshDependencyBoundary('GetObb requires a Model pointer');return copyOriginalMatrix(out,m.bytes(model+0x120n,64));
}
export function getOriginalLevelMeshWorldObb(m:LevelMeshMemory,mesh:bigint,out:Uint8Array=new Uint8Array(64)):Uint8Array {return transformNativeObb(getOriginalLevelMeshTransform(m,mesh),getOriginalLevelMeshLocalObb(m,mesh),out);}
/** Original virtual GUID getter 0x100402bc0 for baked-resource consumers. */
export function getOriginalLevelMeshBstGuid(m:LevelMeshMemory,mesh:bigint):number {const b=m.bytes(mesh+80n,4);return new DataView(b.buffer,b.byteOffset,b.byteLength).getUint32(0,true);}
export interface LevelMeshWrapperServices {memory:LevelMeshMemory;matrixType():bigint;voidType():bigint;convertMatrix(out:Uint8Array,input:Uint8Array,targetType:bigint,sourceType:bigint):void;}
const memberAddress=(m:NativeObjectMemory,member:bigint,receiver:bigint)=>member&1n?m.read64(m.read64(receiver)+member-1n):member;
export function applyOriginalLevelMeshSetTransform(m:NativeObjectMemory,member:bigint,adjustment:bigint,receiver:bigint,args:{bytes:Uint8Array;type:bigint}[],s:LevelMeshWrapperServices):void {
 if(args.length!==1)throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h',573,3,'1 == argCount');s.voidType();receiver=BigInt.asUintN(64,receiver+adjustment);const address=memberAddress(m,member,receiver),matrix=new Uint8Array(64);s.convertMatrix(matrix,args[0].bytes,s.matrixType(),args[0].type);if(address!==0x1003ffe10n)throw new NativeLevelMeshDependencyBoundary(`SetTransform member ${address.toString(16)}`);setOriginalLevelMeshTransform(s.memory,receiver,matrix);
}
export function applyOriginalLevelMeshGetMatrix(m:NativeObjectMemory,member:bigint,adjustment:bigint,receiver:bigint,out:Uint8Array,resultType:bigint,argCount:number,s:LevelMeshWrapperServices):void {
 if(argCount!==0)throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h',573,3,'0 == argCount');receiver=BigInt.asUintN(64,receiver+adjustment);const address=memberAddress(m,member,receiver),result=new Uint8Array(64);if(address===0x100402ab0n)getOriginalLevelMeshTransform(s.memory,receiver,result);else if(address===0x100402b10n)getOriginalLevelMeshLocalObb(s.memory,receiver,result);else throw new NativeLevelMeshDependencyBoundary(`GetMatrix member ${address.toString(16)}`);s.convertMatrix(out,result,resultType,s.matrixType());
}
