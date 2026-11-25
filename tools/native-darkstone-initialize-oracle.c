#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint32_t calls,randomIndex;
static uint8_t trace[32][96];
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint32_t u32(void *p){uint32_t n;memcpy(&n,p,4);return n;}
static uint8_t *record(uint64_t kind,uint64_t object){if(calls>=32)exit(12);uint8_t *r=trace[calls++];memset(r,0,96);memcpy(r,&kind,8);memcpy(r+8,&object,8);return r;}
static const char *str(void *p){if(*(uint8_t*)p&1){char *out;memcpy(&out,(uint8_t*)p+16,8);return out;}return (char*)p+1;}
static void transform(void *out,void *p){record(1,(uintptr_t)p);memcpy(out,a+0x30000,64);}
static void obb(void *out,void *p){record(2,(uintptr_t)p);memcpy(out,a+0x30040,64);}
static uint32_t guid(void *p){uint32_t n=u32((uint8_t*)p+16);uint8_t *r=record(3,(uintptr_t)p);memcpy(r+48,&n,4);return n;}
static int random_value(void){if(randomIndex>=2)exit(13);int n=(int)u32(a+0x5f000+randomIndex++*4);uint8_t *r=record(4,0);memcpy(r+48,&n,4);return n;}
static void vector(void *p,uint32_t pass,void *name,void *color,float transition){if(pass||transition!=0)exit(14);uint8_t *r=record(5,(uintptr_t)p);snprintf((char*)r+16,32,"%s",str(name));memcpy(r+48,color,16);
 if(u32(a+0x5f024)==1&&calls==5){void *mesh=a+0x51000;memcpy(a+0x4028,&mesh,8);}
}
static void texture(void *p,uint32_t pass,void *name,void *image){if(pass)exit(15);uint8_t *r=record(6,(uintptr_t)p);snprintf((char*)r+16,32,"%s",str(name));snprintf((char*)r+48,32,"%s",str(image));}
static void enabled(void *p,int n){uint8_t *r=record(7,(uintptr_t)p);memcpy(r+48,&n,4);if(u32(a+0x5f024)==2)a[0x1038]^=1;}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2b22UL,random_value);hook(0x100aa2c4eUL,strcmp);
 hook(0x1003fff20UL,vector);hook(0x1003fffc0UL,texture);hook(0x1003ffe50UL,enabled);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){rd(a,0x60000);calls=randomIndex=0;
  void *fn=transform;memcpy(a+0x5e018,&fn,8);fn=obb;memcpy(a+0x5e020,&fn,8);fn=guid;memcpy(a+0x5e130,&fn,8);
  memcpy((void*)0x100d2b490UL,a+0x5e200,16);memcpy((void*)0x1020042f0UL,a+0x5e210,16);
  ((void(*)(void*,void*,void*,void*,void*,uint32_t,uint32_t))0x10027a7c0UL)(a+0x4000,a+0x2000,0,u32(a+0x5f010)?a+0x1000:0,a+0x50000,u32(a+0x5f018),u32(a+0x5f01c));
  memset(a+0x5e000,0,0x200);wr(a,0x60000);wr(&calls,4);wr(trace,calls*96);
 }return 0;
}
