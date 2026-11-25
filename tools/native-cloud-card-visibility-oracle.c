/* Execute the original CloudCardBarn prologue, all six plane extractions,
 * sphere tests and unstable status compaction. External Visibility statuses
 * and scratch allocator are explicit callbacks. Stop before dynamic vertices. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static _Alignas(32) uint8_t records[512*128],barn[0x209b0],camera[0x200];
static uint32_t source_order[512],input_status[512],candidate_order[512],initial_status[512];
static uint32_t final_order[512],final_status[512],candidate_count,final_count,getters,classifier_calls;
static _Alignas(32) float planes[24],candidate_spheres[512*4],final_spheres[512*4];
static void *scratch[3];static unsigned allocations,frees,compacted;
static void readin(void *p,size_t n) {if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn) {
    uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);
}
__attribute__((used,noinline)) static void *scratch_get(void *frame) {
    if(!getters++) {
        const int offsets[]={0x90,0x80,0xa0,0xc0,0x70,0x50};
        for(unsigned i=0;i<6;i++)memcpy(planes+i*4,(uint8_t *)frame-offsets[i],16);
    }
    return NULL;
}
__attribute__((naked,noinline)) static void getter(void) {__asm__ volatile("mov %rbp,%rdi\njmp scratch_get\n");}
static void *allocate(void *allocator,size_t size,void *tag,unsigned align) {
    (void)allocator;(void)tag;void *p=NULL;
    if(allocations>=3||posix_memalign(&p,align<8?8:align,size))exit(11);
    memset(p,0,size);scratch[allocations++]=p;return p;
}
static void release(void *allocator,void *p) {(void)allocator;frees++;free(p);}
static void classify(void *visibility,float *spheres,unsigned count,uint32_t *statuses,unsigned flag) {
    (void)visibility;classifier_calls++;if(flag||count>512)exit(12);
    candidate_count=count;memcpy(candidate_spheres,spheres,count*16);memcpy(initial_status,statuses,count*4);
    void **cards=scratch[0];
    for(unsigned i=0;i<count;i++) {
        uintptr_t record=((uintptr_t)cards[i]-(uintptr_t)records)/128;
        if(record>=512)exit(13);
        unsigned source=source_order[record];
        candidate_order[i]=source;statuses[i]=input_status[source];
    }
}
__attribute__((used,noinline)) static void capture(unsigned count,void **cards,uint32_t *statuses,float *spheres) {
    compacted=1;final_count=count;memcpy(final_status,statuses,count*4);memcpy(final_spheres,spheres,count*16);
    for(unsigned i=0;i<count;i++)final_order[i]=source_order[((uintptr_t)cards[i]-(uintptr_t)records)/128];
}
__attribute__((naked,noinline)) static void compact_end(void) {
    __asm__ volatile("mov %r13d,%edi\nmov -0x38(%rbp),%rsi\nmov %rbx,%rdx\nmov %r15,%rcx\n"
      "call capture\nmovabs $0x1002213bc,%rax\njmp *%rax\n");
}
int main(int argc,char **argv) {
    if(argc!=2)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
    fclose(file);
    hook(0x1007c6c20UL,getter);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);
    hook(0x100720dd0UL,classify);hook(0x100220b62UL,compact_end);
    uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
    for(unsigned c=0;c<cases;c++) {
        uint32_t count,enabled;readin(&count,4);readin(&enabled,4);if(count>512||enabled>1)return 5;
        memset(barn,0,sizeof(barn));memset(camera,0,sizeof(camera));memset(planes,0,sizeof(planes));
        candidate_count=final_count=getters=classifier_calls=allocations=frees=compacted=0;
        readin(camera+0x1c0,64);readin(source_order,count*4);readin(input_status,count*4);
        float inputs[512*4];readin(inputs,count*16);
        for(unsigned i=0;i<count;i++) {if(source_order[i]>=count)return 6;memcpy(records+i*128+0x70,inputs+source_order[i]*4,16);}
        void *p=records;memcpy(barn+0x10018,&p,8);memcpy(barn+0x10010,&count,4);
        *(uint32_t *)(barn+0x209ac)=123;*(uint8_t *)0x100c96181UL=(uint8_t)enabled;
        ((void (*)(void *,void *,void *))0x1002206f0UL)(barn,camera,NULL);
        unsigned plane_count=getters?6:0;
        fwrite(barn+0x209ac,4,1,stdout);fwrite(&plane_count,4,1,stdout);fwrite(planes,16,plane_count,stdout);
        fwrite(&classifier_calls,4,1,stdout);fwrite(&candidate_count,4,1,stdout);
        fwrite(candidate_order,4,candidate_count,stdout);fwrite(initial_status,4,candidate_count,stdout);fwrite(candidate_spheres,16,candidate_count,stdout);
        fwrite(&final_count,4,1,stdout);fwrite(final_order,4,final_count,stdout);fwrite(final_status,4,final_count,stdout);fwrite(final_spheres,16,final_count,stdout);
        if(compacted) {for(unsigned i=0;i<allocations;i++)free(scratch[i]);}
        else if(allocations!=frees)return 7;
    }
    return 0;
}
