/* Original LevelMaterial/LevelModelBarn/MaterialDef function bodies are
 * unmodified. Heap, libc, metadata, assertion/fatal, Object vtable repair and Beamo
 * rebuild are explicit host dependencies. Default caller stack tail bytes
 * are masked separately; standalone uniform replay compares every byte. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static jmp_buf escape;
static uint32_t errors,line,severity,rebuilds,updates,mutate_at,new_count;
static uint64_t guard=0x3180beef,material_meta[8],param_meta[8],object_meta[8];
static uint8_t *state=(void *)0x220000000UL,*table=(void *)0x210000000UL;
static uint64_t update_log[1024],rebuild_pointer;
static void assertion(const char *expr,const char *file,uint32_t ln,uint32_t sv,...){
 (void)expr;(void)file;errors++;line=ln;severity=sv;longjmp(escape,1);
}
static void *heap(void){return (void *)1;}
static void *allocate(void *h,size_t n){(void)h;void *p=calloc(1,n?n:1);if(!p)exit(11);return p;}
static void release(void *h,void *p){(void)h;free(p);}
static void rebuild(void *p){rebuilds++;rebuild_pointer=(uintptr_t)p;}
static void update(void *p){
 if(updates>=1024)exit(12);
 update_log[updates++]=(uintptr_t)p;
 if(updates-1==mutate_at)memcpy(state+0x2028,&new_count,4);
}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void bind(uintptr_t at,void *fn){int32_t rel;memcpy(&rel,(void *)(at+2),4);memcpy((void *)(at+6+rel),&fn,8);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(const void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
static uint32_t u32(void *p){uint32_t n;memcpy(&n,p,4);return n;}
static uint64_t u64(void *p){uint64_t n;memcpy(&n,p,8);return n;}
static const char *string(uint8_t *p){return p[0]&1?(char *)(uintptr_t)u64(p+16):(char *)p+1;}
static void initial_string(uint32_t at,const char *text,size_t n){
 uint8_t *p=state+at;memset(p,0,24);
 if(n<23){p[0]=n*2;memcpy(p+1,text,n);}
 else {uint64_t cap=(n+16)&~15UL,len=n;char *data=calloc(1,cap);memcpy(data,text,n);uint64_t ptr=(uintptr_t)data;cap|=1;memcpy(p,&cap,8);memcpy(p+8,&len,8);memcpy(p+16,&ptr,8);}
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,f)!=0xd22000)return 4;
 fclose(f);
 if(mmap(state,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED||mmap(table,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 memcpy((void *)0x102002fb0UL,&(uintptr_t){(uintptr_t)material_meta},8);memcpy((void *)0x102002f50UL,&(uintptr_t){(uintptr_t)param_meta},8);
 memcpy((void *)0x102047f70UL,&(uintptr_t){(uintptr_t)object_meta},8);memcpy((void *)0x1020058c8UL,&table,8);memcpy((void *)0x100c0d8d8UL,&(uintptr_t){(uintptr_t)&guard},8);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);
 hook(0x1007e50d0UL,heap);hook(0x1007e5790UL,allocate);hook(0x1007e5db0UL,release);hook(0x100194dd0UL,rebuild);hook(0x1007abd80UL,update);
 bind(0x100aa2c7eUL,strlen);bind(0x100aa28f4UL,memcpy);bind(0x100aa28faUL,memmove);
 if(mprotect(mem,0xc05000,PROT_READ|PROT_EXEC))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[8];uint8_t color[16];rd(h,sizeof(h));rd(color,16);
  uint32_t kind=h[0],len=h[1],initial=h[5];if(kind>9||len>0x10000||initial>600)return 9;
  rd(state,len);if(kind==8||kind==7)rd(table,0x34d0);
  for(uint32_t i=0;i<initial;i++){uint32_t sh[2];rd(sh,8);if(sh[0]+24>len||sh[1]>4096)return 9;char *text=calloc(1,sh[1]+1);rd(text,sh[1]);initial_string(sh[0],text,sh[1]);free(text);}
  for(uint32_t i=0;i<h[6];i++){uint32_t sh[2];rd(sh,8);if(sh[0]<0x34d0||sh[0]+sh[1]+1>0x10000)return 9;rd(table+sh[0],sh[1]);table[sh[0]+sh[1]]=0;}
  memcpy((uint8_t *)material_meta+0x38,h+2,4);memcpy((uint8_t *)param_meta+0x38,h+3,4);memcpy((void *)0x10203f6b0UL,color,16);
  errors=line=severity=rebuilds=updates=0;rebuild_pointer=0;mutate_at=h[2];new_count=h[3];volatile uint32_t result=0xffffffff;
  if(!setjmp(escape)){
   switch(kind){
    case 0:((void (*)(void *))0x100407ce0UL)(state);break;
    case 1:{void *p=((void *(*)(void *))0x100407c80UL)(state);result=(uint8_t *)p-state;break;}
    case 2:{void *p=((void *(*)(void *,uint32_t))0x100408960UL)(state,h[2]);result=p?(uint8_t *)p-state:0xffffffff;break;}
    case 3:((void (*)(void *,uint32_t))0x100407a40UL)(state,h[2]);break;
    case 4:((void (*)(void *,uintptr_t,uintptr_t,uintptr_t))0x100407ae0UL)(state,h[2],h[3],h[4]);break;
    case 5:((void (*)(void *))0x100407b90UL)(state);break;
    case 6:result=((uint32_t (*)(void *,void *,uint32_t))0x100443a70UL)(state,state+0x1a0,h[2]);break;
    case 7:{void *p=((void *(*)(void *,uint32_t))0x1004434f0UL)(table,h[2]);result=(uint8_t *)p-table;break;}
    case 8:
     if(h[3]==0)((void (*)(void *,uint32_t))0x100408360UL)(state+0x2030,h[2]);
     else if(h[3]==1)((void (*)(void *))0x100407b70UL)(state);
     else if(h[3]==2)((void (*)(void *))0x100408330UL)(state);
     else ((void (*)(void *))0x100407a70UL)(state+0x2030+h[4]*0x6f0);
     break;
    case 9:((void (*)(void *))0x100407b20UL)(state);break;
   }
  }
  uint32_t strings_count=0,masked=0;
  // Canonicalize only std::string storage and numeric lanes not written by
  // the generator. String CONTENTS and every remaining state byte are output.
  if(kind==8)strings_count=h[2]*34;
  uint32_t out[]={errors,line,severity,result,rebuilds,updates,len,strings_count};wr(out,sizeof(out));wr(&rebuild_pointer,8);wr(update_log,updates*8);
  uint8_t *copy=malloc(len);memcpy(copy,state,len);
  if(kind==8)for(uint32_t i=0;i<h[2];i++){
   uint32_t root=0x2030+i*0x6f0;memset(copy+root+8,0,24);memset(copy+root+0x28,0,24);
   for(uint32_t j=0;j<16;j++){memset(copy+root+0xf0+j*0x60+8,0,24);memset(copy+root+0xf0+j*0x60+0x40,0,24);}
   if(!errors&&!state[root+0x20]){
    _Alignas(32) uint8_t scratch[21*32]={0};uint8_t id=state[root+0x21];uint32_t index=u32(table+0x30d0+id*4);
    uint32_t n=((uint32_t (*)(void *,void *,uint32_t))0x100443a70UL)(table+0x10+index*0x1a0,scratch,21);
    for(uint32_t j=0;j<n;j++){uint32_t type=u32(scratch+j*32+8);if(type<4){uint32_t off=root+0xf0+j*0x60+0x30+type*4;memset(copy+off,0,16-type*4);masked+=16-type*4;}}
   }
  }
  wr(copy,len);free(copy);wr(&masked,4);
  if(kind==8)for(uint32_t i=0;i<h[2];i++){
   uint32_t root=0x2030+i*0x6f0,offsets[34];offsets[0]=root+8;offsets[1]=root+0x28;
   for(uint32_t j=0;j<16;j++){offsets[2+j*2]=root+0xf0+j*0x60+8;offsets[3+j*2]=root+0xf0+j*0x60+0x40;}
   for(uint32_t j=0;j<34;j++){const char *str=string(state+offsets[j]);uint32_t n=strlen(str);wr(&offsets[j],4);wr(&n,4);wr(str,n);}
  }
 }
 return 0;
}
