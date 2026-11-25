#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint32_t calls,line,severity,transforms;
static uint64_t trace[16384][4];
static jmp_buf escape;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=16384)exit(12);uint64_t row[4]={kind,x,y,0};memcpy(trace[calls++],row,32);}
static uint32_t u32(void *p){uint32_t n;memcpy(&n,p,4);return n;}
static void assertion(char *text,char *file,uint32_t l,uint32_t s,...){(void)text;(void)file;line=l;severity=s;longjmp(escape,1);}
static uint8_t *geometry(void *p){return a+0x30000+((uint8_t*)p-(a+0x3220))/0x1a0*128;}
static void transform(void *out,void *p){record(1,(uintptr_t)p,0);if(!transforms++){
 uint32_t mutation=u32(a+0x5f000);
 if(mutation==1){uint64_t first,second;memcpy(&first,a+0x28008,8);memcpy(&second,a+0x28010,8);memcpy(a+0x28008,&second,8);memcpy(a+0x28010,&first,8);}
 if(mutation==2){uint32_t cursor=2;memcpy(a+0x29000,&cursor,4);}
 if(mutation==3){uint32_t count=8;memcpy((uint8_t*)p+0x104,&count,4);}
 }memcpy(out,geometry(p),64);}
static void obb(void *out,void *p){record(2,(uintptr_t)p,0);memcpy(out,geometry(p)+64,64);}
static float distance(void *point,void *box){float result=((float(*)(void*,void*))0x10078ce10UL)(point,box);uint32_t bits;memcpy(&bits,&result,4);record(3,bits,0);return result;}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 // Hierarchy and Obb distance execute their original bodies. Only the two
 // mesh virtuals and assertion service are prepared dependencies.
 hook(0x1007e6030UL,assertion);
 // Calls are redirected to an observer which still executes the original leaf.
 int32_t relative=(int32_t)(0x100700000UL-0x10027aec5UL);memcpy((void*)0x10027aec1UL,&relative,4);
 relative=(int32_t)(0x100700000UL-0x10027af06UL);memcpy((void*)0x10027af02UL,&relative,4);
 relative=(int32_t)(0x100700000UL-0x10027afc3UL);memcpy((void*)0x10027afbfUL,&relative,4);
 relative=(int32_t)(0x100700000UL-0x10027b006UL);memcpy((void*)0x10027b002UL,&relative,4);
 hook(0x100700000UL,distance);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){rd(a,0x60000);calls=line=severity=transforms=0;
  void *fn=transform;memcpy(a+0x5e018,&fn,8);fn=obb;memcpy(a+0x5e028,&fn,8);
  if(!setjmp(escape)){
   uint64_t parent;memcpy(&parent,a+0x5f010,8);
   ((void(*)(void*,void*,void*,void*,uint32_t,void*))0x10027ae30UL)((void*)(uintptr_t)parent,a+0x3220,a+0x28000,a+0x29000,u32(a+0x5f004),a+0x2000);
  }
  memset(a+0x5e000,0,0x100);wr(&line,4);wr(&severity,4);wr(a,0x60000);wr(&calls,4);wr(trace,calls*32);
 }return 0;
}
