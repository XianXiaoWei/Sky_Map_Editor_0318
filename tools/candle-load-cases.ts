import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {nativeIdentityMatrix} from '../src/core/marker-transform-runtime';
import {createOriginalLiveCandle,loadOriginalCandleLevel,setOriginalLiveCandleTransform,updateOriginalCandleBarn,igniteOriginalCandle,type CandleLevelLoadServices,type CandleUpdateServices} from '../src/core/candle-runtime';
import {igniteOriginalFlame,extinguishOriginalFlame,setOriginalFlameTransform,setOriginalFlameIntensity,loadOriginalFlame,unloadOriginalFlame} from '../src/core/flame-runtime';
import {unloadOriginalCandleLevel} from '../src/core/candle-unload-runtime';
import {updateOriginalFlameMotionLight} from '../src/core/flame-motion-light-runtime';
import {renderOriginalCandleBarn,type CandleRenderServices} from '../src/core/candle-render-runtime';

export const candleArenaBase=0x450000000n;
export const candleOracleSpans=[[0,0x30000],[0x669c0,0x40],[0x70000,0x26000],[0xa0000,0x8000],[0xc0000,0x2000],[0xf0000,0x200]] as const;
export interface CandleOracleCase {name:string;arena:Buffer;}
/** Prepared owner/allocator/resources are explicit test services. No native
 * constructors are replaced inside the six tested entry points. */
function prepared(mode:number):Buffer {
 const b=Buffer.alloc(0x100000),q=(at:number,p:number)=>b.writeBigUInt64LE(candleArenaBase+BigInt(p),at),f=(at:number,n:number)=>b.writeFloatLE(n,at);
 b.writeUInt32LE(mode,0xf0000);b.writeUInt32LE(1,0xf0004);b.writeUInt32LE(0xf0100,0xf0008);f(0xf0020,1);f(0xf0030,.5);f(0xf0034,.25);
 b.writeUInt32LE(96,0xf980);q(0xf990,0x2ff00);q(0xf998,0x70000);b.fill(0xa5,0x70000,0x96000);
 [0x669c0,0x669c8,0x669d0,0x669d8,0x669e0].forEach((at,i)=>q(at,0xe0000+i*0x100));q(0xf1138,0xe1000);q(0xf1488,0xe2000);
 b.set(nativeIdentityMatrix(),0xf0080);b.set(nativeIdentityMatrix(),0xf0100);b.writeBigUInt64LE(0x123456789abcdef0n,0xf0078);
 for(let i=0;i<4;i++)for(const origin of [0xf6e0,0x1f6e0]){
  const at=origin+i*0x70;b.set(nativeIdentityMatrix(),at);[.3+i*.1,.5+i*.2,.3,1].forEach((n,j)=>f(at+0x40+j*4,n));f(at+0x68,.8+i*.2);b.writeUInt32LE(100+i,at+0x6c);
 }
 for(let i=0;i<8;i++){
  const p=0xa0000+i*0x1b0;b.set(nativeIdentityMatrix(),p+0x10);[2,3,4,1].forEach((n,j)=>{f(p+0xc0+j*4,n);f(p+0xd0+j*4,n+1);});f(p+0xa8,4);f(p+0xac,.8);f(p+0x108,.4);f(p+0x10c,2);f(p+0x110,.005);b[p+0xb6]=1;b[p+0x138]=1;q(p+0x148,0xe3000);
 }
 if(mode===2){b.fill(0,0x70000,0x70570);q(0x70010,0xa0000);q(0x70018,0x1f6e0);b[0x70558]=1;}
 for(let i=0;i<4;i++){
  const p=0x7010+i*0xb0;b.set(nativeIdentityMatrix(),p+16);f(p+0x40,10+i*3);f(p+0x44,8+i);f(p+0x48,-4);b.writeUInt32LE(200+i,p+0x98);f(p+0x9c,25+i);b[p+0xa0]=1;b[p+0xa1]=i%2;b[p+0xa2]=2+i;b[p+0xa3]=1;b[p+0xa4]=1;b.writeUInt32LE(i%4,p+0xa8);
 }
 [4,5,6,1,0,.8,.6,0].forEach((n,j)=>f(0xf0120+j*4,n));
 q(0xf1160,0xf2000);q(0xf1460,0);q(0xf1178,0xe5000);q(0xe5038,0xe5100);b.writeUInt32LE(123,0xf01b8);f(0xf2014,.1);f(0xf2020,1);f(0xf0044,1);b.writeUInt32LE(1,0xf0048);
 if(mode===6||mode===7||mode===9){
  b.writeUInt32LE(3,0xf6d0);
  for(let i=0;i<3;i++){
   const record=16+i*0x70,candle=0x70000+i*0x570;b.fill(0,candle,candle+0x570);q(candle+0x10,0xa0000+i*0x1b0);q(candle+0x18,0x1f6e0+i*0x70);b[candle+0x558]=1;
   b.set(b.subarray(0x7020+i*0xb0,0x7060+i*0xb0),record);q(record+0x40,candle);b.writeUInt32LE(300+i,record+0x48);b.writeUInt32LE(200+i,record+0x4c);f(record+0x50,1);f(record+0x54,2);f(record+0x58,.2);f(record+0x5c,.8+i*.1);b[record+0x60]=b[record+0x61]=b[record+0x64]=b[record+0x65]=b[record+0x66]=1;
  }
 }
 if(mode===9){
  b.writeUInt32LE(3,0xf988);b.writeUInt32LE(7,0x2ff00);q(0xf1070,0xe7000);q(0xf12b8,0xe9000);b.set(nativeIdentityMatrix(),0xe71c0);f(0xf00cc,1);b.writeUInt32LE(7,0xf0058);
  for(let i=0;i<3;i++){const candle=0x70000+i*0x570;[i*.3,0,0,.2].forEach((n,j)=>f(candle+j*4,n));f(0xa0114+i*0x1b0,i*.25);[.8,.7,.6,1].forEach((n,j)=>f(0x1f730+i*0x70+j*4,n));}
 }
 return b;
}
export function candleLoadCases():CandleOracleCase[]{
 const rows:CandleOracleCase[]=[],add=(name:string,mode:number,edit:(b:Buffer)=>void=()=>{})=>{const arena=prepared(mode);edit(arena);rows.push({name,arena});};
 add('load-empty',0);for(let v=0;v<24;v++)add(`load-${v}`,0,b=>{
  b.writeUInt32LE(v%3+1,0xf6d0);b.writeUInt32LE(77,0xf6d4);b.writeUInt32LE(v%2,0xf0028);b.writeUInt32LE(v%4===0?1:0,0xf001c);
  for(let i=0;i<4;i++){
   const p=0x7010+i*0xb0;const scale=[0,.000005,.00002,.25,.5,1,2,4][(v+i)%8];b.writeFloatLE(scale,p+16);b.writeFloatLE((v%3+1)*.3,p+36);b.writeFloatLE(.6,p+56);b[p+0xa1]=v%2;b[p+0xa4]=v%3===0?1:0;b.writeFloatLE(v%4===0?300:v%4===1?-5:25,p+0x9c);
  }
  if(v===6)for(let i=0;i<5;i++)b[0x10+i*0x70+0x65]=1;
  if(v===7||v===8){for(let i=0;i<256;i++)b[0x10+i*0x70+0x65]=1;if(v===7)b[0x10+17*0x70+0x62]=1;}
  if(v===9){b[0x70b1]=b[0x70b4]=1;b.writeUInt32LE(1,0xf000c);}
  if(v===10)b.writeUInt32LE(1,0xf0010);if(v===11)b.writeUInt32LE(2,0xf0010);if(v===12)b.writeUInt32LE(0,0xf980);
 });
 for(let v=0;v<9;v++)add(`create-${v}`,1,b=>{
  if(v===1){b.writeUInt32LE(0xffffffff,0x2ff00);b.writeUInt32LE(32,0xf988);}if(v===2){b.writeUInt32LE(15,0x2ff00);b.writeUInt32LE(4,0xf988);}
  if(v===3)b.writeUInt32LE(96,0xf988);if(v===4)b.writeUInt32LE(1,0xf0010);if(v===5)b.writeUInt32LE(2,0xf0010);
  if(v>=6)b.writeUInt32LE(1,0xf001c);if(v===7)b.writeUInt32LE(1,0xf0014);if(v===8)b.writeFloatLE(.1,0xf0020);
 });
 for(const mode of [2,3])for(let v=0;v<12;v++)add(`${mode===2?'candle':'flame'}-transform-${v}`,mode,b=>{
  const src=v<8?0xf0100:(mode===2?0x70000:0xa0000)+[0,16,32,48][v-8];b.writeUInt32LE(src,0xf0008);
  // Aligned overlapping transforms expose sequential native column stores.
  b.set(nativeIdentityMatrix(),src);for(let i=0;i<16;i++)b.writeFloatLE(i%5===0?1+v*.2:(i%4===3?0:(i%3-1)*.125),src+i*4);b.writeFloatLE(1,src+60);
  if(mode===2){b.writeBigUInt64LE(candleArenaBase+0xa0000n,0x70010);b.writeBigUInt64LE(candleArenaBase+0x1f6e0n,0x70018);b[0x70568]=v%2;b[0xf0024]=v%3===0?1:0;b.writeFloatLE(.7+v*.1,0xf0020);if(v===7)b[0x7054a]=1;}
 });
 add('ignite-unlit',4,b=>{b[0xa00b6]=0;});add('ignite-lit',4);
 for(let v=0;v<16;v++)add(`extinguish-${v}`,5,b=>{
  if(v===0)b[0xa00b6]=0;if(v===1)b.writeUInt32LE(0,0xf0004);if(v===2)b.writeUInt32LE(256,0xf0004);
  if(v===3)b.writeFloatLE(.01,0xa0110);if(v===4)b.writeFloatLE(.02,0xa0110);if(v===5)b.writeUInt32LE(0x7fc12345,0xa0110);
  if(v===6)b.writeUInt32LE(1,0xf0014);if(v===7)b.writeFloatLE(-1,0xa0108);if(v===8)b.writeUInt32LE(0x7fc12345,0xa0108);
  if(v===9)b.writeUInt32LE(0x7fc54321,0xa00a8);if(v===10)b.writeFloatLE(-1,0xa00a8);if(v===11)b.writeFloatLE(-1,0xa010c);
  if(v===12)b.writeFloatLE(-.005,0xa0110);if(v===13)b.writeUInt32LE(0x80000000,0xa0110);if(v===14)b.writeUInt32LE(255,0xf0004);if(v===15)b.writeUInt32LE(1,0xa00bc);
 });
 for(let v=0;v<48;v++)add(`update-${v}`,6,b=>{
  if(v===0)b.writeUInt32LE(0,0xf6d0);b[0xf0040]=v%2;b.writeFloatLE(v%5===0?0:v%5===1?-2:v%5===2?100:.5,0xf0044);b.writeFloatLE(v%7===0?0:v%7===1?-.1:v%7===2?2:.1,0xf2014);b.writeFloatLE(.3+(v%3),0xf2020);
  for(let i=0;i<3;i++){
   const p=16+i*0x70;b[p+0x61]=v%4===0?0:1;b[p+0x62]=v%6===0?1:0;b[p+0x60]=v%3===0?0:1;b[p+0x64]=v%8===0?0:1;b[p+0x65]=v%9===0?0:1;b[p+0x67]=v%5===0?1:0;b.writeFloatLE([-1,0,.01,.5,1,2][(v+i)%6],p+0x54);b.writeFloatLE([0,.2,.5,1,2,5][(v+2*i)%6],p+0x58);b[0xa00b6+i*0x1b0]=v%4===0?1:v%4===1?0:1;
  }
  if(v===11)b[0x7054a]=1;if(v>=40)b.writeUInt32LE(5,0xf0048);
 });
 for(let v=0;v<10;v++)add(`candle-ignite-${v}`,7,b=>{
  b.writeUInt32LE(v===0?999:300+v%3,0xf004c);b.writeUInt32LE(v%2,0xf0004);
  for(let i=0;i<3;i++){const p=16+i*0x70;b[p+0x61]=0;b[p+0x67]=v%3===0?0:1;b[p+0x66]=v%4===0?0:1;if(v===5)b[p+0x65]=0;if(v===6)b[p+0x61]=1;}
  if(v===7){b.writeUInt32LE(301,16+0x48);b[16+0x61]=1;}
  if(v===8)b.writeUInt32LE(256,0xf0004);
 });
 for(let v=0;v<8;v++)add(`flame-intensity-${v}`,8,b=>{b.writeFloatLE([0,-0,-1,.005,.01,1,2,NaN][v],0xf0050);if(v===5)b[0xa00b6]=0;});
 for(let v=0;v<32;v++)add(`render-${v}`,9,b=>{
  b.writeUInt32LE(v%8,0xf0058);b[0xf0024]=v%2;
  for(let i=0;i<3;i++){const p=0x70000+i*0x570;b[p+0x568]=v%3===0?1:0;b.writeFloatLE([-.1,0,.2,1][(v+i)%4],p+12);b.writeFloatLE(v%5===0?100:v%5===1?-2:i*.3,p);b.writeFloatLE(v%6===0?60:0,0xf00c4);b.writeFloatLE(v%7===0?-2:2,0xa010c+i*0x1b0);}
  if(v===15)b[0x70558]=0;if(v===16)b.writeUInt32LE(0,0x2ff00);if(v===17)b.writeUInt32LE(0,0xf988);
  if(v>=18){b.writeFloatLE(2,0xe71c0);b.writeFloatLE(.25,0xe71c4);b.writeFloatLE(.5,0xe71e8);b.writeFloatLE(-.3,0xe71f4);}
 });
 for(let v=0;v<32;v++)add(`flame-load-${v}`,10,b=>{
  b.fill(0x5a,0xa00f0,0xa01b0);b[0xa013e]=v===0?1:0;b[0xa00b6]=v%3===0?0:1;b.writeUInt32LE(v%9,0xa00bc);
  b.writeInt32LE([0,1,0x7fffffff,-0x80000000,123456789][v%5],0xf0068);b.writeInt32LE([1,0,0x7fffffff,-1,987654321][v%5],0xf006c);
  b.writeFloatLE([0,.001,.1,1,2,10][v%6],0xa0010);b.writeFloatLE([-.2,.4,1,2][v%4],0xa0034);b.writeFloatLE([0,.001,.01,.2,NaN,-1][v%6],0xa0108);
  if(v===24)b.writeUInt32LE(1,0xf0014);
 });
 for(let v=0;v<8;v++)add(`candle-with-flame-load-${v}`,11,b=>{b.writeUInt32LE(v%4,0xf6d0);b.writeUInt32LE(v%2,0xf0028);b.writeUInt32LE(123456789,0xf0068);b.writeUInt32LE(0x7fffffff,0xf006c);});
 for(let v=0;v<12;v++)add(`flame-unload-${v}`,12,b=>{
  b.writeBigUInt64LE(123n,0xa0170);b.writeBigUInt64LE(123n,0xf00e0);b.writeBigUInt64LE(candleArenaBase+0xe3000n,0xa0188);b.writeBigUInt64LE(123n,0xa0190);
  if(v===1)b.writeBigUInt64LE(0n,0xa0168);if(v===2)b.writeBigUInt64LE(0n,0xa0170);if(v===3)b.writeBigUInt64LE(456n,0xa0170);if(v===4)b.writeBigUInt64LE(0n,0xa0188);if(v===5)b.writeBigUInt64LE(0n,0xa0190);if(v===6)b.writeBigUInt64LE(456n,0xa0190);if(v===7)b.writeUInt32LE(1,0xf00e4);
 });
 for(let v=0;v<12;v++)add(`candle-unload-${v}`,13,b=>{
  b.writeUInt32LE(v===0?0:v===1?0:v===2?1:35,0xf980);b.writeUInt32LE(12,0xf984);b.writeUInt32LE(v===0?0:v===1?0:v===2?1:0x80000003,0x2ff00);b.writeUInt32LE(v>=4?5:0,0x2ff04);if(v===6)b.writeUInt32LE(1,0xf00e8);
 });
 for(let v=0;v<48;v++)add(`flame-motion-light-${v}`,14,b=>{
  b[0xa00b4]=v%8?1:0;b[0xa0138]=v%3===0?255:1;b.writeFloatLE([0,.0001,.016,.1,1,-.1][v%6],0xf0050);b.writeFloatLE([0,.0001,.01,.5][v%4],0xf2018);b[0xf0040]=v%2;b.writeFloatLE(v%3===0?2:.5,0xf0044);b.writeFloatLE(v%3===0?.5:1,0xf2020);
  b.writeFloatLE([0,.1,.5,1,2][v%5],0xf0060);b.writeFloatLE([0,.1,1,2][v%4],0xf005c);b.writeFloatLE([0,.01,1,2][v%4],0xf0054);b.writeFloatLE([0,.01,.1,1,2][v%5],0xa0110);b.writeFloatLE([0,.5,1,1.1,2,3][v%6],0xa010c);b.writeFloatLE([0,.01,.2,1][v%4],0xa0108);
  [0,1,2,3].forEach(i=>{b.writeFloatLE(i===3?(v%3):i*(v%4),0xa00c0+i*4);b.writeFloatLE(i===3?1:i*(v%5)*.5,0xa00d0+i*4);b.writeFloatLE(i===3?1:i*(v%7)*.1,0xa00f0+i*4);});
 });
 return rows;
}
export function evaluateCandleLoadCase(config:Uint8Array):Buffer {
 const arena=Buffer.from(config),base=candleArenaBase,trace:Buffer[]=[],offset=(p:bigint)=>Number(p-base);
 const m={bytes:(p:bigint,n:number)=>arena.subarray(offset(p),offset(p)+n),read32:(p:bigint)=>arena.readUInt32LE(offset(p)),read64:(p:bigint)=>arena.readBigUInt64LE(offset(p)),write8:(p:bigint,n:number)=>{arena[offset(p)]=n;},write32:(p:bigint,n:number)=>{arena.writeUInt32LE(n>>>0,offset(p));},write64:(p:bigint,n:bigint)=>{arena.writeBigUInt64LE(n,offset(p));},string:()=>''};
 const record=(tag:number)=>{const b=Buffer.alloc(640);b.writeUInt32LE(tag);trace.push(b);return b;};let flames=0,effects=0,sounds=0,randoms=0,allocation=0xd0000;
 const s:CandleLevelLoadServices&CandleUpdateServices={globalBarn:()=>base+0x10000n,defaultRenderMatrix:()=>base+0xf0080n,specialTune:()=>!!arena[0xf0024],flameScale:()=>arena.readFloatLE(0xf0020),debugTimeEnabled:()=>!!arena[0xf0040],debugTimeScale:()=>arena.readFloatLE(0xf0044),
  notify:(game,id)=>{record(12);record(13);const r=record(14);r.writeBigUInt64LE(m.read64(m.read64(game+0x178n)+0x38n),8);r.writeBigUInt64LE(base+0xe4010n,16);r.writeUInt32LE(arena.readUInt32LE(0xf01b8),24);r.writeUInt32LE(id>>>0,28);},
  createFlame:(owner,arg)=>{const r=record(1),p=base+0xa0000n+BigInt(flames++)*0x1b0n;r.writeBigUInt64LE(owner,8);r.writeUInt32LE(arg,16);r.writeBigUInt64LE(p,24);return p;},
  loadFlame:(p,a,b)=>{const r=record(2);r.writeBigUInt64LE(p,8);r.writeBigUInt64LE(a,16);r.writeBigUInt64LE(b,24);if(arena.readUInt32LE(0xf001c)){m.write8(p+0xb6n,1);m.write32(p+0x110n,0);}},
  setupVertex:(p,ref,dependency,name,buffer,flag)=>{const r=record(3);r.writeBigUInt64LE(p,8);r.writeBigUInt64LE(ref,16);r.writeBigUInt64LE(dependency,24);r.writeBigUInt64LE(buffer,32);r.writeUInt32LE(flag,40);r.set(Buffer.from(name+'\0'),48);const mode=arena.readUInt32LE(0xf0010);m.write8(p+0x538n,mode===2?0:1);m.write8(p+0x52an,mode===1?1:0);},
  shaderParameter:(p,name)=>{const r=record(4);r.writeBigUInt64LE(p,8);r.set(Buffer.from(name+'\0'),16);return 7;},
  raycast:(owner,start,direction,config,distance)=>{const r=record(5);r.writeBigUInt64LE(owner,8);r.set(start,16);r.set(direction,32);r.set(config.subarray(0,9),48);r.set(config.subarray(16,32),64);r.writeFloatLE(distance,80);return arena.readUInt32LE(0xf0028)?{position:arena.subarray(0xf0120,0xf0130),normal:arena.subarray(0xf0130,0xf0140)}:undefined;},
  acos:n=>{record(6).writeFloatLE(n,8);return arena.readFloatLE(0xf0030);},tan:n=>{record(7).writeFloatLE(n,8);return arena.readFloatLE(0xf0034);},
  effectMetadata:()=>{record(8);return base+0xf0060n;},createEffect:(owner,metadata)=>{const r=record(9),p=base+0xc0000n+BigInt(effects++)*0x80n;r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(metadata,16);r.writeBigUInt64LE(p,24);return p;},
  activateEffect:p=>{record(10).writeBigUInt64LE(p,8);const delta=arena.readUInt32LE(0xf000c);if(delta){arena.writeUInt32LE(arena.readUInt32LE(0xf6d0)+delta,0xf6d0);arena.writeUInt32LE(0,0xf000c);}},
  sound:{arithmetic:{calculate:(op,a,b)=>Math.fround(op==='add'?a+b!:op==='subtract'?a-b!:op==='multiply'?a*b!:op==='divide'?a/b!:Math.sqrt(a))},play:(owner,name,options,parameters)=>{const r=record(11);r.writeBigUInt64LE(owner,8);r.set(Buffer.from(name+'\0'),16);r.set(options,48);r.set(parameters,176);
   if(++sounds===1&&arena.readUInt32LE(0xf0014)){arena.writeBigUInt64LE(base+0xf0070n,0xa0148);arena.writeFloatLE(5,0xa00a8);arena.writeFloatLE(.75,0xa0108);arena.writeFloatLE(2,0xa010c);arena.writeFloatLE(.5,0xa00ac);arena.writeFloatLE(10,0xa00c4);}
  }}
 };
 const loadServices={rand:()=>{record(22).writeUInt32LE(randoms,8);return arena.readInt32LE(0xf0068+4*(randoms++&1));},playLoop:(owner:bigint,name:'fireloopalt3',options:Uint8Array,parameters:Uint8Array)=>{s.sound!.play(owner,name as any,options,parameters);return [base+0xe3000n,123n] as const;},sound:s.sound,arithmetic:s.sound!.arithmetic};
 if(arena.readUInt32LE(0xf0000)===11)s.loadFlame=(p,a,b)=>loadOriginalFlame(m,p,a,b,loadServices);
 const renderServices:CandleRenderServices={specialTune:s.specialTune,allocator:()=>{record(15);return base+0xe9200n;},heap:()=>base+0xe9100n,
  allocate:(owner,n,heap,align)=>{const r=record(16);r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(BigInt(n),16);r.writeBigUInt64LE(heap,24);r.writeUInt32LE(align,32);allocation=Math.ceil(allocation/align)*align;const p=base+BigInt(allocation);allocation+=n+16;return p;},free:(owner,p)=>{const r=record(17);r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(p,16);},
  cameraPosition:camera=>{record(18).writeBigUInt64LE(camera,8);return arena.subarray(0xf00c0,0xf00d0);},visibility:(owner,spheres,count,statuses,mode)=>{const r=record(19);r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(spheres,16);r.writeUInt32LE(count,24);r.writeBigUInt64LE(statuses,32);r.writeUInt32LE(mode,40);r.set(m.bytes(spheres,count*16),64);for(let i=0;i<count;i++)m.write32(statuses+BigInt(i)*4n,arena.readUInt32LE(0xf0058)>>>i&1);},
  parameter:(owner,index,value)=>{const r=record(20);r.writeBigUInt64LE(owner,8);r.writeUInt32LE(index,16);r.set(value,32);},render:p=>{record(21).writeBigUInt64LE(p,8);}
 };
 let line=0,severity=0,result=0n;try{switch(arena.readUInt32LE(0xf0000)){
  case 0:loadOriginalCandleLevel(m,base,base+0xf1000n,s);break;case 1:result=createOriginalLiveCandle(m,base,s);break;
  case 2:setOriginalLiveCandleTransform(m,base+0x70000n,base+BigInt(arena.readUInt32LE(0xf0008)),s);break;
  case 3:setOriginalFlameTransform(m,base+0xa0000n,base+BigInt(arena.readUInt32LE(0xf0008)));break;
  case 4:igniteOriginalFlame(m,base+0xa0000n);break;case 5:extinguishOriginalFlame(m,base+0xa0000n,arena.readUInt32LE(0xf0004),s.sound);break;
  case 6:for(let i=0;i<arena.readUInt32LE(0xf0048);i++)updateOriginalCandleBarn(m,base,base+0xf1000n,s);break;
  case 7:igniteOriginalCandle(m,base,base+0xf1000n,arena.readUInt32LE(0xf004c),arena.readUInt32LE(0xf0004),s);break;
  case 8:setOriginalFlameIntensity(m,base+0xa0000n,arena.readFloatLE(0xf0050),s.sound);break;
  case 9:renderOriginalCandleBarn(m,base,base+0xf1000n,renderServices);break;
  case 10:loadOriginalFlame(m,base+0xa0000n,base+0xe2000n,base+0xe3000n,loadServices);break;
  case 11:loadOriginalCandleLevel(m,base,base+0xf1000n,s);break;
  case 12:unloadOriginalFlame(m,base+0xa0000n,{identity:p=>{record(23).writeBigUInt64LE(p,8);if(arena.readUInt32LE(0xf00e4)){m.write64(base+0xa0168n,base+0xe3200n);arena.writeUInt32LE(0,0xf00e4);}return arena.readBigUInt64LE(0xf00e0);},stop:(p,on)=>{const r=record(24);r.writeBigUInt64LE(p,8);r.writeUInt32LE(on,16);}});break;
  case 13:unloadOriginalCandleLevel(m,base,p=>{record(25).writeBigUInt64LE(p,8);if(arena.readUInt32LE(0xf00e8)){arena.writeUInt32LE(1,0xf980);arena.writeUInt32LE(0,0xf00e8);}});break;
  case 14:updateOriginalFlameMotionLight(m,base+0xa0000n,base+0xf1000n,arena.readFloatLE(0xf0050),{debugTimeEnabled:s.debugTimeEnabled,debugTimeScale:s.debugTimeScale,expf:n=>{record(26).writeFloatLE(n,8);return arena.readFloatLE(0xf0060);},powf:(n,e)=>{const r=record(27);r.writeFloatLE(n,8);r.writeFloatLE(e,12);return arena.readFloatLE(e===3?0xf0054:0xf005c);}});break;
 }}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(20);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(trace.length,8);header.writeBigUInt64LE(result,12);
 return Buffer.concat([header,...trace,...candleOracleSpans.map(([at,n])=>arena.subarray(at,at+n))]);
}
