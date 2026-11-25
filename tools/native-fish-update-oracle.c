#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <immintrin.h>
#include <sys/mman.h>
#define SIZE 0x20000
#define ROW 192
static uint8_t *a=(void*)0x440000000UL,trace[2048][ROW];
static uint32_t calls,status,line,severity,collisions,transforms,weights,randoms,active_mode;
static jmp_buf escape;
static void *turn_entry,*bank_entry,*transform_entry,*enabled_entry,*model_entry;
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}
static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static void put32(size_t at,uint32_t n){memcpy(a+at,&n,4);}
static void ptr(size_t at,size_t target){uint64_t n=(uintptr_t)(a+target);memcpy(a+at,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void*trampoline(uintptr_t at,size_t prefix){void*p=mmap(NULL,4096,7,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);if(p==MAP_FAILED)exit(14);memcpy(p,(void*)at,prefix);hook((uintptr_t)p+prefix,(void*)(at+prefix));return p;}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=2048)exit(12);static uint8_t ignored[ROW];uint8_t*r=active_mode==4&&(kind==8||kind==9||kind==10)?ignored:trace[calls++];memset(r,0,ROW);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void mutate(uint32_t event){if(u32(0x1f004)!=event)return;
 switch(event){
 case 1:a[0x10c0]=u32(0x1f058);ptr(0x1110,0x6500);break;
 case 2:ptr(0x1078,0x4100);memcpy(a+0x1050,a+0x1f100,16);memcpy(a+0x1010,a+0x1f110,16);break;
 case 3:ptr(0x3138,0xb100);memcpy(a+0x1010,a+0x1f110,16);break;
 case 4:ptr(0x1078,0x4100);memcpy(a+0x1030,a+0x1f110,16);break;
 case 5:memcpy(a+0x1030,a+0x1f110,16);put32(0x1100,u32(0x1f060));break;
 case 6:ptr(0x1110,0x6500);memcpy(a+0x1120,a+0x1f120,16);break;
 case 7:put32(0x117c,u32(0x1f064));ptr(0x1110,0x6500);break;
 case 8:put32(0x1144,u32(0x1f060));put32(0x1134,321);ptr(0x1110,0x6500);break;
 case 9:memcpy(a+0x1010,a+0x1f110,16);ptr(0x1078,0x4100);ptr(0x3500,0xb200);break;
 case 10:ptr(0x1158,0x7100);break;
 case 11:memcpy(a+0x1010,a+0x1f110,16);ptr(0x1078,0x4100);put32(0x1160,u32(0x1f060));break;
 case 12:put32(0x1160,u32(0x1f060));break;
 case 13:put32(0x1168,u32(0x1f060));ptr(0x33c8,0xb200);break;
 case 14:put32(0x1160,u32(0x1f060));ptr(0x33c8,0xb200);break;
 }
}
static float acos_value(float x){float z=acosf(x);uint32_t n=fb(z);memcpy(record(1,fb(x),0)+24,&n,4);return z;}
static float exp_value(float x){float z=expf(x);uint32_t n=fb(z);memcpy(record(2,fb(x),0)+24,&n,4);return z;}
static float log_value(float x){float z=logf(x);uint32_t n=fb(z);memcpy(record(3,fb(x),0)+24,&n,4);return z;}
static __m128 sincos_value(float x){float z[4]={sinf(x),cosf(x),fl(0x1f050),fl(0x1f054)};memcpy(record(4,fb(x),0)+24,z,16);return _mm_loadu_ps(z);}
static void enabled(void*p,uint32_t on){record(5,(uintptr_t)p,on);((void(*)(void*,uint32_t))enabled_entry)(p,on);mutate(1);}
static void*ai(void*out,void*p,void*game){uint8_t*r=record(6,(uintptr_t)p,(uintptr_t)game);memcpy(out,a+0x9000,16);memcpy(r+32,out,16);mutate(2);return out;}
static void*collision(void*out,void*position,void*velocity,void*scene,void*repeat,float delta){uint8_t*r=record(7,(uintptr_t)position,(uintptr_t)velocity);uint64_t owner=(uintptr_t)scene;memcpy(r+24,&owner,8);uint32_t d=fb(delta);memcpy(r+32,&d,4);r[36]=*(uint8_t*)repeat;memcpy(r+48,position,16);memcpy(r+64,velocity,16);
 if(u32(0x1f00c))memcpy(out,a+0x9010+(collisions%3)*16,16);else memcpy(out,velocity,16);
 *(uint8_t*)repeat=++collisions%3<u32(0x1f008);r[37]=*(uint8_t*)repeat;memcpy(r+80,out,16);mutate(3);return out;}
static void*turn(void*out,void*maximum,void*before,void*desired){uint32_t t;memcpy(&t,maximum,4);uint8_t*r=record(8,t,0);memcpy(r+32,before,16);memcpy(r+48,desired,16);
 if(u32(0x1f010))((void*(*)(void*,void*,void*,void*))turn_entry)(out,maximum,before,desired);else memcpy(out,a+0x9040,16);
 memcpy(r+64,out,16);mutate(4);return out;}
static void bank(void*p,void*motion,float delta,float strength,float smoothing,float limit){uint8_t*r=record(9,(uintptr_t)p,(uintptr_t)motion);uint32_t b[]={fb(delta),fb(strength),fb(smoothing),fb(limit)};memcpy(r+32,b,16);
 if(u32(0x1f014))((void(*)(void*,void*,float,float,float,float))bank_entry)(p,motion,delta,strength,smoothing,limit);else memcpy((uint8_t*)p+48,a+0x1f060,4);
 memcpy(r+48,p,64);mutate(5);}
static void*transform(void*out,void*p){uint8_t*r=record(10,(uintptr_t)p,transforms++);((void*(*)(void*,void*))transform_entry)(out,p);
 if(transforms==u32(0x1f018)){uint32_t n=u32(0x1f01c);memcpy((uint8_t*)out+u32(0x1f05c),&n,4);}memcpy(r+32,out,64);mutate(6);return out;}
static void model(void*p,void*matrix){uint8_t*r=record(11,(uintptr_t)p,0);memcpy(r+32,matrix,64);((void(*)(void*,void*))model_entry)(p,matrix);mutate(7);}
static void weight(void*animation,int32_t index,float v){record(12,(uintptr_t)animation,(uint32_t)index);uint32_t n=fb(v);memcpy(trace[calls-1]+24,&n,4);weights++;mutate(8);}
static uint8_t ray(void*scene,void*position,void*direction,uint32_t kind,void*out,float height){uint8_t*r=record(13,(uintptr_t)scene,kind);uint32_t h=fb(height);memcpy(r+24,&h,4);memcpy(r+32,position,16);memcpy(r+48,direction,16);memset(out,0,48);memcpy(out,a+0x9050,16);((uint8_t*)out)[36]=u32(0x1f024);memcpy(r+64,out,16);r[80]=u32(0x1f020);r[81]=u32(0x1f024);mutate(9);return u32(0x1f020);}
static void ripple(void*owner,uint32_t kind,void*position,void*color,float size,float radius,float weight0,float enabled0){uint8_t*r=record(14,(uintptr_t)owner,kind);memcpy(r+32,position,16);memcpy(r+48,color,16);uint32_t fs[]={fb(size),fb(radius),fb(weight0),fb(enabled0)};memcpy(r+64,fs,16);mutate(10);}
static void light(void*p,void*matrix){uint8_t*r=record(15,(uintptr_t)p,0);memcpy(r+32,matrix,64);memcpy((uint8_t*)p+16,matrix,64);}
static void*local(void*owner){void*p=a+0x8000;record(16,(uintptr_t)owner,(uintptr_t)p);mutate(11);return p;}
static void play(void*animation,char*name,uint32_t flags,float weight0,float speed){if(strcmp(name,"CritterAlert"))exit(15);uint8_t*r=record(17,(uintptr_t)animation,flags);uint32_t fs[]={fb(weight0),fb(speed)};memcpy(r+24,fs,8);mutate(12);}
static uint8_t request(void*owner,void*position,uint32_t player,uint32_t kind,uint32_t enabled0,float range){uint8_t*r=record(18,(uintptr_t)owner,player);memcpy(r+32,position,16);uint32_t v[]={fb(range),kind,enabled0,u32(0x1f028)};memcpy(r+48,v,16);mutate(13);return u32(0x1f028);}
static int random_value(void){int n=u32(0x1f030+(randoms++%4)*4);record(19,(uint32_t)n,0);mutate(14);return n;}
static void emit(void*owner,void*p,uint32_t kind,void*params,uint32_t first,uint32_t second,uint32_t last,float radius,float random0){uint8_t*r=record(20,(uintptr_t)owner,(uintptr_t)p);uint64_t q=(uintptr_t)params;memcpy(r+24,&q,8);uint32_t v[]={kind,fb(radius),fb(random0),first,second,last};memcpy(r+32,v,24);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(x,"!isNan( GetTransform() )")||strcmp(f,"FishV2.cpp"))exit(16);status=1;line=l;severity=s;longjmp(escape,1);}
static uint32_t probe(uint32_t op,uint32_t a0,uint32_t b0){float x,y,z;memcpy(&x,&a0,4);memcpy(&y,&b0,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}return fb(z);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;
 fclose(f);
 if(mmap(a,SIZE,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 turn_entry=trampoline(0x100168830UL,14);bank_entry=trampoline(0x100192550UL,14);transform_entry=trampoline(0x1001a6610UL,15);enabled_entry=trampoline(0x1004636d0UL,14);model_entry=trampoline(0x100463750UL,15);
 hook(0x100aa2576UL,acos_value);hook(0x100aa2708UL,exp_value);hook(0x100aa2858UL,log_value);hook(0x100aa250aUL,sincos_value);
 hook(0x100335a40UL,ai);hook(0x10062d590UL,collision);hook(0x100168830UL,turn);hook(0x100192550UL,bank);hook(0x1001a6610UL,transform);
 hook(0x1004636d0UL,enabled);hook(0x100463750UL,model);hook(0x100097200UL,weight);hook(0x100776a90UL,ray);hook(0x1004d3940UL,ripple);hook(0x1003991b0UL,light);hook(0x1000fc260UL,local);hook(0x1000967b0UL,play);hook(0x1005a18f0UL,request);hook(0x100aa2b22UL,random_value);hook(0x1005a10e0UL,emit);hook(0x1007e5f70UL,assertion);
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);
 for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);active_mode=mode;rd(a,SIZE);calls=status=line=severity=collisions=transforms=weights=randoms=0;*(uint8_t*)0x101ffb0d0UL=u32(0x1f044);*(uint32_t*)0x100cb8540UL=u32(0x1f048);
  if(!setjmp(escape))for(uint32_t step=0;step<u32(0x1f000);step++){
   if(mode==0||mode==4)((void(*)(void*,void*))0x100337540UL)(a+0x1000,a+0x3000);
   else if(mode==1){uint8_t out[16] __attribute__((aligned(16)));turn(out,a+0x1f04c,a+0x9060,a+0x9070);memcpy(a+0x9080,out,16);}
   else if(mode==2)bank(a+0x10d0,a+0x1010,fl(0x1f04c),fl(0x1f068),fl(0x1f06c),fl(0x1f070));
   else {uint8_t out[64] __attribute__((aligned(16)));transform(out,a+0x1000);memcpy(a+0x9080,out,64);}
  }
  uint32_t header[]={status,line,severity,calls};wr(header,16);wr(a,SIZE);wr(trace,calls*ROW);
 }
 return 0;
}
