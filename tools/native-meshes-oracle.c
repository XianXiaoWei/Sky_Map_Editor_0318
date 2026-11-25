/* Sky 0.3.18 MaterialDef initialization and TerrainBarn scatter oracle.
 * Native material initialization/color conversion and scatter instructions run
 * directly. Imports use Linux libc. Only scratch allocation calls in scatter
 * are redirected to this harness; the allocation policy is outside its scope.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>

static void bind(uintptr_t stub, void *fn) {
    int32_t disp; memcpy(&disp,(void *)(stub+2),4);
    memcpy((void *)(stub+6+disp),&fn,8);
}
static void *scratch(void) { return (void *)1; }
static void *allocate(void *heap,size_t size,void *tag,uint32_t align) {
    (void)heap;(void)tag;(void)align;return calloc(1,size?size:1);
}
static void release(void *heap,void *p) { (void)heap;free(p); }
static void redirect(uintptr_t call,uintptr_t thunk,void *fn) {
    uint8_t code[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(code+2,&fn,8);memcpy((void *)thunk,code,sizeof(code));
    int32_t rel=(int32_t)(thunk-call-5);memcpy((void *)(call+1),&rel,4);
}
static uint32_t get32(void *p,size_t at) { uint32_t v;memcpy(&v,(char *)p+at,4);return v; }
int main(int argc,char **argv) {
    if(argc!=3)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *memory=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE|PROT_EXEC,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(memory==MAP_FAILED)return 4;
    if(fread(memory,1,0xd22000,file)!=0xd22000)return 5;fclose(file);
    static uint64_t guard=0x12345678;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    bind(0x100aa2900UL,memset);bind(0x100aa28f4UL,memcpy);
    bind(0x100aa2c4eUL,strcmp);bind(0x100aa2a2cUL,powf);
    extern void bzero(void *,size_t);bind(0x100aa24aaUL,bzero);
    _Alignas(32) uint8_t barn[0x34d0]={0};
    ((void (*)(void *,const char *))0x10043fb70UL)(barn,argv[2]);
    uint32_t count=get32(barn,12);if(count!=30)return 6;
    fwrite(&count,4,1,stdout);
    for(unsigned i=0;i<count;i++) {
        uint8_t *def=barn+16+i*0x1a0;fwrite(def,1,0x1a0,stdout);
        /* Pointer data is resolved in Python against the SHA-gated executable. */
    }
    const uintptr_t calls[]={0x1006a72d9UL,0x1006a730eUL,0x1006a732eUL,0x1006a7a0bUL,0x1006a7a1fUL,0x1006a7a2fUL};
    for(unsigned i=0;i<6;i++)redirect(calls[i],0x102200000UL,scratch);
    const uintptr_t allocations[]={0x1006a72fbUL,0x1006a7326UL,0x1006a7360UL};
    for(unsigned i=0;i<3;i++)redirect(allocations[i],0x102200020UL,allocate);
    const uintptr_t frees[]={0x1006a7a1aUL,0x1006a7a2aUL,0x1006a7a3aUL};
    for(unsigned i=0;i<3;i++)redirect(frees[i],0x102200040UL,release);
    uint8_t *defs[30];for(unsigned i=0;i<30;i++)defs[i]=barn+16+i*0x1a0;
    uint32_t header[3];
    while(fread(header,4,3,stdin)==3) {
        unsigned stride=header[0],vc=header[1],ic=header[2];if((stride!=36&&stride!=40)||vc>65536||ic>10000000||ic%3)return 7;
        uint8_t *vertices=malloc((size_t)vc*stride);uint16_t *src=malloc(ic*2+2),*dst=malloc((size_t)ic*59*2+2);uint32_t counts[59]={0};
        if(fread(vertices,stride,vc,stdin)!=vc||fread(src,2,ic,stdin)!=ic)return 8;
        typedef uint32_t (*Scatter)(void *,uint32_t,void *,uint32_t,void *,uint32_t,void *,void *);
        uint32_t n=((Scatter)0x1006a7280UL)(src,ic,vertices,stride,defs,30,dst,counts);
        fwrite(&n,4,1,stdout);fwrite(counts,4,59,stdout);fwrite(dst,2,n,stdout);
        free(vertices);free(src);free(dst);
    }
    return ferror(stdin)?9:0;
}
