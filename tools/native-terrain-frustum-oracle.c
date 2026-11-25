#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <immintrin.h>
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(uint32_t i=0;i<count;i++){
  _Alignas(32) float planes[24],half_axes[16];uint32_t csr;readin(&csr,4);readin(planes,sizeof planes);readin(half_axes,sizeof half_axes);
  _mm_setcsr(csr);uint32_t before=_mm_getcsr();
  // Complete original OBB test, without imports, callbacks or code patches.
  uint32_t visible=((uint8_t (*)(void *,void *))0x10015e420UL)(planes,half_axes);
  uint32_t after=_mm_getcsr();fwrite(&visible,4,1,stdout);fwrite(&before,4,1,stdout);fwrite(&after,4,1,stdout);
 }
 return 0;
}
