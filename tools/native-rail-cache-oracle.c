#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static float trace[1024];static unsigned trace_count;
static float traced_atan2(float y,float x){float a=atan2f(y,x);trace[trace_count++]=y;trace[trace_count++]=x;trace[trace_count++]=a;return a;}
static void marker_world(void *out,void *ref){((void *(*)(void *,void *))0x10043e2d0UL)(out,(char *)ref-8);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t at,const void *v){memcpy((char *)p+at,&v,8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 // Only the generic metadata dispatch is replaced. Marker GetTransform and
 // GetObb, generic GetScale/matrix lengths and complete cache body execute.
 hook(0x1004d1e40UL,marker_world);hook(0x1004d2140UL,(void *)0x10043e470UL);hook(0x100aa25a0UL,traced_atan2);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  _Alignas(32) unsigned char rail[0x110]={0},markers[256][0x50]={0};
  _Alignas(32) float positions[256][4]={0},curves[4][256]={0};void *refs[256];
  uint32_t n,loop;readin(&n,4);readin(&loop,4);if(n<2||n>256)return 6;
  memcpy(rail+0x28,&n,4);rail[0x2c]=loop!=0;readin(rail+0x50,64);
  for(unsigned j=0;j<n;j++){readin(markers[j]+16,48);refs[j]=markers[j]+8;}
  ptr(rail,0x20,refs);ptr(rail,0x90,positions);for(unsigned j=0;j<4;j++)ptr(rail,0xa0+j*8,curves[j]);
  trace_count=0;((void (*)(void *))0x10055cf30UL)(rail);
  for(unsigned j=0;j<n;j++){
   _Alignas(16) float world[16],cached[7];
   ((void *(*)(void *,void *))0x10043e2d0UL)(world,markers[j]);
   memcpy(cached,positions[j],12);for(unsigned k=0;k<4;k++)cached[3+k]=curves[k][j];
   fwrite(world,4,16,stdout);fwrite(cached,4,7,stdout);fwrite(trace+j*3,4,3,stdout);
  }
 }
 return 0;
}
