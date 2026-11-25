import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';

export interface BirdFlockHeapServices {
 freeAllocation(allocator:bigint,pointer:bigint):void;
 releaseAllocator(allocator:bigint):void;
 createAllocator(start:bigint,size:bigint,flags:0):bigint;
 initializeAllocator(allocator:bigint,size:bigint):void;
}
const fail=(file:string,line:number,severity:number,expression:string):never=>{throw new NativeObjectFoundationFailure(file,line,severity,expression);};
/** Whole Heap.Free 0x100795a70. Preserve the original debug scan: it selects
 * the first zero entry after the allocator call, rather than matching p. */
export function freeOriginalBirdFlockAllocation(m:ModelBakeMemory,heap:bigint,p:bigint,s:BirdFlockHeapServices){
 if(!p)return;s.freeAllocation(m.read64(heap+0x20n),p);
 if(!m.bytes(heap+0x48n,1)[0])return;
 const count=m.read32(heap+0x4cn),first=m.read64(heap+0x50n);
 for(let i=0;i<count;i++){const entry=first+BigInt(i)*16n;if(!m.read64(entry)){if(!entry)break;m.bytes(entry,16).fill(0);return;}}
 fail('Heap.cpp',254,4,'entry');
}
/** Whole Heap.Reset 0x100795650; allocation internals are explicit services. */
export function resetOriginalBirdFlockHeap(m:ModelBakeMemory,heap:bigint,s:BirdFlockHeapServices){
 const prior=m.read64(heap+0x20n);if(prior)s.releaseAllocator(prior);
 if(m.bytes(heap+0x47n,1)[0])m.bytes(m.read64(heap+8n),Number(m.read64(heap+16n))).fill(0);
 const next=s.createAllocator(m.read64(heap+8n),m.read64(heap+16n),0);m.write64(heap+0x20n,next);
 s.initializeAllocator(next,m.read64(heap+16n));
}
/** Whole ModelInstances.SetInstanceCount 0x100473d40, including partial
 * writes before a queued VertexRender assertion. It does not submit a GPU. */
export function setOriginalBirdFlockInstanceCount(m:ModelBakeMemory,model:bigint,count:number){
 count>>>=0;if(m.read32(model+0x158n)<count)fail('ModelInstances.cpp',17,4,'count <= m_vertexData.GetInstanceCapacity()');
 const renders=m.read32(model+0x458n),first=m.read64(model+0x450n);
 for(let i=0;i<renders;i++){const render=first+BigInt(i)*0x540n;if(m.bytes(render+0x52an,1)[0]===1)fail('../../../Code/Base/Vertex.h',146,4,'!m_queued');m.write32(render+0x510n,count);}
}
export interface BirdFlockUnloadServices extends BirdFlockHeapServices {
 generation(object:bigint):bigint;
 enabled(object:bigint):number;
 setEnabled(object:bigint,enabled:0):void;
}
/** Whole BirdFlock.Unload 0x10019bd00. Service callbacks may mutate the heap,
 * buffers or versioned reference; all native re-reads are retained. */
export function unloadOriginalBirdFlock(m:ModelBakeMemory,flock:bigint,s:BirdFlockUnloadServices){
 let heap=m.read64(flock+0xa0n);
 if(heap){let p=m.read64(flock+0x88n);if(p)freeOriginalBirdFlockAllocation(m,heap,p,s);p=m.read64(flock+0x68n);if(p){heap=m.read64(flock+0xa0n);freeOriginalBirdFlockAllocation(m,heap,p,s);}}
 m.write64(flock+0x88n,0n);m.write64(flock+0x68n,0n);
 let object=m.read64(flock+0xa8n),generation=m.read64(flock+0xb0n);
 if(!object||!generation||s.generation(object)!==generation)return;
 if(!(s.enabled(m.read64(flock+0xa8n))&255))return;
 object=m.read64(flock+0xa8n);generation=m.read64(flock+0xb0n);
 if(!object||!generation||s.generation(object)!==generation)return;
 s.setEnabled(m.read64(flock+0xa8n),0);
}
/** Whole BirdFlocks.Unload 0x10019b680 with the above real child bodies.
 * Native count is re-read after each child; the model pointer is retained. */
export function unloadOriginalBirdFlocks(m:ModelBakeMemory,barn:bigint,s:BirdFlockUnloadServices){
 const model=m.read64(barn+0x80068n);if(model)setOriginalBirdFlockInstanceCount(m,model,0);
 for(let i=0;i<m.read32(barn+0x80cf0n);i++)unloadOriginalBirdFlock(m,barn+0x80070n+BigInt(i)*0xc8n,s);
 m.write32(barn+0x80cf0n,0);resetOriginalBirdFlockHeap(m,barn+16n,s);
}
export interface BirdFlocksUpdateServices {
 /** The separate original BirdFlock.Update 0x10019bdc0 remains required.
  * This entry only restores the manager and its instance packing consumer. */
 updateFlock(flock:bigint,game:bigint):void;
 arithmetic?:NatureArithmeticServices;
}
/** Whole BirdFlocks.Update 0x10019b6f0 plus VertexBuffer.GetData 0x100795060
 * and SetInstanceCount. Six original normalized planes use the native
 * float32 operation order, -1 margin, and unordered comparisons. */
export function updateOriginalBirdFlocks(m:ModelBakeMemory,barn:bigint,game:bigint,s:BirdFlocksUpdateServices){
 const model=m.read64(barn+0x80068n);if(!model||!m.read32(barn+0x80cf0n))return;
 if(m.read32(model+0x190n)!==2)fail('../../../Code/Base/Vertex.h',277,3,'m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic');
 if(m.read32(model+0x120n)!==20)fail('../../../Code/Base/Vertex.h',278,3,'VsIsValidMap< BufferType >::Test( &m_format, idx )');
 let output=m.read64(model+0x188n);if(!output)return;
 const a=natureArithmetic(s.arithmetic),camera=m.read64(game+0x70n),rows=Array.from({length:4},(_,lane)=>Array.from({length:4},(_,column)=>m.read32(camera+0x1c0n+BigInt(column*16+lane*4))));
 const planes=([['add',0],['sub',0],['add',2],['add',1],['sub',1],['sub',2]] as const).map(([op,row])=>{
  const p=rows[3].map((n,i)=>a[op](n,rows[row][i])),squares=p.map(n=>a.mul(n,n)),length=a.add(squares[2],a.add(squares[0],squares[1]));
  if(value(length)>0){const root=bits(Math.sqrt(value(length)));return p.map(n=>a.div(n,root));}return p;
 });
 let remaining=0x2800;
 for(let i=0;i<m.read32(barn+0x80cf0n);i++){
  const flock=barn+0x80070n+BigInt(i)*0xc8n;s.updateFlock(flock,game);
  // Limit inspected candidates before culling, exactly as the original.
  const count=Math.min(m.read32(flock+0x94n),remaining);let accepted=0;
  for(let j=0;j<count;j++){
   const p=m.read64(flock+0x88n)+BigInt(j)*0x30n,raw=[0,4,8,12].map(n=>m.read32(p+BigInt(n))),position=[...raw.slice(0,3),0x3f800000];
   if(planes.some(plane=>{const n=position.map((v,k)=>a.mul(v,plane[k]));return -1>value(a.add(a.add(n[0],n[2]),a.add(n[1],n[3])));}))continue;
   const source=m.read64(flock+0x68n),index=m.bytes(p+0x24n,2),transform=(index[0]|index[1]<<8)*64;
   for(let lane=0;lane<3;lane++)m.write32(output+BigInt(accepted*20+lane*4),raw[lane]);
   m.write32(output+BigInt(accepted*20+12),m.read32(p+12n));
   m.write32(output+BigInt(accepted*20+16),m.read32(source+BigInt(transform)+0x30n));accepted++;
  }
  remaining-=accepted;output+=BigInt(accepted*20);
 }
 setOriginalBirdFlockInstanceCount(m,m.read64(barn+0x80068n),0x2800-remaining);
}
