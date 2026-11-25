// Included in Renderer. Timestamp queries measure GPU work on the user's
// actual device, separately from host/IPC wall time. Profiling never waits for
// an extra fence and unavailable timestamp support is harmless.
    VkQueryPool frameQueries{};uint32_t timestampBits{};
    void initializeFrameQueries(){
        if(!timestampBits||properties.deviceType==VK_PHYSICAL_DEVICE_TYPE_CPU&&!std::getenv("SKY_GPU_PROFILE"))return;
        VkQueryPoolCreateInfo q{VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO};q.queryType=VK_QUERY_TYPE_TIMESTAMP;q.queryCount=9;
        if(vkCreateQueryPool(device,&q,nullptr,&frameQueries)!=VK_SUCCESS)frameQueries={};
    }
    void frameQuery(uint32_t index){if(frameQueries)vkCmdWriteTimestamp(commands,VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT,frameQueries,index);}
    void beginFrameQueries(){if(frameQueries){vkCmdResetQueryPool(commands,frameQueries,0,9);frameQuery(0);}}
    void reportFrameQueries(uint32_t request,uint32_t w,uint32_t h){
        if(!frameQueries)return;
        uint64_t ticks[9]{};
        if(vkGetQueryPoolResults(device,frameQueries,0,9,sizeof(ticks),ticks,sizeof(uint64_t),VK_QUERY_RESULT_64_BIT)!=VK_SUCCESS)return;
        const uint64_t mask=timestampBits>=64?UINT64_MAX:(1ull<<timestampBits)-1;
        const auto ms=[&](int from,int to){return double((ticks[to]-ticks[from])&mask)*properties.limits.timestampPeriod/1000000.;};
        std::cerr<<"{\"gpuFrameTiming\":{\"request\":"<<request<<",\"width\":"<<w<<",\"height\":"<<h
            <<",\"opaqueMs\":"<<ms(0,1)<<",\"depthCloudFogMs\":"<<ms(1,2)<<",\"exposureGatherMs\":"<<ms(2,3)
            <<",\"fogResolveMs\":"<<ms(4,5)<<",\"motionTaaTonemapMs\":"<<ms(5,6)<<",\"historyMs\":"<<ms(6,7)
            <<",\"displayReadbackMs\":"<<ms(7,8)<<",\"gpuWorkMs\":"<<ms(0,3)+ms(4,8)
            <<",\"attachmentCopyBytes\":"<<fullCopyBytes<<",\"directAttachmentBinds\":"<<fullDirectBinds<<"}}\n";
    }
