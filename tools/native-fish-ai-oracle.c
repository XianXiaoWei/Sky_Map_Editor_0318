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
#define ROW 640
static uint8_t *a=(void*)0x440000000UL,trace[4096][ROW];
static uint32_t calls,status,line,severity,randoms,active_mode;
static jmp_buf escape;
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}
static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static void put32(size_t at,uint32_t n){memcpy(a+at,&n,4);}
static void ptr(size_t at,size_t target){uint64_t n=(uintptr_t)(a+target);memcpy(a+at,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=4096)exit(12);uint8_t*r=trace[calls++];memset(r,0,ROW);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void mutate(uint32_t event){if(u32(0x1f004)!=event)return;
 switch(u32(0x1f008)){
 case 1:ptr(0x1078,0x4100);break;
 case 2:put32(0x117c,u32(0x1f00c));put32(0x1180,u32(0x1f010));put32(0x1184,u32(0x1f014));break;
 case 3:memcpy(a+0x1010,a+0xc100,16);break;
 case 4:put32(0x1290,u32(0x1f00c));break;
 case 5:ptr(0x1110,0x6500);break;
 case 6:put32(0x5010,u32(0x1f00c));put32(0x5110,u32(0x1f00c));break;
 case 7:memcpy(a+0x9010,a+0xc100,16);break;
 case 8:ptr(0x8020,0x8500);ptr(0x8030,0x8700);break;
 case 9:memcpy(a+0x1290,a+0x1f00c,4);ptr(0x1190,0x9100);break;
 case 10:memcpy(a+0x12a0,a+0xc100,16);break;
 }
}
static void*meta(uint32_t kind){void*p=a+0x18000+kind*0x100;record(1,kind,(uintptr_t)p);mutate(1);return p;}
static void*object_type(void){return meta(0);}static void*entity_type(void){return meta(1);}static void*marker_type(void){return meta(2);}static void*rail_type(void){return meta(3);}static void*mote_type(void){return meta(4);}static void*player_type(void){return meta(5);}static void*actor_type(void){return meta(6);}
static void meta_cast(void*metadata,void**out,void**in,void*source){uint32_t kind=((uint8_t*)metadata-a-0x18000)/0x100;uint8_t*r=record(2,(uintptr_t)metadata,(uintptr_t)*in);uint64_t q=(uintptr_t)source;memcpy(r+24,&q,8);uint8_t*obj=*in;
 if(active_mode==3||active_mode==4){uint32_t success=u32(0x1f020+kind*4);if(u32(0x1f050+kind*4))*in=a+u32(0x1f050+kind*4);*out=success?(a+0xb000):NULL;}else *out=obj&&obj[0xf0]==kind?obj:NULL;
 uint64_t values[]={(uintptr_t)*in,(uintptr_t)*out};memcpy(r+32,values,16);mutate(2);}
static int random_value(void){uint32_t n=u32(0x1f100+(randoms++%4)*4);record(3,n,0);mutate(3);return n;}
static uint32_t query(void*world,void*pos,void*out,uint32_t cap,void*filter,uint32_t zero,float radius){uint8_t*r=record(4,(uintptr_t)world,cap);uint64_t f=(uintptr_t)filter;memcpy(r+24,&f,8);uint32_t values[]={fb(radius),zero,u32(0x1f018)};memcpy(r+32,values,12);memcpy(r+48,pos,16);memcpy(out,a+((uintptr_t)filter==0x1003385f0UL?0xc220:0xc200),u32(0x1f018)*8);mutate(4);return u32(0x1f018);}
static void begin(void*state,void*motion,float delta,float max){uint8_t*r=record(5,(uintptr_t)state,0);uint32_t v[]={fb(delta),fb(max)};memcpy(r+24,v,8);memcpy(r+32,motion,92);uint8_t*p=state;memset(p,0,16);p[16]=1;memcpy(p+32,motion,80);memcpy(p+0x70,(uint8_t*)motion+80,12);memcpy(p+0x80,v,8);mutate(5);}
static void force(void*state,uint32_t event){memcpy(state,a+0xc000,16);mutate(event);}
static void avoidance(void*state,uint32_t flag,float weight,float lookahead){uint8_t*r=record(6,(uintptr_t)state,flag&255);uint32_t v[]={fb(weight),fb(lookahead)};memcpy(r+24,v,8);force(state,6);}
static void flee(void*state,void*motion,float weight,float min,float max,float pred){uint8_t*r=record(7,(uintptr_t)state,0);uint32_t v[]={fb(weight),fb(min),fb(max),fb(pred)};memcpy(r+24,v,16);memcpy(r+48,motion,92);force(state,7);}
static float marker_radius(void*obj){uint8_t*r=record(8,(uintptr_t)obj,0);uint32_t n;memcpy(&n,(uint8_t*)obj+0x80,4);memcpy(r+24,&n,4);mutate(8);float x;memcpy(&x,&n,4);return x;}
static uint32_t marker_count(void*obj){uint32_t n;memcpy(&n,(uint8_t*)obj+0x84,4);record(9,(uintptr_t)obj,n);mutate(9);return n;}
static float nearest(void*rail,void*pos,void*out){uint8_t*r=record(10,(uintptr_t)rail,0);memcpy(r+32,pos,16);memcpy(out,(uint8_t*)rail+0x80,16);memcpy(r+48,out,16);uint32_t n;memcpy(&n,(uint8_t*)rail+0xa0,4);memcpy(r+24,&n,4);mutate(10);float x;memcpy(&x,&n,4);return x;}
static void*initial(void*out,void*rail){uint8_t*r=record(11,(uintptr_t)rail,0);memcpy(out,(uint8_t*)rail+0x90,16);memcpy(r+32,out,16);mutate(11);return out;}
static void*sample(void*out,void*rail,float param){uint8_t*r=record(12,(uintptr_t)rail,fb(param));memcpy(out,(uint8_t*)rail+0xb0,16);memcpy(r+32,out,16);mutate(12);return out;}
static void direct(void*state,void*pos,float weight,float speed){uint8_t*r=record(13,(uintptr_t)state,0);uint32_t v[]={fb(weight),fb(speed)};memcpy(r+24,v,8);memcpy(r+32,pos,16);force(state,13);}
static uint8_t enabled(void*obj){uint8_t on=((uint8_t*)obj)[0xf1];record(14,(uintptr_t)obj,on);mutate(14);return on;}
static void consume(void*obj,void*owner,void*game){uint8_t*r=record(15,(uintptr_t)obj,(uintptr_t)owner);uint64_t q=(uintptr_t)game;memcpy(r+24,&q,8);((uint8_t*)obj)[0xf1]=u32(0x1f01c);mutate(15);}
static void particle(void*owner,void*pos,void*dir,void*templ,uint32_t flag,float scale){uint8_t*r=record(16,(uintptr_t)owner,(uintptr_t)templ);memcpy(r+32,pos,16);memcpy(r+48,dir,16);uint32_t v[]={flag,fb(scale)};memcpy(r+24,v,8);mutate(16);}
static void sound(void*owner,char*name,void*options,void*params){if(strcmp(name,"soulhit"))exit(13);uint8_t*r=record(17,(uintptr_t)owner,0);memcpy(r+32,options,128);memcpy(r+160,params,0x1b0);mutate(17);}
static void pursuit(void*state,void*motion,void*vel,float weight,float prediction){uint8_t*r=record(18,(uintptr_t)state,0);uint32_t v[]={fb(weight),fb(prediction)};memcpy(r+24,v,8);memcpy(r+32,motion,92);memcpy(r+128,vel,16);force(state,18);}
static char*names[]={"CritterAlert","CritterExcite","CritterBite","CritterBiteDone","CritterRoll","CritterBiteOpen"};
static void play(void*owner,char*name,uint32_t flags,float weight,float speed){uint32_t i=0;while(i<6&&strcmp(names[i],name))i++;if(i==6)exit(14);uint8_t*r=record(19,(uintptr_t)owner,i);uint32_t v[]={flags,fb(weight),fb(speed)};memcpy(r+24,v,12);mutate(19);}
static void*motion(void*out,void*obj){uint8_t*r=record(20,(uintptr_t)obj,0);memcpy(out,a+0xc300,92);memcpy(r+32,out,92);mutate(20);return out;}
static void*component(void*out,void*obj){uint8_t*r=record(21,(uintptr_t)obj,0);memcpy(out,obj,16);memcpy(r+32,out,16);mutate(21);return out;}
static float asin_value(float x){float z=asinf(x);uint32_t n=fb(z);memcpy(record(22,fb(x),0)+24,&n,4);mutate(22);return z;}
static __m128 sincos_value(float x){float z[4]={sinf(x),cosf(x),fl(0x1f114),fl(0x1f118)};memcpy(record(23,fb(x),0)+24,z,16);mutate(23);return _mm_loadu_ps(z);}
static void arrival(void*state,void*pos,float weight,float distance){uint8_t*r=record(24,(uintptr_t)state,0);uint32_t v[]={fb(weight),fb(distance)};memcpy(r+24,v,8);memcpy(r+32,pos,16);force(state,24);}
static void interact(void*owner,void*pos,uint32_t first,uint32_t second,float weight,float scale){uint8_t*r=record(25,(uintptr_t)owner,0);uint32_t v[]={first,second,fb(weight),fb(scale)};memcpy(r+24,v,16);memcpy(r+48,pos,16);mutate(25);}
static void model(void*owner,uint32_t index,char*name,float amount){if(strcmp(name,"u_chamAmount"))exit(15);uint8_t*r=record(26,(uintptr_t)owner,index);uint32_t n=fb(amount);memcpy(r+24,&n,4);mutate(26);}
static void wander(void*state,float weight,float radius,float distance,float jitter,float vertical){uint8_t*r=record(27,(uintptr_t)state,0);uint32_t v[]={fb(weight),fb(radius),fb(distance),fb(jitter),fb(vertical)};memcpy(r+24,v,20);force(state,27);}
static void flock(void*state,void*self,void*filter,float weight,float alignment,float cohesion,float separation,float radius){uint8_t*r=record(28,(uintptr_t)state,(uintptr_t)self);uint64_t q=(uintptr_t)filter;memcpy(r+24,&q,8);uint32_t v[]={fb(weight),fb(alignment),fb(cohesion),fb(separation),fb(radius)};memcpy(r+32,v,20);force(state,28);}
static void*end(void*out,void*state,uint32_t avoid){uint8_t*r=record(29,(uintptr_t)state,avoid);memcpy(out,state,16);memcpy(r+32,out,16);((uint8_t*)state)[16]=0;mutate(29);return out;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){status=1;line=l;severity=s;uint8_t*r=record(30,l,s);strncpy((char*)r+24,x,80);strncpy((char*)r+104,f,80);longjmp(escape,1);}
static void*raw_avoid(void*out,void*motion,void*world,uint32_t flag,float lookahead){uint8_t*r=record(31,(uintptr_t)motion,(uintptr_t)world);uint32_t v[]={flag,fb(lookahead)};memcpy(r+24,v,8);memcpy(r+32,motion,92);memcpy(out,a+0xc000,16);memcpy(r+128,out,16);mutate(31);return out;}
static float acos_value(float x){float z=acosf(x);uint32_t n=fb(z);memcpy(record(32,fb(x),0)+24,&n,4);return z;}
static float exp_value(float x){float z=expf(x);uint32_t n=fb(z);memcpy(record(33,fb(x),0)+24,&n,4);return z;}
static float log_value(float x){float z=logf(x);uint32_t n=fb(z);memcpy(record(34,fb(x),0)+24,&n,4);return z;}
static void*collision(void*out,void*position,void*velocity,void*scene,void*repeat,float delta){uint8_t*r=record(35,(uintptr_t)position,(uintptr_t)velocity);uint64_t q=(uintptr_t)scene;memcpy(r+24,&q,8);uint32_t d=fb(delta);memcpy(r+32,&d,4);r[36]=*(uint8_t*)repeat;memcpy(r+48,position,16);memcpy(r+64,velocity,16);memcpy(out,velocity,16);*(uint8_t*)repeat=0;return out;}
static void model_enabled(void*model,uint32_t on){record(36,(uintptr_t)model,on);uint8_t*p=model;p[0x228]=on;if(!(on&255)){p[0x227]=on;p[0x3c0]=0;}}
static void animation_weight(void*owner,int32_t index,float weight){uint8_t*r=record(37,(uintptr_t)owner,(uint32_t)index);uint32_t n=fb(weight);memcpy(r+24,&n,4);}
static uint8_t ray(void*scene,void*position,void*direction,uint32_t kind,void*out,float height){uint8_t*r=record(38,(uintptr_t)scene,kind);uint32_t n=fb(height);memcpy(r+24,&n,4);memcpy(r+32,position,16);memcpy(r+48,direction,16);memset(out,0,48);return 0;}
static void model_transform(void*model,void*matrix){uint8_t*r=record(39,(uintptr_t)model,0);memcpy(r+32,matrix,64);uint8_t*p=model;memcpy(p+(p[0x32e]?0x240:0x160),matrix,64);p[p[0x32e]?0x280:0x225]=1;}
static void*local(void*owner){record(40,(uintptr_t)owner,0);return a+0x8000;}
extern void call_ai(void*,void*,void*,uint32_t);
__asm__(".text\n.global call_ai\ncall_ai:\npush %rbp\nmov %rsp,%rbp\nand $-32,%rsp\nsub $1024,%rsp\nmov %ecx,-596(%rsp)\nmovabs $0x100335a40,%rax\ncall *%rax\nmov %rbp,%rsp\npop %rbp\nret\n");
static uint32_t probe(uint32_t op,uint32_t a0,uint32_t b0){float x,y,z;memcpy(&x,&a0,4);memcpy(&y,&b0,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}return fb(z);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;
 fclose(f);
 if(mmap(a,SIZE,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 uintptr_t steering_addresses[]={0x10062e690UL,0x10062f540UL,0x10062f190UL,0x10062f710UL,0x10062e8f0UL,0x10062f800UL,0x10062e700UL};
 uint8_t steering_original[7][14];for(uint32_t i=0;i<7;i++)memcpy(steering_original[i],(void*)steering_addresses[i],14);
 void*steering_hooks[]={begin,flee,direct,arrival,wander,flock,end};
 // Pursuit and Avoidance remain unmodified for standalone modes.
 hook(0x1007abc10UL,object_type);hook(0x10074a170UL,entity_type);hook(0x1004789e0UL,marker_type);hook(0x10055b490UL,rail_type);hook(0x100474e80UL,mote_type);hook(0x1000f8400UL,player_type);hook(0x100262d70UL,actor_type);
 hook(0x100aa2b22UL,random_value);hook(0x1004ce4b0UL,query);hook(0x10062e690UL,begin);hook(0x10062f540UL,flee);hook(0x100478a30UL,marker_radius);hook(0x100478a50UL,marker_count);hook(0x10055d820UL,nearest);hook(0x100561340UL,initial);hook(0x10055e420UL,sample);hook(0x10062f190UL,direct);hook(0x1002de9e0UL,particle);hook(0x1006018a0UL,sound);hook(0x1000967b0UL,play);hook(0x10062e430UL,motion);hook(0x1007f26b0UL,component);hook(0x100aa2588UL,asin_value);hook(0x100aa250aUL,sincos_value);hook(0x10062f710UL,arrival);hook(0x10016dbc0UL,interact);hook(0x1004667c0UL,model);hook(0x10062e8f0UL,wander);hook(0x10062f800UL,flock);hook(0x10062e700UL,end);hook(0x1007e5f70UL,assertion);hook(0x10062d380UL,raw_avoid);
 hook(0x100aa2576UL,acos_value);hook(0x100aa2708UL,exp_value);hook(0x100aa2858UL,log_value);hook(0x10062d590UL,collision);hook(0x1004636d0UL,model_enabled);hook(0x100097200UL,animation_weight);hook(0x100776a90UL,ray);hook(0x100463750UL,model_transform);hook(0x1000fc260UL,local);
 hook(0x102220000UL,meta_cast);hook(0x102220020UL,enabled);hook(0x102220040UL,consume);
 uint8_t saved_pursuit[14],saved_avoidance[14];memcpy(saved_pursuit,(void*)0x10062f660UL,14);memcpy(saved_avoidance,(void*)0x10062e860UL,14);
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);
 for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);active_mode=mode;rd(a,SIZE);calls=status=line=severity=randoms=0;*(uint8_t*)0x101ffb0d0UL=u32(0x1f120);*(uint32_t*)0x100cb8540UL=u32(0x1f124);uint64_t q=(uintptr_t)(a+0xb400);memcpy((void*)0x100c0d8d8UL,&q,8);q=(uintptr_t)(a+0xb100);memcpy((void*)0x100c0db08UL,&q,8);q=(uintptr_t)(a+0xb200);memcpy((void*)0x101defc48UL,&q,8);
  for(uint32_t i=0;i<7;i++){ptr(0x18000+i*0x100,0x18800);q=0x102220000UL;memcpy(a+0x18840,&q,8);}q=0x102220020UL;memcpy(a+0x18910,&q,8);q=0x102220040UL;memcpy(a+0x18938,&q,8);ptr(0x9000,0x18900);ptr(0x9100,0x18900);
  if(mode==0||mode==5){hook(0x10062f660UL,pursuit);hook(0x10062e860UL,avoidance);}else{memcpy((void*)0x10062f660UL,saved_pursuit,14);memcpy((void*)0x10062e860UL,saved_avoidance,14);}
  for(uint32_t i=0;i<7;i++){if(mode==6||mode==7)memcpy((void*)steering_addresses[i],steering_original[i],14);else hook(steering_addresses[i],steering_hooks[i]);}
  uint32_t result=0;
  if(!setjmp(escape))for(uint32_t step=0;step<u32(0x1f000);step++){
   if(mode==5||mode==7)((void(*)(void*,void*))0x100337540UL)(a+0x1000,a+0x3000);
   else if(mode==0||mode==6)call_ai(a+0xc400,a+0x1000,a+0x3000,u32(0x1f110));
   else if(mode==1){__m128 w=_mm_set_ps(fl(0x1f12c),0,0,fl(0x1f128)),p=_mm_set_ps(fl(0x1f134),0,0,fl(0x1f130));((void(*)(void*,void*,void*,__m128,__m128))0x10062f660UL)(a+0x12a0,a+0xc300,a+0xc350,w,p);}
   else if(mode==2){__m128 w=_mm_set_ps(fl(0x1f12c),0,0,fl(0x1f128));((void(*)(void*,uint32_t,__m128,float))0x10062e860UL)(a+0x12a0,u32(0x1f138),w,fl(0x1f130));}
   else result=((uint8_t(*)(void*)) (mode==3?0x100338570UL:0x1003385f0UL))(a+0xb000);
  }
  uint32_t header[]={status,line,severity,calls,result};wr(header,20);wr(a,SIZE);wr(trace,calls*ROW);
 }
 return 0;
}
