#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#include <immintrin.h>
#include <signal.h>
#include <ucontext.h>
static uint32_t active,fill,found,record_count,ordinal;
static uint8_t *barn,*material,*handle;
static uint32_t *candidates;
static void crashed(int sig,siginfo_t *info,void *context){ucontext_t *u=context;fprintf(stderr,"Skirt signal=%d case=%u address=%p rip=%llx\n",sig,active,info->si_addr,(unsigned long long)u->uc_mcontext.gregs[REG_RIP]);_Exit(128+sig);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void pointer(void *at,void *value){memcpy(at,&value,8);}
static void *aligned(size_t n){void *p=NULL;if(posix_memalign(&p,32,n?n:32))exit(11);return p;}
static void jump(uintptr_t at,void *target){static uintptr_t slot=0x102300000UL;uint8_t code[6]={0xff,0x25};int32_t disp=(int32_t)(slot-at-6);memcpy(code+2,&disp,4);memcpy((void *)slot,&target,8);slot+=8;memcpy((void *)at,code,6);}
typedef struct {uint32_t values[8];char text[96];} Event;
static Event events[131072];static uint32_t event_count;
static void event(uint32_t kind,uint32_t a,uint32_t b,uint32_t c,uint32_t d,const char *text){if(event_count>=131072)exit(12);Event *e=&events[event_count++];memset(e,0,sizeof *e);e->values[0]=kind;e->values[1]=a;e->values[2]=b;e->values[3]=c;e->values[4]=d;if(text)strncpy(e->text,text,95);}
typedef struct {void *memory;size_t bytes;uint32_t context,alignment,released;} Allocation;
static Allocation allocations[8];static uint32_t allocation_count;
static void *scratch_context(void){return (void *)2;}
static void *allocate(void *context,size_t bytes,void *meta,uint32_t alignment){(void)meta;if(bytes>256000000||allocation_count>=8)exit(13);void *p=aligned(bytes+64);memset(p,fill,bytes+64);allocations[allocation_count]=(Allocation){p,bytes,(uintptr_t)context,alignment,0};event(6,allocation_count,bytes,(uintptr_t)context,alignment,NULL);allocation_count++;return p;}
static void release(void *context,void *p){for(uint32_t i=0;i<allocation_count;i++)if(allocations[i].memory==p&&!allocations[i].released){allocations[i].released=1;event(7,i,0,(uintptr_t)context,0,NULL);return;}exit(14);}
static void ref_init(void *p){pointer(p,NULL);event(0,0,0,0,0,NULL);}
static void *resource_type(void){event(1,0,0,0,0,NULL);return (void *)0x102310000UL;}
static void *find_resource(void *manager,void *type,void *name){(void)manager;(void)type;(void)name;event(2,found,0,0,0,NULL);return found?handle:NULL;}
static void assign_ref(void *resource,void *out){event(3,0,0,0,0,NULL);pointer(out,resource);}
static void release_ref(void *p){(void)p;event(5,0,0,0,0,NULL);}
static void geometry_init(void *geo,const char *name,uint32_t count){(void)geo;event(8,count,0,0,0,name);}
static uint32_t stream_types[3][7],stream_attributes[3][7],stream_args[3][4];
static void vertex_format(void *geo,uint32_t slot,uint32_t *types,uint32_t *attributes,uint32_t count,uint32_t mode,uint32_t extra,void *data){(void)geo;(void)data;uint32_t index=slot==0?0:slot==2?1:2;if(count>7)exit(15);memcpy(stream_types[index],types,count*4);memcpy(stream_attributes[index],attributes,count*4);stream_args[index][0]=slot;stream_args[index][1]=count;stream_args[index][2]=mode;stream_args[index][3]=extra;event(9,slot,count,mode,extra,NULL);}
static void index_format(void *geo,uint32_t slot,uint32_t type,uint32_t mode,uint32_t count,void *data){(void)geo;(void)data;event(10,slot,type,mode,count,NULL);}
static void upload_geometry(void *geo){(void)geo;event(11,0,0,0,0,NULL);}
static void *materials(void){event(12,0,0,0,0,NULL);return material;}
static uint32_t material_ordinal(void *p){return ((uint8_t *)p-barn-0x30)/0x3540;}
static void material_init(void *p,void *geo,void *manager,const char *name,void *parameters,uint32_t flags){(void)geo;(void)manager;(void)parameters;((uint8_t *)p)[0x538]=1;event(13,material_ordinal(p),flags,0,0,name);}
static void uniform_value(void *p,const char *name,float value){uint32_t bits;memcpy(&bits,&value,4);event(14,((uint8_t *)p-barn-0x2a0)/0x3540,bits,0,0,name);}
static void material_upload(void *p,void *def,void *manager){(void)def;(void)manager;event(15,((uint8_t *)p-barn-0x2a0)/0x3540,0,0,0,NULL);}
static void terminate_material(void *p){event(16,material_ordinal(p),0,0,0,NULL);}
static void terminate_geometry(void *p){(void)p;event(17,0,0,0,0,NULL);}
static uint8_t in_frustum(void *planes,void *min,void *max){(void)planes;(void)min;(void)max;if(ordinal>=record_count)exit(16);uint32_t selected=candidates[ordinal*2];event(18,ordinal,selected,0,0,NULL);if(!selected)ordinal++;return selected;}
static void camera_position(void *out,void *camera){(void)camera;memset(out,0,16);event(19,ordinal,0,0,0,NULL);}
static uint8_t within_distance(void *camera,void *min,void *max,float limit){(void)camera;(void)min;(void)max;uint32_t bits;memcpy(&bits,&limit,4);uint32_t selected=candidates[ordinal*2+1];event(20,ordinal,selected,bits,0,NULL);ordinal++;return selected;}
static void flush_material(void *p){uint32_t index=material_ordinal(p);event(22,index,*(uint32_t *)((uint8_t *)p+0x53c),0,0,NULL);}
static void snapshot(void){uint32_t values[5]={*(uint32_t *)(barn+0x18),*(uint32_t *)(barn+0x1c),*(uint32_t *)(barn+0x20),*(uint32_t *)(barn+0x24),*(void **)(barn+0x641f0)!=NULL};fwrite(values,4,5,stdout);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 struct sigaction action={0};action.sa_sigaction=crashed;action.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&action,NULL);sigaction(SIGBUS,&action,NULL);
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;void *image=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 static uint64_t cookie=0x318a9000facedULL;pointer((void *)0x100c0d8d8UL,&cookie);
 jump(0x100795530UL,allocate);jump(0x100795a70UL,release);jump(0x1007c6c20UL,scratch_context);jump(0x1007c2530UL,ref_init);jump(0x1003f10c0UL,resource_type);jump(0x1007c4360UL,find_resource);jump(0x1007c2310UL,assign_ref);jump(0x1007c2570UL,release_ref);
 jump(0x1007f53c0UL,geometry_init);jump(0x1007f5430UL,vertex_format);jump(0x1007f55d0UL,index_format);jump(0x1007f5690UL,upload_geometry);jump(0x10043fb50UL,materials);jump(0x1007f5d90UL,material_init);jump(0x1007be530UL,uniform_value);jump(0x100443810UL,material_upload);jump(0x1007f6b80UL,terminate_material);jump(0x1007f5250UL,terminate_geometry);
 jump(0x100567510UL,in_frustum);jump(0x10076be90UL,camera_position);jump(0x10078b5d0UL,within_distance);jump(0x1007f6540UL,flush_material);
 jump(0x100aa24aaUL,bzero);jump(0x100aa28f4UL,memcpy);jump(0x100aa2900UL,memset);jump(0x100aa2c4eUL,strcmp);jump(0x100aa2c90UL,strncpy);jump(0x100aa2c7eUL,strlen);jump(0x100aa2a2cUL,powf);
 // Only the found-resource branch is used. Preserve the unexecuted fallback.
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(active=0;active<cases;active++){
  uint32_t p[6];readin(p,sizeof p);record_count=p[0];fill=p[2];found=1;if(record_count>10000)return 5;
  char level[128];readin(level,sizeof level);level[127]=0;
  barn=aligned(0x64200);material=aligned(0x34d0);handle=aligned(32);uint8_t *resource=aligned(0x280),*game=aligned(0x620),*records=aligned(record_count*32),*camera=aligned(0x240);
  memset(barn,0,0x64200);memset(material,0,0x34d0);memset(resource,0,0x280);memset(game,0,0x620);memset(records,0,record_count*32);memset(camera,0,0x240);
  candidates=aligned(record_count*8);readin(candidates,record_count*8);
  void **vertices=calloc(record_count?record_count:1,sizeof(void *)),**indices=calloc(record_count?record_count:1,sizeof(void *));
  for(uint32_t i=0;i<record_count;i++){uint32_t sizes[2];readin(sizes,8);if(sizes[0]>65536||sizes[1]>10000000)return 6;vertices[i]=aligned(sizes[0]*40);indices[i]=aligned(sizes[1]*2);readin(vertices[i],sizes[0]*40);readin(indices[i],sizes[1]*2);memcpy(records+i*32,sizes,4);memcpy(records+i*32+16,sizes+1,4);pointer(records+i*32+8,vertices[i]);pointer(records+i*32+24,indices[i]);}
  pointer(handle+16,resource);resource[0x120]=p[3];*(uint32_t *)(resource+0x264)=0;*(uint32_t *)(resource+0xd8)=record_count;pointer(resource+0xf8,records);pointer(game+0xf8,(void *)1);pointer(game+0x70,camera);pointer(game+0x148,(void *)0x1000);*(uint32_t *)(barn+0x20)=p[1];*(uint32_t *)(barn+0x24)=p[4];
  _mm_setcsr(0x1f80);((void (*)(void *,const char *))0x10043fb70UL)(material,level);event_count=allocation_count=0;memset(stream_args,0,sizeof stream_args);memset(stream_types,0,sizeof stream_types);memset(stream_attributes,0,sizeof stream_attributes);
  ((void (*)(void *,void *))0x1005abf50UL)(barn,game);snapshot();
  fwrite(&allocation_count,4,1,stdout);for(uint32_t i=0;i<allocation_count;i++){uint32_t size=allocations[i].bytes;fwrite(&size,4,1,stdout);fwrite(allocations[i].memory,1,size+64,stdout);}
  fwrite(stream_args,1,sizeof stream_args,stdout);fwrite(stream_types,1,sizeof stream_types,stdout);fwrite(stream_attributes,1,sizeof stream_attributes,stdout);
  uint32_t load_events=event_count;fwrite(&load_events,4,1,stdout);fwrite(events,sizeof(Event),event_count,stdout);event_count=0;ordinal=0;
  // Skip drawing only when the resource pending early return left +0x18=0.
  *(uint8_t *)0x100cf43c0UL=p[5];((void (*)(void *,void *))0x1005acaf0UL)(barn,game);
  fwrite(&event_count,4,1,stdout);fwrite(events,sizeof(Event),event_count,stdout);event_count=0;
  for(uint32_t i=0;i<*(uint32_t *)(barn+0x24);i++){uint8_t *m=barn+0x30+i*0x3540;uint32_t count=*(uint32_t *)(m+0x53c);fwrite(&count,4,1,stdout);fwrite(m+0x540,12,count,stdout);}
  ((void (*)(void *))0x1005aca70UL)(barn);snapshot();((void (*)(void *))0x1005aca70UL)(barn);snapshot();fwrite(&event_count,4,1,stdout);fwrite(events,sizeof(Event),event_count,stdout);
  for(uint32_t i=0;i<allocation_count;i++){if(!allocations[i].released)return 7;free(allocations[i].memory);}for(uint32_t i=0;i<record_count;i++){free(vertices[i]);free(indices[i]);}free(vertices);free(indices);free(candidates);free(barn);free(material);free(handle);free(resource);free(game);free(records);free(camera);
 }
 return 0;
}
