#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,calls;static uint8_t trace[2048][160];
static int force_chain,rail_chain,follow_chain;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u32(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z,uint64_t w,uint64_t v){if(calls>=2048)exit(12);uint8_t*out=trace[calls++];memset(out,0,160);uint64_t values[]={k,x,y,z,w,v};memcpy(out,values,48);return out;}
static void assertion(char*x,char*f,uint32_t l,uint32_t severity,...){(void)x;(void)f;(void)severity;line=l;longjmp(escape,1);}
static void model_enable(void*p,uint32_t enabled){record(1,(uintptr_t)p,enabled,0,0,0);if(u32(a+0x5f020)==1)a[0x40d0]=0;}
static uint8_t object_enabled(void*p){record(2,(uintptr_t)p,0,0,0,0);return a[0x5f024];}
static uint32_t random_value(void){uint32_t n=u32(a+0x5f01c);record(3,n,0,0,0,0);if(force_chain&&u32(a+0x5f284)==6){void*p=a+0x56100;memcpy(a+0x40e8,&p,8);}return n;}
static uint8_t validate(void*p,void*timer){record(4,(uintptr_t)p,(uintptr_t)timer,0,0,0);if(u32(a+0x5f020)==2){*(uint8_t*)0x101ffb0d0UL=1;*(uint32_t*)0x100cb8540UL=0x40000000;}memcpy(timer,a+0x5f028,4);return a[0x5f025];}
static void*target_meta(void){return a+0x5e180;}
static void target_cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;uintptr_t p;memcpy(&p,input,8);record(21,p,0,0,0,0);p=a[0x5f035]?0:p-8;if(a[0x5f036]){uint32_t n=0;memcpy(a+0x57010,&n,4);}memcpy(out,&p,8);}
static uint8_t target_enabled(void*p){record(22,(uintptr_t)p,0,0,0,0);return ((uint8_t*)p)[12];}
static void target_transform(void*out,void*p){record(23,(uintptr_t)p,0,0,0,0);memcpy(out,(uint8_t*)p+16,64);}
static void*avatar(void*p){record(5,(uintptr_t)p,0,0,0,0);return a+0x53000;}
static void lost(void*p,void*avatar){record(6,(uintptr_t)p,(uintptr_t)avatar,0,0,0);if(u32(a+0x5f020)==3){void*params=a+0x52000;memcpy(a+0x4078,&params,8);}}
static void camera(void*out,void*p){record(7,(uintptr_t)p,0,0,0,0);memcpy(out,a+0x30000,16);}
static void ai(void*p,void*state,void*params,void*position,void*game,void*out,void*scene,float delta){uint8_t*r=record(8,(uintptr_t)p,(uintptr_t)state,(uintptr_t)params,(uintptr_t)position,(uintptr_t)game);memcpy(r+48,&scene,8);memcpy(r+56,&delta,4);memcpy(out,a+0x5f02c,4);if(u32(a+0x5f020)==4){void*model=a+0x51000;memcpy(a+0x43a0,&model,8);}}
static void movement(void*p,void*state,void*animation,void*position,float turn,float delta){uint8_t*r=record(9,(uintptr_t)p,(uintptr_t)state,(uintptr_t)animation,(uintptr_t)position,0);memcpy(r+56,&turn,4);memcpy(r+60,&delta,4);}
static void transform(void*out,void*p){record(10,(uintptr_t)p,0,0,0,0);memcpy(out,a+0x30040,64);if(u32(a+0x5f254)==1){void*model=a+0x53000;memcpy(a+0x43a0,&model,8);uint32_t n=0x40a00000;memcpy(a+0x43b0,&n,4);}}
static void animation(void*p,void*state,void*anim){record(11,(uintptr_t)p,(uintptr_t)state,(uintptr_t)anim,0,0);}
static void wake(void*owner,void*position,uint32_t enabled,float radius){uint8_t*r=record(12,(uintptr_t)owner,(uintptr_t)position,enabled,0,0);memcpy(r+56,&radius,4);}
static void guide(void*p,void*state,void*position,void*avatars,void*birds){record(13,(uintptr_t)p,(uintptr_t)state,(uintptr_t)position,(uintptr_t)avatars,(uintptr_t)birds);}
static void post(void*state,void*motion,void*timer,void*avatars,float delta){uint8_t*r=record(14,(uintptr_t)state,(uintptr_t)timer,(uintptr_t)avatars,0,0);memcpy(r+56,&delta,4);memcpy(r+64,motion,92);}
static void effects(void*p,void*anim,void*position,void*avatars){record(15,(uintptr_t)p,(uintptr_t)anim,(uintptr_t)position,(uintptr_t)avatars,0);}
static void wind(void*p){record(16,(uintptr_t)p,0,0,0,0);}
static void attached(void*p,void*owner,void*effects,float delta){uint8_t*r=record(17,(uintptr_t)p,(uintptr_t)owner,(uintptr_t)effects,0,0);memcpy(r+56,&delta,4);}
static void attached_transform(void*p,void*position){record(18,(uintptr_t)p,(uintptr_t)position,0,0,0);}
static void pickup(void*p,void*position,void*avatars,void*owner,void*timer,float delta){uint8_t*r=record(19,(uintptr_t)p,(uintptr_t)position,(uintptr_t)avatars,(uintptr_t)owner,(uintptr_t)timer);memcpy(r+56,&delta,4);}
static void debug(void*p,void*position){record(20,(uintptr_t)p,(uintptr_t)position,0,0,0);}
static uint32_t collision_at;
static uint32_t fb(float n){uint32_t b;memcpy(&b,&n,4);return b;}
static void*acceleration(void*out,void*ai,void*game){uint8_t*r=record(24,(uintptr_t)ai,(uintptr_t)game,0,0,0);memcpy(out,a+0x5f200,16);memcpy(r+64,out,16);if(u32(a+0x5f228)==1){uint32_t n=0x3f800000;memcpy(a+0x5001c,&n,4);}return out;}
static void*collision(void*out,void*position,void*velocity,float delta,void*scene,uint8_t*blocked){uint8_t*r=record(position==a+0x4190?38:25,(uintptr_t)position,(uintptr_t)velocity,(uintptr_t)scene,*blocked,0);memcpy(r+56,&delta,4);memcpy(r+64,velocity,16);memcpy(out,a+0x5f210,16);memcpy(r+80,out,16);uint32_t next=position==a+0x4190?0:++collision_at<u32(a+0x5f220);*blocked=next;memcpy(r+96,&next,4);if(u32(a+0x5f228)==2){uint32_t n=0x3f800000;memcpy(a+0x4104,&n,4);}return out;}
static float arc_cos(float x){float n=acosf(x);record(26,fb(x),fb(n),0,0,0);return n;}
typedef float Float2 __attribute__((vector_size(8)));
static Float2 angle_pair(float x){Float2 n={sinf(x),cosf(x)};record(27,fb(x),fb(n[0]),fb(n[1]),0,0);return n;}
static uint32_t neighbors(void*owner,void*point,void*out,uint32_t capacity,void*filter,void*extra,float radius){(void)extra;if(force_chain&&out==a+0x4228){uint8_t*r=record(42,(uintptr_t)owner,(uintptr_t)point,(uintptr_t)out,capacity,(uintptr_t)filter);memcpy(r+56,&radius,4);memcpy(out,a+0x5d800,256);if(u32(a+0x5f284)==3){void*p=a+0x56100;memcpy(a+0x40e8,&p,8);}return u32(a+0x5f280);}uint32_t count=u32(a+0x5f224);uint8_t*r=record(28,(uintptr_t)owner,capacity,(uintptr_t)filter,count,0);memcpy(r+56,&radius,4);memcpy(r+64,point,16);for(uint32_t i=0;i<count;i++){void*p=i==0?a+0x4000:a+0x59000;memcpy((uint8_t*)out+i*8,&p,8);}return count;}
static float target_distance(void*ai,void*scene,void*motion,float speed){uint8_t*r=record(29,(uintptr_t)ai,(uintptr_t)scene,0,0,0);memcpy(r+56,&speed,4);memcpy(r+64,motion,92);float n;memcpy(&n,a+0x5f230,4);return n;}
static void flock_update(void*ai,void*params,void*motion,float speed,float delta){uint8_t*r=record(30,(uintptr_t)ai,(uintptr_t)params,0,0,0);memcpy(r+56,&speed,4);memcpy(r+60,&delta,4);memcpy(r+64,motion,92);memcpy((uint8_t*)ai+36,a+0x5f23c,4);if(u32(a+0x5f240)==1){void*p=a+0x57000;memcpy((uint8_t*)ai+64,&p,8);}}
static float power(float x,float y){float n=powf(x,y);record(31,fb(x),fb(y),fb(n),0,0);if(u32(a+0x5f240)==2){uint32_t v=0x3f800000;memcpy(a+0x50020,&v,4);}return n;}
static float rail_distance(void*rail,void*motion,void*out){uint8_t*r=record(32,(uintptr_t)rail,0,0,0,0);memcpy(r+64,motion,92);memset(out,0,16);if(u32(a+0x5f240)==3){void*p=a+0x59000;memcpy(a+0x4120,&p,8);}float n;memcpy(&n,a+0x5f234,4);return n;}
static void follow_rail(void*state,void*rail,uint32_t enabled,float lookahead,float weight,float distance){uint8_t*r=record(33,(uintptr_t)state,(uintptr_t)rail,enabled,0,0);memcpy(r+56,&lookahead,4);memcpy(r+60,&weight,4);memcpy(r+64,&distance,4);memcpy(state,a+0x5f200,16);}
static void flock(void*state,void*bird,void*filter,float x,float y,float z,float w,float v){uint8_t*r=record(34,(uintptr_t)state,(uintptr_t)bird,(uintptr_t)filter,0,0);float weights[]={x,y,z,w,v};memcpy(r+56,weights,20);}
static uint8_t follow_object(void*ai,void*params,void*avatars,void*critters,void*motion,float delta){uint8_t*r=record(35,(uintptr_t)ai,(uintptr_t)params,(uintptr_t)avatars,(uintptr_t)critters,0);memcpy(r+56,&delta,4);memcpy(r+64,motion,92);memcpy((uint8_t*)ai+0x90,a+0x5f200,16);return u32(a+0x5f238);}
static void steer_target(void*ai,void*params,void*motion,float speed){uint8_t*r=record(36,(uintptr_t)ai,(uintptr_t)params,0,0,0);memcpy(r+56,&speed,4);memcpy(r+64,motion,92);memcpy((uint8_t*)ai+0x90,a+0x5f200,16);}
static void steer_guide(void*ai,void*avatars,void*motion,float delta){uint8_t*r=record(37,(uintptr_t)ai,(uintptr_t)avatars,0,0,0);memcpy(r+56,&delta,4);memcpy(r+64,motion,92);}
static void*turn_direction(void*out,uint32_t*maximum,void*before,void*desired){uint8_t*r=record(39,*maximum,0,0,0,0);memcpy(r+64,before,16);memcpy(r+80,desired,16);memcpy(out,a[0x5f258]?a+0x5f260:desired,16);return out;}
static void bank(void*state,void*motion,float delta,float strength,float smoothing,float limit){uint8_t*r=record(40,(uintptr_t)state,(uintptr_t)motion,0,0,0);float n[]={delta,strength,smoothing,limit};memcpy(r+56,n,16);memcpy((uint8_t*)state+48,a+0x5f250,4);if(u32(a+0x5f254)==2){uint32_t v=0x3f4ccccd;memcpy(a+0x4104,&v,4);}}
static void animation_weight(void*animation,uint32_t index,float weight){uint8_t*r=record(41,(uintptr_t)animation,index,0,0,0);memcpy(r+56,&weight,4);if(u32(a+0x5f254)==3){uint32_t v=99;memcpy(a+0x43c4,&v,4);}}
static void*force_generic(void){return a+0x5e600;}
static void*force_actor_type(void){return a+0x5e500;}
static void*force_avatar_type(void){return a+0x5e580;}
static void force_cast(void*meta,void**out,void**input,void*from){(void)from;uint32_t tag=u32((uint8_t*)meta+8);void*before=*input,*selected=(((uint8_t*)before)[0xe0]&(1<<tag))?before:NULL;record(43,tag,(uintptr_t)input,(uintptr_t)before,(uintptr_t)selected,(uintptr_t)*input);if(u32(a+0x5f284)==4){uint32_t n=1;memcpy(a+0x4328,&n,4);}*out=selected;}
static void*force_avatar_motion(void*out,void*object){record(44,(uintptr_t)object,0,0,0,0);memcpy(out,(uint8_t*)object+0x190,92);return out;}
static void*force_transform(void*out,void*object){record(46,(uintptr_t)object,0,0,0,0);if(u32(a+0x5f284)==2){void*p=a+0x56100;memcpy(a+0x40e8,&p,8);uint32_t n=0x40000000;memcpy(a+0x4010,&n,4);}memcpy(out,(uint8_t*)object+16,64);return out;}
static uint8_t force_raycast(void*scene,void*origin,void*direction,void*options,void*out,float maximum){uint8_t*r=record(47,(uintptr_t)scene,a[0x5f288],0,0,0);memcpy(r+56,&maximum,4);memcpy(r+64,origin,16);memcpy(r+80,direction,16);memcpy(r+96,options,9);memcpy(r+112,(uint8_t*)options+16,16);memcpy(r+128,a+0x5f290,16);memcpy(r+144,a+0x5f2a0,16);if(u32(a+0x5f284)==1)a[0x4128]=1;memcpy(out,a+0x5f290,16);memcpy((uint8_t*)out+16,a+0x5f2a0,16);return a[0x5f288];}
static void*force_avatar_at(void*owner,uint32_t index){void*p;memcpy(&p,a+0x5d000+index*8,8);record(48,(uintptr_t)owner,index,(uintptr_t)p,0,0);return p;}
static uint8_t force_avatar_active(void*object){record(49,(uintptr_t)object,((uint8_t*)object)[0xe1],0,0,0);if(u32(a+0x5f284)==5)a[0x4128]=1;return ((uint8_t*)object)[0xe1];}
static uint32_t force_arithmetic(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}return fb(z);}
static void force_probes(void){const uint32_t values[]={0x7fc00000,0xffc00000};uint32_t count=16;wr(&count,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],force_arithmetic(op,values[x],values[y])};wr(row,16);}}
static void*rail_meta(void){return a+0x5e900;}
static void rail_cast(void*meta,void**out,void**input,void*from){(void)meta;(void)from;record(50,(uintptr_t)*input,0,0,0,0);*out=u32(a+0x5f2b4)?NULL:(uint8_t*)*input-8;if(u32(a+0x5f2b0)==1){uint32_t n=1;memcpy(a+0x5b010,&n,4);}if(u32(a+0x5f2b0)==2){void*p=a+0x56100;memcpy(a+0x40e8,&p,8);}}
static void rail_mutate(uint32_t n){if(u32(a+0x5f2b0)!=n)return;uint32_t x=0x40000000,speed=0x40a00000,velocity=0x40400000;if(n==3||n==5)memcpy(a+0x4190,&x,4);if(n==3||n==4)memcpy(a+0x41e4,&speed,4);if(n==4||n==6)memcpy(a+0x41d0,&velocity,4);}
static float rail_nearest(void*rail,void*position,void*out){uint8_t*r=record(51,(uintptr_t)rail,u32(a+0x5f234),0,0,0);memcpy(r+64,position,16);memcpy(r+80,a+0x5f2c0,16);memcpy(out,a+0x5f2c0,16);rail_mutate(3);float n;memcpy(&n,a+0x5f234,4);return n;}
static float rail_arc_distance(void*rail,float time){uint8_t*r=record(52,(uintptr_t)rail,u32(a+0x5f2e0),0,0,0);memcpy(r+56,&time,4);rail_mutate(4);float n;memcpy(&n,a+0x5f2e0,4);return n;}
static float rail_arc_time(void*rail,float distance){uint8_t*r=record(53,(uintptr_t)rail,u32(a+0x5f2e4),0,0,0);memcpy(r+56,&distance,4);rail_mutate(5);float n;memcpy(&n,a+0x5f2e4,4);return n;}
static void*rail_sample(void*out,void*rail,float time){uint8_t*r=record(54,(uintptr_t)rail,0,0,0,0);memcpy(r+56,&time,4);memcpy(r+64,a+0x5f2d0,16);memcpy(out,a+0x5f2d0,16);rail_mutate(6);return out;}

static void*follow_position(void*out,void*p){uint8_t*r=record(55,(uintptr_t)p,0,0,0,0);memcpy(r+64,(uint8_t*)p+176,16);memcpy(out,(uint8_t*)p+176,16);return out;}
static void*follow_obb(void*out,void*p){uint8_t*r=record(56,(uintptr_t)p,0,0,0,0);memcpy(r+64,a+0x5aa00,64);memcpy(out,a+0x5aa00,64);return out;}
static uint8_t follow_projection(void*sphere,void*box,void*out,float radius){uint32_t n=u32((uint8_t*)sphere+48);uint8_t*r=record(57,n,0,0,0,0);memcpy(r+64,sphere,16);memcpy(r+80,box,64);memcpy(r+144,a+0x5aa40,16);memcpy(out,a+0x5aa40,16);(void)radius;return 1;}
static void follow_emit(void*owner,void*bird,uint32_t kind,void*texture,uint32_t flags,uint32_t enabled,uint32_t local,float scale,float time){uint8_t*r=record(58,(uintptr_t)owner,(uintptr_t)bird,kind,(uintptr_t)texture,flags);memcpy(r+56,&scale,4);memcpy(r+60,&time,4);memcpy(r+64,&enabled,4);memcpy(r+68,&local,4);}

int main(int argc,char**argv){
 if(argc<2||argc>3)return 2;follow_chain=argc==3&&!strcmp(argv[2],"--follow-chain");rail_chain=follow_chain||(argc==3&&!strcmp(argv[2],"--rail-chain"));force_chain=rail_chain||(argc==3&&!strcmp(argv[2],"--force-chain"));int steering_motion_chain=force_chain||(argc==3&&!strcmp(argv[2],"--steering-motion-chain")),target_chain=argc==3&&!strcmp(argv[2],"--target-chain"),steering_flight_chain=steering_motion_chain||(argc==3&&!strcmp(argv[2],"--steering-flight-chain")),motion_chain=steering_motion_chain||(argc==3&&(!strcmp(argv[2],"--motion-chain")||!strcmp(argv[2],"--motion-flight-chain"))),flight_chain=steering_flight_chain||(argc==3&&!strcmp(argv[2],"--motion-flight-chain"))||(argc==3&&!strcmp(argv[2],"--flight-chain"));FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1004636d0UL,model_enable);hook(0x100aa2b22UL,random_value);if(!target_chain)hook(0x1001a2770UL,validate);hook(0x1000fc260UL,avatar);hook(0x1001a29d0UL,lost);hook(0x10076be90UL,camera);if(!flight_chain)hook(0x1001a2f30UL,ai);if(!motion_chain)hook(0x1001a34c0UL,movement);hook(0x1001a3980UL,animation);hook(0x1004162e0UL,wake);hook(0x1001a3ad0UL,guide);hook(0x1001a4520UL,post);hook(0x1001a4820UL,effects);hook(0x1001a4a70UL,wind);hook(0x1001a4e90UL,attached);hook(0x1001a5270UL,attached_transform);hook(0x1001a5770UL,pickup);hook(0x1001a59d0UL,debug);
 if(flight_chain){if(!steering_flight_chain)hook(0x1001a0060UL,acceleration);hook(0x10062d590UL,collision);hook(0x100aa2576UL,arc_cos);hook(0x100aa250aUL,angle_pair);hook(0x1004ce4b0UL,neighbors);*(void**)0x100c0d8d8UL=a+0x5ff00;}
 if(steering_flight_chain){if(!force_chain)hook(0x1001a0450UL,target_distance);if(!rail_chain)hook(0x1001a06a0UL,flock_update);hook(0x100aa2a2cUL,power);if(!rail_chain){hook(0x10055d820UL,rail_distance);hook(0x100630020UL,follow_rail);}if(!force_chain)hook(0x10062f800UL,flock);if(!follow_chain)hook(0x1001a08e0UL,follow_object);if(!force_chain){hook(0x1001a0d20UL,steer_target);hook(0x1001a0e70UL,steer_guide);}}
 if(force_chain){hook(0x10074a170UL,force_generic);hook(0x100262d70UL,force_actor_type);hook(0x1000f8400UL,force_avatar_type);hook(0x100101450UL,force_avatar_motion);hook(0x100776a90UL,force_raycast);hook(0x1001031d0UL,force_avatar_at);hook(0x1000fe050UL,force_avatar_active);}
 if(rail_chain){hook(0x1007abc10UL,force_generic);hook(0x10055b490UL,rail_meta);hook(0x10055d820UL,rail_nearest);hook(0x10055d410UL,rail_arc_distance);hook(0x10055d4e0UL,rail_arc_time);hook(0x10055e420UL,rail_sample);}
 if(follow_chain){hook(0x1007f26b0UL,follow_position);hook(0x10078d250UL,follow_projection);hook(0x1005a10e0UL,follow_emit);}
 if(motion_chain){hook(0x100168830UL,turn_direction);hook(0x100192550UL,bank);hook(0x100097200UL,animation_weight);hook(0x100aa250aUL,angle_pair);}
 if(target_chain){hook(0x1007abc10UL,target_meta);hook(0x10043ccc0UL,target_meta);*(void**)0x100c0d8d8UL=a+0x5ff00;}
 uint32_t count;rd(&count,4);wr(&count,4);if(force_chain)force_probes();while(count--){
  rd(a,0x60000);line=calls=collision_at=0;if(target_chain){*(void**)(a+0x5e180)=a+0x5e100;*(void**)(a+0x5e140)=target_cast;*(void**)(a+0x5e210)=target_enabled;*(void**)(a+0x5e218)=target_transform;}void*fn=transform;memcpy(a+0x5e018,&fn,8);fn=object_enabled;memcpy(a+0x5e010,&fn,8);
  if(force_chain){*(void**)(a+0x5e410)=object_enabled;*(void**)(a+0x5e418)=force_transform;if(follow_chain)*(void**)(a+0x5e420)=follow_obb;*(void**)(a+0x5e500)=a+0x5e700;*(void**)(a+0x5e580)=a+0x5e700;*(uint32_t*)(a+0x5e588)=1;*(void**)(a+0x5e740)=force_cast;*(void**)0x100c0db08UL=a+0x5d500;}
  if(rail_chain){*(void**)(a+0x5e900)=a+0x5e980;*(void**)(a+0x5e9c0)=rail_cast;}
  *(uint8_t*)0x101ffb0d0UL=a[0x5f000];memcpy((void*)0x100cb8540UL,a+0x5f004,4);memcpy((void*)0x100c89f68UL,a+0x5f008,4);*(uint8_t*)0x101de6110UL=a[0x5f00c];
  if(!setjmp(escape))for(uint32_t i=0;i<u32(a+0x5f030);i++)((void(*)(void*,void*))0x1001a2260UL)(a+0x4000,a+0x1000);
  memcpy(a+0x5f100,&line,4);a[0x5f104]=*(uint8_t*)0x101ffb0d0UL;memcpy(a+0x5f108,(void*)0x100cb8540UL,4);memcpy(a+0x5f10c,(void*)0x100c89f68UL,4);
  memset(a+0x5e000,0,target_chain?0x300:0x100);if(force_chain)memset(a+0x5e400,0,0x400);if(rail_chain)memset(a+0x5e900,0,0x100);wr(a,0x60000);wr(&calls,4);wr(trace,calls*160);
 }
 return 0;
}
