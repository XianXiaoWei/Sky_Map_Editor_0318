/* Execute original Compositor declarations through the Cloud pass, including
 * resource, pass, list, quad and texture-binding descriptor writes. The native
 * allocation loop is run separately with explicit GPU allocation callbacks.
 * GPU objects, general outline setup and shader parameter copying are mocked.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static uint32_t alpha_target, sampler_count, allocation_count;
static uint8_t samplers[6][40];
struct Allocation { char name[32]; uint32_t kind, width, height, format, flags[2]; };
static struct Allocation allocations[128];
static void put32(void *p,size_t at,uint32_t v){memcpy((char *)p+at,&v,4);}
static uint32_t get32(const void *p,size_t at){uint32_t v;memcpy(&v,(const char *)p+at,4);return v;}
static uintptr_t noop(void){return 0;}
static void zero(void *p,size_t n){memset(p,0,n);}
static void string_reset(void *p){memset(p,0,24);}
static void shader_copy(void *out,const void *in){memcpy(out,in,0x328);}
static uintptr_t depth(void *outline,const char *name,const void *descriptor){
    (void)name;uint32_t n=get32(outline,0x17660);
    if(n>=8)exit(10);
    memcpy((char *)outline+0x17680+n*72,descriptor,44);
    put32(outline,0x17660,n+1);return n;
}
static uintptr_t has_alpha(void *renderer){(void)renderer;return alpha_target;}
static uintptr_t getter(void){
    static void *table[64];static void **renderer=table;
    table[8]=has_alpha;return (uintptr_t)&renderer;
}
static void sampler(void *out,const void *descriptor){
    if(sampler_count>=6)exit(11);
    memcpy(samplers[sampler_count++],descriptor,40);
    memcpy(out,descriptor,40);
}
static void allocate(void *out,const char *name,uint32_t kind,uint32_t width,
                     uint32_t height,uint32_t format,uint32_t flag0,uint32_t flag1){
    if(allocation_count>=128||strlen(name)>=32)exit(12);
    struct Allocation *a=&allocations[allocation_count++];strcpy(a->name,name);
    a->kind=kind;a->width=width;a->height=height;a->format=format;
    a->flags[0]=flag0;a->flags[1]=flag1;memset(out,0,0x78);
}
static void fatal(const char *condition,const char *file,unsigned line){
    fprintf(stderr,"Native assertion: %s at %s:%u\n",condition,file,line);exit(20);
}
static void redirect(uintptr_t entry,void *fn){
    uint8_t code[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(code+2,&fn,8);memcpy((void *)entry,code,sizeof(code));
}
static void jump(uintptr_t from,uintptr_t to){
    int32_t rel=(int32_t)(to-from-5);*(uint8_t *)from=0xe9;memcpy((void *)(from+1),&rel,4);
}
static void bind(uintptr_t stub,void *fn){
    int32_t disp;memcpy(&disp,(void *)(stub+2),4);memcpy((void *)(stub+6+disp),&fn,8);
}
int main(int argc,char **argv){
    if(argc!=6)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(memory==MAP_FAILED)return 4;
    if(fread(memory,1,0xd22000,file)!=0xd22000)return 5;
    fclose(file);
    static uint64_t guard=0x12345678;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    bind(0x100aa2c7eUL,strlen);bind(0x100aa28f4UL,memcpy);bind(0x100aa28faUL,memmove);
    bind(0x100aa24aaUL,zero);bind(0x100aa2c90UL,strncpy);bind(0x100aa28eeUL,memcmp);
    redirect(0x100018080UL,string_reset);redirect(0x100249280UL,shader_copy);
    redirect(0x1007e5f70UL,fatal);redirect(0x1007e6030UL,fatal);
    file=fopen(argv[2],"rb");if(!file)return 6;uintptr_t target;
    while(fread(&target,8,1,file)==1){
        /* These original bodies execute unchanged. */
        if(target==0x1007bc100UL||target==0x1007bc2d0UL||target==0x1007bc8b0UL||
           target==0x1007bcbc0UL||target==0x1007bcc00UL||target==0x1007bcde0UL||
           target==0x1007bb3f0UL||target==0x1007bbe10UL||target==0x100247330UL||
           target==0x1007bc820UL)continue;
        void *fn=noop;
        if(target==0x1007bc670UL)fn=depth;
        if(target==0x1007c1470UL)fn=getter;
        redirect(target,fn);
    }fclose(file);
    jump(0x10023fcc6UL,0x100241cc8UL);
    alpha_target=(uint32_t)strtoul(argv[3],0,10);
    uint8_t *compositor=calloc(1,0x39000),*outline=calloc(1,0x19840);
    if(!compositor||!outline)return 7;
    ((void (*)(void *,void *,void *))0x10023de50UL)(compositor,outline,0);
    fwrite(outline,1,0x19840,stdout);
    /* Original six sampler declaration writes; stop before outline creation. */
    redirect(0x1007f04d0UL,sampler);jump(0x10023d565UL,0x10023d8e9UL);
    ((void (*)(void *,void *,void *,void *,void *,void *,void *))0x10023d350UL)(compositor,0,0,0,0,0,0);
    fwrite(samplers,40,6,stdout);
    /* Actual native floor division, clamp-to-one and target history count. */
    redirect(0x1007f0b50UL,allocate);redirect(0x1007f0c90UL,noop);
    jump(0x100243dffUL,0x100244014UL);redirect(0x100794050UL,noop);
    uint32_t w=(uint32_t)strtoul(argv[4],0,10),h=(uint32_t)strtoul(argv[5],0,10);
    if(!w||!h)return 8;
    ((void (*)(void *,void *,uint32_t,uint32_t,uint32_t))0x100243a30UL)(compositor,outline,w,h,1);
    fwrite(&allocation_count,4,1,stdout);fwrite(allocations,sizeof(allocations[0]),allocation_count,stdout);
    for(unsigned i=0;i<23;i++){
        uint8_t descriptor[36]={0};((void (*)(void *,unsigned))0x10058f9d0UL)(descriptor,i);
        fwrite(descriptor,36,1,stdout);
    }
    return 0;
}
