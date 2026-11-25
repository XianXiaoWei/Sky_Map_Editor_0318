// Programmable Vulkan path for recovered original shaders. Inputs and bindings
// come from SPIR-V reflection. No guessed global values or placeholder textures.
#include <memory>
#include <cmath>
#include "vulkan-texture-cache.hpp"

// llvmpipe returns NaN from anisotropic sampling of rank-zero/rank-one UV
// footprints (reproduced with unmodified DayHubCave RockFace5347.frag).
// Keep the original shaders, texels, mip levels and address modes; use its
// finite trilinear sampler path. Hardware keeps the requested anisotropy.
static bool trilinearSamplerCompatibility(const VkPhysicalDeviceProperties& properties) {
    return std::strstr(properties.deviceName, "llvmpipe") != nullptr;
}

class MaterialRenderer {
    VkDevice device;
    VkPhysicalDevice physical;
    VkQueue queue;
    VkCommandPool pool;
    VkPipelineCache pipelineCache;
    std::shared_ptr<SkyTextureCache> textureCache;
    VkCommandBuffer command{};
    VkFence fence{};
    VkDescriptorSetLayout setLayout{};
    VkDescriptorPool descriptorPool{};
    VkDescriptorSet descriptorSet{};
    VkPipelineLayout layout{};
    VkPipeline pipeline{};
    VkRenderPass pass{};
    VkFramebuffer framebuffer{};
    Buffer vertices{}, indices{}, readback{};
    struct Resource { uint32_t binding, kind; Buffer buffer{}; Image image{}; VkSampler sampler{}; uint32_t w{},h{},d{},mips{},pixelBytes{},bytes{},format{};SkySampledImagePtr sharedImage; };
    std::vector<Resource> resources;
    std::vector<uint32_t> externalBindings;
    std::vector<Image> colors;
    std::vector<VkFormat> colorFormats;
    std::vector<std::unique_ptr<MaterialRenderer>> followingDraws;
    std::vector<uint32_t> drawOrder;
    bool drawVisible=true;
    bool viewportTarget{};
    bool loadSharedDepth{};
    VkImageView sharedDepthView{};
    Image depth{};
    uint32_t width{}, height{}, colorCount{}, indexCount{}, vertexCount{}, vertexStride{}, state{};
    bool pointList{};

    struct Reader {
        const uint8_t* p; size_t remaining;
        const uint8_t* take(size_t n) { if (n > remaining) throw std::runtime_error("Material request truncated"); const auto* out = p; p += n; remaining -= n; return out; }
        uint32_t u32() { uint32_t n; memcpy(&n, take(4), 4); return n; }
    };
    uint32_t memoryType(uint32_t mask, VkMemoryPropertyFlags flags) {
        VkPhysicalDeviceMemoryProperties p; vkGetPhysicalDeviceMemoryProperties(physical, &p);
        for (uint32_t i = 0; i < p.memoryTypeCount; i++) if ((mask & (1u << i)) && (p.memoryTypes[i].propertyFlags & flags) == flags) return i;
        throw std::runtime_error("Material Vulkan memory type unavailable");
    }
    void destroy(Buffer& b) { if (b.handle) vkDestroyBuffer(device, b.handle, nullptr); if (b.memory) vkFreeMemory(device, b.memory, nullptr); b = {}; }
    void destroy(Image& i) { if (i.view) vkDestroyImageView(device, i.view, nullptr); if (i.handle) vkDestroyImage(device, i.handle, nullptr); if (i.memory) vkFreeMemory(device, i.memory, nullptr); i = {}; }
    Buffer buffer(size_t size, VkBufferUsageFlags usage, const void* data = nullptr) {
        Buffer b{}; b.size = std::max<size_t>(size, 4);
        try {
            VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO}; info.size = b.size; info.usage = usage; info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateBuffer(device, &info, nullptr, &b.handle), "vkCreateBuffer(material)");
            VkMemoryRequirements req; vkGetBufferMemoryRequirements(device, b.handle, &req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO}; alloc.allocationSize = req.size;
            alloc.memoryTypeIndex = memoryType(req.memoryTypeBits, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
            check(vkAllocateMemory(device, &alloc, nullptr, &b.memory), "vkAllocateMemory(material buffer)");
            check(vkBindBufferMemory(device, b.handle, b.memory, 0), "vkBindBufferMemory(material)");
            if (data && size) { void* mapped; check(vkMapMemory(device, b.memory, 0, b.size, 0, &mapped), "vkMapMemory(material)"); memcpy(mapped, data, size); vkUnmapMemory(device, b.memory); }
        } catch (...) { destroy(b); throw; }
        return b;
    }
    Image image(uint32_t w, uint32_t h, uint32_t d, bool volume, VkFormat format, VkImageUsageFlags usage, VkImageAspectFlags aspect, bool cube = false, uint32_t mipLevels = 1) {
        Image i{};
        try {
            VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO}; info.imageType = volume ? VK_IMAGE_TYPE_3D : VK_IMAGE_TYPE_2D; info.format = format;
            info.extent = {w, h, cube ? 1u : d}; info.mipLevels = mipLevels; info.arrayLayers = cube ? 6 : 1; info.samples = VK_SAMPLE_COUNT_1_BIT;
            info.flags = cube ? VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT : 0;
            info.tiling = VK_IMAGE_TILING_OPTIMAL; info.usage = usage; info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
            check(vkCreateImage(device, &info, nullptr, &i.handle), "vkCreateImage(material)");
            VkMemoryRequirements req; vkGetImageMemoryRequirements(device, i.handle, &req);
            VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO}; alloc.allocationSize = req.size; alloc.memoryTypeIndex = memoryType(req.memoryTypeBits, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
            check(vkAllocateMemory(device, &alloc, nullptr, &i.memory), "vkAllocateMemory(material image)");
            check(vkBindImageMemory(device, i.handle, i.memory, 0), "vkBindImageMemory(material)");
            VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO}; view.image = i.handle; view.viewType = cube ? VK_IMAGE_VIEW_TYPE_CUBE : volume ? VK_IMAGE_VIEW_TYPE_3D : VK_IMAGE_VIEW_TYPE_2D; view.format = format;
            view.subresourceRange = {aspect, 0, mipLevels, 0, cube ? 6u : 1u}; check(vkCreateImageView(device, &view, nullptr, &i.view), "vkCreateImageView(material)");
        } catch (...) { destroy(i); throw; }
        return i;
    }
    void begin() {
        check(vkResetCommandBuffer(command, 0), "vkResetCommandBuffer(material)");
        VkCommandBufferBeginInfo info{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO}; info.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
        check(vkBeginCommandBuffer(command, &info), "vkBeginCommandBuffer(material)");
    }
    void submit() {
        check(vkEndCommandBuffer(command), "vkEndCommandBuffer(material)"); check(vkResetFences(device, 1, &fence), "vkResetFences(material)");
        VkSubmitInfo info{VK_STRUCTURE_TYPE_SUBMIT_INFO}; info.commandBufferCount = 1; info.pCommandBuffers = &command;
        check(vkQueueSubmit(queue, 1, &info, fence), "vkQueueSubmit(material)"); check(vkWaitForFences(device, 1, &fence, VK_TRUE, UINT64_MAX), "vkWaitForFences(material)");
    }
    void upload(Image& i, uint32_t w, uint32_t h, uint32_t d, const uint8_t* data, size_t bytes, bool volume, bool cube, uint32_t mipLevels, uint32_t pixelBytes, bool recordOnly=false, bool existing=false, std::vector<Buffer>* retained=nullptr) {
        std::vector<VkBufferImageCopy> copies;
        std::vector<uint8_t> padded;
        size_t sourceAt = 0;
        for (uint32_t level = 0; level < mipLevels; ++level) {
            VkBufferImageCopy copy{};
            copy.bufferOffset = (padded.size() + 3) & ~size_t(3);
            copy.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, level, 0, cube ? 6u : 1u};
            copy.imageExtent = {std::max(1u, w >> level), std::max(1u, h >> level), volume ? std::max(1u, d >> level) : 1u};
            const size_t size = size_t(copy.imageExtent.width) * copy.imageExtent.height * copy.imageExtent.depth * (cube ? 6 : 1) * pixelBytes;
            if (sourceAt + size > bytes) throw std::runtime_error("Material mip data truncated");
            padded.resize(copy.bufferOffset + size);
            memcpy(padded.data() + copy.bufferOffset, data + sourceAt, size);
            sourceAt += size; copies.push_back(copy);
        }
        if (sourceAt != bytes) throw std::runtime_error("Material mip data length invalid");
        Buffer staging = buffer(padded.size(), VK_BUFFER_USAGE_TRANSFER_SRC_BIT, padded.data());
        try {
            if(!recordOnly)begin(); VkImageMemoryBarrier barrier{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER}; barrier.image = i.handle;
            barrier.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, mipLevels, 0, cube ? 6u : 1u}; barrier.srcQueueFamilyIndex = barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
            barrier.oldLayout = existing?VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:VK_IMAGE_LAYOUT_UNDEFINED; barrier.newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL; barrier.dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;barrier.srcAccessMask=existing?VK_ACCESS_SHADER_READ_BIT:0;
            vkCmdPipelineBarrier(command, existing?(VK_PIPELINE_STAGE_VERTEX_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT):VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, 0, 0, nullptr, 0, nullptr, 1, &barrier);
            vkCmdCopyBufferToImage(command, staging.handle, i.handle, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, copies.size(), copies.data());
            barrier.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL; barrier.newLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
            barrier.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT; barrier.dstAccessMask = VK_ACCESS_SHADER_READ_BIT;
            vkCmdPipelineBarrier(command, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, 0, 0, nullptr, 0, nullptr, 1, &barrier);
            if(recordOnly){retained->push_back(staging);staging={};}else submit();
        } catch (...) { destroy(staging); throw; }
        destroy(staging);
    }
    void resetTarget() {
        if (framebuffer) vkDestroyFramebuffer(device, framebuffer, nullptr);
        framebuffer = {};
        for (auto& c : colors) destroy(c);
        colors.clear(); destroy(depth); destroy(readback); width = height = 0;
    }
    void resetScene() {
        check(vkDeviceWaitIdle(device), "vkDeviceWaitIdle(material)"); resetTarget();
        followingDraws.clear();
        drawOrder.clear();
        drawVisible=true;
        if (pipeline) vkDestroyPipeline(device, pipeline, nullptr);
        pipeline = {};
        if (layout) vkDestroyPipelineLayout(device, layout, nullptr);
        layout = {};
        if (descriptorPool) vkDestroyDescriptorPool(device, descriptorPool, nullptr);
        descriptorPool = {}; descriptorSet = {};
        if (setLayout) vkDestroyDescriptorSetLayout(device, setLayout, nullptr);
        setLayout = {};
        if (pass) vkDestroyRenderPass(device, pass, nullptr);
        pass = {};
        for (auto& r : resources) { destroy(r.buffer); if(r.sharedImage){r.sharedImage.reset();r.image={};}else destroy(r.image); if (r.sampler) vkDestroySampler(device, r.sampler, nullptr); }
        resources.clear();externalBindings.clear(); destroy(vertices); destroy(indices);
    }
    void createPass() {
        std::vector<VkAttachmentDescription> attachments(colorCount + 1);
        std::vector<VkAttachmentReference> refs(colorCount);
        for (uint32_t i = 0; i < colorCount; i++) {
            auto& a = attachments[i]; a.format = colorFormats[i]; a.samples = VK_SAMPLE_COUNT_1_BIT;
            a.loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR; a.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
            a.stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE; a.stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
            a.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED; a.finalLayout = VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
            refs[i] = {i, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL};
        }
        auto& d = attachments[colorCount]; d = attachments[0]; d.format = VK_FORMAT_D32_SFLOAT; d.storeOp = VK_ATTACHMENT_STORE_OP_STORE; d.finalLayout = VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
        if(loadSharedDepth){d.loadOp=VK_ATTACHMENT_LOAD_OP_LOAD;d.initialLayout=VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;}
        VkAttachmentReference depthRef{colorCount, VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL};
        VkSubpassDescription sub{}; sub.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS; sub.colorAttachmentCount = colorCount; sub.pColorAttachments = refs.data(); sub.pDepthStencilAttachment = &depthRef;
        VkSubpassDependency deps[2]{}; deps[0].srcSubpass = VK_SUBPASS_EXTERNAL; deps[0].dstSubpass = 0;
        deps[0].srcStageMask = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT; deps[0].dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT | VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT;
        deps[0].dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT | VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT;
        if(loadSharedDepth){deps[0].srcStageMask=VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT|VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT;deps[0].srcAccessMask=VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT;deps[0].dstAccessMask|=VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT;}
        deps[1].srcSubpass = 0; deps[1].dstSubpass = VK_SUBPASS_EXTERNAL; deps[1].srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; deps[1].dstStageMask = VK_PIPELINE_STAGE_TRANSFER_BIT;
        deps[1].srcAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT; deps[1].dstAccessMask = VK_ACCESS_TRANSFER_READ_BIT;
        VkRenderPassCreateInfo info{VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO}; info.attachmentCount = attachments.size(); info.pAttachments = attachments.data(); info.subpassCount = 1; info.pSubpasses = &sub; info.dependencyCount = 2; info.pDependencies = deps;
        check(vkCreateRenderPass(device, &info, nullptr, &pass), "vkCreateRenderPass(material)");
    }
    VkShaderModule shader(const uint8_t* data, uint32_t bytes) {
        if (bytes < 20 || bytes % 4) throw std::runtime_error("Material SPIR-V length invalid");
        // Wire fields need not align the following module to a C++ uint32_t.
        std::vector<uint32_t> code(bytes / 4); memcpy(code.data(), data, bytes);
        if (code[0] != 0x07230203) throw std::runtime_error("Material SPIR-V magic invalid");
        VkShaderModuleCreateInfo info{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO}; info.pCode = code.data(); info.codeSize = bytes;
        VkShaderModule module; check(vkCreateShaderModule(device, &info, nullptr, &module), "vkCreateShaderModule(material)"); return module;
    }
    static uint32_t formatBytes(uint32_t format) {
        switch (format) {
        case VK_FORMAT_R32_SFLOAT: case VK_FORMAT_R16G16_SFLOAT: case VK_FORMAT_R8G8B8A8_UNORM: case VK_FORMAT_R8G8B8A8_SNORM: return 4;
        case VK_FORMAT_R32G32_SFLOAT: case VK_FORMAT_R16G16B16A16_SFLOAT: return 8;
        case VK_FORMAT_R32G32B32_SFLOAT: return 12;
        case VK_FORMAT_R32G32B32A32_SFLOAT: return 16;
        default: throw std::runtime_error("Material vertex format unsupported");
        }
    }
    static VkFormat textureFormat(uint32_t format) {
        switch (format) {
        case 1: return VK_FORMAT_R8_UNORM;
        case 2: return VK_FORMAT_R8G8B8A8_UNORM;
        case 3: return VK_FORMAT_R32_SFLOAT;
        case 4: return VK_FORMAT_R32G32B32A32_SFLOAT;
        case 5: return VK_FORMAT_R16_SFLOAT;
        case 6: return VK_FORMAT_R16G16_SFLOAT;
        case 7: return VK_FORMAT_R16G16B16A16_SFLOAT;
        case 8: return VK_FORMAT_R8_UINT;
        case 9: return VK_FORMAT_R8G8_UINT;
        case 10: return VK_FORMAT_R16_UINT;
        case 11: return VK_FORMAT_R16G16_UINT;
        case 12: return VK_FORMAT_R32_UINT;
        case 13: return VK_FORMAT_R8G8B8A8_UINT;
        case 14: return VK_FORMAT_R8G8B8A8_SRGB;
        default: throw std::runtime_error("Material texture format unsupported");
        }
    }
    static uint32_t texelBytes(VkFormat format) {
        switch (format) {
        case VK_FORMAT_R8_UNORM: case VK_FORMAT_R8_UINT: return 1;
        case VK_FORMAT_R16_SFLOAT: case VK_FORMAT_R8G8_UINT: case VK_FORMAT_R16_UINT: return 2;
        case VK_FORMAT_R8G8B8A8_UNORM: case VK_FORMAT_R32_SFLOAT: case VK_FORMAT_R16G16_SFLOAT:
        case VK_FORMAT_R16G16_UINT: case VK_FORMAT_R32_UINT: case VK_FORMAT_R8G8B8A8_UINT: case VK_FORMAT_R8G8B8A8_SRGB: return 4;
        case VK_FORMAT_R16G16B16A16_SFLOAT: return 8;
        case VK_FORMAT_R32G32B32A32_SFLOAT: return 16;
        default: throw std::runtime_error("Material texel size unsupported");
        }
    }
    static float halfFloat(uint16_t bits) {
        const uint32_t sign = uint32_t(bits & 0x8000) << 16, exponent = (bits >> 10) & 31, mantissa = bits & 1023;
        uint32_t out;
        if (!exponent) {
            if (!mantissa) out = sign;
            else { uint32_t m = mantissa, e = 113; while (!(m & 1024)) { m <<= 1; --e; } out = sign | (e << 23) | ((m & 1023) << 13); }
        } else out = sign | ((exponent == 31 ? 255 : exponent + 112) << 23) | (mantissa << 13);
        float value; memcpy(&value, &out, 4); return value;
    }
    void createPipeline(const uint8_t* vs, uint32_t vb, const uint8_t* fs, uint32_t fb, uint32_t stride, const std::vector<VkVertexInputAttributeDescription>& attrs) {
        VkPipelineLayoutCreateInfo li{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO}; li.setLayoutCount = 1; li.pSetLayouts = &setLayout;
        check(vkCreatePipelineLayout(device, &li, nullptr, &layout), "vkCreatePipelineLayout(material)");
        VkShaderModule vertex = shader(vs, vb), fragment{};
        try {
            fragment = shader(fs, fb);
            VkPipelineShaderStageCreateInfo stages[2]{}; for (auto& s : stages) { s.sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO; s.pName = "main"; }
            stages[0].stage = VK_SHADER_STAGE_VERTEX_BIT; stages[0].module = vertex; stages[1].stage = VK_SHADER_STAGE_FRAGMENT_BIT; stages[1].module = fragment;
            VkVertexInputBindingDescription binding{0, stride, VK_VERTEX_INPUT_RATE_VERTEX};
            VkPipelineVertexInputStateCreateInfo input{VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO}; input.vertexBindingDescriptionCount = attrs.empty() ? 0 : 1; input.pVertexBindingDescriptions = attrs.empty() ? nullptr : &binding; input.vertexAttributeDescriptionCount = attrs.size(); input.pVertexAttributeDescriptions = attrs.data();
            VkPipelineInputAssemblyStateCreateInfo assembly{VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO}; assembly.topology = pointList ? VK_PRIMITIVE_TOPOLOGY_POINT_LIST : state == 3 || state == 5 ? VK_PRIMITIVE_TOPOLOGY_LINE_LIST : VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
            VkPipelineViewportStateCreateInfo viewport{VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO}; viewport.viewportCount = 1; viewport.scissorCount = 1;
            VkPipelineRasterizationStateCreateInfo raster{VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO}; raster.polygonMode = VK_POLYGON_MODE_FILL; raster.frontFace = VK_FRONT_FACE_COUNTER_CLOCKWISE; raster.cullMode = state < 3 || state == 9 || state == 11 ? VK_CULL_MODE_BACK_BIT : VK_CULL_MODE_NONE; raster.lineWidth = 1; raster.depthBiasEnable = state == 1 || state == 2;
            VkPipelineMultisampleStateCreateInfo samples{VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO}; samples.rasterizationSamples = VK_SAMPLE_COUNT_1_BIT;
            VkPipelineDepthStencilStateCreateInfo depthState{VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO}; depthState.depthTestEnable = state != 4 && state != 5 && state != 8 && state != 12; depthState.depthWriteEnable = state == 0 || state == 6; depthState.depthCompareOp = VK_COMPARE_OP_LESS_OR_EQUAL;
            std::vector<VkPipelineColorBlendAttachmentState> attachments(colorCount);
            for (auto& a : attachments) { a.colorWriteMask = 15; a.blendEnable = state == 1 || state == 2 || state == 7; a.srcColorBlendFactor = VK_BLEND_FACTOR_SRC_ALPHA; a.dstColorBlendFactor = VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA; a.colorBlendOp = VK_BLEND_OP_ADD; a.srcAlphaBlendFactor = VK_BLEND_FACTOR_ZERO; a.dstAlphaBlendFactor = VK_BLEND_FACTOR_ONE; a.alphaBlendOp = VK_BLEND_OP_ADD; }
            // Original Cloud list 20: only the first two attachments blend.
            // RGB = source.rgb * source.a + destination.rgb; A = source.a + A.
            // Original transparent lists blend the first two attachments;
            // later attachments overwrite, and alpha is ONE/(1-srcAlpha).
            if (state == 9 || state == 10) for (uint32_t i = 0; i < std::min<uint32_t>(2, colorCount); ++i) {
                auto& a = attachments[i]; a.blendEnable = VK_TRUE;
                a.srcAlphaBlendFactor = VK_BLEND_FACTOR_ONE;
                a.dstAlphaBlendFactor = VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
            }
            if (state == 8) for (uint32_t i = 0; i < std::min<uint32_t>(2, colorCount); ++i) {
                auto& a = attachments[i]; a.blendEnable = VK_TRUE;
                a.dstColorBlendFactor = VK_BLEND_FACTOR_ONE;
                a.srcAlphaBlendFactor = a.dstAlphaBlendFactor = VK_BLEND_FACTOR_ONE;
            }
            // Original Skybox list shares the opaque RGB/depth attachment.
            // Blend only RGB and preserve destination distance in alpha.
            if(state == 12){auto& a=attachments[0];a.blendEnable=VK_TRUE;a.srcColorBlendFactor=a.dstColorBlendFactor=a.srcAlphaBlendFactor=a.dstAlphaBlendFactor=VK_BLEND_FACTOR_ONE;}
            if(state == 11){auto& a=attachments[0];a.blendEnable=VK_TRUE;a.colorWriteMask=VK_COLOR_COMPONENT_R_BIT|VK_COLOR_COMPONENT_G_BIT|VK_COLOR_COMPONENT_B_BIT;}
            VkPipelineColorBlendStateCreateInfo blend{VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO}; blend.attachmentCount = colorCount; blend.pAttachments = attachments.data();
            VkDynamicState states[] = {VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR, VK_DYNAMIC_STATE_DEPTH_BIAS};
            VkPipelineDynamicStateCreateInfo dynamic{VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO}; dynamic.dynamicStateCount = 3; dynamic.pDynamicStates = states;
            VkGraphicsPipelineCreateInfo info{VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO}; info.stageCount = 2; info.pStages = stages; info.pVertexInputState = &input; info.pInputAssemblyState = &assembly; info.pViewportState = &viewport; info.pRasterizationState = &raster; info.pMultisampleState = &samples; info.pDepthStencilState = &depthState; info.pColorBlendState = &blend; info.pDynamicState = &dynamic; info.layout = layout; info.renderPass = pass;
            check(vkCreateGraphicsPipelines(device, pipelineCache, 1, &info, nullptr, &pipeline), "vkCreateGraphicsPipelines(material)");
        } catch (...) { if (fragment) vkDestroyShaderModule(device, fragment, nullptr); vkDestroyShaderModule(device, vertex, nullptr); throw; }
        vkDestroyShaderModule(device, vertex, nullptr); vkDestroyShaderModule(device, fragment, nullptr);
    }
public:
    MaterialRenderer(VkDevice dev, VkPhysicalDevice phys, VkQueue q, VkCommandPool p, bool viewport=false, VkPipelineCache cache=VK_NULL_HANDLE, bool sharedDepth=false, std::shared_ptr<SkyTextureCache> imageCache={}): device(dev), physical(phys), queue(q), pool(p), pipelineCache(cache), textureCache(imageCache), viewportTarget(viewport), loadSharedDepth(sharedDepth) {
        VkCommandBufferAllocateInfo ai{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO}; ai.commandPool = pool; ai.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY; ai.commandBufferCount = 1;
        check(vkAllocateCommandBuffers(device, &ai, &command), "vkAllocateCommandBuffers(material)");
        VkFenceCreateInfo fi{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO}; check(vkCreateFence(device, &fi, nullptr, &fence), "vkCreateFence(material)");
    }
    ~MaterialRenderer() { resetScene(); if (fence) vkDestroyFence(device, fence, nullptr); if (command) vkFreeCommandBuffers(device, pool, 1, &command); }
    void scene(const uint8_t* bytes, size_t length, std::shared_ptr<SkyTextureTable> table={}) {
        if(!table)table=std::make_shared<SkyTextureTable>();
        Reader r{bytes, length}; const auto vsBytes = r.u32(), fsBytes = r.u32(), stride = r.u32(), attrCount = r.u32(), resourceCount = r.u32();
        const auto outputs = r.u32(), encodedState = r.u32(), vertexBytes = r.u32(), nextIndexCount = r.u32();
        const auto nextState=encodedState&255u;const bool nextPoints=(encodedState&0x100u)!=0;
        if (!stride || stride > 256 || attrCount > 16 || resourceCount > 32 || !outputs || outputs > 4 || encodedState&~0x1ffu || nextState > 12 || (nextPoints&&(nextState==3||nextState==5)) || vertexBytes % stride || vertexBytes > 400000000 || nextIndexCount > 20000000 || nextIndexCount % (nextPoints?1:nextState == 3 || nextState == 5 ? 2 : 3)) throw std::runtime_error("Material scene header invalid");
        const auto* vs = r.take(vsBytes); const auto* fs = r.take(fsBytes);
        std::vector<VkVertexInputAttributeDescription> attrs(attrCount);
        for (auto& a : attrs) { a.location = r.u32(); a.binding = 0; a.format = VkFormat(r.u32()); a.offset = r.u32(); if (a.location >= 16 || uint64_t(a.offset) + formatBytes(a.format) > stride) throw std::runtime_error("Material vertex attribute invalid"); }
        for (size_t i = 0; i < attrs.size(); i++) for (size_t j = 0; j < i; j++) if (attrs[i].location == attrs[j].location) throw std::runtime_error("Material vertex location duplicated");
        resetScene(); colorCount = outputs; state = nextState; pointList=nextPoints; indexCount = nextIndexCount; vertexCount = vertexBytes / stride;vertexStride=stride;
        VkPhysicalDeviceProperties properties; vkGetPhysicalDeviceProperties(physical, &properties);
        if (colorCount > properties.limits.maxColorAttachments) throw std::runtime_error("Vulkan MRT limit exceeded");
        std::vector<VkDescriptorSetLayoutBinding> bindings;
        uint32_t buffers = 0, textures = 0;
        resources.reserve(resourceCount);
        for (uint32_t j = 0; j < resourceCount; j++) {
            const auto binding = r.u32(), encodedKind = r.u32(), format = r.u32(), w = r.u32(), h = r.u32(), d = r.u32(), filter = r.u32(), address = r.u32(), n = r.u32();const auto kind=encodedKind&3u;const bool reference=(encodedKind&4u)!=0;
            const auto* data = r.take(n);
            const uint32_t mipLevels = ((filter & 255u) >> 1) + 1, anisotropy = filter >> 8;
            const bool linear = filter & 1;
            if (encodedKind > 7 || (reference&&(!kind||n||format>=table->size())) || mipLevels > 15 || anisotropy > 16 || (anisotropy > 1 && !linear) || ((address & 0x80000000u) ? (address & 0x7fffffc0u) != 0 : address > 1)) throw std::runtime_error("Material resource header invalid");
            for (const auto& previous : resources) if (previous.binding == binding) throw std::runtime_error("Material binding duplicated");
            resources.push_back({binding, kind}); auto& resource = resources.back();resource.w=w;resource.h=h;resource.d=d;resource.mips=mipLevels;resource.bytes=n;
            if (!kind) {
                if (!n || n > properties.limits.maxUniformBufferRange) throw std::runtime_error("Material uniform buffer size invalid");
                resource.buffer = buffer(n, VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT, data); buffers++;
            } else {
                const uint32_t imageFormat=reference?(*table)[format]->format:format;
                const VkFormat f = textureFormat(imageFormat);resource.format=imageFormat;
                const uint32_t pixelBytes = texelBytes(f);resource.pixelBytes=pixelBytes;
                const uint32_t limit = kind == 3 ? properties.limits.maxImageDimensionCube : kind == 2 ? properties.limits.maxImageDimension3D : properties.limits.maxImageDimension2D;
                const uint32_t maxDimension = std::max(std::max(w, h), kind == 2 ? d : 1u);
                uint64_t totalBytes = 0;
                for (uint32_t level = 0; level < mipLevels; ++level)
                    totalBytes += uint64_t(std::max(1u, w >> level)) * std::max(1u, h >> level) * (kind == 3 ? 6u : kind == 2 ? std::max(1u, d >> level) : 1u) * pixelBytes;
                if (!w || !h || !d || w > limit || h > limit || d > limit || (kind == 1 && d != 1) || (kind == 3 && (d != 6 || w != h))
                    || (1u << (mipLevels - 1)) > maxDimension || f == VK_FORMAT_UNDEFINED || totalBytes != (reference?(*table)[format]->bytes:n) || (imageFormat >= 8 && imageFormat <= 13 && linear)) throw std::runtime_error("Material texture size/format invalid");
                VkFormatProperties fp; vkGetPhysicalDeviceFormatProperties(physical, f, &fp);
                const VkFormatFeatureFlags required = VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | (linear ? VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT : 0);
                if ((fp.optimalTilingFeatures & required) != required) throw std::runtime_error("Material texture filtering unsupported");
                if(reference){
                    resource.sharedImage=(*table)[format];const auto& shared=*resource.sharedImage;
                    if(shared.kind!=kind||shared.w!=w||shared.h!=h||shared.d!=d||shared.mips!=mipLevels)throw std::runtime_error("Material shared texture layout mismatch");
                    resource.bytes=shared.bytes;
                }else{
                    std::string key;
                    if(textureCache&&kind==1&&n>=65536&&n<=SkyTextureCache::budget){const uint32_t header[]={imageFormat,w,h,d,mipLevels};key.assign(reinterpret_cast<const char*>(header),sizeof(header));key.append(reinterpret_cast<const char*>(data),n);resource.sharedImage=textureCache->get(key);}
                    if(!resource.sharedImage){
                        auto next=image(w,h,d,kind==2,f,VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT,VK_IMAGE_ASPECT_COLOR_BIT,kind==3,mipLevels);
                        resource.sharedImage=SkySampledImagePtr(new SkySampledImage{device,next,kind,imageFormat,w,h,d,mipLevels,n});
                        upload(resource.sharedImage->image,w,h,d,data,n,kind==2,kind==3,mipLevels,pixelBytes);
                        if(!key.empty())textureCache->put(std::move(key),resource.sharedImage);
                    }
                    table->push_back(resource.sharedImage);
                }
                resource.image=resource.sharedImage->image;
                VkSamplerCreateInfo si{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO}; si.minFilter = si.magFilter = linear ? VK_FILTER_LINEAR : VK_FILTER_NEAREST;
                si.mipmapMode = linear ? VK_SAMPLER_MIPMAP_MODE_LINEAR : VK_SAMPLER_MIPMAP_MODE_NEAREST;
                if(anisotropy > 1) {
                    VkPhysicalDeviceFeatures supported{}; vkGetPhysicalDeviceFeatures(physical, &supported);
                    VkPhysicalDeviceProperties properties{}; vkGetPhysicalDeviceProperties(physical, &properties);
                    si.anisotropyEnable = supported.samplerAnisotropy && !trilinearSamplerCompatibility(properties);
                    si.maxAnisotropy = si.anisotropyEnable ? std::min(float(anisotropy), properties.limits.maxSamplerAnisotropy) : 1.f;
                }
                si.maxLod = float(mipLevels - 1); si.addressModeU = si.addressModeV = si.addressModeW = address ? VK_SAMPLER_ADDRESS_MODE_REPEAT : VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
                if(address & 0x80000000u) {
                    const VkSamplerAddressMode modes[]={VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,VK_SAMPLER_ADDRESS_MODE_REPEAT,VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT,VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER};
                    si.addressModeU=modes[address & 3]; si.addressModeV=modes[(address >> 2) & 3]; si.addressModeW=modes[(address >> 4) & 3];
                }
                check(vkCreateSampler(device, &si, nullptr, &resource.sampler), "vkCreateSampler(material)"); textures++;
            }
            bindings.push_back({binding, kind ? VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER : VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER, 1, VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_FRAGMENT_BIT, nullptr});
        }
        const auto* vertexData = r.take(vertexBytes); const auto* indexData = r.take(uint64_t(indexCount) * 4);
        for (uint32_t i = 0; i < indexCount; i++) { uint32_t index; memcpy(&index, indexData + uint64_t(i) * 4, 4); if (index >= vertexCount) throw std::runtime_error("Material index out of range"); }
        colorFormats.assign(colorCount, VK_FORMAT_R32G32B32A32_SFLOAT);
        if (r.remaining == colorCount * 4) {
            for (auto& format : colorFormats) { const uint32_t code = r.u32(); if (code < 3 || code > 7) throw std::runtime_error("Material attachment format invalid"); format = textureFormat(code); }
        }
        if (r.remaining) throw std::runtime_error("Material scene trailing bytes");
        for (uint32_t i = 0; i < colorCount; ++i) {
            auto format = colorFormats[i];
            VkFormatProperties fp; vkGetPhysicalDeviceFormatProperties(physical, format, &fp);
            if (!(fp.optimalTilingFeatures & VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT)) throw std::runtime_error("Material color attachment format unsupported");
            if ((state == 1 || state == 2 || state == 7 || ((state == 11 || state == 12) && i == 0) || ((state == 8 || state == 9 || state == 10) && i < 2)) && !(fp.optimalTilingFeatures & VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT)) throw std::runtime_error("Material attachment blending unsupported");
        }
        vertices = buffer(vertexBytes, VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, vertexData); indices = buffer(uint64_t(indexCount) * 4, VK_BUFFER_USAGE_INDEX_BUFFER_BIT, indexData);
        VkDescriptorSetLayoutCreateInfo li{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO}; li.bindingCount = bindings.size(); li.pBindings = bindings.data();
        check(vkCreateDescriptorSetLayout(device, &li, nullptr, &setLayout), "vkCreateDescriptorSetLayout(material)");
        std::vector<VkDescriptorPoolSize> sizes; if (buffers) sizes.push_back({VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER, buffers}); if (textures) sizes.push_back({VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, textures});
        VkDescriptorPoolCreateInfo pi{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO}; pi.maxSets = 1; pi.poolSizeCount = sizes.size(); pi.pPoolSizes = sizes.data();
        check(vkCreateDescriptorPool(device, &pi, nullptr, &descriptorPool), "vkCreateDescriptorPool(material)");
        VkDescriptorSetAllocateInfo ai{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO}; ai.descriptorPool = descriptorPool; ai.descriptorSetCount = 1; ai.pSetLayouts = &setLayout;
        check(vkAllocateDescriptorSets(device, &ai, &descriptorSet), "vkAllocateDescriptorSets(material)");
        for (const auto& resource : resources) {
            VkDescriptorBufferInfo bufferInfo{resource.buffer.handle, 0, resource.buffer.size}; VkDescriptorImageInfo imageInfo{resource.sampler, resource.image.view, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
            VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET}; write.dstSet = descriptorSet; write.dstBinding = resource.binding; write.descriptorCount = 1;
            write.descriptorType = resource.kind ? VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER : VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER; write.pBufferInfo = resource.kind ? nullptr : &bufferInfo; write.pImageInfo = resource.kind ? &imageInfo : nullptr;
            vkUpdateDescriptorSets(device, 1, &write, 0, nullptr);
        }
        if(viewportTarget) {
            if(colorCount!=1)throw std::runtime_error("Viewport material requires one color attachment");
            colorFormats[0]=VK_FORMAT_R32G32B32A32_SFLOAT;
        }
        createPass(); createPipeline(vs, vsBytes, fs, fsBytes, stride, attrs);
    }
    void batch(const uint8_t* bytes, size_t length) {
        Reader r{bytes, length}; const uint32_t count = r.u32();
        if (!count || count > 4096) throw std::runtime_error("Material draw count invalid");
        // Parse every bounded payload before constructing GPU resources.
        std::vector<std::pair<const uint8_t*, uint32_t>> payloads;
        for (uint32_t i = 0; i < count; ++i) { const uint32_t n = r.u32(); payloads.push_back({r.take(n), n}); }
        if (r.remaining) throw std::runtime_error("Material batch trailing bytes");
        auto table=std::make_shared<SkyTextureTable>();
        scene(payloads[0].first, payloads[0].second,table);
        for (uint32_t i = 1; i < count; ++i) {
            auto draw = std::make_unique<MaterialRenderer>(device, physical, queue, pool, viewportTarget, pipelineCache, loadSharedDepth,textureCache);
            draw->scene(payloads[i].first, payloads[i].second,table);
            if (draw->colorFormats != colorFormats) throw std::runtime_error("Material batch attachment mismatch");
            followingDraws.push_back(std::move(draw));
        }
    }
    void draw(VkCommandBuffer cmd) {
        if(!drawVisible)return;
        vkCmdSetDepthBias(cmd, 0, 0, state == 1 || state == 2 ? -2.f : 0.f);
        vkCmdBindPipeline(cmd, VK_PIPELINE_BIND_POINT_GRAPHICS, pipeline);
        vkCmdBindDescriptorSets(cmd, VK_PIPELINE_BIND_POINT_GRAPHICS, layout, 0, 1, &descriptorSet, 0, nullptr);
        VkDeviceSize offset = 0;
        if (vertices.handle) vkCmdBindVertexBuffers(cmd, 0, 1, &vertices.handle, &offset);
        vkCmdBindIndexBuffer(cmd, indices.handle, 0, VK_INDEX_TYPE_UINT32);
        vkCmdDrawIndexed(cmd, indexCount, 1, 0, 0, 0);
    }
    uint32_t outputs() const { return colorCount; }
    Image& outputImage(uint32_t attachment) { if(attachment>=colors.size())throw std::runtime_error("Material output unavailable");return colors[attachment]; }
    VkFormat outputFormat(uint32_t attachment) const {if(attachment>=colorFormats.size())throw std::runtime_error("Material output format unavailable");return colorFormats[attachment];}
    MaterialRenderer& batchDraw(uint32_t draw){if(draw>followingDraws.size())throw std::runtime_error("Material batch draw unavailable");return draw?*followingDraws[draw-1]:*this;}
    void uniformFloat(uint32_t binding,uint32_t offset,float value){
        auto r=std::find_if(resources.begin(),resources.end(),[&](const Resource& item){return item.binding==binding&&item.kind==0;});
        if(r==resources.end()||offset%4||uint64_t(offset)+4>r->bytes||!std::isfinite(value))throw std::runtime_error("Material scalar uniform invalid");
        void* mapped;check(vkMapMemory(device,r->buffer.memory,0,r->buffer.size,0,&mapped),"vkMapMemory(full exposure)");memcpy(static_cast<uint8_t*>(mapped)+offset,&value,4);vkUnmapMemory(device,r->buffer.memory);
    }
    // Dynamic CloudCard vertices change with the camera. Keep their original
    // pipeline/descriptors and replace only the bounded geometry buffers.
    void geometryBatch(const uint8_t* data,size_t bytes){
        Reader r{data,bytes};auto count=r.u32();if(count!=followingDraws.size()+1)throw std::runtime_error("Material geometry draw count mismatch");
        struct Update{MaterialRenderer* draw;const uint8_t* vertices;const uint8_t* indices;uint32_t vb,ic,stride;};std::vector<Update> updates;
        for(uint32_t i=0;i<count;i++){
            auto& draw=batchDraw(i);auto vb=r.u32(),ic=r.u32(),stride=r.u32();
            if(!vb&&!ic&&!stride)continue;
            if(stride!=draw.vertexStride||vb%stride||vb>400000000||ic>20000000||ic%(draw.pointList?1:draw.state==3||draw.state==5?2:3))throw std::runtime_error("Material geometry size invalid");
            auto v=r.take(vb),ix=r.take(uint64_t(ic)*4);for(uint32_t j=0;j<ic;j++){uint32_t index;memcpy(&index,ix+uint64_t(j)*4,4);if(index>=vb/stride)throw std::runtime_error("Material geometry index invalid");}
            updates.push_back({&draw,v,ix,vb,ic,stride});
        }
        if(r.remaining)throw std::runtime_error("Material geometry trailing bytes");
        for(auto& u:updates){
            auto write=[&](Buffer& b,const uint8_t* src,uint64_t n,VkBufferUsageFlags usage){if(b.size<std::max<uint64_t>(n,4)){auto next=buffer(n,usage,src);destroy(b);b=next;}else{void* p;check(vkMapMemory(device,b.memory,0,b.size,0,&p),"vkMapMemory(dynamic geometry)");if(n)memcpy(p,src,n);vkUnmapMemory(device,b.memory);}};
            write(u.draw->vertices,u.vertices,u.vb,VK_BUFFER_USAGE_VERTEX_BUFFER_BIT);write(u.draw->indices,u.indices,uint64_t(u.ic)*4,VK_BUFFER_USAGE_INDEX_BUFFER_BIT);u.draw->vertexCount=u.vb/u.stride;u.draw->indexCount=u.ic;
        }
    }
    // Borrow the source view for this completed frame. Our ordinary tiny
    // fallback texture retains its ownership; resizing the source is safe.
    void bindExternalTexture(uint32_t binding,VkImageView view) {
        auto r=std::find_if(resources.begin(),resources.end(),[&](const Resource& item){return item.binding==binding&&item.kind==1;});
        if(r==resources.end()||!view)throw std::runtime_error("External texture binding invalid");
        VkDescriptorImageInfo info{r->sampler,view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
        VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};write.dstSet=descriptorSet;write.dstBinding=binding;write.descriptorCount=1;write.descriptorType=VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;write.pImageInfo=&info;
        vkUpdateDescriptorSets(device,1,&write,0,nullptr);
        if(std::find(externalBindings.begin(),externalBindings.end(),binding)==externalBindings.end())externalBindings.push_back(binding);
    }
    void bindOwnTexture(uint32_t binding){auto r=std::find_if(resources.begin(),resources.end(),[&](const Resource& item){return item.binding==binding&&item.kind==1;});if(r==resources.end())throw std::runtime_error("Fallback texture unavailable");bindExternalTexture(binding,r->image.view);}
    void resetExternalTextures(){
        // A cached stage can lose a graph link when the next map has no cloud
        // or transparent draws. Restore its owned fallback before new links
        // are bound; a descriptor must never retain a released target view.
        const auto bindings=std::move(externalBindings);externalBindings.clear();
        for(auto binding:bindings)bindOwnTexture(binding);
        externalBindings.clear();
        for(auto& draw:followingDraws)draw->resetExternalTextures();
    }
    void releaseTarget() { resetTarget();sharedDepthView={}; }
    void uniformBatch(const uint8_t* data,size_t bytes) {
        Reader r{data,bytes};const auto count=r.u32();
        if(count!=followingDraws.size()+1)throw std::runtime_error("Viewport uniform draw count mismatch");
        struct Update {Buffer* buffer;const uint8_t* data;uint32_t bytes;};std::vector<Update> updates;
        for(uint32_t i=0;i<count;++i) {
            auto* draw=i?followingDraws[i-1].get():this;const auto blocks=r.u32();
            if(blocks>32)throw std::runtime_error("Viewport uniform block count invalid");
            std::vector<uint32_t> seen;
            for(uint32_t j=0;j<blocks;++j) {
                const auto binding=r.u32(),n=r.u32();const auto* payload=r.take(n);
                auto resource=std::find_if(draw->resources.begin(),draw->resources.end(),[&](const Resource& item){return item.binding==binding&&item.kind==0;});
                if(resource==draw->resources.end()||n!=resource->buffer.size||std::find(seen.begin(),seen.end(),binding)!=seen.end())throw std::runtime_error("Viewport uniform layout mismatch");
                seen.push_back(binding);updates.push_back({&resource->buffer,payload,n});
            }
        }
        if(r.remaining)throw std::runtime_error("Viewport uniform trailing bytes");
        for(const auto& update:updates){void* mapped;check(vkMapMemory(device,update.buffer->memory,0,update.bytes,0,&mapped),"vkMapMemory(viewport uniform)");memcpy(mapped,update.data,update.bytes);vkUnmapMemory(device,update.buffer->memory);}
    }
    void resourceBatch(const uint8_t* data,size_t bytes) {
        Reader r{data,bytes};const auto count=r.u32();
        if(count!=followingDraws.size()+1)throw std::runtime_error("Viewport resource draw count mismatch");
        struct Update {MaterialRenderer* owner;Resource* resource;const uint8_t* data;uint32_t bytes;};std::vector<Update> updates;bool images=false;std::vector<std::pair<const uint8_t*,uint32_t>> textureData;
        for(uint32_t i=0;i<count;++i){
            auto* draw=i?followingDraws[i-1].get():this;const auto blocks=r.u32();
            if(blocks>32)throw std::runtime_error("Viewport resource count invalid");std::vector<uint32_t> seen;
            for(uint32_t j=0;j<blocks;++j){const auto binding=r.u32(),word=r.u32();
                auto resource=std::find_if(draw->resources.begin(),draw->resources.end(),[&](const Resource& item){return item.binding==binding;});
                if(resource==draw->resources.end()||std::find(seen.begin(),seen.end(),binding)!=seen.end())throw std::runtime_error("Viewport resource layout mismatch");
                uint32_t n=word;const uint8_t* payload;
                if(word&0x80000000u){const auto index=word&0x7fffffffu;if(!resource->kind||index>=textureData.size())throw std::runtime_error("Viewport texture update reference invalid");payload=textureData[index].first;n=textureData[index].second;}
                else{payload=r.take(n);if(resource->kind)textureData.push_back({payload,n});}
                if(n!=resource->bytes)throw std::runtime_error("Viewport resource byte size mismatch");
                seen.push_back(binding);images|=resource->kind!=0;updates.push_back({draw,&*resource,payload,n});
            }
        }
        if(r.remaining)throw std::runtime_error("Viewport resource trailing bytes");
        std::vector<Buffer> retained;
        struct Patch {const uint8_t* data;uint32_t bytes;SkySampledImagePtr image;};
        std::unordered_map<VkImage,std::vector<Patch>> patches;
        auto rebind=[&](const Update& update){auto& resource=*update.resource;VkDescriptorImageInfo imageInfo{resource.sampler,resource.image.view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};write.dstSet=update.owner->descriptorSet;write.dstBinding=resource.binding;write.descriptorCount=1;write.descriptorType=VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;write.pImageInfo=&imageInfo;vkUpdateDescriptorSets(device,1,&write,0,nullptr);};
        try{
            if(images)begin();
            for(const auto& update:updates){auto& resource=*update.resource;
                if(resource.kind){
                    auto& candidates=patches[resource.image.handle];
                    auto same=std::find_if(candidates.begin(),candidates.end(),[&](const Patch& patch){return patch.bytes==update.bytes&&!memcmp(patch.data,update.data,update.bytes);});
                    if(same!=candidates.end()){resource.sharedImage=same->image;resource.image=same->image->image;rebind(update);continue;}
                    const bool copied=resource.sharedImage&&resource.sharedImage.use_count()>1;
                    if(copied){
                        auto next=image(resource.w,resource.h,resource.d,resource.kind==2,textureFormat(resource.format),VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT,VK_IMAGE_ASPECT_COLOR_BIT,resource.kind==3,resource.mips);
                        resource.sharedImage=SkySampledImagePtr(new SkySampledImage{device,next,resource.kind,resource.format,resource.w,resource.h,resource.d,resource.mips,resource.bytes});resource.image=next;
                        rebind(update);
                    }
                    upload(resource.image,resource.w,resource.h,resource.d,update.data,update.bytes,resource.kind==2,resource.kind==3,resource.mips,resource.pixelBytes,true,!copied,&retained);
                    candidates.push_back({update.data,update.bytes,resource.sharedImage});
                }
                else{void* mapped;check(vkMapMemory(device,resource.buffer.memory,0,update.bytes,0,&mapped),"vkMapMemory(viewport resource)");memcpy(mapped,update.data,update.bytes);vkUnmapMemory(device,resource.buffer.memory);}
            }
            if(images)submit();
        }catch(...){for(auto& buffer:retained)destroy(buffer);throw;}
        for(auto& buffer:retained)destroy(buffer);
    }
    void setDrawOrder(const std::vector<uint32_t>& order) {
        if(order.size()!=followingDraws.size()+1)throw std::runtime_error("Viewport draw order count mismatch");
        std::vector<bool> seen(order.size(),false);
        for(auto i:order){if(i>=order.size()||seen[i])throw std::runtime_error("Viewport draw order invalid");seen[i]=true;}
        drawOrder=order;
    }
    void setDrawVisibility(const std::vector<uint32_t>& visibility) {
        if(visibility.size()!=followingDraws.size()+1)throw std::runtime_error("Viewport visibility count mismatch");
        for(size_t i=0;i<visibility.size();i++){if(visibility[i]>1)throw std::runtime_error("Viewport visibility invalid");(i?followingDraws[i-1].get():this)->drawVisible=visibility[i];}
    }
    void drawBatch(VkCommandBuffer cmd) {
        if(drawOrder.empty()){draw(cmd);for(auto& next:followingDraws)next->draw(cmd);}
        else for(auto i:drawOrder)(i?followingDraws[i-1].get():this)->draw(cmd);
    }
    void recordRender(VkCommandBuffer targetCommand,uint32_t w,uint32_t h,VkImageView externalDepth=VK_NULL_HANDLE,bool readPixels=false) {
        if (!pipeline) throw std::runtime_error("No original material scene uploaded");
        if (!w || !h || w > 4096 || h > 4096) throw std::runtime_error("Material frame dimensions invalid");
        if(loadSharedDepth!=bool(externalDepth))throw std::runtime_error("Material shared depth target mismatch");
        if (w != width || h != height || externalDepth!=sharedDepthView) {
            resetTarget(); width = w; height = h;
            sharedDepthView=externalDepth;
            for (uint32_t i = 0; i < colorCount; i++) colors.push_back(image(w, h, 1, false, colorFormats[i], VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_SAMPLED_BIT, VK_IMAGE_ASPECT_COLOR_BIT));
            if(!externalDepth)depth = image(w, h, 1, false, VK_FORMAT_D32_SFLOAT, VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT, VK_IMAGE_ASPECT_DEPTH_BIT);
            std::vector<VkImageView> views; for (const auto& c : colors) views.push_back(c.view); views.push_back(externalDepth?externalDepth:depth.view);
            VkFramebufferCreateInfo fi{VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO}; fi.renderPass = pass; fi.attachmentCount = views.size(); fi.pAttachments = views.data(); fi.width = w; fi.height = h; fi.layers = 1;
            check(vkCreateFramebuffer(device, &fi, nullptr, &framebuffer), "vkCreateFramebuffer(material)");
        }
        const auto command=targetCommand;
        std::vector<VkClearValue> clear(colorCount + 1); clear[colorCount].depthStencil = {1, 0};
        VkRenderPassBeginInfo ri{VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO}; ri.renderPass = pass; ri.framebuffer = framebuffer; ri.renderArea.extent = {w, h}; ri.clearValueCount = clear.size(); ri.pClearValues = clear.data();
        vkCmdBeginRenderPass(command, &ri, VK_SUBPASS_CONTENTS_INLINE);
        VkViewport viewport{0, 0, float(w), float(h), 0, 1}; VkRect2D scissor{{0, 0}, {w, h}};
        vkCmdSetViewport(command, 0, 1, &viewport); vkCmdSetScissor(command, 0, 1, &scissor);
        drawBatch(command);
        vkCmdEndRenderPass(command);
        if(!readPixels)return;
        if(!readback.handle)readback=buffer(uint64_t(w)*h*colorCount*16,VK_BUFFER_USAGE_TRANSFER_DST_BIT);
        for (uint32_t i = 0; i < colorCount; i++) {
            VkBufferImageCopy copy{}; copy.bufferOffset = uint64_t(i) * w * h * 16; copy.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1}; copy.imageExtent = {w, h, 1};
            vkCmdCopyImageToBuffer(command, colors[i].handle, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, readback.handle, 1, &copy);
        }
        VkBufferMemoryBarrier barrier{VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER}; barrier.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT; barrier.dstAccessMask = VK_ACCESS_HOST_READ_BIT; barrier.srcQueueFamilyIndex = barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED; barrier.buffer = readback.handle; barrier.size = VK_WHOLE_SIZE;
        vkCmdPipelineBarrier(command, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_HOST_BIT, 0, 0, nullptr, 1, &barrier, 0, nullptr);
    }
    std::vector<uint8_t> readDisplayPixels(bool reference=false){
        if(colorCount!=1||colorFormats[0]!=VK_FORMAT_R32G32B32A32_SFLOAT)throw std::runtime_error("Canvas display target invalid");
        void* mapped;check(vkMapMemory(device,readback.memory,0,readback.size,0,&mapped),"vkMapMemory(display pixels)");const auto* values=static_cast<const float*>(mapped);std::vector<uint8_t> output(uint64_t(width)*height*4);
        for(size_t i=0;i<output.size();i++){if(!std::isfinite(values[i])){vkUnmapMemory(device,readback.memory);throw std::runtime_error("Full preview nonfinite final color");}output[i]=i%4==3?255:skyDisplayByte(values[i],reference);}
        vkUnmapMemory(device,readback.memory);return output;
    }
    std::vector<uint8_t> readRenderedPixels() {
        const auto w=width,h=height;
        void* mapped; check(vkMapMemory(device, readback.memory, 0, readback.size, 0, &mapped), "vkMapMemory(material readback)");
        // Keep the host response as float32 RGBA while preserving the actual
        // attachment storage conversion. Smaller attachments fill missing lanes.
        std::vector<uint8_t> data(readback.size);
        for (uint32_t attachment = 0; attachment < colorCount; ++attachment) {
            const auto format = colorFormats[attachment]; const bool half = format == VK_FORMAT_R16_SFLOAT || format == VK_FORMAT_R16G16_SFLOAT || format == VK_FORMAT_R16G16B16A16_SFLOAT;
            const auto bytes = texelBytes(format), channels = bytes / (half ? 2 : 4);
            const auto* source = static_cast<const uint8_t*>(mapped) + uint64_t(attachment) * w * h * 16;
            for (uint64_t pixel = 0; pixel < uint64_t(w) * h; ++pixel) {
                float rgba[4] = {0, 0, 0, 1};
                for (uint32_t lane = 0; lane < channels; ++lane) {
                    if (half) { uint16_t value; memcpy(&value, source + pixel * bytes + lane * 2, 2); rgba[lane] = halfFloat(value); }
                    else memcpy(&rgba[lane], source + pixel * bytes + lane * 4, 4);
                }
                memcpy(data.data() + (uint64_t(attachment) * w * h + pixel) * 16, rgba, 16);
            }
        }
        vkUnmapMemory(device, readback.memory); return data;
    }
    std::vector<uint8_t> render(uint32_t w,uint32_t h,VkImageView externalDepth=VK_NULL_HANDLE,bool readPixels=true) {
        begin();recordRender(command,w,h,externalDepth,readPixels);submit();return readPixels?readRenderedPixels():std::vector<uint8_t>{};
    }
};
