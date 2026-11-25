// Included in Renderer: the recovered full preview stages share GPU images.
// The CPU reference path remains available for image comparison. Only sparse
// exposure samples cross into native host memory; no intermediate frame is IPC.
    struct FullLink {uint32_t draw,binding,source,attachment,format,flip;};
    struct FullStage {uint32_t id,divisor;std::vector<FullLink> links;};
    // WaterSim uses a fixed world-space grid, independent of viewport quality.
    static uint32_t fullExtent(uint32_t id,uint32_t extent,uint32_t divisor){return id==15?256:std::max(1u,extent/divisor);}
    struct FullImage {Image image{};uint32_t w{},h{};VkFormat format{};bool initialized{},ready{};};
    std::unordered_map<uint32_t,std::unique_ptr<MaterialRenderer>> fullStages;
    std::unordered_map<uint64_t,FullImage> fullImages;
    Buffer fullMeter{};
    uint32_t fullWidth{},fullHeight{};
    double fullAverageLum=1;
    bool fullPresented=false;
    std::unordered_map<VkImage,Image*> fullTracked;
    std::unordered_map<VkImage,bool> fullSampled;
    uint64_t fullCopyBytes=0,fullDirectBinds=0;
    bool fullDirectSampling()const{return !(std::getenv("SKY_FULL_COPY_REFERENCE")&&std::strcmp(std::getenv("SKY_FULL_COPY_REFERENCE"),"1")==0);}
    void fullSourceLayout(Image& source,bool sampled){
        fullTracked[source.handle]=&source;auto& old=fullSampled[source.handle];if(old==sampled)return;
        VkImageMemoryBarrier b{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};b.image=source.handle;b.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};b.srcQueueFamilyIndex=b.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
        b.oldLayout=old?VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;b.newLayout=sampled?VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
        b.srcAccessMask=old?VK_ACCESS_SHADER_READ_BIT:VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT|VK_ACCESS_TRANSFER_READ_BIT;b.dstAccessMask=sampled?VK_ACCESS_SHADER_READ_BIT:VK_ACCESS_TRANSFER_READ_BIT;
        vkCmdPipelineBarrier(commands,old?VK_PIPELINE_STAGE_VERTEX_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT|VK_PIPELINE_STAGE_TRANSFER_BIT,sampled?VK_PIPELINE_STAGE_VERTEX_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT:VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,0,nullptr,1,&b);old=sampled;
    }
    void fullRestoreSources(){for(auto& entry:fullTracked)fullSourceLayout(*entry.second,false);}
    void clearFullImages(){for(auto& entry:fullImages)destroy(entry.second.image);fullImages.clear();destroy(fullMeter);fullWidth=fullHeight=0;}
    void clearFullPreview(){fullStages.clear();clearFullImages();}
    void fullStage(const uint8_t* data,size_t bytes){
        if(bytes<12)throw std::runtime_error("Full stage header truncated");
        uint32_t head[3];memcpy(head,data,12);const auto id=head[0],action=head[1],n=head[2];
        if(id>=17||uint64_t(n)+12>bytes)throw std::runtime_error("Full stage header invalid");
        if(action==0){
            if(uint64_t(n)+12!=bytes)throw std::runtime_error("Full stage setup size invalid");
            auto next=std::make_unique<MaterialRenderer>(device,physical,queue,pool,id==0,pipelineCache,id==13||id==14,textureCache);next->batch(data+12,n);fullStages[id]=std::move(next);
        }else if(action==1){
            auto found=fullStages.find(id);if(found==fullStages.end())throw std::runtime_error("Full stage unavailable");
            found->second->resourceBatch(data+12,n);found->second->geometryBatch(data+12+n,bytes-12-n);
        }else if(action==2){if(bytes!=12||n)throw std::runtime_error("Full stage removal invalid");fullStages.erase(id);}
        else throw std::runtime_error("Full stage action invalid");
    }
    static VkFormat fullFormat(uint32_t code){switch(code){case 3:return VK_FORMAT_R32_SFLOAT;case 4:return VK_FORMAT_R32G32B32A32_SFLOAT;case 5:return VK_FORMAT_R16_SFLOAT;case 6:return VK_FORMAT_R16G16_SFLOAT;case 7:return VK_FORMAT_R16G16B16A16_SFLOAT;default:throw std::runtime_error("Full sampled format invalid");}}
    // Copy/flip/format conversion preserves the existing reference UV boundary.
    // This is deliberately a GPU transfer before optimizing redundant flips.
    FullImage& fullCopy(uint64_t key,Image& source,VkFormat sourceFormat,uint32_t w,uint32_t h,VkFormat format,bool flip){
        auto& out=fullImages[key];
        if(out.w!=w||out.h!=h||out.format!=format){destroy(out.image);out={};out.image=image(w,h,format,VK_IMAGE_USAGE_TRANSFER_DST_BIT|VK_IMAGE_USAGE_SAMPLED_BIT,VK_IMAGE_ASPECT_COLOR_BIT);out.w=w;out.h=h;out.format=format;}
        if(out.ready)return out;
        fullSourceLayout(source,false);fullCopyBytes+=uint64_t(w)*h*(format==VK_FORMAT_R32G32B32A32_SFLOAT?16:format==VK_FORMAT_R16G16B16A16_SFLOAT?8:format==VK_FORMAT_R16_SFLOAT?2:4);
        VkImageMemoryBarrier barrier{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};barrier.image=out.image.handle;barrier.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
        barrier.oldLayout=out.initialized?VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:VK_IMAGE_LAYOUT_UNDEFINED;barrier.newLayout=VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;barrier.srcAccessMask=out.initialized?VK_ACCESS_SHADER_READ_BIT:0;barrier.dstAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;
        vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_VERTEX_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,0,nullptr,0,nullptr,1,&barrier);
        if(!flip&&sourceFormat==format){VkImageCopy copy{};copy.srcSubresource=copy.dstSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};copy.extent={w,h,1};vkCmdCopyImage(commands,source.handle,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,out.image.handle,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&copy);}
        else{
            VkFormatProperties src{},dst{};vkGetPhysicalDeviceFormatProperties(physical,sourceFormat,&src);vkGetPhysicalDeviceFormatProperties(physical,format,&dst);
            if(!(src.optimalTilingFeatures&VK_FORMAT_FEATURE_BLIT_SRC_BIT)||!(dst.optimalTilingFeatures&VK_FORMAT_FEATURE_BLIT_DST_BIT))throw std::runtime_error("Full GPU format conversion unsupported");
            VkImageBlit blit{};blit.srcSubresource=blit.dstSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};blit.srcOffsets[1]={int32_t(w),int32_t(h),1};blit.dstOffsets[0]={0,flip?int32_t(h):0,0};blit.dstOffsets[1]={int32_t(w),flip?0:int32_t(h),1};
            vkCmdBlitImage(commands,source.handle,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,out.image.handle,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&blit,VK_FILTER_NEAREST);
        }
        barrier.oldLayout=VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;barrier.newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;barrier.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_SHADER_READ_BIT;
        vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_VERTEX_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,0,0,nullptr,0,nullptr,1,&barrier);out.initialized=out.ready=true;return out;
    }
    void fullBind(const FullStage& stage,const std::vector<FullStage>& graph,uint32_t meter){
        auto& target=*fullStages.at(stage.id);
        target.resetExternalTextures();
        std::vector<Image*> direct;
        for(const auto& link:stage.links){
            auto& draw=target.batchDraw(link.draw);
            if(link.source==104){
                auto previous=fullImages.find(0x100000002ull);
                if(previous!=fullImages.end()&&previous->second.initialized)draw.bindExternalTexture(link.binding,previous->second.image.view);
                else draw.bindOwnTexture(link.binding);
                continue;
            }
            if(link.source==102||link.source==103){
                auto previous=fullImages.find(link.source==102?0x100000000ull:0x100000001ull);
                if(previous!=fullImages.end()&&previous->second.initialized){draw.bindExternalTexture(link.binding,previous->second.image.view);continue;}
                if(link.source==102){draw.bindOwnTexture(link.binding);continue;}
                // First TAA frame uses the current composed input as history.
                auto& fog=*fullStages.at(graph[meter].id);auto& sampled=fullCopy(uint64_t(graph[meter].id)|(uint64_t(7)<<16)|(1ull<<24),fog.outputImage(0),fog.outputFormat(0),fullWidth,fullHeight,VK_FORMAT_R16G16B16A16_SFLOAT,true);draw.bindExternalTexture(link.binding,sampled.image.view);continue;
            }
            Image* source=nullptr;VkFormat format{};uint32_t w=fullWidth,h=fullHeight;
            if(link.source==100){if(link.attachment)throw std::runtime_error("Full opaque attachment invalid");source=&color;format=VK_FORMAT_R32G32B32A32_SFLOAT;}
            else if(link.source==101){if(!alpha){draw.bindOwnTexture(link.binding);continue;}source=&alpha->outputImage(link.attachment);format=alpha->outputFormat(link.attachment);}
            else{
                auto it=std::find_if(graph.begin(),graph.end(),[&](const FullStage& s){return s.id==link.source;});if(it==graph.end()||!it->id)throw std::runtime_error("Full link source unavailable");
                auto& renderer=*fullStages.at(link.source);source=&renderer.outputImage(link.attachment);format=renderer.outputFormat(link.attachment);w=fullExtent(it->id,fullWidth,it->divisor);h=fullExtent(it->id,fullHeight,it->divisor);
            }
            if(fullDirectSampling()&&!link.flip&&format==fullFormat(link.format)){fullSourceLayout(*source,true);draw.bindExternalTexture(link.binding,source->view);direct.push_back(source);fullDirectBinds++;continue;}
            uint64_t key=link.source|(uint64_t(link.attachment)<<8)|(uint64_t(link.format)<<16)|(uint64_t(link.flip)<<24);
            auto& sampled=fullCopy(key,*source,format,w,h,fullFormat(link.format),link.flip!=0);draw.bindExternalTexture(link.binding,sampled.image.view);
        }
        // A stage can bind both direct and flipped views of the same source.
        // Copies may change its layout; restore direct inputs before any draw.
        for(auto* source:direct)fullSourceLayout(*source,true);
    }
    void fullSubmit(bool wait){
        check(vkEndCommandBuffer(commands),"vkEndCommandBuffer(full graph)");check(vkResetFences(device,1,&fence),"vkResetFences(full graph)");
        VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};submit.commandBufferCount=1;submit.pCommandBuffers=&commands;check(vkQueueSubmit(queue,1,&submit,fence),"vkQueueSubmit(full graph)");
        if(wait)check(vkWaitForFences(device,1,&fence,VK_TRUE,UINT64_MAX),"vkWaitForFences(full graph)");
    }
    void fullBegin(){check(vkResetCommandBuffer(commands,0),"vkResetCommandBuffer(full graph)");VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};begin.flags=VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;check(vkBeginCommandBuffer(commands,&begin),"vkBeginCommandBuffer(full graph)");}
    std::vector<uint8_t> fullRender(const uint8_t* data,size_t bytes){
        if(bytes<108)throw std::runtime_error("Full graph header truncated");
        uint32_t wh[2];memcpy(wh,data+4,8);float matrix[16];memcpy(matrix,data+12,64);
        const auto w=wh[0],h=wh[1];target(w,h);
        fullTracked.clear();fullSampled.clear();fullCopyBytes=fullDirectBinds=0;
        struct Reader{const uint8_t* p;size_t n;uint32_t word(){if(n<4)throw std::runtime_error("Full graph truncated");uint32_t v;memcpy(&v,p,4);p+=4;n-=4;return v;}}r{data+76,bytes-76};
        auto surface=r.word(),reset=r.word(),count=r.word(),meter=r.word(),exposureBinding=r.word(),exposureOffset=r.word(),cloudStage=r.word(),temporalStage=r.word();
        if(surface>1||reset>1||!count||count>17||meter>=count||exposureBinding>65535||exposureOffset>65535||exposureOffset%4)throw std::runtime_error("Full graph parameters invalid");
        std::vector<FullStage> graph;std::vector<uint32_t> seen;
        for(uint32_t i=0;i<count;i++){
            FullStage stage{r.word(),r.word(),{}};auto links=r.word();
            if(stage.id>=17||!fullStages.count(stage.id)||std::find(seen.begin(),seen.end(),stage.id)!=seen.end()||(stage.divisor!=1&&stage.divisor!=2&&stage.divisor!=4&&stage.divisor!=8)||links>128||(stage.id==15&&i)||(stage.id==0&&i&&!(i==1&&seen[0]==15)))throw std::runtime_error("Full graph stage invalid");
            for(uint32_t j=0;j<links;j++){FullLink link{r.word(),r.word(),r.word(),r.word(),r.word(),r.word()};fullFormat(link.format);if(link.draw>4095||link.binding>65535||link.attachment>3||link.flip>1||(link.source<100&&std::find(seen.begin(),seen.end(),link.source)==seen.end())||link.source>104||(stage.id==0&&link.source!=102)||(stage.id==15&&(link.source!=104||link.attachment)))throw std::runtime_error("Full graph link invalid");stage.links.push_back(link);}
            seen.push_back(stage.id);graph.push_back(std::move(stage));
        }
        if(r.n||graph[meter].id==0||graph.back().divisor!=1||!fullStages.count(temporalStage)||(cloudStage!=0xffffffff&&!fullStages.count(cloudStage)))throw std::runtime_error("Full graph terminal invalid");
        if(reset||fullWidth!=w||fullHeight!=h)clearFullImages();
        fullWidth=w;fullHeight=h;for(auto& entry:fullImages)if(entry.first<0x100000000ull)entry.second.ready=false;
        fullPresented=false;
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        if(surface&&!presenter->acquire())return {};
#else
        if(surface)throw std::runtime_error("Full graph native surface unavailable");
#endif
        if(graph.front().id==15){fullBegin();fullBind(graph.front(),graph,meter);fullStages.at(15)->recordRender(commands,256,256);fullSubmit(true);}
        auto core=std::find_if(graph.begin(),graph.end(),[](const FullStage& s){return s.id==0;});if(core!=graph.end())fullBind(*core,graph,meter);
        // The reference meter always starts with unit exposure. The second
        // pass patches this UBO, so cached/replayed frames must restore it
        // even when the host resource bytes have not changed.
        auto& fog=*fullStages.at(graph[meter].id);fog.uniformFloat(exposureBinding,exposureOffset,1.f);
        render(w,h,matrix,0,true,true,true,true);
        frameQuery(1);
        const bool water=std::any_of(graph.begin(),graph.end(),[](const FullStage& s){return s.id==13;});
        if(alpha&&!water)alpha->recordRender(commands,w,h,depth.view);
        for(uint32_t i=0;i<=meter;i++){const auto& stage=graph[i];if(!stage.id||stage.id==15)continue;fullBind(stage,graph,meter);fullStages.at(stage.id)->recordRender(commands,fullExtent(stage.id,w,stage.divisor),fullExtent(stage.id,h,stage.divisor),stage.id==13||stage.id==14?depth.view:VK_NULL_HANDLE);if(stage.id==13&&alpha)alpha->recordRender(commands,w,h,depth.view);}
        if(fog.outputs()!=1||fog.outputFormat(0)!=VK_FORMAT_R16G16B16A16_SFLOAT||graph[meter].divisor!=1)throw std::runtime_error("Full exposure meter target invalid");
        frameQuery(2);
        const uint32_t step=std::max(1u,w*h/2048),samples=(w*h+step-1)/step;
        const bool gathered=gpuExposureGather();
        if(gathered){
            if(!exposureMeter)exposureMeter=std::make_unique<SkyExposureReadback>(device,physical);
            exposureMeter->record(commands,fog.outputImage(0),w,step,samples);
        }else{
        if(fullMeter.size<uint64_t(samples)*8){destroy(fullMeter);fullMeter=buffer(uint64_t(samples)*8,VK_BUFFER_USAGE_TRANSFER_DST_BIT);}
        std::vector<VkBufferImageCopy> copies;for(uint32_t p=0,index=0;p<w*h;p+=step,index++){VkBufferImageCopy copy{};copy.bufferOffset=uint64_t(index)*8;copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};copy.imageOffset={int32_t(p%w),int32_t(p/w),0};copy.imageExtent={1,1,1};copies.push_back(copy);}
        vkCmdCopyImageToBuffer(commands,fog.outputImage(0).handle,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,fullMeter.handle,copies.size(),copies.data());
        VkBufferMemoryBarrier barrier{VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER};barrier.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;barrier.dstAccessMask=VK_ACCESS_HOST_READ_BIT;barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;barrier.buffer=fullMeter.handle;barrier.size=VK_WHOLE_SIZE;vkCmdPipelineBarrier(commands,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,0,nullptr,1,&barrier,0,nullptr);
        }
        frameQuery(3);fullSubmit(true);
        const auto& meterBuffer=gathered?exposureMeter->result():fullMeter;
        void* mapped;check(vkMapMemory(device,meterBuffer.memory,0,meterBuffer.size,0,&mapped),"vkMapMemory(full meter)");double sum=0;
        for(uint32_t i=0;i<samples;i++){double rgb[3];for(uint32_t lane=0;lane<3;lane++){uint16_t bits;memcpy(&bits,static_cast<uint8_t*>(mapped)+uint64_t(i)*8+lane*2,2);const auto exp=(bits>>10)&31,m=bits&1023;double value=exp==31?(m?NAN:INFINITY):std::ldexp(double(exp?1024+m:m),exp?int(exp)-25:-24);if(bits&0x8000)value=-value;rgb[lane]=std::max(.0001,1/std::max(.0001,value)-1);if(!std::isfinite(value)){vkUnmapMemory(device,meterBuffer.memory);throw std::runtime_error("Full preview nonfinite exposure input");}}sum+=std::log(std::max(.0001,.2126*rgb[0]+.7152*rgb[1]+.0722*rgb[2]));}
        vkUnmapMemory(device,meterBuffer.memory);fullAverageLum=std::max(.0001,std::exp(sum/samples));fog.uniformFloat(exposureBinding,exposureOffset,float(fullAverageLum));
        fullBegin();frameQuery(4);fog.recordRender(commands,w,h);frameQuery(5);
        // Fog's metering image has been overwritten. Invalidate its sampled
        // views so TAA consumes the actual exposure-adjusted output.
        for(auto& entry:fullImages)if((entry.first&255)==graph[meter].id&&entry.first<0x100000000ull)entry.second.ready=false;
        const bool packedCanvas=!surface&&gpuCanvasPacking();
        for(uint32_t i=meter+1;i<count;i++){const auto& stage=graph[i];fullBind(stage,graph,meter);fullStages.at(stage.id)->recordRender(commands,std::max(1u,w/stage.divisor),std::max(1u,h/stage.divisor),VK_NULL_HANDLE,!surface&&!packedCanvas&&i==count-1);}
        frameQuery(6);
        // History is committed only after this frame. It keeps the native
        // top-row CloudCore input and lower-left temporal input independently.
        if(cloudStage!=0xffffffff){auto& clouds=*fullStages.at(cloudStage);auto& old=fullImages[0x100000000ull];old.ready=false;fullCopy(0x100000000ull,clouds.outputImage(0),clouds.outputFormat(0),std::max(1u,w/2),std::max(1u,h/2),VK_FORMAT_R16G16B16A16_SFLOAT,false);}
        auto& temporal=*fullStages.at(temporalStage);fullImages[0x100000001ull].ready=false;fullCopy(0x100000001ull,temporal.outputImage(0),temporal.outputFormat(0),w,h,VK_FORMAT_R16G16B16A16_SFLOAT,true);
        if(fullStages.count(15)&&graph.front().id==15){auto& waterSim=*fullStages.at(15);fullImages[0x100000002ull].ready=false;fullCopy(0x100000002ull,waterSim.outputImage(0),waterSim.outputFormat(0),256,256,VK_FORMAT_R16G16B16A16_SFLOAT,true);}
        auto& final=*fullStages.at(graph.back().id);
        fullRestoreSources();
        frameQuery(7);
#if defined(SKY_ANDROID_SURFACE) || defined(SKY_XCB_SURFACE_TEST) || defined(SKY_WIN32_SURFACE)
        if(surface){
            presenter->record(commands,final.outputImage(0),w,h,false);VkSemaphore acquired=presenter->acquireSemaphore(),finished=presenter->presentSemaphore();VkPipelineStageFlags stage=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
            VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};submit.commandBufferCount=1;submit.pCommandBuffers=&commands;submit.waitSemaphoreCount=1;submit.pWaitSemaphores=&acquired;submit.pWaitDstStageMask=&stage;submit.signalSemaphoreCount=1;submit.pSignalSemaphores=&finished;
            check(vkEndCommandBuffer(commands),"vkEndCommandBuffer(full surface)");check(vkResetFences(device,1,&fence),"vkResetFences(full surface)");check(vkQueueSubmit(queue,1,&submit,fence),"vkQueueSubmit(full surface)");framePending=true;fullPresented=presenter->present();
#ifdef SKY_XCB_SURFACE_TEST
            if(std::getenv("SKY_SURFACE_CAPTURE")){awaitFrame();presenter->capture();}
#endif
            if(!fullPresented){fullImages.at(0x100000001ull).initialized=false;if(cloudStage!=0xffffffff)fullImages.at(0x100000000ull).initialized=false;}
            return {};
        }
#endif
        uint32_t request;memcpy(&request,data,4);
        if(packedCanvas){if(!canvas)canvas=std::make_unique<SkyCanvasReadback>(device,physical);canvas->record(commands,final.outputImage(0),w,h);frameQuery(8);fullSubmit(true);reportFrameQueries(request,w,h);return canvas->pixels();}
        frameQuery(8);fullSubmit(true);reportFrameQueries(request,w,h);return final.readDisplayPixels(cpuCanvasReference());
    }
