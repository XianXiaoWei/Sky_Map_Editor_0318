#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls,rng;static uint64_t trace[32][4];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){trace[calls][0]=k;trace[calls][1]=x;trace[calls][2]=y;trace[calls++][3]=z;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void motion(void*p,void*x,void*y,void*z){record(1,(uintptr_t)p,(uintptr_t)x,(uintptr_t)y);record(2,(uintptr_t)z,0,0);}
static uint32_t random_value(void){rng=rng*1664525+1013904223;uint32_t v=rng>>1;record(3,v,0,0);return v;}
static void*metadata(void){return a+0x7000;}
static void cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;void*p;memcpy(&p,input,8);record(4,(uintptr_t)p,0,0);if(a[0x7f04])p=0;memcpy(out,&p,8);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;hook(0x1007e5f70UL,assertion);hook(0x10062e5b0UL,motion);hook(0x100aa2b22UL,random_value);hook(0x1007abc10UL,metadata);hook(0x10043ccc0UL,metadata);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode,seed;rd(&mode,4);rd(&seed,4);rd(a,0x8000);rng=seed;line=severity=calls=0;uint64_t vptr=(uintptr_t)(a+0x7100);memcpy(a+0x7000,&vptr,8);void*fn=cast;memcpy(a+0x7140,&fn,8);
 if(!setjmp(escape)){if(mode==0)((void(*)(void*,void*,void*))0x10019ff50UL)(a+0x1000,a+0x2000,a+0x3000);else ((void(*)(void*,void*,uint32_t,void*))0x1002585e0UL)(a+0x1000,a+0x2000,seed,a+0x3000);}
 memset(a+0x7000,0,0x200);wr(&line,4);wr(&severity,4);wr(a,0x8000);wr(&calls,4);wr(trace,calls*32);
 }return 0;}
