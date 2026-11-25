import type {ModelBakeMemory} from './model-baked-runtime';
import type {NativeMarkerArithmeticServices} from './marker-transform-runtime';
import {itemEffectArithmetic,itemFloats,itemFloatBytes,itemView,itemMax} from './item-effect-arithmetic';
/** Original 0x10033ac40: disabling a lit Flame starts its fade by writing
 * intensity +0x110, instead of clearing lit or making it vanish immediately. */
export function setOriginalFlameEnabled(m:ModelBakeMemory,out:bigint,value:number){
 const enabled=value&255;m.write8(out+180n,enabled);
 if(enabled===0&&m.bytes(out+182n,1)[0]!==0){m.write8(out+182n,1);m.write32(out+272n,0x3f800000);}
}
export function getOriginalFlameEnabled(m:ModelBakeMemory,out:bigint){return m.bytes(out+180n,1)[0];}

/** Original 0x10033a760; ignition leaves consumption/duration untouched. */
export function igniteOriginalFlame(m:ModelBakeMemory,out:bigint){m.write8(out+0xb6n,1);m.write32(out+0x110n,0x3f800000);}

/** Original 0x10033b460. A non-positive intensity extinguishes a lit flame
 * through the same audio path. Its unordered comparison skips extinguishing. */
export function setOriginalFlameIntensity(m:ModelBakeMemory,out:bigint,value:number,s?:FlameSoundServices){
 m.bytes(out+0x110n,4).set(itemFloatBytes([value]));
 if(value<=0&&m.bytes(out+0xb6n,1)[0])extinguishOriginalFlame(m,out,1,s);
}

/** Original 0x10033abc0. Preserve column aliasing, previous position and
 * the first source axis captured before any overlapping destination stores. */
export function setOriginalFlameTransform(m:ModelBakeMemory,out:bigint,input:bigint|Uint8Array,s?:NativeMarkerArithmeticServices){
 if(input instanceof Uint8Array&&input.length!==64)throw new Error('Original Flame transform must have 64 bytes');
 const source=(at:number)=>new Uint8Array(typeof input==='bigint'?m.bytes(input+BigInt(at),16):input.subarray(at,at+16));
 const first=source(0);
 for(let i=0;i<4;i++)m.bytes(out+BigInt(0x10+i*16),16).set(i===0?first:source(i*16));
 m.bytes(out+0xd0n,16).set(new Uint8Array(m.bytes(out+0xc0n,16)));
 m.bytes(out+0xc0n,16).set(source(48));
 const a=itemEffectArithmetic(s),size=a.add(a.mul(a.length3(itemFloats(first)),Math.fround(0.2)),Math.fround(0.025));
 m.bytes(out+0x108n,4).set(itemFloatBytes([size]));
}

export interface FlameSoundServices {
 play(owner:bigint,name:'firebreathein'|'fireextinguish',options:Uint8Array,parameters:Uint8Array):void;
 arithmetic?:NativeMarkerArithmeticServices;
}
export interface FlameLoadServices {
 /** Original macOS rand returns a signed 32-bit integer. */
 rand():number;
 playLoop(owner:bigint,name:'fireloopalt3',options:Uint8Array,parameters:Uint8Array):readonly [bigint,bigint];
 sound?:FlameSoundServices;
 arithmetic?:NativeMarkerArithmeticServices;
}
/** Whole original Flame.Load 0x10033afa0. The resource argument is unused
 * by this entry; the audio owner, handle pair and live field rereads are not.
 * Loading an already loaded Flame is a complete no-op. */
export function loadOriginalFlame(m:ModelBakeMemory,out:bigint,_resources:bigint,audioOwner:bigint,s:FlameLoadServices){
 if(m.bytes(out+0x13en,1)[0])return;
 const a=itemEffectArithmetic(s.arithmetic),read=(at:bigint)=>itemView(m.bytes(out+at,4)).getFloat32(0,true),write=(at:bigint,n:number)=>m.bytes(out+at,4).set(itemFloatBytes([n]));
 m.write8(out+0xb5n,1);m.bytes(out+0xb9n,2).fill(0);m.write32(out+0x139n,0x01010000);
 m.write64(out+0x110n,0n);m.write32(out+0x118n,0);m.write8(out+0x13dn,1);m.write8(out+0x13en,1);m.write8(out+0x13fn,1);m.write64(out+0x120n,0n);
 m.bytes(out+0x50n,64).set(itemFloatBytes([.25,0,0,0,0,.25,0,0,0,0,.25,0,0,0,0,1]));m.write64(out+0x148n,audioOwner);
 if(m.read32(out+0xbcn)!==7){
  const volume=a.mul(Number.isNaN(read(0x108n))?Math.fround(.01):itemMax(Math.fround(.01),read(0x108n)),a.add(a.mul(read(0x10cn),.25),1));
  const options=new Uint8Array(128),v=itemView(options);v.setFloat32(0,1,true);options[0xd]=1;options.set(new Uint8Array(m.bytes(out+0xc0n,16)),0x10);v.setFloat32(0x4c,a.mul(a.add(volume,volume),read(0xa8n)),true);v.setFloat32(0x5c,1,true);v.setUint32(0x70,0x8c31,true);
  const parameters=new Uint8Array(0x1b0),p=itemView(parameters);parameters[0]=0x3f;parameters[1]=0x32;p.setFloat32(0x20,volume,true);parameters.set(new Uint8Array(m.bytes(out+0xacn,4)),0x24);p.setUint32(0x1a0,3,true);p.setUint32(0x1ac,2,true);
  const handle=s.playLoop(audioOwner,'fireloopalt3',options,parameters);m.write64(out+0x168n,handle[0]);m.write64(out+0x170n,handle[1]);
 }
 m.write64(out+0x100n,0n);m.write32(out+0x128n,0);
 const random=a.mul(Math.fround(s.rand()|0),2**-31);write(0xb0n,Math.fround((1-random)*0+random));
 const phase=a.mul(Math.fround(s.rand()|0),2**-31);write(0x130n,a.add(a.add(a.mul(phase,.5),a.mul(a.sub(1,phase),0)),.5));m.write32(out+0x134n,0);
 const axis=new Uint8Array(m.bytes(out+0x10n,16));m.bytes(out+0xd0n,16).set(new Uint8Array(m.bytes(out+0xc0n,16)));m.bytes(out+0xc0n,16).set(new Uint8Array(m.bytes(out+0x40n,16)));
 write(0x108n,a.add(a.mul(a.length3(itemFloats(axis)),Math.fround(.2)),Math.fround(.025)));
 if(m.bytes(out+0xb6n,1)[0])igniteOriginalFlame(m,out);else extinguishOriginalFlame(m,out,1,s.sound);
}
export interface FlameHandleServices {
 identity(owner:bigint):bigint;
 stop(owner:bigint,enabled:0):void;
}
/** Whole original Flame.Unload 0x10033b350. Handles are validated against
 * their saved identity before stopping, and remain stored after unload. */
export function unloadOriginalFlame(m:ModelBakeMemory,out:bigint,s?:FlameHandleServices){
 m.write8(out+0xb4n,0);m.write8(out+0x13en,0);m.write32(out+0x150n,0);m.write8(out+0xb6n,0);m.bytes(out+0x139n,2).fill(0);m.write64(out+0x110n,0n);m.write32(out+0x118n,0);
 for(const at of [0x168n,0x188n]){
  const owner=m.read64(out+at),token=owner?m.read64(out+at+8n):0n;if(!owner||!token)continue;
  if(!s)throw new Error('Original Flame unload requires its handle services');
  if(s.identity(owner)===token)s.stop(m.read64(out+at),0);
 }
}
/** Whole original 0x10033a780. Audio dispatch remains an explicit dependency;
 * both byte buffers and their construction order are restored. Silence needs
 * no audio owner. The actual native threshold is 0.01, not the fade midpoint. */
export function extinguishOriginalFlame(m:ModelBakeMemory,out:bigint,withSound:number,s?:FlameSoundServices){
 const wasLit=m.bytes(out+0xb6n,1)[0];m.write8(out+0xb6n,0);
 const read=(at:bigint)=>itemView(m.bytes(out+at,4)).getFloat32(0,true);
 if(wasLit&&(withSound&255)&&Math.fround(0.01)>read(0x110n)){
  if(!s)throw new Error('Original Flame extinguish requires its audio dispatch service');
  const a=itemEffectArithmetic(s.arithmetic),safeMax=(lower:number,n:number)=>Number.isNaN(n)?lower:itemMax(lower,n);
  const options=(range:number,size:number)=>{
   const b=new Uint8Array(0x80),v=itemView(b);v.setFloat32(0,1,true);b[0xd]=1;
   b.set(new Uint8Array(m.bytes(out+0xc0n,16)),0x10);v.setFloat32(0x48,range,true);v.setFloat32(0x4c,size,true);v.setFloat32(0x5c,1,true);v.setUint32(0x70,0x8c31,true);return b;
  };
  const parameters=(volume:number)=>{
   const b=new Uint8Array(0x1b0),v=itemView(b);b[0]=0x3f;b[1]=0x32;v.setFloat32(0x20,volume,true);
   b.set(new Uint8Array(m.bytes(out+0xacn,4)),0x24);v.setUint32(0x1a0,3,true);v.setUint32(0x1ac,2,true);return b;
  };
  const volume=()=>a.mul(safeMax(Math.fround(0.01),read(0x108n)),a.add(a.mul(0.25,read(0x10cn)),1));
  const owner=m.read64(out+0x148n),firstOptions=options(2.5,safeMax(3,read(0xa8n)));
  s.play(owner,'firebreathein',firstOptions,parameters(volume()));
  // Dispatch may mutate the Flame; all fields are read anew for the second call.
  const secondOwner=m.read64(out+0x148n),secondVolume=volume(),secondSize=safeMax(1,a.mul(secondVolume,read(0xa8n)));
  s.play(secondOwner,'fireextinguish',options(Math.fround(0.7),secondSize),parameters(secondVolume));
 }
 m.write64(out+0x10cn,0n);m.write8(out+0x138n,0);
}
