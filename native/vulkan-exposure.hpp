#pragma once

class SkyExposureReadback {
    VkDevice device;VkPhysicalDevice physical;
    VkDescriptorSetLayout setLayout{};VkDescriptorPool descriptorPool{};VkDescriptorSet descriptor{};
    VkPipelineLayout layout{};VkPipeline pipeline{};VkSampler sampler{};
    Buffer samples{},readback{};
    uint32_t memoryType(uint32_t mask,VkMemoryPropertyFlags flags){
        VkPhysicalDeviceMemoryProperties p;vkGetPhysicalDeviceMemoryProperties(physical,&p);
        for(uint32_t i=0;i<p.memoryTypeCount;i++)if((mask&(1u<<i))&&(p.memoryTypes[i].propertyFlags&flags)==flags)return i;
        throw std::runtime_error("Exposure Vulkan memory unavailable");
    }
    void destroy(Buffer& b){if(b.handle)vkDestroyBuffer(device,b.handle,nullptr);if(b.memory)vkFreeMemory(device,b.memory,nullptr);b={};}
    Buffer buffer(VkDeviceSize bytes,VkBufferUsageFlags usage,VkMemoryPropertyFlags flags){
        Buffer b{};b.size=bytes;
        try{VkBufferCreateInfo create{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};create.size=bytes;create.usage=usage;create.sharingMode=VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateBuffer(device,&create,nullptr,&b.handle),"vkCreateBuffer(exposure)");VkMemoryRequirements req;vkGetBufferMemoryRequirements(device,b.handle,&req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};alloc.allocationSize=req.size;alloc.memoryTypeIndex=memoryType(req.memoryTypeBits,flags);
            check(vkAllocateMemory(device,&alloc,nullptr,&b.memory),"vkAllocateMemory(exposure)");check(vkBindBufferMemory(device,b.handle,b.memory,0),"vkBindBufferMemory(exposure)");
        }catch(...){destroy(b);throw;}return b;
    }
    void clear(){destroy(samples);destroy(readback);if(pipeline)vkDestroyPipeline(device,pipeline,nullptr);if(layout)vkDestroyPipelineLayout(device,layout,nullptr);if(sampler)vkDestroySampler(device,sampler,nullptr);if(descriptorPool)vkDestroyDescriptorPool(device,descriptorPool,nullptr);if(setLayout)vkDestroyDescriptorSetLayout(device,setLayout,nullptr);}
public:
    SkyExposureReadback(VkDevice d,VkPhysicalDevice p):device(d),physical(p){
        VkShaderModule shader{};
        try{
            VkDescriptorSetLayoutBinding bindings[2]{};
            for(uint32_t i=0;i<2;i++){bindings[i].binding=i;bindings[i].descriptorType=i?VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;bindings[i].descriptorCount=1;bindings[i].stageFlags=VK_SHADER_STAGE_COMPUTE_BIT;}
            VkDescriptorSetLayoutCreateInfo sl{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};sl.bindingCount=2;sl.pBindings=bindings;check(vkCreateDescriptorSetLayout(device,&sl,nullptr,&setLayout),"vkCreateDescriptorSetLayout(exposure)");
            VkDescriptorPoolSize sizes[]={{VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1},{VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,1}};
            VkDescriptorPoolCreateInfo dp{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};dp.maxSets=1;dp.poolSizeCount=2;dp.pPoolSizes=sizes;check(vkCreateDescriptorPool(device,&dp,nullptr,&descriptorPool),"vkCreateDescriptorPool(exposure)");
            VkDescriptorSetAllocateInfo ds{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};ds.descriptorPool=descriptorPool;ds.descriptorSetCount=1;ds.pSetLayouts=&setLayout;check(vkAllocateDescriptorSets(device,&ds,&descriptor),"vkAllocateDescriptorSets(exposure)");
            VkPushConstantRange range{VK_SHADER_STAGE_COMPUTE_BIT,0,12};VkPipelineLayoutCreateInfo pl{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};pl.setLayoutCount=1;pl.pSetLayouts=&setLayout;pl.pushConstantRangeCount=1;pl.pPushConstantRanges=&range;check(vkCreatePipelineLayout(device,&pl,nullptr,&layout),"vkCreatePipelineLayout(exposure)");
            VkShaderModuleCreateInfo sm{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};sm.codeSize=sizeof(exposure_compute);sm.pCode=exposure_compute;check(vkCreateShaderModule(device,&sm,nullptr,&shader),"vkCreateShaderModule(exposure)");
            VkComputePipelineCreateInfo pi{VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO};pi.layout=layout;pi.stage.sType=VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;pi.stage.stage=VK_SHADER_STAGE_COMPUTE_BIT;pi.stage.module=shader;pi.stage.pName="main";check(vkCreateComputePipelines(device,VK_NULL_HANDLE,1,&pi,nullptr,&pipeline),"vkCreateComputePipelines(exposure)");vkDestroyShaderModule(device,shader,nullptr);shader={};
            VkSamplerCreateInfo si{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};si.magFilter=si.minFilter=VK_FILTER_NEAREST;si.addressModeU=si.addressModeV=si.addressModeW=VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;check(vkCreateSampler(device,&si,nullptr,&sampler),"vkCreateSampler(exposure)");
        }catch(...){if(shader)vkDestroyShaderModule(device,shader,nullptr);clear();throw;}
    }
    ~SkyExposureReadback(){clear();}
    void record(VkCommandBuffer commands,Image& source,uint32_t w,uint32_t step,uint32_t count){
        const auto bytes=uint64_t(count)*8;
        if(samples.size<bytes){destroy(samples);destroy(readback);
            samples=buffer(bytes,VK_BUFFER_USAGE_STORAGE_BUFFER_BIT|VK_BUFFER_USAGE_TRANSFER_SRC_BIT,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
            readback=buffer(bytes,VK_BUFFER_USAGE_TRANSFER_DST_BIT,VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);}
        VkDescriptorImageInfo info{sampler,source.view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};VkDescriptorBufferInfo data{samples.handle,0,samples.size};VkWriteDescriptorSet writes[2]{};
        for(uint32_t i=0;i<2;i++){writes[i].sType=VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;writes[i].dstSet=descriptor;writes[i].dstBinding=i;writes[i].descriptorCount=1;writes[i].descriptorType=i?VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;if(i)writes[i].pBufferInfo=&data;else writes[i].pImageInfo=&info;}vkUpdateDescriptorSets(device,2,writes,0,nullptr);
        VkImageMemoryBarrier image{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};image.image=source.handle;image.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};image.srcQueueFamilyIndex=image.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;image.oldLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;image.newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;image.srcAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;image.dstAccessMask=VK_ACCESS_SHADER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,0,0,nullptr,0,nullptr,1,&image);
        vkCmdBindPipeline(commands,VK_PIPELINE_BIND_POINT_COMPUTE,pipeline);vkCmdBindDescriptorSets(commands,VK_PIPELINE_BIND_POINT_COMPUTE,layout,0,1,&descriptor,0,nullptr);uint32_t size[]={w,step,count};vkCmdPushConstants(commands,layout,VK_SHADER_STAGE_COMPUTE_BIT,0,12,size);vkCmdDispatch(commands,(count+63)/64,1,1);
        VkBufferMemoryBarrier barrier{VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER};barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;barrier.buffer=samples.handle;barrier.size=VK_WHOLE_SIZE;barrier.srcAccessMask=VK_ACCESS_SHADER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_TRANSFER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,1,&barrier,0,nullptr);
        VkBufferCopy copy{0,0,bytes};vkCmdCopyBuffer(commands,samples.handle,readback.handle,1,&copy);barrier.buffer=readback.handle;barrier.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_HOST_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,0,nullptr,1,&barrier,0,nullptr);
        image.oldLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;image.newLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;image.srcAccessMask=VK_ACCESS_SHADER_READ_BIT;image.dstAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT|VK_ACCESS_TRANSFER_READ_BIT;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT|VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,0,nullptr,1,&image);
    }
    const Buffer& result()const{return readback;}
};
