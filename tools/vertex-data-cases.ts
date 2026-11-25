export const VERTEX_DATA_BASE=0x2e0000000n;
export interface VertexDataCase {name:string;memory:string;mutation:number;actions:number[][];}
export function vertexDataCases():VertexDataCase[]{
 const cases:VertexDataCase[]=[],base=(name:string,fill=0xa5,vars=true,head=0,matrix=0x1200):VertexDataCase=>{
  const b=Buffer.alloc(8192,fill),p=(at:number)=>VERTEX_DATA_BASE+BigInt(at);b.writeBigUInt64LE(vars?p(0x1300):0n,0x1700);b.writeBigUInt64LE(head?p(head):0n,0x1348);b.writeBigUInt64LE(0n,0x1548);b.writeBigUInt64LE(p(matrix),0x1710);
  for(let i=0;i<16;i++)b.writeUInt32LE(i%5===0?0x3f800000:0,matrix+i*4);
  return {name,memory:b.toString('hex'),mutation:0,actions:[[1,0],[0,0x600],[0,0xb00],[2,0x1800]]};
 };
 for(const fill of [0,0xa5,255])for(const vars of [false,true])for(const head of [0,0x1400,0x1340])for(const mutation of [0,1,2])cases.push({...base(`list-${fill}-${vars}-${head}-${mutation}`,fill,vars,head),mutation});
 for(const matrix of [0,0x600,0x1200])for(const op of [1,2])cases.push({...base(`matrix-alias-${matrix}-${op}`,0xa5,true,0,matrix),actions:matrix===0x600?[[0,0x600],[op,0]]:[[op,0]]});
 for(let lane=0;lane<12;lane++)for(const bits of [0,0x80000000,1,0x80000001,0x7f7fffff,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0xffc01234]){const c=base(`matrix-bits-${lane}-${bits}`),b=Buffer.from(c.memory,'hex');b.writeUInt32LE(bits,0x1200+lane*4);c.memory=b.toString('hex');c.actions=[[1,0],[2,0x1800]];cases.push(c);}
 for(const vars of [false,true])for(const head of [0,0x1400,0x1340])cases.push({...base(`lister-only-${vars}-${head}`,0xa5,vars,head),actions:[[3,0x1a00],[3,0x1b00]]});return cases;
}
export function vertexDataInput(c:VertexDataCase):Buffer {const h=Buffer.alloc(8),actions=Buffer.alloc(c.actions.length*8);h.writeUInt32LE(c.actions.length);h.writeUInt32LE(c.mutation,4);c.actions.forEach((a,i)=>a.forEach((n,j)=>actions.writeUInt32LE(n,i*8+j*4)));return Buffer.concat([h,Buffer.from(c.memory,'hex'),actions]);}
