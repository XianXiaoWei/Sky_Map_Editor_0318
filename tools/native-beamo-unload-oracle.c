#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *barn=(void *)0x2d0000000UL;
static uint64_t log_entries[1024][3];static uint32_t used,mode,render_calls,collision_calls,normal_calls,decal_calls;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void u32(size_t at,uint32_t v){memcpy(barn+at,&v,4);}static void ptr(size_t at,uintptr_t v){memcpy(barn+at,&v,8);}
static void entry(uint64_t op,uintptr_t a,uintptr_t b){if(used>=1024)exit(12);log_entries[used][0]=op;log_entries[used][1]=a;log_entries[used++][2]=b;}
static void vertex(void *p){entry(1,(uintptr_t)p,0);barn[0x6c838]=0x51;if(mode==1){u32(0x6c830,2);u32(0x20018,4);u32(0x20010,3);u32(0x20014,2);}}
static void render(void *p){entry(2,(uintptr_t)p,0);*(uint8_t *)p=0x52;if(!render_calls++){if(mode==2)u32(0x6c830,1);if(mode==3)u32(0x6c830,3);}}
static void collision(void *owner,void *instance){entry(3,(uintptr_t)owner,(uintptr_t)instance);if(!collision_calls++&&(mode==2||mode==3)){u32(0x20018,mode==2?1:3);ptr(0x20020,(uintptr_t)barn+0xb0000);}}
static void normal(void *p){entry(4,(uintptr_t)p,0);*((uint8_t *)p+0x84)=0x54;if(!normal_calls++){if(mode==2)u32(0x20010,1);if(mode==3)u32(0x20010,3);}}
static void decal(void *p){entry(5,(uintptr_t)p,0);*((uint8_t *)p+0x74)=0x55;if(!decal_calls++){if(mode==2)u32(0x20014,1);if(mode==3)u32(0x20014,3);}}
static void *allocator(void){entry(6,0,0);if(mode)ptr(16+0x68,0x8877665544332211UL);return (void *)0x2e0000100UL;}
static void release(void *a,void *p){entry(7,(uintptr_t)a,(uintptr_t)p);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(barn,0x120000);
 hook(0x1007f5250UL,vertex);hook(0x1007f6b80UL,render);hook(0x100779200UL,collision);hook(0x1007e50d0UL,allocator);hook(0x1007e5db0UL,release);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t n;rd(&n,4);wr(&n,4);while(n--){
  uint32_t h[8];uint8_t raw[192];rd(h,32);rd(raw,192);memset(barn,h[7],0x120000);memset(log_entries,0,sizeof log_entries);used=render_calls=collision_calls=normal_calls=decal_calls=0;mode=h[5];
  void *vt[2]={(void *)normal,(void *)decal};
  for(uint32_t i=0;i<512;i++)ptr(16+i*192,(uintptr_t)vt);for(uint32_t i=0;i<256;i++)ptr(0x18010+i*128,(uintptr_t)(vt+1));
  u32(0x20010,h[1]);u32(0x20014,h[2]);u32(0x20018,h[3]);u32(0x6c830,h[4]);ptr(0x20020,(uintptr_t)barn+0x20040);ptr(0xa2088,0x2e0000000UL);
  for(uint32_t t=0;t<2;t++)for(uint32_t i=0;i<8;i++){size_t at=(t?0xb0000:0x20040)+i*384;barn[at+0xbc]=h[6]&(1U<<i)?(i&1?255:2):0;ptr(at+0xd0,0x2e0001000UL+t*0x10000+i*512);}
  if(h[0]){memcpy(barn+16,raw,192);((void (*)(void *))(h[0]==1?0x100198510UL:0x100198690UL))(barn+16);}else ((void (*)(void *))0x100194a90UL)(barn);
  /* Replace only the prepared stack vtables in the pool snapshot with stable
   * service identities. All object fields and other Barn bytes are compared. */
  for(uint32_t i=0;i<512;i++){uintptr_t p;memcpy(&p,barn+16+i*192,8);if(p==(uintptr_t)vt)ptr(16+i*192,0x2e0000200UL);}
  for(uint32_t i=0;i<256;i++){uintptr_t p;memcpy(&p,barn+0x18010+i*128,8);if(p==(uintptr_t)(vt+1))ptr(0x18010+i*128,0x2e0000300UL);}
  wr(&used,4);wr(log_entries,sizeof log_entries);wr(barn+12,4);wr(barn+16,0x20000);wr(barn+0x20010,32);wr(barn+0x20040,8*384);wr(barn+0xb0000,8*384);wr(barn+0x6c830,16);
  for(uint32_t i=0;i<16;i++)wr(barn+0x6cc70+i*0x3540,8);wr(barn+0xa2088,8);
 }
 return 0;
}
