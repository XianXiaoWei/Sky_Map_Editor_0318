import test from 'node:test';
import assert from 'node:assert/strict';
import {ViewportFrameLoop} from '../src/renderer/viewport-frame-loop';
import {vulkanWindowBoundsBytes} from '../src/core/vulkan-protocol';

test('Native completion scheduling runs beyond RAF cadence without overlapping work',async()=>{
 const priorRaf=globalThis.requestAnimationFrame,priorCancel=globalThis.cancelAnimationFrame,frames=new Map<number,FrameRequestCallback>();let id=0;
 globalThis.requestAnimationFrame=callback=>{frames.set(++id,callback);return id;};globalThis.cancelAnimationFrame=id=>{frames.delete(id);};
 let waiting=false,updates=0,finish!:()=>void;const completed=new Promise<void>(resolve=>finish=resolve);
 const loop=new ViewportFrameLoop(()=>{assert.equal(waiting,false);waiting=true;updates++;queueMicrotask(()=>{waiting=false;if(updates===300){loop.stop();finish();}else loop.complete();});},()=>waiting);
 try{
  loop.setHighRate(true);loop.start();const [first,callback]=[...frames][0];frames.delete(first);callback(0);
  await Promise.race([completed,new Promise<void>((_,reject)=>{const timer=setTimeout(()=>reject(new Error('Native frame completion scheduling stalled')),3000);timer.unref();})]);
  assert.equal(updates,300);assert.equal(frames.size,0);loop.complete();await new Promise(resolve=>setTimeout(resolve,10));assert.equal(updates,300);
 }finally{loop.stop();globalThis.requestAnimationFrame=priorRaf;globalThis.cancelAnimationFrame=priorCancel;}
});
test('Window bounds preserve signed positions, zero-size hiding and strict limits',()=>{
 const bytes=vulkanWindowBoundsBytes({x:-30,y:20,width:1920,height:1080,visible:true});assert.equal(bytes.length,20);assert.equal(bytes.readInt32LE(0),-30);assert.equal(bytes.readUInt32LE(8),1920);assert.equal(bytes.readUInt32LE(16),1);
 assert.equal(vulkanWindowBoundsBytes({x:0,y:0,width:0,height:0,visible:false}).readUInt32LE(16),0);
 for(const bad of [{x:NaN},{y:.5},{width:-1},{height:20000},{visible:1}])assert.throws(()=>vulkanWindowBoundsBytes({...{x:0,y:0,width:1,height:1,visible:true},...bad} as any));
});
