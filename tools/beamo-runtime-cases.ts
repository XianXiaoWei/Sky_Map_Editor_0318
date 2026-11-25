import {constructOriginalBeamo,createOriginalBeamo,initializeOriginalBeamoBarn,changedOriginalBeamo,setOriginalBeamoTransform,getOriginalBeamoTransform} from '../src/core/beamo-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import evidence from '../docs/beamo-native.json';
export interface BeamoRuntimeCase {label:string;op:number;normalCount:number;decalCount:number;raw:string;alias?:number;}
export function evaluateBeamoRuntime(c:BeamoRuntimeCase){
 const base=0x2c0000000n,b=Buffer.alloc(0x23000,0xa5),raw=Buffer.from(c.raw,'base64');b.writeUInt32LE(c.normalCount>>>0,0x20010);b.writeUInt32LE(c.decalCount>>>0,0x20014);b.writeBigUInt64LE(base+0x20040n,0x20020);
 const object=c.op===2&&c.normalCount<512?16+c.normalCount*192:c.op===3&&c.decalCount<256?0x18010+c.decalCount*128:0x21000;
 raw.copy(b,object,0,192);raw.copy(b,0x22000,192);if(c.op===5)b.writeBigUInt64LE(base,object+0xb0);if(c.op===6)b.writeBigUInt64LE(base,object+0x78);
 const at=(a:bigint)=>Number(a-base),m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 const calls:number[]=[],s={baseClassId:()=>{calls.push(1);return 16;},worldClassId:()=>{calls.push(2);return 17;},worldVptr:BigInt(evidence.worldVptr),ensureLevelModelMeta:()=>{calls.push(3);},classId:(kind:string)=>kind==='Beamo'?19:20};
 let line=0,severity=0,result=0n;const out=Buffer.alloc(64,0xa5),address=base+BigInt(object);
 try{switch(c.op){
  case 0:case 1:constructOriginalBeamo(m,address,c.op===0?'Beamo':'BeamoDecal',s);result=address;break;
  case 2:case 3:result=createOriginalBeamo(m,base,c.op===2?'Beamo':'BeamoDecal',s);break;
  case 4:initializeOriginalBeamoBarn(m,base);break;
  case 5:case 6:changedOriginalBeamo(m,address,c.op===5?'Beamo':'BeamoDecal');break;
  case 7:case 8:setOriginalBeamoTransform(m,address,c.alias===undefined?m.bytes(base+0x22000n,64):m.bytes(address+BigInt(c.alias),64));break;
  case 9:case 10:getOriginalBeamoTransform(m,address,out);break;
 }}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(48);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(calls.length,8);calls.forEach((v,i)=>header.writeUInt32LE(v,12+i*4));header.writeBigUInt64LE(result,24);header[32]=b[12];b.copy(header,36,0x20010,0x2001c);
 return Buffer.concat([header,b.subarray(0x20020,0x20028),b.subarray(object,object+192),out]);
}
