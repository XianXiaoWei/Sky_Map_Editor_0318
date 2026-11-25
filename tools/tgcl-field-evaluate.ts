import crypto from 'node:crypto';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { readNativeTgclFields, resolveNativeTgclPointers, type NativeTgclFieldServices } from '../src/core/tgcl-field-runtime';
import { growNativeStringAndReplace, NativeStringLengthError, readNativeTgclString, type NativeStringMemory, type NativeStringPoolServices } from '../src/core/native-string-runtime';
import { TGCL_CONTEXT, TGCL_MEMORY, tgclFieldMemory, type TgclFieldCase } from './tgcl-field-cases';
export function evaluateTgclFields(c:TgclFieldCase) {
  const bytes=tgclFieldMemory(c), events:number[][]=[];
  const at=(p:bigint)=>Number(p-TGCL_MEMORY), p=(at:number)=>TGCL_MEMORY+BigInt(at);
  const memory:NativeStringMemory={
    read8:p=>bytes[at(p)],write8:(p,v)=>{bytes[at(p)]=v;},read32:p=>bytes.readUInt32LE(at(p)),write32:(p,v)=>{bytes.writeUInt32LE(v>>>0,at(p));},
    read64:p=>bytes.readBigUInt64LE(at(p)),write64:(p,v)=>{bytes.writeBigUInt64LE(BigInt.asUintN(64,v),at(p));},
    string:p=>{const start=at(p),end=bytes.indexOf(0,start);if(end<0)throw new Error('Unterminated oracle C string');return bytes.subarray(start,end);},
    copy:(dest,src,count)=>{bytes.copy(bytes,at(dest),at(src),at(src)+count);},move:(dest,src,count)=>{bytes.copy(bytes,at(dest),at(src),at(src)+count);},
  };
  let activeField=0,arrayAt=0xc000,growthAt=0x2c000,line=0,severity=0,lengthError=false;
  const pool:NativeStringPoolServices={
    getPool:()=>{events.push([10,0,0,0]);return p(0x2be00);},
    allocate:(_pool,count)=>{
      const data=p(growthAt);events.push([11,Number(count),at(data),0]);growthAt+=Number(count);
      if(growthAt>0x30000)throw new Error('Oracle string pool capacity');return data;
    },
    release:(_pool,data)=>{events.push([12,at(data),memory.read32(data),0]);bytes.fill(0xdd,at(data),at(data)+64);},
  };
  const services:NativeTgclFieldServices={
    registry:p(0x22000),nullObjectType:p(0x20000),integerType:p(0x20300),
    asClass:type=>{events.push([1,at(type),0,0]);return type===p(0x20200)||c.classCastFails&&type===p(0x1f000)?0n:type;},
    castObject:(meta,object)=>{events.push([2,at(meta),at(object),0]);return object+BigInt(c.rootAdjustment);},
    methodReceiverType:()=>{events.push([3,0,0,0]);return p(0x20100);},
    castReceiver:(type,value,source)=>{events.push([4,at(type),at(value),at(source)]);return c.receiverFails?0n:value;},
    invokeArrayAllocator:(method,receiver,count,argType,resultType)=>{
      const index=Number(memory.read64(method+56n))-1;activeField=index;events.push([5,index,count,at(argType)]);events.push([13,at(resultType),0,0]);
      const prop=p(0x5000+index*16),field=p(0x18000+index*128),offset=Number(memory.read64(p(0x6000+index*32)));
      const indirect=memory.read64(field+56n)!==0xffffffffffffffffn;
      const data=indirect?(c.nullArray?0n:p(arrayAt)):receiver+BigInt(offset);
      if(indirect){memory.write64(receiver+BigInt(offset),data);arrayAt+=(count*8+15)&~15;}
      if(data)for(let j=0;j<count;j++){
        const nested=memory.read32(prop+12n),slot=data+BigInt(j*8);
        if(nested===0xffffffff)memory.write64(slot,0n);
        else{
          const object=p(arrayAt);arrayAt+=256;memory.write64(slot,c.zeroElement&&j===0?0n:object);memory.write32(object,nested+1);
          for(const item of c.classes[nested].properties)if(item.hasVar&&(item.type===1||item.type===3))bytes.fill(0,at(object)+c.rootAdjustment+item.offset,at(object)+c.rootAdjustment+item.offset+24);
        }
      }
      if(arrayAt>0x10000)throw new Error('Oracle array pool capacity');
      if(c.stopAfterAllocator)memory.write32(p(0x4008),0);
    },
    fieldReceiverType:()=>{events.push([6,0,0,0]);return p(0x20100);},
    fieldAddress:(_type,root,rootClass,member)=>{
      activeField=Number(member);events.push([7,activeField,at(root),at(rootClass)]);
      return root+memory.read64(p(0x6000+activeField*32));
    },
    elementType:()=>{events.push([8,0,0,0]);const ci=memory.read32(p(0x500c+activeField*16));return ci===0xffffffff?p(0x20200):p(0x1f000+ci*256);},
    elementObject:(type,slot)=>{events.push([9,at(type),at(slot),0]);return memory.read64(slot);},
    growAndReplace:(destination,capacity,delta,oldLength,position,eraseLength,insertLength,source)=>{
      growNativeStringAndReplace(memory,destination,capacity,delta,oldLength,position,eraseLength,insertLength,source,pool);
    },
  };
  try {
    if(c.kind===0)readNativeTgclString(memory,TGCL_CONTEXT,c.nullObject?0n:p(0xa040+c.rootAdjustment),services);
    else if(c.kind===2&&c.growth){
      const args=Array.from({length:8},(_,i)=>memory.read64(p(0x2bf00+i*8)));
      growNativeStringAndReplace(memory,args[0],args[1],args[2],args[3],args[4],args[5],args[6],args[7],pool);
    }
    else{
      for(let i=0;i<c.nodes;i++)readNativeTgclFields(memory,TGCL_CONTEXT,c.nullObject?0n:p(0xa000+i*2048),p(0x4000),services);
      if(c.resolve)resolveNativeTgclPointers(memory,TGCL_CONTEXT,p(0x9c00));
    }
  }catch(error){
    if(error instanceof NativeStringLengthError){lengthError=true;events.push([14,0,0,0]);}
    else if(error instanceof NativeObjectFoundationFailure){line=error.line;severity=error.severity;}
    else throw error;
  }
  return{line,severity,lengthError,events,cursor:memory.read32(TGCL_CONTEXT+0x147cn),pointerCount:memory.read32(TGCL_CONTEXT+0x148cn),memorySha256:crypto.createHash('sha256').update(bytes).digest('hex')};
}
