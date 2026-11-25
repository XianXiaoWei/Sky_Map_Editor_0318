import {prepareCrabNetwork,type CrabNetworkCase} from './crab-network-cases';
import {serializeOriginalCrabState,originalCrabBinaryNetworkServices} from '../src/core/crab-codec-runtime';
import {originalCrabNetworkBarnServices,type CrabNetStateServices} from '../src/core/crab-network-runtime';
import {writeOriginalBinaryBits,readOriginalBinaryBits,serializeOriginalBinaryFloat,serializeOriginalBinaryUInt,serializeOriginalBinaryPlayerId} from '../src/core/binary-stream-runtime';
import {updateOriginalCrabBarn} from '../src/core/crab-barn-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface CrabCodecCase extends Omit<CrabNetworkCase,'mode'> {mode:0|1|2|3|4|5|6|7|8;write?:number;context?:number;targetKind?:number;capacity?:number;bitOffset?:number;bufferFill?:number;valid?:number;boundsAssert?:number;valueAssert?:number;missingBuffer?:boolean;missingPlayerBarn?:boolean;bitCount?:number;input?:number;minimum?:number;maximum?:number;pivot?:number;motion?:number[];statePositionBits?:number[];ownerPresent?:number;}
const base=0x440000000n;
export function crabCodecCases(){const cases:CrabCodecCase[]=[],add=(mode:CrabCodecCase['mode'],label:string,c:Partial<CrabCodecCase>={})=>cases.push({label:'Crab codec '+mode+' '+label,mode,...c});
 for(const context of [1,2,3])for(const targetKind of [0,1,2,3])for(const ownerPresent of [0,1,2])for(const mode of [0,1] as const)add(mode,'target/context/owner '+[targetKind,context,ownerPresent],{context,targetKind,ownerPresent});
 for(const count of [0,1,2,3,16,256,257,0x80000001,0xffffffff])add(0,'byte count narrowing '+count,{count,context:3});
 for(const capacity of [0,3,4,5,6,7,8,16,24,32,64])for(const write of [0,1])for(const boundsAssert of [0,1])add(0,'capacity/align/failure '+[capacity,write,boundsAssert],{capacity,write,boundsAssert,context:3,targetKind:3});
 for(const bitOffset of [0,1,7])for(const mode of [0,1] as const)add(mode,'initial byte alignment '+bitOffset,{bitOffset,context:3,targetKind:3});
 for(const motion of [[-1,0,.5,1,2],[-0,.0625,.4999,.5,.5001,.9375,1],[NaN,0,1],[Infinity,-Infinity,0]])for(const valueAssert of [0,1])add(0,'quantized motion '+[motion,valueAssert],{motion:motion.map(bits),valueAssert,context:3});
 for(const missingBuffer of [true])for(const write of [0,1])add(0,'missing stream buffer '+write,{write,missingBuffer,context:3});
 for(const context of [0,4])add(0,'invalid player context '+context,{context,targetKind:0});
 add(0,'missing player Barn',{context:2,missingPlayerBarn:true,targetKind:0});
 for(const mode of [2,3] as const)for(const count of [0,1,2,3,16])for(const context of [1,2,3])for(const targetType of ['none','crab','avatar'] as const)add(mode,'actual Barn packet '+[count,context,targetType],{count,context,targetType,owners:[23],kind:targetType==='avatar'?9:1,steps:2});
 for(const mode of [4,5] as const)for(const bitCount of [0,1,7,8,9,16,31,32,33])for(const bitOffset of [0,7])add(mode,'bit count/offset '+[bitCount,bitOffset],{bitCount,bitOffset,input:0xabcdef01,bufferFill:165});
 for(const mode of [4,5] as const)for(const capacity of [0,1,2])for(const boundsAssert of [0,1])add(mode,'partial overflow '+[capacity,boundsAssert],{capacity,boundsAssert,bitCount:16,bitOffset:7,input:0xabcdef01});
 for(const mode of [4,5] as const)for(const bitCount of [0,33])add(mode,'invalid bit count assertion '+bitCount,{bitCount,boundsAssert:1});
 for(const mode of [4,5] as const)add(mode,'missing bit buffer',{missingBuffer:true});
 for(const write of [0,1])for(const input of [0,1,7,8,15,255,0xffffffff])add(7,'range validation '+[write,input],{write,input,minimum:3,maximum:8,bufferFill:input&255});
 add(7,'decoded range assertion',{write:0,minimum:3,maximum:8,bufferFill:255,valueAssert:1});
 for(const minimum of [0,5])add(7,'invalid range '+minimum,{minimum,maximum:minimum});
 for(const write of [0,1])for(const pivot of [bits(-1),bits(0),bits(.5),bits(1),bits(2),0x7fc00000])for(const input of [bits(-1),bits(.5),bits(2)])add(6,'pivot quantization '+[write,pivot,input],{write,pivot,input,bitCount:8});
 for(const bitCount of [0,1,4,31,32])add(6,'quantization bit count '+bitCount,{bitCount,input:bits(.5)});
 for(const bufferFill of [0,1,126,127,128,129,254,255])add(6,'decode quantized code '+bufferFill,{write:0,pivot:bits(.5),bitCount:8,bufferFill});
 for(const write of [0,1])for(const context of [1,2,3])for(const input of [0,1,2,3,4,10,11,12,13,99,255,0xffffffff])add(8,'player mapping '+[write,context,input],{write,context,input,bufferFill:input&255});
 for(const bufferFill of [90,255])add(0,'uncleared packet OR '+bufferFill,{context:3,bufferFill});
 for(const statePositionBits of [[0x7fc00000,bits(2),bits(3),bits(1)],[bits(1),0xffc00000,bits(3),bits(1)]])for(const valueAssert of [0,1])add(0,'raw vector NaN '+[statePositionBits,valueAssert],{context:3,statePositionBits,valueAssert});
 return cases;}
export function prepareCrabCodec(c:CrabCodecCase){
 const {b,m}=prepareCrabNetwork({...c,mode:2}),count=c.count??3;
 b.fill(c.bufferFill??0,0x18000,0x1a000);
 b.writeUInt32LE(c.write??1,0x3000);b[0x3008]=c.valid??1;b.writeBigUInt64LE(c.missingBuffer?0n:base+0x18000n,0x3010);b.writeUInt32LE(c.capacity??4096,0x3018);b.writeBigUInt64LE(base+0x18000n,0x3020);b.writeUInt32LE(c.bitOffset??0,0x3028);b[0x302c]=c.boundsAssert??0;b[0x3030]=c.valueAssert??0;b.writeUInt32LE(c.context??3,0x3038);b.writeBigUInt64LE(c.missingPlayerBarn?0n:base+0x31000n,0x3040);
 b.writeUInt32LE(4,0x38d10);for(let i=0;i<4;i++){b.writeUInt32LE(10+i,0x31010+i*0xfa0);b[0x31014+i*0xfa0]=i+1;}
 for(let i=0;i<16;i++)for(let j=0;j<12;j++)b.writeFloatLE(j/11,0x6000+i*0x800+0x184+j*4);
 b.writeUInt32LE(0x12345678,0x2d000);b[0x2d004]=0;b.writeUInt32LE(count,0x2d008);b[0x2d00c]=c.kind??1;b[0x2d00d]=c.targetKind??0;b.writeUInt32LE(11,0x2d010);b.writeUInt16LE(42,0x2d014);
 [0,-50,100,1].forEach((v,i)=>b.writeFloatLE(v,0x2d020+i*4));for(let i=0;i<12;i++)b.writeUInt32LE(c.motion?.[i%c.motion.length]??bits(i/11),0x2d030+i*4);[1,2,3,1].forEach((v,i)=>b.writeFloatLE(v,0x2d060+i*4));b[0x2d070]=c.ownerPresent??1;b.writeUInt32LE(12,0x2d074);
 c.statePositionBits?.forEach((v,i)=>b.writeUInt32LE(v,0x2d060+i*4));
 b.writeUInt32LE(c.bitCount??4,0x2e044);b.writeUInt32LE(c.bitOffset??0,0x2e048);b.writeUInt32LE(c.input??0x12345678,0x2e040);b.writeUInt32LE(c.minimum??(c.mode===7?0:bits(0)),0x2e050);b.writeUInt32LE(c.maximum??(c.mode===7?3:bits(1)),0x2e054);b.writeUInt32LE(c.pivot??bits(.5),0x2e058);b.writeUInt32LE(c.input??0x12345678,0x2e100);
 return {b,m};
}
export function evaluateCrabCodec(c:CrabCodecCase,probes:readonly number[][]){
 const {b,m}=prepareCrabCodec(c),rows:Buffer[]=[],map=new Map(probes.map(r=>[`${r[0]}:${r[1]}:${r[2]}`,r[3]]));let casts=0;
 const record=(kind:number,x:bigint|number=0,y:bigint|number=0,z:bigint|number=0)=>{const r=Buffer.alloc(192);[kind,x,y,z].forEach((n,i)=>r.writeBigUInt64LE(BigInt(n),i*8));rows.push(r);return r;};
 const arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',x:number,y:number)=>{const n=map.get(`${['add','sub','mul','div'].indexOf(op)}:${x>>>0}:${y>>>0}`);if(n===undefined)throw new Error('Crab codec native arithmetic probe missing');return n;}};
 const snapshot:CrabNetStateServices={arithmetic,invalidId:c.invalidId??0xffffffff,cast:(reference,type)=>{const d=new DataView(reference.buffer,reference.byteOffset,8),before=d.getBigUint64(0,true),selected=type==='Crab'&&(before===base+0x2b000n||before===base+0x2b400n)?before:type==='Avatar'&&before===base+0x2b800n?before:0n;record(1,type==='Crab'?1:2,before,selected);if(c.castMutation&&casts++===0)d.setBigUint64(0,selected?base+0x2b400n:base+0x2b800n,true);return selected;}};
 const reset=()=>{b.writeUInt32LE(0,0x3000);b[0x3008]=1;b.writeBigUInt64LE(base+0x18000n,0x3020);b.writeUInt32LE(c.bitOffset??0,0x3028);};
 let line=0,severity=0;
 try{
  if(c.mode===0)serializeOriginalCrabState(m,base+0x2d000n,base+0x3000n,arithmetic);
  if(c.mode===1){serializeOriginalCrabState(m,base+0x2d000n,base+0x3000n,arithmetic);reset();b.copy(b,0x2d200,0x2d100,0x2d178);b.writeUInt32LE(c.count??3,0x2d208);serializeOriginalCrabState(m,base+0x2d200n,base+0x3000n,arithmetic);b.copy(b,0x2d000,0x2d200,0x2d278);}
  if(c.mode===2||c.mode===3){
   // The count service is the only hook in the native driver; it seeds the
   // caller's 120-byte private packet after running the real range coder.
   const network=originalCrabBinaryNetworkServices(m,base+0x2d000n,base+0x2e100n,arithmetic);
   const wrap=originalCrabNetworkBarnServices(m,owner=>{record(4,owner);return base+0x3000n;},b.subarray(0x2d000,0x2d078),{...network,count:(stream,cell,minimum,maximum)=>{network.count(stream,cell,minimum,maximum);b.copy(b,0x2d000,0x2d100,0x2d178);}},snapshot);
   for(let step=0;step<(c.steps??1);step++)updateOriginalCrabBarn(m,base+0x1000n,base+0x4000n,base+0x3200n,wrap);
   if(c.mode===3){reset();for(let i=0;i<(c.count??3);i++)m.write32(base+0x6000n+BigInt(i)*0x800n+0x598n,24);updateOriginalCrabBarn(m,base+0x1000n,base+0x4000n,base+0x3200n,wrap);}
  }
  if(c.mode===4)writeOriginalBinaryBits(m,base+0x3008n,c.input??0x12345678,c.bitCount??4);
  if(c.mode===5)m.write32(base+0x2e100n,readOriginalBinaryBits(m,base+0x3008n,c.bitCount??4));
  if(c.mode===6)serializeOriginalBinaryFloat(m,base+0x3000n,base+0x2e100n,b.readUInt32LE(0x2e050),b.readUInt32LE(0x2e054),b.readUInt32LE(0x2e058),c.bitCount??4,arithmetic);
  if(c.mode===7)serializeOriginalBinaryUInt(m,base+0x3000n,base+0x2e100n,b.readUInt32LE(0x2e050),b.readUInt32LE(0x2e054));
  if(c.mode===8)serializeOriginalBinaryPlayerId(m,base+0x3000n,base+0x2e100n);
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(12);[line,severity,rows.length].forEach((n,i)=>header.writeUInt32LE(n,i*4));return Buffer.concat([header,b,...rows]);
}
