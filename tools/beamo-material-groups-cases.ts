import {groupOriginalBeamoMaterials} from '../src/core/beamo-material-groups-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const BEAMO_GROUP_BASE=0x370000000n;
export interface BeamoMaterialGroupCase {label:string;materials:number;normal:number;records:{primary:number;secondary:number|null}[];renderCount?:number;slots?:number[];}
export function prepareBeamoMaterialGroups(c:BeamoMaterialGroupCase){
 const b=Buffer.alloc(0x100000,0xa5),base=BEAMO_GROUP_BASE,at=(a:bigint)=>Number(a-base),m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 m.write32(base+0x20010n,c.normal);m.write32(base+0x20018n,c.records.length);m.write32(base+0x6c830n,c.renderCount??0);m.write64(base+0x20020n,base+0x20030n);m.write64(base+0xe0010n,base);m.write64(base+0xe0020n,base+0xd0000n);
 for(let i=0;i<16;i++)m.write32(base+0xc00e0n+BigInt(i)*0x100n,i);
 for(let i=0;i<c.materials*6;i++)m.write32(base+0xd0000n+BigInt(i*4),c.slots?.[i]??0xffffffff);
 c.records.forEach((r,i)=>{const rec=base+0x20030n+BigInt(i)*384n;m.write64(rec+0xd8n,base+0xc0000n+BigInt(r.primary)*0x100n);m.write64(rec+0xe0n,r.secondary===null?0n:base+0xc0000n+BigInt(r.secondary)*0x100n);});return{b,m,base};
}
export function evaluateBeamoMaterialGroups(c:BeamoMaterialGroupCase){const{b,m,base}=prepareBeamoMaterialGroups(c);let line=0,severity=0;try{groupOriginalBeamoMaterials(m,base,base+0xd0000n,c.materials);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}const h=Buffer.alloc(8);h.writeUInt32LE(line);h.writeUInt32LE(severity,4);return Buffer.concat([h,b]);}
