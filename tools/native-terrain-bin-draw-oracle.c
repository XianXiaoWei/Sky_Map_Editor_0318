#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void put_pointer(uint8_t *model,size_t at,void *p){memcpy(model+at,&p,sizeof p);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(uint32_t i=0;i<count;i++){
  uint32_t bins,enabled,calls;readin(&bins,4);readin(&enabled,4);readin(&calls,4);
  if(bins==0||bins>1024||calls>4096)return 5;
  _Alignas(32) uint8_t model[0x600],original[0x600];readin(model,sizeof model);memcpy(original,model,sizeof model);
  size_t block_bytes=(size_t)bins*0x3e0+64,packet_bytes=(size_t)bins*0x80+64,lod_bytes=(size_t)bins*2+64;
  uint8_t *blocks=malloc(block_bytes),*packets=malloc(packet_bytes),*lods=malloc(lod_bytes),*pending=malloc(lod_bytes);
  if(!blocks||!packets||!lods||!pending)return 6;
  readin(blocks,block_bytes);readin(packets,packet_bytes);readin(lods,lod_bytes);readin(pending,lod_bytes);
  put_pointer(model,0x1c8,enabled?blocks:NULL);put_pointer(model,0x1d0,packets);put_pointer(model,0x1a8,lods);put_pointer(model,0x1b0,pending);
  for(uint32_t call=0;call<calls;call++){
   uint32_t bin;readin(&bin,4);if(bin>=bins)return 7;
   // Complete original body, without patches, imports or callbacks. Barn is
   // unused; vertex/index pointer tokens are copied/added, never dereferenced.
   ((void (*)(void *,void *,uint32_t))0x1006a7b50UL)(NULL,model,bin);
   fwrite(blocks,1,block_bytes,stdout);fwrite(lods,1,lod_bytes,stdout);fwrite(pending,1,lod_bytes,stdout);
  }
  fwrite(packets,1,packet_bytes,stdout);
  // Remove only harness pointer substitutions before comparing model bytes.
  for(size_t at=0x1a8;at<=0x1d0;at+=8)if(at!=0x1b8&&at!=0x1c0)memcpy(model+at,original+at,8);
  fwrite(model,1,sizeof model,stdout);
  free(blocks);free(packets);free(lods);free(pending);
 }
 return 0;
}
