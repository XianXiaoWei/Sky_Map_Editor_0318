#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static uint32_t calls,sampled;static uint8_t trace[16][64];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y){if(calls>=16)exit(12);uint8_t*p=trace[calls++];memset(p,0,64);memcpy(p,&k,8);memcpy(p+8,&x,8);memcpy(p+16,&y,8);return p;}
static float nearest(void*rail,void*position,void*out){memset(out,0,16);memcpy(record(1,(uintptr_t)rail,0)+24,position,16);float n;memcpy(&n,a+0x7f00,4);return n;}
static float remainder_value(float x,float y){uint32_t bx,by;memcpy(&bx,&x,4);memcpy(&by,&y,4);record(2,bx,by);return fmodf(x,y);}
static void*sample(void*out,void*rail,float time){uint32_t bits;memcpy(&bits,&time,4);record(3,(uintptr_t)rail,bits);memcpy(out,a+0x7000+sampled++*16,16);return out;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;hook(0x10055d820UL,nearest);hook(0x100aa2744UL,remainder_value);hook(0x10055e420UL,sample);uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t cooldown;rd(&cooldown,4);rd(a,0x8000);calls=sampled=0;((void(*)(void*,uint32_t))0x10026d0f0UL)(a+0x1000,cooldown);wr(a,0x8000);wr(&calls,4);wr(trace,calls*64);}return 0;}
