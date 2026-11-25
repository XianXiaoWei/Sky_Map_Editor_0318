import {VULKAN_FRAME_MAGIC,VULKAN_MATERIAL_MAGIC,VULKAN_PRESENT_MAGIC} from '../core/vulkan-protocol';
import {VULKAN_FULL_MAGIC} from '../core/vulkan-full-preview';

/** Read pipe fragments once into their final bounded message. Repeated concat
 * of an expanding HDR frame was quadratic in the number of pipe fragments. */
export class VulkanResponseDecoder {
  private header=Buffer.alloc(32);
  private headerAt=0;
  private headerSize=20;
  private message?:Buffer;
  private messageAt=0;
  copiedBytes=0;
  push(chunk:Buffer,receive:(message:Buffer)=>void){
    let at=0;
    while(at<chunk.length){
      if(!this.message){
        const n=Math.min(this.headerSize-this.headerAt,chunk.length-at);
        chunk.copy(this.header,this.headerAt,at,at+n);this.copiedBytes+=n;this.headerAt+=n;at+=n;
        if(this.headerAt<this.headerSize)continue;
        const magic=this.header.readUInt32LE();
        if(magic===VULKAN_MATERIAL_MAGIC&&this.headerSize===20){this.headerSize=24;continue;}
        if(magic===VULKAN_FULL_MAGIC){
          if(this.headerSize===20){this.headerSize=32;continue;}
          const w=this.header.readUInt32LE(8),h=this.header.readUInt32LE(12),size=this.header.readUInt32LE(16),mode=this.header.readUInt32LE(20),lum=this.header.readDoubleLE(24);
          if(!w||!h||w>4096||h>4096||mode>2||size!==(mode?0:w*h*4)||!Number.isFinite(lum)||lum<=0)throw new Error('Vulkan 完整渲染响应无效');
          this.message=Buffer.allocUnsafe(32+size);this.header.copy(this.message,0,0,32);this.messageAt=32;
        }else{
        const material=magic===VULKAN_MATERIAL_MAGIC,present=magic===VULKAN_PRESENT_MAGIC,w=this.header.readUInt32LE(8),h=this.header.readUInt32LE(12),count=material?this.header.readUInt32LE(16):1,value=this.header.readUInt32LE(material?20:16),size=present?0:value;
        if(![VULKAN_FRAME_MAGIC,VULKAN_MATERIAL_MAGIC,VULKAN_PRESENT_MAGIC].includes(magic)||!w||!h||w>4096||h>4096||!count||count>4||(present?value>1:size!==w*h*count*(material?16:4)))throw new Error('Vulkan 帧响应无效');
        this.message=Buffer.allocUnsafe(this.headerSize+size);this.header.copy(this.message,0,0,this.headerSize);this.messageAt=this.headerSize;
        }
      }
      const n=Math.min(this.message.length-this.messageAt,chunk.length-at);
      chunk.copy(this.message,this.messageAt,at,at+n);this.copiedBytes+=n;this.messageAt+=n;at+=n;
      if(this.messageAt===this.message.length){const complete=this.message;this.message=undefined;this.headerAt=0;this.headerSize=20;this.messageAt=0;receive(complete);}
    }
  }
}
