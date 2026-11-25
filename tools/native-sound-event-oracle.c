/* Full original PlaySound2D Update/OnResumeEnabled with explicit manager,
 * sound handle, description and GameTime services. No FMOD playback occurs. */
#define main numeric_oracle_main
#include "native-object-numeric-oracle.c"
#undef main
static uint32_t h[13],id_calls;
static uintptr_t handle_vtable[18],description_vtable[10];
static uintptr_t handle_object[2],description_object[2];
static uint8_t options_snapshot[128],parameters_snapshot[0x1b0],zero_snapshot[0x1b0];
static uint32_t trace[4096][2],trace_count,play_count,parameter_count;
static char name_snapshot[128];
static void record(uint32_t kind,uint32_t arg){if(trace_count>=4096)exit(11);trace[trace_count][0]=kind;trace[trace_count++][1]=arg;}
static uint64_t handle_id(void *p){(void)p;id_calls++;uint64_t id=id_calls>h[12]?2:1;record(2,(uint32_t)id);return id;}
static uint8_t is_playing(void *p){(void)p;record(3,h[5]);return h[5]!=0;}
static void *get_description(void *p){(void)p;record(4,0);return description_object;}
static uint8_t description_playing(void *p){(void)p;record(5,h[6]);return h[6]!=0;}
static void stop_sound(void *p,uint32_t immediate){(void)p;record(6,immediate);}
static void set_parameters(void *p,void *parameters){(void)p;record(7,0);parameter_count++;memcpy(parameters_snapshot,parameters,0x1b0);}
struct HandleResult {void *handle;uint64_t id;};
static struct HandleResult play_sound(void *manager,const char *name,const void *options,const void *parameters){
 (void)manager;record(1,0);play_count++;strncpy(name_snapshot,name,127);name_snapshot[127]=0;memcpy(options_snapshot,options,128);memcpy(zero_snapshot,parameters,0x1b0);
 return (struct HandleResult){h[2]?handle_object:NULL,h[3]?1:0};
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int initialized=initialize_native(argv[1]);if(initialized)return initialized;
 if(mprotect((void *)0x100601000UL,4096,PROT_READ|PROT_WRITE|PROT_EXEC))return 6;
 uint8_t *stub=(uint8_t *)0x1006018a0UL;stub[0]=0xff;stub[1]=0x25;memset(stub+2,0,4);void *fn=play_sound;memcpy(stub+6,&fn,8);
 if(mprotect((void *)0x100601000UL,4096,PROT_READ|PROT_EXEC))return 6;
 handle_vtable[0]=(uintptr_t)handle_id;handle_vtable[1]=(uintptr_t)get_description;handle_vtable[2]=(uintptr_t)is_playing;handle_vtable[6]=(uintptr_t)stop_sound;handle_vtable[17]=(uintptr_t)set_parameters;handle_object[0]=(uintptr_t)handle_vtable;
 description_vtable[9]=(uintptr_t)description_playing;description_object[0]=(uintptr_t)description_vtable;
 uint32_t count;read_exact(&count,4);write_exact(&count,4);
 while(count--){
  read_exact(h,sizeof(h));_Alignas(32) uint8_t event[128],barn[32],time[0x1090],game[0x600];char name[128];
  read_exact(event,128);read_exact(barn,32);read_exact(name,128);if(name[127])return 9;
  memset(time,0,sizeof(time));memset(game,0,sizeof(game));memcpy(time+0x108c,h+8,4);memcpy(time+0x18,h+9,4);
  void *p=barn;memcpy(event+0x18,&p,8);p=h[7]?time:NULL;memcpy(event+0x58,&p,8);p=h[2]?handle_object:NULL;memcpy(event+0x60,&p,8);uint64_t id=h[3]?1:0;memcpy(event+0x68,&id,8);event[0x70]=h[1];
  memset(event+0x38,0,24);size_t length=strlen(name);if(length<=22){event[0x38]=(uint8_t)(length*2);memcpy(event+0x39,name,length+1);}else{event[0x38]=1;memcpy(event+0x40,&length,8);p=name;memcpy(event+0x48,&p,8);}
  p=(void *)0x3180abcdUL;memcpy(game+0x5c8,&p,8);
  id_calls=trace_count=play_count=parameter_count=log_events=log_chars=0;memset(options_snapshot,0xef,128);memset(parameters_snapshot,0xef,0x1b0);memset(zero_snapshot,0xef,0x1b0);memset(name_snapshot,0,128);
  typedef void (*SoundExecute)(void *,void *);SoundExecute execute=(SoundExecute)(h[0]?0x1005343d0UL:0x100534410UL);
  for(uint32_t i=0;i<h[11];i++)execute(event,game);
  uint32_t output[]={event[0x70],play_count,parameter_count,trace_count};write_exact(output,sizeof(output));write_exact(trace,trace_count*8);write_exact(options_snapshot,128);write_exact(parameters_snapshot,0x1b0);write_exact(zero_snapshot,0x1b0);write_exact(name_snapshot,128);
  memset(event+0x18,0,8);memset(event+0x58,0,24);memset(event+0x38,0,24);write_exact(event,128);write_exact(barn,32);
 }
 return 0;
}
