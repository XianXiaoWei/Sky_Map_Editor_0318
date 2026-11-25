import {createOriginalModelBarnSlot,NativeModelConstructorDependencyBoundary,type ModelBarnMemory} from '../src/core/model-barn-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {MODEL_BARN_BASE as O,prepareModelBarn,type ModelBarnCase} from './model-barn-cases';
export function evaluateModelBarn(c:ModelBarnCase){
 const b=prepareModelBarn(c),bytes=(p:bigint,n:number)=>{const at=Number(p-O);if(at<0||at+n>b.length)throw new Error('Unprepared ModelBarn memory');return b.subarray(at,at+n);};
 const m:ModelBarnMemory={bytes,read32:p=>bytes(p,4).readUInt32LE(),write32:(p,n)=>bytes(p,4).writeUInt32LE(n>>>0),read64:p=>bytes(p,8).readBigUInt64LE(),string:p=>{const at=Number(p-O);return b.subarray(at,b.indexOf(0,at));}};
 const code=(p:bigint)=>p?Number(p-O):0xffffffff;let line=0,severity=0,boundary=0,result=0xffffffff,called=0,capture=[0,0,0,0,0,0],parameters=Buffer.alloc(184);
 try{result=code(createOriginalModelBarnSlot(m,O,{baked:c.baked,levelName:O+0x102000n,meshName:O+0x102100n,guid:c.guid,shader:O+0x105000n,transform:O+0x106000n,options:c.options?O+0x104000n:0n},{allocateParameterStorage:()=>new Uint8Array(152).fill(c.stackFill),construct:a=>{called++;capture=[code(a.model),code(a.options),code(a.heap),code(a.resources),code(a.renderer),m.read32(O+0xf8010n)];parameters=Buffer.from(a.parameters);if(c.constructorBoundary)throw new NativeModelConstructorDependencyBoundary();}}));}
 catch(e){if(e instanceof NativeObjectFoundationFailure){line=e.line;severity=e.severity;}else if(e instanceof NativeModelConstructorDependencyBoundary)boundary=1;else throw e;}
 return {line,severity,boundary,result,called,capture,parameters:parameters.toString('hex'),memory:b};
}
