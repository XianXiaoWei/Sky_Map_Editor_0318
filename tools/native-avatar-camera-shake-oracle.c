#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
typedef float v4 __attribute__((vector_size(16)));
typedef struct {uint32_t kind;float a,b,result[4];} MathTrace;
typedef struct {uint32_t hit;float point[4];} Hit;
typedef struct {float origin[4],direction[4],radius;uint32_t hit;} RayTrace;
static _Alignas(32) uint8_t camera[1024],physical[0xd00],game[0x600];
static _Alignas(32) float offset[4],basis[12],wind_value[4];
static MathTrace math_trace[32];static RayTrace ray_trace[4];static Hit hits[4];
static uint8_t sound_trace[560];static uint32_t math_count,ray_count,sound_count;static float wind_position[4];static uint64_t guard=0x1deadc0de;
static void record(uint32_t kind,float a,float b,v4 result){MathTrace *t=&math_trace[math_count++];if(math_count>32)abort();t->kind=kind;t->a=a;t->b=b;memcpy(t->result,&result,16);}
static float exponential(float a){float r=expf(a);record(1,a,0,(v4){r,0,0,0});return r;}
static float power(float a,float b){float r=powf(a,b);record(2,a,b,(v4){r,0,0,0});return r;}
static float cosine(float a){float r=cosf(a);record(3,a,0,(v4){r,0,0,0});return r;}
static v4 sine_cosine(float a){v4 r={sinf(a),cosf(a),0,0};record(4,a,0,r);return r;}
static void wind(void *out,void *barn,const float *position){(void)barn;memcpy(out,wind_value,16);memcpy(wind_position,position,16);}
static uint8_t ray(void *barn,const float *origin,const float *direction,float radius,const uint8_t *query,float *out){
 (void)barn;if(ray_count>=4||*(uint32_t *)query!=1||*(int32_t *)(query+4)!=-113||query[8]!=1)abort();
 RayTrace *t=&ray_trace[ray_count];memcpy(t->origin,origin,16);memcpy(t->direction,direction,16);t->radius=radius;t->hit=hits[ray_count].hit;
 Hit h=hits[ray_count++];if(h.hit)memcpy(out,h.point,16);return !!h.hit;
}
static void sound(void *barn,const char *name,const void *params,const void *shape){(void)barn;if(strcmp(name,"whippast")||sound_count++)abort();memcpy(sound_trace,params,128);memcpy(sound_trace+128,shape,432);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2708UL,exponential);hook(0x100aa2a2cUL,power);hook(0x100aa260cUL,cosine);hook(0x100aa250aUL,sine_cosine);hook(0x100328200UL,wind);hook(0x100776a90UL,ray);hook(0x1006018a0UL,sound);
 memcpy((void *)0x100c0d8d8UL,&(void *){&guard},8);
 uint32_t count;if(fread(&count,4,1,stdin)!=1)return 5;fwrite(&count,4,1,stdout);
 while(count--){
  uint32_t frames;if(fread(&frames,4,1,stdin)!=1||fread(camera,1024,1,stdin)!=1||fread(physical,0xd00,1,stdin)!=1||fread(hits,sizeof(hits),1,stdin)!=1||fread(wind_value,16,1,stdin)!=1)return 5;
  while(frames--){float dt;if(fread(&dt,4,1,stdin)!=1)return 5;math_count=ray_count=sound_count=0;memset(sound_trace,0,560);memset(offset,0,16);memset(basis,0,48);
   ((void (*)(void *,void *,void *,void *,void *,void *,float,float))0x10073afd0UL)(camera,game,game,physical,offset,basis,0,dt);
   uint32_t header[]={math_count,ray_count,sound_count};fwrite(header,4,3,stdout);fwrite(camera,1024,1,stdout);fwrite(offset,16,1,stdout);fwrite(basis,48,1,stdout);fwrite(wind_position,16,1,stdout);fwrite(math_trace,sizeof(MathTrace),math_count,stdout);fwrite(ray_trace,sizeof(RayTrace),ray_count,stdout);if(sound_count)fwrite(sound_trace,560,1,stdout);
  }
 }
 return 0;
}
