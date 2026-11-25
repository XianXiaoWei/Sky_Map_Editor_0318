#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
typedef struct {float sin,cos;} SinCos;
static float trace[3];
static SinCos traced_sincos(float x){SinCos y;sincosf(x,&y.sin,&y.cos);trace[0]=x;trace[1]=y.sin;trace[2]=y.cos;return y;}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t at,const void *v){memcpy((char *)p+at,&v,8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2744UL,fmodf);hook(0x100aa250aUL,traced_sincos);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  _Alignas(32) unsigned char rail[0x110]={0},wind[0xd0]={0};
  _Alignas(32) float positions[256][4],curves[4][256],eye[4],out[4]={0};
  uint32_t h[2],n,loop;float v[4];readin(h,8);readin(v,16);readin(wind+16,64);
  wind[80]=h[0]!=0;memcpy(wind+96,h+1,4);memcpy(wind+84,v,12);memcpy(wind+200,v+3,4);
  readin(eye,16);readin(&n,4);readin(&loop,4);if(n<2||n>256)return 6;
  memcpy(rail+0x28,&n,4);rail[0x2c]=loop!=0;readin(rail+0x50,64);
  readin(positions,n*16);for(unsigned j=0;j<4;j++)readin(curves[j],n*4);
  ptr(rail,0x90,positions);for(unsigned j=0;j<4;j++)ptr(rail,0xa0+j*8,curves[j]);ptr(wind,112,rail);
  memset(trace,0,sizeof(trace));float weight=0;
  ((void *(*)(void *,void *,void *,void *))0x100328810UL)(out,wind,eye,&weight);out[3]=weight;
  fwrite(out,4,4,stdout);fwrite(trace,4,3,stdout);
 }
 return 0;
}
