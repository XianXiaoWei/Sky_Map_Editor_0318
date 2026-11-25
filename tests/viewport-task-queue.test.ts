import test from 'node:test';
import assert from 'node:assert/strict';
import {ViewportTaskQueue} from '../src/core/viewport-task-queue';

test('Document commits wait for the frame holding old effect storage, including final diagnostics',async()=>{
 const queue=new ViewportTaskQueue(),events:string[]=[];
 let finish!:()=>void;const readback=new Promise<void>(resolve=>finish=resolve);
 let disposed=false;
 const frame=queue.wrap(async()=>{events.push('draw');await readback;assert.equal(disposed,false);events.push('diagnostics');});
 const commit=queue.wrap(()=>{disposed=true;events.push('commit');return 42;});
 const a=frame(),b=commit();await Promise.resolve();assert.deepEqual(events,['draw']);
 finish();await a;assert.equal(await b,42);assert.deepEqual(events,['draw','diagnostics','commit']);
});
test('A failed Vulkan frame does not block editing or the recovered renderer',async()=>{
 const queue=new ViewportTaskQueue(),events:string[]=[];
 const fail=queue.wrap(async()=>{throw new Error('GPU disconnected');});
 const edit=queue.wrap(()=>events.push('edit')),recover=queue.wrap(()=>events.push('recovered'));
 const a=fail(),b=edit(),c=recover();await assert.rejects(a,/GPU disconnected/);await b;await c;
 assert.deepEqual(events,['edit','recovered']);
});
