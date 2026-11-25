import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {nativeIdentityMatrix,transformNativeObb,type NativeMarkerArithmeticServices} from './marker-transform-runtime';
import {itemEffectArithmetic,itemFloats,itemFloatBytes,itemView,itemMin,itemMax} from './item-effect-arithmetic';
import {setOriginalFlameTransform,setOriginalFlameEnabled,setOriginalFlameIntensity,igniteOriginalFlame,extinguishOriginalFlame,type FlameSoundServices} from './flame-runtime';
import {constructOriginalRenderData} from './vertex-data-runtime';

export interface CandleTransformServices {specialTune():boolean;flameScale():number;arithmetic?:NativeMarkerArithmeticServices;}
const queued=(m:ModelBakeMemory,p:bigint,line:number)=>{if(m.bytes(p+0x54an,1)[0]===1)throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',line,4,'!m_queued');};
/** Candle.SetTransform 0x1001eaf00, distinct from CandleObject.SetTransform.
 * The full source is re-read after sequential renderer stores for aliasing. */
export function setOriginalLiveCandleTransform(m:ModelBakeMemory,candle:bigint,input:bigint|Uint8Array,s:CandleTransformServices){
 queued(m,candle,140);
 if(input instanceof Uint8Array&&input.length!==64)throw new Error('Original Candle transform must have 64 bytes');
 const source=()=>typeof input==='bigint'?m.bytes(input,64):input;
 for(let i=0;i<4;i++)m.bytes(candle+BigInt(0x30+i*16),16).set(new Uint8Array(source().subarray(i*16,i*16+16)));
 const a=itemEffectArithmetic(s.arithmetic),special=s.specialTune()&&m.bytes(candle+0x568n,1)[0]!==0;
 const template=m.read64(candle+0x18n),v=itemFloats(m.bytes(template+0x40n,16)),factor=a.mul(v[3],s.flameScale()),scale=a.mul(factor,special?2.5:1.5);
 const local=nativeIdentityMatrix(),lv=itemView(local);for(let i=0;i<3;i++)lv.setFloat32(i*20,scale,true);
 if(special)v[1]=a.sub(v[1],Math.fround(0.2));local.set(itemFloatBytes([...v.slice(0,3),1]),48);
 setOriginalFlameTransform(m,m.read64(candle+0x10n),transformNativeObb(source(),local,undefined,s.arithmetic),s.arithmetic);
 const world=transformNativeObb(source(),m.bytes(m.read64(candle+0x18n),64),undefined,s.arithmetic),ns=itemFloats(world);
 const radius=itemMax(itemMax(a.length4(ns.slice(0,4)),a.length4(ns.slice(4,8))),a.length4(ns.slice(8,12)));
 m.bytes(candle,16).set(world.subarray(48,64));m.bytes(candle+12n,4).set(itemFloatBytes([radius]));
}

export interface CandleCreationServices extends CandleTransformServices {
 globalBarn():bigint;defaultRenderMatrix():bigint;
 createFlame(owner:bigint,argument:number):bigint;
 loadFlame(flame:bigint,dependency1:bigint,dependency2:bigint):void;
 setupVertex(out:bigint,resource:bigint,dependency:bigint,name:'Candle',buffer:bigint,flag:number):void;
 shaderParameter(out:bigint,name:'u_color'):number;
 sound?:FlameSoundServices;
}
/** Whole CandleBarn.CreateCandle 0x1001eab70. Pool storage, Flame allocation,
 * loading and GPU setup are supplied by their real owners, never invented here. */
export function createOriginalLiveCandle(m:ModelBakeMemory,barn:bigint,s:CandleCreationServices):bigint{
 const count=m.read32(barn+0xf988n);if(count>=m.read32(barn+0xf980n))throw new NativeObjectFoundationFailure('../../../Code/Base/ObjectPool.h',71,4,'m_count < kCapacity');
 m.write32(barn+0xf988n,(count+1)>>>0);
 const bits=m.read64(barn+0xf990n);let word=0,n:number;
 while((n=m.read32(bits+BigInt(word*4)))===0xffffffff)word++;
 const free=(~n)>>>0,index=31-Math.clz32((free&-free)>>>0);m.write32(bits+BigInt(word*4),(n|(1<<index))>>>0);
 let table=m.read64(barn+0xf998n);const offset=BigInt((word*32+index)>>>0)*0x570n,initial=table+offset;
 m.bytes(initial,0x570).fill(0);constructOriginalRenderData(m,initial+0x20n,()=>s.defaultRenderMatrix());m.write32(initial+0x564n,0xffffffff);
 // The original re-reads table after child construction.
 table=m.read64(barn+0xf998n);const candle=table+offset;m.write8(candle+0x568n,0);
 const flame=s.createFlame(m.read64(barn+0x669c0n),0);m.write64(candle+0x10n,flame);
 const initialScale=nativeIdentityMatrix();for(let i=0;i<3;i++)itemView(initialScale).setFloat32(i*20,Math.fround(0.1),true);
 setOriginalFlameTransform(m,flame,transformNativeObb(nativeIdentityMatrix(),initialScale,undefined,s.arithmetic),s.arithmetic);
 s.loadFlame(m.read64(candle+0x10n),m.read64(barn+0x669d8n),m.read64(barn+0x669e0n));
 extinguishOriginalFlame(m,m.read64(candle+0x10n),1,s.sound);setOriginalFlameEnabled(m,m.read64(candle+0x10n),0);
 const loadedFlame=m.read64(candle+0x10n);m.write8(loadedFlame+0x13fn,1);m.write32(loadedFlame+0xa4n,0x3f800000);m.write8(loadedFlame+0xb5n,0);
 s.setupVertex(candle+0x20n,barn+0x669e8n,m.read64(barn+0x669d0n),'Candle',m.read64(barn+0x669c8n)+16n,1);
 m.write32(candle+0x560n,0);const global=s.globalBarn();m.write64(candle+0x18n,global+0xf6e0n);m.write32(m.read64(candle+0x10n)+0x11cn,m.read32(global+0xf74cn));
 queued(m,candle,142);m.write32(candle+0x528n,0);setOriginalLiveCandleTransform(m,candle,nativeIdentityMatrix(),s);
 if(!m.bytes(candle+0x558n,1)[0])throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',168,3,'IsInitialized()');
 m.write32(candle+0x564n,s.shaderParameter(candle+0x290n,'u_color')>>>0);return candle;
}

export interface CandleGroundHit {position:Uint8Array;normal:Uint8Array;}
export interface CandleLevelLoadServices extends CandleCreationServices {
 raycast(owner:bigint,start:Uint8Array,direction:Uint8Array,config:Uint8Array,distance:number):CandleGroundHit|undefined;
 // libm calls are explicit: JS acos/tan are not claimed to be macOS libm.
 acos(value:number):number;tan(value:number):number;
 effectMetadata():bigint;createEffect(owner:bigint,metadata:bigint):bigint;activateEffect(effect:bigint):void;
}
/** Whole CandleBarn.OnLevelLoad 0x1001e9320 including actual record selection,
 * pool creation, binding, projection, ignition/effect and live count reads. */
export function loadOriginalCandleLevel(m:ModelBakeMemory,barn:bigint,game:bigint,s:CandleLevelLoadServices):void{
 const a=itemEffectArithmetic(s.arithmetic),read=(p:bigint)=>itemView(m.bytes(p,4)).getFloat32(0,true),write=(p:bigint,n:number)=>m.bytes(p,4).set(itemFloatBytes([n]));
 for(let i=0;i<m.read32(barn+0xf6d0n);i=(i+1)>>>0){
  const object=barn+0x7010n+BigInt(i)*0xb0n,normal=new Uint8Array(m.bytes(object+16n,64)),v=itemView(normal),lengths:number[]=[];
  for(let col=0;col<3;col++){const axis=itemFloats(normal.subarray(col*16,col*16+16)),length=a.length3(axis);lengths.push(length);if(length>Math.fround(0.00001))for(let row=0;row<3;row++)v.setFloat32(col*16+row*4,a.div(axis[row],length),true);}
  let record=0n,fallback=0n;
  for(let j=0;j<256;j++){const p=barn+16n+BigInt(j)*0x70n;if(!m.bytes(p+0x65n,1)[0]){record=p;break;}if(!fallback&&m.bytes(p+0x62n,1)[0])fallback=p;}
  record=record||fallback;if(!record)throw new NativeObjectFoundationFailure('Candle.cpp',361,3,'c');
  m.bytes(record+16n,96).fill(0);m.write8(record+0x65n,1);m.write32(record+0x48n,(i|0xffff0000)>>>0);m.bytes(record,64).set(normal);
  m.write32(record+0x4cn,m.read32(object+0x98n));write(record+0x50n,itemMin(2,itemMax(0.5,lengths[0])));write(record+0x54n,itemMin(255,read(object+0x9cn)));
  m.write8(record+0x60n,m.bytes(object+0xa3n,1)[0]);const templateIndex=m.read32(object+0xa8n);
  m.write32(record+0x5cn,m.read32(barn+0xf748n+BigInt(templateIndex)*0x70n));m.write8(record+0x64n,m.bytes(object+0xa0n,1)[0]);m.write8(record+0x67n,m.bytes(object+0xa4n,1)[0]);m.write8(record+0x61n,m.bytes(object+0xa1n,1)[0]);m.write32(record+0x58n,0);m.write8(record+0x66n,1);
  const candle=createOriginalLiveCandle(m,barn,s);m.write64(record+0x40n,candle);
  const selectedIndex=m.read32(object+0xa8n),global=s.globalBarn(),template=global+0xf6e0n+BigInt(selectedIndex)*0x70n;
  m.write32(candle+0x560n,selectedIndex);m.write64(candle+0x18n,template);m.write32(m.read64(candle+0x10n)+0x11cn,m.read32(template+0x6cn));
  queued(m,candle,142);m.write32(candle+0x528n,selectedIndex);setOriginalLiveCandleTransform(m,candle,normal,s);
  const live=m.read64(record+0x40n);queued(m,live,138);m.write8(live+0x549n,1);setOriginalFlameEnabled(m,m.read64(live+0x10n),1);
  const scale=a.mul(read(record+0x5cn),read(record+0x50n)),local=nativeIdentityMatrix();for(let col=0;col<3;col++)itemView(local).setFloat32(col*20,scale,true);
  const scaled=transformNativeObb(m.bytes(record,64),local,undefined,s.arithmetic);m.bytes(object+16n,64).set(scaled);
  const bound=m.read64(record+0x40n);m.bytes(object+0x50n,64).set(new Uint8Array(m.bytes(m.read64(bound+0x18n),64)));m.write64(object+0x90n,record);
  // OnLevelLoad retains the second scaled axis in xmm0 for its ground ray.
  // The later projection offset independently measures the first world axis.
  const radius=a.length3(itemFloats(scaled.subarray(16,32))),pos=itemFloats(scaled.subarray(48,64)),start=pos.map((n,j)=>a.add(n,a.mul(radius,j===1?1:0)));
  const config=new Uint8Array(32);itemView(config).setBigUint64(0,0xffffff8f00000001n,true);config[8]=1;
  const hit=s.raycast(m.read64(game+0x138n),itemFloatBytes(start),itemFloatBytes([-0,-1,-0,0]),config,a.add(radius,radius));
  if(hit){
   const angle=s.acos(itemFloats(hit.normal)[1]),world=transformNativeObb(m.bytes(object+16n,64),m.bytes(object+0x50n,64),undefined,s.arithmetic),r=a.length3(itemFloats(world.subarray(0,16))),t=s.tan(angle),p=itemFloats(hit.position);
   const projected=p.map((n,j)=>a.sub(n,a.mul(t,a.mul(r,j===1?1:0))));for(let row=0;row<3;row++){write(object+BigInt(0x40+row*4),projected[row]);write(record+BigInt(0x30+row*4),projected[row]);}
  }
  const flame=m.read64(m.read64(record+0x40n)+0x10n);m.write32(flame+0xbcn,m.bytes(object+0xa2n,1)[0]);
  if(m.bytes(record+0x61n,1)[0]){igniteOriginalFlame(m,flame);if(m.bytes(record+0x61n,1)[0]&&m.bytes(record+0x67n,1)[0]){
   const owner=m.read64(game+0x488n),metadata=s.effectMetadata(),effect=s.createEffect(owner,metadata);m.bytes(effect+0x40n,16).set(new Uint8Array(m.bytes(flame+0xc0n,16)));m.write32(effect+0x50n,m.read32(record+0x4cn));s.activateEffect(effect);
  }}
 }
 m.write32(barn+0xf6d4n,0);
}

export interface CandleIgnitionServices {
 effectMetadata():bigint;createEffect(owner:bigint,metadata:bigint):bigint;activateEffect(effect:bigint):void;
 /** Original MetaClass/notification construction and network dispatch remain
  * explicit services. Local state and effect dispatch happen before this. */
 notify(game:bigint,identifier:number):void;
}
/** Whole normal CandleBarn.Ignite 0x1001eb190. Search all 256 active records,
 * selecting the first matching identifier whose saved lit byte is clear. */
export function igniteOriginalCandle(m:ModelBakeMemory,barn:bigint,game:bigint,identifier:number,notify:number,s:CandleIgnitionServices):void{
 for(let i=0;i<256;i++){
  const record=barn+16n+BigInt(i)*0x70n;
  if(!m.bytes(record+0x65n,1)[0]||m.read32(record+0x48n)!==(identifier>>>0)||m.bytes(record+0x61n,1)[0])continue;
  const flame=m.read64(m.read64(record+0x40n)+0x10n);m.write8(record+0x61n,1);igniteOriginalFlame(m,flame);
  if(m.bytes(record+0x67n,1)[0]){
   const owner=m.read64(game+0x488n),metadata=s.effectMetadata(),effect=s.createEffect(owner,metadata);
   m.bytes(effect+0x40n,16).set(new Uint8Array(m.bytes(flame+0xc0n,16)));m.write32(effect+0x50n,m.read32(record+0x4cn));s.activateEffect(effect);
  }
  if((notify&255)&&m.bytes(record+0x66n,1)[0])s.notify(game,m.read32(record+0x48n));return;
 }
}
export interface CandleUpdateServices extends CandleTransformServices,CandleIgnitionServices {
 debugTimeEnabled():boolean;debugTimeScale():number;
 sound?:FlameSoundServices;
 /** Optional tool UI is an independent service; it consumes the final owner
  * state only after the game update loop has completed. */
 debugDraw?(barn:bigint,game:bigint):void;
}
/** CandleBarn.Update 0x1001e9ba0 normal game path. Its saved-object loop reads
 * record state and count live, shrinks only the consumed vertical axis, and
 * re-reads Flame state after intensity/audio callbacks before synchronizing.
 * Tool UI drawing is an explicitly supplied post-update dependency. */
export function updateOriginalCandleBarn(m:ModelBakeMemory,barn:bigint,game:bigint,s:CandleUpdateServices):void{
 const a=itemEffectArithmetic(s.arithmetic),read=(p:bigint)=>itemView(m.bytes(p,4)).getFloat32(0,true),write=(p:bigint,n:number)=>m.bytes(p,4).set(itemFloatBytes([n]));
 const clock=m.read64(game+0x160n),debug=s.debugTimeEnabled()?s.debugTimeScale():1;
 if(m.read32(barn+0xf6d0n)){
  const delta=itemMin(Math.fround(.266),itemMax(Math.fround(.0001),a.mul(a.mul(debug,read(clock+0x20n)),read(clock+0x14n))));
  for(let i=0;i<m.read32(barn+0xf6d0n);i=(i+1)>>>0){
   const record=barn+16n+BigInt(i)*0x70n,candle=m.read64(record+0x40n),flame=m.read64(candle+0x10n);
   if(!m.bytes(record+0x65n,1)[0]||!m.bytes(record+0x64n,1)[0]){
    setOriginalFlameEnabled(m,flame,0);queued(m,candle,138);m.write8(candle+0x549n,0);setOriginalFlameEnabled(m,m.read64(candle+0x10n),0);continue;
   }
   const object=barn+0x7010n+BigInt(i)*0xb0n;m.bytes(record,64).set(new Uint8Array(m.bytes(object+16n,64)));
   queued(m,candle,138);m.write8(candle+0x549n,1);setOriginalFlameEnabled(m,m.read64(candle+0x10n),1);
   let height=1;
   if(m.bytes(record+0x60n,1)[0]&&read(record+0x54n)>0)height=a.add(a.mul(itemMin(1,itemMax(0,a.div(read(record+0x58n),read(record+0x54n)))),Math.fround(-.9)),1);
   const size=read(record+0x5cn),scale=read(record+0x50n),axis=[a.mul(scale,size),a.mul(scale,a.mul(height,size)),a.mul(scale,size)],transform=new Uint8Array(m.bytes(record,64));
   for(let col=0;col<3;col++)for(let row=0;row<4;row++)itemView(transform).setFloat32(col*16+row*4,a.mul(read(record+BigInt(col*16+row*4)),axis[col]),true);
   setOriginalLiveCandleTransform(m,candle,transform,s);setOriginalFlameEnabled(m,flame,Number(!m.bytes(record+0x62n,1)[0]));
   if(m.bytes(record+0x61n,1)[0]){
    const elapsed=a.add(delta,read(record+0x58n));write(record+0x58n,elapsed);let intensity=2;
    if(read(record+0x54n)>0&&m.bytes(record+0x60n,1)[0])intensity=itemMin(1,itemMax(0,a.mul(itemMax(a.sub(read(record+0x54n),elapsed),0),.5)));
    setOriginalFlameIntensity(m,flame,intensity,s.sound);
    if(Math.abs(intensity)<=Math.fround(.00001)){
     extinguishOriginalFlame(m,flame,1,s.sound);
     if(m.bytes(record+0x60n,1)[0])m.write8(record+0x62n,1);else m.write32(record+0x58n,0);
    }
   }else if(m.bytes(record+0x62n,1)[0])write(record+0x58n,a.add(delta,read(record+0x58n)));
   if(m.bytes(flame+0xb6n,1)[0]&&!m.bytes(record+0x61n,1)[0])igniteOriginalCandle(m,m.read64(game+0x460n),game,m.read32(record+0x48n),1,s);
  }
 }
 s.debugDraw?.(barn,game);
}
