import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits, numericFloatValue} from './object-numeric-runtime';

export interface ModelBakeMemory {
  bytes(address: bigint, length: number): Uint8Array;
  read32(address: bigint): number;
  read64(address: bigint): bigint;
  write32(address: bigint, value: number): void;
  write64(address: bigint, value: bigint): void;
  write8(address: bigint, value: number): void;
  string(address: bigint): string;
}
const nan = (n: number) => (n & 0x7fffffff) > 0x7f800000;
export interface ModelBakeArithmeticServices {
  resolveDualNaN(operation: 'add'|'sub'|'mul'|'div', a: number, b: number): number;
}
export class NativeModelBakeArithmeticBoundary extends Error {
  constructor(public readonly operation: string, public readonly a: number, public readonly b: number) {super('MeshInstance dual-NaN propagation requires a verified arithmetic service');}
}
/** Default masked, nearest-even, gradual-underflow x86 arithmetic. This does
 * not expose exception flags or support a different MXCSR configuration. */
function calculate(a: number, b: number, op: 'add'|'sub'|'mul'|'div', s?: ModelBakeArithmeticServices): number {
  if(nan(a)&&nan(b)&&a!==b) {if(s)return s.resolveDualNaN(op,a,b);throw new NativeModelBakeArithmeticBoundary(op,a,b);}
  if (nan(a)) return (a | 0x400000) >>> 0;
  if (nan(b)) return (b | 0x400000) >>> 0;
  const x = numericFloatValue(a), y = numericFloatValue(b);
  const n = op === 'add' ? x+y : op === 'sub' ? x-y : op === 'mul' ? x*y : x/y;
  return Number.isNaN(n) ? 0xffc00000 : numericFloatBits(n);
}
const squareRoot = (a: number) => nan(a) ? (a | 0x400000) >>> 0 : numericFloatValue(a) < 0 ? 0xffc00000 : numericFloatBits(Math.sqrt(numericFloatValue(a)));
const half = [0x3f000000,0x3f000000,0x3f000000,0], two = [0x40000000,0x40000000,0x40000000,0];
const axes = [[0x3f800000,0,0,0],[0,0x3f800000,0,0],[0,0,0x3f800000,0]];

/** Whole MeshInstance initializer 0x10045f880. Reads and writes retain native
 * ordering even when output overlaps resource metadata or the selected LOD. */
export function initializeOriginalMeshInstance(m: ModelBakeMemory, out: bigint, data: bigint, bake: bigint, lodIndex: number, s?: ModelBakeArithmeticServices): void {
  const calc=(a:number,b:number,op:'add'|'sub'|'mul'|'div')=>calculate(a,b,op,s);
  const vector=(a:number[],b:number[],op:'add'|'sub'|'mul'|'div')=>a.map((n,i)=>calc(n,b[i],op));
  const index = lodIndex | 0;
  m.write64(out,data); m.write32(out+16n,index);
  if (index < 0 || (m.read32(data+64n)|0) <= index)
    throw new NativeObjectFoundationFailure('MeshInstance.cpp',60,3,'m_lodIndex >= 0 && m_lodIndex < m_data->lodCount');
  m.write64(out+8n,bake);
  const lod = m.read64(data+72n)+BigInt(index)*0xb8n;
  const xyz = (offset: number) => [0,4,8].map(i => m.read32(lod+BigInt(offset+i))).concat(0);
  const store = (offset: number, v: number[]) => v.forEach((n,i) => m.write32(out+BigInt(offset+i*4),n));
  const min = xyz(4), max = xyz(16), delta = vector(max,min,'sub');
  const center = vector(vector(min,half,'mul'),vector(max,half,'mul'),'add');
  store(32,center);
  const squares = vector(delta,delta,'mul');
  m.write32(out+24n,calc(squareRoot(calc(squares[2],calc(squares[0],squares[1],'add'),'add')),0x3f000000,'mul'));
  center[3] = 0x3f800000;
  const extent = vector(delta,two,'div');
  axes.forEach((axis,i) => store(48+i*16,vector(Array(4).fill(extent[i]),axis,'mul')));
  store(96,center);
  // Secondary bounds are loaded after the first sphere and OBB have been
  // stored. Copying both input boxes at entry breaks supported alias cases.
  const secondaryMin = xyz(28), secondaryMax = xyz(40);
  const secondaryCenter = vector(vector(secondaryMin,secondaryMax,'add'),two,'div');
  const secondaryExtent = vector(vector(secondaryMax,secondaryMin,'sub'),two,'div');
  secondaryCenter[3] = 0x3f800000;
  axes.forEach((axis,i) => store(112+i*16,vector(Array(4).fill(secondaryExtent[i]),axis,'mul')));
  store(160,secondaryCenter); m.write8(out+20n,1);
}

export interface ModelBakeRef { handle: bigint; }
export interface ModelBakeServices {
  arithmetic?: ModelBakeArithmeticServices;
  createRef(): ModelBakeRef;
  meshType(): bigint;
  levelType(): bigint;
  lookup(manager: bigint, type: bigint, name: bigint): bigint;
  request(manager: bigint, typeName: bigint, name: bigint): void;
  observe(resource: bigint, ref: ModelBakeRef): void;
  destroyRef(ref: ModelBakeRef): void;
  failedBake(meshName: string, signedGuid: number): void;
}
/** Complete normal body 0x1004653c0: query registered Mesh LOD count through
 * a temporary ResourceRef. Missing names assert rather than request a load.
 * Failed observation preserves the active reference at the assertion. */
export function getOriginalModelMeshLodCount(m: ModelBakeMemory, meshName: bigint, manager: bigint, s: ModelBakeServices): number {
  const ref=s.createRef(),found=s.lookup(manager,s.meshType(),meshName);
  if(!found)throw new NativeObjectFoundationFailure('Model.cpp',222,4,'found');
  s.observe(found,ref);
  const resource=ref.handle?m.read64(ref.handle+16n):0n;
  if(!resource)throw new NativeObjectFoundationFailure('./Mesh.h',109,3,'Observed()');
  const count=m.read32(resource+0xe8n);
  s.destroyRef(ref);
  return count;
}
/** Whole unbaked consumer 0x10045f770. A registered, observed Mesh whose
 * +0x108 ready byte is zero leaves the first 21 output bytes cleared and
 * skips initialization, including the initializer's signed LOD assertion. */
export function loadOriginalUnbakedMeshInstance(m: ModelBakeMemory, out: bigint, manager: bigint, meshName: bigint, lodIndex: number, s: ModelBakeServices): void {
  m.bytes(out,21).fill(0);
  const ref=s.createRef(),found=s.lookup(manager,s.meshType(),meshName);
  if(found)s.observe(found,ref);else s.request(manager,m.read64(s.meshType()+8n),meshName);
  const resource=ref.handle?m.read64(ref.handle+16n):0n;
  if(!resource)throw new NativeObjectFoundationFailure('./Mesh.h',109,3,'Observed()');
  if(m.bytes(resource+0x108n,1)[0])initializeOriginalMeshInstance(m,out,resource+0xa8n,0n,lodIndex,s.arithmetic);
  s.destroyRef(ref);
}
/** Whole 0x1003f68d0 pointer-table lookup, including unchanged output on miss. */
export function findOriginalModelBake(m: ModelBakeMemory, ref: ModelBakeRef, guid: number): bigint {
  if (!ref.handle) return 0n;
  const resource = m.read64(ref.handle+16n);
  if (!resource || (m.read32(resource+0x264n)|0) < 0) return 0n;
  const count = m.read32(resource+0xd0n), records = m.read64(resource+0xe8n);
  for (let i=0;i<count;i++) {const record=records+BigInt(i)*48n; if (m.read32(record+24n)===(guid>>>0)) return record;}
  return 0n;
}
/** Model mesh resource consumer 0x10045fa00. Resource manager, observation,
 * diagnostic streams and reference destruction are explicit dependencies.
 * This creates MeshInstance data; it does not allocate/bind a Model object. */
export function loadOriginalModelMeshInstance(m: ModelBakeMemory, out: bigint, manager: bigint, levelName: bigint, meshName: bigint, guid: number, lodIndex: number, s: ModelBakeServices): void {
  m.bytes(out,21).fill(0);
  const meshRef=s.createRef(), meshType=s.meshType(), meshFound=s.lookup(manager,meshType,meshName);
  if(meshFound) s.observe(meshFound,meshRef); else s.request(manager,m.read64(s.meshType()+8n),meshName);
  const mesh=meshRef.handle?m.read64(meshRef.handle+16n):0n;
  if(!mesh) throw new NativeObjectFoundationFailure('./Mesh.h',109,3,'Observed()');
  const levelRef=s.createRef(), levelType=s.levelType(), levelFound=s.lookup(manager,levelType,levelName);
  if(levelFound) s.observe(levelFound,levelRef); else s.request(manager,m.read64(s.levelType()+8n),levelName);
  const record=findOriginalModelBake(m,levelRef,guid),data=mesh+0xa8n;
  const compatible=record!==0n && m.read32(m.read64(mesh+0xf0n)+52n)===m.read32(m.read64(record+40n));
  initializeOriginalMeshInstance(m,out,data,compatible?record:0n,lodIndex,s.arithmetic);
  if(compatible) initializeOriginalMeshInstance(m,out,data,record,lodIndex,s.arithmetic);
  else {s.failedBake(m.string(meshName),guid|0);initializeOriginalMeshInstance(m,out,data,0n,lodIndex,s.arithmetic);}
  s.destroyRef(levelRef);s.destroyRef(meshRef);
}
