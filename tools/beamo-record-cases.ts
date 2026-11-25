import {prepareOriginalBeamoRecords} from '../src/core/beamo-runtime';import {findLevelMaterialGuid} from '../src/core/level-material-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export interface BeamoRecordCase {label:string;normal:number;objects:string[];materials:number[];levelDataFlag:number;fill:number;}
export function evaluateBeamoRecords(c:BeamoRecordCase){
 const base=0x2f0000000n,b=Buffer.alloc(0x100000,c.fill),at=(a:bigint)=>Number(a-base),u=(a:number,v:number)=>b.writeUInt32LE(v>>>0,a),p=(a:number,v:bigint)=>b.writeBigUInt64LE(v,a);
 const m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>u(at(a),v),write64:(a:bigint,v:bigint)=>p(at(a),v),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 u(0x20010,c.normal);u(0x20014,c.objects.length-c.normal);p(0x20020,base+0x20040n);u(0xc8f30,c.materials.length);b[0xe100d]=c.levelDataFlag;
 c.materials.forEach((v,i)=>u(0xc2034+i*0x6f0,v));c.objects.forEach((raw,i)=>{const normal=i<c.normal,a=normal?16+i*192:0x18010+(i-c.normal)*128;Buffer.from(raw,'base64').copy(b,a,0,normal?192:128);p(a,base+0xe2000n);});
 let calls=0,names=0,line=0,severity=0;
 try{prepareOriginalBeamoRecords(m,base,base+0xc0000n,base+0xe1000n,{baseClassId:()=>16+calls++,findMaterial:(a,guid)=>{const offset=findLevelMaterialGuid(m.bytes(a,0x8f40),guid);return offset===null?0n:a+BigInt(offset);},meshName:()=>{names++;return 'prepared-mesh-name';}});}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(32);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(calls,8);header.writeUInt32LE(names,12);b.copy(header,16,0x20010,0x2001c);b.copy(header,28,0x6c830,0x6c834);
 return Buffer.concat([header,b.subarray(0x20040,0x20040+c.objects.length*384)]);
}
