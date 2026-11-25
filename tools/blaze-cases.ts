import * as blaze from '../src/core/blaze-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export interface BlazeCase{mode:number;seed:number;repeat?:number;active?:number;previous?:number;random?:boolean;children?:number;self?:boolean;castFailure?:boolean;root?:number;flame?:number;alt?:number;latch?:number;once?:number;on?:number;full?:boolean;value?:number;offset?:number;sound?:number;}
const base=0x440000000n,size=0x30000;
export function blazeCases():BlazeCase[]{const c:BlazeCase[]=[];for(let seed=0;seed<4;seed++){
 for(const mode of [0,2,4,6,8,9,10])c.push({mode,seed});
 for(const repeat of [1,4,256,257])c.push({mode:1,seed,repeat});
 for(const value of [0,1,2,255,256])c.push({mode:3,seed,value});
 for(const value of [0xabc00000,0xabc00017,0xabc000ff,0xffffffff])c.push({mode:5,seed,value});
 for(const offset of [0x14010,0x14020,0x14100,0x14000])c.push({mode:13,seed,offset},{mode:14,seed,offset});
 for(const sound of [0,1,2,3])c.push({mode:7,seed,sound});
 }
 for(const root of [0,1])for(const flame of [0,1])for(const alt of [0,1,2,3])for(const on of [0,1])for(const latch of [0,1])for(const once of [0,1])c.push({mode:11,seed:3,root,flame,alt,on,latch,once,repeat:3});
 for(const active of [0,1,2])for(const previous of [0,1])for(const children of [0,1,2,5,11])for(const self of [false,true])c.push({mode:12,seed:children,active,previous,children,self,random:true});
 for(const active of [0,1])for(const full of [false,true])for(const random of [false,true])c.push({mode:12,seed:7,active,previous:0,random,children:5,self:true,full});
 c.push({mode:12,seed:1,active:1,previous:0,random:true,children:5,self:true,castFailure:true});return c;}
export function prepareBlaze(c:BlazeCase){const b=Buffer.alloc(size),d=new DataView(b.buffer,b.byteOffset,b.byteLength);let rng=c.seed+1;for(let i=0;i<size;i++){rng=(Math.imul(rng,1664525)+1013904223)>>>0;b[i]=rng>>>24;}
 const m={string:(p:bigint)=>{const at=Number(p-base),end=b.indexOf(0,at);if(at<0||at>=b.length||end<0)throw new Error('Oracle string outside prepared memory');return b.toString('utf8',at,end);},bytes:(p:bigint,n:number)=>{const at=Number(p-base);if(at<0||at+n>size)throw new Error(`oracle address ${p.toString(16)} + ${n}`);return b.subarray(at,at+n);},read32:(p:bigint)=>d.getUint32(Number(p-base),true),write32:(p:bigint,n:number)=>d.setUint32(Number(p-base),n,true),read64:(p:bigint)=>d.getBigUint64(Number(p-base),true),write64:(p:bigint,n:bigint)=>d.setBigUint64(Number(p-base),n,true),write8:(p:bigint,n:number)=>{b[Number(p-base)]=n;}};
 m.write64(base+0x12010n,base+0x10n);for(let i=0;i<256;i++){const p=base+BigInt(0x10+i*0x120);m.write64(p,i===255?0n:p+0x120n);m.write32(p+0x68n,0xabc00000+i);m.write8(p+0xa1n,Number(i%17===0));m.write64(p+0x100n,i%3?0n:base+0x18300n);m.write64(p+0x108n,3n);}
 m.write64(base+0x17f00n,3n);m.write32(base+0x17f04n,0x12345678);m.write32(base+0x17f08n,c.seed*2345691+0x7fffffff);m.write64(base+0x17f10n,c.castFailure?base+0x16000n:0n);m.write32(base+0x17f18n,c.mode===13||c.mode===14?c.offset!:c.value??c.active??0);m.write64(base+0x17f20n,c.sound===0?0n:base+0x10n);m.write32(base+0x17f28n,Number(c.full));m.write32(base+0x18038n,0x314159);
 const p=base+0x14000n,e=base+0x15000n;m.write64(p+0x110n,base+0x17000n);m.write8(p+0x56n,c.previous??0);m.write8(p+0x98n,c.root??0);m.write8(p+0xa4n,(c.alt??0)&1);m.write8(p+0xa5n,(c.alt??0)>>1);m.write8(p+0xa0n,1);m.write8(base+0x170b6n,c.flame??0);m.write64(e+0x38n,p);m.write64(e+0x40n,base+0x19600n);m.write8(e+0x49n,c.on??0);m.write8(e+0x4an,c.latch??0);m.write8(e+0x48n,c.once??0);
 m.write64(p+0x88n,base+0x19600n);m.write64(p+0x70n,base+0x15800n);m.write8(p+0x7cn,Number(c.random));m.write64(base+0x15808n,base+0x15a00n);m.write32(base+0x15810n,c.children??0);m.write64(base+0x19038n,base+0x19700n);
 for(let i=0;i<(c.children??0);i++){const child=i===0&&c.self?p:base+BigInt(0x16000+i*0x120);m.write64(base+0x15a00n+BigInt(i)*8n,child);m.write32(child+0x68n,0x937491+i*9137);}
 if(c.sound===2)m.write64(base+0x118n,2n);if(c.sound===3)m.write64(base+0x118n,0n);
 return {b,m};}
export function evaluateBlaze(c:BlazeCase){const {b,m}=prepareBlaze(c),traces:Buffer[]=[];let alloc=base+0x20000n,line=0,severity=0,result=0n;
 const record=(kind:number,x=0n,y=0n,z=0n,data?:Uint8Array)=>{const out=Buffer.alloc(160);out.writeUInt32LE(kind);out.writeBigUInt64LE(x,8);out.writeBigUInt64LE(y,16);out.writeBigUInt64LE(z,24);if(data)out.set(data,32);traces.push(out);};
 const s={soundIdentity:(p:bigint)=>{record(2,p);return m.read64(base+0x17f00n);},stopSound:(p:bigint,n:number)=>record(3,p,BigInt(n)),setObjectEnabled:(p:bigint,n:number)=>record(4,p,BigInt(n)),start:(p:bigint)=>record(5,p),playSound:(p:bigint,name:string,b:Uint8Array)=>record(name==='blazearrive'?7:8,p,0n,0n,b),ticks:()=>{record(9);return m.read32(base+0x17f08n);},allocate:(n:number)=>{const p=alloc;alloc+=BigInt(Math.ceil(n/16)*16);record(10,BigInt(n),p);return p;},release:(p:bigint)=>record(11,p),castBlaze:(p:bigint)=>{record(12,p);return p===m.read64(base+0x17f10n)?0n:p;},rpcClassId:()=>m.read32(base+0x18038n),sendRpc:(p:bigint,b:Uint8Array)=>record(13,p,0n,0n,b)};
 try{const p=base+0x14000n,e=base+0x15000n;switch(c.mode){
 case 0:blaze.initializeOriginalBlazeBarn(m,base,()=>record(1));break;
 case 1:for(let i=0;i<(c.repeat??1);i++)result=blaze.createOriginalBlaze(m,base,()=>m.read32(base+0x18038n),()=>m.read32(base+0x17f04n));break;
 case 2:blaze.resetOriginalBlaze(m,p,m.read32(base+0x17f04n));break;
 case 3:blaze.setOriginalBlazeEnabled(m,p,c.value??0);break;
 case 4:result=BigInt(blaze.getOriginalBlazeEnabled(m,p));break;
 case 5:result=blaze.findOriginalBlaze(m,base,c.value??0);break;
 case 6:result=BigInt(blaze.countOriginalBlazes(m,base));break;
 case 7:blaze.releaseOriginalBlaze(m,base,m.read64(base+0x17f20n),s);break;
 case 8:blaze.unloadOriginalBlazeBarn(m,base,s);break;
 case 9:blaze.loadOriginalBlazeBarn(m,base,base+0x19000n,(p,g)=>record(6,p,g));break;
 case 10:blaze.enableOriginalOnBlaze(m,e);break;
 case 11:for(let i=0;i<(c.repeat??1);i++)blaze.updateOriginalOnBlaze(m,e,s);break;
 case 12:blaze.setOriginalBlazeActive(m,p,base+0x17f04n,base+0x19000n,base+0x19500n,Number(c.full),c.active??0,s);break;
 case 13:blaze.setOriginalBlazeTransform(m,p,m.bytes(base+BigInt(c.offset!),64));break;
 case 14:blaze.getOriginalBlazeTransform(m,p,m.bytes(base+BigInt(c.offset!),64));break;
 }}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 b.fill(0,0x18000,0x18400);const head=Buffer.alloc(16);head.writeUInt32LE(line);head.writeUInt32LE(severity,4);head.writeBigUInt64LE(result,8);const count=Buffer.alloc(4);count.writeUInt32LE(traces.length);return Buffer.concat([head,b,count,...traces]);}
