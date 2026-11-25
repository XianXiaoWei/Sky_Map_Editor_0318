#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <signal.h>
#include <ucontext.h>
#include <sys/mman.h>
#include <math.h>
static uint64_t guard=0x1234;static uint8_t *a=(void*)0x430000000UL;static uint64_t trace[1024][3],calls;static uint32_t line,severity,records;static jmp_buf escape;
static uint8_t original_route[64];
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(void*p){uint64_t n;memcpy(&n,p,8);return n;}static void p32(void*p,uint32_t n){memcpy(p,&n,4);}static void p64(void*p,uint64_t n){memcpy(p,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void fault(int sig,siginfo_t*i,void*v){ucontext_t*c=v;fprintf(stderr,"signal %d pc=%llx addr=%llx\n",sig,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],(unsigned long long)(uintptr_t)i->si_addr);exit(100);}
static void logcall(uint64_t kind,uint64_t x,uint64_t y){if(calls>=1024)exit(12);trace[calls][0]=kind;trace[calls][1]=x;trace[calls++][2]=y;
 if(calls==u(a+0xff08)){switch(u(a+0xff0c)){case 1:p64(a+0x7040,(uintptr_t)a+0x9100);break;case 2:p32(a+0x7210,1);break;case 3:p64(a+0x7208,(uintptr_t)a+0x7380);break;case 4:p32(a+0xc038,177);break;}}
}
static void bootstrap(void){logcall(1,0,0);}static void*metadata(void){logcall(2,0,0);return a+0xc000;}
static void cast(void*meta,void*out,void*in,void*base){(void)meta;(void)base;uint64_t pointer=q(in);logcall(3,pointer,0);p64(out,pointer==q(a+0xff10)?0:pointer);}
static void release(void*heap,void*p){logcall(4,(uintptr_t)heap,(uintptr_t)p);}
static void*allocate(void*heap,uint64_t size,void*tag,uint32_t alignment){(void)tag;logcall(5,(uintptr_t)heap,(size<<32)|alignment);return a+0xb000;}
static void zero(void*p,size_t n){memset(p,0,n);}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static float native_logf(float x){float out=logf(x);logcall(7,fb(x),fb(out));return out;}
static float native_expf(float x){float out=expf(x);logcall(8,fb(x),fb(out));return out;}
static void get_transform(void*out,void*object){logcall(6,(uintptr_t)object,0);memcpy(out,(uint8_t*)object+16,64);}
static uint8_t get_enabled(void*object){uint8_t on=((uint8_t*)object)[80];logcall(10,(uintptr_t)object,on);return on;}
static void emit(void*owner,uint32_t type,void*position,void*tint,float maxSize,float radius,float intensity,float sharpness){(void)owner;uint8_t*p=a+0xf400+records*64;p32(p,type);p32(p+4,fb(maxSize));p32(p+8,fb(radius));p32(p+12,fb(intensity));p32(p+16,fb(sharpness));memcpy(p+32,position,16);memcpy(p+48,tint,16);logcall(9,type,records++);}
static void boundary(void){longjmp(escape,1);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static float read_float(void*p){float x;memcpy(&x,p,4);return x;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,65536,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 struct sigaction sa={0};sa.sa_sigaction=fault;sa.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&sa,NULL);sigaction(SIGILL,&sa,NULL);
 memcpy(original_route,(void*)0x1004d3940UL,64);hook(0x100aa2858UL,native_logf);hook(0x100aa2708UL,native_expf);hook(0x1004d1e40UL,get_transform);hook(0x1004d2050UL,get_enabled);hook(0x1004d3940UL,emit);hook(0x10005aa80UL,boundary);hook(0x100011c10UL,bootstrap);hook(0x1007abc10UL,metadata);hook(0x1002d9a80UL,metadata);hook(0x102300000UL,cast);hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x100795a70UL,release);hook(0x100795530UL,allocate);hook(0x100aa24aaUL,zero);
 p64((void*)0x100c0d8d8UL,(uintptr_t)&guard);p64((void*)0x10201a728UL,(uintptr_t)a+0xc000);p64((void*)0x10201c888UL,(uintptr_t)a+0xc000);p64((void*)0x102300040UL,0x102300000UL);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(a,65536);calls=line=severity=records=0;volatile uint64_t result=0;memset(trace,0,sizeof trace);p64(a+0xc000,0x102300000UL);memcpy((void*)0x10203f660UL,a+0xfd00,16);
  if(u(a+0xff00)==16)memcpy((void*)0x1004d3940UL,original_route,64);else hook(0x1004d3940UL,emit);
  if(!setjmp(escape)){switch(u(a+0xff00)){
   case 0:((void(*)(void*))0x1005408d0UL)(a);break;
   case 1:for(uint32_t i=0;i<u(a+0xff04);i++)result=(uintptr_t)((void*(*)(void*))0x100540a20UL)(a);break;
   case 2:((void(*)(void*,void*))0x100540a90UL)(a,(void*)q(a+0xff18));break;
   case 3:((void(*)(void*))0x1005409b0UL)(a);break;
   case 4:result=((uint32_t(*)(void*,void*,uint64_t))0x100540c10UL)(a,a+0x6800,q(a+0xff20));break;
   case 5:((void(*)(void*))0x10052b1a0UL)(a+0x7000);break;
   case 6:((void(*)(void*))0x10052b280UL)(a+0x7000);break;
   case 7:result=(uintptr_t)((void*(*)(void*,void*))0x1005626b0UL)(a+0xc000,a+0x9000);break;
   case 8:((void(*)(void*,uint32_t))0x10055b4a0UL)(a+0x9000,u(a+0xff04));break;
   case 9:((void(*)(void*))0x10005aa10UL)(a+0x9000);break;
   case 10:{float d;memcpy(&d,a+0xfe04,4);float out=((float(*)(void*,void*,void*,float*,float))0x100540ac0UL)(a+0x9000,a+0xf000,a+0xf010,(float*)(a+0xfe08),d);uint32_t bits;memcpy(&bits,&out,4);result=bits;break;}
   case 11:((void(*)(void*,void*,void*))0x1002ce410UL)(a+0x7000,a+0xf800,a+0xe000);break;
   case 12:((void(*)(void*,void*,void*))0x1002ce460UL)(a+0x7000,a+0xf800,a+0xe000);break;
   case 13:((void(*)(void*,void*))0x1002ce7b0UL)(a+0x7000,a+0xf800);break;
   case 14:((void(*)(void*))0x1002ce490UL)(a+0x7000);break;
   case 15:result=((uint8_t(*)(void*,void*,void*,float,float,float))0x100416140UL)(a,a+0xf000,a+0xf010,read_float(a+0xfe04),read_float(a+0xfe08),read_float(a+0xfe0c));break;
   case 16:((void(*)(void*,uint32_t,void*,void*,float,float,float,float))0x1004d3940UL)(a+0xf800,u(a+0xfe10),a+0xf010,a+0xf000,1,read_float(a+0xfe04),read_float(a+0xfe08),read_float(a+0xfe0c));break;
   case 17:((void(*)(void*,void*))0x10047b370UL)(a+0x9000,a+0xf000);break;
   case 18:result=(uintptr_t)((void*(*)(void*,void*))0x10047b3a0UL)(a+0xf000,a+0x9000);break;
   default:return 7;
  }}
  uint32_t h[]={line,severity,(uint32_t)calls};uint64_t returned=result;wr(h,12);wr(&returned,8);wr(trace,calls*24);wr(a,65536);
 }return 0;}
