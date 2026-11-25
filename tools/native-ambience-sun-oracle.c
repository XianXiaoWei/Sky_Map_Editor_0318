#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>

/* Original derived-sun instructions and helper bodies; only camera and libm
 * services and selected continuation are routed. Full update isn't executed. */
static uint32_t trace[64][4], count;
static void fault(int signal, siginfo_t *info, void *context){ucontext_t *c=context;fprintf(stderr,"native signal %d pc=%llx address=%llx rsp=%llx rbp=%llx\n",signal,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],(unsigned long long)(uintptr_t)info->si_addr,(unsigned long long)c->uc_mcontext.gregs[REG_RSP],(unsigned long long)c->uc_mcontext.gregs[REG_RBP]);exit(100);}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float record(uint32_t op,float a,float b,float result){uint32_t v[]={op,bits(a),bits(b),bits(result)};if(count==64)exit(10);memcpy(trace[count++],v,16);return result;}
static float traced_sin(float a){return record(0,a,0,sinf(a));}
static float traced_cos(float a){return record(1,a,0,cosf(a));}
static float traced_pow(float a,float b){return record(2,a,b,powf(a,b));}
static float traced_exp(float a){return record(3,a,0,expf(a));}
static float traced_exp2(float a){return record(4,a,0,exp2f(a));}
static void camera(void *out,void *in){memcpy(out,in,16);}
static void hook(uint64_t at,void *fn){uint8_t p[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(p+2,&fn,8);memcpy((void *)at,p,12);}
static void bind_import(uint64_t at,void *fn){uint8_t *p=(void *)at;int32_t offset;if(p[0]!=0xff||p[1]!=0x25)exit(11);memcpy(&offset,p+2,4);memcpy((void *)(at+6+offset),&fn,8);}
static uint32_t base_meta_calls;
static void *base_meta(void){base_meta_calls++;return (void *)0x10203f6f0UL;}
static void putptr(void *at,void *p){memcpy(at,&p,8);}
extern void run_sun(void *,void *);
__asm__(".text\nrun_sun:\n push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n sub $0x9a0,%rsp\n lea 0x988(%rsp),%rbp\n mov %rdi,%r14\n mov %rsi,-0x888(%rbp)\n movl $0,-0x944(%rbp)\n movabs $0x10005b39c,%r11\n call *%r11\n add $0x9a0,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");
int main(int argc,char **argv){
 struct sigaction handler={0};handler.sa_sigaction=fault;handler.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&handler,NULL);
 if(argc!=2&&(argc!=3||strcmp(argv[2],"--envnode")))return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(memory==MAP_FAILED||fread(memory,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 bind_import(0x100aa2bcaUL,traced_sin);bind_import(0x100aa260cUL,traced_cos);bind_import(0x100aa2a2cUL,traced_pow);bind_import(0x100aa2708UL,traced_exp);bind_import(0x100aa2702UL,traced_exp2);hook(0x10076be90UL,camera);
 *(uint8_t *)0x10005b6e2UL=0xc3;
 ((void (*)(void))0x10077dcb0UL)();fwrite((void *)0x10203f6b0UL,16,1,stdout);
 uint32_t cases;if(fread(&cases,4,1,stdin)!=1)return 5;fwrite(&cases,4,1,stdout);
 if(argc==3){
  hook(0x1007abc10UL,base_meta);
  uint64_t globals[]={0x101df2510UL,0x101df0708UL,0x101d6e350UL,0x101d6e3b0UL,0x101d6e410UL,0x101d6e470UL,0x101d6e4d0UL,0x101d6e530UL,0x101de1b10UL,0x101df7098UL};
  for(uint32_t c=0;c<cases;c++){
   _Alignas(16) uint8_t meta[10][0x40]={{0}},storage[0x410],raw[0x410],mask[0x410];uint32_t ids[10];
   if(fread(ids,sizeof ids,1,stdin)!=1||fread(storage,sizeof storage,1,stdin)!=1||fread(raw,sizeof raw,1,stdin)!=1||fread(mask,sizeof mask,1,stdin)!=1)return 6;
   for(int i=0;i<10;i++){memcpy(meta[i]+0x38,ids+i,4);putptr((void *)globals[i],meta[i]);}
   base_meta_calls=0;((void (*)(void *))0x10031c830UL)(storage);
   fwrite(storage,sizeof storage,1,stdout);for(int i=0;i<0x410;i++)if(mask[i])storage[i]=raw[i];fwrite(storage,sizeof storage,1,stdout);fwrite(&base_meta_calls,4,1,stdout);
  }
  return 0;
 }
 for(uint32_t c=0;c<cases;c++){
  _Alignas(32) uint8_t ambience[0x97100]={0};float values[40];uint32_t cheap;
  if(fread(values,sizeof values,1,stdin)!=1||fread(&cheap,4,1,stdin)!=1)return 6;
  memcpy(ambience+0x20,values,16);memcpy(ambience+0x30,values+4,8);memcpy(ambience+0x3c,values+6,4);memcpy(ambience+0xb0,values+7,4);
  ambience[0x110]=cheap;for(int i=0;i<5;i++)memcpy(ambience+0xa0-i*16,values+8+i*4,16);
  memcpy(ambience+0x97080,values+32,16);memcpy((void *)0x10203f6b0UL,values+36,16);
  count=0;run_sun(ambience,values+28);
  fwrite(ambience+0x290,16,1,stdout);fwrite(ambience+0xc60,16,1,stdout);fwrite(ambience+0x20,16,1,stdout);fwrite(ambience+0xc70,4,1,stdout);
  fwrite(&count,4,1,stdout);fwrite(trace,16,count,stdout);
 }
 return 0;
}
