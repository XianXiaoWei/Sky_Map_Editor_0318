#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static _Alignas(32) uint8_t event[96],camera[1024],keys[8][144],game[0x300],clock_state[64],system_state[0x300],wrapper[32],clump[32],barn[32],metadata[64];
static uintptr_t members[8],meta_vtable[16];static uint32_t h[8],calls;static jmp_buf trap;
static uint64_t stack_guard=0x318beef;
typedef struct {uint32_t code,arg;float values[4];} Trace;
static Trace traces[32];
static void record(uint32_t code,uint32_t arg){if(calls>=32)exit(20);memset(&traces[calls],0,sizeof(Trace));traces[calls].code=code;traces[calls++].arg=arg;}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void *object_meta(void){return metadata;}
static void cast(void *meta,void **out,void **in,void *from){(void)meta;(void)from;unsigned index=0;
 if(h[0]==0){record(1,0);*out=h[3]?camera:NULL;return;}
 while(index<8&&*in!=keys[index])index++;record(2,index);*out=(h[5]&&index+1==h[5])?NULL:*in;
 if(h[7]==1&&index==0){*(float *)(event+0x40)=-2.5f;*(uint32_t *)(clump+0x10)=1;}
}
static void fail(const char *condition,const char *file,uint32_t line,uint32_t group){(void)condition;(void)file;(void)group;record(9,line);longjmp(trap,1);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x1007abc10UL,object_meta);hook(0x1007e5f70UL,fail);meta_vtable[8]=(uintptr_t)cast;memcpy(metadata,&(void *){meta_vtable},8);
 memcpy((void *)0x101ddde50UL,&(void *){metadata},8);
 memcpy((void *)0x100c0d8d8UL,&(void *){&stack_guard},8);
 memcpy((void *)0x101dddb58UL,&(void *){metadata},8);memcpy((void *)0x10203e920UL,&(void *){metadata},8);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(uint32_t c=0;c<count;c++){
  readin(h,sizeof(h));readin(event,sizeof(event));readin(camera,sizeof(camera));readin(keys,sizeof(keys));readin(barn,sizeof(barn));
  memset(game,0,sizeof(game));memset(system_state,0,sizeof(system_state));memset(wrapper,0,sizeof(wrapper));memset(clump,0,sizeof(clump));camera[0xe8]=0;memset(camera+0xe8,0,16);memset(camera+0x378,0,8);
  for(unsigned i=0;i<8;i++)members[i]=(uintptr_t)keys[i];memcpy(clump+8,&(void *){members},8);*(uint32_t *)(clump+0x10)=h[4];memcpy(event+0x18,&(void *){barn},8);if(h[0])memcpy(event+0x38,&(void *){clump},8);
  memcpy(game+0x160,&(void *){clock_state},8);memcpy(game+0x298,&(void *){system_state},8);memcpy(system_state+0x118,&(void *){wrapper},8);memcpy(wrapper+0x10,&(void *){h[2]?camera:NULL},8);
  if(h[6])((void (*)(void *))(h[0]?0x100591d90UL:0x1003a0ec0UL))(event);
  for(unsigned frame=0;frame<h[1];frame++){
   if(getenv("SKY_CAMERA_EVENT_DEBUG"))fprintf(stderr,"case=%u kind=%u frame=%u\n",c,h[0],frame);
   float input[4];readin(input,16);memcpy(clock_state+0x14,input,4);memcpy(clock_state+0x20,input+1,4);*(uint8_t *)0x101ffb0d0UL=input[3]!=0;memcpy((void *)0x100cb8540UL,input+2,4);calls=0;
   int failed=setjmp(trap);if(!failed)((void (*)(void *,void *))(h[0]?0x100591da0UL:0x1003a0ee0UL))(event,game);
   uint32_t result[]={calls,!!failed,!h[0]&&!memcmp(camera+0x378,event+0x38,8),*(uint32_t *)(clump+0x10)};fwrite(result,4,4,stdout);
   uint8_t clean_event[96],clean_camera[1024];memcpy(clean_event,event,96);memset(clean_event+0x18,0,8);if(h[0])memset(clean_event+0x38,0,8);memcpy(clean_camera,camera,1024);
   fwrite(clean_event,1,96,stdout);fwrite(clean_camera,1,1024,stdout);fwrite(keys,1,sizeof(keys),stdout);fwrite(barn,1,32,stdout);fwrite(traces,sizeof(Trace),calls,stdout);
  }
 }
 return 0;
}
