#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) float eye[4],directions[512*4];
static _Alignas(32) unsigned char records[512*128],objects[512*128],meshes[512*128],lights[512*32],fallback[16];
static void *cards[512];static void *position_output,*vertex_output;
static float trig[512*4];static unsigned acos_count,sincos_count,pow_count;
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t at,void *v){memcpy((char *)p+at,&v,8);}
static void word(void *p,size_t at,uint32_t v){memcpy((char *)p+at,&v,4);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void eye_get(void *out,void *camera){memcpy(out,camera,16);}
static float acos_capture(float v){float r=acosf(v);trig[acos_count++*4]=r;return r;}
struct Pair{float s,c;};static struct Pair sincos_capture(float v){struct Pair r;sincosf(v,&r.s,&r.c);trig[sincos_count*4+1]=r.s;trig[sincos_count++*4+2]=r.c;return r;}
static float pow_capture(float b,float e){float r=powf(b,e);trig[pow_count++*4+3]=r;return r;}
__attribute__((naked,noinline)) static void start_rotation(void){__asm__ volatile("mov position_output(%rip),%r13\nxor %r14d,%r14d\nlea -0x160(%rbp),%r15\nmov $0x3727c5ac,%eax\nvmovd %eax,%xmm3\nvxorps %xmm5,%xmm5,%xmm5\nmovabs $0x100220cc0,%rax\njmp *%rax");}
__attribute__((naked,noinline)) static void start_pack(void){__asm__ volatile("mov vertex_output(%rip),%r15\nlea fallback(%rip),%r14\nxor %ebx,%ebx\nmovabs $0x100220f90,%rax\njmp *%rax");}
__attribute__((naked,noinline)) static void finish(void){__asm__ volatile("add $0x178,%rsp\npop %rbx\npop %r12\npop %r13\npop %r14\npop %r15\npop %rbp\nret");}
__attribute__((naked,noinline)) static void run(void **list __attribute__((unused)),unsigned count __attribute__((unused))){__asm__ volatile("push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x178,%rsp\nmov %rdi,-0x38(%rbp)\nmov %rsi,-0x30(%rbp)\nlea eye(%rip),%r13\nlea directions(%rip),%r12\nmov %r12,-0xa0(%rbp)\nxor %r15d,%r15d\nlea -0x120(%rbp),%r14\nmovabs $0x100220bd0,%rax\njmp *%rax");}
static void *allocate(size_t n){void *p=0;if(posix_memalign(&p,32,n?n:32))exit(11);memset(p,0,n?n:32);return p;}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 hook(0x10076be90UL,eye_get);hook(0x100aa2576UL,acos_capture);hook(0x100aa250aUL,sincos_capture);hook(0x100aa2a2cUL,pow_capture);
 hook(0x100220c79UL,start_rotation);hook(0x100220ee3UL,start_pack);hook(0x100221213UL,finish);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned c=0;c<cases;c++){
  uint32_t count,total=0;readin(&count,4);if(count>512)return 5;readin(eye,12);eye[3]=1;readin(fallback,8);
  memset(records,0,sizeof(records));memset(objects,0,sizeof(objects));memset(meshes,0,sizeof(meshes));acos_count=sincos_count=pow_count=0;
  void *allocated[512*4];unsigned alloc_count=0;
  for(unsigned i=0;i<count;i++){
   unsigned char *rec=records+i*128,*obj=objects+i*128,*mesh=meshes+i*128;uint32_t vc,offset,baked;
   readin(&vc,4);readin(&offset,4);readin(&baked,4);if(vc>100000||offset>2000000)return 6;total=total>offset+vc?total:offset+vc;
   readin(obj+0x10,64);readin(obj+0x70,4);ptr(rec,0,obj);ptr(rec,8,mesh);word(rec,0x18,offset);word(mesh,0x34,vc);
   ((void *(*)(void *,void *))0x100076940UL)(rec+0x30,obj+0x10);
   void *positions=allocate(vc*16),*normal=allocate(vc*4),*uv=allocate(vc*16),*lighting=allocate(vc*12);
   allocated[alloc_count++]=positions;allocated[alloc_count++]=normal;allocated[alloc_count++]=uv;allocated[alloc_count++]=lighting;
   readin(positions,vc*16);readin(normal,vc*4);readin(uv,vc*16);readin(lighting,vc*12);
   ptr(mesh,0x60,positions);ptr(mesh,0x68,normal);ptr(mesh,0x70,uv);if(baked){ptr(lights+i*32,8,lighting);ptr(rec,0x10,lights+i*32);}cards[i]=rec;
  }
  position_output=allocate(total*16);vertex_output=allocate(total*28);if(count)run(cards,count);
  fwrite(&total,4,1,stdout);fwrite(directions,16,count,stdout);fwrite(trig,16,count,stdout);fwrite(position_output,16,total,stdout);fwrite(vertex_output,28,total,stdout);
  free(position_output);free(vertex_output);for(unsigned i=0;i<alloc_count;i++)free(allocated[i]);
 }
 return 0;
}
