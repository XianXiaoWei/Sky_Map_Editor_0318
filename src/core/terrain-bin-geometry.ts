import {terrainSurfaces,terrainPartitionSurfaceCounts,type MaterialVertices,type MaterialDef} from './mesh-surfaces';
import {TERRAIN_BIN_PACKET_BYTES,TERRAIN_BIN_SURFACES} from './terrain-bin-runtime';

export interface TerrainBinSource extends MaterialVertices {
  positions:Float32Array;
  /** Original loaded terrain+0x88: u32 index count then packed XYZ bytes. */
  bins:readonly {count:number;raw:number}[];
  /** Original terrain+0x50 XYZ and +0x70; not whole-geometry derived bounds. */
  gridOrigin:ArrayLike<number>;
  cellSize:number;
  /** Original model transform, column-major, with native unit-scale constraint. */
  transform:ArrayLike<number>;
}

const add=(a:number,b:number)=>Math.fround(a+b),mul=(a:number,b:number)=>Math.fround(a*b);
const finiteMax=Math.fround((2-2**-23)*2**127);
/** RTE creation arithmetic from original TerrainBarn 0x1006a9000:
 * bin spheres/bounds 0x1006a96a9..0x1006a9916 and packets/population counts
 * 0x1006a9916..0x1006a9b00. Original complete creation body is the oracle;
 * its CPU allocation/collision policy and other model fields are not modeled.
 * Every bin uses its original contiguous input index range. Bounds ignore
 * unordered positions, then transform the two extrema exactly as native code
 * does; they are not reordered to form a conventional rotated world AABB.
 * Sphere radius is half-cell * double 1.7321, converted back to float32.
 * Packet offset/selector/padding in unused slots preserve initial heap bytes.
 * More than 16 nonempty surfaces in a bin is rejected before native-style
 * packet overflow; counts within a slot keep the original uint16 truncation.
 */
export function buildTerrainBinGeometry(source:TerrainBinSource,defs:MaterialDef[],initialPackets:Uint8Array) {
  const {bins}=source,count=bins.length;
  if(defs.length!==30||source.positions.length!==source.vertexCount*3||source.gridOrigin.length!==3||source.transform.length!==16||initialPackets.byteLength!==count*TERRAIN_BIN_PACKET_BYTES)throw new Error('Terrain bin source dimensions');
  if(bins.some(b=>!Number.isInteger(b.count)||b.count<0||b.count%3||!Number.isInteger(b.raw)||b.raw<0||b.raw>0xffffffff)||count!==0&&bins.reduce((sum,b)=>sum+b.count,0)!==source.indices.length)throw new Error('Terrain bin index partition');
  const transform=Array.from(source.transform,Math.fround),origin=Array.from(source.gridOrigin,Math.fround),half=mul(Math.fround(source.cellSize),0.5),radius=Math.fround(half*1.7321);
  // Same native scale check, before any result is published. RTE is explicit;
  // alternate ambient MXCSR modes are outside this producer's current scope.
  for(const at of [0,4,8]) {
    const squares=transform.slice(at,at+3).map(v=>mul(v,v)),length=Math.fround(Math.sqrt(add(squares[2],add(squares[0],squares[1]))));
    if(!(Math.abs(add(length,-1))<Math.fround(0.00001)))throw new Error('Terrain original unit-scale constraint');
  }
  const point=(p:readonly number[])=>[0,1,2,3].map(row=>add(add(add(mul(transform[row],p[0]),mul(transform[row+4],p[1])),mul(transform[row+8],p[2])),transform[row+12]));
  const spheres=new Float32Array(count*4),minima=new Float32Array(count*4),maxima=new Float32Array(count*4),surfaceBinCounts=new Uint32Array(TERRAIN_BIN_SURFACES),surfaceOffsets=new Uint32Array(TERRAIN_BIN_SURFACES);
  const packets=new Uint8Array(initialPackets),packet=new DataView(packets.buffer),globalPlan=terrainSurfaces(source,defs),partitionCounts=count?terrainPartitionSurfaceCounts(source,defs,bins.map(b=>b.count)):[];
  let start=0;
  bins.forEach((bin,index)=>{
    const localCenter=[0,1,2].map(lane=>add(half,add(origin[lane],add(mul(half,(bin.raw>>>(lane*8))&255),mul(half,(bin.raw>>>(lane*8))&255)))));
    spheres.set([...point(localCenter).slice(0,3),radius],index*4);
    const minimum=[finiteMax,finiteMax,finiteMax],maximum=[-finiteMax,-finiteMax,-finiteMax];
    for(let i=start;i<start+bin.count;i++)for(let lane=0;lane<3;lane++) {
      const value=source.positions[source.indices[i]*3+lane];
      // MIN/MAX select operand two for ties; the original unordered mask
      // restores the old accumulator for NaN input positions.
      if(Number.isNaN(value))continue;
      minimum[lane]=minimum[lane]<value?minimum[lane]:value;
      maximum[lane]=maximum[lane]>value?maximum[lane]:value;
    }
    minima.set(point(minimum),index*4);maxima.set(point(maximum),index*4);
    const counts=partitionCounts[index];start+=bin.count;
    const active=Array.from(counts).filter(v=>v!==0).length;
    if(active>16)throw new Error('Terrain original packet exceeds 16 surface slots');
    const base=index*TERRAIN_BIN_PACKET_BYTES;
    for(let slot=0;slot<16;slot++)packet.setUint16(base+slot*8+4,0,true);
    let slot=0;
    counts.forEach((surfaceCount,selector)=>{
      if(!surfaceCount)return;
      const at=base+slot++*8;
      packet.setUint16(at+6,selector,true);packet.setUint16(at+4,surfaceCount&0xffff,true);packet.setUint32(at,surfaceOffsets[selector],true);
      surfaceOffsets[selector]=(surfaceOffsets[selector]+surfaceCount)>>>0;surfaceBinCounts[selector]++;
    });
  });
  return {spheres,minima,maxima,packets,surfaceBinCounts,surfaceCounts:globalPlan.counts,indexStreams:globalPlan.batches.map(batch=>({selector:batch.surface,indices:globalPlan.indices.slice(batch.start,batch.start+batch.count)})),lods:new Uint16Array(count).fill(0xffff)};
}
