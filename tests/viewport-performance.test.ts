import test from 'node:test';
import assert from 'node:assert/strict';
import {ViewportPerformancePolicy} from '../src/core/viewport-performance';
import {VulkanResponseDecoder} from '../src/main/vulkan-response';
import {VULKAN_FRAME_MAGIC,VULKAN_MATERIAL_MAGIC,VULKAN_PRESENT_MAGIC,vulkanDrawOrderBytes} from '../src/core/vulkan-protocol';
import {basicViewportVisibility} from '../src/core/viewport-draw-visibility';
import type {VulkanModelDraw} from '../src/core/vulkan-protocol';

test('Adaptive resolution excludes uploads, respects hysteresis and preserves explicit full quality',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(4);assert.equal(p.path,'basic');assert.equal(p.maximumDimension,480);
 for(let i=0;i<10;i++)assert.equal(p.observe(6000,i*1000,true),false);
 p.observe(200,0);p.observe(200,100);assert.equal(p.observe(200,200),true);assert.equal(p.maximumDimension,240);
 for(let i=0;i<50;i++)p.observe(10,300+i*10);assert.equal(p.maximumDimension,240);
 for(let i=0;i<30;i++)p.observe(10,3000+i*100);assert.ok(p.maximumDimension>240);
 for(let i=0;i<100;i++)p.observe(6000,10000+i*1000);assert.equal(p.maximumDimension,128);
 p.setQuality('full');assert.equal(p.path,'full');assert.equal(p.maximumDimension,480);
 for(let i=0;i<20;i++)p.observe(6000,10000+i*1000);assert.equal(p.path,'full');assert.equal(p.maximumDimension,128);
 p.setQuality('auto');assert.equal(p.maximumDimension,480);assert.throws(()=>p.setQuality('wrong' as any));
});

test('Native automatic quality adapts promptly while explicit original materials retain their detail floor',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(1);p.setNativeSurface(true);
 assert.equal(p.maximumDimension,1440);assert.equal(p.path,'fast');assert.equal(p.animationInterval,0);
 for(let i=0;i<100;i++)p.observe(200,i*1000);
 assert.equal(p.path,'fast');assert.equal(p.maximumDimension,640);
 p.setQuality('fast');for(let i=0;i<100;i++)p.observe(200,200000+i*1000);
 assert.equal(p.path,'fast');assert.equal(p.maximumDimension,1280);
 p.setQuality('full');assert.equal(p.maximumDimension,2560);for(let i=0;i<100;i++)p.observe(500,300000+i*1000);assert.equal(p.path,'full');assert.equal(p.maximumDimension,1280);
 p.setQuality('auto');for(let i=0;i<400;i++)p.observe(5,400000+i*100);
 assert.equal(p.path,'fast');assert.equal(p.maximumDimension,2560);
});
test('Windows native quality targets a high frame rate while retaining original materials and its detail floor',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2);p.setNativeSurface(true,true);assert.equal(p.maximumDimension,1920);assert.equal(p.path,'fast');
 for(let i=0;i<100;i++)p.observe(20,i*1000);assert.equal(p.maximumDimension,1280);assert.equal(p.path,'fast');
 p.setFrameBudget(1000/240);assert.equal(p.path,'fast');assert.throws(()=>p.setFrameBudget(.5));
});
test('Full native effects adapt without dropping stages and recover detail after sustained headroom',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2);p.setNativeSurface(true,true);p.setQuality('full');assert.equal(p.maximumDimension,1920);
 for(let i=0;i<100;i++)p.observe(50,i*1000);assert.equal(p.path,'full');assert.equal(p.maximumDimension,1280);
 for(let i=0;i<400;i++)p.observe(1,200000+i*100);assert.equal(p.path,'full');assert.equal(p.maximumDimension,2560);
 const software=new ViewportPerformancePolicy();software.setDevice(4);software.setNativeSurface(true,true);software.setQuality('full');assert.equal(software.maximumDimension,640);
 for(let i=0;i<100;i++)software.observe(1000,i*1000);assert.equal(software.path,'full');assert.equal(software.maximumDimension,128);
 for(let i=0;i<400;i++)software.observe(1,200000+i*100);assert.equal(software.maximumDimension,640);assert.equal(software.path,'full');
});

test('GT 1030 keeps full effects while adapting to a 60 FPS budget and preserving other device profiles',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2,'NVIDIA GeForce GT 1030');p.setQuality('full');assert.equal(p.maximumDimension,960);
 for(let i=0;i<100;i++)p.observe(50,i*3000);assert.equal(p.path,'full');assert.equal(p.maximumDimension,384);
 for(let i=0;i<600;i++)p.observe(2,400000+i*100);assert.equal(p.maximumDimension,1600);assert.equal(p.path,'full');
 p.setDevice(4,'SwiftShader');assert.equal(p.maximumDimension,480);
});

test('Full canvas responds to 1–2 FPS within six frames without changing effects or measuring uploads',()=>{
 for(const name of ['NVIDIA GeForce GT 1030','NVIDIA GeForce GTX 1060']){
  const p=new ViewportPerformancePolicy();p.setDevice(2,name);p.setNativeSurface(false);p.setQuality('full');
  assert.equal(p.targetFrameBudget,1000/60);const initial=p.maximumDimension;
  for(let i=0;i<20;i++)p.observe(500,i*500,true);assert.equal(p.maximumDimension,initial);
  for(let i=0;i<6;i++)p.observe(500,10000+i*500);
  assert.ok(p.maximumDimension<=initial/2);assert.equal(p.path,'full');
  for(let i=0;i<30;i++)p.observe(8,13000+i*16);assert.ok(p.maximumDimension<=initial/2);
 }
});

test('GT 1030 native initialization preserves 60 FPS budget, device changes clear it and explicit budgets persist',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2,'NVIDIA GeForce GT 1030');p.setNativeSurface(true,true);p.setQuality('full');assert.equal(p.targetFrameBudget,1000/60);
 p.setDevice(2,'NVIDIA RTX 4080');assert.equal(p.targetFrameBudget,1000/240);
 p.setNativeSurface(false);assert.equal(p.targetFrameBudget,1000/60);
 p.setQuality('auto');assert.equal(p.targetFrameBudget,30);
 p.setFrameBudget(25);p.setDevice(2,'NVIDIA GeForce GT 1030');p.setNativeSurface(true,true);p.setQuality('full');assert.equal(p.targetFrameBudget,25);
});

test('Balanced resolution keeps at least 67 percent of display pixels and recovers native detail',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2,'NVIDIA GeForce GT 1030');p.setQuality('full');p.setResolutionMode('balanced');p.setViewportDimension(800);
 assert.equal(p.maximumDimension,800);assert.equal(p.targetFrameBudget,1000/60);
 for(let i=0;i<100;i++)p.observe(500,i*1000);
 assert.equal(p.maximumDimension,536);assert.equal(p.path,'full');
 p.setViewportDimension(800);assert.equal(p.maximumDimension,536);
 for(let i=0;i<400;i++)p.observe(1,200000+i*100);
 assert.equal(p.maximumDimension,800);
 p.setViewportDimension(500);for(let i=0;i<100;i++)p.observe(500,300000+i*1000);
 assert.equal(p.maximumDimension,384);
 p.setViewportDimension(1600);for(let i=0;i<100;i++)p.observe(500,400000+i*1000);
 assert.equal(p.maximumDimension,1072);
});
test('Native clarity survives expensive frames, device setup and resizing; smooth mode remains available',()=>{
 const p=new ViewportPerformancePolicy();p.setQuality('full');p.setResolutionMode('native');p.setViewportDimension(800);p.setDevice(2,'NVIDIA GeForce GT 1030');p.setNativeSurface(false);
 for(let i=0;i<100;i++)assert.equal(p.observe(500,i*1000),false);
 assert.equal(p.maximumDimension,800);assert.equal(p.path,'full');
 p.setViewportDimension(1600);assert.equal(p.maximumDimension,1600);
 p.setViewportDimension(8000);assert.equal(p.maximumDimension,4096);
 p.setResolutionMode('balanced');p.setFrameBudget(25);p.setDevice(2);assert.equal(p.targetFrameBudget,25);
 p.setResolutionMode('smooth');p.setViewportDimension(800);p.setDevice(2,'NVIDIA GeForce GT 1030');
 for(let i=0;i<100;i++)p.observe(500,i*1000);
 assert.equal(p.maximumDimension,384);assert.equal(p.path,'full');
 assert.throws(()=>p.setResolutionMode('wrong' as any));
});

test('Surface responses carry only bounded presentation status and can interleave with normal pixel responses',()=>{
 const message=(status:number)=>{const b=Buffer.alloc(20);[VULKAN_PRESENT_MAGIC,17,2560,1440,status].forEach((v,i)=>b.writeUInt32LE(v,i*4));return b;};
 const normal=response(false,2,2),input=Buffer.concat([message(1),message(0),normal]),decoder=new VulkanResponseDecoder(),received:Buffer[]=[];
 for(let i=0;i<input.length;i+=7)decoder.push(input.subarray(i,i+7),b=>received.push(b));
 assert.deepEqual(received,[message(1),message(0),normal]);assert.equal(received[0].length,20);assert.equal(decoder.copiedBytes,input.length);
 assert.throws(()=>new VulkanResponseDecoder().push(message(2),()=>{}));
});

function response(material:boolean,w:number,h:number,count=1){
 const header=material?24:20,size=w*h*count*(material?16:4),b=Buffer.alloc(header+size);
 b.writeUInt32LE(material?VULKAN_MATERIAL_MAGIC:VULKAN_FRAME_MAGIC);b.writeUInt32LE(23,4);b.writeUInt32LE(w,8);b.writeUInt32LE(h,12);
 if(material)b.writeUInt32LE(count,16);b.writeUInt32LE(size,material?20:16);
 for(let i=header;i<b.length;i++)b[i]=i%251;return b;
}
test('Fragmented mixed HDR/RGBA pipe frames are reconstructed with linear copy cost',()=>{
 const frames=[response(true,81,59,2),response(false,37,23),response(true,3,4,4)],stream=Buffer.concat(frames);
 for(const step of [1,7,19,20,23,24,65536,stream.length]){
  const decoder=new VulkanResponseDecoder(),received:Buffer[]=[];
  for(let at=0;at<stream.length;at+=step)decoder.push(stream.subarray(at,at+step),b=>received.push(b));
  assert.deepEqual(received,frames);assert.equal(decoder.copiedBytes,stream.length);
 }
 const malformed=response(false,1,1);malformed.writeUInt32LE(3,16);
 assert.throws(()=>new VulkanResponseDecoder().push(malformed,()=>assert.fail()),/响应无效/);
});
test('Native draw reordering sends complete permutations without geometry',()=>{
 assert.deepEqual(Array.from(new Uint32Array(vulkanDrawOrderBytes([2,0,1],[1,0]).buffer).slice(0,7)),[3,2,0,1,2,1,0]);
 for(const order of [[0,0],[1],[-1],[.5],[0,3]])assert.throws(()=>vulkanDrawOrderBytes(order,[]),/完整排列/);
 assert.equal(vulkanDrawOrderBytes([],[]).length,8);
});
test('Basic frustum culling follows live model transforms and retains boundary intersections',()=>{
 const vertices=new Uint8Array(144),data=new DataView(vertices.buffer);
 [[-.25,-.25,0],[.25,-.25,0],[0,.25,0]].forEach((p,i)=>p.forEach((v,j)=>data.setFloat32(i*48+j*4,v,true)));
 const matrix=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
 const draw:VulkanModelDraw={nodeId:1,shader:'basic',group:'Opaque',state:0,stride:48,vertices,indices:Uint32Array.from([0,1,2]),model:matrix.slice(),baked:true};
 assert.deepEqual(basicViewportVisibility([draw],matrix),[true]);
 draw.model[12]=2;assert.deepEqual(basicViewportVisibility([draw],matrix),[false]);
 draw.model[12]=1.2;assert.deepEqual(basicViewportVisibility([draw],matrix),[true]);
 draw.model[12]=0;draw.model[14]=-2;assert.deepEqual(basicViewportVisibility([draw],matrix),[false]);
 draw.model[14]=0;assert.deepEqual(basicViewportVisibility([draw],matrix),[true]);
 draw.model[12]=2;draw.model[3]=.5;assert.deepEqual(basicViewportVisibility([draw],matrix),[true]);
});
test('Automatic hardware quality falls back after sustained slow frames while explicit material quality stays selected',()=>{
 const p=new ViewportPerformancePolicy();p.setDevice(2);assert.equal(p.path,'fast');
 p.observe(200,0);p.observe(200,100);assert.equal(p.observe(200,200),true);assert.equal(p.path,'basic');
 p.setQuality('fast');for(let i=0;i<20;i++)p.observe(6000,i*3000);assert.equal(p.path,'fast');
 p.setQuality('basic');assert.equal(p.path,'basic');
});
test('Android frame budget adapts before desktop slow-frame thresholds',()=>{
 const p=new ViewportPerformancePolicy();p.setFrameBudget(1000/60);p.setDevice(2);
 p.observe(35,0);p.observe(35,100);assert.equal(p.observe(35,200),true);assert.ok(p.maximumDimension<960);assert.equal(p.path,'fast');
 p.setQuality('auto');p.observe(80,0);p.observe(80,100);assert.equal(p.observe(80,200),true);assert.equal(p.path,'basic');
 p.setQuality('full');assert.equal(p.path,'full');assert.equal(p.observe(80,0),false);
 assert.throws(()=>p.setFrameBudget(0));assert.throws(()=>p.setFrameBudget(NaN));
});
