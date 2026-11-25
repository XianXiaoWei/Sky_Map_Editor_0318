#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>
static uint8_t *arena=(void*)0x470000000UL,config[1168],trace[65536];static uint32_t used;
static uint32_t word(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void rec(uint32_t tag){memcpy(trace+used,&tag,4);used+=4;}
static int contains(float*p,void*region){rec(1);memcpy(trace+used,p,12);used+=12;uint32_t slot=((uint8_t*)region-arena-0xf60)/0x110;memcpy(trace+used,&slot,4);used+=4;return p[0]>=0;}
static void batch(void*context,float*origins,float*direction,float distance,uint32_t count,uint8_t*options,void*result){
 (void)context;rec(2);memcpy(trace+used,&count,4);used+=4;memcpy(trace+used,direction,12);used+=12;memcpy(trace+used,&distance,4);used+=4;memcpy(trace+used,options,9);used+=9;memcpy(trace+used,options+16,16);used+=16;
 for(uint32_t i=0;i<count;i++){memcpy(trace+used,origins+i*4,12);used+=12;uint8_t*r=(uint8_t*)result+i*16;memcpy(r,config+20,4);memcpy(r+4,&i,4);pq(r+8,word(config+12)==1?0:(uintptr_t)(arena+0x510000));}
}
static void material(void*mesh,uint32_t tri,uint8_t*out,uint32_t*extra){(void)mesh;rec(3);memcpy(trace+used,&tri,4);used+=4;*out=config[16];*extra=0x1234;}
typedef float Vec4 __attribute__((vector_size(16)));
static void normal(Vec4*out,void*mesh,uint32_t tri){(void)mesh;rec(4);memcpy(trace+used,&tri,4);used+=4;memcpy(out,config+24,16);}
static void lighting(void*mesh,uint32_t tri,void*out,void*a,void*b){(void)mesh;rec(5);memcpy(trace+used,&tri,4);used+=4;memcpy(out,config+40,8);memset(a,0,16);memset(b,0,16);}
static void zero(void*p,size_t n){memset(p,0,n);}
static void crash(int sig,siginfo_t*info,void*context){ucontext_t*c=context;fprintf(stderr,"signal %d address %p instruction %llx trace %u\n",sig,info->si_addr,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],used);exit(10);}
int main(int argc,char**argv){
 struct sigaction action={0};action.sa_sigaction=crash;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,0);
 if(argc!=3)return 2;FILE*f=fopen(argv[1],"rb"),*input=fopen(argv[2],"rb");if(!f||!input)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x600000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 pq((void*)0x100c0d8d8UL,(uintptr_t)(arena+0x511800));
 hook(0x100aa24aaUL,zero);hook(0x10078ccc0UL,contains);hook(0x100776d20UL,batch);hook(0x100776640UL,material);hook(0x100776100UL,normal);hook(0x1007766d0UL,lighting);*(uint8_t*)0x100d2bc68UL=77;
 uint32_t cases;if(fread(&cases,4,1,input)!=1)return 7;
 for(uint32_t c=0;c<cases;c++){
  if(fread(config,1168,1,input)!=1)return 8;memset(arena,0,0x600000);used=0;
  memcpy(arena+0xed0,config+80,1088);memcpy(arena+0x500000,config+64,16);memcpy(arena+0x500020,config+48,16);
  pq(arena+0x510000+0x1d0,word(config+12)==2?0:(uintptr_t)(arena+0x510800));arena[0x510808]=word(config+12)==3?1:0;
  uint32_t count=word(config);for(uint32_t i=0;i<count;i++){pq(arena+0x500100+i*8,(uintptr_t)(arena+0x520000+i*32));memset(arena+0x520000+i*32,0xaa,32);}memset(arena+0x501000,0xbb,count);
  asm volatile("vzeroall":::"memory");
  ((void(*)(void*,void*,void*,void*,void*,void*,uint32_t,uint32_t,uint32_t))0x100350c40UL)(arena,arena+0x511000,arena+0x500000,arena+0x500020,arena+0x500100,arena+0x501000,count,word(config+4),word(config+8));
  fwrite(&used,4,1,stdout);fwrite(trace,1,used,stdout);fwrite(arena+0x501000,1,count,stdout);fwrite(arena+0x520000,32,count,stdout);
 }
 fclose(input);return 0;
}
