#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint8_t trace[256][160];static uint32_t calls,rng,line,severity,lookup,obbCalls;static jmp_buf escape;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){if(calls>=256)exit(12);uint8_t*t=trace[calls++];memset(t,0,160);memcpy(t,&k,8);memcpy(t+8,&x,8);memcpy(t+16,&y,8);memcpy(t+24,&z,8);return t;}
static uint32_t fb(float n){uint32_t b;memcpy(&b,&n,4);return b;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void zero(void*p,size_t n){memset(p,0,n);}
static uint32_t random_value(void){rng=rng*1664525+1013904223;uint32_t n=rng>>1;record(3,n,0,0);return n;}
static uint32_t find_sequence(char*name,uint32_t flags,char*file){uint32_t i=lookup++;uint8_t*t=record(1,i,flags,0);if(strlen(name)>=64||strlen(file)>=64)exit(13);strcpy((char*)t+32,name);strcpy((char*)t+96,file);
 if(a[0xfe03]&&i==0){uint64_t p=(uintptr_t)(a+0x4400);memcpy(a+0x4008,&p,8);}return a[0xfe02]?0xffffffff:i+10;}
static uint32_t players(void*owner,uint32_t*out){uint32_t n=a[0xfe04];record(2,(uintptr_t)owner,n,0);for(uint32_t i=0;i<n;i++)out[i]=100+i*7;return n;}
static void*marker(void*owner,uint32_t mode){record(4,(uintptr_t)owner,mode,0);return a+0x6200;}
static float angle(float y,float x){float n=atan2f(y,x);record(5,fb(y),fb(x),fb(n));return n;}
static float arc(float x){float n=asinf(x);record(6,fb(x),fb(n),0);return n;}
static void*clone(void*owner,void*source){record(7,(uintptr_t)owner,(uintptr_t)source,0);return a[0xfe05]?0:a+0x6000;}
static void*obb(void*out,void*mesh){uint8_t*t=record(8,(uintptr_t)mesh,obbCalls++,0);memcpy(out,a+0x6800,64);memcpy(t+32,out,64);if(a[0xfe06]&&obbCalls==1){uint64_t p=(uintptr_t)(a+0x4000);memcpy(a+0x1080,&p,8);}return out;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x100aa24aaUL,zero);hook(0x100aa2b22UL,random_value);hook(0x1000962f0UL,find_sequence);hook(0x1004a9e50UL,players);hook(0x10043d6a0UL,marker);hook(0x100aa25a0UL,angle);hook(0x100aa2588UL,arc);hook(0x10046ccc0UL,clone);hook(0x100aa2be2UL,sprintf);
 uintptr_t guard=(uintptr_t)(a+0xff00);memcpy((void*)0x100c0d8d8UL,&guard,8);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(&rng,4);rd(a,0x10000);calls=line=severity=lookup=obbCalls=0;uintptr_t vptr=(uintptr_t)(a+0x7100);memcpy(a+0x4300,&vptr,8);memcpy(a+0x4400,&vptr,8);void*fn=obb;memcpy(a+0x7118,&fn,8);uint32_t markerId=0xabcdef01;memcpy((void*)0x100d23fe8UL,&markerId,4);
 if(!setjmp(escape))for(uint32_t i=0;i<a[0xfe07];i++)((void(*)(void*,void*,void*))0x1001cfaf0UL)(a+0x1000,0,a+0x3000);
 memset(a+0x4300,0,8);memset(a+0x4400,0,8);memset(a+0x7100,0,64);wr(&line,4);wr(&severity,4);wr(a,0x10000);wr(&calls,4);wr(trace,calls*160);
 }return 0;}
