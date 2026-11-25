#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
typedef float pair __attribute__((vector_size(8)));
static uint8_t vertices[96*96*16];
uint8_t ocean_projection[80];
__attribute__((naked)) static void capture_projection(void){__asm__(
 "movdqu -0xa0(%rbp),%xmm0\nmovdqu %xmm0,ocean_projection(%rip)\n"
 "movdqu -0x80(%rbp),%xmm0\nmovdqu %xmm0,ocean_projection+16(%rip)\n"
 "movdqu -0x90(%rbp),%xmm0\nmovdqu %xmm0,ocean_projection+32(%rip)\n"
 "movdqu -0x60(%rbp),%xmm0\nmovdqu %xmm0,ocean_projection+48(%rip)\n"
 "movdqu -0x70(%rbp),%xmm0\nmovdqu %xmm0,ocean_projection+64(%rip)\n"
 "add $0xb0,%rsp\npop %rbx\npop %r12\npop %r14\npop %r15\npop %rbp\nret\n");}
static void *map_vertices(void *p){(void)p;return vertices;}
static pair sincos_pair(float v){return (pair){sinf(v),cosf(v)};}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void u32(void *p,uint32_t n){memcpy(p,&n,4);}
int main(int argc,char **argv){
 if(argc!=2&&argc!=3)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,file)!=0xd22000)return 5;fclose(file);
 if(argc==3&&!strcmp(argv[2],"--math")){
  struct {uint32_t kind;float a,b;} in;
  while(fread(&in,sizeof(in),1,stdin)==1){float out[2]={0,0};
   if(in.kind==1)out[0]=asinf(in.a);else if(in.kind==2){out[0]=sinf(in.a);out[1]=cosf(in.a);}else if(in.kind==3)out[0]=powf(in.a,in.b);
   else if(in.kind==4)__asm__("vrsqrtss %1,%1,%0":"=x"(out[0]):"x"(in.a));else return 8;
   if(fwrite(out,sizeof(out),1,stdout)!=1)return 6;
  }return ferror(stdin)?7:0;
 }
 hook(0x100795060UL,map_vertices);hook(0x100aa2588UL,asinf);hook(0x100aa250aUL,sincos_pair);hook(0x100aa2a2cUL,powf);
 int prefix=argc==3&&!strcmp(argv[2],"--prefix");if(prefix)hook(0x1004d6c28UL,capture_projection);
 _Alignas(32) uint8_t ocean[0x1400],camera[0x200],ambience[0x98000];float input[29];
 while(fread(input,sizeof(input),1,stdin)==1){
  memset(ocean,0,sizeof(ocean));memset(camera,0,sizeof(camera));memset(ambience,0,sizeof(ambience));memset(vertices,0xa5,sizeof(vertices));
  u32(ocean+0x1d8,2);u32(ocean+0x188,16);memcpy(camera+0xf0,input,16);memcpy(ambience+0x97080,input+4,16);memcpy(camera+0xc0,input+8,16);
  memcpy(camera+0x60,input+12,16);memcpy(camera+0x70,input+16,16);memcpy(camera+0x80,input+20,16);memcpy(camera+4,input+24,4);
  ((void(*)(void*,void*,void*,void*))0x1004d67d0UL)(ocean,camera,NULL,ambience);
  if(prefix){if(fwrite(ocean_projection,80,1,stdout)!=1)return 6;continue;}
  if(fwrite(ocean+0x134c,4,1,stdout)!=1||fwrite(vertices,sizeof(vertices),1,stdout)!=1)return 6;
 }return ferror(stdin)?7:0;
}
