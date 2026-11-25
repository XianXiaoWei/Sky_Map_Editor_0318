/* The ResourceManager::LoadNext body is unmodified. Registration, resource
 * virtual loading and assertion handling are explicit boundary services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x240000000UL;
static jmp_buf escape;
static uint32_t logs[256][4], log_count, error_line, severity, calls[8], h[15];
static uint32_t offset(const void *p){return (uintptr_t)p-(uintptr_t)memory;}
static uint32_t u32(const void *p){uint32_t n;memcpy(&n,p,4);return n;}
static uintptr_t ptr(const void *p){uintptr_t n;memcpy(&n,p,8);return n;}
static void log_service(uint32_t op,void *res,uint32_t status,uint32_t extra){
 if(log_count>=256)exit(12);
 uint32_t row[]={op,offset(res),status,extra};memcpy(logs[log_count++],row,16);
}
static void registration(uint8_t *manager,uint8_t *resource){
 log_service(1,resource,u32(resource+0x38),offset((void *)ptr(manager+0x4c0)));
 memcpy(resource+0x38,&(uint32_t){0xfedcba98},4);
 if(h[8])memset(resource+0x30,0,8);
 if(h[9])memcpy(manager+0x4c0,&(uintptr_t){(uintptr_t)(memory+0x2700)},8);
}
static void load(uint8_t *resource,uint8_t *context){
 uint32_t i=(offset(resource)-0x2000)/256;if(i>=8)exit(13);
 log_service(2,resource,u32(resource+0x38),offset(context));
 if(calls[i]++==0)resource[0x3a]=h[11];
 resource[0x38]=0x12;resource[0x39]=0x34;
 resource[0x3b]=calls[i]<=h[4]?h[5]:0;
 if(h[10])memcpy(memory+0x1010,&(uintptr_t){(uintptr_t)(context+0x10)},8);
}
static void unregistration(uint8_t *manager,uint8_t *resource){
 log_service(5,resource,0,0);
 memcpy(manager+0x4d0,&(uintptr_t){(uintptr_t)(memory+0x4000)},8);
}
static void assertion(const char *expr,const char *file,uint32_t line,uint32_t sev,...){
 (void)expr;(void)file;error_line=line;severity=sev;longjmp(escape,1);
}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(const void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED||fread(text,1,0xd22000,f)!=0xd22000)return 4;
 fclose(f);
 if(mmap(memory,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 hook(0x1007c3e30UL,registration);hook(0x1007c41e0UL,unregistration);hook(0x1007e5f70UL,assertion);
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(h,60);rd(memory,0x8000);
  memcpy(memory+0x7010,&(uintptr_t){(uintptr_t)load},8);
  log_count=error_line=severity=0;memset(calls,0,sizeof(calls));
  if(!setjmp(escape)){
   if(h[12]){
    memset(memory+0x14c0,0,8);
    for(uint32_t i=0;i<h[0];i++){
     void *res=memory+0x2000+i*256;
     ((void (*)(void *,void *))0x1007c2230UL)(memory+0x1000,res);
     for(uint32_t n=0;n<h[14];n++)((void (*)(void *))0x1007c1b40UL)(res);
     log_service(3,res,((uint32_t (*)(void *))0x1007c1b60UL)(res),0);
    }
   }
   for(uint32_t r=0;r<h[1];r++)((void (*)(void *,uint32_t))0x1007c3d20UL)(memory+0x1000,h[2]);
   if(h[12])for(uint32_t i=0;i<h[0];i++){
    void *res=memory+0x2000+i*256;
    for(uint32_t n=0;n<h[14];n++)((void (*)(void *))0x1007c1b50UL)(res);
    uint32_t load_count=((uint32_t (*)(void *))0x1007c1b60UL)(res);log_service(4,res,load_count,0);
    if(load_count==0)((void (*)(void *,void *))0x1007c2250UL)(memory+0x1000,res);
   }
  }
  memset(memory+0x7010,0,8);
  uint32_t out[]={error_line,severity,log_count};wr(out,12);wr(logs,log_count*16);wr(memory,0x8000);
 }
 return 0;
}
