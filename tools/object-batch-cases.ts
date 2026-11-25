import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface ObjectBatchCase {name:string;kind:number;stateHex:string;cellHex:string[];members:number[];events:number[];target:number;amount:number;output:number;frame:number[];}
export function objectBatchCases(root?:string){
 const cases:ObjectBatchCase[]=[],f=(v:number)=>bits(v),blank=()=>{const b=Buffer.alloc(96,0xa5);b[0x22]=0;b.writeUInt32LE(123,0x10);return b;};
 const cells=(values:number[])=>values.map(v=>{const b=Buffer.alloc(32,0x96);b.writeUInt32LE(v,0x10);b[0xc]=0;return b;});
 const add=(name:string,kind:number,state:Buffer,values:Buffer[],members:number[]=[],events:number[]=[],target=0,amount=0xffffffff,output=0xffffffff,frame=[0.016,1,1])=>cases.push({name,kind,stateHex:state.toString('hex'),cellHex:values.map(v=>v.toString('hex')),members,events,target,amount,output,frame});
 let seed=0x3187194a;const rnd=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
 for(let i=0;i<2048;i++){
  const state=blank(),values=cells([f((rnd()%10000)/32-150),f((rnd()%10000)/128-30),f(99)]);
  state.writeUInt32LE(f((rnd()%10000)/128-30),0x50);state.writeUInt32LE(f((i%3? -10:50)),0x54);state.writeUInt32LE(f((i%3?40:0)),0x58);state[0x5c]=i&1;state[0x5d]=i>>1&1;state[0x5e]=i>>2&1;
  add(`FloatAdd-${i}`,0,state,values,[],[],0,i&8?1:0xffffffff,i&16?i%3:0xffffffff);
 }
 for(const input of [-Infinity,-1,-0,0,0.99,1,2.99,4,2147483648,Infinity,NaN])for(const n of [0,1,7,31]){
  add(`FloatEnable-${input}-${n}`,1,blank(),cells([f(input),f(1),f(2)]),Array.from({length:n},(_,i)=>i%2?1:2));
 }
 add('FloatEnable-null-cast',1,blank(),cells([f(4)]),[0xffffffff]);
 for(const n of [0,1,2,7])for(const enabled of [0,1,2])for(const trigger of [0,1])for(const once of [0,1]){
  const state=blank();state[0x40]=trigger;state[0x50]=once;const values=cells(Array.from({length:n+3},()=>f(0)));
  for(let i=0;i<n;i++)values[i][0xc]=enabled===2?i%2:enabled;
  add(`IfEnabled-${n}-${enabled}-${trigger}-${once}`,2,state,values,Array.from({length:n},(_,i)=>i),Array.from({length:3},(_,i)=>n+i));
 }
 for(const snap of [0,0.01,1,5,29,30,40])for(const duration of [-1,0,0.005,0.5,1,2])for(const dt of [-1,0,0.016,1]){
  const state=blank();state.writeFloatLE(10.25,0x38);state.writeFloatLE(duration,0x3c);state.writeFloatLE(snap,0x48);state.writeFloatLE(0.1,0x4c);state.writeFloatLE(-5.125,0x50);
  add(`SetFloat-${snap}-${duration}-${dt}`,4,state,cells([f(9)]),[],[],0,0xffffffff,0xffffffff,[dt,0.75,1.25]);
 }
 for(const input of [0,0x80000000,0x7fc12345,0xff823456,0x7f800000,0x42ca8000])add(`SetFloat-reset-${input}`,3,blank(),cells([input]));
 for(let kind=5;kind<=12;kind++)for(const persistence of [0,1,2])for(const id of [0,1,0x1234,0xffff])for(const type of [0,1,254,255]){
  const state=blank();state.writeUInt32LE(persistence,0x28);state.writeUInt16LE(id,0x2c);state[0x2e]=type;state[0x21]=0x77;state[0x22]=1;state[0x23]=0x55;
  add(`Event-${kind}-${persistence}-${id}-${type}`,kind,state,[],[],[],0x3180abcd);
 }
 const actual:unknown[]=[],missing:unknown[]=[];
 if(root)for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
  const file=path.join(root,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const doc=new ObjectsDocument(fs.readFileSync(file));
  for(const n of doc.nodes.filter(n=>['FloatAdd','FloatEnable','IfEnabled','SetFloat'].includes(n.className))){
   try{
    const state=blank(),ids:number[]=[],values:Buffer[]=[];
    const cell=(id:number)=>{let i=ids.indexOf(id);if(i>=0)return i;const node=doc.nodes[id];if(!node)throw new Error('Missing target');ids.push(id);const v=Buffer.alloc(32,0x96);v[0xc]=0;const value=node.fields.find(f=>f.name==='value');if(node.className==='Float'&&(!value||value.length!==4))throw new Error('Unverified missing Float value');v.writeUInt32LE(value&&value.length===4?Buffer.from(value.raw,'hex').readUInt32LE():0,0x10);values.push(v);return ids.length-1;};
    const ref=(owner:ObjectNode,name:string)=>{const field=owner.fields.find(f=>f.name===name);if(!field||field.kind!=='reference'||field.value===0xffffffff)return 0xffffffff;return Number(field.value);};
    const members=(owner:ObjectNode,name:string)=>{const id=ref(owner,name);if(id===0xffffffff)throw new Error('Missing '+name+' Clump');const clump=doc.nodes[id];if(clump.className!=='Clump')throw new Error('Non-Clump '+name);return (clump.fields.find(f=>f.name==='data')?.children??[]).map(f=>f.value===0xffffffff?0xffffffff:cell(Number(f.value)));};
    const copy=(name:string,offset:number)=>{const field=n.fields.find(f=>f.name===name);if(!field)throw new Error('Unverified missing default '+name);const b=Buffer.from(field.raw,'hex');b.copy(state,offset);};
    let objects:number[]=[],events:number[]=[],target=0,amount=0xffffffff,output=0xffffffff,kind=0;
    if(n.className==='FloatAdd'){
     const id=ref(n,'target');if(id===0xffffffff||doc.nodes[id].className!=='Float')throw new Error('Missing Float target');target=cell(id);const a=ref(n,'amountFloat'),o=ref(n,'output');amount=a===0xffffffff?a:cell(a);output=o===0xffffffff?o:cell(o);
     for(const [name,offset] of [['amount',0x50],['minClampedValue',0x54],['maxClampedValue',0x58],['useMinClampedValue',0x5c],['useMaxClampedValue',0x5d],['updateEveryFrame',0x5e]] as const)copy(name,offset);
    }else if(n.className==='FloatEnable'){kind=1;const id=ref(n,'input');if(id===0xffffffff)throw new Error('Missing Float input');target=cell(id);objects=members(n,'objects');}
    else if(n.className==='IfEnabled'){kind=2;objects=members(n,'areTheseObjectsEnabled');events=members(n,'events');copy('triggerOnDisabled',0x40);copy('checkOnce',0x50);}
    else {kind=4;const id=ref(n,'target');if(id===0xffffffff)throw new Error('Missing Float target');target=cell(id);copy('targetValue',0x38);copy('time',0x3c);copy('snappiness',0x48);state.writeUInt32LE(0,0x4c);state.writeUInt32LE(values[target].readUInt32LE(0x10),0x50);}
    add(`${level}:n${n.id}`,kind,state,values,objects,events,target,amount,output);actual.push({key:`${level}:n${n.id}`,className:n.className,sourceReferences:ids});
   }catch(error){missing.push({key:`${level}:n${n.id}`,className:n.className,reason:String(error)});}
  }
 }
 return {cases,actual,missing};
}
