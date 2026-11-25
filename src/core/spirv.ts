// Reflect the compiled interface, rather than guessing offsets from GLSL text.
// SPIR-V opcodes/decorations follow the Khronos unified grammar.
export type SpirvStage = 'vert' | 'frag';
export interface SpirvType {
  kind: 'float' | 'int' | 'uint' | 'bool' | 'vector' | 'matrix' | 'array' | 'struct' | 'image' | 'sampler';
  bytes: number;
  element?: SpirvType;
  count?: number;
  stride?: number;
  rowMajor?: boolean;
  dimension?: '1D' | '2D' | '3D' | 'Cube' | 'Rect' | 'Buffer' | 'Subpass';
  arrayed?: boolean;
  multisampled?: boolean;
  members?: { name: string; offset: number; type: SpirvType }[];
}
export interface SpirvInterface { name: string; location: number; type: SpirvType; }
export interface SpirvDescriptor {
  name: string; set: number; binding: number; count: number;
  kind: 'uniform-buffer' | 'combined-image-sampler' | 'sampled-image' | 'storage-image' | 'sampler';
  type: SpirvType; stages: SpirvStage[];
}
export interface SpirvReflection { stage: SpirvStage; entryPoint: string; inputs: SpirvInterface[]; outputs: SpirvInterface[]; descriptors: SpirvDescriptor[]; }
type Instruction = { op: number; a: number[] };

export function reflectSpirv(bytes: Uint8Array, stage: SpirvStage): SpirvReflection {
  if (bytes.byteLength < 20 || bytes.byteLength % 4) throw new Error('SPIR-V 数据长度无效');
  const view = new DataView(bytes.buffer, bytes.byteOffset, bytes.byteLength);
  const words = Array.from({ length: bytes.byteLength / 4 }, (_, i) => view.getUint32(i * 4, true));
  if (words[0] !== 0x07230203 || words[4] !== 0) throw new Error('SPIR-V 文件头无效');
  const instructions: Instruction[] = [];
  for (let at = 5; at < words.length;) {
    const length = words[at] >>> 16, op = words[at] & 65535;
    if (!length || at + length > words.length) throw new Error('SPIR-V 指令截断');
    instructions.push({ op, a: words.slice(at + 1, at + length) }); at += length;
  }
  const string = (a: number[]) => {
    const b = new Uint8Array(a.length * 4); const v = new DataView(b.buffer);
    a.forEach((n, i) => v.setUint32(i * 4, n, true));
    const end = b.indexOf(0); if (end < 0) throw new Error('SPIR-V 字符串缺少终止符');
    return new TextDecoder().decode(b.subarray(0, end));
  };
  const names = new Map<number, string>(), memberNames = new Map<string, string>();
  const decorations = new Map<number, Map<number, number[]>>(), members = new Map<string, Map<number, number[]>>();
  const types = new Map<number, Instruction>(), constants = new Map<number, number>();
  let entryPoint = '';
  for (const i of instructions) {
    const a = i.a;
    if (i.op === 5) names.set(a[0], string(a.slice(1)));
    else if (i.op === 6) memberNames.set(`${a[0]}:${a[1]}`, string(a.slice(2)));
    else if (i.op === 15 && a[0] === (stage === 'vert' ? 0 : 4)) {
      if (entryPoint) throw new Error('SPIR-V 多入口程序尚未支持');
      entryPoint = string(a.slice(2));
    } else if (i.op === 71 || i.op === 72) {
      const key = i.op === 71 ? a[0] : `${a[0]}:${a[1]}`;
      const at = i.op === 71 ? 1 : 2;
      // The union key is handled separately to keep the public maps typed.
      if (typeof key === 'number') { const d = decorations.get(key) ?? new Map(); d.set(a[at], a.slice(at + 1)); decorations.set(key, d); }
      else { const d = members.get(key) ?? new Map(); d.set(a[at], a.slice(at + 1)); members.set(key, d); }
    } else if (i.op >= 19 && i.op <= 33) types.set(a[0], i);
    else if (i.op === 43) constants.set(a[1], a[2]);
  }
  if (!entryPoint) throw new Error('SPIR-V 缺少指定阶段入口');
  const decoration = (id: number, kind: number) => decorations.get(id)?.get(kind)?.[0];
  const type = (id: number, layout?: Map<number, number[]>): SpirvType => {
    const i = types.get(id); if (!i) throw new Error(`SPIR-V 未知类型 ${id}`);
    const a = i.a;
    if (i.op === 20) return { kind: 'bool', bytes: 4 };
    if (i.op === 21 || i.op === 22) {
      if (a[1] !== 32) throw new Error('SPIR-V 目前只支持 32 位数值接口');
      return { kind: i.op === 22 ? 'float' : a[2] ? 'int' : 'uint', bytes: 4 };
    }
    if (i.op === 23) { const element = type(a[1]); return { kind: 'vector', count: a[2], element, bytes: element.bytes * a[2] }; }
    if (i.op === 24) {
      const element = type(a[1]), count = a[2], rowMajor = layout?.has(4) ?? false;
      const stride = layout?.get(7)?.[0] ?? element.bytes;
      return { kind: 'matrix', element, count, stride, rowMajor, bytes: stride * (rowMajor ? element.count! : count) };
    }
    if (i.op === 28) {
      const count = constants.get(a[2]); if (!count || count > 1000000) throw new Error('SPIR-V 数组长度无效');
      const element = type(a[1], layout), stride = decoration(id, 6) ?? element.bytes;
      return { kind: 'array', element, count, stride, bytes: stride * count };
    }
    if (i.op === 30) {
      const fields = a.slice(1).map((memberType, j) => {
        const d = members.get(`${id}:${j}`), offset = d?.get(35)?.[0];
        if (offset === undefined) throw new Error('SPIR-V 结构成员没有内存偏移');
        return { name: memberNames.get(`${id}:${j}`) ?? `member${j}`, offset, type: type(memberType, d) };
      });
      return { kind: 'struct', members: fields, bytes: Math.ceil(fields.reduce((n, f) => Math.max(n, f.offset + f.type.bytes), 0) / 16) * 16 };
    }
    if (i.op === 25) {
      const dimension = (['1D', '2D', '3D', 'Cube', 'Rect', 'Buffer', 'Subpass'] as const)[a[2]];
      if (!dimension) throw new Error('SPIR-V 图像维度无效');
      return { kind: 'image', bytes: 0, element: type(a[1]), dimension, arrayed: !!a[4], multisampled: !!a[5] };
    }
    if (i.op === 26) return { kind: 'sampler', bytes: 0 };
    if (i.op === 27 || i.op === 32) return type(a[i.op === 27 ? 1 : 2], layout);
    throw new Error(`SPIR-V 接口类型暂未支持 ${i.op}`);
  };
  const result: SpirvReflection = { stage, entryPoint, inputs: [], outputs: [], descriptors: [] };
  for (const i of instructions.filter(i => i.op === 59)) {
    const [pointer, id, storage] = i.a, location = decoration(id, 30);
    if ((storage === 1 || storage === 3) && location !== undefined) {
      (storage === 1 ? result.inputs : result.outputs).push({ name: names.get(id) ?? `id${id}`, location, type: type(pointer) });
    } else if ((storage === 0 || storage === 2) && decoration(id, 33) !== undefined) {
      const set = decoration(id, 34), binding = decoration(id, 33)!;
      if (set === undefined) throw new Error('SPIR-V descriptor 缺少 set');
      let value = types.get(types.get(pointer)!.a[2])!, count = 1;
      while (value.op === 28) { count *= constants.get(value.a[2])!; value = types.get(value.a[1])!; }
      const kind = storage === 2 ? 'uniform-buffer' : value.op === 27 ? 'combined-image-sampler' : value.op === 26 ? 'sampler' : value.op === 25 ? value.a[6] === 2 ? 'storage-image' : 'sampled-image' : undefined;
      if (!kind) throw new Error('SPIR-V descriptor 类型暂未支持');
      result.descriptors.push({ name: kind === 'uniform-buffer' ? names.get(value.a[0]) ?? names.get(id) ?? `id${id}` : names.get(id) ?? `id${id}`, set, binding, count, kind, type: type(value.a[0]), stages: [stage] });
    }
  }
  result.inputs.sort((a, b) => a.location - b.location); result.outputs.sort((a, b) => a.location - b.location);
  result.descriptors.sort((a, b) => a.set - b.set || a.binding - b.binding);
  return result;
}

export function mergeSpirvDescriptors(stages: SpirvReflection[]) {
  const bindings = new Map<string, SpirvDescriptor>();
  for (const stage of stages) for (const d of stage.descriptors) {
    const key = `${d.set}:${d.binding}`, prior = bindings.get(key);
    if (prior) {
      if (prior.kind !== d.kind || prior.count !== d.count || prior.name !== d.name || JSON.stringify(prior.type) !== JSON.stringify(d.type)) throw new Error(`SPIR-V 阶段资源布局冲突 ${key}`);
      prior.stages.push(...d.stages.filter(s => !prior.stages.includes(s)));
    } else bindings.set(key, { ...d, stages: [...d.stages] });
  }
  return [...bindings.values()].sort((a, b) => a.set - b.set || a.binding - b.binding);
}

// Values are explicit; a missing global must never become invented lighting.
// Matrices use column-major input (the Three/math convention), including when
// the compiled block uses row-major storage. Array/matrix padding is preserved.
type UniformWriter=(view:DataView,value:unknown,offset:number)=>void;
const uniformWriters=new WeakMap<SpirvType,UniformWriter>();
// Reflection layouts are immutable. Resolve their tree and names once, and
// read array/typed-array values directly instead of copying every matrix.
function uniformWriter(t:SpirvType,name:string):UniformWriter {
  if(t.kind==='struct'){
    const members=t.members!.map(m=>({name:m.name,offset:m.offset,write:uniformWriter(m.type,`${name}.${m.name}`)}));
    return (view,value,offset)=>{
      if(value===undefined)throw new Error(`缺少 Vulkan uniform ${name}`);
      if(!value||typeof value!=='object')throw new Error(`uniform ${name} 必须是对象`);
      for(const m of members)m.write(view,(value as Record<string,unknown>)[m.name],offset+m.offset);
    };
  }
  if(t.kind==='array'||t.kind==='vector'||t.kind==='matrix'){
    const matrix=t.kind==='matrix',rows=matrix?t.element!.count!:0,n=matrix?t.count!*rows:t.count!,stride=t.stride??t.element!.bytes;
    const child=uniformWriter(matrix?t.element!.element!:t.element!,name);
    const offsets=Array.from({length:n},(_,i)=>matrix?(t.rowMajor?i%rows*stride+Math.floor(i/rows)*4:Math.floor(i/rows)*stride+i%rows*4):i*stride);
    return (view,value,offset)=>{
      if(value===undefined)throw new Error(`缺少 Vulkan uniform ${name}`);
      if(!Array.isArray(value)&&!ArrayBuffer.isView(value))throw new Error(`uniform ${name} 必须是数组`);
      const a=value as ArrayLike<unknown>;
      if(a.length!==n)throw new Error(`uniform ${name} 分量数量错误`);
      for(let i=0;i<n;i++)child(view,a[i],offset+offsets[i]);
    };
  }
  return (view,value,offset)=>{
    if (value === undefined) throw new Error(`缺少 Vulkan uniform ${name}`);
    if (t.kind === 'bool') {
      if (typeof value !== 'boolean') throw new Error(`uniform ${name} 必须是布尔值`);
      view.setUint32(offset, value ? 1 : 0, true);
    } else if (t.kind === 'float' || t.kind === 'int' || t.kind === 'uint') {
      // glslang lowers block booleans to 32-bit integers in SPIR-V. Explicit
      // booleans therefore have the same 0/1 representation as GLSL expects.
      if ((t.kind === 'int' || t.kind === 'uint') && typeof value === 'boolean') value = value ? 1 : 0;
      if (typeof value !== 'number' || !Number.isFinite(value) || (t.kind === 'float' ? Math.abs(value) > 3.4028234663852886e38 : !Number.isInteger(value) || value < (t.kind === 'int' ? -2147483648 : 0) || value > (t.kind === 'int' ? 2147483647 : 4294967295))) throw new Error(`uniform ${name} 数值无效`);
      if (t.kind === 'float') view.setFloat32(offset, value, true);
      else if (t.kind === 'int') view.setInt32(offset, value, true);
      else view.setUint32(offset, value, true);
    } else throw new Error(`uniform ${name} 不是数值类型`);
  };
}
export function packSpirvUniforms(block: SpirvType, values: Record<string, unknown>): Uint8Array {
  if(block.kind!=='struct')throw new Error('uniform block 必须是结构');
  let write=uniformWriters.get(block);if(!write){write=uniformWriter(block,'SkyGlobals');uniformWriters.set(block,write);}
  const bytes=new Uint8Array(block.bytes);write(new DataView(bytes.buffer),values,0);return bytes;
}
