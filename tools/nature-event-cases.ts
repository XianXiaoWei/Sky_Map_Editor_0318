import {enableOriginalBirdV2ParamSwap,enableOriginalBirdV2AiSwap,updateOriginalBirdV2AiSwap,enableOriginalSetBirdGuidesEnabled,enableOriginalSetDarkCreaturesNetworked,updateOriginalAwakenDarkCreatures,enableOriginalCritterShout,updateOriginalCritterSendMsg,updateOriginalDarkCreatureMusic,type CreatureEventServices} from '../src/core/nature-event-runtime';
import {enableOriginalSetFlame,updateOriginalSetFlame,updateOriginalOnFlame,updateOriginalSetFlameOccIntensity,type FlameEventServices} from '../src/core/flame-event-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const NATURE_ARENA_BYTES=0x10000,NATURE_TRACE_BYTES=4096;
export interface NatureEventCase {mode:number;seed:number;visual?:number;audio?:number;messages?:number;nullTable?:boolean;nullCritter?:boolean;objectCastNull?:boolean;objectAdjustment?:number;music?:{target?:number;near?:number;far?:number;minimum?:number;maximum?:number;current?:number;exp?:number;local?:number;hidden?:number;active?:number;state?:number;positions?:number[][];player?:number[];};count?:number;nullClump?:boolean;badCast?:boolean;nullParams?:boolean;guide?:number;enabled?:number;lit?:number;all?:number;stoke?:number;extinguish?:number;fireOnce?:number;delta?:number;timeScale?:number;debug?:number;elapsed?:number;duration?:number;delay?:number;scale?:number;minimum?:number;networked?:number;authority?:number;dormant?:boolean;candle?:boolean;mutation?:number;}
export function prepareNatureEvent(c:NatureEventCase){
 const base=0x440000000n,b=Buffer.alloc(NATURE_ARENA_BYTES);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const at=(p:bigint,n:number)=>{const offset=Number(p-base);if(offset<0||offset+n>b.length)throw new Error('Unmapped nature event address');return offset;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n&255;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:()=>''};
 const ptr=(at:number,target:number)=>b.writeBigUInt64LE(target?base+BigInt(target):0n,at);
 const word=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at);
 // All metadata services are injected. Function pointers use fixed mapped
 // thunks, avoiding differences from the Linux runner's own ASLR addresses.
 for(const [address,kind] of [[0xf000,0],[0xf200,1],[0xf300,2],[0xf400,3],[0xf500,4]]){ptr(address,0xf100);word(address+8,kind);}
 if(c.mode===10){ptr(0xf700,0xf100);word(0xf708,5);b.writeBigUInt64LE(0x102200040n,0xf668);}
 b.writeBigUInt64LE(0x102200000n,0xf140);b.writeBigUInt64LE(0x102200020n,0xf610);
 const count=c.count??2;ptr(0x2038,0);ptr(0x2008,0x2100);word(0x2010,count);ptr(0x4008,0x4100);word(0x4010,count);
 for(let i=0;i<4;i++){
  const p=0x3000+i*0x600;ptr(0x2100+i*8,p);ptr(0x4100+i*8,p);
  ptr(p,0xf600);ptr(p+120,0x6000+i*0x100);ptr(p+0x90,0x8000+i*0x100);
  ptr(0x8000+i*0x100+64,0x9000+i*0x40);ptr(0x9000+i*0x40+16,0xa000+i*0x400);
  b[p+0x440]=c.guide??0;b[p+0x2dc]=c.networked??0;b[p+180]=c.enabled??1;b[p+182]=c.lit??1;b[p+0x138]=c.stoke??0;
  const candleFlame=0xa000+i*0x400;ptr(candleFlame,0xf600);b[candleFlame+180]=c.enabled??1;b[candleFlame+182]=c.lit??1;b[candleFlame+0x138]=c.stoke??0;
  ptr(0x6000+i*0x100+72,0x7000);
 }
 ptr(0x1038,c.nullClump?0:c.mode===0||c.mode===3?c.nullParams?0:0x6000:0x2000);
 ptr(0x1040,c.mode===0||c.mode===3||c.mode===4?0x3000:c.mode===7?c.nullClump?0:0x2000:0x7000);
 if(c.mode===1||c.mode===2)b[0x1040]=c.enabled??1;
 if(c.mode===10){b[0x1040]=c.visual??1;b[0x1041]=c.audio??1;ptr(0x3c8,0xd000);}
 if(c.mode===7){b[0x1038]=c.lit??1;word(0x103c,c.duration??0x3e800000);word(0x1048,c.delay??0);}
 if(c.mode===8){b[0x1048]=c.stoke??0;b[0x1049]=c.all??0;b[0x104a]=c.fireOnce??1;b[0x104b]=c.extinguish??0;word(0x1050,c.minimum??0x3f800000);}
 word(0x104c,c.mode===8?c.duration??0:c.elapsed??0);if(c.mode===4)word(0x1048,c.scale??0x3f800000);
 ptr(0x160,0x500);ptr(0x178,0x800);ptr(0x840,0xb000);word(0xb820,c.dormant?77:1);ptr(0x418,0xd000);
 word(0x514,c.delta??0x3dcccccd);word(0x520,c.timeScale??0x3f800000);
 word(0xe000,c.debug===undefined?0:1);word(0xe004,c.debug??0x3f800000);word(0xe008,c.authority??1);word(0xe00c,c.candle?1:0);word(0xe010,c.badCast?1:0);word(0xe014,c.mutation??0);
 if(c.mode===11){ptr(0xf800,0xf100);word(0xf808,6);ptr(0x1040,c.nullTable?0:0x2100);word(0x1048,c.count??2);ptr(0x1058,0x4000);word(0x4010,c.messages??2);word(0x2010,0);for(let i=0;i<4;i++)ptr(0x4100+i*8,0x7000+i*0x100);if(c.nullCritter)ptr(0x2100,0);word(0xe018,11);word(0xe01c,c.objectCastNull?1:0);word(0xe020,c.objectAdjustment??0);}
 if(c.mode===12){const music=c.music??{};ptr(0x1038,0x7000);ptr(0x1040,0x2000);[music.target??0x3f800000,music.near??0x3f400000,music.far??0x3e800000,music.minimum??0x3f800000,music.maximum??0x42c80000,music.current??0x3ecccccd].forEach((n,i)=>word(0x1048+i*4,n));ptr(0x280,0xd000);ptr(0xb018,0xb100);word(0xb0e0,42);(music.player??[0,0,0,1]).forEach((n,i)=>b.writeFloatLE(n,0xb110+i*4));word(0xe024,music.exp??0x3f700000);for(let i=0;i<4;i++){const p=0x3000+i*0x600;b[p+0x2c7]=music.local??0;word(p+0x2c8,42);b[p+0x2c5]=music.hidden??0;b[p+0x1d4]=music.active??1;word(p+0x2e0,music.state??0);(music.positions?.[i]??[i+2,1,0,0]).forEach((n,j)=>b.writeFloatLE(n,p+0x60+j*4));}}
 return {base,b,m,event:base+0x1000n,game:base};
}
export function evaluateNatureEvent(c:NatureEventCase){
 const {base,b,m,event,game}=prepareNatureEvent(c),trace:number[]=[];let casts=0,line=0,severity=0;
 const log=(op:number,p:bigint,n:number)=>{trace.push(op,Number(p-base)>>>0,n>>>0);};
 const mutate=()=>{casts++;if(casts!==1)return;
  if(c.mutation===1){m.write64(event+56n,base+0x4000n);m.write64(event+64n,base+0x4000n);m.write64(base+0x4100n,base+0x3600n);}
  if(c.mutation===2)m.write32(base+0x2010n,0);
  if(c.mutation===3){m.write8(event+64n,255);m.write8(base+0x32dcn,0);}
  if(c.mutation===4){m.write32(event+60n,0x3f000000);m.write32(event+76n,0x40000000);}
 };
 const cast=(p:bigint,kind:number)=>{log(1,p,kind);mutate();if(!p||c.badCast)return 0n;if(!kind)return c.mode===11?(c.objectCastNull?0n:p+BigInt(c.objectAdjustment??0)):p;if(kind===4)return c.candle?p:0n;if(kind===3)return c.candle?0n:p;return p;};
 const start=(p:bigint)=>log(2,p,0),setObjectEnabled=(p:bigint,n:number)=>log(3,p,n),getFlameEnabled=(p:bigint)=>{log(4,p,0);return m.bytes(p+180n,1)[0];};
 const s:CreatureEventServices={castCreature:(p,k)=>cast(p,k==='BirdV2'?1:2),setObjectEnabled,start};
 const flame:FlameEventServices={castObject:p=>cast(p,0),castFlame:p=>cast(p,3),castCandle:p=>cast(p,4),getFlameEnabled,setObjectEnabled,start,
  extinguish:(p,n)=>{log(5,p,n);m.write8(p+182n,0);m.write64(p+0x10cn,0n);m.write8(p+0x138n,0);}};
 try{
  if(c.mode===0)enableOriginalBirdV2ParamSwap(m,event,s);
  else if(c.mode===1)enableOriginalSetBirdGuidesEnabled(m,event,s);
  else if(c.mode===2)enableOriginalSetDarkCreaturesNetworked(m,event,s);
  else if(c.mode===3)enableOriginalBirdV2AiSwap(m,event);
  else if(c.mode===4)updateOriginalBirdV2AiSwap(m,event,game,c.debug,s);
  else if(c.mode===5)updateOriginalAwakenDarkCreatures(m,event,game,{...s,dormantState:77,networkAuthority:p=>{log(6,p,0);return c.authority??1;}});
  else if(c.mode===6)enableOriginalSetFlame(m,event);
  else if(c.mode===7)updateOriginalSetFlame(m,event,game,c.debug,flame);
  else if(c.mode===8)updateOriginalOnFlame(m,event,flame);
  else if(c.mode===9)updateOriginalSetFlameOccIntensity(m,event,game,start);
  else if(c.mode===10)enableOriginalCritterShout(m,event,game,{castCritter:p=>cast(p,5),start,shout:(p,owner,visual,audio)=>{log(7,p,visual);log(8,owner,audio);if(c.mutation===5){m.write64(game+0x3c8n,base+0xd100n);m.write8(event+64n,255);m.write8(event+65n,0);}if(c.mutation===6)m.write32(base+0x2010n,0);}});
  else if(c.mode===11)updateOriginalCritterSendMsg(m,event,{castMessage:p=>cast(p,6),castCritterObject:p=>cast(p,0),start,sendMessage:(p,msg)=>{log(9,p,Number(msg-base));if(c.mutation===7){m.write32(event+72n,1);m.write32(base+0x4010n,0);}if(c.mutation===8)m.write64(event+88n,base+0x2000n);if(c.mutation===9)m.write32(base+0x4010n,4);}});
  else if(c.mode===12)updateOriginalDarkCreatureMusic(m,event,game,c.debug,{castDarkCreature:p=>cast(p,2),localPlayer:p=>{log(10,p,0);return base+0xb000n;},expBits:input=>{log(11,base,input);const result=c.music?.exp??0x3f700000;log(12,base,result);return result;}});
  else throw new Error('Unknown nature event mode');
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(12+NATURE_TRACE_BYTES);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(trace.length,8);trace.forEach((n,i)=>header.writeUInt32LE(n,12+i*4));return Buffer.concat([header,b]);
}
export function natureEventCases(){
 const out:NatureEventCase[]=[];const add=(c:Omit<NatureEventCase,'seed'>)=>out.push({...c,seed:out.length+97});
 for(const guide of [0,1,255])for(const nullParams of [false,true])add({mode:0,guide,nullParams});
 for(const mode of [1,2]){for(const count of [0,1,4])for(const enabled of [0,1,255])add({mode,count,enabled});for(const x of [{nullClump:true},{badCast:true},{mutation:1},{mutation:2},{mutation:3}])add({mode,...x});}
 for(const nullParams of [false,true])add({mode:3,nullParams});
 for(const delta of [0,0x3a83126f,0x3dcccccd,0x3f800000,0x7fc12345,0x80000000,0xbf800000])for(const elapsed of [0,0x40333333,0x40400000])add({mode:4,delta,elapsed});
 for(const scale of [0,0x3f800000,0xbf800000,0x7fc34567])add({mode:4,scale,debug:0x40000000,timeScale:0x3f000000});
 for(const dormant of [true,false])for(const networked of [0,1,255])for(const authority of [0,1,256])add({mode:5,dormant,networked,authority});
 for(const x of [{count:0},{nullClump:true},{badCast:true},{mutation:1},{mutation:2}])add({mode:5,...x});
 add({mode:6});add({mode:9});
 for(const candle of [false,true])for(const lit of [0,1])for(const duration of [0,0x3e800000,0x3f800000])for(const elapsed of [0,0x3e4ccccd,0x40000000])add({mode:7,candle,lit,duration,elapsed,delay:0x3dcccccd});
 for(const x of [{count:0},{badCast:true},{mutation:1},{mutation:2},{mutation:4},{delta:0x7fc12345},{duration:0x7fc34567},{delay:0xbf800000}])add({mode:7,...x});
 for(const candle of [false,true])for(const all of [0,1])for(const stoke of [0,1])for(const extinguish of [0,1])for(const lit of [0,1])for(const enabled of [0,1])add({mode:8,candle,all,stoke,extinguish,lit,enabled,duration:0x3f000000,minimum:0x3f000000});
 for(const x of [{count:0,all:0},{count:0,all:1},{badCast:true},{mutation:1,all:1},{mutation:2,all:1},{fireOnce:0},{minimum:0x7fc12345,all:1},{minimum:0,all:1}])add({mode:8,...x});
 for(const count of [0,1,4])for(const visual of [0,1,255])for(const audio of [0,1,255])add({mode:10,count,visual,audio});
 for(const x of [{nullClump:true},{badCast:true},{mutation:1},{mutation:2},{mutation:3},{mutation:5},{mutation:6}])add({mode:10,...x});
 for(const count of [0,1,4])for(const messages of [0,1,4])for(const objectAdjustment of [0,8])add({mode:11,count,messages,objectAdjustment});
 for(const x of [{nullTable:true},{nullCritter:true},{badCast:true},{objectCastNull:true},{mutation:7},{mutation:8},{mutation:9,messages:1}])add({mode:11,...x});
 for(const count of [0,1,4])for(const local of [0,1,255])for(const hidden of [0,1])add({mode:12,count,music:{local,hidden}});
 for(const x of [{badCast:true},{mutation:1},{mutation:2},{delta:0},{delta:0x7fc12345},{debug:0x40000000,timeScale:0x3f000000}])add({mode:12,...x});
 for(const music of [{active:0},{state:3},{positions:[[1,0,0,0]]},{positions:[[100,0,0,0]]},{minimum:0x3f800000,maximum:0x3f800000},{minimum:0x42c80000,maximum:0x3f800000},{target:0x3e000000},{near:0x7fc12345},{exp:0},{exp:0x3f800000},{exp:0x40000000},{exp:0xbf800000},{exp:0x7fc12345}])add({mode:12,count:1,music});
 return out;
}
