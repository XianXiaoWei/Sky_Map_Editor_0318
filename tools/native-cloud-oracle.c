/* Runs original CloudBarn load/decompression/atlas packing and CPU distance.
 * Resource/texture/collision creation and uniform registration are mocks.
 * Mock allocations are zeroed; unused atlas slots are unspecified in-game.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static void hook(uintptr_t at, void *fn) {
    uint8_t jump[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(jump+2,&fn,8);memcpy((void *)at,jump,12);
}
static void bind(uintptr_t stub, void *fn) { int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8); }
static void *allocate(void *heap,size_t n,void *tag,unsigned align) { (void)heap;(void)tag;(void)align;return calloc(1,n?n:1); }
static void release(void *heap,void *p) { (void)heap;free(p); }
static void *dummy(void) { return (void *)1; }
static void noop(void) {}
static _Alignas(32) uint8_t material[416];
static void *get_material(void *barn,unsigned id) { (void)barn;(void)id;return material; }
typedef struct { void *object; uint32_t header[5]; void *data; } Texture;
static Texture textures[5];static unsigned nt;
static void create_texture(void *object,const char *name,unsigned kind,unsigned w,unsigned h,unsigned d,unsigned format,unsigned flags) {
    (void)name;(void)flags;if(nt>=5)exit(20);
    textures[nt++]=(Texture){.object=object,.header={w,h,d,format,kind}};
}
static void upload(void *object,void *data) {
    for(unsigned i=0;i<nt;i++)if(textures[i].object==object){
        size_t n=(size_t)textures[i].header[0]*textures[i].header[1]*textures[i].header[2]*(textures[i].header[3]==6?4:1);
        textures[i].data=malloc(n);memcpy(textures[i].data,data,n);return;
    }exit(21);
}
static uint32_t get32(const void *p,size_t at) { uint32_t x;memcpy(&x,(char *)p+at,4);return x; }
static void putptr(void *p,size_t at,void *v) { memcpy((char *)p+at,&v,8); }
static void *proxy_object;
static void upload_vertex(void *object,void *label,unsigned type,unsigned usage,unsigned bytes,void *data) {
    (void)label;(void)usage;(void)data;if(type!=2)exit(23);
    proxy_object=(char *)object-0x148;
    if(bytes!=get32(proxy_object,0x100)*get32(proxy_object,0x13c))exit(24);
}
static void *read_bytes(size_t n) { void *p=malloc(n?n:1);if(fread(p,1,n,stdin)!=n)exit(22);return p; }
int main(int argc,char **argv) {
    if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
    static uint64_t guard=123;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    bind(0x100aa2900UL,memset);bind(0x100aa28f4UL,memcpy);bind(0x100aa2744UL,fmodf);
    bind(0x100aa2c90UL,strncpy);hook(0x100794e00UL,upload_vertex);
    hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x1007c6c20UL,dummy);
    hook(0x10043fb50UL,dummy);hook(0x1004434f0UL,get_material);
    hook(0x1007f0960UL,create_texture);hook(0x1007f0c80UL,noop);hook(0x1007f0e00UL,upload);
    hook(0x1007945e0UL,dummy);hook(0x100794050UL,noop);hook(0x100793f20UL,noop);
    const uintptr_t mocks[]={0x1007f55d0UL,0x1007f5690UL,0x1007f5d90UL,0x100778b90UL,0x100778fd0UL};
    for(unsigned i=0;i<sizeof(mocks)/sizeof(*mocks);i++)hook(mocks[i],dummy);
    _Alignas(32) uint8_t record[128]={0},barn[0x40e00]={0};
    /* Protocol: source record's scalar fields, then sparse/coords/chunks. */
    if(fread(record,1,24,stdin)!=24)return 5;
    if(fread(record+0x20,1,4,stdin)!=4||fread(record+0x30,1,12,stdin)!=12||fread(record+0x58,1,20,stdin)!=20)return 5;
    uint32_t cells=get32(record,12)*get32(record,16)*get32(record,20),blocks=get32(record,32);
    putptr(record,24,read_bytes(cells));putptr(record,40,read_bytes(blocks*6));
    for(unsigned i=0;i<3;i++)putptr(record,64+i*8,read_bytes(get32(record,48+i*4)));
    uint32_t vc=get32(record,100),ic=get32(record,104);
    putptr(record,112,read_bytes(vc*16));putptr(record,120,read_bytes(ic*2));
    /* Original material lookup receives a deterministic, explicit test color. */
    const float color[]={0.2f,0.4f,0.6f,1.0f};memcpy(material+32,color,16);
    ((void (*)(void *,void *,void *,void *,void *,void *))0x1002129f0UL)(barn,record,(void *)1,(void *)1,(void *)1,(void *)1);
    fwrite(&nt,4,1,stdout);
    for(unsigned i=0;i<nt;i++) {
        fwrite(textures[i].header,4,5,stdout);
        size_t n=(size_t)textures[i].header[0]*textures[i].header[1]*textures[i].header[2]*(textures[i].header[3]==6?4:1);
        fwrite(textures[i].data,1,n,stdout);
    }
    if(!proxy_object)return 25;
    uint32_t proxy_header[]={get32(proxy_object,0x13c),get32(proxy_object,0x100),get32(proxy_object,0x130)};
    fwrite(proxy_header,4,3,stdout);fwrite(proxy_object,16,proxy_header[2],stdout);
    uint32_t points;if(fread(&points,4,1,stdin)!=1)return 6;fwrite(&points,4,1,stdout);
    for(unsigned i=0;i<points;i++) {
        _Alignas(32) float position[4]={0};if(fread(position,4,3,stdin)!=3)return 7;
        float distance=((float (*)(void *,const float *))0x100213dd0UL)(barn,position);fwrite(&distance,4,1,stdout);
    }
    return 0;
}
