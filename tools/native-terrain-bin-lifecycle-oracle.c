#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void pointer(uint8_t *p,size_t at,void *v){memcpy(p+at,&v,8);}
static void jump(uintptr_t at,void *target){
 static uintptr_t slot=0x102300000UL;uint8_t code[6]={0xff,0x25};int32_t d=(int32_t)(slot-at-6);
 memcpy(code+2,&d,4);memcpy((void *)slot,&target,8);slot+=8;memcpy((void *)at,code,6);
}
static uint16_t *active_lods;static uint32_t active_count,locks,unlocks,inject_bin,inject_lod,job_direction;
static void exclusive_begin(void *guard,void *mutex){
 memcpy(guard,&mutex,8);locks++;
 if(inject_bin<active_count){active_lods[inject_bin]=(uint16_t)inject_lod;inject_bin=UINT32_MAX;}
}
static void exclusive_end(void *guard){(void)guard;unlocks++;}
static void zero_bytes(void *p,size_t n){memset(p,0,n);}
static void refine(void *barn,void *model,uint32_t bin){(void)barn;(void)model;(void)bin;job_direction=1;}
static void coarsen(void *barn,void *model,uint32_t bin){(void)barn;(void)model;(void)bin;job_direction=2;}
extern void terrain_visibility_span(void *,void *,void *,uint32_t);
extern void terrain_visibility_return(void);
// Original numeric LOD targets are explicit input here. Only delimit the
// visibility-transition span; the native preparation/removal bodies remain.
__asm__(".text\nterrain_visibility_span:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\n"
 "and $-32,%rsp\nsub $0x1c0,%rsp\nmov %rsi,%r14\nmov %rdx,%rbx\n"
 "lea 0x470(%rdi),%rax\nmov %rax,0x20(%rsp)\n"
 "lea 0x4b8(%rdi),%rax\nmov %rax,0x38(%rsp)\n"
 "lea 0x4f0(%rdi),%rax\nmov %rax,0x48(%rsp)\n"
 "test %ecx,%ecx\nje terrain_visibility_return\n"
 "movabs $0x1006a331f,%r11\njmp *%r11\n"
 "terrain_visibility_return:\nlea -40(%rbp),%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 // Imported mutex/zero services only; no patches inside the native release,
 // preparation or reference-compaction bodies. Serialized explicit locks.
 jump(0x1007e9360UL,exclusive_begin);jump(0x1007e9480UL,exclusive_end);jump(0x100aa24aaUL,zero_bytes);
 // Only the dispatch decision is checked for LOD jobs; tessellation worker
 // entries are explicit recording callbacks, not restored worker bodies.
 jump(0x1006a81d0UL,refine);jump(0x1006a88c0UL,coarsen);
 jump(0x1006a343aUL,terrain_visibility_return);
 uint8_t *blocks=mmap((void *)0x103000000UL,0x200000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(blocks==MAP_FAILED)return 5;
 uint32_t groups;readin(&groups,4);fwrite(&groups,4,1,stdout);
 for(uint32_t g=0;g<groups;g++){
  uint32_t p[6];readin(p,sizeof p);uint32_t bins=p[0],enabled=p[1],vslots=p[2],vcount=p[3],islots=p[4],icount=p[5],steps;
  if(bins>1024||vslots>4096||islots>4096||vcount>vslots||icount>islots)return 6;
  _Alignas(32) uint8_t model[0x600],original[0x600],barn[0x550]={0};readin(model,sizeof model);memcpy(original,model,sizeof model);
  size_t block_bytes=(size_t)bins*0x3e0+64,packet_bytes=(size_t)bins*128+64,lod_bytes=(size_t)bins*2+64;
  uint8_t *packets=malloc(packet_bytes),*lods=malloc(lod_bytes),*pending=malloc(lod_bytes),*vrefs=malloc(vslots*16+64),*irefs=malloc(islots*16+64);
  if(!packets||!lods||!pending||!vrefs||!irefs)return 7;
  readin(blocks,block_bytes);readin(packets,packet_bytes);readin(lods,lod_bytes);readin(pending,lod_bytes);readin(vrefs,vslots*16+64);readin(irefs,islots*16+64);
  pointer(model,0x1c8,enabled?blocks:NULL);pointer(model,0x1d0,packets);pointer(model,0x1a8,lods);pointer(model,0x1b0,pending);memcpy(model+0x1d8,&bins,4);
  pointer(barn,0x4b8+0x28,vrefs);memcpy(barn+0x4b8+0x30,&vcount,4);pointer(barn,0x4f0+0x28,irefs);memcpy(barn+0x4f0+0x30,&icount,4);
  active_lods=(uint16_t *)lods;active_count=bins;readin(&steps,4);
  for(uint32_t step=0;step<steps;step++){
   uint32_t op[4];readin(op,sizeof op);uint16_t *desired=malloc(lod_bytes);if(!desired)return 8;readin(desired,lod_bytes);
   locks=unlocks=job_direction=0;inject_bin=op[2];inject_lod=op[3];
   if(op[0]==0){terrain_visibility_span(barn,model,desired,bins);}
   else if(op[0]==1&&op[1]<bins){((void (*)(void *,void *,uint32_t))0x1006a8100UL)(barn,model,op[1]);}
   else if(op[0]==2&&op[1]<bins){
    _Alignas(32) uint8_t job[0x28]={0};uint16_t target=(uint16_t)op[3];
    pointer(job,0x10,model);memcpy(job+0x18,&op[1],4);memcpy(job+0x1c,&target,2);pointer(job,0x20,barn);
    ((void (*)(void *))0x1006ad3f0UL)(job);
   }
   else return 9;
   memcpy(&vcount,barn+0x4b8+0x30,4);memcpy(&icount,barn+0x4f0+0x30,4);
   uint32_t info[5]={locks,unlocks,vcount,icount,job_direction};fwrite(info,sizeof info,1,stdout);
   fwrite(blocks,1,block_bytes,stdout);fwrite(lods,1,lod_bytes,stdout);fwrite(pending,1,lod_bytes,stdout);
   fwrite(vrefs,1,vslots*16+64,stdout);fwrite(irefs,1,islots*16+64,stdout);fwrite(desired,1,lod_bytes,stdout);free(desired);
  }
  fwrite(packets,1,packet_bytes,stdout);
  for(size_t at=0x1a8;at<=0x1d0;at+=8)if(at!=0x1b8&&at!=0x1c0)memcpy(model+at,original+at,8);
  memcpy(model+0x1d8,original+0x1d8,4);fwrite(model,1,sizeof model,stdout);
  free(packets);free(lods);free(pending);free(vrefs);free(irefs);
 }
 return 0;
}
