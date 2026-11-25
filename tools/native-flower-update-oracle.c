#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>
static uint8_t*arena=(void*)0x590000000UL,config[1024],trace[128][64];static uint32_t calls;static size_t cursor;
static uint32_t word(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void put(void*p,uint32_t n){memcpy(p,&n,4);}static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static uint8_t*rec(uint32_t tag){if(calls>=128)exit(12);uint8_t*p=trace[calls++];memset(p,0,64);put(p,tag);return p;}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void uniform(void*render,char*name,float value){uint8_t*r=rec(1);pq(r+8,(uintptr_t)render);memcpy(r+16,name,strlen(name)+1);memcpy(r+48,&value,4);}
static void position(void*out,void*camera){(void)camera;rec(2);memcpy(out,config+52,16);}static void forward(void*out,void*camera){(void)camera;rec(3);memcpy(out,config+68,16);}
static void*mapped(void*data){uint8_t*r=rec(4);pq(r+8,(uintptr_t)data);return arena+0x500000;}
static void visibility(void*owner,void*spheres,uint32_t count,void*results,uint32_t mode){uint8_t*r=rec(5);pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)spheres);put(r+24,count);pq(r+32,(uintptr_t)results);put(r+40,mode);for(uint32_t i=0;i<count;i++)put((uint8_t*)results+i*4,(word(config+12)>>i)&1);}
static void*allocator(void){rec(6);return arena+0x7f2000;}
static void*allocate(void*owner,uint64_t n,void*heap,uint32_t align){uint8_t*r=rec(7);pq(r+8,(uintptr_t)owner);pq(r+16,n);pq(r+24,(uintptr_t)heap);put(r+32,align);cursor=(cursor+align-1)&~(size_t)(align-1);void*p=arena+cursor;cursor+=n+32;return p;}
static void release(void*owner,void*p){uint8_t*r=rec(8);pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)p);}
static void generate(void*barn,void*context,void*cluster,void*sphere,void*points,uint8_t*success,uint32_t n,uint32_t seed,uint32_t instant){(void)barn;(void)context;uint8_t*r=rec(9);pq(r+8,(uintptr_t)cluster);pq(r+16,(uintptr_t)sphere);pq(r+24,(uintptr_t)points);pq(r+32,(uintptr_t)success);put(r+40,n);put(r+44,seed);put(r+48,instant);for(uint32_t i=0;i<n;i++){success[i]=config[944]?i%2:1;uint64_t p;memcpy(&p,(uint8_t*)points+i*8,8);uint8_t*b=(void*)(uintptr_t)p;memset(b,0x88,32);put(b,seed+i);b[19]=instant?255:0;}}
static void statistics(void*barn,void*camera,void*stats,uint32_t extra,uint32_t base,uint32_t total,uint32_t generated){uint8_t*r=rec(10);pq(r+8,(uintptr_t)barn);pq(r+16,(uintptr_t)camera);pq(r+24,(uintptr_t)stats);put(r+32,extra);put(r+36,base);put(r+40,total);put(r+44,generated);}
static void crash(int sig,siginfo_t*info,void*context){ucontext_t*c=context;fprintf(stderr,"signal %d address %p instruction %llx calls %u\n",sig,info->si_addr,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],calls);exit(10);}
int main(int argc,char**argv){
 if(argc!=3)return 2;struct sigaction action={0};action.sa_sigaction=crash;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,0);FILE*f=fopen(argv[1],"rb"),*input=fopen(argv[2],"rb");if(!f||!input)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(arena,0xa00000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 pq((void*)0x100c0d8d8UL,(uintptr_t)(arena+0x7f0000));pq((void*)0x102048b50UL,(uintptr_t)(arena+0x7f1000));
 hook(0x1007be530UL,uniform);hook(0x10076be90UL,position);hook(0x10076bef0UL,forward);hook(0x100795060UL,mapped);hook(0x100720dd0UL,visibility);hook(0x1007c6c20UL,allocator);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x100350c40UL,generate);hook(0x100351720UL,statistics);
 uint32_t cases;if(fread(&cases,4,1,input)!=1)return 7;
 for(uint32_t c=0;c<cases;c++){
  if(fread(config,1024,1,input)!=1)return 8;memset(arena,0,0xa00000);calls=0;cursor=0x800000;*(uint8_t*)0x100cb0120UL=config[4];*(uint8_t*)0x101df6a68UL=config[8];*(uint8_t*)0x100d2bc68UL=config[936];float one=1;memcpy((void*)0x100cb0128UL,&one,4);memcpy((void*)0x100cb012cUL,&one,4);
  arena[0x988]=arena[0xec8]=1;put(arena+0x110,32);put(arena+0x160,2);put(arena+0x95c,17);put(arena+0xe9c,17);put(arena+0x35dd0,word(config));memcpy(arena+0x35dd4,config+16,4);arena[0x455de0]=config[120];
  for(uint32_t i=0;i<word(config);i++){uint8_t*p=arena+0x21dd0+i*16;if(i==0){memcpy(p,config+32,4);memcpy(arena+0x11dd0,config+36,16);uint16_t n=word(config+28);memcpy(p+4,&n,2);n=word(config+24);memcpy(p+6,&n,2);n=word(config+20);memcpy(p+8,&n,2);}else{memcpy(p,config+84,4);memcpy(arena+0x11de0,config+100,16);uint16_t n=word(config+96);memcpy(p+4,&n,2);n=word(config+92);memcpy(p+6,&n,2);n=word(config+88);memcpy(p+8,&n,2);}}
  memcpy(arena+0x35dd8,config+136,512);memset(arena+0x435dd8,0xff,0x20000);memcpy(arena+0x335dd8,config+680,256);memcpy(arena+0x435dd8,config+648,32);uint64_t head=0;for(uint32_t slot=word(config+124);slot-->word(config+128);){pq(arena+0x335dd8+slot*32,head);head=(uintptr_t)(arena+0x335dd8+slot*32);}pq(arena+0x455dd8,head);
  ((void(*)(void*,void*,void*,void*,void*))0x10034e530UL)(arena,arena+0x7f3000,arena+0x7f4000,arena+0x7f5000,arena+0x7f6000);
  fwrite(&calls,4,1,stdout);fwrite(trace,64,calls,stdout);fwrite(arena+0x95c,4,1,stdout);fwrite(arena+0xe9c,4,1,stdout);fwrite(arena+0x21dd0,1,32,stdout);fwrite(arena+0x35dd8,1,512,stdout);fwrite(arena+0x335dd8,1,256,stdout);fwrite(arena+0x435dd8,1,32,stdout);fwrite(arena+0x455dd8,1,8,stdout);fwrite(arena+0x500000,32,word(arena+0x95c),stdout);
 }
 fclose(input);return 0;
}
