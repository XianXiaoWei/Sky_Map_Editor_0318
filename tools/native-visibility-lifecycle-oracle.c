#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <immintrin.h>
#include <signal.h>
#include <ucontext.h>

/* Full registered Visibility methods run unmodified. Imported memory/string
 * calls and heap/scratch ownership are explicit host services. Resource lookup,
 * observation/release, metadata ID dispatch and disabled debug frustum drawing
 * remain original code operating on supplied loaded-resource snapshots. */
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static uint32_t active_group,active_step,active_operation;
static void crashed(int signal,siginfo_t *info,void *context){
 ucontext_t *u=context;
 fprintf(stderr,"Lifecycle signal=%d group=%u step=%u operation=%u address=%p rip=%llx\n",signal,active_group,active_step,active_operation,info->si_addr,(unsigned long long)u->uc_mcontext.gregs[REG_RIP]);
 _Exit(128+signal);
}
static void *aligned(size_t n){void *p=NULL;if(posix_memalign(&p,32,n?n:32))exit(11);return p;}
// Mach-O import stubs are only six bytes apart. Use a six-byte RIP-relative
// indirect jump into explicit pointer slots, preserving adjacent imports.
static void jump(uintptr_t at,void *target){
 static uintptr_t slot=0x102300000UL;uint8_t code[6]={0xff,0x25};
 int32_t displacement=(int32_t)(slot-at-6);memcpy(code+2,&displacement,4);
 memcpy((void *)slot,&target,8);slot+=8;memcpy((void *)at,code,6);
}
static void pointer(void *at,void *value){memcpy(at,&value,8);}
static uint32_t events[2048][5],event_count,allocation_count;
static struct {void *memory;uint32_t bytes,kind,id;} allocations[256];
static void event(uint32_t op,uint32_t kind,uint32_t bytes,uint32_t align,uint32_t id){if(event_count>=2048)exit(12);uint32_t row[5]={op,kind,bytes,align,id};memcpy(events[event_count++],row,20);}
static void *scratch_context(void){return (void *)2;}
static void *allocate(void *context,size_t bytes,void *meta,uint32_t align){
 (void)meta;if(allocation_count>=256||bytes>64000000)exit(13);
 void *memory=aligned(bytes+128);memset(memory,0xef,bytes+128);
 uint32_t id=allocation_count+1,kind=(uintptr_t)context==2?2:1;
 allocations[allocation_count].memory=memory;allocations[allocation_count].bytes=bytes;allocations[allocation_count].kind=kind;allocations[allocation_count].id=id;allocation_count++;
 event(1,kind,bytes,align,id);return memory;
}
static void release(void *context,void *memory){
 for(uint32_t i=0;i<allocation_count;i++)if(allocations[i].memory==memory){event(2,(uintptr_t)context==2?2:1,allocations[i].bytes,0,allocations[i].id);return;}
 exit(14);
}
static void pattern16(void *dst,const void *pattern,size_t n){for(size_t i=0;i<n;i++)((uint8_t *)dst)[i]=((const uint8_t *)pattern)[i%16];}
static _Alignas(32) unsigned char meta_level[0x80],meta_other[0x80],meta_camera[0x80],manager[0x500],resource[0x70],wrong_resource[0x70],level_data[0x108],resource_manager[0x450],barn[0xa8],debug_renderer[0x13a0],node_a[0x30],node_b[0x30];
static uintptr_t meta_vtable[16],resource_vtable[16];
static uint64_t type_level[2],type_other[2];
static void *meta_type(void *self){return self==meta_level?type_level:type_other;}
static void retained(void *self,void *reference){(void)self;(void)reference;event(3,3,0,0,0);}
static void released(void *self,void *reference){(void)self;(void)reference;event(4,3,0,0,0);}
static void normalized_pointer(unsigned char *state,size_t offset){
 uintptr_t value;memcpy(&value,state+offset,8);if(!value)return;
 for(uint32_t i=0;i<allocation_count;i++){
  uintptr_t base=(uintptr_t)allocations[i].memory;
  if(value>=base&&value<base+allocations[i].bytes+128){uint64_t token=((uint64_t)allocations[i].id<<32)|(value-base);memcpy(state+offset,&token,8);return;}
 }
 exit(15);
}
static void snapshot(unsigned char *state,uint32_t changed,uint32_t before,uint32_t after){
 fwrite(&changed,4,1,stdout);fwrite(&before,4,1,stdout);fwrite(&after,4,1,stdout);
 unsigned char normalized[0x240];memcpy(normalized,state,sizeof normalized);
 normalized_pointer(normalized,0x10);normalized_pointer(normalized,0x20);
 for(unsigned i=0;i<20;i++)normalized_pointer(normalized,0x38+i*8);
 fwrite(normalized,sizeof normalized,1,stdout);
 void *camera,*depth;memcpy(&camera,state+0x10,8);memcpy(&depth,state+0x20,8);
 uint32_t present=camera!=NULL;fwrite(&present,4,1,stdout);if(present)fwrite(camera,0x300,1,stdout);
 uint32_t words=0;if(depth)for(uint32_t i=0;i<allocation_count;i++)if(allocations[i].memory==depth)words=(allocations[i].bytes+128)/4;
 fwrite(&words,4,1,stdout);if(words)fwrite(depth,words*4,1,stdout);
 fwrite(&event_count,4,1,stdout);fwrite(events,20,event_count,stdout);
 uint32_t linked=*(uintptr_t *)(resource+0x40)!=0||*(uintptr_t *)(resource+0x48)!=0;fwrite(&linked,4,1,stdout);
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 struct sigaction action={0};action.sa_sigaction=crashed;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,NULL);sigaction(SIGBUS,&action,NULL);
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 static uint64_t cookie=0x318facedcafebeefULL;pointer((void *)0x100c0d8d8UL,&cookie);
 jump(0x100795530UL,allocate);jump(0x100795a70UL,release);jump(0x1007c6c20UL,scratch_context);
 jump(0x100aa28f4UL,memcpy);jump(0x100aa2900UL,memset);jump(0x100aa2906UL,pattern16);jump(0x100aa2c4eUL,strcmp);
 meta_vtable[0x68/8]=(uintptr_t)meta_type;resource_vtable[0x38/8]=(uintptr_t)retained;resource_vtable[0x30/8]=(uintptr_t)released;
 pointer(meta_level,meta_vtable);pointer(meta_other,meta_vtable);pointer(meta_camera,meta_vtable);
 pointer(manager+0x98,meta_level);pointer(manager+0xa0,meta_other);pointer(manager+0xa8,meta_camera);
 pointer((void *)0x102047c70UL,manager);pointer((void *)0x10203f2b0UL,meta_camera);pointer((void *)0x102000638UL,type_level);pointer((void *)0x101ded460UL,debug_renderer);
 uint32_t groups;readin(&groups,4);fwrite(&groups,4,1,stdout);
 for(uint32_t group=0;group<groups;group++){
  active_group=group;
  uint32_t params[6];readin(params,sizeof params);
  uint32_t steps=params[0],vc=params[1],ic=params[2],recordcount=params[3],sc=params[4],ac=params[5];
  if(steps>128||vc>1000000||ic>10000000||sc>100000||ac>100000||recordcount>2)return 5;
  unsigned char *state=aligned(0x240),*camera=aligned(0x300),*device=aligned(0x300),*vertices=aligned(vc*16);
  uint16_t *indices=aligned(ic*2);float *spheres=aligned(sc*16),*minima=aligned(ac*16),*maxima=aligned(ac*16);
  readin(state,0x240);readin(vertices,vc*16);readin(indices,ic*2);readin(spheres,sc*16);readin(minima,ac*16);readin(maxima,ac*16);
  event_count=allocation_count=0;memset(resource,0,sizeof resource);memset(wrong_resource,0,sizeof wrong_resource);memset(level_data,0,sizeof level_data);memset(resource_manager,0,sizeof resource_manager);memset(barn,0,sizeof barn);memset(node_a,0,sizeof node_a);memset(node_b,0,sizeof node_b);
  struct {uint32_t vertices,indices;void *vertex_data;void *index_data;} records[2]={{vc,ic,vertices,indices},{0,0,NULL,NULL}};
  // Observe stores the address of the intrusive list anchor (+0x40) in
  // Reference. Update dereferences anchor+0x10, the payload at resource+0x50.
  pointer(resource,resource_vtable);pointer(resource+0x50,level_data);pointer(level_data,resource_vtable);
  pointer(wrong_resource,resource_vtable);*(uint32_t *)(wrong_resource+8)=1;
  *(uint32_t *)(level_data+0xdc)=recordcount;pointer(level_data+0x100,records);
  // Two equal-name RB-tree nodes: original type lookup must skip the first.
  char name[]="ExplicitLoadedLevel";pointer(node_a+8,node_b);pointer(node_a+0x10,resource_manager+0x430);pointer(node_a+0x20,name);pointer(node_a+0x28,wrong_resource);
  pointer(node_b+0x10,node_a);pointer(node_b+0x20,name);pointer(node_b+0x28,resource);
  pointer(resource_manager+0x430,node_a);pointer(barn+0x10,name);pointer(barn+0xa0,resource_manager);
  for(uint32_t step=0;step<steps;step++){
   uint32_t p[3];readin(p,sizeof p);uint32_t op=p[0],flags=p[1],csr=p[2];readin(device,0x300);readin(camera,0x300);
   active_step=step;active_operation=op;
   *(uint8_t *)0x10203be90UL=(flags&1)!=0;*(uint8_t *)0x10203bf08UL=(flags&2)!=0;*(uint8_t *)0x100d0d4c0UL=(flags&4)!=0;
   *(uint8_t *)0x10203bfe8UL=0;*(uint8_t *)0x10203c058UL=0;*(uint8_t *)0x10203c0c8UL=0;*(uint8_t *)0x10203c138UL=0;*(uint8_t *)0x10203c2f8UL=0;
   _mm_setcsr(csr);uint32_t before=_mm_getcsr(),changed=1,previous_w=*(uint32_t *)(state+0x28),previous_h=*(uint32_t *)(state+0x2c);
   uint32_t *sphere_status=NULL,*aabb_status=NULL;
   if(op==0)((void (*)(void *,void *,void *))0x10071d660UL)(state,(void *)1,camera);
   else if(op==1){((void (*)(void *,void *,void *,void *,void *))0x10071d9f0UL)(state,NULL,(void *)1,device,camera);changed=previous_w!=*(uint32_t *)(state+0x28)||previous_h!=*(uint32_t *)(state+0x2c);}
   else if(op==2){((void (*)(void *,void *,void *,void *,void *,void *))0x10071e020UL)(state,device,camera,barn,NULL,NULL);changed=(flags&3)==0;}
   else if(op==3){
    sphere_status=aligned((sc+8)*4);aabb_status=aligned((ac+8)*4);for(uint32_t i=0;i<sc+8;i++)sphere_status[i]=0x318faced;for(uint32_t i=0;i<ac+8;i++)aabb_status[i]=0x318faced;
    ((void (*)(void *,void *,uint32_t,void *,uint8_t))0x100720dd0UL)(state,spheres,sc,sphere_status,(flags&8)!=0);
    ((void (*)(void *,void *,void *,uint32_t,void *))0x100721ce0UL)(state,minima,maxima,ac,aabb_status);
   }else if(op==4)((void (*)(void *,void *))0x10071d9b0UL)(state,(void *)1);
   else return 6;
   uint32_t after=_mm_getcsr();snapshot(state,changed,before,after);
   if(op==3){fwrite(sphere_status,(sc+8)*4,1,stdout);fwrite(aabb_status,(ac+8)*4,1,stdout);free(sphere_status);free(aabb_status);}
  }
  for(uint32_t i=0;i<allocation_count;i++)free(allocations[i].memory);
  free(state);free(camera);free(device);free(vertices);free(indices);free(spheres);free(minima);free(maxima);
 }
 return 0;
}
