#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <signal.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;
static sigjmp_buf escape;
static uint32_t status,line,severity,calls,meshes,actions,loops,samples;
static uint8_t trace[128][128];
static uint8_t seek_code[96];
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,a+at,4);return n;}
static void put32(size_t at,uint32_t n){memcpy(a+at,&n,4);}
static void ptr(size_t at,size_t target){uint64_t n=(uintptr_t)(a+target);memcpy(a+at,&n,8);}
static float f32(size_t at){float n;memcpy(&n,a+at,4);return n;}
static uint32_t fb(float n){uint32_t b;memcpy(&b,&n,4);return b;}
static uint32_t mutation(void){return u32(0x1f000);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z,uint64_t w){if(calls>=128)exit(12);uint8_t*p=trace[calls++];memset(p,0,128);memcpy(p,&k,8);memcpy(p+8,&x,8);memcpy(p+16,&y,8);memcpy(p+24,&z,8);memcpy(p+32,&w,8);return p;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(x,"m_model")||strcmp(f,"FishV2.cpp"))exit(13);status=1;line=l;severity=s;siglongjmp(escape,1);}
static void divided(int sig){(void)sig;status=2;siglongjmp(escape,1);}
static void steering(void*p,void*world,void*neighbors,void*scene){memcpy(record(1,(uintptr_t)p,(uintptr_t)world,(uintptr_t)neighbors,(uintptr_t)scene)+48,a+0x1010,64);memcpy(p,a+0x9700,64);if(mutation()==1){ptr(0x1078,0x4100);ptr(0x35a8,0xa200);}}
static void*clone(void*owner,void*source){void*model=u32(0x1f004)?NULL:a+0x6000;record(2,(uintptr_t)owner,(uintptr_t)source,(uintptr_t)model,0);if(mutation()==2){ptr(0x1078,0x4100);memcpy(a+0x1080,a+0x9800,16);}return model;}
static void*mesh(void*out,void*p){uint8_t*result=a+0x9200+meshes*64;memcpy(record(3,(uintptr_t)p,meshes,0,0)+48,result,64);memcpy(out,result,64);if(mutation()==3){ptr(0x1078,meshes%2?0x4000:0x4100);memcpy(a+0x1080+meshes*16,a+0x9800+meshes*16,16);}meshes++;return out;}
static uint32_t play(void*animation,char*name,float speed){char*names[]={"critterIdle","critterMove","critterChase","critterFlee"};if(actions>=4||strcmp(name,names[actions]))exit(14);uint32_t result=u32(0x1f010+actions*4);record(4,(uintptr_t)animation,actions,fb(speed),result);if(mutation()==4){ptr(0x1110,0x6100);ptr(0x1078,0x4100);if(actions==3)put32(0x1130,123);}actions++;return result;}
static void loop(void*animation,uint32_t index){record(5,(uintptr_t)animation,index,0,0);if(mutation()==5&&loops==0){put32(0x1130,234);put32(0x1138,345);put32(0x113c,456);ptr(0x33f0,0xa300);}loops++;}
static void*light(void*owner){record(6,(uintptr_t)owner,(uintptr_t)(a+0x8000),0,0);if(mutation()==6)ptr(0x1158,0x8100);return a+0x8000;}
static void release(void*owner,void*p){memcpy(record(7,(uintptr_t)owner,(uintptr_t)p,0,0)+48,(uint8_t*)p+0x50,16);if(mutation()==1){ptr(0x1158,0x8100);ptr(0x33f0,0xa300);}}
static float nearest(void*rail,void*position,void*out){memset(out,0,16);memcpy(record(8,(uintptr_t)rail,0,0,0)+48,position,16);if(mutation()==7){put32(0x12e0,2);a[0x12d0]=1;}return f32(0x1f030);}
static float remainder_value(float x,float y){float result=fmodf(x,y);record(9,fb(x),fb(y),fb(result),0);return result;}
static void*sample(void*out,void*rail,float time){uint8_t*result=a+0x9900+(samples++%2)*16;memcpy(record(10,(uintptr_t)rail,fb(time),0,0)+48,result,16);memcpy(out,result,16);return out;}
static void*seek(void*out,void*position,void*target,float speed){uint8_t*t=record(11,(uintptr_t)position,fb(speed),0,0);memcpy(t+48,target,16);memcpy(t+64,position,16);memcpy(t+80,a+0x9500,16);if(mutation()==8){memcpy(a+0x10c0,a+0x9800,16);put32(0x1178,u32(0x1f034));}memcpy(out,a+0x9500,16);return out;}
static uint8_t detect(void*p,void*result,void*target,void*w0,void*w1,void*w2,void*w3,float radius){uint8_t*t=record(12,(uintptr_t)p,(uintptr_t)result,(uintptr_t)target,fb(radius));uint64_t world[]={(uintptr_t)w0,(uintptr_t)w1,(uintptr_t)w2,(uintptr_t)w3};memcpy(t+48,world,32);if(mutation()==9){a[0x12d0]=1;ptr(0x1208,0x9a00);memcpy(a+0x10a0,a+0x9800,16);}if(mutation()==10)a[0x12d0]=0;return u32(0x1f008);}
static void*position(void*out,void*transform){memcpy(record(13,(uintptr_t)transform,0,0,0)+48,a+0x9600,16);if(mutation()==11)memcpy(a+0x10a0,a+0x9800,16);memcpy(out,a+0x9600,16);return out;}
static void*stream(void*owner,char*name){if(strcmp(name,"CrabBarn"))exit(15);void*p=u32(0x1f00c)==0?NULL:a+0x5000;record(14,(uintptr_t)owner,(uintptr_t)p,0,0);if(mutation()==12){put32(0x1410,3);put32(0xed18,987);}return p;}
static void network_changes(void){if(mutation()==13){memcpy(a+0x1414,a+0x9b00,128);put32(0x1514,8);}}
static void receive(void*barn,void*p,void*game){record(15,(uintptr_t)barn,(uintptr_t)p,(uintptr_t)game,0);network_changes();}
static void send(void*p,void*game,void*crabs,uint32_t count,void*player,float delta){uint8_t*t=record(16,(uintptr_t)p,(uintptr_t)game,(uintptr_t)crabs,count);memcpy(t+48,player,4);uint32_t bits=fb(delta);memcpy(t+52,&bits,4);network_changes();}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x10062e5b0UL,steering);hook(0x10046ccc0UL,clone);hook(0x1000959b0UL,play);hook(0x100097d30UL,loop);hook(0x10039a7f0UL,light);hook(0x10039a780UL,release);
 memcpy(seek_code,(void*)0x10062cb10UL,96);hook(0x10055d820UL,nearest);hook(0x100aa2744UL,remainder_value);hook(0x10055e420UL,sample);hook(0x10026d410UL,detect);hook(0x1007f2a00UL,position);
 hook(0x100385200UL,stream);hook(0x10025ee60UL,receive);hook(0x10025f0d0UL,send);signal(SIGFPE,divided);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;rd(&mode,4);rd(a,0x20000);status=line=severity=calls=meshes=actions=loops=samples=0;
  *(uint64_t*)0x100c0db08UL=(uintptr_t)(a+0x9000);*(uint32_t*)0x100d2b3b0UL=u32(0x1f038);*(uint64_t*)(a+0x9118)=(uintptr_t)mesh;
  memcpy((void*)0x10062cb10UL,seek_code,96);if(!u32(0x1f03c))hook(0x10062cb10UL,seek);
  if(!sigsetjmp(escape,1))for(uint32_t step=0;step<u32(0x1f028);step++){
   if(mode==0){meshes=actions=loops=0;((void(*)(void*,void*,void*))0x1003370c0UL)(a+0x1000,NULL,a+0x3000);if(u32(0x1f040))((void*(*)(void*,void*))0x1003384a0UL)(a+u32(0x1f044),a+0x1000);}
   if(mode==1)((void(*)(void*,void*,void*))0x100337500UL)(a+0x1000,NULL,a+0x3000);
   if(mode==2)((void(*)(void*,void*,void*,void*,void*,float))0x10026d2a0UL)(a+0x1000,a+0xa000,a+0xa100,a+0xa200,a+0xa300,f32(0x1f024));
   if(mode==3)((void(*)(void*,float))0x100270f10UL)(a+0x1000,f32(0x1f024));
   if(mode==4)((void(*)(void*,void*,uint32_t))0x10025f030UL)(a+0x1000,a+0x9000,u32(0x1f02c));
   if(mode==5)((void(*)(void*,void*,void*))0x10025ed80UL)(a+0x1000,a+0x3000,a+0xa000);
   if(mode==6)((void*(*)(void*,void*))0x1003384a0UL)(a+u32(0x1f044),a+0x1000);
  }
  uint64_t zero=0;memcpy(a+0x9118,&zero,8);uint32_t header[]={status,line,severity,calls};wr(header,16);wr(a,0x20000);wr(trace,calls*128);
 }return 0;}
