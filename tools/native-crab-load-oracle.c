#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls,rng;static uint64_t trace[64][4];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){trace[calls][0]=k;trace[calls][1]=x;trace[calls][2]=y;trace[calls++][3]=z;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void motion(void*p,void*x,void*y,void*z){record(1,(uintptr_t)p,(uintptr_t)x,(uintptr_t)y);record(2,(uintptr_t)z,0,0);}
static uint32_t random_value(void){rng=rng*1664525+1013904223;uint32_t v=rng>>1;record(3,v,0,0);return v;}
static void*metadata(void){return a+0x7000;}
static void cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;uintptr_t p;memcpy(&p,input,8);record(4,p,0,0);p=a[0x7f04]?0:p-8;memcpy(out,&p,8);}
static uint32_t fb(float x){uint32_t b;memcpy(&b,&x,4);return b;}
static float angle(float x,float y){record(5,fb(x),fb(y),0);return .5f;}
static float pitch(float x){record(6,fb(x),0,0);return -.25f;}
static void*clone(void*owner,void*source){record(7,(uintptr_t)owner,(uintptr_t)source,0);return a[0x7f08]?0:a+0x5900;}
static void*obb(void*out,void*mesh){record(8,(uintptr_t)mesh,0,0);memcpy(out,a+0x4400,64);return out;}
static void play(void*p,char*name,uint32_t kind,float speed,float weight){if(strcmp(name,"CrabIdle"))exit(20);record(9,(uintptr_t)p,kind,((uint64_t)fb(speed)<<32)|fb(weight));}
static void*go_meta(void){return a+0x7000;}
static void*go_sit(void*owner,void*meta){(void)meta;record(10,(uintptr_t)owner,0,0);return a+0x4800;}
static void*clump(void*owner,uint32_t count){record(11,(uintptr_t)owner,count,0);return a+0x4a00;}
static void*teleport(void*owner,uint32_t unknown){record(12,(uintptr_t)owner,unknown,0);return a[0x7f0c]?0:a+0x4c00;}
static void load_sit(void*p){record(13,(uintptr_t)p,0,0);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x10062e5b0UL,motion);hook(0x100aa2b22UL,random_value);hook(0x1007abc10UL,metadata);hook(0x10043ccc0UL,metadata);hook(0x100aa25a0UL,angle);hook(0x100aa2588UL,pitch);hook(0x10046ccc0UL,clone);hook(0x1000967b0UL,play);hook(0x1004e6e60UL,go_meta);hook(0x100039f40UL,go_sit);hook(0x10022c000UL,clump);hook(0x10043d6a0UL,teleport);hook(0x10032e2f0UL,load_sit);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(&rng,4);rd(a,0x8000);line=severity=calls=0;uint64_t vptr=(uintptr_t)(a+0x7100);memcpy(a+0x7000,&vptr,8);memcpy(a+0x4200,&vptr,8);void*fn=cast;memcpy(a+0x7140,&fn,8);fn=obb;memcpy(a+0x7118,&fn,8);memcpy((void*)0x100d2b3b0UL,a+0x7f00,4);
 if(!setjmp(escape))((void(*)(void*,void*,void*))0x10025b5d0UL)(a+0x1000,0,a+0x3000);
 memset(a+0x7000,0,0x200);memset(a+0x4200,0,8);wr(&line,4);wr(&severity,4);wr(a,0x8000);wr(&calls,4);wr(trace,calls*32);
 }return 0;}
