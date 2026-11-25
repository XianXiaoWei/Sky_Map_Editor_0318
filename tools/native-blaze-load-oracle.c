#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>
static uint8_t*a=(void*)0x440000000UL;static uint32_t rng,calls,models;static uint8_t trace[128][256];
static void fault(int signal,siginfo_t*info,void*context){(void)signal;ucontext_t*u=context;fprintf(stderr,"Blaze oracle fault at %p, RIP %llx, calls %u\n",info->si_addr,(unsigned long long)u->uc_mcontext.gregs[REG_RIP],calls);exit(20);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){if(calls>=128)exit(12);uint8_t*p=trace[calls++];memset(p,0,256);memcpy(p,&k,8);memcpy(p+8,&x,8);memcpy(p+16,&y,8);memcpy(p+24,&z,8);return p;}
static int index_of(char*text,char**names,int n){for(int i=0;i<n;i++)if(!strcmp(text,names[i]))return i;fprintf(stderr,"unknown name %s\n",text);exit(13);}
static char*names[]={"u_alphaFade","u_scatter","u_texture","u_uvOffset","u_uvScale","u_uvScroll","u_selfLit","u_fadingStartEnd","u_color","u_diffuseColor"};
static char*textures[]={"White","UIFootPrint","OrangeL2"};
static uint32_t random_value(void){rng=rng*1664525+1013904223;uint32_t n=rng>>1;record(1,n,0,0);return n;}
static void*clone(void*owner,void*source){record(7,(uintptr_t)owner,(uintptr_t)source,0);return a+0x4800;}
static void*obb(void*out,void*p){record(8,(uintptr_t)p,0,0);memcpy(out,a+0x8000,64);return out;}
static uint8_t has(void*p,uint32_t pass,char*name){if(pass)exit(14);record(9,(uintptr_t)p,index_of(name,names,10),0);return a[0xff04];}
static void scalar(void*p,uint32_t pass,char*name,float value){if(pass)exit(14);uint32_t bits;memcpy(&bits,&value,4);record(10,(uintptr_t)p,index_of(name,names,10),bits);}
static void vector_kind(void*p,uint32_t pass,char*name,void*data,uint32_t kind){if(pass)exit(14);uint8_t*out=record(11,(uintptr_t)p,index_of(name,names,10),kind);memcpy(out+32,data,16);}
static void color(void*p,uint32_t pass,char*name,void*data){vector_kind(p,pass,name,data,1);}
static void vector(void*p,uint32_t pass,char*name,void*data){vector_kind(p,pass,name,data,2);}
static void texture(void*p,uint32_t pass,char*name,void*texture,uint32_t sampler){if(pass||sampler)exit(14);record(12,(uintptr_t)p,index_of(name,names,10),(uintptr_t)texture);}
static void*create(void*owner,char*name,char*shader,void*matrix,void*options){char*meshes[]={"CandleAncestor","Plane","LightShaft_02"},*shaders[]={"Candle","UnlitAlphaColor","UnlitAlphaFading"};uint8_t*out=record(13,(uintptr_t)owner,index_of(name,meshes,3),index_of(shader,shaders,3));memcpy(out+32,matrix,64);int ranges[][2]={{0,15},{16,22},{24,33},{36,51},{52,56},{64,73},{76,90}};for(unsigned i=0;i<sizeof(ranges)/sizeof(ranges[0]);i++)memcpy(out+96+ranges[i][0],(uint8_t*)options+ranges[i][0],ranges[i][1]-ranges[i][0]);return a+0x4800+models++*0x400;}
static void ref_construct(void*p){memset(p,0,32);}
static void*type(void){return a+0x6000;}
static void*lookup(void*owner,void*type,char*name){if(type!=a+0x6000)exit(15);int i=index_of(name,textures,3);record(14,(uintptr_t)owner,i,0);return a[0xff08]&(i==2?2:1)?0:a+0x5800+i*0x100;}
static void observe(void*resource,void*ref){uintptr_t old;memcpy(&old,ref,8);record(15,(uintptr_t)resource,old,0);uintptr_t handle=(uintptr_t)a+0x5000+((uint8_t*)resource-a-0x5800);memcpy(ref,&handle,8);}
static void missing(void*owner,void*type,char*name){if(type!=a+0x6100)exit(16);record(16,(uintptr_t)owner,index_of(name,textures,3),0);}
static void destroy(void*ref){uintptr_t handle;memcpy(&handle,ref,8);record(17,handle,0,0);}
static void*flame(void*owner,uint32_t guid){if(guid)exit(17);record(18,(uintptr_t)owner,0,0);return a+0x7000;}
static void load_flame(void*p,void*resource,void*sound){record(19,(uintptr_t)p,(uintptr_t)resource,(uintptr_t)sound);}
int main(int argc,char**argv){struct sigaction action={0};action.sa_sigaction=fault;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,0);if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2b22UL,random_value);hook(0x10046ccc0UL,clone);hook(0x100466620UL,has);hook(0x1004667c0UL,scalar);hook(0x100466a50UL,color);hook(0x100466910UL,vector);hook(0x100466af0UL,vector);hook(0x100466ee0UL,texture);hook(0x10046c700UL,create);hook(0x1007c2530UL,ref_construct);hook(0x10079ac90UL,type);hook(0x1007c4360UL,lookup);hook(0x1007c2310UL,observe);hook(0x1007c4640UL,missing);hook(0x1007c2570UL,destroy);hook(0x10033f470UL,flame);hook(0x10033afa0UL,load_flame);
 uint64_t guard=0;void*guardPointer=&guard;memcpy((void*)0x100c0d8d8UL,&guardPointer,8);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(&rng,4);rd(a,0x10000);calls=models=0;uintptr_t vptr=(uintptr_t)(a+0x6200);memcpy(a+0x4200,&vptr,8);void*fn=obb;memcpy(a+0x6218,&fn,8);uintptr_t textureType=(uintptr_t)(a+0x6100);memcpy(a+0x6008,&textureType,8);
 memcpy((void*)0x100d23f9cUL,a+0xff00,4);memcpy((void*)0x102004280UL,a+0x9000,16);memcpy((void*)0x102004290UL,a+0x9010,16);memcpy((void*)0x10203f610UL,a+0x9020,16);memcpy((void*)0x10203f650UL,a+0x9030,16);
 ((void(*)(void*,void*))0x1001ae8e0UL)(a+0x1000,a+0x3000);
 memset(a+0x4200,0,8);memset(a+0x6008,0,8);memset(a+0x6218,0,8);wr(a,0x10000);wr(&calls,4);wr(trace,calls*256);
 }return 0;}
