export const TERRAIN_BIN_DRAW_BYTES=0x3e0;
export const TERRAIN_BIN_PACKET_BYTES=0x80;
export const TERRAIN_BIN_SURFACES=59;

export interface TerrainBinDrawState {
  /** Explicit model+0x1c8 storage; null takes the original no-draw branch. */
  drawBlocks:Uint8Array|null;
  /** Explicit model+0x1d0 packets, 16 entries of u32 offset/u16 count/u16 selector. */
  packets:Uint8Array;
  /** Pointer words at model+0x3b8, not dereferenced by this function. */
  indexBases:readonly bigint[];
  /** Original model+0x5d8 pointer word. */
  vertexPointer:bigint;
  /** Original model+0x1a8 and +0x1b0 arrays. */
  lods:Uint16Array;
  pendingLods:Uint16Array;
}

/** Complete original TerrainBarn 0x1006a7b50. Binds the selected bin's
 * coarsest-LOD index packet, preserving all unassigned pointers and padding.
 * Duplicate selectors overwrite in packet order, even when count is zero.
 * Addresses wrap as uint64; no resource allocation or pointer dereference.
 * Invalid selectors/storage are rejected before mutation; native code trusts
 * its producer and can write out of bounds on those unsupported inputs.
 * Packets and index bases must come from an explicit loaded-state snapshot:
 * this function does not derive them from the editor's terrain surfaces.
 */
export function prepareTerrainBinDraw(state:TerrainBinDrawState,binIndex:number):void {
  if(!Number.isInteger(binIndex)||binIndex<0||binIndex>0xffffffff||binIndex>=state.lods.length||binIndex>=state.pendingLods.length)throw new Error('Terrain bin LOD storage dimensions');
  if(state.drawBlocks!==null) {
    const blockAt=binIndex*TERRAIN_BIN_DRAW_BYTES,packetAt=binIndex*TERRAIN_BIN_PACKET_BYTES;
    if(blockAt+TERRAIN_BIN_DRAW_BYTES>state.drawBlocks.byteLength||packetAt+TERRAIN_BIN_PACKET_BYTES>state.packets.byteLength)throw new Error('Terrain bin draw/packet storage dimensions');
    const packets=new DataView(state.packets.buffer,state.packets.byteOffset,state.packets.byteLength);
    for(let entry=0;entry<16;entry++) {
      const selector=packets.getUint16(packetAt+entry*8+6,true);
      if(selector>=TERRAIN_BIN_SURFACES||typeof state.indexBases[selector]!=='bigint')throw new Error('Terrain bin packet selector/index base');
    }
    const block=new DataView(state.drawBlocks.buffer,state.drawBlocks.byteOffset+blockAt,TERRAIN_BIN_DRAW_BYTES);
    block.setUint32(0x28,0,true);
    block.setBigUint64(0x20,BigInt.asUintN(64,state.vertexPointer),true);
    for(let selector=0;selector<TERRAIN_BIN_SURFACES;selector++)block.setUint32(0x38+selector*0x10,0,true);
    for(let entry=0;entry<16;entry++) {
      const at=packetAt+entry*8,offset=packets.getUint32(at,true),count=packets.getUint16(at+4,true),selector=packets.getUint16(at+6,true);
      block.setUint32(0x38+selector*0x10,count,true);
      block.setBigUint64(0x30+selector*0x10,BigInt.asUintN(64,state.indexBases[selector]+2n*BigInt(offset)),true);
    }
  }
  state.lods[binIndex]=3;
  state.pendingLods[binIndex]=0xfffe;
}

/** Original heap reference list: 16-byte records, keyed by the address of
 * the owner's pointer slot, rather than the pointer value stored in it. */
export interface TerrainDrawReferences {
  entries:Uint8Array;
  count:number;
}
export interface TerrainBinReleaseServices {
  /** Explicit model+0x1c8 address token, used only to identify owner slots. */
  drawBase:bigint;
  vertexReferences:TerrainDrawReferences;
  indexReferences:TerrainDrawReferences;
  /** Original Barn+0x470 exclusive section. Must invoke action synchronously
   * exactly once, after acquiring exclusive access; it may update LOD state. */
  withExclusiveDrawAccess(action:()=>void):void;
}

function validateReferences(list:TerrainDrawReferences):void {
  if(!Number.isInteger(list.count)||list.count<0||list.count>0xffffffff||list.count*16>list.entries.byteLength)throw new Error('Terrain draw reference storage dimensions');
}
/** Complete original 0x10077e4b0 reference removal. Stable compaction removes
 * all matching slot addresses. The discarded tail and padding stay intact;
 * this unregisters ownership and does not free a GPU/heap allocation. */
export function removeTerrainDrawReferences(list:TerrainDrawReferences,slotAddress:bigint):void {
  validateReferences(list);
  const view=new DataView(list.entries.buffer,list.entries.byteOffset,list.entries.byteLength),key=BigInt.asUintN(64,slotAddress);
  let write=0;
  for(let read=0;read<list.count;read++) {
    if(view.getBigUint64(read*16,true)===key)continue;
    if(write!==read)list.entries.copyWithin(write*16,read*16,read*16+16);
    write++;
  }
  list.count=write;
}

function validateBin(state:TerrainBinDrawState,binIndex:number):void {
  if(!Number.isInteger(binIndex)||binIndex<0||binIndex>0xffffffff||binIndex>=state.lods.length||binIndex>=state.pendingLods.length)throw new Error('Terrain bin LOD storage dimensions');
}
/** Complete normal path of original TerrainBarn 0x1006a8100, with explicit
 * exclusive-access and heap-reference services. Re-read LOD after locking:
 * only unsigned LOD 0..2 unregisters dynamic owners and clears the draw block.
 * Coarse/hidden bins retain every draw byte. Always mark FFFF / FFFE.
 * Allocation reclamation, worker completion and GPU resource lifetime are
 * owned by the original heap/job modules and are not inferred here. */
export function releaseTerrainBinDraw(state:TerrainBinDrawState,binIndex:number,services:TerrainBinReleaseServices):void {
  validateBin(state,binIndex);
  services.withExclusiveDrawAccess(()=>{
    if(state.lods[binIndex]<=2) {
      const at=binIndex*TERRAIN_BIN_DRAW_BYTES;
      if(state.drawBlocks===null||at+TERRAIN_BIN_DRAW_BYTES>state.drawBlocks.byteLength)throw new Error('Terrain dynamic draw storage dimensions');
      validateReferences(services.vertexReferences);validateReferences(services.indexReferences);
      const base=services.drawBase+BigInt(at);
      removeTerrainDrawReferences(services.vertexReferences,base+0x20n);
      removeTerrainDrawReferences(services.indexReferences,base+0x30n);
      state.drawBlocks.fill(0,at,at+TERRAIN_BIN_DRAW_BYTES);
    }
    state.lods[binIndex]=0xffff;
    state.pendingLods[binIndex]=0xfffe;
  });
}

/** Original 0x1006a331f..0x1006a343a visibility transitions, following the
 * numeric distance-LOD decision. A newly visible bin starts at LOD 3 even
 * when desired LOD is finer; existing visible bins retain their current and
 * pending LOD. The separate worker queue performs actual refinement.
 * Repeated hidden bins do not lock, unregister or reset pending state. */
export function updateTerrainBinVisibility(state:TerrainBinDrawState,desiredLods:Uint16Array,services:TerrainBinReleaseServices):void {
  if(desiredLods.length!==state.lods.length||state.pendingLods.length!==state.lods.length)throw new Error('Terrain visibility LOD storage dimensions');
  for(let bin=0;bin<desiredLods.length;bin++) {
    if(desiredLods[bin]===0xffff) {
      if(state.lods[bin]!==0xffff)releaseTerrainBinDraw(state,bin,services);
    } else if(state.lods[bin]===0xffff)prepareTerrainBinDraw(state,bin);
  }
}

export interface TerrainBinLodJobServices {
  /** Original 0x1006a81d0 / 0x1006a88c0. Each job performs one step; the
   * worker owns tessellation, resource replacement and completion state. */
  refine(state:TerrainBinDrawState,binIndex:number):void;
  coarsen(state:TerrainBinDrawState,binIndex:number):void;
}
/** Complete original TessBinJob dispatch 0x1006ad3f0. The job's target word
 * is compared with the current LOD at execution time using signed int16.
 * Equality takes the coarsening branch; FFFF is -1 in this comparison.
 * Dispatch does not infer cancellation, pending-marker updates or job order. */
export function dispatchTerrainBinLodJob(state:TerrainBinDrawState,binIndex:number,targetLod:number,services:TerrainBinLodJobServices):void {
  validateBin(state,binIndex);
  if(!Number.isInteger(targetLod)||targetLod<0||targetLod>0xffff)throw new Error('Terrain job target LOD word');
  const target=(targetLod<<16)>>16,current=(state.lods[binIndex]<<16)>>16;
  if(target<current)services.refine(state,binIndex);else services.coarsen(state,binIndex);
}
