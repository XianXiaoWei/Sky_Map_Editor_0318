#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

/* Execute the original GUID and one-LOD instruction subchains. Only external
 * serializer/heap services and the continuation are replaced. The complete
 * LevelData function, async IO, resource lookup and lifecycle are not executed. */
static uint8_t *input; static uint32_t cursor, input_size;
static uint32_t trace[64][4], traces, sizes[16], allocations;
static void *blocks[16];
static void fail(int n){exit(n);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)fail(10);}
static void putptr(void *p,size_t o,void *v){memcpy((char *)p+o,&v,8);}
static void tr(uint32_t op,uint32_t heap,uint32_t size,uint32_t align){if(traces==64)fail(11);uint32_t v[]={op,heap,size,align};memcpy(trace[traces++],v,16);}
static void *temp_heap(void){return (void *)0x31801UL;}
static void *allocate(void *heap,uint64_t size,void *label,uint32_t alignment){
 (void)label;if(size>10000000||allocations==16)fail(12);
 void *p=calloc(size?size:1,1);if(!p)fail(13);
 blocks[allocations]=p;sizes[allocations++]=(uint32_t)size;
 tr(1,heap==(void *)0x31801UL?0:1,size,alignment);return p;
}
static void release(void *heap,void *p){
 if(heap!=(void *)0x31801UL)fail(14);
 for(uint32_t i=0;i<allocations;i++)if(blocks[i]==p){tr(2,0,sizes[i],0);return;}
 fail(15);
}
static void read_u32(void *serializer,uint32_t *out){(void)serializer;if(cursor+4>input_size)fail(16);memcpy(out,input+cursor,4);cursor+=4;tr(3,0,*out,4);}
static void read_bytes(void *serializer,void *out,uint32_t n){
 (void)serializer;if(cursor+n>input_size)fail(17);
 int found=0;for(uint32_t i=0;i<allocations;i++)if(blocks[i]==out&&sizes[i]>=n)found=1;
 if(!found)fail(18);memcpy(out,input+cursor,n);cursor+=n;tr(4,0,n,0);
}
static void hook(uint64_t at,void *fn){uint8_t p[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(p+2,&fn,8);memcpy((void *)at,p,12);}
extern void run_lod(void *,void *,void *,uint32_t,void *);
extern uint32_t run_guid(uint32_t,uint32_t);
__asm__(
 ".text\nrun_lod:\n push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n sub $0x308,%rsp\n"
 " mov %rdi,0x20(%rsp)\n mov %rsi,0x50(%rsp)\n mov %rdx,0x10(%rsp)\n mov %ecx,%r13d\n mov %r8,%r15\n movabs $0x1003f4db5,%r11\n call *%r11\n"
 " add $0x308,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n"
 "run_guid:\n push %rbx\n push %r15\n sub $8,%rsp\n mov %edi,(%rsp)\n mov %rsp,%rbx\n mov %esi,%r15d\n movabs $0x1003f4c63,%r11\n call *%r11\n mov (%rsp),%eax\n add $8,%rsp\n pop %r15\n pop %rbx\n ret\n"
);
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(memory==MAP_FAILED||fread(memory,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x1007c6c20UL,temp_heap);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);
 hook(0x10076a280UL,read_u32);hook(0x10076a0a0UL,read_bytes);
 *(uint8_t *)0x1003f4d99UL=0xc3;*(uint8_t *)0x1003f4c6eUL=0xc3;
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(uint32_t c=0;c<cases;c++){
  uint32_t h[9];readin(h,sizeof h); /* guid, exists, usable, uniform, lodIndex, samples, extra, render, meshSamples */
  if(h[5]>100000||h[6]>10000000||h[7]>100000||h[4]>31)return 5;
  uint32_t *remap=calloc(h[7]?h[7]:1,4);readin(remap,h[7]*4);
  input_size=8+(h[3]?12:h[5]*12)+h[6];input=malloc(input_size);memcpy(input,h+5,8);readin(input+8,input_size-8);
  uint8_t level[0x40]={0},mesh[0x50]={0};uint8_t *mesh_lods=calloc(h[4]+1,0xb8),*loaded=malloc((h[4]+1)*24);memset(loaded,0xa5,(h[4]+1)*24);
  putptr(level,0x30,(void *)0x31802UL);putptr(mesh,0x48,mesh_lods);
  memcpy(mesh_lods+h[4]*0xb8+0x34,h+7,4);memcpy(mesh_lods+h[4]*0xb8+0x40,h+8,4);putptr(mesh_lods+h[4]*0xb8,0x98,remap);
  traces=0;allocations=0;cursor=0;uint8_t uniform=h[3];
  uint32_t guid=run_guid(h[0],h[1]);run_lod(h[2]?mesh:NULL,&uniform,level,h[4],loaded);
  uint8_t *out=loaded+h[4]*24;void *packed,*extra;memcpy(&packed,out+8,8);memcpy(&extra,out+16,8);
  uint32_t result[7]={guid,0,0,packed!=NULL,extra!=NULL,cursor,traces};memcpy(result+1,out,8);
  fwrite(result,sizeof result,1,stdout);fwrite(trace,16,traces,stdout);
  if(packed)fwrite(packed,12,result[1],stdout);if(extra)fwrite(extra,1,result[2],stdout);
  for(uint32_t i=0;i<allocations;i++)free(blocks[i]);free(loaded);free(mesh_lods);free(remap);free(input);
 }
 return 0;
}
