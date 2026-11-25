import {initializeOriginalBuddyParams,loadOriginalBuddy} from '../src/core/buddy-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatValue as value,numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface BuddyCase {seed:number;count:number;players:number;discoverables:number|null;prefix:string;longPrefix?:boolean;longMesh?:boolean;initialized?:boolean;missingActions?:boolean;swapMesh?:boolean;modelFailure?:boolean;repeat?:number;matrix?:number[];}
const base=0x440000000n;
export function buddyCases():BuddyCase[]{
 const c:BuddyCase={seed:7,count:0,players:2,discoverables:3,prefix:'Fox'};
 const cases:BuddyCase[]=[];
 for(const seed of [0,7,37])for(const count of [0,1,7])for(const discoverables of [null,0,1,31,32])cases.push({...c,seed,count,discoverables});
 for(const option of [{count:8},{discoverables:33},{modelFailure:true},{initialized:true},{missingActions:true},{swapMesh:true},{repeat:2},{repeat:8}])cases.push({...c,...option});
 for(const longPrefix of [false,true])for(const longMesh of [false,true])for(const prefix of ['', 'FriendlyCompanion','Fox'])cases.push({...c,longPrefix,longMesh,prefix});
 for(const matrix of [[0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,1],[2,0,0,0,0,.5,0,0,0,0,-3,0,10,20,30,1],[1e-7,0,0,0,0,1e-7,0,0,0,0,1e-7,0,1,2,3,1],[0,0,-2,0,0,3,0,0,4,0,0,0,-3,2,4,1]])cases.push({...c,matrix});
 return cases;
}
export function prepareBuddy(c:BuddyCase){
 const b=Buffer.alloc(0x10000),view=new DataView(b.buffer,b.byteOffset,b.length);let rng=c.seed;
 for(let i=0;i<b.length;i++){rng=(Math.imul(rng,1664525)+1013904223)>>>0;b[i]=rng>>>24;}
 const offset=(p:bigint,n:number)=>{const at=Number(p-base);if(at<0||at+n>b.length)throw new Error(`Buddy oracle address ${p.toString(16)} + ${n}`);return at;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(offset(p,n),offset(p,n)+n),read32:(p:bigint)=>view.getUint32(offset(p,4),true),read64:(p:bigint)=>view.getBigUint64(offset(p,8),true),write32:(p:bigint,n:number)=>view.setUint32(offset(p,4),n,true),write64:(p:bigint,n:bigint)=>view.setBigUint64(offset(p,8),n,true),write8:(p:bigint,n:number)=>{b[offset(p,1)]=n;},string:(p:bigint)=>{const at=offset(p,1),end=b.indexOf(0,at);if(end<0)throw new Error('Buddy oracle string not terminated');return b.toString('utf8',at,end);}};
 const writeString=(at:number,text:string,long=false)=>{b.fill(0,at,at+24);const data=Buffer.from(text);if(long){b[at]=1;view.setBigUint64(at+8,BigInt(data.length),true);view.setBigUint64(at+16,base+BigInt(at+0x100),true);b.set(Buffer.from(text+'\0'),at+0x100);}else{if(data.length>22)throw new Error('Buddy short string exceeds ABI');b[at]=data.length*2;b.set(data,at+1);}};
 const fp=(at:number,ns:number[])=>ns.forEach((n,i)=>view.setFloat32(at+i*4,n,true));fp(0x1090,c.matrix??[2,0,0,0,0,.5,0,0,0,0,-3,0,10,20,30,1]);
 m.write64(base+0x1080n,base+0x4000n);m.write64(base+0x4008n,base+0x4300n);m.write64(base+0x4428n,base+0x6100n);m.write64(base+0x4528n,base+0x6100n);
 writeString(0x4010,c.prefix,!!c.longPrefix);writeString(0x4358,'CharCompanionAnim',!!c.longMesh);writeString(0x4458,'CharCompanionOther',!!c.longMesh);
 m.write8(base+0x403cn,Number(!!c.initialized));fp(0x4030,[.75,2,4]);m.write64(base+0x4028n,c.discoverables===null?0n:base+0x4800n);m.write32(base+0x4810n,c.discoverables??0);
 fp(0x6800,[2,0,0,0,0,3,0,0,0,0,4,0,0,0,0,1]);b.fill(0,0x5000,0x5060);m.write32(base+0x5050n,c.count);
 for(const [field,target] of [[0x388,0x5000],[0x178,0x5200],[0x300,0x5400],[0x5a8,0x5600]])m.write64(base+BigInt(0x3000+field),base+BigInt(target));
 m.write64(base+0x5220n,base+0x5800n);m.write64(base+0x5238n,base+0x5900n);
 for(const [at,n] of [[0xfe02,Number(!!c.missingActions)],[0xfe03,Number(!!c.swapMesh)],[0xfe04,c.players],[0xfe05,Number(!!c.modelFailure)],[0xfe06,0],[0xfe07,c.repeat??1]])b[at]=n;
 return {b,m};
}
export function evaluateBuddy(c:BuddyCase,nativeMath?:readonly {kind:number;input:number[];result:number}[]){
 const {b,m}=prepareBuddy(c),calls:Buffer[]=[];let rng=c.seed,line=0,severity=0,lookup=0,obbCalls=0,mathAt=0;
 const record=(kind:number,x=0n,y=0n,z=0n,data?:Uint8Array)=>{const t=Buffer.alloc(160);t.writeBigUInt64LE(BigInt(kind));t.writeBigUInt64LE(x,8);t.writeBigUInt64LE(y,16);t.writeBigUInt64LE(z,24);if(data)t.set(data,32);calls.push(t);};
 const math=(kind:number,input:number[],fallback:()=>number)=>{if(!nativeMath)return fallback();const row=nativeMath[mathAt++];if(!row||row.kind!==kind||row.input.length!==input.length||row.input.some((n,i)=>n!==input[i]))throw new Error('Buddy explicit native math service input/order differs');return row.result;};
 const s={findSequence:(name:string,flags:0,file:string)=>{const i=lookup++,data=Buffer.alloc(128);data.write(name,0,64);data.write(file,64,64);record(1,BigInt(i),BigInt(flags),0n,data);if(c.swapMesh&&i===0)m.write64(base+0x4008n,base+0x4400n);return c.missingActions?-1:i+10;},activePlayers:(owner:bigint)=>{record(2,owner,BigInt(c.players));return Uint32Array.from({length:c.players},(_,i)=>100+i*7);},createMarker:(owner:bigint,mode:0)=>{record(4,owner,BigInt(mode));return base+0x6200n;},markerIdBits:0xabcdef01,rand:()=>{rng=(Math.imul(rng,1664525)+1013904223)>>>0;const n=rng>>>1;record(3,BigInt(n));return n;},atan2:(y:number,x:number)=>{const n=math(5,[y,x],()=>bits(Math.atan2(value(y),value(x))));record(5,BigInt(y),BigInt(x),BigInt(n));return n;},asin:(x:number)=>{const n=math(6,[x],()=>bits(Math.asin(value(x))));record(6,BigInt(x),BigInt(n));return n;},cloneModel:(owner:bigint,source:bigint)=>{record(7,owner,source);return c.modelFailure?0n:base+0x6000n;},localObb:(mesh:bigint)=>{const data=m.bytes(base+0x6800n,64).slice();record(8,mesh,BigInt(obbCalls++),0n,data);return data;}};
 try{for(let i=0;i<(c.repeat??1);i++)loadOriginalBuddy(m,base+0x1000n,base+0x3000n,s);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 if(nativeMath&&mathAt!==nativeMath.length)throw new Error('Buddy native math trace not fully consumed');
 b.fill(0,0x4300,0x4308);b.fill(0,0x4400,0x4408);b.fill(0,0x7100,0x7140);const h=Buffer.alloc(8);h.writeUInt32LE(line);h.writeUInt32LE(severity,4);const n=Buffer.alloc(4);n.writeUInt32LE(calls.length);return Buffer.concat([h,b,n,...calls]);
}
