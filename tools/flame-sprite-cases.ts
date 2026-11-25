import {addOriginalFlameSprite,resetOriginalFlameSprites,originalFlameSprite,originalFlameBillboard} from '../src/core/flame-sprite-runtime';
import {itemFloatBytes} from '../src/core/item-effect-arithmetic';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import evidence from '../docs/flame-sprite-native.json';
export const flameSpriteBase=0x440000000n;
export interface FlameSpriteCase {label:string;mode:number;seed:number;size?:number;light?:number;consumption?:number;time?:number;wind?:number[];color?:number[];current?:number[];lag?:number[];sprite?:number[];eye?:number[];anchor?:number;capacity?:number;index?:number;inputs?:number[];}
export function flameSpriteCases(){
 const cases:FlameSpriteCase[]=[];
 for(const size of [.001,.01,.3,1])for(const light of [.1,1])for(const wind of [[0,0,0,0],[1,-2,3,0]])cases.push({label:'primary '+[size,light,wind],mode:0,seed:17,size,light,wind});
 for(let i=0;i<40;i++)cases.push({label:'primary dynamic '+i,mode:0,seed:i+13,size:(i+1)*.03,light:(i+1)/40,consumption:(i%8)/4,time:i*.173,color:[i*.03,i%3*.1,-i*.003,1],wind:[i*.001,-i*.1,i*.3,0],lag:[.1,-.2,.3,1]});
 for(const anchor of [0,1])for(const eye of [[0,1,3,1],[2,-1,4,1],[-4,2,-1,1],[0,0,0,1],[0,10,0,1]])for(const height of [.06,1,6])cases.push({label:'billboard '+[anchor,eye,height],mode:1,seed:13,anchor,eye,sprite:[0,0,0,1,0,1,0,0,1,height/6,height,0,1,.17,.27,0,0,0,1,1]});
 for(let i=0;i<30;i++)cases.push({label:'billboard dynamic '+i,mode:1,seed:i+7,anchor:i%2,eye:[i*.3,-i*.2,3+i*.1,1],sprite:[.2,-.1,.3,1,.1,.9,-.3,0,1,.3+i*.01,1+i*.1,0,i*.05,-.01,i*.01,.3,0,0,1,1]});
 for(const inputs of [[0x1e010,0x1e020,0x1e030],[0x5000,0x5010,0x5030],[0x1e010,0x5000,0x5030],[0x5010,0x1e020,0x5000]])cases.push({label:'Add alias '+inputs,mode:2,seed:23,inputs});
 cases.push({label:'Add capacity assertion',mode:2,seed:23,capacity:0,index:0,inputs:[0x1e010,0x1e020,0x1e030]},{label:'Add next slot',mode:2,seed:23,capacity:3,index:1,inputs:[0x1e010,0x1e020,0x1e030]},{label:'Reset nonzero list',mode:3,seed:17,index:123});return cases;
}
export function prepareFlameSprite(c:FlameSpriteCase){
 const b=Buffer.alloc(0x20000);let seed=c.seed;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const offset=(p:bigint)=>Number(p-flameSpriteBase),m={bytes:(p:bigint,n:number)=>b.subarray(offset(p),offset(p)+n),read32:(p:bigint)=>b.readUInt32LE(offset(p)),read64:(p:bigint)=>b.readBigUInt64LE(offset(p)),write32:(p:bigint,n:number)=>b.writeUInt32LE(n>>>0,offset(p)),write64:(p:bigint,n:bigint)=>b.writeBigUInt64LE(n,offset(p)),write8:(p:bigint,n:number)=>{b[offset(p)]=n;},string:()=>''};
 const floats=(at:number,values:number[])=>b.set(itemFloatBytes(values),at);
 b.writeUInt32LE(c.mode,0x1e000);b.writeUInt32LE(c.capacity??4,0x3000);b.writeUInt32LE(c.index??0,0x3988);b.writeBigUInt64LE(flameSpriteBase+0x5000n,0x3980);
 floats(0x10c0,c.current??[0,0,0,1]);floats(0x10f0,c.lag??[0,0,0,1]);floats(0x1108,[c.size??.3,c.consumption??0,1,c.light??1]);floats(0x10b0,[.137]);
 floats(0x1e010,c.color??[1,.16,.0625,1]);floats(0x1e020,evidence.constants.cameraOffset);floats(0x1e030,c.wind??[0,0,0,0]);floats(0x1e040,[c.time??.125]);
 b.writeBigUInt64LE(flameSpriteBase+0xe000n,0x82c8);
 floats(0xa000,c.eye??[0,1,3,1]);b.writeUInt32LE(2,0x3158);b.writeUInt32LE(24,0x3108);b[0x396a]=b[0x39b0]=b[0x39b1]=0;b[0x39b2]=c.anchor??0;
 b.writeUInt32LE(1280,0xc260);b.writeUInt32LE(720,0xc264);
 if(c.mode===1){floats(0x5000,c.sprite!);b[0x502d]=1;b.writeUInt32LE(1,0x3988);}
 if(c.mode===2){c.inputs!.forEach((n,i)=>b.writeUInt32LE(n,0x1e004+i*4));floats(0x1e050,[1,0,1,.3,1.8]);}
 return {b,m};
}
export function evaluateFlameSprite(c:FlameSpriteCase,nativeTrace:Buffer[]){
 const {b,m}=prepareFlameSprite(c),base=flameSpriteBase,owner=base+0x3000n,calls:Buffer[]=[];let line=0,severity=0;
 const record=(kind:number)=>{const r=Buffer.alloc(96);r.writeUInt32LE(kind);calls.push(r);return r;};
 try{
  if(c.mode===0){
   const r=record(2);r.writeBigUInt64LE(base+0xe000n,8);r.writeBigUInt64LE(base+0x10c0n,16);r.set(b.subarray(0x10c0,0x10d0),24);
   const floats=(at:number,n=4)=>Array.from({length:n},(_,i)=>b.readFloatLE(at+i*4));
   const sprite=originalFlameSprite(m,base+0x1000n,floats(0x1e010),floats(0x1e030),floats(0x1e020),b.readFloatLE(0x1e040),{sinf:n=>{const r=record(1),native=nativeTrace[calls.length-1];r.writeFloatLE(n,8);if(!native||!r.subarray(0,12).equals(native.subarray(0,12)))throw new Error('Native sine input differs '+c.label);r.set(native.subarray(12,16),12);return native.readFloatLE(12);}});
   // Feed the original Add with scratch inputs without changing caller memory.
   const p=base+0x5000n; m.write32(owner+0x988n,1);b.set(itemFloatBytes(sprite.position),0x5000);b.set(itemFloatBytes(sprite.direction),0x5010);b.writeUInt32LE(0xffc00000,0x501c);b.set(itemFloatBytes([1,sprite.width,sprite.height]),0x5020);b[0x502c]=0;b[0x502d]=1;b.set(itemFloatBytes(sprite.color),0x5030);b.set(itemFloatBytes(sprite.uv),0x5040);
  }else if(c.mode===1){
   const trace=nativeTrace[0];if(trace?.readUInt32LE()!==3)throw new Error('Missing independent hardware rsqrt');calls.push(trace);
   record(4);const sorted=record(5);sorted.writeBigUInt64LE(base+0x5000n,8);sorted.writeBigUInt64LE(base+0x5050n,16);
   const mapped=record(6);mapped.writeBigUInt64LE(owner+0x150n,8);const camera=record(7);camera.writeBigUInt64LE(base+0xa000n,8);
   const vertices=originalFlameBillboard(b.subarray(0x5000,0x5050),Array.from({length:4},(_,i)=>b.readFloatLE(0xa000+i*4)),c.anchor??0,{rsqrtEstimate:n=>{const bytes=Buffer.alloc(4);bytes.writeFloatLE(n);if(!bytes.equals(trace.subarray(8,12)))throw new Error('rsqrt input differs');return trace.readFloatLE(12);}});
   b.set(vertices,0x10000);b.writeUInt32LE(6,0x394c);record(8).writeBigUInt64LE(owner+8n,8);
  }else if(c.mode===2){addOriginalFlameSprite(m,owner,base+BigInt(c.inputs![0]),base+BigInt(c.inputs![1]),1,.3,1.8,base+BigInt(c.inputs![2]),[0,0,1,0]);}
  else resetOriginalFlameSprites(m,owner);
 }catch(error){if(!(error instanceof NativeObjectFoundationFailure))throw error;line=error.line;severity=error.severity;}
 const header=Buffer.alloc(12);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(calls.length,8);return Buffer.concat([b,header,...calls]);
}
