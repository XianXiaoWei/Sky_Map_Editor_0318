import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
export const FOUNDATION_REGISTRY = 0x230000000n, FOUNDATION_OBJECTS = 0x240000000n, FOUNDATION_BARN = FOUNDATION_REGISTRY + 0xa000n;
export const FOUNDATION_EVENT_BARN=0x260000000n;
export interface FoundationCase {
  name: string; kind: number; id: number; nullObject: boolean; query: string; objectHex: string; classId: number;
  types: { name: string; id: number; index: number }[];
  overrides: { index: number; abstract?: boolean; polymorphic?: boolean; conversionNull?: boolean; cache?: string; fresh?: string; destination?: number }[];
  factory?: { keyIndex: number | null; signature: number; parent?: boolean; missingCreate?: boolean; missingRelease?: boolean; returnNull?: boolean; receiverCastFails?: boolean; resultCastFails?: boolean; moduleCastFails?: boolean; priority?: number; valueBarn?: boolean; classConversionNull?: boolean };
  value?: { empty?: boolean; castFails?: boolean; noBacklink?: boolean; slot?: number };
  tgcl?: { valuesHex: string[]; indices: number[]; autoStart: number; order: number[]; repetitions: number;
    eventFailure?:'exhausted'|'occupied'|'cast'|'nonEvent'|'unregisteredEvent';loadedBeforeRelease?:boolean;duplicateRelease?:boolean;
    truncatedFields?:boolean;
    eventClass?:'FloatAdd'|'SetFloat';
    eventFields?:{type:0|2;offset:number;raw:string}[];
    frameTime?:[number,number,number][];speedOverrideEnabled?:boolean;
    frameWrites?:{frame:number;valueIndex:number;bits:string}[];
    trigger?:{autoDispatch:boolean;nextUnique?:number;initialTypes?:{id:number;count:number}[];maxTypeIndex?:number;mutateTypeCounter?:number;resetTypeMap?:boolean;frameActions?:number[]};
    source?: { level: string; nodeId: number; floatNodes: number[]; sha256: string } };
}
export function foundationRegistry(c: FoundationCase): Buffer {
  const b = Buffer.alloc(0x10000);
  for (let i = 0; i < 16; i++) { const at = 0x5000 + i * 0x100; b[at + 0x61] = 1; b.writeBigUInt64LE(0x31800000n + BigInt(i), at + 0x68); }
  b.writeUInt32LE(c.classId >>> 0, 0x5138);
  for (const meta of c.overrides) {
    const at = 0x5000 + meta.index * 0x100;
    if (meta.abstract !== undefined) b[at + 0x60] = Number(meta.abstract);
    if (meta.polymorphic !== undefined) b[at + 0x61] = Number(meta.polymorphic);
    if (meta.conversionNull !== undefined) b[at + 0x62] = Number(meta.conversionNull);
    if (meta.cache !== undefined) b.writeBigUInt64LE(BigInt(meta.cache), at + 0x58);
    if (meta.fresh !== undefined) b.writeBigUInt64LE(BigInt(meta.fresh), at + 0x68);
    if (meta.destination !== undefined) b.writeUInt32LE(meta.destination, at + 0x70);
  }
  // Original lookup consumes an already registered tree. Red/black balancing
  // and startup registration are separate; this supplies a valid search tree.
  const types = [...c.types].sort((a, z) => Buffer.compare(Buffer.from(a.name), Buffer.from(z.name)));
  let textAt = 0x9000;
  for (const [i, type] of types.entries()) {
    const node = 0x3000 + i * 48, text = Buffer.from(type.name + '\0');
    if (textAt + text.length > b.length || i >= 128 || type.id >= 1280) throw new Error('Foundation registry fixture capacity');
    b.writeBigUInt64LE(FOUNDATION_REGISTRY + BigInt(textAt), node + 0x20);
    const meta = FOUNDATION_REGISTRY + BigInt(0x5000 + type.index * 0x100);
    b.writeBigUInt64LE(meta, node + 0x28); b.writeBigUInt64LE(meta, 0x98 + type.id * 8);
    text.copy(b, textAt); textAt += text.length;
  }
  const tree = (start: number, end: number): bigint => {
    if (start >= end) return 0n;
    const mid = (start + end) >>> 1, node = 0x3000 + mid * 48;
    b.writeBigUInt64LE(tree(start, mid), node); b.writeBigUInt64LE(tree(mid + 1, end), node + 8);
    return FOUNDATION_REGISTRY + BigInt(node);
  };
  b.writeBigUInt64LE(tree(0, types.length), 0x70);
  if (c.factory) {
    const f = c.factory;
    if (f.keyIndex !== null) {
      b.writeBigUInt64LE(FOUNDATION_REGISTRY + 0x7100n, 0x7020);
      b.writeBigUInt64LE(FOUNDATION_REGISTRY + BigInt(0x5000 + f.keyIndex * 0x100), 0x7120);
      b.writeBigUInt64LE(f.valueBarn ? FOUNDATION_BARN : FOUNDATION_REGISTRY + 0x7300n, 0x7128);
      b.writeBigUInt64LE(FOUNDATION_REGISTRY + 0x5000n, 0x7130);
      b.writeBigUInt64LE(f.missingCreate ? 0n : FOUNDATION_REGISTRY + 0x8000n, 0x7138);
      b.writeBigUInt64LE(f.missingRelease ? 0n : FOUNDATION_REGISTRY + 0x8100n, 0x7140);
    }
    if (f.parent) { b.writeBigUInt64LE(0x102310000n, 0x5230); b.writeBigUInt64LE(FOUNDATION_REGISTRY + 0x5000n, 0x5280); }
    b.writeUInt32LE(f.signature, 0x8030); b.writeBigUInt64LE(1n, 0x8038);
    b.writeUInt32LE(1, 0x8130); b.writeBigUInt64LE(2n, 0x8138);
    b.writeUInt32LE((f.priority ?? 0) >>> 0, 0x7304);
    b[0x6f00] = Number(!!f.returnNull); b[0x6f01] = Number(!!f.receiverCastFails); b[0x6f02] = Number(!!f.resultCastFails);
    b[0x6f03] = Number(!!f.moduleCastFails);
    b[0x6f05] = Number(!!f.valueBarn);
  }
  if (c.factory?.classConversionNull) b[0x5262] = 1;
  if (c.kind >= 10) {
    const bytes = Buffer.from(c.objectHex, 'hex');
    for (let i = 0; i < 0x400; i++) b[0xa000 + i] = bytes[i % bytes.length];
    for (let i = 0; i < 80; i++) b.writeBigUInt64LE(i === 79 ? 0n : FOUNDATION_BARN + BigInt(0x18 + i * 8), 0xa010 + i * 8);
    b.writeBigUInt64LE(c.value?.empty ? 0n : FOUNDATION_BARN + BigInt(0x10 + (c.value?.slot ?? 0) * 8), 0xa290);
    b[0x6f04] = Number(!!c.value?.castFails);
    if (c.factory?.valueBarn) b.writeUInt32LE((c.factory.priority ?? 0) >>> 0, 0xa004);
  }
  if(c.kind===16&&c.tgcl){
    const t=c.tgcl,put=(at:number,to:number)=>b.writeBigUInt64LE(FOUNDATION_REGISTRY+BigInt(to),at);
    put(0x7108,0x7180);put(0x71a0,0x5300);b.writeBigUInt64LE(FOUNDATION_EVENT_BARN,0x71a8);put(0x71b0,0x5000);put(0x71b8,0x8200);put(0x71c0,0x8100);
    b.writeUInt32LE(1,0x8230);b.writeBigUInt64LE(3n,0x8238);
    b.writeUInt32LE(8,0x5338);b.writeUInt32LE(9,0x5438);
    b.writeBigUInt64LE(1n,0x5340);b.writeBigUInt64LE(1n,0x5440);
    b[0x6f06]=t.eventFailure?['exhausted','occupied','cast','nonEvent','unregisteredEvent'].indexOf(t.eventFailure)+1:0;
    b[0x6f07]=Number(!!t.loadedBeforeRelease);b[0x6f08]=Number(!!t.duplicateRelease);
    if(t.eventFailure==='nonEvent')b.writeBigUInt64LE(0n,0x5340);
    if(t.eventFailure==='unregisteredEvent')b.writeUInt32LE(0xffffffff,0x543c);
    put(0xd420,0xe000);put(0xd428,0xe080);put(0xd438,0xe100);put(0xd440,0xe200);put(0xd450,0xe500);
    put(0xd470,0xe900);put(0xd480,0xe600);b.writeUInt32LE(3,0xd488);
    [7,0,1,8,1,4].forEach((n,i)=>b.writeUInt32LE(n,0xe000+i*4));
    const defaultFields=[{type:0 as const,offset:12,raw:Buffer.from([t.autoStart]).toString('hex')},...[t.indices[0],t.indices[2],t.indices[1]].map((id,i)=>{const raw=Buffer.alloc(4);raw.writeUInt32LE(t.order.indexOf(id)>>>0);return {type:2 as const,offset:[56,72,64][i],raw:raw.toString('hex')};})];
    const eventFields=t.eventFields??defaultFields;
    const props=[{type:0,size:4,offset:16},...eventFields.map(field=>({type:field.type,size:field.type===0?Buffer.from(field.raw,'hex').length:0,offset:field.offset}))];
    b.writeUInt32LE(eventFields.length,0xe014);
    b[0x6f0a]=t.eventClass==='FloatAdd'?1:t.eventClass==='SetFloat'?2:0;
    if(t.eventClass){if(t.repetitions>128)throw new Error('Numeric frame fixture capacity');b.writeUInt32LE(t.order.length,0xec24);b[0x6f0b]=Number(t.speedOverrideEnabled!==false);
      for(let i=0;i<t.repetitions;i++){const time=t.frameTime?.[i]??[0.016,1,1];time.forEach((v,j)=>b.writeFloatLE(v,0xb600+i*12+j*4));const write=t.frameWrites?.find(w=>w.frame===i);b.writeUInt32LE(write?.valueIndex??0xffffffff,0xbc00+i*8);if(write)Buffer.from(write.bits,'hex').copy(b,0xbc04+i*8);}}

    props.forEach((p,i)=>{
      const at=0xe100+i*16;b.writeUInt32LE(p.type,at);b.writeUInt32LE(1,at+4);b.writeUInt32LE(p.size,at+8);b.writeUInt32LE(0xffffffff,at+12);
      b.writeBigUInt64LE(BigInt(p.offset),0xe200+i*32);
    });
    const ref=Buffer.concat(eventFields.map(field=>Buffer.from(field.raw,'hex')));
    const payload=Buffer.concat(t.order.map(id=>id===3?ref:Buffer.from(t.valuesHex[id],'hex')));
    payload.copy(b,0xe900);b.writeUInt32LE(t.truncatedFields?5:payload.length,0xd478);
    t.order.forEach((id,i)=>b.writeUInt32LE(id,0xec00+i*4));b.writeUInt32LE(t.repetitions,0xec20);
    if(t.trigger){
      const trigger=t.trigger;b[0x6f09]=1;b.writeUInt32LE(trigger.nextUnique??0,0xed00);b.writeUInt32LE(trigger.maxTypeIndex??255,0xed08);
      b.writeUInt32LE(trigger.mutateTypeCounter??0xffffffff,0xed0c);b.writeUInt32LE(Number(trigger.autoDispatch),0xed10);b.writeUInt32LE(Number(!!trigger.resetTypeMap),0xed14);
      b.writeUInt32LE(37,0xed18);(trigger.frameActions??[]).forEach((a,i)=>b.writeUInt32LE(a,0xee00+i*4));
      const initial=[...(trigger.initialTypes??[])].sort((a,b)=>a.id-b.id);
      if(initial.length&&((initial.length+1)&initial.length)!==0)throw new Error('Prepared trigger tree must have a complete balanced shape');
      const branch=(lo:number,hi:number,parent:bigint):bigint=>{
        if(lo===hi)return 0n;const i=(lo+hi)>>>1,at=0xf000+i*40,node=FOUNDATION_REGISTRY+BigInt(at);
        b.writeBigUInt64LE(branch(lo,i,node),at);b.writeBigUInt64LE(branch(i+1,hi,node),at+8);b.writeBigUInt64LE(parent,at+16);
        b[at+24]=1;b.writeUInt32LE(initial[i].id>>>0,at+28);b[at+32]=initial[i].count;return node;
      };
      const root=branch(0,initial.length,FOUNDATION_EVENT_BARN+0x20n);
      b.writeBigUInt64LE(root,0xed20);b.writeBigUInt64LE(initial.length?FOUNDATION_REGISTRY+0xf000n:FOUNDATION_EVENT_BARN+0x20n,0xed28);
      b.writeBigUInt64LE(BigInt(initial.length),0xed30);b.fill(0xa5,0xf800);
    }
  }
  if(c.kind===17)b.writeUInt32LE(c.classId>>>0,0x5438);
  if(c.kind===18||c.kind===19||c.kind===20){b.writeUInt32LE(9,0x5438);b.writeUInt32LE(c.classId>>>0,0x5338);}
  return b;
}
export function foundationEventBarn(c:FoundationCase):Buffer {
  const b=Buffer.alloc(0x5100),source=Buffer.from(c.objectHex,'hex');
  for(let i=0;i<b.length;i++)b[i]=source[i%source.length];
  b.writeBigUInt64LE(0n,0x20);b.writeUInt32LE((c.factory?.priority??0)>>>0,4);return b;
}
export function foundationCases(): FoundationCase[] {
  let seed = 318;
  const random = () => seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0;
  const object = () => { const b = Buffer.alloc(0x200); for (let i = 0; i < b.length; i++) b[i] = random() >>> 24; return b; };
  const cases: FoundationCase[] = [];
  const add = (name: string, kind: number, extra: Partial<FoundationCase> = {}) => {
    cases.push({ name, kind, id: 7, nullObject: false, query: 'Float', objectHex: object().toString('hex'), classId: random(), types: [{ name: 'Float', id: 7, index: 2 }], overrides: [], ...extra });
  };
  for (const id of [0, 7, 1279, 1280, 0xffffffff, 0x80000000]) add(`type-id-${id}`, 0, { id });
  const classReport = JSON.parse(fs.readFileSync('docs/Objects.level.bin类进度.json', 'utf8'));
  for (const [i, cls] of classReport.classes.entries()) {
    const names = [cls.name, 'Object', 'Value', 'Event', 'Ωmetadata'];
    const types = [...new Set(names)].map((name, index) => ({ name, id: index + 1, index }));
    add(`name-${cls.name}`, 1, { types, query: cls.name });
    if (i % 8 === 0) for (const query of ['', cls.name.toLowerCase(), cls.name + 'Missing', 'Ωmetadata']) add(`name-edge-${i}-${query}`, 1, { types, query });
  }
  add('name-empty-registry', 1, { types: [] });
  for (const isNull of [false, true]) for (const abstract of [false, true]) for (const polymorphic of [false, true]) for (const fallback of [false, true]) for (const cached of [false, true]) {
    const b = object(); b.writeUInt32LE(7);
    const selected = isNull ? 0 : 2, target = fallback ? 0 : selected;
    const overrides: FoundationCase['overrides'] = [{ index: selected, conversionNull: fallback }, { index: target, abstract, polymorphic, cache: cached ? '0x12345678abcdef01' : '0', fresh: '0xfedcba9876543210', destination: 8 }];
    // Null's pointer type must have a usable class conversion for replay.
    if (isNull) overrides[0].conversionNull = false;
    add(`vtable-${isNull}-${abstract}-${polymorphic}-${fallback}-${cached}`, 2, { nullObject: isNull, objectHex: b.toString('hex'), overrides });
  }
  for (const id of [1280, 0xffffffff]) { const b = object(); b.writeUInt32LE(id); add(`vtable-invalid-id-${id}`, 2, { objectHex: b.toString('hex') }); }
  for (let i = 0; i < 256; i++) for (const kind of [3, 4]) add(`float-construct-${kind}-${i}`, kind);
  for (const nullObject of [false, true]) add(`float-release-${nullObject}`, 5, { nullObject });
  for (const signature of [0, 1, 2]) for (const parent of [false, true]) for (const failure of ['none', 'missing-type', 'missing-factory', 'missing-create', 'receiver-cast', 'null-result', 'result-cast']) {
    add(`factory-${signature}-${parent}-${failure}`, 7, {
      query: failure === 'missing-type' ? 'Missing' : 'Float',
      factory: { keyIndex: failure === 'missing-factory' ? null : parent ? 0 : 2, signature, parent,
        missingCreate: failure === 'missing-create', receiverCastFails: failure === 'receiver-cast', returnNull: failure === 'null-result', resultCastFails: failure === 'result-cast' },
    });
  }
  for (const parent of [false, true]) for (const nullObject of [false, true]) for (const failure of ['none', 'missing-factory', 'missing-release', 'receiver-cast', 'class-fallback']) {
    const b = object(); b.writeUInt32LE(7);
    add(`factory-release-${parent}-${nullObject}-${failure}`, 8, { nullObject, objectHex: b.toString('hex'),
      factory: { keyIndex: failure === 'missing-factory' ? null : parent || nullObject || failure === 'class-fallback' ? 0 : 2, signature: 1, parent,
        missingRelease: failure === 'missing-release', receiverCastFails: failure === 'receiver-cast', classConversionNull: failure === 'class-fallback' } });
  }
  for (const parent of [false, true]) for (const nullObject of [false, true]) for (const priority of [0, 1, -1, 0x7fffffff, -0x80000000]) for (const moduleCastFails of [false, true]) {
    const b = object(); b.writeUInt32LE(7);
    add(`factory-priority-${parent}-${nullObject}-${priority}-${moduleCastFails}`, 9, { nullObject, objectHex: b.toString('hex'),
      factory: { keyIndex: parent || nullObject ? 0 : 2, signature: 1, parent, priority, moduleCastFails } });
  }
  for (const failure of ['missing-factory', 'class-fallback']) {
    const b = object(); b.writeUInt32LE(7);
    add(`factory-priority-${failure}`, 9, { objectHex: b.toString('hex'),
      factory: { keyIndex: failure === 'missing-factory' ? null : 0, signature: 1, priority: 42, classConversionNull: failure === 'class-fallback' } });
  }
  for (let i = 0; i < 32; i++) {
    add(`value-barn-initialize-${i}`, 10);
    add(`value-barn-unload-${i}`, 13);
    add(`value-barn-continuous-${i}`, 14);
    const b = object();
    for (let j = 0; j < 3; j++) b.writeFloatLE((i + j - 10) / 8, j * 32 + 0x10);
    add(`factory-value-barn-float-continuous-${i}`, 15, { objectHex: b.toString('hex'), classId: 7,
      factory: { keyIndex: 2, signature: 1, valueBarn: true, priority: i - 16 } });
  }
  for (const slot of [0, 1, 40, 79]) for (const castFails of [false, true]) add(`value-barn-create-${slot}-${castFails}`, 11, { value: { slot, castFails } });
  add('value-barn-create-exhausted', 11, { value: { empty: true } });
  for (const nullObject of [false, true]) for (const noBacklink of [false, true]) for (const empty of [false, true]) {
    const b = object(); b.writeBigUInt64LE(noBacklink ? 0n : FOUNDATION_BARN + 0x10n, 8);
    add(`value-barn-release-${nullObject}-${noBacklink}-${empty}`, 12, { nullObject, objectHex: b.toString('hex'), value: { noBacklink, empty } });
  }
  for (let i = 0; i < 256; i++) {
    const b = object(), values = [i % 2 ? -i / 8 : i / 16, (i % 19 - 9) / 4, 123];
    values.forEach((v, index) => b.writeFloatLE(v, index * 32 + 0x10));
    const id = (i % 3) | ((Math.floor(i / 3) % 3) << 2) | ((Math.floor(i / 9) % 3) << 4);
    add(`float-construction-to-multiply-${i}`, 6, { id, objectHex: b.toString('hex') });
  }
  const tgclCase=(name:string, tgcl:NonNullable<FoundationCase['tgcl']>)=>add(name,16,{classId:7,
    types:[{name:'Float',id:7,index:2},{name:'FloatMult',id:8,index:3}],factory:{keyIndex:2,signature:1,valueBarn:true,priority:-3},tgcl});
  const floatHex=(value:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(value);return b.toString('hex');};
  for(let a=0;a<3;a++)for(let b=0;b<3;b++)for(let output=0;output<3;output++)for(const order of [[3,0,1,2],[0,3,1,2],[0,1,2,3]])
    tgclCase(`factory-tgcl-multiply-alias-${a}-${b}-${output}-${order.indexOf(3)}`,{valuesHex:[1.25,-2,0.5].map(floatHex),indices:[a,b,output],autoStart:1,order,repetitions:3});
  const baseSequence={valuesHex:[1.25,-2,0.5].map(floatHex),indices:[0,1,2],autoStart:1,order:[3,0,1,2],repetitions:1};
  for(const eventFailure of ['exhausted','occupied','cast','nonEvent','unregisteredEvent'] as const)
    tgclCase('event-create-failure-'+eventFailure,{...baseSequence,eventFailure});
  tgclCase('event-release-loaded',{...baseSequence,loadedBeforeRelease:true});
  tgclCase('event-release-empty-slot',{...baseSequence,duplicateRelease:true});
  tgclCase('field-failure-does-not-publish-object',{...baseSequence,truncatedFields:true});
  for(let a=0;a<3;a++)for(let b=0;b<3;b++)for(let output=0;output<3;output++)for(const order of [[3,0,1,2],[0,3,1,2],[0,1,2,3]])
    tgclCase(`trigger-auto-multiply-alias-${a}-${b}-${output}-${order.indexOf(3)}`,{...baseSequence,indices:[a,b,output],order,repetitions:5,trigger:{autoDispatch:true,frameActions:[0,2,0,1,0]}});
  tgclCase('trigger-auto-start-disabled-enable-stop-resume',{...baseSequence,autoStart:0,repetitions:7,trigger:{autoDispatch:true,frameActions:[0,1,0,2,0,1,0]}});
  for(const nextUnique of [0,1,65534,65535,65536])tgclCase(`trigger-unique-${nextUnique}`,{...baseSequence,trigger:{autoDispatch:true,nextUnique}});
  for(const count of [0,1,254,255])for(const maxTypeIndex of [0,1,255,256])
    tgclCase(`trigger-type-count-${count}-maximum-${maxTypeIndex}`,{...baseSequence,trigger:{autoDispatch:true,initialTypes:[{id:8,count}],maxTypeIndex}});
  for(const mutateTypeCounter of [0,17,254,255])for(const maxTypeIndex of [0,255,256])
    tgclCase(`trigger-type-reload-${mutateTypeCounter}-${maxTypeIndex}`,{...baseSequence,trigger:{autoDispatch:true,mutateTypeCounter,maxTypeIndex}});
  for(const ids of [[1],[9],[0,1,2],[9,10,11],[1,8,10],[0,1,2,3,4,5,6],[9,10,11,12,13,14,15],[0,2,4,8,10,12,14]])
    for(const resetTypeMap of [false,true])tgclCase(`trigger-tree-${ids.join('-')}-reset-${resetTypeMap}`,{...baseSequence,trigger:{autoDispatch:true,initialTypes:ids.map(id=>({id,count:id===8?42:0})),resetTypeMap}});
  for(const eventFailure of ['exhausted','occupied','cast','nonEvent','unregisteredEvent'] as const)
    tgclCase('trigger-event-create-failure-'+eventFailure,{...baseSequence,eventFailure,trigger:{autoDispatch:true}});
  tgclCase('trigger-field-failure-preserves-registration',{...baseSequence,truncatedFields:true,trigger:{autoDispatch:true}});
  for(let i=0;i<32;i++){add('event-constructor-retention-'+i,17);add('float-mult-constructor-retention-'+i,18);}
  const numericCase=(name:string,tgcl:NonNullable<FoundationCase['tgcl']>)=>add(name,16,{classId:7,
    types:[{name:'Float',id:7,index:2},{name:tgcl.eventClass!,id:8,index:3}],factory:{keyIndex:2,signature:1,valueBarn:true,priority:-3},tgcl});
  const offsets:Record<string,Record<string,number>>={FloatAdd:{autoStart:12,target:56,amountFloat:64,output:72,amount:80,minClampedValue:84,maxClampedValue:88,useMinClampedValue:92,useMaxClampedValue:93,updateEveryFrame:94},SetFloat:{autoStart:12,targetValue:56,time:60,target:64,snappiness:72}};
  const field=(eventClass:'FloatAdd'|'SetFloat',name:string,value:number,type:0|2=0,size=4,order=[3,0,1,2])=>{
    const raw=Buffer.alloc(type===2?4:size);if(type===2)raw.writeUInt32LE(order.indexOf(value)>>>0);else if(size===1)raw[0]=value;else raw.writeFloatLE(value);
    return {type,offset:offsets[eventClass][name],raw:raw.toString('hex')};
  };
  const addFields=(target:number,amountFloat:number,output:number,everyFrame:number,autoStart:number,order:number[],minimum=0,maximum=4,useMin=0,useMax=0)=>[
    field('FloatAdd','autoStart',autoStart,0,1,order),field('FloatAdd','target',target,2,4,order),field('FloatAdd','amount',0.75),
    field('FloatAdd','amountFloat',amountFloat,2,4,order),field('FloatAdd','output',output,2,4,order),field('FloatAdd','minClampedValue',minimum),field('FloatAdd','maxClampedValue',maximum),
    field('FloatAdd','useMinClampedValue',useMin,0,1),field('FloatAdd','useMaxClampedValue',useMax,0,1),field('FloatAdd','updateEveryFrame',everyFrame,0,1)];
  for(let target=0;target<3;target++)for(const amountFloat of [0,1,2,0xffffffff])for(const output of [0,1,2,0xffffffff])for(const order of [[3,0,1,2],[0,3,1,2],[0,1,2,3]]){
    const everyFrame=(target+amountFloat+output)&1;
    numericCase(`FloatAdd-auto-alias-${target}-${amountFloat}-${output}-${order.indexOf(3)}`,{...baseSequence,eventClass:'FloatAdd',order,repetitions:6,eventFields:addFields(target,amountFloat,output,everyFrame,1,order),trigger:{autoDispatch:true,frameActions:[0,0,1,0,2,1]}});
  }
  for(const useMin of [0,1])for(const useMax of [0,1])for(const everyFrame of [0,1])
    numericCase(`FloatAdd-auto-clamp-${useMin}-${useMax}-${everyFrame}`,{...baseSequence,eventClass:'FloatAdd',repetitions:4,eventFields:addFields(0,0xffffffff,0xffffffff,everyFrame,1,baseSequence.order,5,0,useMin,useMax),trigger:{autoDispatch:true}});
  numericCase('FloatAdd-auto-disabled-then-enable',{...baseSequence,eventClass:'FloatAdd',autoStart:0,repetitions:4,eventFields:addFields(0,0xffffffff,0xffffffff,0,0,baseSequence.order),trigger:{autoDispatch:true,frameActions:[0,1,0,1]}});
  const setFields=(destination:number,duration:number,snappiness:number,autoStart=1,order=[3,0])=>[
    field('SetFloat','autoStart',autoStart,0,1,order),field('SetFloat','targetValue',destination),field('SetFloat','target',0,2,4,order),field('SetFloat','time',duration),field('SetFloat','snappiness',snappiness)];
  for(const snappiness of [0,0.01,1,5,29,30,40])for(const duration of [0,0.5,1,2])
    numericCase(`SetFloat-auto-smooth-${snappiness}-${duration}`,{valuesHex:[floatHex(-5.125)],indices:[0,0xffffffff,0xffffffff],autoStart:1,order:[3,0],repetitions:12,eventClass:'SetFloat',eventFields:setFields(10.25,duration,snappiness),trigger:{autoDispatch:true,frameActions:[0,0,2,0,1]}});
  for(const delta of [-1,0,0.016,1])for(const speedOverrideEnabled of [false,true])
    numericCase(`SetFloat-auto-time-${delta}-${speedOverrideEnabled}`,{valuesHex:[floatHex(-5.125)],indices:[0,0xffffffff,0xffffffff],autoStart:1,order:[3,0],repetitions:8,eventClass:'SetFloat',eventFields:setFields(10.25,1,5),frameTime:Array.from({length:8},()=>[delta,0.75,1.25] as [number,number,number]),speedOverrideEnabled,trigger:{autoDispatch:true}});
  numericCase('SetFloat-auto-load-enable-reset-recapture',{valuesHex:[floatHex(-5.125)],indices:[0,0xffffffff,0xffffffff],autoStart:0,order:[3,0],repetitions:8,eventClass:'SetFloat',eventFields:setFields(10.25,1,5,0),frameWrites:[{frame:1,valueIndex:0,bits:floatHex(7)},{frame:5,valueIndex:0,bits:floatHex(3)}],trigger:{autoDispatch:true,frameActions:[0,1,0,2,0,1,0,0]}});
  for(let i=0;i<32;i++){add('FloatAdd-constructor-retention-'+i,19);add('SetFloat-constructor-retention-'+i,20);}
  const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
  for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
    const file = path.join(data, 'Levels', level, 'Objects.level.bin'); if (!fs.existsSync(file)) continue;
    const source=fs.readFileSync(file),doc = new ObjectsDocument(source);
    for (const node of doc.nodes.filter(n => n.className === 'Float')) {
      const b = object(), field = node.fields.find(f => f.name === 'value');
      if (!field || field.length !== 4) throw new Error('Actual Float value missing; constructor does not provide a default');
      Buffer.from(field.raw, 'hex').copy(b, 0x10);
      add(`corpus-float-${level}-${node.id}`, 3, { objectHex: b.toString('hex') });
    }
    for(const node of doc.nodes.filter(n=>n.className==='FloatMult')){
      const references=['a','b','output'].map(name=>Number(node.fields.find(f=>f.name===name)!.value));
      const ids=[...new Set(references)].sort((a,b)=>a-b);
      if(ids.length!==3||ids.some(id=>doc.nodes[id]?.className!=='Float'))throw new Error('Corpus FloatMult subgraph is not three Float nodes');
      const valuesHex=ids.map(id=>doc.nodes[id].fields.find(f=>f.name==='value')!.raw);
      const order=[...ids,node.id].sort((a,b)=>a-b).map(id=>id===node.id?3:ids.indexOf(id));
      const tgcl={valuesHex,indices:references.map(id=>ids.indexOf(id)),autoStart:Number(node.fields.find(f=>f.name==='autoStart')!.value),order,repetitions:1,
        source:{level,nodeId:node.id,floatNodes:ids,sha256:crypto.createHash('sha256').update(source).digest('hex')}};
      tgclCase(`corpus-factory-tgcl-multiply-${level}-${node.id}`,tgcl);
      tgclCase(`corpus-trigger-auto-multiply-${level}-${node.id}`,{...tgcl,repetitions:3,trigger:{autoDispatch:true}});
    }
    for(const node of doc.nodes.filter(n=>n.className==='FloatAdd'||n.className==='SetFloat')){
      const eventClass=node.className as 'FloatAdd'|'SetFloat';
      const refs=node.fields.filter(f=>f.kind==='reference'&&Number(f.value)!==0xffffffff).map(f=>Number(f.value));
      const ids=[...new Set(refs)].sort((a,b)=>a-b);
      if(ids.length>3||!ids.length||ids.some(id=>doc.nodes[id]?.className!=='Float'))throw new Error('Numeric configuration requires Float-only targets');
      const order=[...ids,node.id].sort((a,b)=>a-b).map(id=>id===node.id?3:ids.indexOf(id));
      const eventFields=node.fields.map(f=>{const offset=offsets[eventClass][f.name];if(offset===undefined)throw new Error('Unrecovered numeric member '+f.name);if(f.kind==='reference')return field(eventClass,f.name,Number(f.value)===0xffffffff?0xffffffff:ids.indexOf(Number(f.value)),2,4,order);return {type:0 as const,offset,raw:f.raw};});
      if(eventFields.length!==Object.keys(offsets[eventClass]).length)throw new Error('Actual numeric configuration is missing a default');
      const valuesHex=ids.map(id=>{const value=doc.nodes[id].fields.find(f=>f.name==='value');if(!value||value.length!==4)throw new Error('Missing original Float value');return value.raw;});
      numericCase(`corpus-${eventClass}-auto-${level}-${node.id}`,{valuesHex,indices:[0,0xffffffff,0xffffffff],autoStart:Number(node.fields.find(f=>f.name==='autoStart')!.value),order,repetitions:8,eventClass,eventFields,
        trigger:{autoDispatch:true,frameActions:[0,1,0,0,2,0,1,0]},source:{level,nodeId:node.id,floatNodes:ids,sha256:crypto.createHash('sha256').update(source).digest('hex')}});
    }
  }
  return cases;
}
