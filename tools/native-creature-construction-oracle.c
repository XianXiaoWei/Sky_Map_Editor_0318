#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x410000000UL;
static uint64_t trace[256][2],metadata_functions[4];static uint32_t calls,mutation;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void *metadata(uint32_t i,uintptr_t fn){trace[calls][0]=fn;trace[calls++][1]=0;if(calls==mutation){uint32_t v=0x12345678;memcpy(arena+0x8038,&v,4);}return arena+0xc000+i*256;}
static void *m0(void){return metadata(0,metadata_functions[0]);}
static void *m1(void){return metadata(1,metadata_functions[1]);}
static void *m2(void){return metadata(2,metadata_functions[2]);}
static void *m3(void){return metadata(3,metadata_functions[3]);}
int main(int argc,char**argv){
 if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,65536,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 uint32_t metadata_count;rd(&metadata_count,4);if(metadata_count>4)return 9;rd(metadata_functions,metadata_count*8);void*callbacks[]={m0,m1,m2,m3};for(uint32_t i=0;i<metadata_count;i++)hook(metadata_functions[i],callbacks[i]);
 uint32_t global_count;rd(&global_count,4);if(global_count>128)return 7;
 uint64_t globals[128];uint32_t sizes[128];for(uint32_t i=0;i<global_count;i++){rd(&globals[i],8);rd(&sizes[i],4);if(globals[i]<0x100000000UL||globals[i]+sizes[i]>0x102400000UL)return 8;}
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){uint64_t fn;uint32_t repeat;rd(&fn,8);rd(&repeat,4);rd(&mutation,4);rd(arena,65536);for(uint32_t i=0;i<global_count;i++)rd((void*)globals[i],sizes[i]);
  calls=0;void*result=0;for(uint32_t i=0;i<repeat;i++)result=((void*(*)(void*,void*))fn)(arena+0x1000+i*0x2000,arena+0x1000+i*0x2000);
  wr(&result,8);wr(&calls,4);wr(trace,calls*16);wr(arena,65536);
 }return 0;
}
