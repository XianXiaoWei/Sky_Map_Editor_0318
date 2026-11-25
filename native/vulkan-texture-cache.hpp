#include <memory>
#include <unordered_map>

struct SkySampledImage {
    VkDevice device;Image image;uint32_t kind,format,w,h,d,mips,bytes;
    ~SkySampledImage(){if(image.view)vkDestroyImageView(device,image.view,nullptr);if(image.handle)vkDestroyImage(device,image.handle,nullptr);if(image.memory)vkFreeMemory(device,image.memory,nullptr);}
};
using SkySampledImagePtr=std::shared_ptr<SkySampledImage>;
using SkyTextureTable=std::vector<SkySampledImagePtr>;
/** Exact content/format keys, bounded retained data, per-device ownership.
 * Draws retain live images independently of cache eviction. */
class SkyTextureCache {
    struct Entry {SkySampledImagePtr image;uint64_t stamp;};
    std::unordered_map<std::string,Entry> entries;
    uint64_t used=0,clock=0;
public:
    static constexpr uint64_t budget=96ull*1024*1024;
    SkySampledImagePtr get(const std::string& key){auto i=entries.find(key);if(i==entries.end())return {};i->second.stamp=++clock;return i->second.image;}
    void put(std::string key,SkySampledImagePtr image){
        const auto bytes=key.size();if(bytes>budget)return;
        while(used+bytes>budget&&!entries.empty()){auto oldest=entries.begin();for(auto i=entries.begin();i!=entries.end();++i)if(i->second.stamp<oldest->second.stamp)oldest=i;used-=oldest->first.size();entries.erase(oldest);}
        used+=bytes;entries.emplace(std::move(key),Entry{std::move(image),++clock});
    }
};
