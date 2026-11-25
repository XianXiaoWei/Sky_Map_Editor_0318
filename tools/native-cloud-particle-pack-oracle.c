#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char barn[0xc830];
static _Alignas(32) __attribute__((used)) float previous[3][1024], vectors[3][1024], eye[4], axis[3][4], depths[1024], shader_time;
static _Alignas(32) unsigned char output[1024*32];
static uint16_t order[1024];
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
__attribute__((naked,noinline)) static void finish(void){__asm__ volatile("add $0x2ee8,%rsp\npop %rbx\npop %r12\npop %r13\npop %r14\npop %r15\npop %rbp\nret");}
__attribute__((naked,noinline)) static void run(void){__asm__ volatile(
 "push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x2ee8,%rsp\n"
 "lea barn(%rip),%r12\nlea previous(%rip),%rcx\nmov %rcx,-0x2d68(%rbp)\nlea previous+4096(%rip),%rax\nmov %rax,-0x2dc0(%rbp)\nlea previous+8192(%rip),%r8\nmov %r8,-0x2db8(%rbp)\n"
 "lea vectors(%rip),%r13\nmov %r13,-0x2d60(%rbp)\nlea vectors+4096(%rip),%r15\nmov %r15,-0x2d78(%rbp)\nlea vectors+8192(%rip),%r14\nmov %r14,-0x2d70(%rbp)\n"
 "lea output(%rip),%rax\nmov %rax,-0x2d50(%rbp)\nlea depths(%rip),%rax\nmov %rax,-0x2d90(%rbp)\nvmovss shader_time(%rip),%xmm0\nvmovss %xmm0,-0x2dc4(%rbp)\n"
 "vmovaps eye(%rip),%xmm0\nvmovaps %xmm0,-0x2ee0(%rbp)\nvpermilps $0x55,%xmm0,%xmm1\nvmovaps %xmm1,-0x2ed0(%rbp)\nvpermilps $0xaa,%xmm0,%xmm1\nvmovaps %xmm1,-0x2ec0(%rbp)\n"
 "vmovaps axis(%rip),%xmm0\nvmovaps %xmm0,-0x2eb0(%rbp)\nvmovaps axis+16(%rip),%xmm0\nvmovaps %xmm0,-0x2ea0(%rbp)\nvmovaps axis+32(%rip),%xmm0\nvmovaps %xmm0,-0x2e90(%rbp)\n"
 "movabs $0x1002279f2,%rax\njmp *%rax");}
__attribute__((naked,noinline)) static void run_age(void){__asm__ volatile(
 "push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x2ee8,%rsp\n"
 "lea barn(%rip),%r12\nvmovss shader_time(%rip),%xmm0\nvmovaps %xmm0,-0x2db0(%rbp)\nmovabs $0x10022660f,%rax\njmp *%rax");}
int main(int argc,char **argv){
 if(argc!=2&&argc!=3)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2744UL,fmodf);hook(0x100227dddUL,finish);hook(0x1002266f5UL,finish);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned c=0;c<cases;c++){
  uint32_t count,start;readin(&count,4);
  if(argc==3&&strcmp(argv[2],"sort")==0){
   if(count>1024)return 5;readin(depths,count*4);for(unsigned j=0;j<count;j++)order[j]=j;
   float *keys=depths;((void (*)(void *,void *,void *))0x100229600UL)(order,order+count,&keys);fwrite(order,2,count,stdout);continue;
  }
  readin(&start,4);if(count>1024||start>=1024)return 5;
  if(argc==3){
   readin(&shader_time,4);memset(barn,0,sizeof(barn));readin(barn+0x8018,4096);memcpy(barn+0xc824,&start,4);memcpy(barn+0xc828,&count,4);
   run_age();fwrite(barn+0xc824,4,2,stdout);fwrite(barn+0x8018,4096,1,stdout);continue;
  }
  if(!count)return 5;
  readin(&shader_time,4);readin(eye,12);float forward[3];readin(forward,12);for(unsigned j=0;j<3;j++)axis[j][0]=forward[j];
  memset(barn,0,sizeof(barn));memset(output,0xa5,sizeof(output));memcpy(barn+0xc824,&start,4);memcpy(barn+0xc828,&count,4);
  for(unsigned i=0;i<count;i++){
   float p[14];readin(p,sizeof(p));unsigned slot=(start+i)&1023;
   for(unsigned j=0;j<3;j++){memcpy(barn+0x18+j*0x1000+slot*4,p+j,4);previous[j][slot]=p[3+j];vectors[j][slot]=p[6+j];}
   memcpy(barn+0x3018+slot*4,p+9,4);memcpy(barn+0x8018+slot*4,p+10,4);memcpy(barn+0x9018+slot*12,p+11,12);
  }
  run();fwrite(output,32,count,stdout);fwrite(depths,4,count,stdout);
 }
 return 0;
}
