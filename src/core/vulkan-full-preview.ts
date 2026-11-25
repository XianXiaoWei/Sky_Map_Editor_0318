import {vulkanFrameBytes,VULKAN_TEXTURE_FORMATS,type VulkanColorFormat} from './vulkan-protocol';

export const VULKAN_FULL_MAGIC=0x564b4752;
export const FULL_SOURCE={opaque:100,alpha:101,cloudHistory:102,temporalHistory:103,waterHistory:104} as const;
export interface VulkanFullLink {draw:number;binding:number;source:number;attachment:number;format:VulkanColorFormat;flip:boolean;}
export interface VulkanFullStage {id:number;divisor:number;links:VulkanFullLink[];}
export interface VulkanFullGraph {
 stages:VulkanFullStage[];meter:number;exposureBinding:number;exposureOffset:number;
 cloud:number;temporal:number;reset:boolean;
}
// Stage 0 is the CloudCore draw in Opaque. The remaining stages execute in
// order; only the exposure meter splits the command stream into two submits.
export function vulkanFullGraphBytes(id:number,width:number,height:number,matrix:number[],graph:VulkanFullGraph,surface:boolean):Buffer {
 const base=vulkanFrameBytes(id,width,height,matrix);
 const seen=new Set<number>(),words=[Number(surface),Number(graph.reset),graph.stages.length,graph.meter,graph.exposureBinding,graph.exposureOffset,graph.cloud,graph.temporal];
 if(!graph.stages.length||graph.stages.length>17||!Number.isInteger(graph.meter)||graph.meter<0||graph.meter>=graph.stages.length||![graph.exposureBinding,graph.exposureOffset].every(n=>Number.isInteger(n)&&n>=0&&n<=65535)||graph.exposureOffset%4)throw new Error('完整渲染图计量参数无效');
 for(const stage of graph.stages){
  if(!Number.isInteger(stage.id)||stage.id<0||stage.id>=17||seen.has(stage.id)||![1,2,4,8].includes(stage.divisor)||stage.links.length>128)throw new Error('完整渲染图阶段无效');
  words.push(stage.id,stage.divisor,stage.links.length);
  const bindings=new Set<string>();
  for(const link of stage.links){
   const key=link.draw+':'+link.binding;
   if(![link.draw,link.binding,link.attachment].every(n=>Number.isInteger(n)&&n>=0)||link.draw>4095||link.binding>65535||link.attachment>3||bindings.has(key)||!Object.hasOwn(VULKAN_TEXTURE_FORMATS,link.format)||typeof link.flip!=='boolean'||(!seen.has(link.source)&&!Object.values(FULL_SOURCE).includes(link.source as any)))throw new Error('完整渲染图附件绑定无效');
   bindings.add(key);words.push(link.draw,link.binding,link.source,link.attachment,VULKAN_TEXTURE_FORMATS[link.format],Number(link.flip));
  }
  seen.add(stage.id);
 }
 if(!seen.has(graph.temporal)||graph.cloud!==0xffffffff&&!seen.has(graph.cloud)||graph.stages[graph.meter].id===0||graph.stages.at(-1)!.divisor!==1)throw new Error('完整渲染图历史或最终阶段无效');
 const header=Buffer.alloc(words.length*4);words.forEach((n,i)=>header.writeUInt32LE(n,i*4));return Buffer.concat([base,header]);
}
