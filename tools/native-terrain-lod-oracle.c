#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <immintrin.h>
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void *aligned(size_t n){void *p=NULL;if(posix_memalign(&p,32,n?n:32))exit(11);return p;}
static void jump(uintptr_t at,void *target){
 static uintptr_t slot=0x102300000UL;uint8_t code[6]={0xff,0x25};int32_t displacement=(int32_t)(slot-at-6);
 memcpy(code+2,&displacement,4);memcpy((void *)slot,&target,8);slot+=8;memcpy((void *)at,code,6);
}
extern void terrain_lod_span(uint32_t,void *,void *,void *,uint32_t,void *);
extern void terrain_lod_return(void);
// Delimit only the numeric bin decision spans. No whole TerrainBarn claim.
__asm__(".text\nterrain_lod_span:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\n"
 "and $-32,%rsp\nsub $0x1c0,%rsp\nmov %rsi,%r14\nmov %rdx,%r13\nmov %rcx,%rbx\nmov %r8d,%r12d\n"
 "vmovups (%r9),%xmm0\nvmovaps %xmm0,0x100(%rsp)\ntest %r8d,%r8d\nje terrain_lod_return\n"
 "test %edi,%edi\nje 1f\nmov %r8d,%eax\nmovabs $0x1006a3274,%r11\njmp *%r11\n"
 "1:\nmovabs $0x1006a3118,%r11\njmp *%r11\n"
 "terrain_lod_return:\nlea -32(%rbp),%rsp\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nvzeroupper\nret\n");
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);jump(0x1006a3217UL,terrain_lod_return);jump(0x1006a331fUL,terrain_lod_return);
 uint32_t groups;readin(&groups,4);fwrite(&groups,4,1,stdout);
 for(uint32_t g=0;g<groups;g++){
  uint32_t p[3];readin(p,sizeof p);uint32_t mode=p[0],count=p[1],csr=p[2];if(mode>1||count>1000000)return 5;
  _Alignas(32) unsigned char state[0x200]={0};_Alignas(32) float eye[4];float minimum;
  float *spheres=aligned(count*16);uint32_t *statuses=aligned(count*4);uint16_t *output=aligned((count+8)*2);
  readin(state,12);readin(&minimum,4);readin(eye,sizeof eye);readin(spheres,count*16);readin(statuses,count*4);readin(output,(count+8)*2);
  memcpy(state+0x1a0,&spheres,8);memcpy(state+0x1a8,&output,8);memcpy(state+0x1d8,&count,4);memcpy((void *)0x102033378UL,&minimum,4);
  _mm_setcsr(csr);uint32_t before=_mm_getcsr();terrain_lod_span(mode,state,statuses,output,count,eye);uint32_t after=_mm_getcsr();
  fwrite(&before,4,1,stdout);fwrite(&after,4,1,stdout);fwrite(output,(count+8)*2,1,stdout);
  free(spheres);free(statuses);free(output);
 }
 return 0;
}
