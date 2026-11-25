/* Original Event requests, two sorters and complete Barn normal-path bodies.
 * No verified body is patched. Heap and virtual methods are explicit services;
 * service callbacks can reenter original requests/dispatch or replace slots. */
#define main numeric_oracle_main
#include "native-object-numeric-oracle.c"
#undef main
static uint8_t barn[0x105100],game_state[64],*events;
static uint8_t full_game[0x600],sound_time[0x1090],*float_cells;
static char sound_name[128];static uint32_t *drivers,current_event;
static uintptr_t sound_vt[18],description_vt[10],sound_object[2],description_object[2];
static uint32_t event_count,rule_count,trace_count,*rules,*hits;
static uint32_t trace[100000][7];
static uint32_t heap_used;static void *scratch;
static uintptr_t vt[12];
static uint32_t id(void *p){return p?(uint32_t)(((uint8_t *)p-events)/128):0xffffffff;}
static void record(uint32_t kind,uint32_t a,uint32_t b,uint32_t c,uint32_t d,uint32_t e,uint32_t f){if(trace_count>=100000)exit(12);uint32_t row[]={kind,a,b,c,d,e,f};memcpy(trace[trace_count++],row,sizeof(row));}
static void patch_service(uintptr_t address,void *fn){uintptr_t page=address&~4095UL;if(mprotect((void *)page,4096,PROT_READ|PROT_WRITE|PROT_EXEC))exit(6);uint8_t *s=(uint8_t *)address;s[0]=0xff;s[1]=0x25;memset(s+2,0,4);memcpy(s+6,&fn,8);if(mprotect((void *)page,4096,PROT_READ|PROT_EXEC))exit(6);}
static void *scratch_heap(void){record(100,0,0,0,0,0,0);return &scratch;}
static void *allocate(void *heap,uint32_t size,void *name,uint32_t alignment){(void)name;if(heap!=&scratch||size!=0x2800||alignment!=8)exit(14);record(101,size,alignment,0,0,0,0);scratch=malloc(size);return scratch;}
static void deallocate(void *heap,void *p){if(heap==&scratch){if(p!=scratch)exit(15);record(102,0,0,0,0,0,0);free(p);scratch=NULL;}else{if(heap!=barn+0x5040)exit(15);record(102,1,id(p),0,0,0,0);}}
static uint32_t used(void *heap){if(heap!=barn+0x85098)exit(16);record(103,heap_used,0,0,0,0,0);return heap_used;}
static uint32_t hash(const void *p,size_t n){const uint8_t *b=p;uint32_t h=2166136261U;for(size_t i=0;i<n;i++)h=(h^b[i])*16777619U;return h;}
static void packet(uint32_t kind,const void *p,size_t n){const uint8_t *b=p;record(118,current_event,kind,(uint32_t)n,0,0,0);for(size_t i=0;i<n;i+=12){uint32_t words[3]={0};size_t remaining=n-i;memcpy(words,b+i,remaining<12?remaining:12);record(117,current_event,kind,(uint32_t)i,words[0],words[1],words[2]);}}
static uint64_t sound_id(void *p){(void)p;uint32_t v=events[current_event*128+0x78];record(110,current_event,v,0,0,0,0);return v;}
static uint8_t sound_playing(void *p){(void)p;uint32_t v=events[current_event*128+0x79];record(111,current_event,v,0,0,0,0);return v!=0;}
static void *sound_description(void *p){(void)p;record(112,current_event,0,0,0,0,0);return description_object;}
static uint8_t description_playing(void *p){(void)p;uint32_t v=events[current_event*128+0x7a];record(113,current_event,v,0,0,0,0);return v!=0;}
static void sound_stop(void *p,uint32_t immediate){(void)p;record(114,current_event,immediate,0,0,0,0);}
static void sound_parameters(void *p,void *parameters){(void)p;record(115,current_event,hash(parameters,0x1b0),0,0,0,0);packet(3,parameters,0x1b0);}
struct SoundResult {void *handle;uint64_t id;};
static struct SoundResult sound_play(void *manager,const char *name,const void *options,const void *parameters){(void)manager;uint32_t *d=drivers+current_event*4;record(116,current_event,hash(name,strlen(name)),hash(options,128),hash(parameters,0x1b0),0,0);packet(0,name,strlen(name));packet(1,options,128);packet(2,parameters,0x1b0);return (struct SoundResult){d[1]?sound_object:NULL,d[2]};}
static void callback(uint32_t slot,void *event,void *game,void *heap){
 uint8_t *p=event;uint32_t event_id=id(p),sequence,lo,hi;memcpy(&sequence,p+0x10,4);memcpy(&lo,p+0x30,4);memcpy(&hi,p+0x34,4);
 if(event_id>=event_count)exit(17);
 if(slot!=0&&game!=game_state)exit(18);
 if((slot==0x10||slot==0x18)&&heap!=barn+0x85098)exit(19);
 uint32_t flags;memcpy(&flags,p+0x20,4);
 record(slot,event_id,flags,sequence,lo,hi,(slot==0x10||slot==0x18)?0x85098:slot?1:0);
 uint32_t previous_event=current_event;current_event=event_id;
 if(drivers[event_id*4]==1&&slot==0x48)((void(*)(void *,void *))0x1007194a0UL)(p,full_game);
 if(drivers[event_id*4]==2&&(slot==0x48||slot==0x38))((void(*)(void *,void *))(slot==0x48?0x100534410UL:0x1005343d0UL))(p,full_game);
 current_event=previous_event;
 uint32_t occurrence=++hits[event_id*12+slot/8];
 for(uint32_t i=0;i<rule_count;i++){
  uint32_t *r=rules+i*7;if(r[0]!=event_id||r[1]!=slot||r[2]!=occurrence)continue;
  uint8_t *target=r[4]<event_count?events+r[4]*128:NULL;
  if(r[3]<=2){if(!target||r[5]+(1U<<r[3])>128)exit(20);memcpy(target+r[5],r+6,1U<<r[3]);}
  else if(r[3]==3)((void(*)(void *))0x10032ef60UL)(target);
  else if(r[3]==4||r[3]==5)((void(*)(void *,uint8_t))0x10032e2c0UL)(target,r[3]==4);
  else if(r[3]==6){if(r[4]>=1280||(r[6]!=0xffffffff&&r[6]>=event_count))exit(20);void *replacement=r[6]==0xffffffff?NULL:events+r[6]*128;memcpy(barn+0x30+r[4]*16,&replacement,8);}
  else if(r[3]==7)memcpy(barn+0x10,r+6,4);
  else if(r[3]==8)((void(*)(void *,void *,void *))0x10032f5b0UL)(barn,target,game_state);
  else exit(20);
 }
}
static void destruct(void *p){callback(0,p,NULL,NULL);}
static void load(void *p,void *g,void *h){callback(0x10,p,g,h);}
static void unload(void *p,void *g,void *h){callback(0x18,p,g,h);}
static void enable(void *p,void *g){callback(0x30,p,g,NULL);}
static void resume(void *p,void *g){callback(0x38,p,g,NULL);}
static void finish(void *p,void *g){callback(0x40,p,g,NULL);}
static void update(void *p,void *g){callback(0x48,p,g,NULL);}
static void render(void *p,void *g){callback(0x58,p,g,NULL);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int initialized=initialize_native(argv[1]);if(initialized)return initialized;
 patch_service(0x1007c6c20UL,scratch_heap);patch_service(0x100795530UL,allocate);patch_service(0x100795a70UL,deallocate);patch_service(0x100795b00UL,used);
 patch_service(0x1006018a0UL,sound_play);
 sound_vt[0]=(uintptr_t)sound_id;sound_vt[1]=(uintptr_t)sound_description;sound_vt[2]=(uintptr_t)sound_playing;sound_vt[6]=(uintptr_t)sound_stop;sound_vt[17]=(uintptr_t)sound_parameters;sound_object[0]=(uintptr_t)sound_vt;
 description_vt[9]=(uintptr_t)description_playing;description_object[0]=(uintptr_t)description_vt;
 memset(full_game,0,sizeof(full_game));memset(sound_time,0,sizeof(sound_time));float time_value=12.5f,scale=0.75f;memcpy(sound_time+0x108c,&time_value,4);memcpy(sound_time+0x18,&scale,4);
 vt[0]=(uintptr_t)destruct;vt[2]=(uintptr_t)load;vt[3]=(uintptr_t)unload;vt[6]=(uintptr_t)enable;vt[7]=(uintptr_t)resume;vt[8]=(uintptr_t)finish;vt[9]=(uintptr_t)update;vt[11]=(uintptr_t)render;
 uint32_t count;read_exact(&count,4);write_exact(&count,4);
 while(count--){
  uint32_t h[9];read_exact(h,sizeof(h));event_count=h[0];uint32_t action_count=h[1];rule_count=h[2];heap_used=h[5];if(event_count>2048||action_count>10000||rule_count>10000||h[8]>100000)return 9;
  events=malloc(event_count*128+1);read_exact(events,event_count*128);drivers=malloc(event_count*16+1);read_exact(drivers,event_count*16);float_cells=malloc(h[8]*32+1);read_exact(float_cells,h[8]*32);read_exact(sound_name,128);if(sound_name[127])return 9;
  rules=malloc(rule_count*28+1);read_exact(rules,rule_count*28);uint32_t *actions=malloc(action_count*12+1);read_exact(actions,action_count*12);
  uint32_t slots[1280],links[1280];read_exact(slots,sizeof(slots));read_exact(links,sizeof(links));
  hits=calloc(event_count*12+1,4);memset(barn,0xa5,sizeof(barn));memcpy(barn+0x10,h+3,4);barn[0x5038]=h[6];memcpy(barn+0x1050f0,h+7,4);
  for(uint32_t i=0;i<event_count;i++){
   uint8_t *p=events+i*128;uintptr_t ptr=(uintptr_t)vt;memcpy(p,&ptr,8);uint64_t has_barn;memcpy(&has_barn,p+0x18,8);ptr=has_barn?(uintptr_t)barn:0;memcpy(p+0x18,&ptr,8);uint32_t *d=drivers+i*4;
   if(d[0]==1){if(d[1]>=h[8]||(d[2]!=0xffffffff&&d[2]>=h[8])||(d[3]!=0xffffffff&&d[3]>=h[8]))return 9;ptr=(uintptr_t)(float_cells+d[1]*32);memcpy(p+0x38,&ptr,8);ptr=d[2]==0xffffffff?0:(uintptr_t)(float_cells+d[2]*32);memcpy(p+0x40,&ptr,8);ptr=d[3]==0xffffffff?0:(uintptr_t)(float_cells+d[3]*32);memcpy(p+0x48,&ptr,8);}
   else if(d[0]==2){uint64_t has_time,has_handle;memcpy(&has_time,p+0x58,8);memcpy(&has_handle,p+0x60,8);ptr=has_time?(uintptr_t)sound_time:0;memcpy(p+0x58,&ptr,8);ptr=has_handle?(uintptr_t)sound_object:0;memcpy(p+0x60,&ptr,8);memset(p+0x38,0,24);size_t length=strlen(sound_name);if(length<=22){p[0x38]=(uint8_t)(length*2);memcpy(p+0x39,sound_name,length+1);}else{p[0x38]=1;memcpy(p+0x40,&length,8);ptr=(uintptr_t)sound_name;memcpy(p+0x48,&ptr,8);}}
  }
  for(uint32_t i=0;i<1280;i++){if((slots[i]!=0xffffffff&&slots[i]>=event_count)||(links[i]!=0xffffffff&&links[i]>=1280))return 9;void *p=slots[i]==0xffffffff?NULL:events+slots[i]*128;memcpy(barn+0x30+i*16,&p,8);p=links[i]==0xffffffff?NULL:barn+0x30+links[i]*16;memcpy(barn+0x38+i*16,&p,8);}
  void *head=h[4]==0xffffffff?NULL:barn+0x30+h[4]*16;memcpy(barn+0x5030,&head,8);
  trace_count=asserts=assert_line=log_events=log_chars=0;
  if(setjmp(escape)==0)for(uint32_t i=0;i<action_count;i++){
   uint32_t *a=actions+i*3;if(a[0]<=3&&a[1]>=event_count)return 9;void *p=events+a[1]*128;
   if(a[0]==0)((void(*)(void *))0x10032ef60UL)(p);
   else if(a[0]==1)((void(*)(void *))0x10032e2f0UL)(p);
   else if(a[0]==2)((void(*)(void *,uint8_t))0x10032e2c0UL)(p,a[2]!=0);
   else if(a[0]==3)((void(*)(void *,void *,void *))0x10032f5b0UL)(barn,p,game_state);
   else if(a[0]>=4&&a[0]<=7){static uintptr_t f[]={0x10032ea90UL,0x10032e540UL,0x10032e920UL,0x10032ec50UL};((void(*)(void *,void *))f[a[0]-4])(barn,game_state);}
   else if(a[0]==8){void *found=((void *(*)(void *,uint16_t))0x10032f3e0UL)(barn,a[1]);record(104,id(found),0,0,0,0,0);}
   else if(a[0]==9||a[0]==10){if(event_count>1280)return 9;void *list[1280];for(uint32_t j=0;j<event_count;j++)list[j]=a[0]==9?barn+0x30+j*16:events+j*128;((void(*)(void *,void *))(a[0]==9?0x1003315d0UL:0x100330980UL))(list,list+event_count);for(uint32_t j=0;j<event_count;j++){void *event=list[j];if(a[0]==9)memcpy(&event,list[j],8);record(105,j,id(event),0,0,0,0);}}
   else return 9;
  }
  uint32_t result[]={asserts,assert_line,log_events,log_chars,trace_count};write_exact(result,sizeof(result));write_exact(trace,trace_count*28);
  for(uint32_t i=0;i<event_count;i++){uint8_t *p=events+i*128;memset(p,0,8);memset(p+0x18,0,8);if(drivers[i*4])memset(p+0x38,0,24);if(drivers[i*4]==2)memset(p+0x58,0,16);}write_exact(events,event_count*128);
  for(uint32_t i=0;i<1280;i++){void *event,*next;memcpy(&event,barn+0x30+i*16,8);memcpy(&next,barn+0x38+i*16,8);uint64_t encoded=event?(uint64_t)id(event)+1:0;memcpy(barn+0x30+i*16,&encoded,8);encoded=next?(uint64_t)(((uint8_t *)next-barn-0x30)/16)+1:0;memcpy(barn+0x38+i*16,&encoded,8);}
  memcpy(&head,barn+0x5030,8);uint64_t encoded=head?(uint64_t)(((uint8_t *)head-barn-0x30)/16)+1:0;memcpy(barn+0x5030,&encoded,8);write_exact(barn,0x5040);write_exact(barn+0x1050f0,4);write_exact(float_cells,h[8]*32);
  if(scratch){free(scratch);scratch=NULL;}free(events);free(rules);free(hits);free(actions);free(drivers);free(float_cells);
 }
 return 0;
}
