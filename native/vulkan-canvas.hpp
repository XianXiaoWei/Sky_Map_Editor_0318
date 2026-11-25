#pragma once
#include <cstdlib>

static double skyDisplayValue(uint32_t bits){float raw;memcpy(&raw,&bits,4);const double v=raw;return (v<=.0031308?12.92*v:1.055*std::pow(v,1./2.4)-.055)*255.;}
static const std::array<uint32_t,255>& skyDisplayThresholds(){
    static const auto table=[](){std::array<uint32_t,255> values{};for(uint32_t i=0;i<255;i++){uint32_t low=0,high=0x3f800000u;while(low<high){const auto mid=low+(high-low)/2;if(skyDisplayValue(mid)>=double(i)+.5)high=mid;else low=mid+1;}values[i]=low;}return values;}();return table;
}
static uint8_t skyDisplayByte(float value,bool reference=false){
    if(value<=0)return 0;if(value>=1)return 255;uint32_t bits;memcpy(&bits,&value,4);
    if(reference)return uint8_t(std::lround(skyDisplayValue(bits)));
    const auto& table=skyDisplayThresholds();uint32_t low=0,high=255;while(low<high){const auto mid=(low+high)/2;if(bits>=table[mid])low=mid+1;else high=mid;}return uint8_t(low);
}

// Keep the working opaque Electron/Canvas boundary. Only packed display bytes
// cross PCIe; original HDR targets, shaders and exposure remain unchanged.
class SkyCanvasReadback {
    VkDevice device;VkPhysicalDevice physical;
    VkDescriptorSetLayout setLayout{};VkDescriptorPool descriptorPool{};VkDescriptorSet descriptor{};
    VkPipelineLayout layout{};VkPipeline pipeline{};VkSampler sampler{};
    Buffer thresholds{},packed{},readback{};uint32_t width{},height{};
    static void trace(const char* message){if(std::getenv("SKY_CANVAS_TRACE"))std::cerr<<"Canvas "<<message<<"\n";}
    uint32_t memoryType(uint32_t mask,VkMemoryPropertyFlags flags){
        VkPhysicalDeviceMemoryProperties p;vkGetPhysicalDeviceMemoryProperties(physical,&p);
        for(uint32_t i=0;i<p.memoryTypeCount;i++)if((mask&(1u<<i))&&(p.memoryTypes[i].propertyFlags&flags)==flags)return i;
        throw std::runtime_error("Canvas Vulkan memory unavailable");
    }
    void destroy(Buffer& b){if(b.handle)vkDestroyBuffer(device,b.handle,nullptr);if(b.memory)vkFreeMemory(device,b.memory,nullptr);b={};}
    Buffer buffer(VkDeviceSize bytes,VkBufferUsageFlags usage,VkMemoryPropertyFlags flags){
        Buffer b{};b.size=bytes;
        try{VkBufferCreateInfo create{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};create.size=bytes;create.usage=usage;create.sharingMode=VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateBuffer(device,&create,nullptr,&b.handle),"vkCreateBuffer(canvas)");VkMemoryRequirements req;vkGetBufferMemoryRequirements(device,b.handle,&req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};alloc.allocationSize=req.size;alloc.memoryTypeIndex=memoryType(req.memoryTypeBits,flags);
            check(vkAllocateMemory(device,&alloc,nullptr,&b.memory),"vkAllocateMemory(canvas)");check(vkBindBufferMemory(device,b.handle,b.memory,0),"vkBindBufferMemory(canvas)");
        }catch(...){destroy(b);throw;}return b;
    }
    void clear(){destroy(packed);destroy(readback);destroy(thresholds);if(pipeline)vkDestroyPipeline(device,pipeline,nullptr);if(layout)vkDestroyPipelineLayout(device,layout,nullptr);if(sampler)vkDestroySampler(device,sampler,nullptr);if(descriptorPool)vkDestroyDescriptorPool(device,descriptorPool,nullptr);if(setLayout)vkDestroyDescriptorSetLayout(device,setLayout,nullptr);}
public:
    SkyCanvasReadback(VkDevice d,VkPhysicalDevice p):device(d),physical(p){
      VkShaderModule shader{};
      try{
        trace("thresholds");
        // Positive float bit patterns preserve order. Find the first float32
        // whose exact CPU conversion rounds up at each output-byte boundary.
        const auto& table=skyDisplayThresholds();
        thresholds=buffer(sizeof(table),VK_BUFFER_USAGE_STORAGE_BUFFER_BIT,VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
        void* mapped;check(vkMapMemory(device,thresholds.memory,0,thresholds.size,0,&mapped),"vkMapMemory(canvas thresholds)");memcpy(mapped,table.data(),sizeof(table));vkUnmapMemory(device,thresholds.memory);
        VkDescriptorSetLayoutBinding bindings[3]{};for(uint32_t i=0;i<3;i++){bindings[i].binding=i;bindings[i].descriptorType=i?VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;bindings[i].descriptorCount=1;bindings[i].stageFlags=VK_SHADER_STAGE_COMPUTE_BIT;}
        VkDescriptorSetLayoutCreateInfo sl{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};sl.bindingCount=3;sl.pBindings=bindings;check(vkCreateDescriptorSetLayout(device,&sl,nullptr,&setLayout),"vkCreateDescriptorSetLayout(canvas)");
        VkDescriptorPoolSize sizes[]={{VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1},{VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,2}};VkDescriptorPoolCreateInfo dp{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};dp.maxSets=1;dp.poolSizeCount=2;dp.pPoolSizes=sizes;check(vkCreateDescriptorPool(device,&dp,nullptr,&descriptorPool),"vkCreateDescriptorPool(canvas)");
        VkDescriptorSetAllocateInfo ds{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};ds.descriptorPool=descriptorPool;ds.descriptorSetCount=1;ds.pSetLayouts=&setLayout;check(vkAllocateDescriptorSets(device,&ds,&descriptor),"vkAllocateDescriptorSets(canvas)");
        VkPushConstantRange range{VK_SHADER_STAGE_COMPUTE_BIT,0,8};VkPipelineLayoutCreateInfo pl{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};pl.setLayoutCount=1;pl.pSetLayouts=&setLayout;pl.pushConstantRangeCount=1;pl.pPushConstantRanges=&range;check(vkCreatePipelineLayout(device,&pl,nullptr,&layout),"vkCreatePipelineLayout(canvas)");
        trace("compute pipeline");VkShaderModuleCreateInfo sm{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};sm.codeSize=sizeof(canvas_compute);sm.pCode=canvas_compute;check(vkCreateShaderModule(device,&sm,nullptr,&shader),"vkCreateShaderModule(canvas)");
        VkComputePipelineCreateInfo pi{VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO};pi.layout=layout;pi.stage.sType=VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;pi.stage.stage=VK_SHADER_STAGE_COMPUTE_BIT;pi.stage.module=shader;pi.stage.pName="main";check(vkCreateComputePipelines(device,VK_NULL_HANDLE,1,&pi,nullptr,&pipeline),"vkCreateComputePipelines(canvas)");vkDestroyShaderModule(device,shader,nullptr);shader={};
        trace("pipeline ready");VkSamplerCreateInfo si{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};si.magFilter=si.minFilter=VK_FILTER_NEAREST;si.addressModeU=si.addressModeV=si.addressModeW=VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;check(vkCreateSampler(device,&si,nullptr,&sampler),"vkCreateSampler(canvas)");
      }catch(...){if(shader)vkDestroyShaderModule(device,shader,nullptr);clear();throw;}
    }
    ~SkyCanvasReadback(){clear();}
    void record(VkCommandBuffer commands,Image& source,uint32_t w,uint32_t h){
        trace("record");
        if(width!=w||height!=h){destroy(packed);destroy(readback);width=w;height=h;const auto bytes=uint64_t(w)*h*4+4;
            packed=buffer(bytes,VK_BUFFER_USAGE_STORAGE_BUFFER_BIT|VK_BUFFER_USAGE_TRANSFER_SRC_BIT|VK_BUFFER_USAGE_TRANSFER_DST_BIT,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
            readback=buffer(bytes,VK_BUFFER_USAGE_TRANSFER_DST_BIT,VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);}
        VkImageMemoryBarrier image{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};image.image=source.handle;image.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};image.srcQueueFamilyIndex=image.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;image.oldLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;image.newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;image.srcAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;image.dstAccessMask=VK_ACCESS_SHADER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,0,0,nullptr,0,nullptr,1,&image);
        VkDescriptorImageInfo info{sampler,source.view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};VkDescriptorBufferInfo buffers[]={{thresholds.handle,0,thresholds.size},{packed.handle,0,packed.size}};VkWriteDescriptorSet writes[3]{};
        for(uint32_t i=0;i<3;i++){writes[i].sType=VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;writes[i].dstSet=descriptor;writes[i].dstBinding=i;writes[i].descriptorCount=1;writes[i].descriptorType=i?VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;if(i)writes[i].pBufferInfo=&buffers[i-1];else writes[i].pImageInfo=&info;}vkUpdateDescriptorSets(device,3,writes,0,nullptr);
        vkCmdFillBuffer(commands,packed.handle,0,4,0);VkBufferMemoryBarrier barrier{VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER};barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;barrier.buffer=packed.handle;barrier.size=VK_WHOLE_SIZE;barrier.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_SHADER_READ_BIT|VK_ACCESS_SHADER_WRITE_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,0,0,nullptr,1,&barrier,0,nullptr);
        vkCmdBindPipeline(commands,VK_PIPELINE_BIND_POINT_COMPUTE,pipeline);vkCmdBindDescriptorSets(commands,VK_PIPELINE_BIND_POINT_COMPUTE,layout,0,1,&descriptor,0,nullptr);uint32_t size[]={w,h};vkCmdPushConstants(commands,layout,VK_SHADER_STAGE_COMPUTE_BIT,0,8,size);vkCmdDispatch(commands,(w+7)/8,(h+7)/8,1);
        barrier.srcAccessMask=VK_ACCESS_SHADER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_TRANSFER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,1,&barrier,0,nullptr);VkBufferCopy copy{0,0,packed.size};vkCmdCopyBuffer(commands,packed.handle,readback.handle,1,&copy);
        barrier.buffer=readback.handle;barrier.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_HOST_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,0,nullptr,1,&barrier,0,nullptr);
        image.oldLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;image.newLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;image.srcAccessMask=VK_ACCESS_SHADER_READ_BIT;image.dstAccessMask=VK_ACCESS_TRANSFER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,0,nullptr,1,&image);
    }
    std::vector<uint8_t> pixels(){
        trace("read bytes");
        void* mapped;check(vkMapMemory(device,readback.memory,0,readback.size,0,&mapped),"vkMapMemory(canvas bytes)");uint32_t invalid;memcpy(&invalid,mapped,4);
        if(invalid){vkUnmapMemory(device,readback.memory);throw std::runtime_error("Full preview nonfinite final color");}
        std::vector<uint8_t> result(uint64_t(width)*height*4);memcpy(result.data(),static_cast<uint8_t*>(mapped)+4,result.size());vkUnmapMemory(device,readback.memory);return result;
    }
};
