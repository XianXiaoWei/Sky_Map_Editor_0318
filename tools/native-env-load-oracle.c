/* Original Environment ctor/queue/OnLevelLoad/conversion/registration/update.
 * Field caches and metadata are explicit test inputs; cache construction and
 * game startup are outside this harness. Original text stays unmodified. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static _Alignas(16) uint8_t meta[8][0x80];
static uintptr_t vt[32];
static uint32_t sizes[8], bases[8], counts[8], specs[8][32][3];
static uint32_t order[8], order_count;
static uint8_t game[0x600];
static void *identity(void *p) { return p; }
static size_t object_size(void *p) { return sizes[((uint8_t *)p-meta[0])/0x80]; }
static void *construct(void *m, void *p) { unsigned id=((uint8_t *)m-meta[0])/0x80; memset(p,0,sizes[id]); memcpy(p,&id,4); return p; }
static void zero_bytes(void *p, size_t n) { memset(p,0,n); }
static void ptr(void *p,size_t at,const void *v) { memcpy((uint8_t *)p+at,&v,8); }
static void global(uintptr_t a,const void *v) { ptr((void *)a,0,v); }
static void u32(void *p,size_t at,uint32_t v) { memcpy((uint8_t *)p+at,&v,4); }
static uint32_t get32(void *p,size_t at) { uint32_t v; memcpy(&v,(uint8_t *)p+at,4); return v; }
static int read_bytes(void *p,size_t n) { return fread(p,1,n,stdin)==n; }
static int write_bytes(const void *p,size_t n) { return fwrite(p,1,n,stdout)==n; }
static void callback(void *a,void *b,void *storage,void *m,void *e) {
    (void)a;(void)b;(void)m;(void)e;
    if (storage==game+680) { for(unsigned i=0;i<6;i++)order[order_count++]=i; order[order_count++]=7; }
    else if(storage==game+952)order[order_count++]=6;
    else abort();
}
static int module_order(void) {
    _Alignas(16) uint8_t descriptors[2][40]={{0}}, entries[2][32]={{0}}, table[56]={0}, db[0x590]={0};
    const char *names[]={"cloudBarn","environment"};
    uintptr_t props[2]={ (uintptr_t)names[0], (uintptr_t)names[1] };
    ptr(descriptors[0],0,game+952); ptr(descriptors[1],0,game+680);
    for(unsigned i=0;i<2;i++)ptr(descriptors[i],16,&props[i]);
    void *sorted[]={descriptors[0],descriptors[1]};
    uintptr_t compare=0x1007b02c0UL;
    ((void (*)(void *,void *,void *))0x1007b3dc0UL)(sorted,sorted+2,&compare);
    memcpy(table,"Initialize",11); ptr(table,40,entries);u32(table,48,2);
    ptr(db,64,table);u32(db,72,1);
    for(unsigned i=0;i<2;i++)ptr(entries[i],0,sorted[i]);
    typedef void (*SetCallback)(void *,const char *,const char *,void *);
    SetCallback set=(SetCallback)0x1007b17c0UL;
    set(db,"Initialize","cloudBarn",callback);set(db,"Initialize","environment",callback);
    ((void (*)(void *,const char *,uint32_t,uint32_t))0x1007b1b40UL)(db,"Initialize",1,0);
    return order_count==8 && write_bytes(order,sizeof(order));
}
int main(int argc,char **argv) {
    if(argc!=2)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *memory=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(memory==MAP_FAILED)return 4;
    if(fread(memory,1,0xd22000,file)!=0xd22000)return 5;fclose(file);
    if(mprotect(memory,0xc05000,PROT_READ|PROT_EXEC))return 6;
    static uint64_t guard=0x12345678;
    global(0x100c0d8d8UL,&guard);
    global(0x100c0ef40UL,strncpy); global(0x100c0ef28UL,strlen);
    /* Resolve native strcmp stub's GOT rather than replacing text. */
    const uint8_t *stub=(void *)0x100aa2c4eUL; int32_t disp; memcpy(&disp,stub+2,4);
    global(0x100aa2c4eUL+6+disp,strcmp);
    global(0x100c0e4b8UL,zero_bytes);
    if(!module_order())return 7;
    static uint8_t registry[0x98+0x500*8];global(0x102047c70UL,registry);
    vt[0x68/8]=(uintptr_t)identity;vt[0xa0/8]=(uintptr_t)object_size;vt[0xc0/8]=(uintptr_t)construct;
    uintptr_t getters[]={0x101d6e350UL,0x101d6e3b0UL,0x101d6e410UL,0x101d6e470UL,0x101d6e4d0UL,0x101d6e530UL,0x101de1b10UL,0x101df7098UL};
    for(unsigned i=0;i<8;i++) {
        uint32_t h[3];if(!read_bytes(h,sizeof(h)))return 8;
        bases[i]=h[0];sizes[i]=h[1];counts[i]=h[2];if(sizes[i]>256||counts[i]>32)return 9;
        if(!read_bytes(specs[i],counts[i]*12))return 8;
        ptr(meta[i],0,vt);u32(meta[i],0x38,i);ptr(registry,0x98+i*8,meta[i]);global(getters[i],meta[i]);
    }
    global(0x102047f70UL,meta[0]); global(0x102048090UL,meta[0]);
    global(0x101df0768UL,meta[0]);global(0x101df2510UL,meta[0]);global(0x101df0708UL,meta[0]);
    memset((void *)0x10203f6e0UL,0,16);
    uint32_t nn;
    while(read_bytes(&nn,4)) {
        if(nn>16)return 10;
        _Alignas(32) uint8_t env[0x2e270]={0};
        _Alignas(16) uint8_t outputs[8][256]={{0}},caches[8][24]={{0}};
        uint32_t fields[8][32][2];uint8_t *nodes[16], *states[16][8];
        ((void (*)(void *))0x10031c720UL)(env);
        ((void (*)(void *))0x100319840UL)(env);
        for(unsigned i=0;i<8;i++) {
            u32(outputs[i],0,i);
            for(unsigned j=0;j<counts[i];j++)if(!read_bytes(outputs[i]+specs[i][j][1],specs[i][j][2]))return 8;
        }
        for(unsigned v=0;v<8;v++)((void (*)(void *,void *))0x10031b220UL)(env,outputs[order[v]]);
        for(unsigned v=0;v<8;v++) {
            unsigned g=order[v];for(unsigned j=0;j<counts[g];j++){fields[g][j][0]=specs[g][j][0];fields[g][j][1]=specs[g][j][1];}
            ptr(caches[g],0,fields[g]);u32(caches[g],8,counts[g]);ptr(caches[g],16,meta[g]);ptr(env,0x50+v*8,caches[g]);
        }
        /* Cache building is excluded; keep genuine OnLevelLoad reset/register. */
        env[0x2e264]=0;
        for(unsigned j=0;j<nn;j++) {
            nodes[j]=((void *(*)(void *))0x100319d40UL)(env);
            uint32_t offset=(uint32_t)(nodes[j]-env);if(!write_bytes(&offset,4))return 11;
            uint8_t raw[1040],mask[1040];if(!read_bytes(raw,1040)||!read_bytes(mask,1040))return 8;
            for(unsigned k=0;k<1040;k++)if(mask[k])nodes[j][k]=raw[k];
        }
        /* Ensure original load actually clears stale defaults and hull counts. */
        memset(env+0x98,0x5a,64);memset(env+0x2a0d8,0x5a,128);
        ((void (*)(void *,void *))0x1003198d0UL)(env,NULL);
        uint32_t trailer[]={get32(env,0x2e260),env[0x2e264]};
        if(!write_bytes(env+0x98,64)||!write_bytes(env+0x2a0d8,128)||!write_bytes(trailer,8))return 11;
        for(unsigned j=0;j<nn;j++) {
            for(unsigned g=0;g<8;g++)for(unsigned k=0;k<counts[g];k++)if(!write_bytes(nodes[j]+bases[g]+specs[g][k][1],specs[g][k][2]))return 11;
            for(unsigned g=0;g<8;g++){memcpy(&states[j][g],nodes[j]+0x3c8+g*8,8);if(!write_bytes(states[j][g]+24,32))return 11;}
        }
        for(unsigned frame=0;frame<12;frame++) {
            float clock[4];uint32_t mask;
            _Alignas(16) uint8_t time[0x30]={0},camera[0x1a0]={0};
            if(!read_bytes(clock,16)||!read_bytes(&mask,4)||!read_bytes(camera+0x190,16))return 8;
            memcpy(time+0x14,clock,4);memcpy(time+0x20,clock+1,4);
            *(uint8_t *)0x101ffb0d0UL=clock[3]!=0;memcpy((void *)0x100cb8540UL,clock+2,4);
            if(mask!=UINT32_MAX)for(unsigned j=0;j<nn;j++)nodes[j][0x50]=(mask>>j)&1;
            ((void (*)(void *,void *,void *))0x100319a30UL)(env,time,camera);
            for(unsigned g=0;g<8;g++)for(unsigned k=0;k<counts[g];k++)if(!write_bytes(outputs[g]+specs[g][k][1],specs[g][k][2]))return 11;
            for(unsigned j=0;j<nn;j++) {
                uint32_t enabled=nodes[j][0x50];if(!write_bytes(&enabled,4))return 11;
                for(unsigned g=0;g<8;g++)if(!write_bytes(states[j][g]+40,16))return 11;
            }
        }
    }
    return ferror(stdin)?12:0;
}
