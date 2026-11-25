/* Execute original opaque/transparent-pass descriptor assembly and AddRenderList storage.
 * Resource/outline setup calls are replaced with explicit test fixtures. No
 * descriptor writes or AddRenderList classification/copy instructions change.
 * Stops after the opaque pass; this is not a complete Compositor execution.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static uint8_t depths[3][44];
static unsigned depth_count, resource_count, alpha_target;
static void put32(void *p, size_t at, uint32_t v) { memcpy((char *)p+at,&v,4); }
static uint32_t get32(void *p, size_t at) { uint32_t v;memcpy(&v,(char *)p+at,4);return v; }
static uintptr_t noop(void) { return 0; }
static uintptr_t resource(void) { return ++resource_count; }
static uintptr_t depth(void *outline,const char *name,void *descriptor) {
    (void)outline;(void)name;
    if(depth_count>=3)exit(10);
    memcpy(depths[depth_count],descriptor,44);return depth_count++;
}
static uintptr_t render_pass(void *outline,const char *name,void *descriptor) {
    (void)name;(void)descriptor;
    put32(outline,0,get32(outline,0)+1);put32(outline,0x19830,1);return 0;
}
static uintptr_t has_alpha(void *renderer) { (void)renderer;return alpha_target; }
static uintptr_t getter(void) {
    static void *table[16];static void **renderer=table;
    table[8]=has_alpha;return (uintptr_t)&renderer;
}
static uint32_t compare_value, write_value, cull_value;
static float bias_value[3];
static uintptr_t objc(void *object,uintptr_t selector,uintptr_t arg,float bias,float slope,float clamp) {
    (void)object;
    if(selector==*(uintptr_t *)0x100c69f00UL)compare_value=(uint32_t)arg;
    if(selector==*(uintptr_t *)0x100c69f08UL)write_value=(uint32_t)arg;
    if(selector==*(uintptr_t *)0x100c6a0e0UL)cull_value=(uint32_t)arg;
    if(selector==*(uintptr_t *)0x100c6a0f0UL) { bias_value[0]=bias;bias_value[1]=slope;bias_value[2]=clamp; }
    return 1;
}
static void redirect(uintptr_t entry,void *fn) {
    uint8_t code[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(code+2,&fn,8);memcpy((void *)entry,code,sizeof(code));
}
static void bind(uintptr_t stub,void *fn) {
    int32_t disp;memcpy(&disp,(void *)(stub+2),4);
    memcpy((void *)(stub+6+disp),&fn,8);
}
int main(int argc,char **argv) {
    if(argc!=4)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(memory==MAP_FAILED)return 4;
    if(fread(memory,1,0xd22000,file)!=0xd22000)return 5;
    fclose(file);
    static uint64_t guard=0x12345678;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    bind(0x100aa2c90UL,strncpy);
    /* Target addresses are supplied by SHA-gated LC_FUNCTION_STARTS inspection. */
    file=fopen(argv[2],"rb");if(!file)return 6;
    uintptr_t target;
    while(fread(&target,8,1,file)==1) {
        void *fn=noop;
        if(target==0x1007bc100UL||target==0x1007bc2d0UL)fn=resource;
        if(target==0x1007bc670UL)fn=depth;
        if(target==0x1007bc8b0UL)fn=render_pass;
        if(target==0x1007c1470UL)fn=getter;
        if(target!=0x1007bcc00UL)redirect(target,fn);
    }
    fclose(file);
    /* Exit through the original epilogue after all opaque/transparent-pass list writes. */
    int32_t rel=(int32_t)(0x100241cc8UL-0x10023fe51UL-5);
    *(uint8_t *)0x10023fe51UL=0xe9;memcpy((void *)0x10023fe52UL,&rel,4);
    alpha_target=(unsigned)strtoul(argv[3],0,10);
    _Alignas(32) uint8_t outline[0x19840]={0}, compositor[0x40]={0};
    ((void (*)(void *,void *,void *))0x10023de50UL)(compositor,outline,0);
    unsigned count=get32(outline,0x15788);
    if(depth_count!=3||count!=get32(outline,0x17b20)||count>32)return 7;
    fwrite(depths,44,3,stdout);
    fwrite(&count,4,1,stdout);
    fwrite(outline+0x1578c,0x88,count,stdout);
    fwrite(outline+0x17b24,24,count,stdout);
    /* Native Scene list descriptors: capacities, sort mode, 28-byte name. */
    for(unsigned i=0;i<23;i++) {
        uint8_t descriptor[36]={0};
        ((void (*)(void *,unsigned))0x10058f9d0UL)(descriptor,i);
        fwrite(descriptor,36,1,stdout);
    }
    /* Execute native Metal depth/cull conversions with captured ObjC calls. */
    void *msg=objc,*drop=noop;
    memcpy((void *)0x100c0db10UL,&msg,8);memcpy((void *)0x100c0db18UL,&drop,8);
    uint8_t backend[0x1b0]={0};uint32_t allocated=0;uintptr_t objects[32]={0};
    void *slots=objects,*mask=&allocated;
    put32(backend,0x198,32);
    memcpy(backend+0x1a0,&slots,8);memcpy(backend+0x1a8,&mask,8);
    for(unsigned i=0;i<3;i++) {
        ((unsigned (*)(void *,void *))0x100a69680UL)(backend,depths[i]);
        fwrite(&compare_value,4,1,stdout);fwrite(&write_value,4,1,stdout);
    }
    for(unsigned i=0;i<3;i++) {
        uint8_t context[0x40]={0};put32(context,0x24,0xffffffff);
        ((void (*)(void *,unsigned))0x100a6d9c0UL)(context,i);
        fwrite(&cull_value,4,1,stdout);
    }
    for(unsigned i=0;i<count;i++) {
        uint8_t context[0x40]={0};put32(context,0x28,0x7fc00000);
        float values[3];memcpy(values,outline+0x17b24+i*24+8,12);
        ((void (*)(void *,float,float,float))0x100a6da50UL)(context,values[0],values[1],values[2]);
        if(memcmp(values,bias_value,12)||memcmp(context+0x28,values,12))return 11;
        fwrite(bias_value,4,3,stdout);
    }
    /* Mode 3 runs the original shader-key getter, signed comparator and sort.
     * Shader handles are explicit synthetic inputs, not inferred game IDs.
     */
    _Alignas(32) uint8_t vertices[32][0x540]={0};uint32_t shaders[32],keys[32],order[32];void *items[32];
    for(unsigned i=0;i<32;i++) {
        shaders[i]=(uint32_t)((int)((i*19)%11)-5);
        if(i==3)shaders[i]=0x80000000U;
        if(i==4)shaders[i]=0x7fffffffU;
        void *shader=i==13?0:&shaders[i];memcpy(vertices[i]+0x4f8,&shader,8);
        vertices[i][0x538]=(i%7)!=0;items[i]=vertices[i];
        keys[i]=((uint32_t (*)(void *))0x1007f6a50UL)(items[i]);
    }
    uint8_t list[0xe8]={0};void *table=items;memcpy(list+0x10,&table,8);put32(list,8,32);put32(list,0x1c,3);
    ((void (*)(void *,void *))0x1007b9cd0UL)(list,0);
    for(unsigned i=0;i<32;i++)order[i]=(unsigned)((uint8_t *)items[i]-vertices[0])/0x540;
    fwrite(keys,4,32,stdout);fwrite(order,4,32,stdout);
    return 0;
}
