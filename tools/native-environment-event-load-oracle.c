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
static uint64_t guard=0x1234;static uint8_t *a=(void*)0x3c0000000UL;static uint64_t traces[512][12];static uint32_t calls,line,severity,polls;static jmp_buf escape;static void *ref;
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(void*p){uint64_t n;memcpy(&n,p,8);return n;}static void p32(void*p,uint32_t n){memcpy(p,&n,4);}static void p64(void*p,uint64_t n){memcpy(p,&n,8);}static uint32_t bits(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void fault(int sig,siginfo_t*info,void*ctx){ucontext_t*c=ctx;fprintf(stderr,"signal %d pc=%llx address=%llx\n",sig,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],(unsigned long long)(uintptr_t)info->si_addr);exit(100);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint64_t*logcall(uint32_t kind){if(calls==512)exit(12);uint64_t*t=traces[calls++];t[0]=kind;return t;}
static void mutate(void){if(calls!=u(a+0xf01c))return;uint32_t kind=u(a+0xf020);
 if(kind==1)p64(a+0x62a8,(uintptr_t)a+0x8100);
 if(kind==2){p64(a+0x1040,(uintptr_t)a+0xb000);p32(a+0x1048,0x3f000000);p32(a+0x104c,3);p32(a+0x1050,0x40000000);p32(a+0x1054,0x40400000);p32(a+0x1058,0x40800000);}
 if(kind==3)p32(a+0x185110,1);
 if(kind==4)p32(a+0x185110,4);
 if(kind==5)a[0x600d]=0xff;
 if(kind==7){p64(a+0xb008,(uintptr_t)a+0xb200);p32(a+0xb010,1);}
 if(kind==8)p32(a+0x1038,0x40800000);
 if(kind==9)p64(a+0x62c8,(uintptr_t)a+0x8100);
 if(kind==6){p64(a+0x1018,(uintptr_t)a+0x9100);a[0x1022]=1;}
}
static void refcreate(void*p){ref=p;memset(p,0,24);logcall(1);mutate();}
static void refdestroy(void*p){(void)p;logcall(2);mutate();}
static void*type(void){logcall(3);mutate();return a+0xb800;}
static void*lookup(void*m,void*t,void*n){uint64_t*r=logcall(4);r[1]=(uintptr_t)m;r[2]=(uintptr_t)t;r[3]=(uintptr_t)n;mutate();return u(a+0xf004)?a+0xb900:NULL;}
static void observe(void*p,void*r){logcall(5)[1]=(uintptr_t)p;p64(r,u(a+0xf008)?(uintptr_t)a+0xa000:0);mutate();}
static uint8_t camera(void*p){logcall(6)[1]=(uintptr_t)p;mutate();return u(a+0xf010);}
static void regdefault(void*e,void*v){uint64_t*r=logcall(7);r[1]=(uintptr_t)e;r[2]=(uintptr_t)v;mutate();}
static void*regclump(void*e,void*v,void*c,uint32_t layer,float falloff,float fi,float fo,float d){uint64_t*r=logcall(8);r[1]=(uintptr_t)e;r[2]=(uintptr_t)v;r[3]=(uintptr_t)c;r[4]=bits(falloff);r[5]=layer;r[6]=bits(fi);r[7]=bits(fo);r[8]=bits(d);mutate();return a+0xc000+calls*16;}
static void poll(void*m){logcall(9)[1]=(uintptr_t)m;polls++;if(polls>=u(a+0xf018)){a[0xc908]=1;a[0xca08]=1;}if(u(a+0xf024)==1)p64(a+0xa010,(uintptr_t)a+0xc900);if(u(a+0xf024)==2)p64(a+0xa010,0);if(u(a+0xf024)==3)p64(ref,(uintptr_t)a+0xa100);mutate();}
static void sleep10(uint32_t ms){logcall(10)[1]=ms;mutate();}
static void create(void*m,void*b,void*r,uint32_t f,void*n){uint64_t*t=logcall(11);t[1]=(uintptr_t)m;t[2]=(uintptr_t)b;t[3]=(uintptr_t)r;t[4]=f;t[5]=(uintptr_t)n;p64((uint8_t*)m+0x228,(uintptr_t)a+0xe000);mutate();}
static void update(void*m,void*r,float dt){uint64_t*t=logcall(12);t[1]=(uintptr_t)m;t[2]=(uintptr_t)r;t[3]=bits(dt);mutate();}
static void load(void*m,void*b,void*r,uint32_t f,void*n){uint64_t*t=logcall(13);t[1]=(uintptr_t)m;t[2]=(uintptr_t)b;t[3]=(uintptr_t)r;t[4]=f;t[5]=(uintptr_t)n;mutate();}
static void*avatar(void*m){logcall(14)[1]=(uintptr_t)m;mutate();return a+0xb500;}
static void*base_meta(void){logcall(15);mutate();return a+0xf400;}
static void cast_region(void*meta,void*out,void*in,void*base){(void)meta;(void)base;uint64_t p=q(in);logcall(16)[1]=p;p64(out,p);mutate();}
static void get_transform(void*out,void*p){logcall(17)[1]=(uintptr_t)p;memcpy(out,(uint8_t*)p+16,64);mutate();}
static void get_obb(void*out,void*p){logcall(18)[1]=(uintptr_t)p;memcpy(out,(uint8_t*)p+80,64);mutate();}
static void*existing_emitter(void*p){logcall(20)[1]=(uintptr_t)p;return a+0xbd00;}
static float native_sinf(float x){float out=sinf(x);uint64_t*r=logcall(21);r[1]=bits(x);r[2]=bits(out);return out;}
static void camera_boundary(void*out,void*p){(void)out;logcall(19)[1]=(uintptr_t)p;longjmp(escape,1);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x190000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 struct sigaction sa={0};sa.sa_sigaction=fault;sa.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&sa,NULL);sigaction(SIGILL,&sa,NULL);
 hook(0x100316270UL,existing_emitter);hook(0x100aa2bcaUL,native_sinf);hook(0x10076be90UL,camera_boundary);hook(0x1007c2530UL,refcreate);hook(0x1007c2570UL,refdestroy);hook(0x10040b090UL,type);hook(0x1004559d0UL,type);hook(0x1007c4360UL,lookup);hook(0x1007c2310UL,observe);hook(0x100746a50UL,camera);hook(0x10031b2e0UL,regdefault);hook(0x10031b3c0UL,regclump);hook(0x1007c3010UL,poll);hook(0x1007e8570UL,sleep10);hook(0x100401040UL,create);hook(0x100402060UL,update);hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x1000fc260UL,avatar);hook(0x1007abc10UL,base_meta);hook(0x102300000UL,cast_region);hook(0x102300020UL,get_transform);hook(0x102300040UL,get_obb);p64((void*)0x102300218UL,0);p64((void*)0x102300240UL,0x102300000UL);p64((void*)0x102300118UL,0x102300020UL);p64((void*)0x102300120UL,0x102300040UL);p64((void*)0x1020045b8UL,(uintptr_t)a+0xf400);
 p64((void*)0x100c0d8d8UL,(uintptr_t)&guard);uint8_t savedload[14];memcpy(savedload,(void*)0x100400ed0UL,14);uint32_t n;rd(&n,4);wr(&n,4);while(n--){memset(a,0xa5,0x190000);rd(a,0x10000);rd(a+0x185110,4);calls=line=severity=polls=0;memset(traces,0,sizeof traces);
  if(!setjmp(escape)){switch(u(a+0xf000)){case 0:((void(*)(void*,void*))0x10031d710UL)(a+0x1000,a+0x6000);break;case 1:((void(*)(void*,void*))0x10031ded0UL)(a+0x1000,a+0x6000);break;case 2:memcpy((void*)0x100400ed0UL,savedload,14);((void(*)(void*,void*,void*,uint32_t,void*))0x100400ed0UL)(a+0x1000,a+0x8000,a+0xb000,u(a+0xf014),a+0xd000);break;case 3:hook(0x100400ed0UL,load);((void(*)(void*,void*,void*,void*,void*,void*))0x100400180UL)(a,a+0x8000,a+0x6000,a+0xb000,NULL,a+0xd000);break;case 4:((void(*)(void*))0x100355a70UL)(a);break;case 5:((void(*)(void*,void*))0x100593ba0UL)(a+0x1000,a+0x6000);break;case 6:((void(*)(void*,void*))0x10056b170UL)(a+0x1000,a+0x6000);break;case 7:((void(*)(void*,void*))0x1004d8290UL)(a+0x1000,a+0x6000);break;case 9:((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,void*))0x100564fa0UL)(a+0xe000,a+0xb000,a+0xb400,a+0xb600,a+0xb800,a+0xb900,a+0xba00,a+0xbb00,a+0xbc00);break;case 8:a[0x1100]=((uint8_t(*)(void*,void*))0x10078ccc0UL)(a+0xb100,a+0xc000);break;default:return 7;}}
  uint32_t h[]={line,severity,calls};wr(h,12);wr(traces,calls*96);wr(a,0x10000);wr(a+0x185110,4);
 }return 0;}
