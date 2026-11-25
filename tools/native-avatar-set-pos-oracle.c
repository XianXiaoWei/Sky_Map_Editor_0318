/* Whole original Update, FindLocalAvatar, local getter, SetPosition,
 * Marker forward, Euler and Event::Start bodies; dependencies are explicit.
 * Do not hook an interior branch or any of these verified bodies. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#ifdef AVATAR_PHYSICAL
#define STATE_BYTES 0xd00
static _Alignas(32) uint8_t camera[1024];
static uint32_t physical[5];
static _Alignas(32) float offset_axis[4];
#else
#define STATE_BYTES 320
#endif
static _Alignas(32) uint8_t game[0x500],barn[0x22400],event[80],event_barn[32],state[2][STATE_BYTES],marker[2][80],extent[64],overrides[4][0x5000];
static _Alignas(32) float input[88],hit[9];
static uint32_t h[12],calls,rand_calls,attempts;
typedef struct {uint32_t code,arg;float values[32];} Trace;
static Trace traces[18000];
static uintptr_t vtable[5],log_table[20];static uint64_t guard=0x318beef;
static void *avatar;
static Trace *trace(uint32_t code,uint32_t arg,const float *p,size_t count){if(calls>=18000||count>32)exit(20);Trace *t=&traces[calls++];memset(t,0,sizeof(*t));t->code=code;t->arg=arg;if(count)memcpy(t->values,p,count*4);return t;}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void matrix(float *out,void *m){unsigned which=m==marker[1]?1:0;trace(5,which,NULL,0);memcpy(out,input+(which?40:8),64);}
static void bounds(float *out,void *m){(void)m;trace(5,2,NULL,0);memcpy(out,input+24,64);}
static void inverse(float *out,const float *in){trace(6,0,in,16);memcpy(out,input+56,64);}
static void product(float *out,const float *a,const float *b){Trace *t=trace(7,0,a,16);memcpy(t->values+16,b,64);memcpy(out,input+72,64);}
static void break_hold(void *p){(void)p;trace(4,0,NULL,0);if(h[6])memcpy((uint8_t *)avatar+0x18,&(void *){state[1]},8);}
static void group(void *out,void *p){(void)p;trace(1,0,NULL,0);memset(out,0,16);}
static uint8_t member(void *p,void *hold){(void)p;(void)hold;trace(2,0,NULL,0);return h[5];}
static void setter(void *p,const float *v,uint32_t mode){trace(3,(uint8_t *)p==state[1]?1:0,v,4);if(mode!=1)exit(21);memcpy((uint8_t *)p+0x10,v,16);}
static void setter_immediate(void *p,const float *v){trace(16,(uint8_t *)p==state[1]?1:0,v,4);memcpy((uint8_t *)p+0x10,v,16);}
static uint32_t peers(void *hold,void **out){(void)hold;trace(17,0,NULL,0);if(h[11])out[0]=barn+0x20+0x2230*((h[1]+1)%16);return h[11];}
static int random_value(void){int value=(int)((rand_calls*1234567U+0x318U)&0x7fffffffU);rand_calls++;return value;}
static uint8_t segment(const float *start,const float *end,const float *m,float *out,float *unused,uint32_t mode){(void)unused;Trace *t=trace(8,mode,start,4);memcpy(t->values+4,end,16);memcpy(t->values+8,m,64);attempts++;if(h[8]==0||attempts<=h[7])return 0;memcpy(out,start,16);out[1]-=5;return 1;}
static uint8_t raycast(void *collision,const float *start,const float *dir,const void *filter,void *out,float length){(void)collision;Trace *t=trace(9,filter!=NULL,start,4);memcpy(t->values+4,dir,16);t->values[8]=length;if(filter){uint32_t flags;memcpy(&flags,(const uint8_t *)filter+4,4);if(flags!=0xffffffefU||!*((const uint8_t *)filter+8))exit(22);}if(h[8]==1)return 0;memset(out,0,64);memcpy(out,hit,32);return 1;}
static float distance(void *p,uint32_t amount){(void)p;trace(10,amount,NULL,0);return hit[8];}
static float arctan(float y,float x){float p[]={y,x,atan2f(y,x)};trace(11,0,p,3);return p[2];}
static float arcsine(float v){float p[]={v,asinf(v)};trace(12,0,p,2);return p[1];}
static float arccos(float v){float p[]={v,acosf(v)};trace(13,0,p,2);return p[1];}
static void noop(void *a,void *b){(void)a;(void)b;}
static void log_begin(void *a,const char *name,uint32_t n){(void)a;if(strcmp(name,"AvatarSetPos")||n!=2)exit(23);trace(14,0,NULL,0);}
static void *log_write(void *stream,const char *s,uint32_t n){(void)s;(void)n;return stream;}
static void *log_float(void *stream,float v){trace(15,0,&v,1);return stream;}
static void fail(void){exit(24);}
#ifdef AVATAR_PHYSICAL
typedef float Vector __attribute__((vector_size(16)));
static Vector sine_cosine(float angle){Vector v={sinf(angle),cosf(angle),0,0};float p[]={angle,v[0],v[1],v[2],v[3]};trace(21,0,p,5);return v;}
static void ready_group(void *out,void *hold){(void)hold;trace(18,0,NULL,0);memset(out,0,32);}
static void *ready_leader(void *group_value){(void)group_value;trace(19,0,NULL,0);return physical[0]?&avatar:NULL;}
static uint8_t ready_body(void *body){(void)body;trace(20,0,NULL,0);return physical[0]==1;}
#endif
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 vtable[3]=(uintptr_t)matrix;vtable[4]=(uintptr_t)bounds;
 hook(0x100076940UL,inverse);hook(0x100076df0UL,product);hook(0x10035dda0UL,break_hold);hook(0x10035cef0UL,group);hook(0x10035bca0UL,member);hook(0x10012e6e0UL,peers);
#ifdef AVATAR_PHYSICAL
 hook(0x100aa250aUL,sine_cosine);hook(0x10035c9d0UL,ready_group);hook(0x10035bac0UL,ready_leader);hook(0x1000ff400UL,ready_body);hook(0x1007e6030UL,fail);
#else
 hook(0x100146de0UL,setter);hook(0x1001480d0UL,setter_immediate);
#endif
 hook(0x10078dd30UL,segment);hook(0x100776a90UL,raycast);hook(0x10022ddd0UL,distance);
 hook(0x100aa2b22UL,random_value);hook(0x100aa25a0UL,arctan);hook(0x100aa2588UL,arcsine);hook(0x100aa2576UL,arccos);
 *(uint8_t *)0x100aa2450UL=0xc3;hook(0x1007a56a0UL,log_begin);hook(0x100011930UL,log_write);hook(0x100aa23d2UL,log_float);hook(0x1007a58d0UL,noop);*(uint8_t *)0x100aa23baUL=0xc3;*(uint8_t *)0x100aa245cUL=0xc3;hook(0x100aa251cUL,fail);hook(0x1007e5f70UL,fail);
 /* Fake libc++ vtable has an offset-to-top at address point minus 24. */
 log_table[0]=0;memcpy((void *)0x100c0a520UL,&(void *){log_table},8);memcpy((void *)0x100c0d5c8UL,&(void *){log_table},8);memcpy((void *)0x100c0a580UL,&(void *){log_table},8);memcpy((void *)0x100c0d8d8UL,&(void *){&guard},8);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned c=0;c<cases;c++){
  readin(h,sizeof(h));readin(event,80);readin(state,sizeof(state));readin(input,sizeof(input));readin(hit,sizeof(hit));calls=rand_calls=attempts=0;
#ifdef AVATAR_PHYSICAL
  readin(physical,sizeof(physical));readin(offset_axis,16);readin(camera,sizeof(camera));memcpy((void *)0x1020041f0UL,offset_axis,16);memcpy((void *)0x100d31e54UL,physical+3,4);
#endif
  memset(game,0,sizeof(game));memset(barn,0,sizeof(barn));memset(event_barn,0,sizeof(event_barn));memset(marker,0,sizeof(marker));memset(overrides,0,sizeof(overrides));memset(extent,0,sizeof(extent));
  memcpy(game+0x280,&(void *){h[1]==17?NULL:barn},8);const uint32_t offsets[]={0x310,0x3f8,0x400,0x478},flags[]={0x48e1,0x71e,0x3430,0x167};for(unsigned i=0;i<4;i++){memcpy(game+offsets[i],&(void *){overrides[i]},8);overrides[i][flags[i]]=(h[2]>>i)&1;}
  avatar=barn+0x20+0x2230*(h[1]%16);uint8_t *peer=barn+0x20+0x2230*((h[1]+1)%16);if(h[1]<16){barn[0x21d2+0x2230*h[1]]=1;barn[0x1f18+0x2230*h[1]]=1;}memcpy((uint8_t *)avatar+0x18,&(void *){state[0]},8);memcpy((uint8_t *)avatar+0x20,&(void *){extent},8);((uint8_t *)avatar)[0x1ef8]=h[4];*(float *)(extent+0x34)=2.5f;memcpy(peer+0x18,&(void *){state[1]},8);
  memcpy(marker[0],&(void *){vtable},8);memcpy(marker[1],&(void *){vtable},8);memcpy(marker[0]+0x10,input,32);memcpy(event+0x38,&(void *){marker[0]},8);memcpy(event+0x40,&(void *){h[3]?marker[1]:NULL},8);memcpy(event+0x18,&(void *){event_barn},8);*(uint32_t *)(event_barn+0x10)=0xfffffffeU;
#ifdef AVATAR_PHYSICAL
  barn[0xc]=physical[4];memcpy(game+0x70,&(void *){physical+1},8); /* tick at +4 -> physical[2] */
#endif
  if(h[0]==0)((void (*)(void *,void *))0x100149c40UL)(event,game);
  else if(h[0]==1)((void (*)(void *,const float *,uint8_t))0x100100fb0UL)(avatar,input,h[10]);
#ifdef AVATAR_PHYSICAL
  else if(h[0]==2)((void (*)(void *,const float *,uint8_t))0x100146de0UL)(state[0],h[9]?(float *)(state[0]+h[9]-1):input,h[10]);
  else if(h[0]==3)((void (*)(void *,const float *))0x1001480d0UL)(state[0],h[9]?(float *)(state[0]+h[9]-1):input);
  else if(h[0]==4)((void (*)(void *,const float *))0x100147510UL)(camera,input);
#endif
  else return 5;
#ifdef AVATAR_PHYSICAL
  if(physical[1]&&h[1]!=17){if(physical[1]==1)((void (*)(void *,void *))0x10073aa90UL)(camera,game);else ((void (*)(void *,void *))0x10073ab80UL)(camera,game);}
#endif
  memset(event+0x18,0,8);memset(event+0x38,0,16);uint32_t result[]={calls,rand_calls,attempts,barn[0xc],*(uint32_t *)(event_barn+0x10)};
  fwrite(result,4,5,stdout);fwrite(event,1,80,stdout);fwrite(state,1,sizeof(state),stdout);fwrite(traces,sizeof(Trace),calls,stdout);
#ifdef AVATAR_PHYSICAL
  fwrite(camera,1,sizeof(camera),stdout);
#endif
 }
 return 0;
}
