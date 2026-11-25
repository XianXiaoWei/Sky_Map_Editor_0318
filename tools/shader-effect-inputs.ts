import fs from 'node:fs/promises';
import path from 'node:path';
import {deflateSync} from 'node:zlib';
import * as THREE from 'three';
import {AssetCatalog} from '../src/main/assets';
import {nativeMaterialDefs,nativeMaterialParameters} from '../src/core/mesh-surfaces';
import {bindVulkanMaterial,type VulkanMaterialInput} from '../src/main/vulkan-material';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {VulkanHost} from '../src/main/vulkan';
const data='/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
async function png(file:string,width:number,height:number,rgba:Uint8Array){
 const crc=(b:Buffer)=>{let c=0xffffffff;for(const byte of b){c^=byte;for(let i=0;i<8;i++)c=(c>>>1)^((c&1)?0xedb88320:0);}return(c^0xffffffff)>>>0;};
 const chunk=(name:string,b:Buffer)=>{let type=Buffer.from(name),out=Buffer.alloc(b.length+12);out.writeUInt32BE(b.length);type.copy(out,4);b.copy(out,8);out.writeUInt32BE(crc(Buffer.concat([type,b])),8+b.length);return out;};
 const header=Buffer.alloc(13);header.writeUInt32BE(width);header.writeUInt32BE(height,4);header[8]=8;header[9]=6;
 const rows=Buffer.alloc(height*(width*4+1));for(let y=0;y<height;y++)Buffer.from(rgba.subarray(y*width*4,(y+1)*width*4)).copy(rows,y*(width*4+1)+1);
 await fs.writeFile(file,Buffer.concat([Buffer.from([137,80,78,71,13,10,26,10]),chunk('IHDR',header),chunk('IDAT',deflateSync(rows)),chunk('IEND',Buffer.alloc(0))]));
}
async function main(){
 const input=JSON.parse(await fs.readFile(process.argv[2],'utf8')),catalog=new AssetCatalog(data,'Dawn'),host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const width=640,height=480,report:any={passed:false,scope:'Isolated original terrain shader execution: synthetic sphere/packed lighting, explicit sky/probe, no point lights or water. Actual material parameters and game texture pixels. These are not editor terrain or original-game images.',images:[]};
 try{
 report.device=await host.start();
 const sphere=new THREE.SphereGeometry(8,96,64),position=sphere.attributes.position,normal=sphere.attributes.normal,vertices=Buffer.alloc(position.count*36);
 const attrs:VulkanMaterialInput['attributes']={a_position:{format:'vec3',offset:0},a_normal:{format:'snorm4',offset:12},a_material0:{format:'unorm4',offset:16},a_material1:{format:'unorm4',offset:20},a_light0:{format:'unorm4',offset:24},a_light1:{format:'unorm4',offset:28},a_light2:{format:'unorm4',offset:32}};
 for(let i=0;i<position.count;i++){for(let lane=0;lane<3;lane++){vertices.writeFloatLE(position.getComponent(i,lane),i*36+lane*4);vertices.writeInt8(Math.round(normal.getComponent(i,lane)*127),i*36+12+lane);}vertices.set([255,0,0,0],i*36+20);vertices.set([128,128,128,255],i*36+24);vertices.set([128,220,128,0],i*36+28);vertices.set([128,255,128,32],i*36+32);}
 const camera=new THREE.PerspectiveCamera(40,width/height,.1,200);camera.position.set(17,11,24);camera.lookAt(0,0,0);camera.updateMatrixWorld();
 const identity=new THREE.Matrix4().toArray(),uniforms={u_viewProj:new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),u_model:identity,u_modelIT:identity,u_worldToLevel:identity,u_eyePos:camera.position.toArray(),u_sunDir:[-.4,-.8,-.2],u_sunColor:[2,1.8,1.5],u_averageSkyColor:[.3,.45,.7],u_pointLight:[0,0,0],u_viewportSize:[width,height],u_lightShadowConsts:[0,0,0,1],u_time:0,u_waterSimTerms:[0,0,0,0],u_windScroll1:[0,0,0],u_windScroll2:[0,0,0]};
 const constant=(rgba:number[])=>({format:'rgba32f' as const,dimensions:[1,1,1] as [number,number,number],linear:false,repeat:false,data:new Uint8Array(Float32Array.from(rgba).buffer)});
 const cube=Float32Array.from({length:8190*4},(_,i)=>[.1,.2,.35,1][i%4]);
 const globals:VulkanMaterialInput['textures']={u_probeCube:{format:'rgba32f',dimensions:[32,32,6],mipLevels:6,linear:true,repeat:false,data:new Uint8Array(cube.buffer)},u_lightOffsetsTex:{format:'r32ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},u_lightCountsTex:{format:'rgba8ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},u_lightPositionsTex:constant([0,0,0,0]),u_lightColorsTex:constant([0,0,0,0]),u_waterSim:constant([0,0,0,0])};
 await fs.mkdir('docs/shader-effects',{recursive:true});
 for(const name of ['RockFaceSh','SandSh','GrassSh']){
  const def=nativeMaterialDefs('Dawn').filter(d=>d.shaderName===name).find(d=>d.uvScale>0&&d.materialId!==1)!;
  for(let i=0;i<position.count;i++)vertices[i*36+16]=def.materialId;
  const textures={...globals};for(const field of def.textures){const item=input[field.texture];if(!item)throw new Error('Missing actual game texture '+field.texture);textures[field.name]={format:'rgba8',dimensions:[item.width,item.height,1],linear:true,repeat:true,data:Uint8Array.from(await fs.readFile(item.file))};}
  const program=catalog.program(name),compiled=await compileVulkanShaders(vulkanProgramSources(program));
  const parameters=Object.fromEntries(nativeMaterialParameters(def).filter(p=>p.vector.length).map(p=>[p.name,p.vector.length===1?p.vector[0]:p.vector]));
  const scene=await bindVulkanMaterial(compiled,{shader:name,state:0,stride:36,vertices,indices:Uint32Array.from(sphere.index!.array),attributes:attrs,uniforms:{...uniforms,...parameters},textures});
  await host.setMaterialScene(scene);const values=(await host.materialFrame(width,height)).attachments[0],rgba=new Uint8Array(width*height*4);let colored=0,nonfinite=0;const colors=new Set();
  for(let i=0;i<width*height;i++){let present=values[i*4+3]!==0;if(present)colored++;for(let lane=0;lane<3;lane++){const v=values[i*4+lane];if(!Number.isFinite(v))nonfinite++;const linear=Math.max(0,v),mapped=linear/(1+linear);rgba[i*4+lane]=present?Math.round(255*(mapped<=.0031308?12.92*mapped:1.055*mapped**(1/2.4)-.055)):[22,30,42][lane];}rgba[i*4+3]=255;colors.add(rgba.slice(i*4,i*4+3).join(','));}
  if(nonfinite||colored<width*height*.1||colors.size<100)throw new Error(`${name} invalid output ${nonfinite},${colored},${colors.size}`);
  const file='docs/shader-effects/'+name+'-isolated.png';await png(file,width,height,rgba);report.images.push({name,file,materialId:def.materialId,uvScale:def.uvScale,textures:def.textures,coloredPixels:colored,colors:colors.size,nonfinite});
 }
 report.passed=true;
 }catch(e){report.error=String(e);throw e;}finally{host.stop();await fs.writeFile('docs/shader-effect-capture.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
