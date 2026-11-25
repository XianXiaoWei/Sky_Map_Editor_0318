import crypto from 'node:crypto';
import { allocateNativeFloat, constructNativeFloat, createNativeFactoryObject, findNativeMetaClassById, findNativeMetaClassByName, getNativeFactoryObjectInitPriority, NativeObjectFoundationFailure, releaseNativeFactoryObject, releaseNativeFloat, restoreNativeObjectVtable, type NativeObjectMemory, type ObjectFactoryLifecycleServices } from '../src/core/object-foundation-runtime';
import { createNativeBarnValue, initializeNativeValueBarn, releaseNativeBarnValue, unloadNativeValueBarn, type NativeValueBarnServices } from '../src/core/value-barn-runtime';
import { executeFloatMult } from '../src/core/object-numeric-runtime';
import { constructOriginalEvent, constructOriginalFloatMult, constructOriginalFloatAdd, constructOriginalSetFloat } from '../src/core/event-foundation-runtime';
import { createNativeBarnEvent, createNativeTriggerEvent, clearNativeEventTypeMap, initializeNativeEventBarn, releaseNativeBarnEventNode, type NativeTriggerEventServices } from '../src/core/native-event-barn-runtime';
import { readNativeTgclFields, resolveNativeTgclPointers, type NativeTgclFieldServices } from '../src/core/tgcl-field-runtime';
import { type NativeStringMemory } from '../src/core/native-string-runtime';
import { dispatchOriginalNumericEventVirtual } from '../src/core/numeric-event-runtime';
import { setFloatFrame } from '../src/core/set-float-runtime';
import { bindNativeEventBarnView } from '../src/core/native-event-barn-view';
import { loadOriginalEventBarn, updateOriginalEventBarn, type OriginalEventBarnServices } from '../src/core/event-barn-runtime';
import { setOriginalEventEnabled, startOriginalEvent } from '../src/core/event-start-runtime';
import { createAndReadPreparedNativeObject } from '../src/core/object-field-load-runtime';
import { FOUNDATION_BARN, FOUNDATION_EVENT_BARN, FOUNDATION_OBJECTS, FOUNDATION_REGISTRY, foundationRegistry, foundationEventBarn, type FoundationCase } from './object-foundation-cases';
export interface FoundationResult { math?:number[][]; line: number; severity: number; result: string; services: number[][]; objectHex: string; registrySha256: string; eventBarnHex?:string; loadHeapBaseline?:number; frames?:{objectHex:string;barnSequence:number}[]; }
export function evaluateFoundation(c: FoundationCase, mathFixture:number[][]=[]): FoundationResult {
  const registry = foundationRegistry(c), objects = Buffer.from(c.objectHex, 'hex'),eventBarn=c.tgcl?(c.tgcl.trigger?Buffer.concat([foundationEventBarn(c),Buffer.alloc(0x105100-0x5100)]):foundationEventBarn(c)):null;
  const eventClass=c.tgcl?.eventClass??'FloatMult',eventSize=eventClass==='FloatAdd'?96:eventClass==='SetFloat'?88:80;
  const services: number[][] = [], out: FoundationResult = { line: 0, severity: 0, result: '0', services, objectHex: '', registrySha256: '' };
  const locate = (address: bigint): [Buffer, number] => address>=FOUNDATION_EVENT_BARN&&eventBarn?[eventBarn,Number(address-FOUNDATION_EVENT_BARN)]:address >= FOUNDATION_OBJECTS ? [objects, Number(address - FOUNDATION_OBJECTS)] : [registry, Number(address - FOUNDATION_REGISTRY)];
  const memory: NativeStringMemory = {
    read8:address=>{const [b,at]=locate(address);return b[at];},
    write8:(address,value)=>{const [b,at]=locate(address);b[at]=value;},
    read32: address => { const [b, at] = locate(address); return b.readUInt32LE(at); },
    write32:(address,value)=>{const [b,at]=locate(address);b.writeUInt32LE(value>>>0,at);},
    read64: address => { const [b, at] = locate(address); return b.readBigUInt64LE(at); },
    write64: (address, value) => { const [b, at] = locate(address); b.writeBigUInt64LE(value, at); },
    string: address => { const [b, at] = locate(address); return b.subarray(at, b.indexOf(0, at)); },
    copy:(destination,source,count)=>{const [src,from]=locate(source),[dest,to]=locate(destination);src.copy(dest,to,from,from+count);},
    move:(destination,source,count)=>{const [src,from]=locate(source),[dest,to]=locate(destination);src.copy(dest,to,from,from+count);},
  };
  const log = (operation: number, meta: bigint, argument = 0) => { services.push([operation, meta ? Number(meta - FOUNDATION_REGISTRY) : 0, argument]); };
  const factoryServices: ObjectFactoryLifecycleServices = {
    registry: FOUNDATION_REGISTRY, objectType: FOUNDATION_REGISTRY + 0x5000n,
    nullObjectType: FOUNDATION_REGISTRY + 0x5000n, moduleType: FOUNDATION_REGISTRY + 0x5600n,
    asClass: meta => { log(1, meta); return registry[Number(meta - FOUNDATION_REGISTRY) + 0x62] ? 0n : meta; },
    callParentGetter: () => { log(11, FOUNDATION_REGISTRY + 0x5200n); return memory.read64(FOUNDATION_REGISTRY + 0x5280n); },
    receiverType: () => { log(10, 0n); return FOUNDATION_REGISTRY + 0x5500n; },
    cast: (meta, value, source) => { log(9, meta, Number(source - FOUNDATION_REGISTRY));
      if(c.tgcl&&meta===FOUNDATION_REGISTRY+0x5000n&&value===FOUNDATION_OBJECTS+0x80n)return value+8n;
      return meta === FOUNDATION_REGISTRY + 0x5600n ? c.factory?.moduleCastFails ? 0n : value :
        value === FOUNDATION_REGISTRY + 0x7300n && c.factory?.receiverCastFails || value === FOUNDATION_OBJECTS && c.factory?.resultCastFails ? 0n : value;
    },
    invoke: (method, receiver, argument) => {
      if(c.tgcl&&method===FOUNDATION_REGISTRY+0x8200n){
        if(receiver!==FOUNDATION_EVENT_BARN||argument!==FOUNDATION_REGISTRY+0x5300n)throw new Error('Numeric EventBarn boundary mismatch');
        log(12,0n,(3<<16)|1);log(13,argument);
        return (c.tgcl.trigger?createNativeTriggerEvent:createNativeBarnEvent)(memory,receiver,argument,eventServices);
      }
      if (receiver !== (c.factory?.valueBarn ? FOUNDATION_BARN : FOUNDATION_REGISTRY + 0x7300n)) throw new Error('Factory receiver mismatch');
      log(12, 0n, (1 << 16) | Number(argument !== null)); if (argument !== null) log(13, argument);
      if (c.factory?.valueBarn) {
        if (argument === null) throw new Error('ValueBarn CreateValue requires the requested class');
        return createNativeBarnValue(memory, receiver, argument, valueServices);
      }
      return c.factory?.returnNull ? 0n : FOUNDATION_OBJECTS;
    },
    invokeRelease: (_method, receiver, object) => {
      if(c.tgcl&&receiver===FOUNDATION_EVENT_BARN){
        log(12,0n,(2<<16)|1);log(14,0n,object?1:0);
        releaseNativeBarnEventNode(memory,receiver,receiver+0x30n,0n,{virtual:()=>{},release:valueServices.release});return;
      }
      if (receiver !== (c.factory?.valueBarn ? FOUNDATION_BARN : FOUNDATION_REGISTRY + 0x7300n)) throw new Error('Factory release receiver mismatch');
      log(12, 0n, (2 << 16) | 1); log(14, 0n, object ? 1 : 0);
      if (c.factory?.valueBarn) releaseNativeBarnValue(memory, receiver, object, valueServices);
    },
  };
  let allocationCursor = 0;
  const valueServices: NativeValueBarnServices = {
    valuePointerType: FOUNDATION_REGISTRY + 0x5700n, allocationLabel: FOUNDATION_REGISTRY + 0x5800n,
    size: meta => { log(15, meta); return c.tgcl&&meta===FOUNDATION_REGISTRY+0x5300n?BigInt(eventSize):24n; }, alignment: meta => { log(16, meta); return 8n; },
    allocate: (heap, size, label, alignment) => { log(17, heap, Number(size)); log(18, label, Number(alignment)); return heap===FOUNDATION_REGISTRY+0x5b00n?0x280000000n:heap===FOUNDATION_EVENT_BARN+0x5040n?FOUNDATION_OBJECTS+0x80n:FOUNDATION_OBJECTS + BigInt(allocationCursor++ * 32); },
    constructInPlace: (meta, storage) => { log(19, meta, Number(storage - FOUNDATION_OBJECTS));
      if(c.tgcl&&meta===FOUNDATION_REGISTRY+0x5300n){const buffer=objects.subarray(Number(storage-FOUNDATION_OBJECTS)),metadata={eventClassId:9,eventVptr:0x100c14ea0n};if(eventClass==='FloatAdd')constructOriginalFloatAdd(buffer,8,metadata);else if(eventClass==='SetFloat')constructOriginalSetFloat(buffer,8,metadata);else constructOriginalFloatMult(buffer,8,0x100d0cbf8n,metadata);}
      else constructNativeFloat(objects.subarray(Number(storage - FOUNDATION_OBJECTS)), c.classId); return storage;
    },
    castValue: (meta, value, source) => { log(9, meta, Number(source - FOUNDATION_REGISTRY)); return c.value?.castFails ? 0n : value; },
    release: (heap, value) => log(20, heap, Number(value - FOUNDATION_OBJECTS)),
    clearHeap: heap => log(21, heap),
  };
  let poolCursor=0xf800;
  const eventServices:NativeTriggerEventServices={
    eventClass:FOUNDATION_REGISTRY+0x5400n,allocationLabel:FOUNDATION_REGISTRY+0x5800n,
    size:valueServices.size,alignment:valueServices.alignment,allocate:valueServices.allocate,constructInPlace:valueServices.constructInPlace,
    castEvent:(meta,value,source)=>{log(9,meta,Number(source-FOUNDATION_REGISTRY));return c.tgcl?.eventFailure==='cast'?0n:value;},
    pool:{getPool:()=>{log(23,0n);return FOUNDATION_REGISTRY+0x5a00n;},allocate:(pool,size)=>{if(size!==40n||poolCursor+40>0x10000)throw new Error('Type-map pool capacity');const node=FOUNDATION_REGISTRY+BigInt(poolCursor);poolCursor+=40;log(24,pool,Number(node-FOUNDATION_REGISTRY));return node;},release:(pool,node)=>{log(25,pool,Number(node-FOUNDATION_REGISTRY));}},
    maxTypeIndex:()=>{const maximum=registry.readUInt32LE(0xed08);log(26,0n,maximum);if(c.tgcl?.trigger?.mutateTypeCounter!==undefined){let node=memory.read64(FOUNDATION_EVENT_BARN+0x20n);while(node){const key=memory.read32(node+28n);if(key===8){memory.write8(node+32n,c.tgcl.trigger.mutateTypeCounter);break;}node=memory.read64(node+(key>8?0n:8n));}}return maximum;},
  };
  try {
    switch (c.kind) {
      case 0: out.result = findNativeMetaClassById(memory, FOUNDATION_REGISTRY, c.id).toString(); break;
      case 1: out.result = findNativeMetaClassByName(memory, FOUNDATION_REGISTRY, Buffer.from(c.query)).toString(); break;
      case 2: restoreNativeObjectVtable(memory, c.nullObject ? 0n : FOUNDATION_OBJECTS, {
        registry: FOUNDATION_REGISTRY, nullObjectType: FOUNDATION_REGISTRY + 0x5000n,
        asClass: meta => { log(1, meta); return registry[Number(meta - FOUNDATION_REGISTRY) + 0x62] ? 0n : meta; },
        isAbstract: meta => { log(2, meta); return !!registry[Number(meta - FOUNDATION_REGISTRY) + 0x60]; },
        isPolymorphic: meta => { log(3, meta); return !!registry[Number(meta - FOUNDATION_REGISTRY) + 0x61]; },
        construct: meta => { log(4, meta); memory.write64(FOUNDATION_OBJECTS + 0x100n, memory.read64(meta + 0x68n)); return FOUNDATION_OBJECTS + 0x100n; },
        destroy: (meta, instance) => log(5, meta, Number(instance - FOUNDATION_OBJECTS)),
        castObject: (meta, object) => { log(6, meta, object ? 1 : 0); return FOUNDATION_OBJECTS + BigInt(memory.read32(meta + 0x70n)); },
      }); break;
      case 3: constructNativeFloat(objects, c.classId); out.result = FOUNDATION_OBJECTS.toString(); break;
      case 4: allocateNativeFloat(c.classId, n => { log(7, 0n, n); return objects; }); out.result = FOUNDATION_OBJECTS.toString(); break;
      case 5: releaseNativeFloat(c.nullObject ? 0n : FOUNDATION_OBJECTS, object => log(8, 0n, Number(object - FOUNDATION_OBJECTS))); break;
      case 6: {
        const cells = Array.from({ length: 3 }, (_, i) => ({ storage: objects.subarray(i * 32, i * 32 + 24) }));
        for (const cell of cells) constructNativeFloat(cell.storage, c.classId);
        const indices = Array.from({ length: 3 }, (_, i) => (c.id >>> (i * 2)) & 3);
        indices.forEach((cell, i) => objects.writeBigUInt64LE(FOUNDATION_OBJECTS + BigInt(cell * 32), 0x60 + 0x38 + i * 8));
        executeFloatMult(cells[indices[0]], cells[indices[1]], cells[indices[2]]); break;
      }
      case 7: out.result = createNativeFactoryObject(memory, FOUNDATION_REGISTRY + 0x7000n, Buffer.from(c.query), factoryServices).toString(); break;
      case 8: releaseNativeFactoryObject(memory, FOUNDATION_REGISTRY + 0x7000n, c.nullObject ? 0n : FOUNDATION_OBJECTS, factoryServices); break;
      case 9: out.result = (getNativeFactoryObjectInitPriority(memory, FOUNDATION_REGISTRY + 0x7000n, c.nullObject ? 0n : FOUNDATION_OBJECTS, factoryServices) >>> 0).toString(); break;
      case 10: initializeNativeValueBarn(memory, FOUNDATION_BARN); break;
      case 11: out.result = createNativeBarnValue(memory, FOUNDATION_BARN, FOUNDATION_REGISTRY + 0x5100n, valueServices).toString(); break;
      case 12: releaseNativeBarnValue(memory, FOUNDATION_BARN, c.nullObject ? 0n : FOUNDATION_OBJECTS, valueServices); break;
      case 13: unloadNativeValueBarn(memory, FOUNDATION_BARN, valueServices); break;
      case 14: {
        initializeNativeValueBarn(memory, FOUNDATION_BARN);
        const values = Array.from({ length: 3 }, () => createNativeBarnValue(memory, FOUNDATION_BARN, FOUNDATION_REGISTRY + 0x5100n, valueServices));
        for (let i = 0; i < 3; i++) objects.writeBigUInt64LE(values[i], 0x60 + 0x38 + i * 8);
        const cells = values.map(value => ({ storage: objects.subarray(Number(value - FOUNDATION_OBJECTS), Number(value - FOUNDATION_OBJECTS) + 24) }));
        executeFloatMult(cells[0], cells[1], cells[2]);
        for (const i of [1, 0, 2]) releaseNativeBarnValue(memory, FOUNDATION_BARN, values[i], valueServices);
        unloadNativeValueBarn(memory, FOUNDATION_BARN, valueServices);
        out.result = createNativeBarnValue(memory, FOUNDATION_BARN, FOUNDATION_REGISTRY + 0x5100n, valueServices).toString(); break;
      }
      case 15: {
        initializeNativeValueBarn(memory, FOUNDATION_BARN);
        const factory = FOUNDATION_REGISTRY + 0x7000n;
        const values = Array.from({ length: 3 }, () => createNativeFactoryObject(memory, factory, Buffer.from(c.query), factoryServices));
        for (let i = 0; i < 3; i++) objects.writeBigUInt64LE(values[i], 0x60 + 0x38 + i * 8);
        const cells = values.map(value => ({ storage: objects.subarray(Number(value - FOUNDATION_OBJECTS), Number(value - FOUNDATION_OBJECTS) + 24) }));
        executeFloatMult(cells[0], cells[1], cells[2]);
        for (const i of [1, 0, 2]) {
          getNativeFactoryObjectInitPriority(memory, factory, values[i], factoryServices);
          releaseNativeFactoryObject(memory, factory, values[i], factoryServices);
        }
        unloadNativeValueBarn(memory, FOUNDATION_BARN, valueServices);
        out.result = createNativeFactoryObject(memory, factory, Buffer.from(c.query), factoryServices).toString(); break;
      }
      case 16: {
        if(!c.tgcl)throw new Error('Missing TGCL consumer input');
        if(c.tgcl.trigger)out.frames=[];
        if(eventClass==='SetFloat')out.math=[];
        const unavailable=():never=>{throw new Error('Arrays/strings outside the Float subgraph scope');};
        const fields:NativeTgclFieldServices={
          registry:FOUNDATION_REGISTRY,nullObjectType:FOUNDATION_REGISTRY+0x5000n,integerType:0n,
          asClass:factoryServices.asClass,
          castObject:(meta,object)=>{log(6,meta,object?1:0);return meta===FOUNDATION_REGISTRY+0x5300n?object-8n:object;},
          methodReceiverType:unavailable,castReceiver:unavailable,invokeArrayAllocator:unavailable,fieldReceiverType:unavailable,
          fieldAddress:unavailable,elementType:unavailable,elementObject:unavailable,growAndReplace:unavailable,
        };
        initializeNativeValueBarn(memory,FOUNDATION_BARN);
        initializeNativeEventBarn(memory,FOUNDATION_EVENT_BARN,(tree,root)=>clearNativeEventTypeMap(memory,tree,root,eventServices.pool));
        if(c.tgcl.trigger){const unique=registry.readUInt32LE(0xed00);memory.write8(FOUNDATION_EVENT_BARN+0xcn,unique&255);memory.write8(FOUNDATION_EVENT_BARN+0xdn,(unique>>>8)&255);memory.write64(FOUNDATION_EVENT_BARN+0x20n,registry.readBigUInt64LE(0xed20));memory.write64(FOUNDATION_EVENT_BARN+0x18n,registry.readBigUInt64LE(0xed28));memory.write64(FOUNDATION_EVENT_BARN+0x28n,registry.readBigUInt64LE(0xed30));}
        if(c.tgcl.eventFailure==='exhausted')memory.write64(FOUNDATION_EVENT_BARN+0x5030n,0n);
        if(c.tgcl.eventFailure==='occupied')memory.write64(FOUNDATION_EVENT_BARN+0x30n,FOUNDATION_OBJECTS);
        const factory=FOUNDATION_REGISTRY+0x7000n,context=FOUNDATION_REGISTRY+0xc000n,table=FOUNDATION_REGISTRY+0xe800n;
        const values:bigint[]=[];let consumer=0n;
        for(let i=0;i<c.tgcl.order.length;i++){
          const kind=c.tgcl.order[i],object=createAndReadPreparedNativeObject(memory,
            {factoryAddress:factory,fieldsContext:context,objectTable:table,factory:factoryServices,fields},
            Buffer.from(kind===3?eventClass:'Float'),FOUNDATION_REGISTRY+BigInt(kind===3?0xe00c:0xe000),i);
          if(kind===3)consumer=object;else values[kind]=object;
        }
        resolveNativeTgclPointers(memory,context,table);
        const multiply=()=>{
          const cells=[0x38n,0x40n,0x48n].map(offset=>{const value=memory.read64(consumer-8n+offset);return {storage:objects.subarray(Number(value-FOUNDATION_OBJECTS),Number(value-FOUNDATION_OBJECTS)+24)};});
          executeFloatMult(cells[0],cells[1],cells[2]);
        };
        if(c.tgcl.trigger?.autoDispatch){
          const event=objects.subarray(Number(consumer-8n-FOUNDATION_OBJECTS),Number(consumer-8n-FOUNDATION_OBJECTS)+eventSize);
          const bound=bindNativeEventBarnView(memory,FOUNDATION_EVENT_BARN,eventBarn!,pointer=>{if(pointer!==consumer-8n)throw new Error('Unexpected event');return event;},buffer=>{if(buffer!==event)throw new Error('Unexpected event view');return consumer-8n;});
          const barn=bound.barn,gameAddress=FOUNDATION_REGISTRY+(eventClass==='SetFloat'?0xb000n:0x5c00n);
          let frameAt=0,mathAt=0;
          if(eventClass==='SetFloat')memory.write64(gameAddress+0x160n,FOUNDATION_REGISTRY+0xb400n);
          const math=(value:number)=>{const pair=mathFixture[mathAt++];if(!pair)throw new Error('Missing native logf/expf service output');const input=Buffer.alloc(4);input.writeFloatLE(value);out.math!.push([input.readUInt32LE(),pair[1]]);const output=Buffer.alloc(4);output.writeUInt32LE(pair[1]);return output.readFloatLE();};
          const barnServices:OriginalEventBarnServices<bigint>={
            barnFor:e=>memory.read64(consumer-8n+0x18n)===FOUNDATION_EVENT_BARN?barn.bytes:null,logNullBarn:()=>{throw new Error('Null FloatMult barn');},
            virtual:(slot,e,game,heap)=>{if(e!==event||slot!==0&&game!==gameAddress)throw new Error('FloatMult dispatch boundary');if((slot===0x10||slot===0x18)&&heap!==0x85098)throw new Error('FloatMult load heap');dispatchOriginalNumericEventVirtual(eventClass,slot,e,{resolveFloat:pointer=>({storage:objects.subarray(Number(pointer-FOUNDATION_OBJECTS),Number(pointer-FOUNDATION_OBJECTS)+24)}),startEvent:()=>startOriginalEvent(e,barn.bytes,()=>{throw new Error('Missing Barn');}),frame:()=>setFloatFrame(registry.readFloatLE(0xb414),registry.readFloatLE(0xb420),c.tgcl?.speedOverrideEnabled===false?1:registry.readFloatLE(0xb608+frameAt*12)),math:{logf:math,expf:math}});},
            scratchHeap:()=>{log(28,0n);return FOUNDATION_REGISTRY+0x5b00n;},
            allocateScratch:(heap,size,alignment)=>{valueServices.allocate(heap as bigint,BigInt(size),FOUNDATION_REGISTRY+0x5800n,BigInt(alignment));return [];},
            free:heap=>{log(30,heap as bigint);},eventHeap:()=>FOUNDATION_EVENT_BARN+0x5040n,
            loadHeapUsed:()=>{const used=registry.readUInt32LE(0xed18);log(29,0n,used);return used;},
          };
          const snapshot=()=>out.frames!.push({objectHex:objects.toString('hex'),barnSequence:eventBarn!.readUInt32LE(0x10)});
          loadOriginalEventBarn(barn,gameAddress,barnServices);bound.commit();snapshot();
          for(let i=0;i<c.tgcl.repetitions;i++){
            frameAt=i;
            const write=c.tgcl.frameWrites?.find(w=>w.frame===i);if(write)memory.write32(values[write.valueIndex]+0x10n,Buffer.from(write.bits,'hex').readUInt32LE());
            if(eventClass==='SetFloat'){memory.write32(FOUNDATION_REGISTRY+0xb414n,registry.readUInt32LE(0xb600+i*12));memory.write32(FOUNDATION_REGISTRY+0xb420n,registry.readUInt32LE(0xb604+i*12));}
            const action=c.tgcl.trigger.frameActions?.[i]??0;if(action)setOriginalEventEnabled(event,action===1,barn.bytes,barnServices.logNullBarn);
            updateOriginalEventBarn(barn,gameAddress,barnServices);bound.commit();snapshot();
          }
        }else for(let i=0;i<c.tgcl.repetitions;i++)multiply();
        getNativeFactoryObjectInitPriority(memory,factory,consumer,factoryServices);
        if(c.tgcl.loadedBeforeRelease)memory.write8(consumer-8n+0x20n,1);
        releaseNativeFactoryObject(memory,factory,consumer,factoryServices);
        if(c.tgcl.duplicateRelease)releaseNativeFactoryObject(memory,factory,consumer,factoryServices);
        if(c.tgcl.trigger?.resetTypeMap)initializeNativeEventBarn(memory,FOUNDATION_EVENT_BARN,(tree,root)=>clearNativeEventTypeMap(memory,tree,root,eventServices.pool));
        for(const i of [1,0,2]){if(values[i]===undefined)continue;getNativeFactoryObjectInitPriority(memory,factory,values[i],factoryServices);releaseNativeFactoryObject(memory,factory,values[i],factoryServices);}
        unloadNativeValueBarn(memory,FOUNDATION_BARN,valueServices);
        out.result=createNativeFactoryObject(memory,factory,Buffer.from('Float'),factoryServices).toString();break;
      }
      case 17:constructOriginalEvent(objects,{eventClassId:c.classId,eventVptr:0x100c14ea0n});break;
      case 18:constructOriginalFloatMult(objects,c.classId,0x100d0cbf8n,{eventClassId:9,eventVptr:0x100c14ea0n});out.result=FOUNDATION_OBJECTS.toString();break;
      case 19:constructOriginalFloatAdd(objects,c.classId,{eventClassId:9,eventVptr:0x100c14ea0n});out.result=FOUNDATION_OBJECTS.toString();break;
      case 20:constructOriginalSetFloat(objects,c.classId,{eventClassId:9,eventVptr:0x100c14ea0n});out.result=FOUNDATION_OBJECTS.toString();break;
      default: throw new Error('Unknown foundation case');
    }
  } catch (error) { if (!(error instanceof NativeObjectFoundationFailure)) throw error; out.line = error.line; out.severity = error.severity; }
  out.objectHex = objects.toString('hex'); out.registrySha256 = crypto.createHash('sha256').update(registry).digest('hex');
  if(eventBarn){out.eventBarnHex=eventBarn.subarray(0,0x5100).toString('hex');if(c.tgcl?.trigger)out.loadHeapBaseline=eventBarn.readUInt32LE(0x1050f0);}return out;
}
