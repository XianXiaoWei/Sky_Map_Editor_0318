import type {ModelBakeMemory} from './model-baked-runtime';
import {resetOriginalBlaze} from './blaze-runtime';
import {originalCreatureLength3} from './bird-load-runtime';
import {natureArithmetic} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {setOriginalFlameTransform,setOriginalFlameEnabled,extinguishOriginalFlame} from './flame-runtime';

const a=natureArithmetic();
const floats=(...ns:number[])=>new Uint8Array(Float32Array.from(ns).buffer);
const identity=()=>floats(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1);
export interface BlazeTextureRef {texture:bigint;release():void;}
export interface BlazeLoadServices {
 frame():number;
 rand():number;
 cloneModel(owner:bigint,source:bigint):bigint;
 localObb(mesh:bigint):Uint8Array;
 hasFloat(model:bigint,name:'u_alphaFade'):number;
 setFloat(model:bigint,name:string,valueBits:number):void;
 setVector(model:bigint,name:string,bytes:Uint8Array,kind:'color'|'vector'):void;
 setTexture(model:bigint,name:'u_texture',texture:bigint):void;
 /** ResourceRef/type/lookup/Observe and ordinary destruction are owned by
  * this service. Missing resources retain their native null texture. */
 acquireTexture(owner:bigint,name:'White'|'UIFootPrint'|'OrangeL2',previous?:BlazeTextureRef):BlazeTextureRef;
 /** Original stack storage: padding is preserved, never inferred as defaults. */
 allocateOptions():Uint8Array;
 createModel(owner:bigint,name:string,shader:string,matrix:Uint8Array,options:Uint8Array):bigint;
 color(name:'ancestor'|'friend'|'normal'|'footprint'):Uint8Array;
 createFlame(owner:bigint):bigint;
 loadFlame(flame:bigint,resources:bigint,sound:bigint):void;
}

/** Whole ordinary Blaze.Load 0x1001ae8e0. The saved LevelMesh branch used
 * by saved mesh configurations clones its own model, consumes each OBB axis and retains
 * native repeated half-scaling. Generated candle/footprint and shaft branches
 * retain their own resources and Flame. Model/resource/audio owners and C++
 * exception unwinding remain explicit dependencies. */
export function loadOriginalBlaze(m:ModelBakeMemory,p:bigint,game:bigint,s:BlazeLoadServices){
 resetOriginalBlaze(m,p,s.frame());m.write8(p+0x11cn,0);m.write64(p+0x110n,0n);
 const random=a.mul(a.mul(bits(s.rand()|0),0x30000000),0x47c35000),v=value(random);
 const truncated=Number.isFinite(v)&&v>=-2147483648&&v<2147483648?Math.trunc(v):-2147483648;
 const seven=(Math.imul(truncated,8)-truncated)|0,product=BigInt(seven)*0x14f8b589n;
 m.write32(p+0x118n,bits(Number((product>>45n)+(product<0n?1n:0n))));m.write64(p+0xe8n,0n);
 let mesh=m.read64(p+0x58n);
 if(mesh){
  m.write64(p+0xe0n,s.cloneModel(m.read64(game+0x5a8n),m.read64(mesh+0x228n)));
  m.bytes(p+0xf0n,16).set(floats(1,1,1,0));
  for(let i=0;i<3;i++){
   mesh=m.read64(p+0x58n);const obb=s.localObb(mesh);
   m.write32(p+BigInt(0xf0+i*4),a.mul(originalCreatureLength3(obb.subarray(i*16,i*16+16)),originalCreatureLength3(m.bytes(p+BigInt(0x10+i*16),16))));
   if(m.bytes(p+0x90n,1)[0])for(let lane=0;lane<4;lane++){const at=p+BigInt(0xf0+lane*4);m.write32(at,a.mul(m.read32(at),lane===3?0:0x3f000000));}
  }
  const present=s.hasFloat(m.read64(p+0xe0n),'u_alphaFade');m.write8(p+0xcan,present);
  if(present&255)s.setFloat(m.read64(p+0xe0n),'u_alphaFade',0x3f800000);
  m.write8(p+0x98n,0);return;
 }
 const options=s.allocateOptions();if(options.length!==96)throw new Error('Blaze Model options must preserve 96 native bytes');const o=new DataView(options.buffer,options.byteOffset,options.byteLength);
 o.setBigUint64(0,0x700000000n,true);options[12]=0;o.setUint32(8,0,true);o.setUint16(13,1,true);o.setUint32(16,0x447a0000,true);o.setUint16(20,0,true);o.setBigUint64(24,0x3f8000003f800000n,true);options[32]=0;o.setBigUint64(36,0x3eb33333n,true);o.setUint32(44,0xc11cf5c3,true);o.setUint16(48,0,true);options[50]=0;o.setUint32(52,0,true);o.setBigUint64(64,0x3f8000003cf5c28fn,true);options[72]=1;o.setBigUint64(76,0x100000000n,true);o.setUint32(84,0x3f800000,true);options[88]=0;options[89]=0;
 let ref=s.acquireTexture(m.read64(game+0x140n),m.bytes(p+0x98n,1)[0]?'White':'UIFootPrint');options[10]=0;
 if(m.bytes(p+0x98n,1)[0]){
  m.write64(p+0xe0n,s.createModel(m.read64(game+0x5a8n),'CandleAncestor','Candle',identity(),options));
  let color:Uint8Array;
  if(m.bytes(p+0x91n,1)[0])color=s.color('ancestor');
  else if(m.bytes(p+0x57n,1)[0])color=s.color('friend');
  else{color=new Uint8Array(s.color('normal'));new DataView(color.buffer).setUint32(4,0x3e19999a,true);new DataView(color.buffer).setUint32(8,0x3dcccccd,true);}
  const c=new DataView(color.buffer,color.byteOffset,color.byteLength),out=new Uint8Array(16),d=new DataView(out.buffer);
  for(let i=0;i<3;i++)d.setUint32(i*4,a.mul(c.getUint32(i*4,true),0x40800000),true);d.setUint32(12,0x3f000000,true);
  s.setVector(m.read64(p+0xe0n),'u_color',out,'color');m.write8(p+0xcan,1);m.bytes(p+0xf0n,16).set(m.bytes(p+0x90n,1)[0]?floats(1,1,1,0):floats(1.5,1.5,1.5,0));
  m.write64(p+0x110n,s.createFlame(m.read64(game+0x418n)));
  setOriginalFlameTransform(m,m.read64(p+0x110n),floats(.1,0,0,0,0,.1,0,0,0,0,.1,0,0,0,0,1));
  s.loadFlame(m.read64(p+0x110n),m.read64(game+0x438n),m.read64(game+0x5c8n));
  extinguishOriginalFlame(m,m.read64(p+0x110n),0);setOriginalFlameEnabled(m,m.read64(p+0x110n),0);
  const flame=m.read64(p+0x110n);m.write8(flame+0x13fn,1);m.write32(flame+0xa4n,0x47c34f80);m.write8(flame+0xb5n,1);m.write32(flame+0x11cn,0x3f800000);
 }else{
  m.write64(p+0xe0n,s.createModel(m.read64(game+0x5a8n),'Plane','UnlitAlphaColor',identity(),options));
  const color=new Uint8Array(s.color('footprint'));new DataView(color.buffer).setUint32(8,0x3f000000,true);s.setVector(m.read64(p+0xe0n),'u_diffuseColor',color,'vector');
  s.setFloat(m.read64(p+0xe0n),'u_alphaFade',0x3f800000);s.setFloat(m.read64(p+0xe0n),'u_scatter',0);s.setTexture(m.read64(p+0xe0n),'u_texture',ref.texture);
  for(const name of ['u_uvOffset','u_uvScale','u_uvScroll'])s.setVector(m.read64(p+0xe0n),name,new Uint8Array(16),'vector');s.setVector(m.read64(p+0xe0n),'u_selfLit',floats(1,.01,0,0),'vector');
  m.write8(p+0xcan,1);m.bytes(p+0xf0n,16).set(floats(1,1,1,0));
  // The same native ResourceRef is re-observed after the second lookup.
  // A missing lookup retains its preceding observation until destruction.
  ref=s.acquireTexture(m.read64(game+0x140n),'OrangeL2',ref);options[10]=0;
  m.write64(p+0xe8n,s.createModel(m.read64(game+0x5a8n),'LightShaft_02','UnlitAlphaFading',identity(),options));
  s.setFloat(m.read64(p+0xe8n),'u_alphaFade',0x3f800000);s.setFloat(m.read64(p+0xe8n),'u_scatter',0x3f800000);s.setTexture(m.read64(p+0xe8n),'u_texture',ref.texture);
  for(const name of ['u_uvOffset','u_uvScroll'])s.setVector(m.read64(p+0xe8n),name,new Uint8Array(16),'vector');s.setVector(m.read64(p+0xe8n),'u_fadingStartEnd',floats(0,30,0,0),'vector');s.setVector(m.read64(p+0xe8n),'u_selfLit',floats(1,.25,.25,0),'vector');
 }
 ref.release();
}
