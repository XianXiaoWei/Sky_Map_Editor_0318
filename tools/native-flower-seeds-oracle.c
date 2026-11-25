#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>
static uint8_t*arena=(void*)0x480000000UL,config[1168];static size_t cursor;
static uint32_t word(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static float scalar(void*p){float n;memcpy(&n,p,4);return n;}
static void put(void*p,uint32_t n){memcpy(p,&n,4);}static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void zero(void*p,size_t n){memset(p,0,n);}static void nothing(void){}
static void*allocator(void){return arena+0x7f1000;}static void*allocate(void*owner,uint64_t n,void*heap,uint32_t align){(void)owner;(void)heap;cursor=(cursor+align-1)&~(size_t)(align-1);void*p=arena+cursor;cursor+=n+32;if(cursor>=0x1000000)exit(11);return p;}
static void release(void*owner,void*p){(void)owner;(void)p;}
static void generate(void*barn,void*context,void*cluster,void*sphere,void*out,uint8_t*success,uint32_t n,uint32_t seed,uint32_t instant){(void)barn;(void)context;(void)cluster;(void)sphere;(void)out;(void)seed;(void)instant;memset(success,0,n);}
static void crash(int sig,siginfo_t*info,void*context){ucontext_t*c=context;fprintf(stderr,"signal %d address %p instruction %llx\n",sig,info->si_addr,(unsigned long long)c->uc_mcontext.gregs[REG_RIP]);exit(10);}
int main(int argc,char**argv){
 if(argc!=3)return 2;struct sigaction action={0};action.sa_sigaction=crash;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,0);
 FILE*f=fopen(argv[1],"rb"),*input=fopen(argv[2],"rb");if(!f||!input)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x1000000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;pq((void*)0x100c0d8d8UL,(uintptr_t)(arena+0x7f0000));
 hook(0x100aa24aaUL,zero);hook(0x100aa2900UL,memset);hook(0x100011c10UL,nothing);hook(0x10078c720UL,nothing);hook(0x1007c6c20UL,allocator);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x100350c40UL,generate);
 uint32_t cases;if(fread(&cases,4,1,input)!=1)return 7;
 for(uint32_t c=0;c<cases;c++){
  if(fread(config,1168,1,input)!=1)return 8;memset(arena,0,0x1000000);cursor=0x800000;memcpy(arena+0xed0,config+80,1088);put(arena+0x11dc0,config[64]);
  uint32_t n=word(config);uint8_t*record=arena+0x600000,*vertices=arena+0x604000,*indices=arena+0x602000;put(record+0x24,n*3);pq(record+0x28,(uintptr_t)vertices);pq(record+0x30,(uintptr_t)indices);
  float size=scalar(config+60),cx=scalar(config+48),cy=scalar(config+52),cz=scalar(config+56);
  for(uint32_t t=0;t<n;t++)for(uint32_t v=0;v<3;v++){
   uint32_t id=t*3+v;uint8_t*p=vertices+id*36;float xyz[3]={cx+(float)t*size+(v==2?size:0),cy,cz+(v==1?size:0)};memcpy(p,xyz,12);p[13]=word(config+12)==1?0xff:0x7f;p[16]=config[16];uint16_t idx=id;memcpy(indices+id*2,&idx,2);
  }
  ((void(*)(void*,uint32_t,void*,void*))0x10034fb10UL)(arena,1,record,arena+0x700000);
  uint32_t count=word(arena+0x35dd0);fwrite(&count,4,1,stdout);fwrite(arena+0x35dd4,4,1,stdout);fwrite(arena+0x455de0,1,1,stdout);fwrite(arena+0x11dd0,16,count,stdout);fwrite(arena+0x21dd0,16,count,stdout);
  for(uint32_t p=0;p<config[64];p++)fwrite(arena+0xf60+p*272,1,128,stdout);
 }
 fclose(input);return 0;
}
