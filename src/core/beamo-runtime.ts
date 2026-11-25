import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { copyOriginalMatrix } from './level-mesh-runtime';
import type { ModelBakeMemory } from './model-baked-runtime';
import {numericFloatValue} from './object-numeric-runtime';
export type BeamoKind='Beamo'|'BeamoDecal';
export const ORIGINAL_BEAMO_VPTR=0x100c126d0n,ORIGINAL_BEAMO_DECAL_VPTR=0x100c12758n;
export interface BeamoConstructorServices {
 baseClassId():number;worldClassId():number;worldVptr:bigint;
 ensureLevelModelMeta():void;classId(kind:BeamoKind):number;
}
/** Entire normal placement bodies 0x100198cf0 / 0x100199280. In particular,
 * neither placement writes transform, GUID, enabled state or the Barn pointer.
 * Metadata services retain original call/write order. */
export function constructOriginalBeamo(m:ModelBakeMemory,address:bigint,kind:BeamoKind,s:BeamoConstructorServices) {
 m.write32(address+8n,s.baseClassId());m.write32(address+8n,s.worldClassId());m.write64(address,s.worldVptr);
 s.ensureLevelModelMeta();m.write32(address+8n,s.classId(kind));m.write64(address,kind==='Beamo'?ORIGINAL_BEAMO_VPTR:ORIGINAL_BEAMO_DECAL_VPTR);
 m.bytes(address+0x58n,24).fill(0);
 if(kind==='Beamo'){
  m.bytes(address+0x84n,2).fill(0);
  for(const offset of [0x90n,0x94n,0x98n])m.write32(address+offset,0xbf800000);
 }
}
/** Original Barn.Initialize 0x100194a10. Existing slots are retained. */
export function initializeOriginalBeamoBarn(m:ModelBakeMemory,barn:bigint) {
 m.write8(barn+12n,0);m.write64(barn+0x20010n,0n);
 m.write64(barn+0x20020n,BigInt.asUintN(64,barn+0x20037n)&~15n);
}
/** Entire normal CreateBeamo 0x1001973a0 / CreateBeamoDecal 0x1001974a0.
 * Beamo keeps prior slot bytes; BeamoDecal zeroes all 128 bytes before placement.
 * Count increments BEFORE constructor services. No Model substitute is created:
 * these classes use their own BeamoBarn records and rendering infrastructure. */
export function createOriginalBeamo(m:ModelBakeMemory,barn:bigint,kind:BeamoKind,s:BeamoConstructorServices):bigint {
 const normal=kind==='Beamo',countAt=barn+(normal?0x20010n:0x20014n),count=m.read32(countAt);
 if(count>=(normal?512:256))throw new NativeObjectFoundationFailure('Beamo.cpp',normal?345:353,4,normal?'m_beamoCount < kMaxBeamos':'m_decalCount < kMaxBeamoDecals');
 m.write32(countAt,count+1);
 const address=barn+(normal?16n:0x18010n)+BigInt(count)*(normal?192n:128n);
 if(!normal)m.bytes(address,128).fill(0);
 constructOriginalBeamo(m,address,kind,s);m.write64(address+(normal?0xb0n:0x78n),barn);return address;
}
/** Original Changed methods flag their live Barn for rebuild, even when no
 * model transform changed. SetTransform only copies its four matrix columns. */
export function changedOriginalBeamo(m:ModelBakeMemory,address:bigint,kind:BeamoKind){m.write8(m.read64(address+(kind==='Beamo'?0xb0n:0x78n))+12n,1);}
export function setOriginalBeamoTransform(m:ModelBakeMemory,address:bigint,input:Uint8Array){copyOriginalMatrix(m.bytes(address+16n,64),input);}
export function getOriginalBeamoTransform(m:ModelBakeMemory,address:bigint,out:Uint8Array=new Uint8Array(64)){return copyOriginalMatrix(out,m.bytes(address+16n,64));}
export interface BeamoRecordServices {
 baseClassId():number;
 findMaterial(barn:bigint,guid:number):bigint;
 meshName(object:bigint,vptr:bigint):string;
}
/** Original Barn.Load first pass 0x1001950da..0x100195330, after the LevelData
 * ResourceRef has been resolved. This creates the real 384-byte runtime records
 * in the caller's Barn table; it does not construct a Model or upload geometry.
 * Primary material may be null for Beamo here; requested secondary material
 * and BeamoDecal primary material assert immediately when missing. */
export function prepareOriginalBeamoRecords(m:ModelBakeMemory,barn:bigint,materialBarn:bigint,levelData:bigint,s:BeamoRecordServices){
 m.write32(barn+0x6c830n,0);
 const count=(m.read32(barn+0x20014n)+m.read32(barn+0x20010n))>>>0;m.write32(barn+0x20018n,count);
 if(!count)return;
 for(let i=0;;i=(i+1)>>>0){
  const record=m.read64(barn+0x20020n)+BigInt(i)*384n;
  m.bytes(record,384).fill(0);m.write32(record,s.baseClassId());m.write64(record+0xc0n,0n);m.write32(record+0xc8n,0x10001);
  m.write8(record+0xcdn,1);m.write8(record+0xcen,1);
  const normalCount=m.read32(barn+0x20010n);
  if(i<normalCount){
   const object=barn+16n+BigInt(i)*192n;m.write64(record+8n,object);m.write64(record+16n,object);
   m.write8(record+0xbcn,m.bytes(levelData+13n,1)[0]^1);
   const primary=s.findMaterial(materialBarn,m.read32(object+0x70n));m.write64(record+0xd8n,primary);
   m.write8(record+0xf4n,m.bytes(object+0x85n,1)[0]);
   const secondaryGuid=m.read32(object+0x74n);
   if(secondaryGuid){const secondary=s.findMaterial(materialBarn,secondaryGuid);m.write64(record+0xe0n,secondary);
    if(!secondary){s.meshName(object,m.read64(object));throw new NativeObjectFoundationFailure('Beamo.cpp',590,4,'ref.materialSecondary');}
   }
  }else{
   const object=barn+0x18010n+BigInt((i-normalCount)>>>0)*128n;m.write64(record+8n,object);m.write64(record+16n,0n);
   m.write8(record+0xf4n,0);m.write8(record+0xbcn,0);
   const distance=m.read32(object+0x74n);m.write32(record+0xb4n,numericFloatValue(distance)>0?distance:0x7f7fffff);
   const primary=s.findMaterial(materialBarn,m.read32(object+0x70n));m.write64(record+0xd8n,primary);
   if(!primary){s.meshName(object,m.read64(object));throw new NativeObjectFoundationFailure('Beamo.cpp',603,4,'ref.material');}
  }
  if(((i+1)>>>0)>=m.read32(barn+0x20018n))break;
 }
}
export interface BeamoUnloadServices {
 resetVertexData(address:bigint):void;
 resetRenderable(address:bigint):void;
 removeCollision(owner:bigint,instance:bigint):void;
 destroyObject(address:bigint,vptr:bigint):void;
}
/** Whole Barn.Unload 0x100194a90. Service calls retain the original dynamic
 * count/table reads: collision removal reloads loadedCount, but a skipped
 * collision keeps the last cached count. Only Beamo/Decal counts are cleared;
 * loadedCount, renderable count, runtime pointer and dirty byte are retained. */
export function unloadOriginalBeamoBarn(m:ModelBakeMemory,barn:bigint,s:BeamoUnloadServices){
 s.resetVertexData(barn+0x6c838n);
 for(let i=0;i<m.read32(barn+0x6c830n);i=(i+1)>>>0)s.resetRenderable(barn+0x6cc70n+BigInt(i)*0x3540n);
 let count=m.read32(barn+0x20018n);
 for(let i=0;i<count;i=(i+1)>>>0){
  const record=m.read64(barn+0x20020n)+BigInt(i)*384n;
  if(m.bytes(record+0xbcn,1)[0]!==0){
   s.removeCollision(m.read64(barn+0xa2088n),m.read64(record+0xd0n));
   count=m.read32(barn+0x20018n);
  }
 }
 for(let i=0;i<m.read32(barn+0x20010n);i=(i+1)>>>0){const address=barn+16n+BigInt(i)*192n;s.destroyObject(address,m.read64(address));}
 for(let i=0;i<m.read32(barn+0x20014n);i=(i+1)>>>0){const address=barn+0x18010n+BigInt(i)*128n;s.destroyObject(address,m.read64(address));}
 m.write64(barn+0x20010n,0n);
}
export interface BeamoDestructorServices {stringAllocator():bigint;freeString(allocator:bigint,pointer:bigint):void;}
/** Normal non-deleting destructor 0x100198510 / 0x100198690. Long mesh-name
 * strings release through the original allocator service; fields stay intact.
 * Exception unwinding is outside this normal path. */
export function destroyOriginalBeamo(m:ModelBakeMemory,address:bigint,kind:BeamoKind,s:BeamoDestructorServices){
 m.write64(address,kind==='Beamo'?ORIGINAL_BEAMO_VPTR:ORIGINAL_BEAMO_DECAL_VPTR);
 if(m.bytes(address+0x58n,1)[0]&1){const pointer=m.read64(address+0x68n);const allocator=s.stringAllocator();s.freeString(allocator,pointer);}
}
export class OriginalBeamoEndpoint {
 constructor(readonly objectId:number,readonly address:bigint,readonly kind:BeamoKind,private readonly memory:ModelBakeMemory){}
 get barn(){return this.memory.read64(this.address+(this.kind==='Beamo'?0xb0n:0x78n));}
 getGuid(){return this.memory.read32(this.address+80n);}
 getTransform(){return getOriginalBeamoTransform(this.memory,this.address);}
 setTransform(input:Uint8Array){setOriginalBeamoTransform(this.memory,this.address,input);}
 changed(){changedOriginalBeamo(this.memory,this.address,this.kind);}
}
