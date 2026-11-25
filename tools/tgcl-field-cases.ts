import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import nativeProperties from '../docs/native-properties.json';
export const TGCL_MEMORY = 0x250000000n, TGCL_CONTEXT = TGCL_MEMORY + 0x1000n, TGCL_BYTES = 0x30000;
export interface TgclPropertyCase { name: string; type: number; size: number; offset: number; hasVar: boolean; nested: number; adjustment: number; indirect: boolean; }
export interface TgclClassCase { name: string; properties: TgclPropertyCase[]; }
export interface TgclDefaultCase { type: number; offset: number; dataHex: string; text?: string; }
export interface TgclGrowthCase {
  capacity: string; delta: string; oldLength: number; position: number; eraseLength: number; insertLength: number;
  source: 'data' | 'old' | 'descriptor'; sourceOffset: number;
}
export interface TgclFieldCase {
  name: string; kind: number; classes: TgclClassCase[]; dataHex: string; dataMax: number; nullObject: boolean;
  rootAdjustment: number; classCastFails: boolean; receiverFails: boolean; nullArray: boolean; zeroElement: boolean;
  stopAfterAllocator: boolean; pointerCapacity: number; resolve: boolean; defaults: TgclDefaultCase[];
  longString: boolean; stringAlias: boolean; nodes: number; provenance?: { level: string; className: string; nodeId: number; sha256: string };
  growth?: TgclGrowthCase;
}
const property = (name: string, type: number, changes: Partial<TgclPropertyCase> = {}): TgclPropertyCase => ({ name, type, size: 4, offset: 32, hasVar: true, nested: -1, adjustment: 0, indirect: true, ...changes });
const hex = (...numbers: number[]) => { const bytes = Buffer.alloc(numbers.length * 4); numbers.forEach((n,i) => bytes.writeUInt32LE(n >>> 0, i * 4)); return bytes.toString('hex'); };
export function tgclFieldCases(): TgclFieldCase[] {
  const cases: TgclFieldCase[] = [];
  const add = (name: string, changes: Partial<TgclFieldCase>): TgclFieldCase => {
    const c: TgclFieldCase = { name, kind: 1, classes: [{ name: 'Fixture', properties: [] }], dataHex: '', dataMax: -1, nullObject: false,
      rootAdjustment: 0, classCastFails: false, receiverFails: false, nullArray: false, zeroElement: false, stopAfterAllocator: false,
      pointerCapacity: 128, resolve: true, defaults: [], longString: false, stringAlias: false, nodes: 1, ...changes };
    if (c.dataMax === -1) c.dataMax = c.dataHex.length / 2; cases.push(c); return c;
  };
  for (const size of [0,1,4,8,12,16,64]) for (const hasVar of [false,true]) for (const nullObject of [false,true])
    add(`pod-${size}-${hasVar}-${nullObject}`, { classes: [{ name:'Fixture', properties:[property('pod',0,{size,hasVar})] }], dataHex: Buffer.from(Array.from({length:size},(_,i)=>(i*11+0x37)&255)).toString('hex'), nullObject });
  for (const longString of [false,true]) for (const nullObject of [false,true]) for (const length of [0,1,21,22,23,64,80]) {
    const text = 'x'.repeat(length) + '\0';
    add(`string-${length}-${longString}-${nullObject}`, { kind:0, dataHex: Buffer.from(text).toString('hex'), longString, nullObject });
  }
  add('string-overlap-reloads-source-length', { kind:0, stringAlias:true, dataHex:Buffer.from('ABCDE\0').toString('hex'), dataMax:10 });
  add('string-bounds-failure-after-assignment', { kind:0, dataHex:Buffer.from('complete\0').toString('hex'), dataMax:2 });
  add('pod-truncated', { classes:[{name:'Fixture',properties:[property('pod',0,{size:8})]}], dataHex:hex(1) });
  add('word-truncated', { classes:[{name:'Fixture',properties:[property('reference',2)]}], dataHex:'010000' });
  add('invalid-field-type', { classes:[{name:'Fixture',properties:[property('invalid',4)]}] });
  for (const hasVar of [false,true]) for (const nullObject of [false,true]) for (const adjustment of [0,8,-16])
    add(`reference-cycle-${hasVar}-${nullObject}-${adjustment}`, { classes:[{name:'Fixture',properties:[property('reference',2,{hasVar,adjustment})]}], dataHex:hex(2,0,1), nodes:3, nullObject });
  add('missing-reference-invalid-index-is-not-dereferenced', { classes:[{name:'Fixture',properties:[property('reference',2,{hasVar:false})]}], dataHex:hex(0xfffffffe) });
  add('null-reference', { classes:[{name:'Fixture',properties:[property('reference',2,{adjustment:8})]}], dataHex:hex(0xffffffff) });
  for (const indirect of [false,true]) for (const hasVar of [false,true]) for (const count of [0,1,3,16])
    add(`reference-array-${indirect}-${hasVar}-${count}`, { classes:[{name:'Fixture',properties:[property('array',3,{hasVar,indirect,adjustment:8})]}], dataHex:hex(count,...Array.from({length:count},(_,i)=>i%2?0xffffffff:0)) });
  const nested = [{name:'Fixture',properties:[property('nested',3,{nested:1})]}, {name:'Element',properties:[property('value',0,{offset:16}),property('reference',2,{offset:24})]}];
  for (const nullObject of [false,true]) for (const hasVar of [false,true]) for (const count of [0,1,3])
    add(`nested-array-${nullObject}-${hasVar}-${count}`, { classes:[{...nested[0],properties:[{...nested[0].properties[0],hasVar}]},nested[1]], dataHex:hex(count,...Array.from({length:count},(_,i)=>[0x3f800000+i,0]).flat()), nullObject });
  for (const failure of ['receiverFails','nullArray','zeroElement'] as const)
    add(`array-${failure}`, { classes:nested, dataHex:hex(1,123,0), [failure]:true });
  add('zero-count-still-checks-null-array', { classes:nested, dataHex:hex(0), nullArray:true });
  add('reference-table-exhaustion', { classes:[{name:'Fixture',properties:[property('array',3)]}], dataHex:hex(3,0,0,0), pointerCapacity:2 });
  add('allocator-callback-changes-field-count', { classes:[{name:'Fixture',properties:[property('array',3),property('later',0,{offset:64})]}], dataHex:hex(1,0,123), stopAfterAllocator:true });
  for (const rootAdjustment of [-8,0,16]) for (const classCastFails of [false,true])
    add(`class-cast-${rootAdjustment}-${classCastFails}`, { classes:[{name:'Fixture',properties:[property('pod',0)]}], dataHex:hex(0x12345678), rootAdjustment,classCastFails });
  for (const nullObject of [false,true]) for (const longString of [false,true])
    add(`defaults-${nullObject}-${longString}`, { nullObject,longString,defaults:[{type:0,offset:16,dataHex:hex(0x3f000000)},{type:2,offset:24,dataHex:'0000000000000000'},{type:1,offset:64,dataHex:'',text:'Tool_DefaultValue'}] });
  add('invalid-default-kind', { defaults:[{type:3,offset:32,dataHex:''}] });
  add('long-string-default-growth', { defaults:[{type:1,offset:64,dataHex:'',text:'default'.repeat(12)}] });
  const growth = (name:string, capacity:bigint, delta:bigint, oldLength:number, position:number, eraseLength:number, insertLength:number, source:TgclGrowthCase['source']='data', sourceOffset=0) =>
    add('grow-'+name,{kind:2,longString:capacity!==22n,dataHex:Buffer.from(Array.from({length:Math.max(insertLength+sourceOffset,1)},(_,i)=>65+i%26)).toString('hex'),
      growth:{capacity:capacity.toString(),delta:delta.toString(),oldLength,position,eraseLength,insertLength,source,sourceOffset}});
  growth('short-to-long',22n,1n,22,0,22,23);
  growth('short-prefix-insert-tail',22n,10n,16,4,4,20);
  growth('long-prefix-insert-tail',31n,1n,20,5,7,12);
  growth('long-replace',63n,1n,60,0,60,64);
  for(const capacity of [0n,10n,11n,12n,15n,16n,22n,23n,31n,32n,47n,48n,63n,64n,2022n,2023n,2024n,4078n,4079n])
    growth('allocation-boundary-'+capacity,capacity,capacity<4079n?1n:0n,0,0,0,1);
  growth('minimum-allocation',10n,12n,0,0,0,1);
  growth('round-at-23',11n,12n,0,0,0,1);
  growth('maximum-insert',22n,4057n,0,0,0,4079);
  growth('length-error-short',22n,4058n,0,0,0,1);
  growth('length-error-long',4079n,1n,0,0,0,1);
  growth('length-error-uint64-delta',22n,0xffffffffffffffffn,0,0,0,1);
  growth('capacity-subtraction-wrap',0xffffffffffffffffn,1n,0,0,0,1);
  growth('zero-insert-tail',31n,1n,20,5,7,0);
  growth('zero-prefix-and-tail',31n,1n,20,0,20,4);
  growth('all-copy-lengths-zero',31n,1n,0,0,0,0);
  growth('short-source-alias',22n,10n,22,3,5,8,'old',2);
  growth('long-source-alias',31n,10n,24,5,8,16,'old',0);
  growth('source-aliases-descriptor',31n,1n,20,4,4,16,'descriptor');
  const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
  const properties = nativeProperties as Record<string,Record<string,{nativeOffset:number}>>;
  const quotas = new Map([['Float',184],['Clump',24],['LevelMaterial',16],['LevelMesh',12],['Marker',12],['Timeline',12]]);
  for (const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
    const filename=path.join(data,'Levels',level,'Objects.level.bin'); if(!fs.existsSync(filename))continue;
    const bytes=fs.readFileSync(filename), doc=new ObjectsDocument(bytes), sha256=crypto.createHash('sha256').update(bytes).digest('hex');
    for(const node of doc.nodes) {
      if (!(quotas.get(node.className) ?? 0) || node.length>10000)continue;
      const ids:number[]=[];
      const visit=(id:number)=>{if(ids.includes(id))return;ids.push(id);for(const p of doc.classes[id].properties)if(p.type===3&&p.classIndex!==0xffffffff)visit(p.classIndex);}; visit(node.classIndex);
      if(ids.length>16||ids.reduce((n,id)=>n+doc.classes[id].properties.length,0)>128)continue;
      const classes=ids.map(id=>({name:doc.classes[id].name,properties:doc.classes[id].properties.map((p,index)=>{
        const native=properties[doc.classes[id].name]?.[p.name];
        return property(p.name,p.type,{size:p.size,offset:native?.nativeOffset??512+index*32,hasVar:!!native,nested:p.classIndex===0xffffffff?-1:ids.indexOf(p.classIndex)});
      })}));
      if(classes.some(c=>c.properties.some(p=>p.offset>1500)))continue;
      const start=node.fields[0]?.offset??node.offset+node.length;
      add(`corpus-${level}-${node.className}-${node.id}`,{classes,dataHex:bytes.subarray(start,node.offset+node.length).toString('hex'),resolve:false, provenance:{level,className:node.className,nodeId:node.id,sha256}});
      quotas.set(node.className,quotas.get(node.className)!-1);
    }
  }
  return cases;
}
export function tgclFieldMemory(c:TgclFieldCase):Buffer {
  const b=Buffer.alloc(TGCL_BYTES), ptr=(at:number,to:number)=>b.writeBigUInt64LE(to?TGCL_MEMORY+BigInt(to):0n,at);
  for(let at=0xa000;at<0xc000;at++)b[at]=(at*19+0x37)&255;
  ptr(0x2420,0x4000);ptr(0x2428,0x4800);ptr(0x2438,0x5000);ptr(0x2440,0x6000);ptr(0x2450,0x8000);
  ptr(0x2470,c.stringAlias?0xa041:0x10000);b.writeUInt32LE(c.dataMax,0x2478);b.writeUInt32LE(c.stringAlias?1:0,0x247c);
  ptr(0x2480,0x9000);b.writeUInt32LE(c.pointerCapacity,0x2488);b.writeUInt32LE(0,0x248c);
  Buffer.from(c.dataHex,'hex').copy(b,c.stringAlias?0xa041:0x10000);
  let propertyIndex=0;
  c.classes.forEach((cls,ci)=>{
    b.writeUInt32LE(ci+1,0x4000+ci*12);b.writeUInt32LE(propertyIndex,0x4004+ci*12);b.writeUInt32LE(cls.properties.length,0x4008+ci*12);
    ptr(0x22098+(ci+1)*8,0x1f000+ci*256);
    cls.properties.forEach(p=>{
      const at=0x5000+propertyIndex*16,aux=0x6000+propertyIndex*32,meta=0x18000+propertyIndex*128,method=0x28000+propertyIndex*128;
      b.writeUInt32LE(p.type,at);b.writeUInt32LE(p.hasVar?1:0xffffffff,at+4);b.writeUInt32LE(p.size,at+8);b.writeUInt32LE(p.nested<0?0xffffffff:p.nested,at+12);
      b.writeBigUInt64LE(BigInt(p.offset),aux);b.writeBigUInt64LE(BigInt.asUintN(64,BigInt(p.adjustment)),aux+8);ptr(aux+16,meta);ptr(aux+24,method);
      b.writeBigUInt64LE(BigInt(propertyIndex),meta+32);b.writeBigUInt64LE(p.indirect?0n:0xffffffffffffffffn,meta+56);b.writeBigUInt64LE(0n,meta+72);
      b.writeBigUInt64LE(BigInt(propertyIndex+1),method+56);
      propertyIndex++;
    });
  });
  const initializeString=(at:number)=>{
    b.fill(0,at,at+24);
    if(c.longString){b.writeBigUInt64LE(65n,at);b.writeBigUInt64LE(3n,at+8);ptr(at+16,0x1d000);b.write('old\0',0x1d000);}
  };
  const initialize=(object:number,ci:number)=>{
    b.writeUInt32LE(ci+1,object);
    for(const p of c.classes[ci].properties)if(p.hasVar){if(p.type===1)initializeString(object+c.rootAdjustment+p.offset);else if(p.type===3)b.fill(0,object+c.rootAdjustment+p.offset,object+c.rootAdjustment+p.offset+24);}
  };
  for(let i=0;i<c.nodes;i++){initialize(0xa000+i*2048,0);ptr(0x9c00+i*8,0xa000+i*2048);}
  if(c.kind===0)initializeString(0xa040+c.rootAdjustment);
  if(c.kind===2&&c.growth){
    const g=c.growth,at=0xa040+c.rootAdjustment;
    b.fill(0,at,at+24);
    const data=c.longString?0x1d000:at+1;
    for(let i=0;i<g.oldLength;i++)b[data+i]=97+i%26;
    b[data+g.oldLength]=0;
    if(c.longString){b.writeBigUInt64LE(BigInt.asUintN(64,BigInt(g.capacity)+1n)|1n,at);b.writeBigUInt64LE(BigInt(g.oldLength),at+8);ptr(at+16,data);}
    else b.writeUInt8(g.oldLength*2,at);
    const source=g.source==='old'?data+g.sourceOffset:g.source==='descriptor'?at+g.sourceOffset:0x10000+g.sourceOffset;
    [TGCL_MEMORY+BigInt(at),BigInt(g.capacity),BigInt(g.delta),BigInt(g.oldLength),BigInt(g.position),BigInt(g.eraseLength),BigInt(g.insertLength),TGCL_MEMORY+BigInt(source)]
      .forEach((value,i)=>b.writeBigUInt64LE(BigInt.asUintN(64,value),0x2bf00+i*8));
  }
  if(c.stringAlias){b.writeUInt8(10,0xa040);Buffer.from(c.dataHex,'hex').copy(b,0xa041);}
  b.writeUInt32LE(c.defaults.length,0x4804);
  c.defaults.forEach((d,i)=>{
    const at=0x8000+i*28;b.writeUInt32LE(d.type,at);b.writeUInt32LE(d.type===1?8:d.dataHex.length/2,at+4);b.writeUInt32LE(d.offset,at+8);
    if(d.type===1){ptr(at+12,0x1c000+i*256);ptr(0x1c008+i*256,0x1c020+i*256);b.write((d.text??'')+'\0',0x1c020+i*256);initializeString(0xa000+c.rootAdjustment+d.offset);}
    else Buffer.from(d.dataHex,'hex').copy(b,at+12);
  });
  return b;
}
