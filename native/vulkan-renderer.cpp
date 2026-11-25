#include <vulkan/vulkan.h>
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#ifdef _WIN32
#include <fcntl.h>
#include <io.h>
#else
#include <unistd.h>
#endif
#include "diagnostic_spirv.hpp"

static void check(VkResult result, const char* operation) {
    if (result != VK_SUCCESS) throw std::runtime_error(std::string(operation) + ": VkResult " + std::to_string(result));
}
struct Buffer { VkBuffer handle{}; VkDeviceMemory memory{}; VkDeviceSize size{}; };
struct Image { VkImage handle{}; VkDeviceMemory memory{}; VkImageView view{}; };
struct Vertex { float position[3]; float color[4]; };
struct Draw { uint32_t first, count, state, mode; };
static_assert(sizeof(Vertex) == 28 && sizeof(Draw) == 16, "Protocol layouts");
#include "vulkan-canvas.hpp"
#include "vulkan-exposure.hpp"
#include "vulkan-material.hpp"
#include "vulkan-presenter.hpp"

class Renderer {
    VkInstance instance{};
    VkPhysicalDevice physical{};
    VkDevice device{};
    VkQueue queue{};
    uint32_t queueFamily{};
    VkCommandPool pool{};
    VkCommandBuffer commands{};
    VkFence fence{};
    bool framePending=false;
    VkRenderPass pass{};
    VkPipelineLayout layout{};
    VkPipelineCache pipelineCache{};
    std::array<VkPipeline, 8> pipelines{};
    Image color{}, depth{};
    VkFramebuffer framebuffer{};
    Buffer readback{}, vertices{};
    std::vector<Draw> draws;
    uint32_t vertexCount{}, width{}, height{};
    VkPhysicalDeviceProperties properties{};
#include "vulkan-frame-profile.hpp"
    bool shaderFloat16{};
    bool queueSupportsCompute{};
    std::unique_ptr<SkyCanvasReadback> canvas;
    std::unique_ptr<SkyExposureReadback> exposureMeter;
    bool gpuExposureGather()const{return queueSupportsCompute&&!(std::getenv("SKY_FULL_METER_COPY_REFERENCE")&&std::strcmp(std::getenv("SKY_FULL_METER_COPY_REFERENCE"),"1")==0)&&(properties.deviceType!=VK_PHYSICAL_DEVICE_TYPE_CPU||(std::getenv("SKY_FULL_GPU_METER")&&std::strcmp(std::getenv("SKY_FULL_GPU_METER"),"1")==0));}
    bool cpuCanvasReference()const{return std::getenv("SKY_CANVAS_CPU_REFERENCE")&&std::strcmp(std::getenv("SKY_CANVAS_CPU_REFERENCE"),"1")==0;}
    bool gpuCanvasPacking()const{return queueSupportsCompute&&!cpuCanvasReference()&&(properties.deviceType!=VK_PHYSICAL_DEVICE_TYPE_CPU||(std::getenv("SKY_CANVAS_GPU_PACKING")&&std::strcmp(std::getenv("SKY_CANVAS_GPU_PACKING"),"1")==0));}
    std::shared_ptr<SkyTextureCache> textureCache=std::make_shared<SkyTextureCache>();
    std::shared_ptr<MaterialRenderer> materials;
    std::unordered_map<uint32_t,std::shared_ptr<MaterialRenderer>> materialCache;
    std::unique_ptr<MaterialRenderer> core;
    std::unique_ptr<MaterialRenderer> background;
    std::unique_ptr<MaterialRenderer> foreground;
    std::unique_ptr<MaterialRenderer> items;
    std::unique_ptr<MaterialRenderer> alpha;
    std::unique_ptr<MaterialRenderer> fastFog,fastTone;
    std::array<uint32_t,4> fastBindings{};
    std::vector<float> capturedRadiance;
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
    std::unique_ptr<SkySurfacePresenter> presenter;
    bool lastPresented{};
#endif

    uint32_t memoryType(uint32_t mask, VkMemoryPropertyFlags flags) {
        VkPhysicalDeviceMemoryProperties p; vkGetPhysicalDeviceMemoryProperties(physical, &p);
        for (uint32_t i = 0; i < p.memoryTypeCount; i++) if ((mask & (1u << i)) && (p.memoryTypes[i].propertyFlags & flags) == flags) return i;
        throw std::runtime_error("Vulkan memory type unavailable");
    }
    void destroy(Buffer& b) { if (b.handle) vkDestroyBuffer(device, b.handle, nullptr); if (b.memory) vkFreeMemory(device, b.memory, nullptr); b = {}; }
    void destroy(Image& i) { if (i.view) vkDestroyImageView(device, i.view, nullptr); if (i.handle) vkDestroyImage(device, i.handle, nullptr); if (i.memory) vkFreeMemory(device, i.memory, nullptr); i = {}; }
    Buffer buffer(VkDeviceSize size, VkBufferUsageFlags usage) {
        Buffer b{}; b.size = std::max<VkDeviceSize>(size, 4);
        try {
            VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO}; info.size = b.size; info.usage = usage; info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateBuffer(device, &info, nullptr, &b.handle), "vkCreateBuffer");
            VkMemoryRequirements req; vkGetBufferMemoryRequirements(device, b.handle, &req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO}; alloc.allocationSize = req.size;
            alloc.memoryTypeIndex = memoryType(req.memoryTypeBits, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
            check(vkAllocateMemory(device, &alloc, nullptr, &b.memory), "vkAllocateMemory(buffer)");
            check(vkBindBufferMemory(device, b.handle, b.memory, 0), "vkBindBufferMemory");
        } catch (...) { destroy(b); throw; }
        return b;
    }
    Image image(uint32_t w, uint32_t h, VkFormat format, VkImageUsageFlags usage, VkImageAspectFlags aspect) {
        Image i{};
        try {
            VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO}; info.imageType = VK_IMAGE_TYPE_2D; info.format = format;
            info.extent = {w, h, 1}; info.mipLevels = 1; info.arrayLayers = 1; info.samples = VK_SAMPLE_COUNT_1_BIT;
            info.tiling = VK_IMAGE_TILING_OPTIMAL; info.usage = usage; info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateImage(device, &info, nullptr, &i.handle), "vkCreateImage");
            VkMemoryRequirements req; vkGetImageMemoryRequirements(device, i.handle, &req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO}; alloc.allocationSize = req.size; alloc.memoryTypeIndex = memoryType(req.memoryTypeBits, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
            check(vkAllocateMemory(device, &alloc, nullptr, &i.memory), "vkAllocateMemory(image)");
            check(vkBindImageMemory(device, i.handle, i.memory, 0), "vkBindImageMemory");
            VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO}; view.image = i.handle; view.viewType = VK_IMAGE_VIEW_TYPE_2D; view.format = format;
            view.subresourceRange = {aspect, 0, 1, 0, 1}; check(vkCreateImageView(device, &view, nullptr, &i.view), "vkCreateImageView");
        } catch (...) { destroy(i); throw; }
        return i;
    }
    VkShaderModule shader(const uint32_t* code, size_t bytes) {
        VkShaderModuleCreateInfo info{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO}; info.pCode = code; info.codeSize = bytes;
        VkShaderModule module; check(vkCreateShaderModule(device, &info, nullptr, &module), "vkCreateShaderModule"); return module;
    }
    void createPass() {
        VkAttachmentDescription attachments[2]{};
        attachments[0].format = VK_FORMAT_R32G32B32A32_SFLOAT; attachments[0].samples = VK_SAMPLE_COUNT_1_BIT;
        attachments[0].loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR; attachments[0].storeOp = VK_ATTACHMENT_STORE_OP_STORE;
        attachments[0].stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE; attachments[0].stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
        attachments[0].initialLayout = VK_IMAGE_LAYOUT_UNDEFINED; attachments[0].finalLayout = VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
        attachments[1] = attachments[0]; attachments[1].format = VK_FORMAT_D32_SFLOAT; attachments[1].storeOp = VK_ATTACHMENT_STORE_OP_STORE;
        attachments[1].finalLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        VkAttachmentReference c{0, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL}, d{1, VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL};
        VkSubpassDescription sub{}; sub.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS; sub.colorAttachmentCount = 1; sub.pColorAttachments = &c; sub.pDepthStencilAttachment = &d;
        VkSubpassDependency dependencies[2]{};
        dependencies[0].srcSubpass = VK_SUBPASS_EXTERNAL; dependencies[0].dstSubpass = 0;
        dependencies[0].srcStageMask = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
        dependencies[0].dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT | VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT;
        dependencies[0].dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT | VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT;
        dependencies[1].srcSubpass = 0; dependencies[1].dstSubpass = VK_SUBPASS_EXTERNAL;
        dependencies[1].srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; dependencies[1].dstStageMask = VK_PIPELINE_STAGE_TRANSFER_BIT;
        dependencies[1].srcAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT; dependencies[1].dstAccessMask = VK_ACCESS_TRANSFER_READ_BIT;
        VkRenderPassCreateInfo info{VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO}; info.attachmentCount = 2; info.pAttachments = attachments; info.subpassCount = 1; info.pSubpasses = &sub;
        info.dependencyCount = 2; info.pDependencies = dependencies; check(vkCreateRenderPass(device, &info, nullptr, &pass), "vkCreateRenderPass");
    }
    void createPipelines() {
        VkPushConstantRange range{VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, 0, 72};
        VkPipelineLayoutCreateInfo li{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO}; li.pushConstantRangeCount = 1; li.pPushConstantRanges = &range;
        check(vkCreatePipelineLayout(device, &li, nullptr, &layout), "vkCreatePipelineLayout");
        VkShaderModule vs = shader(diagnostic_vertex, sizeof(diagnostic_vertex)), fs = shader(diagnostic_fragment, sizeof(diagnostic_fragment));
        try {
            VkPipelineShaderStageCreateInfo stages[2]{};
            for (auto& s : stages) { s.sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO; s.pName = "main"; }
            stages[0].stage = VK_SHADER_STAGE_VERTEX_BIT; stages[0].module = vs; stages[1].stage = VK_SHADER_STAGE_FRAGMENT_BIT; stages[1].module = fs;
            VkVertexInputBindingDescription binding{0, sizeof(Vertex), VK_VERTEX_INPUT_RATE_VERTEX};
            VkVertexInputAttributeDescription attrs[] = {{0, 0, VK_FORMAT_R32G32B32_SFLOAT, 0}, {1, 0, VK_FORMAT_R32G32B32A32_SFLOAT, 12}};
            VkPipelineVertexInputStateCreateInfo vertex{VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO}; vertex.vertexBindingDescriptionCount = 1; vertex.pVertexBindingDescriptions = &binding; vertex.vertexAttributeDescriptionCount = 2; vertex.pVertexAttributeDescriptions = attrs;
            VkPipelineInputAssemblyStateCreateInfo assembly{VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO}; assembly.topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
            VkPipelineViewportStateCreateInfo viewport{VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO}; viewport.viewportCount = 1; viewport.scissorCount = 1;
            VkPipelineRasterizationStateCreateInfo raster{VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO}; raster.polygonMode = VK_POLYGON_MODE_FILL;
            raster.cullMode = VK_CULL_MODE_BACK_BIT; raster.frontFace = VK_FRONT_FACE_COUNTER_CLOCKWISE; raster.lineWidth = 1;
            VkPipelineMultisampleStateCreateInfo samples{VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO}; samples.rasterizationSamples = VK_SAMPLE_COUNT_1_BIT;
            VkPipelineDepthStencilStateCreateInfo depthState{VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO}; depthState.depthTestEnable = VK_TRUE; depthState.depthWriteEnable = VK_TRUE; depthState.depthCompareOp = VK_COMPARE_OP_LESS_OR_EQUAL;
            VkPipelineColorBlendAttachmentState attachment{}; attachment.colorWriteMask = 15;
            attachment.srcColorBlendFactor = VK_BLEND_FACTOR_SRC_ALPHA; attachment.dstColorBlendFactor = VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
            attachment.colorBlendOp = VK_BLEND_OP_ADD; attachment.srcAlphaBlendFactor = VK_BLEND_FACTOR_ZERO; attachment.dstAlphaBlendFactor = VK_BLEND_FACTOR_ONE; attachment.alphaBlendOp = VK_BLEND_OP_ADD;
            VkPipelineColorBlendStateCreateInfo blend{VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO}; blend.attachmentCount = 1; blend.pAttachments = &attachment;
            VkDynamicState dynamicStates[] = {VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR, VK_DYNAMIC_STATE_DEPTH_BIAS};
            VkPipelineDynamicStateCreateInfo dynamic{VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO}; dynamic.dynamicStateCount = 3; dynamic.pDynamicStates = dynamicStates;
            VkGraphicsPipelineCreateInfo info{VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO}; info.stageCount = 2; info.pStages = stages; info.pVertexInputState = &vertex;
            info.pInputAssemblyState = &assembly; info.pViewportState = &viewport; info.pRasterizationState = &raster; info.pMultisampleState = &samples;
            info.pDepthStencilState = &depthState; info.pColorBlendState = &blend; info.pDynamicState = &dynamic; info.layout = layout; info.renderPass = pass;
            for (unsigned state = 0; state < pipelines.size(); state++) {
                // Opaque models provide RGBDepth; transparent/editor helpers
                // retain the opaque depth channel beneath their color.
                attachment.colorWriteMask = state == 0 || state == 6 ? 15 : 7;
                attachment.blendEnable = state == 1 || state == 2 || state == 7;
                depthState.depthWriteEnable = state == 0 || state == 6;
                depthState.depthTestEnable = state != 4 && state != 5;
                raster.depthBiasEnable = state == 1 || state == 2;
                raster.cullMode = state < 3 ? VK_CULL_MODE_BACK_BIT : VK_CULL_MODE_NONE;
                assembly.topology = state == 3 || state == 5 ? VK_PRIMITIVE_TOPOLOGY_LINE_LIST : VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
                check(vkCreateGraphicsPipelines(device, VK_NULL_HANDLE, 1, &info, nullptr, &pipelines[state]), "vkCreateGraphicsPipelines");
            }
        } catch (...) { vkDestroyShaderModule(device, vs, nullptr); vkDestroyShaderModule(device, fs, nullptr); throw; }
        vkDestroyShaderModule(device, vs, nullptr); vkDestroyShaderModule(device, fs, nullptr);
    }
    void target(uint32_t w, uint32_t h) {
        if (w == width && h == height) return;
        if (!w || !h || w > 4096 || h > 4096) throw std::runtime_error("Frame dimensions outside 1..4096");
        check(vkDeviceWaitIdle(device), "vkDeviceWaitIdle");
        if(alpha)alpha->releaseTarget();
        if (framebuffer) vkDestroyFramebuffer(device, framebuffer, nullptr);
        framebuffer = {};
        destroy(color); destroy(depth); destroy(readback);
        color = image(w, h, VK_FORMAT_R32G32B32A32_SFLOAT, VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_SAMPLED_BIT, VK_IMAGE_ASPECT_COLOR_BIT);
        depth = image(w, h, VK_FORMAT_D32_SFLOAT, VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT, VK_IMAGE_ASPECT_DEPTH_BIT);
        VkImageView views[] = {color.view, depth.view}; VkFramebufferCreateInfo info{VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO}; info.renderPass = pass;
        info.attachmentCount = 2; info.pAttachments = views; info.width = w; info.height = h; info.layers = 1;
        check(vkCreateFramebuffer(device, &info, nullptr, &framebuffer), "vkCreateFramebuffer"); width = w; height = h;
    }
public:
    void awaitFrame(){if(framePending){check(vkWaitForFences(device,1,&fence,VK_TRUE,UINT64_MAX),"vkWaitForFences(surface reuse)");framePending=false;}}
    Renderer() {
        VkApplicationInfo app{VK_STRUCTURE_TYPE_APPLICATION_INFO}; app.pApplicationName = "Sky Map Editor"; app.pEngineName = "Sky Native Vulkan"; app.apiVersion = VK_API_VERSION_1_1;
        VkInstanceCreateInfo info{VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO}; info.pApplicationInfo = &app;
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        const char* surfaceExtensions[]={VK_KHR_SURFACE_EXTENSION_NAME,
#ifdef SKY_ANDROID_SURFACE
            VK_KHR_ANDROID_SURFACE_EXTENSION_NAME
#elif defined(SKY_WIN32_SURFACE)
            VK_KHR_WIN32_SURFACE_EXTENSION_NAME
#else
            VK_KHR_XCB_SURFACE_EXTENSION_NAME
#endif
        };info.enabledExtensionCount=2;info.ppEnabledExtensionNames=surfaceExtensions;
#endif
        check(vkCreateInstance(&info, nullptr, &instance), "vkCreateInstance");
        uint32_t count = 0; check(vkEnumeratePhysicalDevices(instance, &count, nullptr), "vkEnumeratePhysicalDevices");
        std::vector<VkPhysicalDevice> devices(count); check(vkEnumeratePhysicalDevices(instance, &count, devices.data()), "vkEnumeratePhysicalDevices");
        // Prefer a hardware device; lavapipe is useful for explicit CPU tests.
        std::stable_sort(devices.begin(), devices.end(), [](VkPhysicalDevice a, VkPhysicalDevice b) {
            VkPhysicalDeviceProperties x, y; vkGetPhysicalDeviceProperties(a, &x); vkGetPhysicalDeviceProperties(b, &y);
            return (x.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU ? 0 : x.deviceType == VK_PHYSICAL_DEVICE_TYPE_CPU ? 2 : 1) < (y.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU ? 0 : y.deviceType == VK_PHYSICAL_DEVICE_TYPE_CPU ? 2 : 1);
        });
        for (auto candidate : devices) {
            uint32_t families = 0; vkGetPhysicalDeviceQueueFamilyProperties(candidate, &families, nullptr);
            std::vector<VkQueueFamilyProperties> qs(families); vkGetPhysicalDeviceQueueFamilyProperties(candidate, &families, qs.data());
            for (uint32_t q = 0; q < families; q++) if (qs[q].queueCount && (qs[q].queueFlags & VK_QUEUE_GRAPHICS_BIT)) {
#ifdef SKY_WIN32_SURFACE
                if(skyHasParentWindow()&&!vkGetPhysicalDeviceWin32PresentationSupportKHR(candidate,q))continue;
#endif
                physical = candidate; queueFamily = q;queueSupportsCompute=(qs[q].queueFlags&VK_QUEUE_COMPUTE_BIT)!=0;timestampBits=qs[q].timestampValidBits; break;
            }
            if (physical) break;
        }
        if (!physical) throw std::runtime_error("No Vulkan graphics device");
        vkGetPhysicalDeviceProperties(physical, &properties);
        float priority = 1; VkDeviceQueueCreateInfo qi{VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO}; qi.queueFamilyIndex = queueFamily; qi.queueCount = 1; qi.pQueuePriorities = &priority;
        VkDeviceCreateInfo di{VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO}; di.queueCreateInfoCount = 1; di.pQueueCreateInfos = &qi;
        VkPhysicalDeviceFeatures supported{}, enabled{}; vkGetPhysicalDeviceFeatures(physical, &supported);
        enabled.samplerAnisotropy = supported.samplerAnisotropy; enabled.largePoints=supported.largePoints; di.pEnabledFeatures = &enabled;
        uint32_t extensionCount = 0; check(vkEnumerateDeviceExtensionProperties(physical, nullptr, &extensionCount, nullptr), "vkEnumerateDeviceExtensionProperties");
        std::vector<VkExtensionProperties> extensions(extensionCount); check(vkEnumerateDeviceExtensionProperties(physical, nullptr, &extensionCount, extensions.data()), "vkEnumerateDeviceExtensionProperties");
        VkPhysicalDeviceShaderFloat16Int8Features half{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES};
        const char* halfExtension = VK_KHR_SHADER_FLOAT16_INT8_EXTENSION_NAME;
        std::vector<const char*> enabledExtensions;
        if (std::any_of(extensions.begin(), extensions.end(), [&](const auto& e) { return std::string(e.extensionName) == halfExtension; })) {
            VkPhysicalDeviceFeatures2 features{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2}; features.pNext = &half; vkGetPhysicalDeviceFeatures2(physical, &features);
            shaderFloat16 = half.shaderFloat16; half.shaderInt8 = VK_FALSE;
            if (shaderFloat16) { di.pNext = &half; enabledExtensions.push_back(halfExtension); }
        }
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        enabledExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
#endif
        di.enabledExtensionCount=enabledExtensions.size();di.ppEnabledExtensionNames=enabledExtensions.data();
        check(vkCreateDevice(physical, &di, nullptr, &device), "vkCreateDevice"); vkGetDeviceQueue(device, queueFamily, 0, &queue);
        initializeFrameQueries();
        VkCommandPoolCreateInfo pi{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO}; pi.queueFamilyIndex = queueFamily; pi.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
        check(vkCreateCommandPool(device, &pi, nullptr, &pool), "vkCreateCommandPool");
        VkCommandBufferAllocateInfo ai{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO}; ai.commandPool = pool; ai.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY; ai.commandBufferCount = 1;
        check(vkAllocateCommandBuffers(device, &ai, &commands), "vkAllocateCommandBuffers");
        VkFenceCreateInfo fi{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO}; check(vkCreateFence(device, &fi, nullptr, &fence), "vkCreateFence");
        VkPipelineCacheCreateInfo cacheInfo{VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO};
        check(vkCreatePipelineCache(device,&cacheInfo,nullptr,&pipelineCache),"vkCreatePipelineCache");
        createPass(); createPipelines(); materials = std::make_unique<MaterialRenderer>(device, physical, queue, pool, false, pipelineCache, false, textureCache);
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        presenter=std::make_unique<SkySurfacePresenter>(instance,physical,device,queue,queueFamily);
#endif
    }
    ~Renderer() {
        if (device) vkDeviceWaitIdle(device);
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        presenter.reset();
#endif
        exposureMeter.reset();canvas.reset();clearFullPreview();fastFog.reset(); fastTone.reset(); materials.reset();materialCache.clear(); core.reset(); background.reset(); foreground.reset(); items.reset(); alpha.reset();textureCache.reset();
        destroy(vertices); destroy(readback); if (framebuffer) vkDestroyFramebuffer(device, framebuffer, nullptr); destroy(color); destroy(depth);
        for (auto p : pipelines) if (p) vkDestroyPipeline(device, p, nullptr);
        if (layout) vkDestroyPipelineLayout(device, layout, nullptr);
        if (pass) vkDestroyRenderPass(device, pass, nullptr);
        if (pipelineCache) vkDestroyPipelineCache(device, pipelineCache, nullptr);
        if (frameQueries) vkDestroyQueryPool(device,frameQueries,nullptr);
        if (fence) vkDestroyFence(device, fence, nullptr);
        if (pool) vkDestroyCommandPool(device, pool, nullptr);
        if (device) vkDestroyDevice(device, nullptr);
        if (instance) vkDestroyInstance(instance, nullptr);
    }
    std::string description() const {
        std::string name = properties.deviceName;
        for (auto& c : name) if (c == '"' || c == '\\' || uint8_t(c) < 32) c = ' ';
        const bool nativeSurface=
#ifdef SKY_WIN32_SURFACE
            skyHasParentWindow();
#elif defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST)
            true;
#else
            false;
#endif
        return "{\"engine\":\"Sky Native Vulkan\",\"backend\":\"Vulkan\",\"device\":\"" + name + "\",\"apiVersion\":" + std::to_string(properties.apiVersion) + ",\"deviceType\":" + std::to_string(properties.deviceType) + ",\"nativeSurface\":"+(nativeSurface?"true":"false")+",\"dynamicGeometry\":true,\"shaderFloat16\":" + (shaderFloat16 ? "true" : "false") + ",\"gpuCanvasPacking\":"+(gpuCanvasPacking()?"true":"false")+",\"gpuExposureGather\":"+(gpuExposureGather()?"true":"false")+",\"samplerAnisotropyPolicy\":\"" + (trilinearSamplerCompatibility(properties) ? "llvmpipe-trilinear" : "device-request") + "\",\"maxSamplerAnisotropy\":" + std::to_string(properties.limits.maxSamplerAnisotropy) + "}";
    }
    void materialScene(const uint8_t* data, size_t bytes) { auto next=std::make_shared<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,false,textureCache);next->scene(data,bytes);materials=std::move(next); }
    void materialBatch(const uint8_t* data, size_t bytes) { auto next=std::make_shared<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,false,textureCache);next->batch(data,bytes);materials=std::move(next); }
    void cachedMaterial(const uint8_t* data,size_t bytes,bool patch) {
        if(bytes<4)throw std::runtime_error("Cached material slot missing");uint32_t slot;memcpy(&slot,data,4);if(slot>=16)throw std::runtime_error("Cached material slot invalid");
        if(patch){auto found=materialCache.find(slot);if(found==materialCache.end())throw std::runtime_error("Cached material slot unavailable");found->second->resourceBatch(data+4,bytes-4);materials=found->second;}
        else{auto next=std::make_shared<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,false,textureCache);next->scene(data+4,bytes-4);materialCache[slot]=next;materials=std::move(next);}
    }
    void viewportBackground(const uint8_t* data,size_t bytes) {
        if(!bytes){background.reset();return;}
        auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,true,pipelineCache,false,textureCache);
        next->batch(data,bytes);background=std::move(next);
    }
    void viewportCore(const uint8_t* data,size_t bytes) {
        if(!bytes){core.reset();return;}
        auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,true,pipelineCache,false,textureCache);
        next->batch(data,bytes);core=std::move(next);
    }
    void viewportMaterials(const uint8_t* data,size_t bytes) {
        if(!bytes){foreground.reset();return;}
        auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,true,pipelineCache,false,textureCache);
        next->batch(data,bytes);foreground=std::move(next);
    }
    void viewportUniforms(const uint8_t* data,size_t bytes) {
        if(!foreground)throw std::runtime_error("No viewport material batch for uniform update");
        foreground->uniformBatch(data,bytes);
    }
    void viewportGeometry(const uint8_t* data,size_t bytes) {
        if(bytes<4)throw std::runtime_error("Viewport geometry target missing");
        uint32_t target;memcpy(&target,data,4);
        if(target>1)throw std::runtime_error("Viewport geometry target invalid");
        auto renderer=target?alpha.get():foreground.get();
        if(!renderer)throw std::runtime_error("Viewport geometry target unavailable");
        renderer->geometryBatch(data+4,bytes-4);
    }
    void viewportItems(const uint8_t* data,size_t bytes) {
        if(!bytes){items.reset();return;}
        auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,true,pipelineCache,false,textureCache);
        next->batch(data,bytes);if(next->outputs()!=1)throw std::runtime_error("Opaque items require one RGBDepth attachment");items=std::move(next);
    }
    void viewportAlpha(const uint8_t* data,size_t bytes) {
        if(!bytes){alpha.reset();return;}
        auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,true,textureCache);
        next->batch(data,bytes);
        if(next->outputs()!=2)throw std::runtime_error("Viewport alpha requires original color/log-depth attachments");
        alpha=std::move(next);
    }
    void viewportAlphaUniforms(const uint8_t* data,size_t bytes) {
        if(!alpha)throw std::runtime_error("No viewport alpha batch for uniform update");
        alpha->uniformBatch(data,bytes);
    }
    void viewportDrawOrder(const uint8_t* data,size_t bytes) {
        std::vector<uint32_t> orders[2];size_t at=0;
        for(auto& order:orders){if(at+4>bytes)throw std::runtime_error("Draw order truncated");uint32_t n;memcpy(&n,data+at,4);at+=4;if(n>4096||at+uint64_t(n)*4>bytes)throw std::runtime_error("Draw order size invalid");order.resize(n);if(n)memcpy(order.data(),data+at,n*4);at+=n*4;}
        if(at!=bytes)throw std::runtime_error("Draw order trailing bytes");
        if(foreground)foreground->setDrawOrder(orders[0]);else if(!orders[0].empty())throw std::runtime_error("Opaque draw order unavailable");
        if(alpha)alpha->setDrawOrder(orders[1]);else if(!orders[1].empty())throw std::runtime_error("Alpha draw order unavailable");
    }
    void viewportDrawVisibility(const uint8_t* data,size_t bytes) {
        std::vector<uint32_t> lists[2];size_t at=0;
        for(auto& list:lists){if(at+4>bytes)throw std::runtime_error("Draw visibility truncated");uint32_t n;memcpy(&n,data+at,4);at+=4;if(n>4096||at+uint64_t(n)*4>bytes)throw std::runtime_error("Draw visibility size invalid");list.resize(n);if(n)memcpy(list.data(),data+at,n*4);at+=n*4;}
        if(at!=bytes)throw std::runtime_error("Draw visibility trailing bytes");
        if(foreground)foreground->setDrawVisibility(lists[0]);else if(!lists[0].empty())throw std::runtime_error("Opaque visibility unavailable");
        if(alpha)alpha->setDrawVisibility(lists[1]);else if(!lists[1].empty())throw std::runtime_error("Alpha visibility unavailable");
    }
    void viewportBackgroundUniforms(const uint8_t* data,size_t bytes){if(!background)throw std::runtime_error("No background for uniform update");background->uniformBatch(data,bytes);}
    void fastComposition(const uint8_t* data,size_t bytes){
        if(bytes<24)throw std::runtime_error("Fast composition header truncated");
        uint32_t sizes[2];memcpy(sizes,data,8);memcpy(fastBindings.data(),data+8,16);
        if(24ull+sizes[0]+sizes[1]!=bytes)throw std::runtime_error("Fast composition size invalid");
        auto fog=std::make_unique<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,false,textureCache);
        auto tone=std::make_unique<MaterialRenderer>(device,physical,queue,pool,false,pipelineCache,false,textureCache);
        fog->scene(data+24,sizes[0]);tone->scene(data+24+sizes[0],sizes[1]);
        if(fog->outputs()!=1||tone->outputs()!=1)throw std::runtime_error("Fast composition output invalid");
        fastFog=std::move(fog);fastTone=std::move(tone);
    }
    void viewportResources(const uint8_t* data,size_t bytes){
        if(bytes<4)throw std::runtime_error("Viewport resource target missing");uint32_t target;memcpy(&target,data,4);
        MaterialRenderer* renderer=target==0?background.get():target==1?foreground.get():target==2?alpha.get():target==3?fastFog.get():target==4?fastTone.get():target==5?items.get():nullptr;
        if(!renderer)throw std::runtime_error("Viewport resource target unavailable");renderer->resourceBatch(data+4,bytes-4);
    }
    void fastCompositionUniforms(const uint8_t* data,size_t bytes){
        if(!fastFog||!fastTone||bytes<4)throw std::runtime_error("Fast composition unavailable");
        uint32_t n;memcpy(&n,data,4);if(4ull+n>bytes)throw std::runtime_error("Fast uniform size invalid");
        fastFog->uniformBatch(data+4,n);fastTone->uniformBatch(data+4+n,bytes-4-n);
    }
    void recordSampleTargets(const std::vector<Image*>& images){
        std::vector<VkImageMemoryBarrier> barriers;
        for(auto* image:images){VkImageMemoryBarrier b{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};b.image=image->handle;b.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};b.srcQueueFamilyIndex=b.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;b.oldLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;b.newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;b.srcAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;b.dstAccessMask=VK_ACCESS_SHADER_READ_BIT;barriers.push_back(b);}
        vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,0,0,nullptr,0,nullptr,barriers.size(),barriers.data());
    }
    std::vector<uint8_t> fastRender(uint32_t w,uint32_t h,const float* matrix,bool toSurface=false){
        if(!fastFog||!fastTone)throw std::runtime_error("Fast compositor not initialized");
        render(w,h,matrix,0,true,true,true);
        std::vector<Image*> sampled{&color};
        if(alpha){alpha->recordRender(commands,w,h,depth.view);sampled.push_back(&alpha->outputImage(0));sampled.push_back(&alpha->outputImage(1));}
        recordSampleTargets(sampled);fastFog->bindExternalTexture(fastBindings[0],color.view);
        if(alpha){fastFog->bindExternalTexture(fastBindings[1],alpha->outputImage(0).view);fastFog->bindExternalTexture(fastBindings[2],alpha->outputImage(1).view);}else{fastFog->bindOwnTexture(fastBindings[1]);fastFog->bindOwnTexture(fastBindings[2]);}
        fastFog->recordRender(commands,w,h);recordSampleTargets({&fastFog->outputImage(0)});fastTone->bindExternalTexture(fastBindings[3],fastFog->outputImage(0).view);
        fastTone->recordRender(commands,w,h,VK_NULL_HANDLE,!toSurface);
        check(vkResetFences(device,1,&fence),"vkResetFences(fast)");VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};submit.commandBufferCount=1;submit.pCommandBuffers=&commands;
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        VkSemaphore acquired{},finished{};VkPipelineStageFlags waitStage=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        if(toSurface){presenter->record(commands,fastTone->outputImage(0),w,h);acquired=presenter->acquireSemaphore();finished=presenter->presentSemaphore();submit.waitSemaphoreCount=1;submit.pWaitSemaphores=&acquired;submit.pWaitDstStageMask=&waitStage;submit.signalSemaphoreCount=1;submit.pSignalSemaphores=&finished;}
#endif
        check(vkEndCommandBuffer(commands),"vkEndCommandBuffer(fast)");check(vkQueueSubmit(queue,1,&submit,fence),"vkQueueSubmit(fast)");
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        if(toSurface){
            framePending=true;lastPresented=presenter->present();
#ifdef SKY_XCB_SURFACE_TEST
            if(std::getenv("SKY_SURFACE_CAPTURE")){awaitFrame();presenter->capture();}
#endif
            return {};
        }
#endif
        check(vkWaitForFences(device,1,&fence,VK_TRUE,UINT64_MAX),"vkWaitForFences(fast)");
        if(toSurface)return {};
        const auto output=fastTone->readRenderedPixels();std::vector<uint8_t> pixels(uint64_t(w)*h*4);
        for(size_t i=0;i<pixels.size();++i){float value;memcpy(&value,output.data()+i*4,4);if(!std::isfinite(value))throw std::runtime_error("Fast composition nonfinite output");value=std::clamp(value,0.f,1.f);value=value<=.0031308f?12.92f*value:1.055f*std::pow(value,1.f/2.4f)-.055f;pixels[i]=i%4==3?255:uint8_t(std::lround(value*255.f));}
        return pixels;
    }
    bool surfaceFrame(uint32_t w,uint32_t h,const float* matrix){
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        if(!presenter->acquire())return false;fastRender(w,h,matrix,true);return lastPresented;
#else
        throw std::runtime_error("Native surface presentation is unavailable");
#endif
    }
    bool materialSurfaceFrame(uint32_t w,uint32_t h){
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        if(materials->outputs()!=1)throw std::runtime_error("Presented material requires one final color attachment");
        if(!presenter->acquire())return false;
        check(vkResetCommandBuffer(commands,0),"vkResetCommandBuffer(full present)");
        VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};begin.flags=VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
        check(vkBeginCommandBuffer(commands,&begin),"vkBeginCommandBuffer(full present)");
        materials->recordRender(commands,w,h);
        // Full preview already runs the original temporal resolve. Present its
        // final linear Tonemap output with display transfer, without extra FXAA.
        presenter->record(commands,materials->outputImage(0),w,h,false);
        VkSemaphore acquired=presenter->acquireSemaphore(),finished=presenter->presentSemaphore();
        VkPipelineStageFlags waitStage=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};submit.commandBufferCount=1;submit.pCommandBuffers=&commands;submit.waitSemaphoreCount=1;submit.pWaitSemaphores=&acquired;submit.pWaitDstStageMask=&waitStage;submit.signalSemaphoreCount=1;submit.pSignalSemaphores=&finished;
        check(vkEndCommandBuffer(commands),"vkEndCommandBuffer(full present)");check(vkResetFences(device,1,&fence),"vkResetFences(full present)");
        check(vkQueueSubmit(queue,1,&submit,fence),"vkQueueSubmit(full present)");framePending=true;lastPresented=presenter->present();
#ifdef SKY_XCB_SURFACE_TEST
        if(std::getenv("SKY_SURFACE_CAPTURE")){awaitFrame();presenter->capture();}
#endif
        return lastPresented;
#else
        throw std::runtime_error("Native material presentation is unavailable");
#endif
    }
    std::vector<uint8_t> viewportAlphaRender(uint32_t w,uint32_t h) {
        if(!w||!h||w>4096||h>4096||w!=width||h!=height)throw std::runtime_error("Viewport alpha requires current opaque depth dimensions");
        return alpha?alpha->render(w,h,depth.view):std::vector<uint8_t>(uint64_t(w)*h*2*16,0);
    }
    uint32_t materialOutputs() const { return materials->outputs(); }
    std::vector<uint8_t> materialRender(uint32_t w, uint32_t h) { return materials->render(w, h); }
    void scene(const uint8_t* data, size_t bytes) {
        if (bytes < 8) throw std::runtime_error("Scene header truncated");
        uint32_t vc, dc; memcpy(&vc, data, 4); memcpy(&dc, data + 4, 4);
        if (vc > 20000000 || dc > 200000 || bytes != 8ull + uint64_t(vc) * sizeof(Vertex) + uint64_t(dc) * sizeof(Draw)) throw std::runtime_error("Scene size invalid");
        std::vector<Draw> next(dc); memcpy(next.data(), data + 8 + uint64_t(vc) * sizeof(Vertex), dc * sizeof(Draw));
        for (const auto& d : next) if (d.state >= pipelines.size() || d.mode > 1 || uint64_t(d.first) + d.count > vc || d.count % (d.state == 3 || d.state == 5 ? 2 : 3)) throw std::runtime_error("Draw range invalid");
        Buffer nextVertices = buffer(uint64_t(vc) * sizeof(Vertex), VK_BUFFER_USAGE_VERTEX_BUFFER_BIT);
        void* mapped; check(vkMapMemory(device, nextVertices.memory, 0, nextVertices.size, 0, &mapped), "vkMapMemory(vertices)");
        memcpy(mapped, data + 8, uint64_t(vc) * sizeof(Vertex)); vkUnmapMemory(device, nextVertices.memory);
        destroy(vertices); vertices = nextVertices; draws = std::move(next); vertexCount = vc;
    }
    std::vector<uint8_t> render(uint32_t w, uint32_t h, const float* matrix, float exposure=0, bool capture=false, bool gpuOnly=false,bool recordOnly=false,bool full=false) {
        target(w, h); check(vkResetCommandBuffer(commands, 0), "vkResetCommandBuffer");
        if(!gpuOnly&&!recordOnly&&!readback.handle)readback=buffer(uint64_t(w)*h*16,VK_BUFFER_USAGE_TRANSFER_DST_BIT);
        VkCommandBufferBeginInfo bi{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO}; bi.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
        check(vkBeginCommandBuffer(commands, &bi), "vkBeginCommandBuffer");
        if(full)beginFrameQueries();
        VkClearValue clear[2]{}; clear[0].color = {{16.f / 255, 32.f / 255, 48.f / 255, 1}}; clear[1].depthStencil = {1, 0};
        VkRenderPassBeginInfo ri{VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO}; ri.renderPass = pass; ri.framebuffer = framebuffer; ri.renderArea.extent = {w, h}; ri.clearValueCount = 2; ri.pClearValues = clear;
        vkCmdBeginRenderPass(commands, &ri, VK_SUBPASS_CONTENTS_INLINE);
        VkViewport viewport{0, 0, float(w), float(h), 0, 1}; VkRect2D scissor{{0, 0}, {w, h}};
        vkCmdSetViewport(commands, 0, 1, &viewport); vkCmdSetScissor(commands, 0, 1, &scissor);
        if(background)background->drawBatch(commands);
        if(full){auto found=fullStages.find(0);if(found!=fullStages.end())found->second->drawBatch(commands);}else if(core)core->drawBatch(commands);
        if(foreground)foreground->drawBatch(commands);
        if(items)items->drawBatch(commands);
        vkCmdPushConstants(commands, layout, VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, 0, 64, matrix);
        vkCmdPushConstants(commands, layout, VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, 68, 4, &exposure);
        if (vertexCount) {
            VkDeviceSize offset = 0; vkCmdBindVertexBuffers(commands, 0, 1, &vertices.handle, &offset);
            for (const auto& d : draws) {
                vkCmdBindPipeline(commands, VK_PIPELINE_BIND_POINT_GRAPHICS, pipelines[d.state]);
                const uint32_t mode=d.mode|(exposure>0?2u:0u)|(capture&&(d.state==0||d.state==6)?4u:0u);
                vkCmdPushConstants(commands, layout, VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, 64, 4, &mode);
                vkCmdSetDepthBias(commands, 0, 0, d.state == 1 || d.state == 2 ? -2.f : 0.f);
                vkCmdDraw(commands, d.count, 1, d.first, 0);
            }
        }
        vkCmdEndRenderPass(commands);
        if(recordOnly)return {};
        if(gpuOnly){check(vkEndCommandBuffer(commands),"vkEndCommandBuffer(gpu)");check(vkResetFences(device,1,&fence),"vkResetFences(gpu)");VkSubmitInfo si{VK_STRUCTURE_TYPE_SUBMIT_INFO};si.commandBufferCount=1;si.pCommandBuffers=&commands;check(vkQueueSubmit(queue,1,&si,fence),"vkQueueSubmit(gpu)");check(vkWaitForFences(device,1,&fence,VK_TRUE,UINT64_MAX),"vkWaitForFences(gpu)");return {};}
        VkBufferImageCopy copy{}; copy.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1}; copy.imageExtent = {w, h, 1};
        vkCmdCopyImageToBuffer(commands, color.handle, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, readback.handle, 1, &copy);
        VkBufferMemoryBarrier barrier{VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER}; barrier.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT; barrier.dstAccessMask = VK_ACCESS_HOST_READ_BIT;
        barrier.srcQueueFamilyIndex = barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED; barrier.buffer = readback.handle; barrier.size = VK_WHOLE_SIZE;
        vkCmdPipelineBarrier(commands, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_HOST_BIT, 0, 0, nullptr, 1, &barrier, 0, nullptr);
        check(vkEndCommandBuffer(commands), "vkEndCommandBuffer"); check(vkResetFences(device, 1, &fence), "vkResetFences");
        VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO}; submit.commandBufferCount = 1; submit.pCommandBuffers = &commands;
        check(vkQueueSubmit(queue, 1, &submit, fence), "vkQueueSubmit"); check(vkWaitForFences(device, 1, &fence, VK_TRUE, UINT64_MAX), "vkWaitForFences");
        void* mapped; check(vkMapMemory(device, readback.memory, 0, readback.size, 0, &mapped), "vkMapMemory(readback)");
        // Explicit preview display adaptation, after all linear material blends.
        // Original bloom, vignette and motion/history composition remain separate.
        const auto* radiance=static_cast<const float*>(mapped);
        if(capture)capturedRadiance.assign(radiance,radiance+uint64_t(w)*h*4);
        std::vector<uint8_t> pixels(uint64_t(w)*h*4);size_t nonfinite=0;
        for(size_t i=0;i<pixels.size();++i) {
            float value=radiance[i];
            if(!std::isfinite(value)){if(i%4!=3)++nonfinite;value=0;}
            else if(exposure>0&&i%4!=3){value=std::max(0.f,value)*exposure;value=value/(1.f+value);value=value<=.0031308f?12.92f*value:1.055f*std::pow(value,1.f/2.4f)-.055f;}
            if(exposure>0&&i%4==3)value=1.f;
            pixels[i]=uint8_t(std::lround(std::clamp(value,0.f,1.f)*255.f));
        }
        vkUnmapMemory(device, readback.memory);
        if(nonfinite)throw std::runtime_error("Viewport shader produced "+std::to_string(nonfinite)+" nonfinite RGB components");
        return pixels;
    }
    std::vector<float> viewportHDR(uint32_t w,uint32_t h,const float* matrix) {
        render(w,h,matrix,0,true);return std::move(capturedRadiance);
    }
#include "vulkan-full-preview.hpp"
};

int skyVulkanRun(FILE* input, FILE* output, FILE* diagnostics, bool probe) {

    try {
        Renderer renderer;
        if (probe) { fprintf(output, "%s\n", renderer.description().c_str()); fflush(output); return 0; }
        fprintf(diagnostics, "%s\n", renderer.description().c_str()); fflush(diagnostics);
        uint32_t header[2];
        while (fread(header, 1, sizeof(header), input) == sizeof(header)) {
            if (header[1] > 600000000) throw std::runtime_error("Request too large");
            std::vector<uint8_t> payload(header[1]); if (fread(payload.data(), 1, payload.size(), input) != payload.size()) throw std::runtime_error("Request truncated");
            // The submitted Surface frame may finish while JavaScript prepares
            // the next frame or handles editing events. Reuse its buffers only
            // after the fence; no per-frame GPU wait delays the status reply.
            renderer.awaitFrame();
            if (header[0] == 1) renderer.scene(payload.data(), payload.size());
            else if (header[0] == 2 || header[0] == 14) {
                if (payload.size() != 76&&payload.size()!=80) throw std::runtime_error("Frame request invalid");
                uint32_t request, w, h; float matrix[16]; memcpy(&request, payload.data(), 4); memcpy(&w, payload.data() + 4, 4); memcpy(&h, payload.data() + 8, 4); memcpy(matrix, payload.data() + 12, 64);
                float exposure=0;if(payload.size()==80){memcpy(&exposure,payload.data()+76,4);if(!std::isfinite(exposure)||exposure<=0)throw std::runtime_error("Frame exposure invalid");}
                auto pixels = header[0]==14?renderer.fastRender(w,h,matrix):renderer.render(w, h, matrix,exposure);
                const uint32_t result[] = {0x564b4652, request, w, h, uint32_t(pixels.size())}; fwrite(result, 1, sizeof(result), output); fwrite(pixels.data(), 1, pixels.size(), output); fflush(output);
            } else if (header[0] == 3) renderer.materialScene(payload.data(), payload.size());
            else if(header[0]==24||header[0]==25)renderer.cachedMaterial(payload.data(),payload.size(),header[0]==25);
            else if(header[0]==26)renderer.fullStage(payload.data(),payload.size());
            else if(header[0]==27){
                auto pixels=renderer.fullRender(payload.data(),payload.size());uint32_t request,w,h,surface;memcpy(&request,payload.data(),4);memcpy(&w,payload.data()+4,4);memcpy(&h,payload.data()+8,4);memcpy(&surface,payload.data()+76,4);
                const uint32_t result[]={0x564b4752,request,w,h,uint32_t(pixels.size()),surface?(renderer.fullPresented?2u:1u):0u};fwrite(result,1,sizeof(result),output);fwrite(&renderer.fullAverageLum,1,8,output);fwrite(pixels.data(),1,pixels.size(),output);fflush(output);
            }
            else if (header[0] == 4) {
                if (payload.size() != 12) throw std::runtime_error("Material frame request invalid");
                uint32_t request, w, h; memcpy(&request, payload.data(), 4); memcpy(&w, payload.data() + 4, 4); memcpy(&h, payload.data() + 8, 4);
                auto pixels = renderer.materialRender(w, h);
                const uint32_t result[] = {0x564b4d52, request, w, h, renderer.materialOutputs(), uint32_t(pixels.size())};
                fwrite(result, 1, sizeof(result), output); fwrite(pixels.data(), 1, pixels.size(), output); fflush(output);
            } else if (header[0] == 5) renderer.materialBatch(payload.data(), payload.size());
            else if(header[0]==6)renderer.viewportBackground(payload.data(),payload.size());
            else if(header[0]==7)renderer.viewportMaterials(payload.data(),payload.size());
            else if(header[0]==28)renderer.viewportItems(payload.data(),payload.size());
            else if(header[0]==29)renderer.viewportGeometry(payload.data(),payload.size());
            else if(header[0]==10)renderer.viewportCore(payload.data(),payload.size());
            else if(header[0]==8)renderer.viewportUniforms(payload.data(),payload.size());
            else if(header[0]==11)renderer.viewportAlpha(payload.data(),payload.size());
            else if(header[0]==12)renderer.viewportAlphaUniforms(payload.data(),payload.size());
            else if(header[0]==15)renderer.fastComposition(payload.data(),payload.size());
            else if(header[0]==16)renderer.fastCompositionUniforms(payload.data(),payload.size());
            else if(header[0]==17)renderer.viewportBackgroundUniforms(payload.data(),payload.size());
            else if(header[0]==21)renderer.viewportResources(payload.data(),payload.size());
            else if(header[0]==18)renderer.viewportDrawOrder(payload.data(),payload.size());
            else if(header[0]==19)renderer.viewportDrawVisibility(payload.data(),payload.size());
            else if(header[0]==22){
#if defined(SKY_WIN32_SURFACE) || defined(SKY_XCB_SURFACE_TEST)
                if(payload.size()!=20)throw std::runtime_error("Window bounds request invalid");int32_t x,y;uint32_t w,h,visible;memcpy(&x,payload.data(),4);memcpy(&y,payload.data()+4,4);memcpy(&w,payload.data()+8,4);memcpy(&h,payload.data()+12,4);memcpy(&visible,payload.data()+16,4);
                if(x < -32768 || x > 32768 || y < -32768 || y > 32768 || w > 16384 || h > 16384 || visible > 1)throw std::runtime_error("Window bounds outside limits");skyUpdateViewport(x,y,w,h,visible!=0);
#else
                throw std::runtime_error("Native window bounds are unavailable");
#endif
            }
            else if(header[0]==23){
                if(payload.size()!=12)throw std::runtime_error("Material surface request invalid");
                uint32_t request,w,h;memcpy(&request,payload.data(),4);memcpy(&w,payload.data()+4,4);memcpy(&h,payload.data()+8,4);
                bool presented=renderer.materialSurfaceFrame(w,h);const uint32_t result[]={0x564b5052,request,w,h,uint32_t(presented)};fwrite(result,1,sizeof(result),output);fflush(output);
            }
            else if(header[0]==20){
                if(payload.size()!=76)throw std::runtime_error("Surface frame request invalid");uint32_t request,w,h;float matrix[16];memcpy(&request,payload.data(),4);memcpy(&w,payload.data()+4,4);memcpy(&h,payload.data()+8,4);memcpy(matrix,payload.data()+12,64);
                bool presented=renderer.surfaceFrame(w,h,matrix);const uint32_t result[]={0x564b5052,request,w,h,uint32_t(presented)};fwrite(result,1,sizeof(result),output);fflush(output);
            }
            else if(header[0]==13) {
                if(payload.size()!=12)throw std::runtime_error("Viewport alpha frame request invalid");
                uint32_t request,w,h;memcpy(&request,payload.data(),4);memcpy(&w,payload.data()+4,4);memcpy(&h,payload.data()+8,4);
                auto pixels=renderer.viewportAlphaRender(w,h);
                const uint32_t result[]={0x564b4d52,request,w,h,2,uint32_t(pixels.size())};
                fwrite(result,1,sizeof(result),output);fwrite(pixels.data(),1,pixels.size(),output);fflush(output);
            }
            else if(header[0]==9) {
                if(payload.size()!=76)throw std::runtime_error("Viewport HDR request invalid");
                uint32_t request,w,h;float matrix[16];memcpy(&request,payload.data(),4);memcpy(&w,payload.data()+4,4);memcpy(&h,payload.data()+8,4);memcpy(matrix,payload.data()+12,64);
                auto pixels=renderer.viewportHDR(w,h,matrix);
                const uint32_t result[]={0x564b4d52,request,w,h,1,uint32_t(pixels.size()*sizeof(float))};
                fwrite(result,1,sizeof(result),output);fwrite(pixels.data(),sizeof(float),pixels.size(),output);fflush(output);
            }
            else throw std::runtime_error("Unknown Vulkan request");
        }
        return ferror(input) ? 2 : 0;
    } catch (const std::exception& e) { fprintf(diagnostics, "Vulkan renderer: %s\n", e.what()); fflush(diagnostics); return 1; }
}

#ifndef SKY_ANDROID_NODE
int main(int argc, char** argv) {
#ifdef _WIN32
    _setmode(_fileno(stdin), _O_BINARY); _setmode(_fileno(stdout), _O_BINARY);
    const int protocolFd=_dup(_fileno(stdout));
    if(protocolFd<0)return 1;
    FILE* protocol=_fdopen(protocolFd,"wb");
    if(!protocol||_dup2(_fileno(stderr),_fileno(stdout))!=0)return 1;
#else
    const int protocolFd=dup(fileno(stdout));
    if(protocolFd<0)return 1;
    FILE* protocol=fdopen(protocolFd,"wb");
    if(!protocol||dup2(fileno(stderr),fileno(stdout))<0)return 1;
#endif
    // Drivers and validation layers may log to stdout even after startup.
    // Reserve the original pipe for binary replies so those logs cannot
    // corrupt frames or cause a blank viewport.
    const int result=skyVulkanRun(stdin, protocol, stderr, argc == 2 && std::string(argv[1]) == "--probe");
    fclose(protocol);return result;
}
#endif
