#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;static uint32_t rng,line,severity;static jmp_buf escape;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint32_t random_value(void){rng=rng*1103515245+12345;return rng>>1;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void* metadata(void){return a+0x7000;}
static void cast(void*meta,void**out,void**input,void*source){(void)meta;(void)source;*out=*input?(uint8_t*)*input-8:NULL;}
static uint8_t enabled(void*p){return ((uint8_t*)p)[64];}
static uint8_t raycast(void*scene,void*origin,void*direction,void*options,void*out,float maximum){
 (void)scene;memcpy(a+0x5100,origin,16);memcpy(a+0x5110,direction,16);memcpy(a+0x5120,&maximum,4);memcpy(a+0x5124,(uint8_t*)options+4,4);
 memcpy(out,a+0x5010,32);((uint8_t*)out)[36]=a[0x5001];return a[0x5000];
}
static void* avatar_at(void*owner,uint32_t i){(void)owner;return a+0x3000+i*128;}
static uint8_t avatar_active(void*p){return ((uint8_t*)p)[64];}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2b22UL,random_value);hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,metadata);hook(0x10043ccc0UL,metadata);
 hook(0x1003f0590UL,metadata);hook(0x100268810UL,metadata);hook(0x100268830UL,metadata);
 hook(0x100776a90UL,raycast);hook(0x1001031d0UL,avatar_at);hook(0x1000fe050UL,avatar_active);
 *(void**)0x100c0d8d8UL=a+0x7ff0;
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t h[5];rd(h,20);rd(a,0x8000);rng=h[1];line=severity=0;
  *(void**)(a+0x7000)=a+0x7080;*(void**)(a+0x70c0)=cast;*(void**)(a+0x7090)=enabled;
  *(uint32_t*)0x100d2cb38UL=h[2];*(uint32_t*)0x100d2cb3cUL=h[3];*(uint32_t*)0x100d2cb40UL=h[4];
  if(!setjmp(escape)){
   if(h[0]==3){float delta;memcpy(&delta,a+0x5040,4);((void(*)(void*,void*,void*,void*,float))0x1001a4520UL)(a+0x1000,a+0x2000,a+0x2100,a+0x2200,delta);}
   else if(h[0]==2){float lookahead;memcpy(&lookahead,a+0x5040,4);((void*(*)(void*,void*,void*,void*,void*,float))0x10062d590UL)(a+0x2100,a+0x1000,a+0x2000,a+0x2200,a+0x5008,lookahead);}
   else if(h[0])((void(*)(void*,void*,void*,void*))0x10062e5b0UL)(a+0x1000,a+0x2000,a+0x2100,a+0x2200);
   else ((void(*)(void*,void*))0x1001a29d0UL)(a+0x1000,a+0x2000);
  }
  h[0]=*(uint32_t*)0x100d2cb38UL;h[1]=*(uint32_t*)0x100d2cb3cUL;h[2]=*(uint32_t*)0x100d2cb40UL;
  memset(a+0x7000,0,0x100);wr(&line,4);wr(&severity,4);wr(&rng,4);wr(h,12);wr(a,0x8000);
 }return 0;
}
