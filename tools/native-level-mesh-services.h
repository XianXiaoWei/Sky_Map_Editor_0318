/* Original LevelMesh reflection descriptors; table construction and class
 * conversions are registry services, never substitute mesh/model methods. */
static void *level_mesh_receiver(void){return registry+0x5d00;}
static void setup_level_mesh(void){
 memset(registry+0x7000,0,0x2000);ptr(registry+0x5d00,(uintptr_t)vt);
 ptr(registry+0x98+16*8,(uintptr_t)(registry+0x5b00));ptr(registry+0x5b00,(uintptr_t)vt);memcpy(registry+0x5b38,&(uint32_t){16},4);ptr(registry+0x5b50,(uintptr_t)(registry+0x7000));
 const char *names[]={"GetEnabled","GetObb","GetTransform","SetEnabled","SetTransform"};
 uintptr_t members[]={0x11,0x21,0x19,0x1003ffe50UL,0x1003ffe10UL},wrappers[]={0x100403ac0UL,0x1004038e0UL,0x1004038e0UL,0x1004039a0UL,0x1004037c0UL};
 for(int i=0;i<5;i++){uint8_t *node=registry+0x7100+i*64,*desc=registry+0x7400+i*128,*name=registry+0x7800+i*32;strcpy((char *)name,names[i]);ptr(node+32,(uintptr_t)name);ptr(node+40,(uintptr_t)desc);ptr(desc+56,members[i]);ptr(desc+72,wrappers[i]);ptr(desc+88,0x102310400UL);}
 ptr(registry+0x7008,(uintptr_t)(registry+0x7180));ptr(registry+0x7180,(uintptr_t)(registry+0x7100));ptr(registry+0x7188,(uintptr_t)(registry+0x71c0));ptr(registry+0x7108,(uintptr_t)(registry+0x7140));ptr(registry+0x71c8,(uintptr_t)(registry+0x7200));
}
static void level_mesh_convert(void *type,void *out,void *in,void *source){
 if(type==registry+0x5d00){void *p=*(void **)in;log_service(2,type,pointer_code(p));*(void **)out=(uint8_t *)p-8;}
 else transform_convert(type,out,in,source);
}
static void *level_mesh_asclass(void *type){log_service(1,type,0);if(u32((uint8_t *)type+56)==15){log_service(60,type,15);error_line=0xfffffffe;longjmp(escape,1);}return type;}
static void install_level_mesh(void){
 ptr((void *)0x1020019a8UL,(uintptr_t)(registry+0x5b00));ptr((void *)0x102001948UL,(uintptr_t)(registry+0x5e00));ptr((void *)0x10203f218UL,(uintptr_t)(registry+0x5f00));ptr((void *)0x102003230UL,(uintptr_t)(registry+0x5f00));
 hook(0x102310400UL,level_mesh_receiver);vt[0x40/8]=(uintptr_t)level_mesh_convert;vt[0x68/8]=(uintptr_t)level_mesh_asclass;
}
