/* Unmodified Meta ID/name lookup, vtable repair and Float construction/release.
 * Virtual metadata conversion/construction/destruction/casting and libc/heap
 * are explicit services. Full registry startup and class casts remain open. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t *registry=(void *)0x230000000UL,*objects=(void *)0x240000000UL,*event_barn=(void *)0x260000000UL;
static uintptr_t vt[32];
static uint8_t *scratch_storage=(void *)0x280000000UL;
static uint32_t pool_cursor,frame_count,frame_sequences[256];
static uint8_t frame_objects[256][0x200];
static uint64_t guard=0x3180beef;
static uint32_t math_count,math_pairs[512][2];
static jmp_buf escape;
static uint32_t error_line,severity,log_count,log_entries[4096][3],allocation_cursor,current_kind;
static uint64_t u64(const void *p){uint64_t v;memcpy(&v,p,8);return v;}
static uint32_t u32(const void *p){uint32_t v;memcpy(&v,p,4);return v;}
static void log_service(uint32_t op,void *meta,uint32_t arg){
 if(log_count>=4096)exit(12);log_entries[log_count][0]=op;log_entries[log_count][1]=meta?(uint8_t *)meta-registry:0;log_entries[log_count++][2]=arg;
}
static void *as_class(void *meta){log_service(1,meta,0);return ((uint8_t *)meta)[0x62]?NULL:meta;}
static uint8_t is_abstract(void *meta){log_service(2,meta,0);return ((uint8_t *)meta)[0x60];}
static uint8_t is_polymorphic(void *meta){log_service(3,meta,0);return ((uint8_t *)meta)[0x61];}
static void *construct(void *meta){log_service(4,meta,0);memcpy(objects+0x100,(uint8_t *)meta+0x68,8);return objects+0x100;}
static void destroy(void *meta,void *object){log_service(5,meta,(uint8_t *)object-objects);}
static void *cast_object(void *meta,void **object){log_service(6,meta,*object?1:0);return current_kind==16?(meta==registry+0x5300?(uint8_t *)*object-8:*object):objects+u32((uint8_t *)meta+0x70);}
static void *allocate(size_t n){log_service(7,NULL,n);return objects;}
static void release(void *p){log_service(8,NULL,(uint8_t *)p-objects);}
static void *parent(void){log_service(11,registry+0x5200,0);return (void *)(uintptr_t)u64(registry+0x5280);}
static void convert(void *meta,void **out,void *in,void *source){
 log_service(9,meta,(uint8_t *)source-registry);
 void *value=meta==registry+0x5500||meta==registry+0x5600?in:*(void **)in;
 if(current_kind==16&&meta==registry+0x5000&&value==objects+0x80){*out=(uint8_t *)value+8;return;}
 if(current_kind==16&&meta==registry+0x5400&&registry[0x6f06]==3){*out=NULL;return;}
 *out=meta==registry+0x5600?(registry[0x6f03]?NULL:value):
  meta==registry+0x5700?(registry[0x6f04]?NULL:value):
  (value==registry+0x7300&&registry[0x6f01])||(value==objects&&registry[0x6f02])?NULL:value;
}
static void *return_type(void){log_service(10,NULL,0);return registry+0x5500;}
static void invoke(uintptr_t method,uintptr_t adjust,void *receiver,void **out,void *result_type,void **args,uint32_t count){
 (void)adjust;(void)result_type;
 if(current_kind==16&&method==3){
  if(receiver!=event_barn||count!=1||*(void **)args[0]!=registry+0x5300||!out)exit(13);
  log_service(12,NULL,(3<<16)|1);log_service(13,*(void **)args[0],0);
  *out=((void *(*)(void *,void *))(registry[0x6f09]?0x10032ecf0UL:0x100039f40UL))(event_barn,registry+0x5300);return;
 }
 if(current_kind==16&&method==2&&receiver==event_barn){
  log_service(12,NULL,(2<<16)|1);log_service(14,NULL,*(void **)args[0]?1:0);
  ((void (*)(void *,void *,void *))0x10032f350UL)(event_barn,event_barn+0x30,NULL);return;
 }
 if(receiver!=(registry[0x6f05]?registry+0xa000:registry+0x7300)||(method!=1&&method!=2))exit(13);
 log_service(12,NULL,((uint32_t)method<<16)|count);
 if(count){if(method==2)log_service(14,NULL,*(void **)args[0]?1:0);else log_service(13,*(void **)args[0],0);}
 if(registry[0x6f05]){
  if(method==1){if(!count||!out)exit(13);*out=((void *(*)(void *,void *))0x100716250UL)(receiver,*(void **)args[0]);}
  else ((void (*)(void *,void *))0x100716360UL)(receiver,*(void **)args[0]);
 }else if(out)*out=registry[0x6f00]?NULL:objects;
}
static uint64_t value_size(void *meta){log_service(15,meta,0);return current_kind==16&&meta==registry+0x5300?(registry[0x6f0a]==1?96:registry[0x6f0a]==2?88:80):24;}
static uint64_t value_alignment(void *meta){log_service(16,meta,0);return 8;}
static void *value_allocate(void *heap,uint64_t size,void *label,uint64_t alignment){
 log_service(17,heap,size);log_service(18,label,alignment);return heap==registry+0x5b00?scratch_storage:heap==event_barn+0x5040?objects+0x80:objects+32*allocation_cursor++;
}
static void *value_construct(void *meta,void *storage){
 log_service(19,meta,(uint8_t *)storage-objects);
 return ((void *(*)(void *,void *))(current_kind==16&&meta==registry+0x5300?(registry[0x6f0a]==1?0x100719390UL:registry[0x6f0a]==2?0x1007175d0UL:0x100719090UL):0x100716930UL))(meta,storage);
}
static void value_release(void *heap,void *value){if(heap==registry+0x5b00){if(value!=scratch_storage)exit(15);log_service(30,heap,0);}else log_service(20,heap,(uint8_t *)value-objects);}
static void value_clear(void *heap){log_service(21,heap,0);}
static void *get_pool(void){log_service(23,NULL,0);return registry+0x5a00;}
static void *pool_allocate(void *pool,uint64_t size){if(pool!=registry+0x5a00||size!=40||pool_cursor+size>0x10000)exit(14);void *node=registry+pool_cursor;pool_cursor+=size;log_service(24,pool,(uint8_t *)node-registry);return node;}
static void pool_release(void *pool,void *node){if(pool!=registry+0x5a00)exit(14);log_service(25,pool,(uint8_t *)node-registry);}
static uint32_t max_type_index(void *event){
 uint32_t maximum=u32(registry+0xed08);log_service(26,NULL,maximum);
 if(u32(registry+0xed0c)!=0xffffffff){uint8_t *node=(void *)(uintptr_t)u64(event_barn+0x20);while(node){uint32_t key=u32(node+28);if(key==8){node[32]=(uint8_t)u32(registry+0xed0c);break;}node=(void *)(uintptr_t)u64(node+(key>8?0:8));}}
 return maximum==255?((uint32_t (*)(void *))0x10032f1d0UL)(event):maximum;
}
static void *scratch_heap(void){log_service(28,NULL,0);return registry+0x5b00;}
static uint32_t heap_used(void *heap){if(heap!=event_barn+0x85098)exit(16);log_service(29,NULL,u32(registry+0xed18));return u32(registry+0xed18);}
static void snapshot(void){if(frame_count>=256)exit(17);memcpy(frame_objects[frame_count],objects,0x200);frame_sequences[frame_count++]=u32(event_barn+0x10);}
static float record_math(float input,float result){if(math_count>=512)exit(18);memcpy(math_pairs[math_count],&input,4);memcpy(math_pairs[math_count++]+1,&result,4);return result;}
static float host_log(float input){return record_math(input,logf(input));}
static float host_exp(float input){return record_math(input,expf(input));}
static void assertion(const char *expr,const char *file,uint32_t line,uint32_t sev,...){(void)expr;(void)file;error_line=line;severity=sev;longjmp(escape,1);}
static void hook(uintptr_t at,void *fn){uint8_t jump[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(jump+6,&fn,8);memcpy((void *)at,jump,14);}
static void bind(uintptr_t stub,void *fn){int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
static void foundation_resolve(void);
__asm__(
 ".text\nfoundation_resolve:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r14\npush %r15\nsub $0x1600,%rsp\n"
 "movabs $0x23000d48c,%rax\nmov (%rax),%eax\nmov %eax,0x157c(%rsp)\n"
 "movabs $0x23000e600,%rax\nmov %rax,0x1570(%rsp)\n"
 "movabs $0x23000e800,%rax\nmov %rax,0xf0(%rsp)\n"
 "movabs $0x10040d2aa,%rax\njmp *%rax\n"
 ".globl foundation_resolve_return\nfoundation_resolve_return:\nadd $0x1600,%rsp\npop %r15\npop %r14\npop %r12\npop %rbx\npop %rbp\nret\n"
);
extern void foundation_resolve_return(void);
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED||fread(text,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 if(mmap(registry,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED||mmap(objects,0x1000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 if(mmap(event_barn,0x105100,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 memcpy((void *)0x102047c70UL,&registry,8);
 memcpy((void *)0x102047f10UL,&(uintptr_t){(uintptr_t)(registry+0x5000)},8);
 memcpy((void *)0x102047f70UL,&(uintptr_t){(uintptr_t)(registry+0x5000)},8);
 memcpy((void *)0x10203aa30UL,&(uintptr_t){(uintptr_t)(registry+0x5100)},8);
 memcpy((void *)0x102047fd0UL,&(uintptr_t){(uintptr_t)(registry+0x5100)},8);
 memcpy((void *)0x102048090UL,&(uintptr_t){(uintptr_t)(registry+0x5600)},8);
 memcpy((void *)0x10203a998UL,&(uintptr_t){(uintptr_t)(registry+0x5700)},8);
 memcpy((void *)0x10203ac88UL,&(uintptr_t){(uintptr_t)(registry+0x5800)},8);
 memcpy((void *)0x10203b1f0UL,&(uintptr_t){(uintptr_t)(registry+0x5300)},8);
 memcpy((void *)0x10203b270UL,&(uintptr_t){(uintptr_t)(registry+0x5300)},8);
 memcpy((void *)0x10203ad50UL,&(uintptr_t){(uintptr_t)(registry+0x5300)},8);
 memcpy((void *)0x101df4208UL,&(uintptr_t){(uintptr_t)(registry+0x5400)},8);
 memcpy((void *)0x101df4858UL,&(uintptr_t){(uintptr_t)(registry+0x5800)},8);
 memcpy((void *)0x102048b50UL,&(uintptr_t){(uintptr_t)(registry+0x5800)},8);
 memcpy((void *)0x100c0d8d8UL,&(uintptr_t){(uintptr_t)&guard},8);
 memcpy((void *)(0x100d0cbf8UL+0x60),&(uintptr_t){(uintptr_t)max_type_index},8);
 memcpy((void *)(0x100d0cdd8UL+0x60),&(uintptr_t){(uintptr_t)max_type_index},8);
 memcpy((void *)(0x100d0c0b8UL+0x60),&(uintptr_t){(uintptr_t)max_type_index},8);
 if(mmap(scratch_storage,0x3000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 vt[0x40/8]=(uintptr_t)convert;
 vt[0x68/8]=(uintptr_t)as_class;vt[0x90/8]=(uintptr_t)is_abstract;vt[0x98/8]=(uintptr_t)is_polymorphic;
 vt[0xb0/8]=(uintptr_t)construct;vt[0xb8/8]=(uintptr_t)destroy;vt[0xd8/8]=(uintptr_t)cast_object;
 vt[0xa0/8]=(uintptr_t)value_size;vt[0xa8/8]=(uintptr_t)value_alignment;vt[0xc0/8]=(uintptr_t)value_construct;
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);bind(0x100aa2c4eUL,strcmp);bind(0x100aa2498UL,allocate);bind(0x100aa248cUL,release);
 bind(0x100aa24aaUL,bzero);hook(0x100795530UL,value_allocate);hook(0x100795a70UL,value_release);hook(0x100795650UL,value_clear);
 hook(0x102310000UL,parent);
 hook(0x1007e50d0UL,get_pool);hook(0x1007e5790UL,pool_allocate);hook(0x1007e5db0UL,pool_release);
 hook(0x1007c6c20UL,scratch_heap);hook(0x100795b00UL,heap_used);
 bind(0x100aa2858UL,host_log);bind(0x100aa2708UL,host_exp);
 hook(0x10040d311UL,foundation_resolve_return);bind(0x100aa28f4UL,memcpy);bind(0x100aa2900UL,memset);
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC))return 6;
 if(mprotect((void *)0x102310000UL,4096,PROT_READ|PROT_EXEC))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[4];rd(h,16);if(h[0]>20||h[3]>1000)return 9;current_kind=h[0];
  rd(registry,0x10000);rd(objects,0x200);char query[1001]={0};rd(query,h[3]);
  if(current_kind==16){memset(event_barn,0,0x105100);rd(event_barn,0x5100);}
  for(uint32_t i=0;i<16;i++)memcpy(registry+0x5000+i*0x100,&(uintptr_t){(uintptr_t)vt},8);
  memcpy(registry+0x8048,&(uintptr_t){(uintptr_t)invoke},8);memcpy(registry+0x8058,&(uintptr_t){(uintptr_t)return_type},8);
  memcpy(registry+0x8148,&(uintptr_t){(uintptr_t)invoke},8);memcpy(registry+0x8158,&(uintptr_t){(uintptr_t)return_type},8);
  memcpy(registry+0x8248,&(uintptr_t){(uintptr_t)invoke},8);memcpy(registry+0x8258,&(uintptr_t){(uintptr_t)return_type},8);
  error_line=severity=log_count=allocation_cursor=frame_count=math_count=0;pool_cursor=0xf800;volatile uint64_t result=0;
  if(!setjmp(escape))switch(h[0]){
   case 0:result=(uintptr_t)((void *(*)(uint32_t))0x1007abd30UL)(h[1]);break;
   case 1:result=(uintptr_t)((void *(*)(const char *,uint8_t))0x1007abc80UL)(query,0);break;
   case 2:((void (*)(void *))0x1007abd80UL)(h[2]?NULL:objects);break;
   case 3:result=(uintptr_t)((void *(*)(void *,void *))0x100716930UL)(NULL,objects);break;
   case 4:result=(uintptr_t)((void *(*)(void *))0x1007168d0UL)(NULL);break;
   case 5:((void (*)(void *,void *))0x100716910UL)(NULL,h[2]?NULL:objects);break;
   case 6:
    for(uint32_t i=0;i<3;i++)((void *(*)(void *,void *))0x100716930UL)(NULL,objects+i*32);
    for(uint32_t i=0;i<3;i++){uint32_t cell=(h[1]>>(i*2))&3;if(cell>2)return 9;uint64_t p=(uintptr_t)(objects+cell*32);memcpy(objects+0x60+0x38+i*8,&p,8);}
    ((void (*)(void *))0x1007191a0UL)(objects+0x60);
    break;
   case 7:result=(uintptr_t)((void *(*)(void *,const char *))0x1004d0b60UL)(registry+0x7000,query);break;
   case 8:((void (*)(void *,void *))0x1004d0e00UL)(registry+0x7000,h[2]?NULL:objects);break;
   case 9:result=((uint32_t (*)(void *,void *))0x1004d0fd0UL)(registry+0x7000,h[2]?NULL:objects);break;
   case 10:((void (*)(void *))0x100715760UL)(registry+0xa000);break;
   case 11:result=(uintptr_t)((void *(*)(void *,void *))0x100716250UL)(registry+0xa000,registry+0x5100);break;
   case 12:((void (*)(void *,void *))0x100716360UL)(registry+0xa000,h[2]?NULL:objects);break;
   case 13:((void (*)(void *))0x100715cd0UL)(registry+0xa000);break;
   case 14:{
    ((void (*)(void *))0x100715760UL)(registry+0xa000);
    void *values[3];for(uint32_t i=0;i<3;i++)values[i]=((void *(*)(void *,void *))0x100716250UL)(registry+0xa000,registry+0x5100);
    for(uint32_t i=0;i<3;i++)memcpy(objects+0x60+0x38+i*8,&values[i],8);
    ((void (*)(void *))0x1007191a0UL)(objects+0x60);
    const uint32_t order[]={1,0,2};for(uint32_t i=0;i<3;i++)((void (*)(void *,void *))0x100716360UL)(registry+0xa000,values[order[i]]);
    ((void (*)(void *))0x100715cd0UL)(registry+0xa000);
    result=(uintptr_t)((void *(*)(void *,void *))0x100716250UL)(registry+0xa000,registry+0x5100);break;
   }
   case 15:{
    ((void (*)(void *))0x100715760UL)(registry+0xa000);
    void *values[3];for(uint32_t i=0;i<3;i++)values[i]=((void *(*)(void *,const char *))0x1004d0b60UL)(registry+0x7000,query);
    for(uint32_t i=0;i<3;i++)memcpy(objects+0x60+0x38+i*8,&values[i],8);
    ((void (*)(void *))0x1007191a0UL)(objects+0x60);
    const uint32_t order[]={1,0,2};for(uint32_t i=0;i<3;i++){
     if(!values[order[i]])continue;
     ((uint32_t (*)(void *,void *))0x1004d0fd0UL)(registry+0x7000,values[order[i]]);
     ((void (*)(void *,void *))0x1004d0e00UL)(registry+0x7000,values[order[i]]);
    }
    ((void (*)(void *))0x100715cd0UL)(registry+0xa000);
    result=(uintptr_t)((void *(*)(void *,const char *))0x1004d0b60UL)(registry+0x7000,query);break;
   }
   case 16:{
    ((void (*)(void *))0x100715760UL)(registry+0xa000);
    ((void (*)(void *))0x10032e4a0UL)(event_barn);
    if(registry[0x6f09]){uint16_t unique=u32(registry+0xed00);memcpy(event_barn+0xc,&unique,2);memcpy(event_barn+0x20,registry+0xed20,8);memcpy(event_barn+0x18,registry+0xed28,8);memcpy(event_barn+0x28,registry+0xed30,8);}
    if(registry[0x6f06]==1)memset(event_barn+0x5030,0,8);
    if(registry[0x6f06]==2)memcpy(event_barn+0x30,&objects,8);
    void *values[3]={0},*consumer=NULL;
    for(uint32_t i=0;i<(registry[0x6f0a]?u32(registry+0xec24):4);i++){
     uint32_t kind=u32(registry+0xec00+i*4);
     void *object=((void *(*)(void *,const char *))0x1004d0b60UL)(registry+0x7000,kind==3?(registry[0x6f0a]==1?"FloatAdd":registry[0x6f0a]==2?"SetFloat":"FloatMult"):"Float");
     ((void (*)(void *,void *,void *))0x10040b390UL)(registry+0xc000,object,registry+(kind==3?0xe00c:0xe000));
     memcpy(registry+0xe800+i*8,&object,8);if(kind==3)consumer=object;else values[kind]=object;
    }
    foundation_resolve();
    if(registry[0x6f09]&&u32(registry+0xed10)){
     void *game=registry+(registry[0x6f0a]==2?0xb000:0x5c00);
     if(registry[0x6f0a]==2){void *time=registry+0xb400;memcpy(registry+0xb160,&time,8);memcpy((void *)0x101ffb0d0UL,registry+0x6f0b,1);}
     ((void (*)(void *,void *))0x10032e540UL)(event_barn,game);snapshot();
     for(uint32_t i=0;i<u32(registry+0xec20);i++){
      if(registry[0x6f0a]){uint32_t target=u32(registry+0xbc00+i*8);if(target!=0xffffffff){if(target>=3||!values[target])exit(19);memcpy((uint8_t *)values[target]+0x10,registry+0xbc04+i*8,4);}}
      if(registry[0x6f0a]==2){memcpy(registry+0xb414,registry+0xb600+i*12,4);memcpy(registry+0xb420,registry+0xb604+i*12,4);memcpy((void *)0x100cb8540UL,registry+0xb608+i*12,4);}
      uint32_t action=u32(registry+0xee00+i*4);if(action)((void (*)(void *,uint8_t))0x10032e2c0UL)((uint8_t *)consumer-8,action==1);
      ((void (*)(void *,void *))0x10032ea90UL)(event_barn,game);snapshot();
     }
    }else for(uint32_t i=0;i<u32(registry+0xec20);i++)((void (*)(void *))0x1007191a0UL)((uint8_t *)consumer-8);
    ((uint32_t (*)(void *,void *))0x1004d0fd0UL)(registry+0x7000,consumer);
    if(registry[0x6f07])((uint8_t *)consumer)[0x18]=1;
    ((void (*)(void *,void *))0x1004d0e00UL)(registry+0x7000,consumer);
    if(registry[0x6f08])((void (*)(void *,void *))0x1004d0e00UL)(registry+0x7000,consumer);
    if(registry[0x6f09]&&u32(registry+0xed14))((void (*)(void *))0x10032e4a0UL)(event_barn);
    const uint32_t order[]={1,0,2};for(uint32_t i=0;i<3;i++){
     if(!values[order[i]])continue;
     ((uint32_t (*)(void *,void *))0x1004d0fd0UL)(registry+0x7000,values[order[i]]);
     ((void (*)(void *,void *))0x1004d0e00UL)(registry+0x7000,values[order[i]]);
    }
    ((void (*)(void *))0x100715cd0UL)(registry+0xa000);
    result=(uintptr_t)((void *(*)(void *,const char *))0x1004d0b60UL)(registry+0x7000,"Float");break;
   }
   case 17:((void (*)(void *))0x10032eea0UL)(objects);break;
   case 18:result=(uintptr_t)((void *(*)(void *,void *))0x100719090UL)(NULL,objects);break;
   case 19:result=(uintptr_t)((void *(*)(void *,void *))0x100719390UL)(NULL,objects);break;
   case 20:result=(uintptr_t)((void *(*)(void *,void *))0x1007175d0UL)(NULL,objects);break;
  }
  for(uint32_t i=0;i<16;i++)memset(registry+0x5000+i*0x100,0,8);
  memset(registry+0x8048,0,8);memset(registry+0x8058,0,8);
  memset(registry+0x8148,0,8);memset(registry+0x8158,0,8);
  memset(registry+0x8248,0,8);memset(registry+0x8258,0,8);
  uint32_t out[]={error_line,severity,log_count};wr(out,12);wr((void *)&result,8);wr(log_entries,log_count*12);wr(objects,0x200);wr(registry,0x10000);
  if(current_kind==16){wr(event_barn,0x5100);if(registry[0x6f09]){wr(event_barn+0x1050f0,4);wr(&frame_count,4);for(uint32_t i=0;i<frame_count;i++){wr(frame_objects[i],0x200);wr(frame_sequences+i,4);}if(registry[0x6f0a]==2){wr(&math_count,4);wr(math_pairs,math_count*8);}}}
 }
 return 0;
}
