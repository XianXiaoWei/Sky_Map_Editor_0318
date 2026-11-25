#pragma once
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
#ifdef SKY_ANDROID_SURFACE
#include "../android/vulkan-surface.hpp"
#elif defined(SKY_WIN32_SURFACE)
#include "vulkan-win32-window.hpp"
#else
#include <xcb/xcb.h>
#include <cstdlib>
struct SkyTestWindow { xcb_connection_t* connection{}; xcb_window_t window{}; };
struct SkyWindowSnapshot { SkyTestWindow* handle{}; uint64_t generation{}; };
static SkyWindowSnapshot skyAcquireWindow() {
    static SkyTestWindow window=[](){
        SkyTestWindow value;value.connection=xcb_connect(nullptr,nullptr);
        if(xcb_connection_has_error(value.connection))throw std::runtime_error("XCB test display unavailable");
        auto* screen=xcb_setup_roots_iterator(xcb_get_setup(value.connection)).data;
        value.window=xcb_generate_id(value.connection);uint32_t black=screen->black_pixel;
        xcb_create_window(value.connection,XCB_COPY_FROM_PARENT,value.window,screen->root,0,0,320,180,0,XCB_WINDOW_CLASS_INPUT_OUTPUT,screen->root_visual,XCB_CW_BACK_PIXEL,&black);
        xcb_map_window(value.connection,value.window);xcb_flush(value.connection);return value;
    }();
    return {&window,1};
}
static void skyReleaseWindow(SkyWindowSnapshot& value) { value={}; }
static void skyUpdateViewport(int32_t,int32_t,uint32_t width,uint32_t height,bool visible){
    auto current=skyAcquireWindow();auto* window=current.handle;uint32_t sizes[]={std::max(1u,width),std::max(1u,height)};xcb_configure_window(window->connection,window->window,XCB_CONFIG_WINDOW_WIDTH|XCB_CONFIG_WINDOW_HEIGHT,sizes);if(visible&&width&&height)xcb_map_window(window->connection,window->window);else xcb_unmap_window(window->connection,window->window);xcb_flush(window->connection);
}
#endif

/** Owns the Android window, swapchain and final display pass. All Vulkan calls
 * run on the renderer thread. Surface callbacks only replace a retained window. */
class SkySurfacePresenter {
    VkInstance instance;VkPhysicalDevice physical;VkDevice device;VkQueue queue;uint32_t family;
    SkyWindowSnapshot window{};VkSurfaceKHR surface{};VkSwapchainKHR swapchain{};
    VkExtent2D extent{};VkFormat format{};VkRenderPass pass{};VkPipeline pipeline{};VkPipelineLayout layout{};
    VkDescriptorSetLayout setLayout{};VkDescriptorPool descriptorPool{};VkDescriptorSet descriptor{};VkSampler sampler{};
    VkSemaphore acquired{};std::vector<VkSemaphore> finished;std::vector<VkImageView> views;std::vector<VkFramebuffer> framebuffers;
    uint32_t imageIndex{};bool srgb{};
    void clearSwapchain() {
        for(auto framebuffer:framebuffers)vkDestroyFramebuffer(device,framebuffer,nullptr);framebuffers.clear();
        for(auto view:views)vkDestroyImageView(device,view,nullptr);views.clear();
        for(auto semaphore:finished)vkDestroySemaphore(device,semaphore,nullptr);finished.clear();
        if(pipeline)vkDestroyPipeline(device,pipeline,nullptr);pipeline={};
        if(pass)vkDestroyRenderPass(device,pass,nullptr);pass={};
        if(swapchain)vkDestroySwapchainKHR(device,swapchain,nullptr);swapchain={};extent={};
    }
    VkShaderModule shader(const uint32_t* code,size_t size) {
        VkShaderModuleCreateInfo info{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};info.codeSize=size;info.pCode=code;
        VkShaderModule result;check(vkCreateShaderModule(device,&info,nullptr,&result),"vkCreateShaderModule(present)");return result;
    }
    void createSwapchain(const VkSurfaceCapabilitiesKHR& caps) {
        uint32_t count=0;check(vkGetPhysicalDeviceSurfaceFormatsKHR(physical,surface,&count,nullptr),"vkGetPhysicalDeviceSurfaceFormatsKHR");
        std::vector<VkSurfaceFormatKHR> formats(count);check(vkGetPhysicalDeviceSurfaceFormatsKHR(physical,surface,&count,formats.data()),"vkGetPhysicalDeviceSurfaceFormatsKHR");
        if(formats.empty())throw std::runtime_error("No surface formats");
        auto chosen=formats.front();
        for(const auto& candidate:formats)if(candidate.colorSpace==VK_COLOR_SPACE_SRGB_NONLINEAR_KHR&&(candidate.format==VK_FORMAT_R8G8B8A8_SRGB||candidate.format==VK_FORMAT_B8G8R8A8_SRGB)){chosen=candidate;break;}
        if(chosen.format==VK_FORMAT_UNDEFINED)chosen.format=VK_FORMAT_B8G8R8A8_UNORM;
        format=chosen.format;srgb=format==VK_FORMAT_R8G8B8A8_SRGB||format==VK_FORMAT_B8G8R8A8_SRGB;
        extent=caps.currentExtent;
        if(extent.width==UINT32_MAX){
#ifdef SKY_ANDROID_SURFACE
            extent={uint32_t(std::max(1,ANativeWindow_getWidth(window.handle))),uint32_t(std::max(1,ANativeWindow_getHeight(window.handle)))};
#elif defined(SKY_WIN32_SURFACE)
            RECT bounds{};GetClientRect(window.handle,&bounds);extent={uint32_t(std::max(1L,bounds.right)),uint32_t(std::max(1L,bounds.bottom))};
#else
            extent={320,180};
#endif
            extent.width=std::clamp(extent.width,caps.minImageExtent.width,caps.maxImageExtent.width);extent.height=std::clamp(extent.height,caps.minImageExtent.height,caps.maxImageExtent.height);
        }
        uint32_t images=std::max(caps.minImageCount,3u);if(caps.maxImageCount)images=std::min(images,caps.maxImageCount);
        VkCompositeAlphaFlagBitsKHR opacity=VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
        if(!(caps.supportedCompositeAlpha&opacity))for(auto option:{VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR,VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR,VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR})if(caps.supportedCompositeAlpha&option){opacity=option;break;}
        // The editor projection uses window coordinates. Let Android compose
        // display rotation instead of claiming that pixels are already rotated.
        const auto transform=(caps.supportedTransforms&VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR)?VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR:caps.currentTransform;
        VkPresentModeKHR mode=VK_PRESENT_MODE_FIFO_KHR;
#ifdef SKY_WIN32_SURFACE
        // MAILBOX renders independently of monitor refresh while presenting
        // the latest completed image. Prefer it over tearing IMMEDIATE mode.
        uint32_t modesCount=0;check(vkGetPhysicalDeviceSurfacePresentModesKHR(physical,surface,&modesCount,nullptr),"vkGetPhysicalDeviceSurfacePresentModesKHR");std::vector<VkPresentModeKHR> modes(modesCount);check(vkGetPhysicalDeviceSurfacePresentModesKHR(physical,surface,&modesCount,modes.data()),"vkGetPhysicalDeviceSurfacePresentModesKHR");
        if(std::find(modes.begin(),modes.end(),VK_PRESENT_MODE_MAILBOX_KHR)!=modes.end())mode=VK_PRESENT_MODE_MAILBOX_KHR;
#endif
        VkSwapchainCreateInfoKHR info{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};info.surface=surface;info.minImageCount=images;info.imageFormat=format;info.imageColorSpace=chosen.colorSpace;info.imageExtent=extent;info.imageArrayLayers=1;info.imageUsage=VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;info.imageSharingMode=VK_SHARING_MODE_EXCLUSIVE;info.preTransform=transform;info.compositeAlpha=opacity;info.presentMode=mode;info.clipped=VK_TRUE;
        check(vkCreateSwapchainKHR(device,&info,nullptr,&swapchain),"vkCreateSwapchainKHR");
        VkAttachmentDescription attachment{};attachment.format=format;attachment.samples=VK_SAMPLE_COUNT_1_BIT;attachment.loadOp=VK_ATTACHMENT_LOAD_OP_DONT_CARE;attachment.storeOp=VK_ATTACHMENT_STORE_OP_STORE;attachment.initialLayout=VK_IMAGE_LAYOUT_UNDEFINED;attachment.finalLayout=VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
        VkAttachmentReference color{0,VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL};VkSubpassDescription sub{};sub.pipelineBindPoint=VK_PIPELINE_BIND_POINT_GRAPHICS;sub.colorAttachmentCount=1;sub.pColorAttachments=&color;
        VkSubpassDependency dependency{};dependency.srcSubpass=VK_SUBPASS_EXTERNAL;dependency.dstSubpass=0;dependency.srcStageMask=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;dependency.dstStageMask=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;dependency.dstAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
        VkRenderPassCreateInfo rp{VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO};rp.attachmentCount=1;rp.pAttachments=&attachment;rp.subpassCount=1;rp.pSubpasses=&sub;rp.dependencyCount=1;rp.pDependencies=&dependency;check(vkCreateRenderPass(device,&rp,nullptr,&pass),"vkCreateRenderPass(present)");
        auto vert=shader(present_vertex,sizeof(present_vertex)),frag=shader(present_fragment,sizeof(present_fragment));
        VkPipelineShaderStageCreateInfo stages[2]{};for(auto& stage:stages){stage.sType=VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;stage.pName="main";}stages[0].stage=VK_SHADER_STAGE_VERTEX_BIT;stages[0].module=vert;stages[1].stage=VK_SHADER_STAGE_FRAGMENT_BIT;stages[1].module=frag;
        VkPipelineVertexInputStateCreateInfo vertex{VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO};VkPipelineInputAssemblyStateCreateInfo assembly{VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO};assembly.topology=VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
        VkPipelineViewportStateCreateInfo viewport{VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO};viewport.viewportCount=viewport.scissorCount=1;
        VkPipelineRasterizationStateCreateInfo raster{VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO};raster.polygonMode=VK_POLYGON_MODE_FILL;raster.cullMode=VK_CULL_MODE_NONE;raster.frontFace=VK_FRONT_FACE_COUNTER_CLOCKWISE;raster.lineWidth=1;
        VkPipelineMultisampleStateCreateInfo samples{VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO};samples.rasterizationSamples=VK_SAMPLE_COUNT_1_BIT;
        VkPipelineColorBlendAttachmentState blend{};blend.colorWriteMask=15;VkPipelineColorBlendStateCreateInfo blending{VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO};blending.attachmentCount=1;blending.pAttachments=&blend;
        VkDynamicState dynamicStates[]={VK_DYNAMIC_STATE_VIEWPORT,VK_DYNAMIC_STATE_SCISSOR};VkPipelineDynamicStateCreateInfo dynamic{VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO};dynamic.dynamicStateCount=2;dynamic.pDynamicStates=dynamicStates;
        VkGraphicsPipelineCreateInfo p{VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO};p.stageCount=2;p.pStages=stages;p.pVertexInputState=&vertex;p.pInputAssemblyState=&assembly;p.pViewportState=&viewport;p.pRasterizationState=&raster;p.pMultisampleState=&samples;p.pColorBlendState=&blending;p.pDynamicState=&dynamic;p.layout=layout;p.renderPass=pass;
        auto result=vkCreateGraphicsPipelines(device,VK_NULL_HANDLE,1,&p,nullptr,&pipeline);vkDestroyShaderModule(device,vert,nullptr);vkDestroyShaderModule(device,frag,nullptr);check(result,"vkCreateGraphicsPipelines(present)");
        check(vkGetSwapchainImagesKHR(device,swapchain,&count,nullptr),"vkGetSwapchainImagesKHR");std::vector<VkImage> handles(count);check(vkGetSwapchainImagesKHR(device,swapchain,&count,handles.data()),"vkGetSwapchainImagesKHR");
        for(auto handle:handles){VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};view.image=handle;view.viewType=VK_IMAGE_VIEW_TYPE_2D;view.format=format;view.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};VkImageView v;check(vkCreateImageView(device,&view,nullptr,&v),"vkCreateImageView(swapchain)");views.push_back(v);VkFramebufferCreateInfo fb{VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO};fb.renderPass=pass;fb.attachmentCount=1;fb.pAttachments=&views.back();fb.width=extent.width;fb.height=extent.height;fb.layers=1;VkFramebuffer f;check(vkCreateFramebuffer(device,&fb,nullptr,&f),"vkCreateFramebuffer(swapchain)");framebuffers.push_back(f);VkSemaphoreCreateInfo s{VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO};VkSemaphore semaphore;check(vkCreateSemaphore(device,&s,nullptr,&semaphore),"vkCreateSemaphore(present)");finished.push_back(semaphore);}
    }
public:
    SkySurfacePresenter(VkInstance i,VkPhysicalDevice p,VkDevice d,VkQueue q,uint32_t f):instance(i),physical(p),device(d),queue(q),family(f) {
        VkDescriptorSetLayoutBinding binding{0,VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1,VK_SHADER_STAGE_FRAGMENT_BIT,nullptr};VkDescriptorSetLayoutCreateInfo sl{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};sl.bindingCount=1;sl.pBindings=&binding;check(vkCreateDescriptorSetLayout(device,&sl,nullptr,&setLayout),"vkCreateDescriptorSetLayout(present)");
        VkPushConstantRange range{VK_SHADER_STAGE_FRAGMENT_BIT,0,16};VkPipelineLayoutCreateInfo l{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};l.setLayoutCount=1;l.pSetLayouts=&setLayout;l.pushConstantRangeCount=1;l.pPushConstantRanges=&range;check(vkCreatePipelineLayout(device,&l,nullptr,&layout),"vkCreatePipelineLayout(present)");
        VkDescriptorPoolSize size{VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1};VkDescriptorPoolCreateInfo dp{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};dp.maxSets=1;dp.poolSizeCount=1;dp.pPoolSizes=&size;check(vkCreateDescriptorPool(device,&dp,nullptr,&descriptorPool),"vkCreateDescriptorPool(present)");VkDescriptorSetAllocateInfo a{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};a.descriptorPool=descriptorPool;a.descriptorSetCount=1;a.pSetLayouts=&setLayout;check(vkAllocateDescriptorSets(device,&a,&descriptor),"vkAllocateDescriptorSets(present)");
        VkFormatProperties fp;vkGetPhysicalDeviceFormatProperties(physical,VK_FORMAT_R32G32B32A32_SFLOAT,&fp);VkSamplerCreateInfo s{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};s.magFilter=s.minFilter=fp.optimalTilingFeatures&VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT?VK_FILTER_LINEAR:VK_FILTER_NEAREST;s.addressModeU=s.addressModeV=s.addressModeW=VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;check(vkCreateSampler(device,&s,nullptr,&sampler),"vkCreateSampler(present)");VkSemaphoreCreateInfo sem{VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO};check(vkCreateSemaphore(device,&sem,nullptr,&acquired),"vkCreateSemaphore(acquire)");
    }
    ~SkySurfacePresenter(){vkDeviceWaitIdle(device);clearSwapchain();if(surface)vkDestroySurfaceKHR(instance,surface,nullptr);skyReleaseWindow(window);vkDestroySemaphore(device,acquired,nullptr);vkDestroySampler(device,sampler,nullptr);vkDestroyDescriptorPool(device,descriptorPool,nullptr);vkDestroyPipelineLayout(device,layout,nullptr);vkDestroyDescriptorSetLayout(device,setLayout,nullptr);}
    bool acquire() {
        auto next=skyAcquireWindow();
        if(next.generation!=window.generation){vkDeviceWaitIdle(device);clearSwapchain();if(surface)vkDestroySurfaceKHR(instance,surface,nullptr);surface={};skyReleaseWindow(window);window=next;next={};
            if(window.handle){
#ifdef SKY_ANDROID_SURFACE
                VkAndroidSurfaceCreateInfoKHR s{VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR};s.window=window.handle;check(vkCreateAndroidSurfaceKHR(instance,&s,nullptr,&surface),"vkCreateAndroidSurfaceKHR");
#elif defined(SKY_WIN32_SURFACE)
                VkWin32SurfaceCreateInfoKHR s{VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR};s.hinstance=GetModuleHandleW(nullptr);s.hwnd=window.handle;check(vkCreateWin32SurfaceKHR(instance,&s,nullptr,&surface),"vkCreateWin32SurfaceKHR");
#else
                VkXcbSurfaceCreateInfoKHR s{VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR};s.connection=window.handle->connection;s.window=window.handle->window;check(vkCreateXcbSurfaceKHR(instance,&s,nullptr,&surface),"vkCreateXcbSurfaceKHR");
#endif
                VkBool32 supported;check(vkGetPhysicalDeviceSurfaceSupportKHR(physical,family,surface,&supported),"vkGetPhysicalDeviceSurfaceSupportKHR");if(!supported)throw std::runtime_error("Graphics queue cannot present to this surface");
            }
        }skyReleaseWindow(next);if(!surface)return false;
        VkSurfaceCapabilitiesKHR caps{};auto result=vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical,surface,&caps);if(result==VK_ERROR_SURFACE_LOST_KHR)return false;check(result,"vkGetPhysicalDeviceSurfaceCapabilitiesKHR");if(!caps.currentExtent.width||!caps.currentExtent.height)return false;
        if(swapchain&&caps.currentExtent.width!=UINT32_MAX&&(caps.currentExtent.width!=extent.width||caps.currentExtent.height!=extent.height)){vkDeviceWaitIdle(device);clearSwapchain();}
        if(!swapchain)createSwapchain(caps);
        result=vkAcquireNextImageKHR(device,swapchain,UINT64_MAX,acquired,VK_NULL_HANDLE,&imageIndex);
        if(result==VK_ERROR_OUT_OF_DATE_KHR||result==VK_ERROR_SURFACE_LOST_KHR){vkDeviceWaitIdle(device);clearSwapchain();return false;}if(result!=VK_SUBOPTIMAL_KHR)check(result,"vkAcquireNextImageKHR");return true;
    }
    void record(VkCommandBuffer command,Image& source,uint32_t w,uint32_t h,bool antialias=true) {
        VkImageMemoryBarrier b{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};b.image=source.handle;b.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};b.srcQueueFamilyIndex=b.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;b.oldLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;b.newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;b.srcAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;b.dstAccessMask=VK_ACCESS_SHADER_READ_BIT;vkCmdPipelineBarrier(command,VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,0,0,nullptr,0,nullptr,1,&b);
        VkDescriptorImageInfo image{sampler,source.view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};write.dstSet=descriptor;write.descriptorCount=1;write.descriptorType=VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;write.pImageInfo=&image;vkUpdateDescriptorSets(device,1,&write,0,nullptr);
        VkRenderPassBeginInfo rp{VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO};rp.renderPass=pass;rp.framebuffer=framebuffers[imageIndex];rp.renderArea.extent=extent;vkCmdBeginRenderPass(command,&rp,VK_SUBPASS_CONTENTS_INLINE);VkViewport viewport{0,0,float(extent.width),float(extent.height),0,1};VkRect2D scissor{{0,0},extent};vkCmdSetViewport(command,0,1,&viewport);vkCmdSetScissor(command,0,1,&scissor);vkCmdBindPipeline(command,VK_PIPELINE_BIND_POINT_GRAPHICS,pipeline);vkCmdBindDescriptorSets(command,VK_PIPELINE_BIND_POINT_GRAPHICS,layout,0,1,&descriptor,0,nullptr);
        struct {float texel[2];uint32_t encode,antialias;} settings{{1.f/w,1.f/h},uint32_t(!srgb),uint32_t(antialias)};
#ifdef SKY_XCB_SURFACE_TEST
        if(std::getenv("SKY_SURFACE_TEST_NO_AA"))settings.antialias=0;
#endif
        vkCmdPushConstants(command,layout,VK_SHADER_STAGE_FRAGMENT_BIT,0,sizeof(settings),&settings);vkCmdDraw(command,3,1,0,0);vkCmdEndRenderPass(command);
    }
    VkSemaphore acquireSemaphore() const{return acquired;}
    VkSemaphore presentSemaphore() const{return finished[imageIndex];}
    bool present(){auto done=finished[imageIndex];VkPresentInfoKHR info{VK_STRUCTURE_TYPE_PRESENT_INFO_KHR};info.waitSemaphoreCount=1;info.pWaitSemaphores=&done;info.swapchainCount=1;info.pSwapchains=&swapchain;info.pImageIndices=&imageIndex;auto result=vkQueuePresentKHR(queue,&info);if(result==VK_ERROR_OUT_OF_DATE_KHR||result==VK_ERROR_SURFACE_LOST_KHR){vkDeviceWaitIdle(device);clearSwapchain();return false;}if(result!=VK_SUBOPTIMAL_KHR)check(result,"vkQueuePresentKHR");return true;}
#ifdef SKY_XCB_SURFACE_TEST
    void capture(){
        const char* file=std::getenv("SKY_SURFACE_CAPTURE");if(!file||!window.handle)return;
        auto cookie=xcb_get_image(window.handle->connection,XCB_IMAGE_FORMAT_Z_PIXMAP,window.handle->window,0,0,extent.width,extent.height,UINT32_MAX);auto* result=xcb_get_image_reply(window.handle->connection,cookie,nullptr);if(!result)return;
        auto* bytes=xcb_get_image_data(result);std::vector<uint8_t> rgba(uint64_t(extent.width)*extent.height*4);if(xcb_get_image_data_length(result)>=int(rgba.size())){for(size_t i=0;i<rgba.size();i+=4){rgba[i]=bytes[i+2];rgba[i+1]=bytes[i+1];rgba[i+2]=bytes[i];rgba[i+3]=255;}auto* output=fopen(file,"wb");if(output){fwrite(rgba.data(),1,rgba.size(),output);fclose(output);}}free(result);
    }
#endif
};
#endif
