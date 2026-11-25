import type {ModelBakeMemory,ModelBakeRef} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';

export interface LevelMeshLoadServices {
  createRef():ModelBakeRef;
  meshType():bigint;
  lookup(manager:bigint,type:bigint,name:bigint):bigint;
  observe(resource:bigint,ref:ModelBakeRef):void;
  poll(manager:bigint):void;
  sleep(milliseconds:number):void;
  create(mesh:bigint,barn:bigint,resources:bigint,flag:number,levelName:bigint):void;
  update(mesh:bigint,resources:bigint,deltaBits:number):void;
  destroyRef(ref:ModelBakeRef):void;
}
/** Complete normal LevelMesh.Load 0x100400ed0. Loading waits for the actual
 * observed Mesh +0x108 byte and re-reads its handle after every poll/sleep;
 * a missing resource asserts. Scheduling, creation and update remain explicit
 * calls to their shared owners; this function never fabricates a ready Model. */
export function loadOriginalLevelMesh(m:ModelBakeMemory,mesh:bigint,barn:bigint,resources:bigint,flag:number,levelName:bigint,s:LevelMeshLoadServices):void {
  m.write8(mesh+0xa30n,0);m.write8(mesh+0xa31n,0);
  const ref=s.createRef(),descriptor=mesh+0x58n,name=m.bytes(descriptor,1)[0]&1?m.read64(mesh+0x68n):descriptor+1n;
  const found=s.lookup(resources,s.meshType(),name);
  if(!found)throw new NativeObjectFoundationFailure('LevelMesh.cpp',375,4,'meshFound');
  s.observe(found,ref);
  for(;;){
    const data=ref.handle?m.read64(ref.handle+16n):0n;
    if(!data)throw new NativeObjectFoundationFailure('./Mesh.h',109,3,'Observed()');
    if(m.bytes(data+0x108n,1)[0])break;
    s.poll(resources);s.sleep(10);
  }
  m.write64(mesh+0x228n,0n);s.create(mesh,barn,resources,flag&255,levelName);s.update(mesh,resources,0);s.destroyRef(ref);
}

/** Complete LevelMeshBarn.Load 0x100400180. The LevelData byte is captured
 * once; the pool count is re-read after each load, as in the original. */
export function loadOriginalLevelMeshBarn(m:ModelBakeMemory,barn:bigint,models:bigint,levelData:bigint,resources:bigint,levelName:bigint,load:LevelMeshLoadServices['create']):void {
  if(!m.read32(barn+0x185110n))return;
  const flag=m.bytes(levelData+13n,1)[0];
  for(let i=0;;i=(i+1)>>>0){load(barn+16n+BigInt(i)*0xa60n,models,resources,flag,levelName);if(((i+1)>>>0)>=m.read32(barn+0x185110n))return;}
}

/** Scene loader and existing transform/material endpoints use the same native
 * object address. No serialized fields or substitute Model are allocated. */
export class OriginalLevelMeshLoadEndpoint {
  constructor(readonly objectId:number,readonly address:bigint,private memory:ModelBakeMemory){}
  get modelAddress(){return this.memory.read64(this.address+0x228n);}
  load(barn:bigint,resources:bigint,flag:number,levelName:bigint,services:LevelMeshLoadServices){loadOriginalLevelMesh(this.memory,this.address,barn,resources,flag,levelName,services);}
}
