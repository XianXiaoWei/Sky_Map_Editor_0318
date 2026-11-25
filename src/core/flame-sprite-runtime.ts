import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {itemFloatBytes,itemFloats,itemView,itemMin,itemMax} from './item-effect-arithmetic';
import evidence from '../../docs/flame-sprite-native.json';

const c=evidence.constants,f=Math.fround;
const add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b),div=(a:number,b:number)=>f(a/b);
const length=(v:number[])=>f(Math.sqrt(add(mul(v[2],v[2]),add(mul(v[0],v[0]),mul(v[1],v[1])))));
export interface FlameSprite {position:number[];direction:number[];frame:number;width:number;height:number;color:number[];uv:number[];}
export interface FlameSpriteServices {sinf(n:number):number;}
/** Exact primary-sprite subregion 0x10033e5e3..0x10033e841. Color, wind,
 * camera offset and time are explicit inputs from the unrecovered caller. */
export function originalFlameSprite(m:ModelBakeMemory,flame:bigint,color:number[],wind:number[],cameraOffset:number[],time:number,s:FlameSpriteServices):FlameSprite {
 const read=(offset:number)=>itemView(m.bytes(flame+BigInt(offset),4)).getFloat32(0,true);
 const current=itemFloats(m.bytes(flame+0xc0n,16)),lag=itemFloats(m.bytes(flame+0xf0n,16)),size=read(0x108);
 const safeSize=Number.isNaN(size)?c.minSize:itemMax(c.minSize,size);
 const width=mul(mul(safeSize,add(mul(.25,read(0x10c)),1)),read(0x114)),height=mul(width,c.heightScale);
 const products=color.map((n,i)=>mul(n,c.luminance[i])),lum=add(products[2],add(products[0],products[1]));
 const luminance=Number.isNaN(lum)?c.minLuminance:itemMax(c.minLuminance,lum);
 const windLength=length(wind),wave=Math.abs(s.sinf(mul(mul(itemMax(windLength,c.minWind),time),c.windFrequency)));
 const direction=current.map((n,i)=>add(i===1?height:sub(lag[i],n),mul(mul(div(wind[i],i===3?0:height),i===3?0:wave),c.windAmplitude)));
 // SIMD lane four is the native negative indefinite NaN from 0/0.
 direction[3]=NaN;
 const magnitude=length(direction);if(magnitude>c.normalThreshold)for(let i=0;i<3;i++)direction[i]=div(direction[i],magnitude);
 return {position:current.map((n,i)=>sub(n,cameraOffset[i])),direction,frame:1,width,height,color:[luminance,itemMin(mul(wave,c.windFrequency),1),0,read(0xb0)],uv:[0,0,1,1]};
}

/** Whole SpriteRenderer.Add, preserving write order and overlapping inputs. */
export function addOriginalFlameSprite(m:ModelBakeMemory,owner:bigint,position:bigint,direction:bigint,frame:number,width:number,height:number,color:bigint,uv:number[]){
 const index=m.read32(owner+0x988n);if(index>=m.read32(owner))throw new NativeObjectFoundationFailure('SpriteRenderer.cpp',115,4,'m_renderListSz < m_kMaxSprites');
 const p=m.read64(owner+0x980n)+BigInt(index)*80n;m.write32(owner+0x988n,(index+1)>>>0);
 m.bytes(p,16).set(m.bytes(position,16));m.bytes(p+16n,16).set(m.bytes(direction,16));
 m.bytes(p+32n,12).set(itemFloatBytes([frame,width,height]));m.bytes(p+44n,2).set([0,1]);
 m.bytes(p+48n,16).set(m.bytes(color,16));m.bytes(p+64n,16).set(itemFloatBytes(uv));return p;
}
export function resetOriginalFlameSprites(m:ModelBakeMemory,owner:bigint){m.write32(owner+0x988n,0);}
export function flameSpriteBytes(sprite:FlameSprite){
 const bytes=new Uint8Array(80);bytes.set(itemFloatBytes(sprite.position));bytes.set(itemFloatBytes(sprite.direction),16);
 itemView(bytes).setUint32(28,0xffc00000,true);
 bytes.set(itemFloatBytes([sprite.frame,sprite.width,sprite.height]),32);bytes.set([0,1],44);bytes.set(itemFloatBytes(sprite.color),48);bytes.set(itemFloatBytes(sprite.uv),64);return bytes;
}
export interface FlameBillboardServices {/** Original hardware RSQRTSS estimate; editor may provide a mathematical estimate. */rsqrtEstimate(n:number):number;}
/** Original camera-facing Render branch, four 24-byte position/color/UV
 * vertices. Other SpriteRenderer branches and GPU lifecycle are excluded. */
export function originalFlameBillboard(sprite:Uint8Array,eye:number[],anchor:number,s:FlameBillboardServices){
 if(sprite.length!==80||sprite[45]!==1||anchor<0||anchor>1)throw new Error('Unsupported original Flame sprite branch');
 const values=itemFloats(sprite),position=values.slice(0,4),axis=values.slice(4,8),difference=position.map((n,i)=>sub(n,eye[i]??0));
 const squares=difference.map(n=>mul(n,n)),square=add(squares[2],add(squares[0],squares[1]));
 const estimate=s.rsqrtEstimate(square),factor=mul(estimate,sub(c.newton,mul(estimate,mul(estimate,square===0?0:mul(square,.5)))));
 const normal=difference.map((n,i)=>mul(n,i===3?0:factor));
 const side=[sub(mul(axis[1],normal[2]),mul(axis[2],normal[1])),sub(mul(axis[2],normal[0]),mul(axis[0],normal[2])),sub(mul(axis[0],normal[1]),mul(axis[1],normal[0])),0];
 const sideLength=length(side);
 if(sideLength>c.normalThreshold)for(let i=0;i<3;i++)side[i]=div(side[i],sideLength);
 const left=position.map((n,i)=>add(n,mul(mul(side[i],i===3?0:-.5),values[9]))),right=position.map((n,i)=>add(n,mul(mul(side[i],i===3?0:.5),values[9])));
 const top=mul(values[10],c.anchorTop[anchor]),bottom=mul(values[10],anchor?c.anchorBottom:0),topAxis=axis.map((n,i)=>mul(n,i===3?0:top)),bottomAxis=axis.map((n,i)=>mul(n,i===3?0:bottom));
 const corners=[left.map((n,i)=>add(n,topAxis[i])),right.map((n,i)=>add(n,topAxis[i])),right.map((n,i)=>add(n,bottomAxis[i])),left.map((n,i)=>add(n,bottomAxis[i]))];
 const uv=values.slice(16,20),pairs=[[uv[0],uv[3]],[uv[2],uv[3]],[uv[2],uv[1]],[uv[0],uv[1]]],out=new Uint8Array(96);
 const colors=values.slice(12,16).map(n=>Math.trunc(itemMin(itemMax(mul(255,n),0),255)));
 corners.forEach((p,i)=>{out.set(itemFloatBytes(p.slice(0,3)),i*24);for(let lane=0;lane<3;lane++)if(Number.isNaN(p[lane]))itemView(out).setUint32(i*24+lane*4,0xffc00000,true);out.set(colors,i*24+12);out.set(itemFloatBytes(pairs[i]),i*24+16);});return out;
}
