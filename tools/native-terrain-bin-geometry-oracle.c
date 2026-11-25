#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#include <immintrin.h>
#include <signal.h>
#include <ucontext.h>
static uint32_t active;
static void crashed(int signal,siginfo_t *info,void *context){ucontext_t *u=context;fprintf(stderr,"Terrain creation signal=%d case=%u address=%p rip=%llx\n",signal,active,info->si_addr,(unsigned long long)u->uc_mcontext.gregs[REG_RIP]);_Exit(128+signal);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void pointer(void *at,void *value){memcpy(at,&value,8);}
static void *aligned(size_t n){void *p=NULL;if(posix_memalign(&p,32,n?n:32))exit(11);return p;}
static void jump(uintptr_t at,void *target){static uintptr_t slot=0x102300000UL;uint8_t code[6]={0xff,0x25};int32_t disp=(int32_t)(slot-at-6);memcpy(code+2,&disp,4);memcpy((void *)slot,&target,8);slot+=8;memcpy((void *)at,code,6);}
static struct {void *memory;size_t bytes;uint32_t context,alignment;} allocations[65536];
static uint32_t allocation_count,fill,release_count;
static void *scratch_context(void){return (void *)2;}
static void *allocate(void *context,size_t bytes,void *meta,uint32_t align){
 (void)meta;if(bytes>256000000||allocation_count>=65536)exit(12);
 void *p=aligned(bytes+64);memset(p,fill,bytes+64);allocations[allocation_count].memory=p;allocations[allocation_count].bytes=bytes;allocations[allocation_count].context=(uintptr_t)context;allocations[allocation_count].alignment=align;allocation_count++;return p;
}
static void release(void *context,void *p){(void)context;for(uint32_t i=allocation_count;i>0;i--)if(allocations[i-1].memory==p){release_count++;free(p);allocations[i-1].memory=NULL;return;}exit(13);}
static void output_storage(uint8_t *model,size_t at){void *p;memcpy(&p,model+at,8);for(uint32_t i=0;i<allocation_count;i++)if(allocations[i].memory==p){uint32_t bytes=allocations[i].bytes;fwrite(&bytes,4,1,stdout);fwrite(p,1,bytes+64,stdout);return;}exit(14);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 struct sigaction action={0};action.sa_sigaction=crashed;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,NULL);sigaction(SIGBUS,&action,NULL);
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 static uint64_t cookie=0x318a9000facedULL;pointer((void *)0x100c0d8d8UL,&cookie);
 jump(0x100795530UL,allocate);jump(0x100795a70UL,release);jump(0x1007c6c20UL,scratch_context);
 jump(0x100aa24aaUL,bzero);jump(0x100aa28f4UL,memcpy);jump(0x100aa2900UL,memset);jump(0x100aa2c4eUL,strcmp);jump(0x100aa2a2cUL,powf);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(active=0;active<cases;active++){
  uint32_t p[4];readin(p,sizeof p);uint32_t vc=p[0],ic=p[1],bins=p[2];fill=p[3];if(vc>65536||ic>10000000||bins>100000||ic%3)return 5;
  char level[128];readin(level,sizeof level);level[127]=0;
  uint8_t *barn=aligned(0xe7000),*material=aligned(0x34d0),*model=aligned(0x5f0),*vertices=aligned(vc*36),*indices=aligned(ic*2),*bin_headers=aligned(bins*8);
  _Alignas(32) uint8_t terrain[0xd0]={0};_Alignas(32) float transform[16];
  memset(barn,0,0xe7000);memset(material,0,0x34d0);memset(model,0xff,0x5f0);pointer(model,NULL);
  readin(terrain,0x20);readin(terrain+0x50,0x30);readin(transform,sizeof transform);readin(vertices,vc*36);readin(indices,ic*2);readin(bin_headers,bins*8);
  *(uint32_t *)(terrain+0x20)=vc;*(uint32_t *)(terrain+0x24)=ic;*(uint32_t *)(terrain+0x80)=bins;terrain[0xc1]=1;
  pointer(terrain+0x28,vertices);pointer(terrain+0x30,indices);pointer(terrain+0x88,bin_headers);
  pointer(barn+0xe6c70,model);pointer(barn+0x340,(void *)1);
  _mm_setcsr(0x1f80);((void (*)(void *,const char *))0x10043fb70UL)(material,level);
  uint32_t definitions=*(uint32_t *)(material+12);if(definitions!=30)return 6;
  *(uint32_t *)(barn+0xe08)=definitions;for(uint32_t i=0;i<definitions;i++)pointer(barn+0xe10+i*8,material+16+i*0x1a0);
  allocation_count=release_count=0;
  // Complete normal creation body and original GetScale, OBB/matrix helpers
  // and global/per-bin scatter. Only CPU heap/imports are host services.
  // Explicit terrain+0xc1 suppresses CollisionGeoBarn registration.
  _mm_setcsr(0x1f80);uint32_t before=_mm_getcsr();
  void *result=((void *(*)(void *,void *,void *,uint32_t,uint32_t))0x1006a9000UL)(barn,terrain,transform,1,0);
  uint32_t after=_mm_getcsr();if(result!=model)return 7;
  fwrite(&before,4,1,stdout);fwrite(&after,4,1,stdout);
  fwrite(model+0x1dc,4,59,stdout);fwrite(model+0x2cc,4,59,stdout);
  for(size_t at=0x1a0;at<=0x1d0;at+=8)if(at!=0x1c8)output_storage(model,at);
  for(size_t at=0x3b8;at<0x590;at+=8)output_storage(model,at);
  fwrite(&allocation_count,4,1,stdout);fwrite(&release_count,4,1,stdout);
  for(uint32_t i=0;i<allocation_count;i++){uint32_t event[3]={allocations[i].context,allocations[i].bytes,allocations[i].alignment};fwrite(event,4,3,stdout);free(allocations[i].memory);}
  free(barn);free(material);free(model);free(vertices);free(indices);free(bin_headers);
 }
 return 0;
}
