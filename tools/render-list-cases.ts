import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {initializeOriginalVertexRender} from '../src/core/vertex-render-runtime';
import {submitOriginalModelToRenderLists} from '../src/core/model-submit-runtime';
import {resetOriginalRenderable} from '../src/core/render-pipeline-runtime';
import {
  registerOriginalRenderList, unregisterOriginalRenderList, appendOriginalRenderList,
  queueOriginalVertexRender, countOriginalRenderPrimitives, endOriginalVertexRenderQueue,
  findOriginalRenderListContext, setOriginalRenderListContext, originalRenderListServices,
} from '../src/core/render-list-runtime';

export interface RenderListCase {name: string; memory: string; actions: number[][];}
export interface RenderListSnapshot {
  result: number; line: number; severity: number; source: string; expression: string;
  events: number[][]; memory: string;
}
export function evaluateRenderList(input: RenderListCase): RenderListSnapshot[] {
  const b = Buffer.from(input.memory, 'hex'), base = 0x300000000n;
  const at = (a: bigint) => Number(a - base), ptr = (a: number) => a ? base + BigInt(a) : 0n;
  const off = (a: bigint) => a ? at(a) : 0;
  const m = {
    bytes: (a: bigint, n: number) => b.subarray(at(a), at(a) + n),
    read8: (a: bigint) => b[at(a)], write8: (a: bigint, n: number) => {b[at(a)] = n;},
    read32: (a: bigint) => b.readUInt32LE(at(a)), write32: (a: bigint, n: number) => {b.writeUInt32LE(n >>> 0, at(a));},
    read64: (a: bigint) => b.readBigUInt64LE(at(a)), write64: (a: bigint, n: bigint) => {b.writeBigUInt64LE(n, at(a));},
    string: (a: bigint) => b.subarray(at(a), b.indexOf(0, at(a))).toString(),
  };
  return input.actions.map(([op, aa = 0, bb = 0, cc = 0, dd = 0]) => {
    const a = ptr(aa), c = ptr(cc), d = ptr(dd), p = ptr(bb);
    const events: number[][] = [], event = (id: number, ...values: number[]) => events.push([id, ...values, ...Array(5 - values.length).fill(0)]);
    let result = 0, line = 0, severity = 0, source = '', expression = '', updates = 0;
    const shared = originalRenderListServices(m);
    try {
      switch (op) {
        case 0: registerOriginalRenderList(m, a, p); break;
        case 1: unregisterOriginalRenderList(m, a, p); break;
        case 2: shared.queue(a); break;
        case 3: appendOriginalRenderList(m, a, p); break;
        case 4: result = countOriginalRenderPrimitives(m, a); break;
        case 5: endOriginalVertexRenderQueue(m, a); break;
        case 6: result = +findOriginalRenderListContext(m, a, p, c, d); break;
        case 7: setOriginalRenderListContext(m, a, p, c, dd, {
          updateRenderFormat: (render, format, context) => {
            const list = off(format) - 0xc0;
            event(6, off(render), off(format), off(context), b[list + 0x3c]);
            const mode = b.readUInt32LE(0x7000);
            if (updates++ === 0) {
              if (mode === 1) m.write32(ptr(list + 0x18), 1);
              if (mode === 2) m.write64(ptr(list), ptr(0x780));
              if (mode === 3) m.write64(ptr(0x608), 0n);
              if (mode === 4) m.write32(ptr(list + 0x18), 4);
            }
          },
        }); break;
        case 8: initializeOriginalVertexRender(m, a, p, c, d, 4, {
          graphics: () => {event(1, 0x7400); return ptr(0x7400);},
          createProgram: (g, definition) => {event(2, off(g), off(definition), m.read32(definition), 0x12345678); return 0x12345678;},
          initializeParameters: (out, program) => {
            event(3, off(out), program); m.write32(out, program);
            m.write64(out+0x158n,ptr(0x6500));m.write64(out+0x148n,ptr(0x6700));m.write32(out+0x164n,program);m.write32(out+0x160n,0x5678);
          },
          bindVertexData: (out, data, count, offset) => {event(4, off(out), off(data), count, offset); m.write64(out + 8n, data);},
          copyBytes: (out, data, length) => {event(5, off(out), off(data), length); m.bytes(out, length).set(m.bytes(data, length));},
        }); break;
        case 9: submitOriginalModelToRenderLists(m, a, () => false); break;
        case 10: m.write8(a, bb); break;
        case 11: m.write32(a, bb); break;
        case 12: m.write64(a, p); break;
        case 13: resetOriginalRenderable(m,a,{
          graphics:()=>{event(1,0x7400);return ptr(0x7400);},
          allocator:()=>ptr(0x6300),tag:()=>{throw new Error('Unexpected allocation tag');},
          free:(allocator,pointer)=>{event(8,off(allocator),off(pointer));},
          destroyParameterSet:(g,p)=>{event(7,off(g),p);},destroyProgram:(g,p)=>{event(9,off(g),p);},defaultMatrix:()=>ptr(0x6200),
          reflection:()=>{throw new Error('Unexpected reflection creation');},createParameterSet:()=>{throw new Error('Unexpected parameter creation');},
          bindVertexBuffer:()=>{throw new Error('Unexpected vertex binding');},createBuffer:()=>{throw new Error('Unexpected buffer creation');},
          allocate:()=>{throw new Error('Unexpected allocation');},detachBuffer:()=>{throw new Error('Unexpected buffer detach');},destroyBuffer:()=>{throw new Error('Unexpected buffer destroy');},
        }); break;
        default: throw new Error('Unknown action');
      }
    } catch (error) {
      if (!(error instanceof NativeObjectFoundationFailure)) throw error;
      line = error.line; severity = error.severity; source = error.file; expression = error.expression;
    }
    return {result, line, severity, source, expression, events, memory: b.toString('hex')};
  });
}

export function createRenderListCases(): RenderListCase[] {
  const cases: RenderListCase[] = [], base = 0x300000000n;
  const list = 0x100, slots = 0x600, queue = 0x800, render = 0x1000, data = 0x4000;
  const action = (op: number, ...args: number[]) => [op, ...args, ...Array(4 - args.length).fill(0)];
  function add(name: string, actions: number[][], configure?: (b: Buffer, u: (a: number, n: number) => void, q: (a: number, n: number) => void) => void) {
    const b = Buffer.alloc(32768);
    for (let i = 0; i < b.length; i++) b[i] = (i * 13 + cases.length * 41) & 255;
    const u = (a: number, n: number) => {b.writeUInt32LE(n >>> 0, a);};
    const q = (a: number, n: number) => {b.writeBigUInt64LE(n ? base + BigInt(n) : 0n, a);};
    for(const at of [0x7400,0x75a8,0x75c0,0x75d8])b.fill(0,at,at+8);
    q(list, slots); q(list + 0x10, queue); u(list + 8, 0); u(list + 0x18, 8); b[list + 0x3c] = 1;
    b.fill(0, slots, slots + 64); b.fill(0, 0x780, 0x7c0); u(0x7000, 0);
    u(list + 0xc8, 1); b[data + 0x3f8] = 1; u(0x5000, 123);
    for (const r of [render, 0x1800, 0x2000, 0x2800]) {
      q(r, data); q(r + 0x500, list); u(r + 0x508, 0); u(r + 0x50c, 30);
      u(r + 0x514, 0); u(r + 0x518, 0); u(r + 0x524, 4); u(r + 0x53c, 0);
      b[r + 0x528] = 0; b[r + 0x529] = 1; b[r + 0x52a] = 0; b[r + 0x538] = 1;
      for (let i = 0; i < 4; i++) {u(r + 0x540 + i * 12, i * 3); u(r + 0x544 + i * 12, 6);}
    }
    for (let i = 0; i < 2; i++) {u(data + 0x244 + i * 0x38, 30); u(data + 0x250 + i * 0x38, 1);}
    u(data + 0x13c, 60);
    q(0x6508,0x6600);u(0x6648,0);
    for(let i=0;i<16;i++)u(0x6200+i*4,i%5===0?0x3f800000:0);
    configure?.(b, u, q);
    cases.push({name, memory: b.toString('hex'), actions});
  }
  for (const capacity of [0, 1, 2, 7, 8]) {
    add(`registration holes duplicates capacity ${capacity}`, [action(0,list,0), action(0,list,render), action(0,list,render), action(0,list,0x1800), action(1,list,render), action(0,list,0x2000)], (_b,u) => u(list+0x18,capacity));
  }
  add('registration reuses first hole', [action(0,list,render),action(0,list,0x2000)], (_b,_u,q) => {q(slots,0x1800);q(slots+16,0x2800);});
  for (const count of [0, 1, 2, 3, 4, 5, 7, 8, 13]) for (const target of [0, render, 0x1800, 0x2800]) {
    add(`stable unregister count ${count} target ${target}`, [action(1,list,target)], (_b,u,q) => {
      u(list+8,count);for(let i=0;i<count;i++)q(queue+i*8,[render,0,0x1800,render,0x2000][i%5]);
      for(let i=0;i<8;i++)q(slots+i*8,[render,0x1800,render,0][i%4]);
    });
  }
  for (const indexed of [0, 1, 7]) for (const topology of [0, 1, 2, 3, 4, 5, 6]) for (const chunks of [-1, 0, 1, 3]) {
    add(`primitive eligibility indexed ${indexed} topology ${topology} chunks ${chunks}`, [action(4,render),action(2,render),action(2,render),action(5,render),action(11,list+8,0),action(2,render)], (b,u) => {
      u(data+0x250,indexed);u(render+0x524,topology);b[render+0x528]=chunks<0?0:1;u(render+0x53c,Math.max(chunks,0));u(render+0x518,3);u(render+0x514,9);
    });
  }
  for (const initialized of [0, 1, 2, 255]) for (const enabled of [0, 1, 255]) for (const queued of [0, 1, 2]) {
    add(`queue gates initialized ${initialized} enabled ${enabled} queued ${queued}`, [action(2,render)], b => {b[render+0x538]=initialized;b[render+0x529]=enabled;b[render+0x52a]=queued;});
  }
  for (const indexed of [0,1]) for (const offset of [30,31,60,61,0xffffffff]) {
    add(`offset assertion indexed ${indexed} offset ${offset}`, [action(4,render),action(2,render)], (_b,u) => {u(data+0x250,indexed);u(render+(indexed?0x518:0x514),offset);});
  }
  for (const indexed of [0,1]) for (const offset of [30,31,0xffffffff]) {
    add(`chunk assertion indexed ${indexed} offset ${offset}`, [action(4,render),action(2,render)], (b,u) => {u(data+0x250,indexed);b[render+0x528]=1;u(render+0x53c,1);u(render+0x540,offset);});
  }
  add('uint32 chunk sum wraps', [action(4,render),action(2,render)], (b,u) => {u(data+0x244,0xffffffff);b[render+0x528]=1;u(render+0x53c,3);for(let i=0;i<3;i++){u(render+0x540+i*12,0);u(render+0x544+i*12,0xffffffff);}});
  add('selected index buffer one', [action(4,render),action(2,render)], (_b,u) => {u(render+0x508,1);u(data+0x27c,5);});
  add('missing list still marks queued', [action(2,render),action(2,render),action(5,render)], (_b,_u,q) => q(render+0x500,0));
  add('zero primitives remain unqueued', [action(2,render),action(2,render)], (_b,u) => u(render+0x50c,2));
  add('append requires initialized but permits duplicates', [action(3,list,render),action(3,list,render),action(10,render+0x538,0),action(3,list,render)]);
  add('unregister does not clear queued flag', [action(0,list,render),action(2,render),action(1,list,render),action(2,render),action(5,render),action(2,render)]);
  for (const ready of [0, 1, 255]) for (const outputs of [[0,0,0],[0x7100,0x7108,0x7110],[0x7100,0x7100,0x7100],[list+0xe0,0x7108,list+0xe0]]) {
    add(`context lookup ready ${ready} outputs ${outputs}`, [action(6,list,...outputs)], b => {b[list+0x3c]=ready;});
  }
  for (const mutation of [0,1,2,3,4]) for (const ready of [0,1]) {
    add(`context refresh live mutation ${mutation} ready ${ready}`, [action(7,list,0x6000,0x6100,255),action(6,list,0x7100,0x7108,0x7110)], (b,u,q) => {
      b[list+0x3c]=ready;u(list+0x18,mutation===4?1:8);u(0x7000,mutation);
      for(let i=0;i<4;i++){q(slots+i*8,render+i*0x800);q(0x780+i*8,0x2800-i*0x800);}
    });
  }
  for (const aliases of [[list+0x40,list+0xc0],[list+0xc0,list+0x40],[0x6000,list+0x60]]) {
    add(`context copy alias ${aliases}`, [action(7,list,...aliases,7)], (_b,u) => u(list+0x18,0));
  }
  for (const ready of [0,1]) for (const capacity of [0,1,8]) for (const initialized of [0,1,2]) {
    add(`whole initialize list ready ${ready} capacity ${capacity} initialized ${initialized}`, [action(8,render,data,0x5000,list), ...(ready && capacity && initialized !== 1 ? [action(2,render)] : [])], (b,u,q) => {
      q(render,0);b[render+0x538]=initialized;b[list+0x3c]=ready;u(list+0x18,capacity);
    });
  }
  for (const problem of ['null list','incomplete data','existing vertex data','undefined format']) {
    add(`initialize failure ${problem}`, [action(8,render,data,0x5000,problem==='null list'?0:list)], (b,u,q) => {
      b[render+0x538]=0;q(render,problem==='existing vertex data'?data:0);
      if(problem==='incomplete data')b[data+0x3f8]=0;if(problem==='undefined format')u(list+0xc8,0);
    });
  }
  for (const mode of [0,1,2,7]) for (const skirt of [0,1]) {
    add(`whole Model submit to actual queue mode ${mode} skirt ${skirt}`, [action(9,0x6800),action(9,0x6800),action(5,render),action(5,0x1800),action(5,0x2000),action(11,list+8,0),action(9,0x6800)], (b,u,q) => {
      const model=0x6800;b[model+0x227]=1;b[model+0x32d]=1;u(model+0x8c,1);u(model+0x90,0);u(model+0x94,0);u(model+0x98,0);u(model+0x354,mode);b[model+0x391]=skirt;
      for(const [field,table,item] of [[0x28,0x7200,render],[0x30,0x7210,0x1800],[0x40,0x7220,0x2000]]){q(model+field,table);q(table,item);}
    });
  }
  add('whole initialize queue reset reinitialize lifecycle', [action(8,render,data,0x5000,list),action(2,render),action(13,render),action(8,render,data,0x5000,list),action(2,render),action(13,render)], (b,_u,q)=>{q(render,0);b[render+0x538]=0;});
  for(const initialized of [0,1,2,255])for(const pipeline of [0,0xffffffff]) {
    add(`whole reset unregister initialized ${initialized} pipeline ${pipeline}`, [action(13,render),action(13,render)], (b,u,q)=>{
      b[render+0x538]=initialized;u(render+0x270+0x164,pipeline);q(render+0x270+0x158,0x6500);q(render+0x270+0x148,0x6700);
      for(let i=0;i<4;i++)q(slots+i*8,[render,0x1800,render,0x2000][i]);
      u(list+8,5);for(let i=0;i<5;i++)q(queue+i*8,[render,0x1800,render,0x2000,render][i]);
    });
  }
  return cases;
}
