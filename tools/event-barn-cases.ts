import type {EventBarnCase} from './event-barn-evaluate';
import {objectBatchCases} from './object-batch-cases';
import fs from 'node:fs';
const NIL=0xffffffff;
export function eventBarnState(flags:number[]=[],sequence=0,persistence=1,uid=0,hasBarn=true):Buffer {
 const b=Buffer.alloc(128,0x5a);b.fill(0,0x20,0x26);flags.forEach((v,i)=>b[0x20+i]=v);b[0xc]=0;b.writeUInt32LE(sequence>>>0,0x10);b.writeBigUInt64LE(hasBarn?1n:0n,0x18);b.writeUInt32LE(persistence,0x28);b.writeUInt16LE(uid,0x2c);return b;
}
export function eventBarnCase(name:string,states:Buffer[],actions:number[][],rules:number[][]=[]):EventBarnCase {
 return {name,states:states.map(b=>b.toString('hex')),slots:Array.from({length:1280},(_,i)=>i<states.length?i:NIL),links:Array(1280).fill(NIL),counter:0xfffffffd,freeHead:1279,heapUsed:0xabcd1234,flag:0xa5,previousUsed:0x12345678,actions,rules};
}
export function eventBarnCases(data?:string):EventBarnCase[] {
 const cases:EventBarnCase[]=[];let seed=0x318beef;const random=()=>{seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;return seed>>>0;};
 // Both native sorters must match every identity, especially equal keys.
 for(const kind of [9,10])for(const n of [0,1,2,3,4,5,6,8,15,29,30,31,32,63,64,100,257,999,1000,1001,1279,1280])for(let pattern=0;pattern<12;pattern++)for(let trial=0;trial<2;trial++){
  const states=Array.from({length:n},(_,i)=>{
   const key=pattern===0?i:pattern===1?n-i:pattern===2?7:pattern===3?i%3:pattern===4?Math.min(i,n-i):pattern===5?Math.abs(n/2-i)|0:pattern===6?(i===n-1?0:i):pattern===7?(i%2?0xffffffff:0):pattern===8?random()%7:pattern===9?random():pattern===10?(i%8===0?random():i):random()%31;
   return eventBarnState([1,0,0,1,1,0],key,1,key%65535);
  });
  cases.push(eventBarnCase(`sort-${kind}-n${n}-p${pattern}-t${trial}`,states,[[kind,0,0]]));
 }
 for(const n of [0,1,2,3,5,31,1000])for(const invalid of [0,1,Math.max(0,n-1)])if(invalid<n){
  const states=Array.from({length:n},(_,i)=>eventBarnState([],n-i,1,i));states[invalid].writeUInt16LE(0xffff,0x2c);cases.push(eventBarnCase(`sort-invalid-n${n}-i${invalid}`,states,[[10,0,0]]));
 }
 // Requests observe their own pending byte independently, including nonzero
 // noncanonical bool bytes, null Barn logs and uint32 sequence wraparound.
 for(let flags=0;flags<64;flags++)for(const hasBarn of [false,true]){
  const state=eventBarnState(Array.from({length:6},(_,i)=>flags>>i&1),0xdeadbeef,1,0,hasBarn);
  cases.push(eventBarnCase(`request-f${flags}-b${+hasBarn}`,[state],[[1,0,0],[1,0,0],[0,0,0],[0,0,0],[2,0,1],[2,0,0],[3,0,0],[3,0,0]]));
 }
 for(let f=0;f<64;f++)for(const slot of [0x10,0x30,0x38,0x40,0x48])for(let op=0;op<5;op++){
  const state=eventBarnState(Array.from({length:6},(_,i)=>f>>i&1));
  const rule=op===0?[0,slot,1,3,0,0,0]:op===1?[0,slot,1,4,0,0,0]:op===2?[0,slot,1,0,0,0x23,0]:op===3?[0,slot,1,0,0,0x24,0]:[0,slot,1,0,0,0x25,1];
  cases.push(eventBarnCase(`dispatch-f${f}-s${slot}-op${op}`,[state],[[3,0,0],[3,0,0]], [rule]));
 }
 // Full pool scans, callback state reloads, captured-list boundaries and
 // single-frame sequence sorting followed by multiple frames and cleanup.
 for(let trial=0;trial<100;trial++){
  const n=[0,1,2,5,29,30,31,100,999,1000,1280][trial%11];
  const states=Array.from({length:n},(_,i)=>{const s=eventBarnState([random()%2,random()%2,random()%2,random()%2,random()%2,random()%2],random()%8,random()%3,i);s[0xc]=random()%2;return s;});
  cases.push(eventBarnCase(`pool-n${n}-t${trial}`,states,[[5,0,0],[4,0,0],[7,0,0],[4,0,0],[8,trial%Math.max(1,n),0],[6,0,0],[4,0,0]]));
 }
 for(const persistence of [0,1,2])for(const slot of [0x10,0x30,0x38,0x40,0x48,0x18,0]){
  const a=eventBarnState([0,1,0,0,1,0],5,persistence,7),replacement=eventBarnState([1,0,0,1,1,0],2,0,8);
  // Replacement is detached, and the original event controls the decision
  // to release; subsequent unload/destruct/free reload the live slot.
  const c=eventBarnCase(`replace-p${persistence}-s${slot}`,[a,replacement],[[4,0,0],[6,0,0]],[[0,slot,1,6,0,0,1],[0,0x48,1,0,0,0x24,0]]);c.slots[1]=NIL;cases.push(c);
 }
 for(const initial of [0,1])for(const targetSeq of [0,99])for(const sourceSeq of [1,98]){
  const source=eventBarnState([1,0,0,1,1,0],sourceSeq,1,1),target=eventBarnState([1,0,0,initial,initial,0],targetSeq,1,2);
  cases.push(eventBarnCase(`capture-i${initial}-t${targetSeq}-s${sourceSeq}`,[source,target],[[4,0,0],[4,0,0],[4,0,0]],[[0,0x48,1,4,1,0,0],[0,0x48,1,0,1,0x24,1]]));
 }
 cases.push(eventBarnCase('nested-dispatch',[eventBarnState([1,0,0,1,1,0],1),eventBarnState([0,0,0,0,1,0],0)],[[4,0,0],[4,0,0]],[[0,0x48,1,4,1,0,0],[0,0x48,1,8,1,0,0],[1,0x30,1,3,0,0,0]]));
 // FindUniqueId includes nonpersistent objects, duplicates and 0xffff.
 const find=eventBarnCase('uid-slot-order',[eventBarnState([],0,0,17),eventBarnState([],1,2,17),eventBarnState([],2,1,0xffff)],[[8,17,0],[8,0xffff,0],[8,9,0]]);find.slots.fill(NIL);find.slots[1278]=0;find.slots[1279]=1;find.slots[5]=2;cases.push(find);
 // Reuse actual serialized FloatAdd fields/references; allocated state and
 // scheduling are explicit snapshots, not inferred missing defaults.
 const batch=objectBatchCases(data);
 for(const n of batch.cases.filter(c=>c.kind===0&&(c.name.includes(':')||Number(c.name.split('-')[1])<32))){
  const p=eventBarnState([1,1,0,0,1,0]);Buffer.from(n.stateHex,'hex').copy(p,0x50,0x50,0x60);
  const c=eventBarnCase(`derived-FloatAdd:${n.name}`,[p],[[4,0,0],[4,0,0],[4,0,0],[6,0,0]]);c.drivers=[[1,n.target,n.amount,n.output]];c.cells=n.cellHex;cases.push(c);
 }
 const audio=JSON.parse(fs.readFileSync('docs/audio-runtime-inventory.json','utf8'));
 const names=audio.nodes.filter((n:any)=>n.className==='PlaySound2D').map((n:any)=>({key:n.key,sound:n.strings.find((f:any)=>f.name==='sound')?.value}));
 for(const n of [{key:'synthetic',sound:'event:/SFX/dispatch'},...names])for(const mode of [0,1,2,3]){
  const p=eventBarnState([1,1,0,0,1,0]);p.writeFloatLE(0.625,0x50);p.writeUInt32LE(3,0x54);p.writeBigUInt64LE(1n,0x58);p.writeBigUInt64LE(0n,0x60);p.writeBigUInt64LE(0n,0x68);p[0x70]=0;p[0x78]=1;p[0x79]=1;p[0x7a]=1;
  const actions=mode===0?[[4,0,0],[1,0,0],[4,0,0],[4,0,0],[6,0,0]]:[[4,0,0],[4,0,0],[4,0,0],[6,0,0]];
  const rules=mode===1?[[0,0x48,1,0,0,0x79,0]]:mode===2?[[0,0x48,1,0,0,0x78,2]]:mode===3?[[0,0x48,1,0,0,0x7a,0]]:[];
  const c=eventBarnCase(`derived-PlaySound2D:${n.key}-m${mode}`,[p],actions,rules);c.drivers=[[2,1,1,0]];c.sound=n.sound;cases.push(c);
 }
 return cases;
}
