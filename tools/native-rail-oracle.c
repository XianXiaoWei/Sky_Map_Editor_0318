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
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2744UL,fmodf);hook(0x100aa250aUL,traced_sincos);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  _Alignas(32) unsigned char rail[0x110]={0};
  _Alignas(32) float positions[256][4],curves[4][256],eye[4],out[32]={0},p[4];
  uint32_t n,loop;float t;
  readin(&n,4);readin(&loop,4);if(n<2||n>256)return 6;
  memcpy(rail+0x28,&n,4);rail[0x2c]=loop!=0;
  readin(&t,4);readin(eye,16);readin(rail+0x50,64);
  readin(positions,n*16);for(unsigned j=0;j<4;j++)readin(curves[j],n*4);
  ptr(rail,0x90,positions);for(unsigned j=0;j<4;j++)ptr(rail,0xa0+j*8,curves[j]);
  out[0]=((float (*)(void *,void *,void *))0x10055d820UL)(rail,eye,p);memcpy(out+1,p,12);
  ((void *(*)(void *,void *,float))0x10055e420UL)(p,rail,t);memcpy(out+4,p,12);
  for(unsigned j=0;j<4;j++)out[8+j]=((float (*)(void *,unsigned,unsigned,float))0x1005609d0UL)(curves[j],n,loop,t);
  ((void *(*)(void *,void *,float))0x100560b40UL)(out+12,rail,t);
  out[28]=((float (*)(void *,void *,void *))0x100789ac0UL)(eye,positions,positions+1);
  fwrite(out,4,29,stdout);fwrite(trace,4,3,stdout);
 }
 return 0;
}
