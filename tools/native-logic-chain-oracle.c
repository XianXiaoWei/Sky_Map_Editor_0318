/* Reuse only the original-image mapping, libc binding, assertion trampoline
 * and IO utilities. This runner has separate multi-object allocation/services. */
#define main foundation_main
#include "native-object-foundation-oracle.c"
#undef main
static uint8_t *marker_barn=(void *)0x290000000UL;
static uint8_t logic_frame_markers[256][0x10b0];
static uint8_t *clump_barn=(void *)0x270000000UL;
static uint32_t string_cursor,body_cursor,array_cursor,logic_frames,logic_frame_seq[256];
static uint8_t logic_frame_objects[256][0x4000];
static uint32_t norm(void *p){if(!p)return 0xffffffff;if((uint8_t *)p>=marker_barn&&(uint8_t *)p<marker_barn+0x140c0)return 0x200000+(uint8_t *)p-marker_barn;if((uint8_t *)p>=clump_barn&&(uint8_t *)p<clump_barn+0x2b000)return 0x100000+(uint8_t *)p-clump_barn;return (uint8_t *)p-objects;}
static void *lobject(void){return registry+0x5000;}
static void *lbool(void *ignored){(void)ignored;return registry+0x5800;}
static void *lvoid(void){return registry+0x5900;}
static void *lint(void *ignored){(void)ignored;return registry+0x5a00;}
static void *levent(void){return registry+0x5700;}
static void *lfallback(void){return registry+0x5000;}
static void *lparent(void){log_service(31,NULL,0);return registry+0x5700;}
static void *lereceiver(void){return registry+0x5c00;}
static void *lmreceiver(void){return registry+0x6800;}
static void *leresumereceiver(void){return registry+0x5300;}
static void *lgamepointer(void){return registry+0x8c00;}
static void *lgamebyname(void *name,uint8_t cache){(void)name;log_service(56,NULL,cache);return registry+0x8a00;}
static void *lcreceiver(void){return registry+0x5b00;}
static void *lasclass(void *type){if(type==registry+0x6000){log_service(42,type,0);error_line=0xfffffffe;severity=0;longjmp(escape,1);}return u32(registry+0xbff8)==2&&type==registry+0x5500?NULL:type;}
static void *lcastobject(void *type,void **object){uint32_t id=u32((uint8_t *)type+0x38);return ((id>=3&&id<=7)||(id>=9&&id<=13))?(uint8_t *)*object-8:*object;}
static void lconvert(void *type,void *out,void *in,void *source){
 if(type==registry+0x5800){memcpy(out,in,1);log_service(32,type,*(uint8_t *)in);return;}
 if(type==registry+0x5a00){memcpy(out,in,4);return;}
 void *value=*(void **)in;
 if(type==registry+0x5100){log_service(54,NULL,norm(value));if(u32(registry+0xbff8)==4&&!registry[0xbffc]){uint8_t *group=(void *)(uintptr_t)u64(registry+0xe800);memcpy(group+0x10,&(uint32_t){1},4);registry[0xbffc]=1;}*(void **)out=value&&u32(value)==1?value:NULL;return;}
 if(type==registry+0x8c00){log_service(57,source,(uint8_t *)in-registry);*(void **)out=in;return;}
 if(type==registry+0x5b00||type==registry+0x5c00||type==registry+0x6800||type==registry+0x5300){
  log_service(33,type,norm(value));
  if(u32(registry+0xbff8)==1){*(void **)out=NULL;return;}
  if(u32(registry+0xbff8)==3&&!registry[0xbffc]&&type==registry+0x5c00){uint8_t *group=(void *)(uintptr_t)u64(registry+0xe800);memcpy(group+0x10,&(uint32_t){1},4);memcpy(group+8,&(uintptr_t){u64(group+8)+8},8);registry[0xbffc]=1;}
  if((type==registry+0x5c00||type==registry+0x6800||type==registry+0x5300)&&source==registry+0x5000)value=(uint8_t *)value-8;
 }else if(type==registry+0x5700&&source==registry+0x5000){value=value&&((u32(value)>=3&&u32(value)<=6)||(u32(value)>=9&&u32(value)<=11)||u32(value)==13)?(uint8_t *)value-8:NULL;}
 *(void **)out=value;
}
static uint64_t lsize(void *meta){uint32_t k=u32((uint8_t *)meta+0x38);return k==1?24:k==3?72:k==4?88:k==5?96:k==10?72:k==11?192:k==13?64:80;}
static uint64_t lalign(void *meta){(void)meta;return 8;}
static void *lallocate(void *heap,uint64_t size,void *label,uint64_t alignment){
 (void)label;log_service(34,NULL,norm(heap));log_service(35,NULL,size);log_service(36,NULL,alignment);
 if(heap==registry+0x5f00)return scratch_storage;
 if(heap==clump_barn+0x10){void *p=objects+array_cursor;array_cursor+=(size+15)&~15UL;if(array_cursor>0x10000)exit(22);return p;}
 void *p=objects+body_cursor++*256;if(body_cursor>64)exit(23);return p;
}
static void lfree(void *heap,void *p){log_service(37,NULL,norm(heap));log_service(38,NULL,norm(p));}
static void lclear(void *heap){log_service(39,NULL,norm(heap));}
static void *lconstruct(void *meta,void *storage){
 uint32_t k=u32((uint8_t *)meta+0x38);uintptr_t fun=k==1?0x100716930UL:k==3?0x100316c40UL:k==4?0x100718210UL:k==5?0x100719390UL:k==9?0x1002c62f0UL:k==10?0x100717a10UL:k==11?0x100719e20UL:k==12?0x10043e1b0UL:k==13?0x10058abf0UL:0x100719090UL;
 return ((void *(*)(void *,void *))fun)(meta,storage);
}
static uint8_t lbeat(void *p){(void)p;log_service(43,NULL,registry[0x99c0]);return registry[0x99c0];}
static void *lpoolallocate(void *pool,uint64_t bytes){(void)pool;void *p;if(bytes==40){p=registry+pool_cursor;pool_cursor+=bytes;}else{p=objects+string_cursor;string_cursor+=bytes;if(string_cursor>0x10000)exit(26);log_service(45,NULL,norm(p));log_service(46,NULL,bytes);}if(pool_cursor>0x10000)exit(24);return p;}
static void *lpool(void){return registry+0x5e00;}
static void lpoolfree(void *pool,void *p){(void)pool;if((uint8_t *)p>=objects+0x8000&&(uint8_t *)p<objects+0x10000)log_service(47,NULL,norm(p));}
static void lstringlength(void){log_service(55,NULL,0);error_line=0xfffffffd;severity=0;longjmp(escape,1);}
static void lstreaminit(void *p,void *s){(void)p;(void)s;}
static void lstreambegin(void *p,const char *s,uint32_t level){(void)p;(void)s;log_service(48,NULL,level);}
static void *lstreamtext(void *p,const char *s,uint64_t n){uint32_t h=2166136261U;log_service(49,NULL,n);for(uint64_t i=0;i<n;i++)h=(h^(uint8_t)s[i])*16777619U;log_service(50,NULL,h);return p;}
static void *lstreampointer(void *p,void *value){log_service(53,NULL,norm(value));return p;}
static void *lstreamfloat(void *p,float value){uint32_t bits;memcpy(&bits,&value,4);log_service(51,NULL,bits);return p;}
static void lstreamend(void *p){(void)p;log_service(52,NULL,0);}
static void lstreamdestroy(void *p,void *s){(void)p;(void)s;}
static void *lscratch(void){return registry+0x5f00;}
static uint32_t lused(void *heap){(void)heap;return 17;}
static void *lfieldtype(void){return registry+0x5200;}
static void *lelementtype(void){return registry+0x5000;}
static void *lfieldaddress(void *type,void **object,void *source,uintptr_t member){(void)type;(void)source;return (uint8_t *)*object+member;}
static void lsnapshot(void){if(logic_frames>=256)exit(25);memcpy(logic_frame_objects[logic_frames],objects,0x4000);memcpy(logic_frame_markers[logic_frames],marker_barn,0x10b0);logic_frame_seq[logic_frames++]=u32(event_barn+0x10);}
static void logic_resolve(void);
__asm__(
 ".text\nlogic_resolve:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r14\npush %r15\nsub $0x1600,%rsp\n"
 "movabs $0x23000d48c,%rax\nmov (%rax),%eax\nmov %eax,0x157c(%rsp)\n"
 "movabs $0x230018000,%rax\nmov %rax,0x1570(%rsp)\n"
 "movabs $0x23000e800,%rax\nmov %rax,0xf0(%rsp)\n"
 "movabs $0x10040d2aa,%rax\njmp *%rax\n"
);
static void lmap(uintptr_t at,size_t size){if(mmap((void *)at,size,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
static void global(uintptr_t at,void *p){memcpy((void *)at,&p,8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;lmap(0x100000000UL,0x2400000);
 if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 lmap((uintptr_t)registry,0x40000);lmap((uintptr_t)objects,0x10000);lmap((uintptr_t)event_barn,0x105100);lmap((uintptr_t)clump_barn,0x2b000);lmap((uintptr_t)scratch_storage,0x3000);lmap((uintptr_t)marker_barn,0x15000);
 global(0x102047c70UL,registry);global(0x10203ac88UL,registry+0x5800);global(0x101df4858UL,registry+0x5800);global(0x102048b50UL,registry+0x5800);global(0x101de3078UL,registry+0x5800);
 global(0x10203a998UL,registry+0x5d00);global(0x10203aa30UL,registry+0x5100);global(0x101de2c88UL,registry+0x5200);global(0x101df0360UL,registry+0x5300);global(0x10203af10UL,registry+0x5400);global(0x10203b270UL,registry+0x5500);global(0x10203b1f0UL,registry+0x5600);global(0x101df4208UL,registry+0x5700);global(0x101ded9f8UL,registry+0x6500);global(0x10203add0UL,registry+0x6600);global(0x10203b790UL,registry+0x6700);global(0x100c0d8d8UL,&guard);global(0x1020045b8UL,registry+0x6800);global(0x10201f038UL,registry+0x6900);global(0x102004830UL,registry+0x8b00);global(0x10203f218UL,registry+0x8b00);global(0x1020476b0UL,registry+0x8b00);
 hook(0x1007abc10UL,lobject);hook(0x1007abbd0UL,lbool);hook(0x1007abbf0UL,lvoid);hook(0x1007abaf0UL,lint);hook(0x10032e2b0UL,levent);hook(0x1007abc60UL,lfallback);hook(0x100375c20UL,lgamepointer);hook(0x1007abc80UL,lgamebyname);hook(0x1007b0280UL,levent);
 hook(0x102310000UL,lparent);hook(0x102310100UL,lereceiver);hook(0x102310200UL,lcreceiver);hook(0x102310300UL,lfieldtype);hook(0x102310400UL,lelementtype);hook(0x102310500UL,lbeat);hook(0x102310600UL,lmreceiver);hook(0x102310700UL,leresumereceiver);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x10040d311UL,foundation_resolve_return);
 hook(0x100795530UL,lallocate);hook(0x100795a70UL,lfree);hook(0x100795650UL,lclear);hook(0x1007e50d0UL,lpool);hook(0x1007e5790UL,lpoolallocate);hook(0x1007e5db0UL,lpoolfree);hook(0x1007c6c20UL,lscratch);hook(0x100795b00UL,lused);
 bind(0x100aa230cUL,lstringlength);bind(0x100aa28faUL,memmove);bind(0x100aa2c7eUL,strlen);bind(0x100aa2450UL,lstreaminit);bind(0x100aa23d2UL,lstreamfloat);bind(0x100aa23c0UL,lstreampointer);bind(0x100aa23baUL,lstreamdestroy);bind(0x100aa245cUL,lstreamdestroy);hook(0x1007a56a0UL,lstreambegin);hook(0x100011930UL,lstreamtext);hook(0x1007a58d0UL,lstreamend);
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa24aaUL,bzero);bind(0x100aa28f4UL,memcpy);bind(0x100aa2900UL,memset);*(uint8_t *)0x100cd3120UL=0;
 vt[0x40/8]=(uintptr_t)lconvert;vt[0x68/8]=(uintptr_t)lasclass;vt[0xd8/8]=(uintptr_t)lcastobject;vt[0xa0/8]=(uintptr_t)lsize;vt[0xa8/8]=(uintptr_t)lalign;vt[0xc0/8]=(uintptr_t)lconstruct;vt[0xe0/8]=(uintptr_t)lfieldaddress;
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 uint32_t cases;rd(&cases,4);wr(&cases,4);
 while(cases--){
  rd(registry,0x40000);memset(objects,0xa5,0x10000);memset(clump_barn,0x5a,0x2b000);memset(event_barn,0,0x105100);memset(marker_barn,0x5a,0x140c0);memset(marker_barn+0x30,0,128);body_cursor=logic_frames=error_line=severity=log_count=0;array_cursor=0x4000;pool_cursor=0xf800;string_cursor=0x8000;
  global((uintptr_t)registry+0x6000,vt);for(int k=9;k<=13;k++)global((uintptr_t)registry+0x6500+(k-9)*256,vt);*(uint8_t *)0x101ffb0d0UL=registry[0x9844];memcpy((void *)0x100cb8540UL,registry+0x9840,4);
  global((uintptr_t)registry+0x8a00,vt);global((uintptr_t)registry+0x8b00,vt);global((uintptr_t)registry+0x8c00,vt);memcpy(registry+0x8b38,&(uint32_t){14},4);for(int i=0;i<16;i++)global((uintptr_t)registry+0x5000+i*256,vt);
  for(int i=0;i<512;i++){global((uintptr_t)registry+0x20000+i*80+0x28,(void *)0x102310400UL);global((uintptr_t)registry+0x20000+i*80+0x30,(void *)0x102310300UL);}
  uint32_t nodes=u32(registry+0xbff0),actions=u32(registry+0xbff4);if(nodes>48||actions>128)return 20;
  if(!setjmp(escape)){
   ((void *(*)(void *,void *))0x10043eaa0UL)(NULL,marker_barn);((void (*)(void *))0x10043d020UL)(marker_barn);((void (*)(void *))0x100715760UL)(registry+0xa000);((void (*)(void *))0x10022bdc0UL)(clump_barn);((void (*)(void *))0x10032e4a0UL)(event_barn);
   for(uint32_t i=0;i<nodes;i++){
    uint32_t kind=u32(registry+0xb000+i*16);void *object;
    if(kind==12)object=(uint8_t *)((void *(*)(void *,void *))0x10043d6a0UL)(marker_barn,registry+0x6800)+8;
    else if(kind==1)object=((void *(*)(void *,void *))0x100716250UL)(registry+0xa000,registry+0x5100);
    else if(kind==2)object=((void *(*)(void *))0x10022bf80UL)(clump_barn);
    else if(kind==8){object=lallocate(registry+0x6e00,24,NULL,8);memcpy(object,&kind,4);}
    else object=(uint8_t *)((void *(*)(void *,void *))0x10032ecf0UL)(event_barn,registry+(kind>=9?0x6500+(kind-9)*256:0x5000+kind*256))+8;
    if(kind!=8)((void (*)(void *,void *,void *))0x10040b390UL)(registry+0xc000,object,(void *)(uintptr_t)u64(registry+0xb008+i*16));
    memcpy(registry+0xe800+i*8,&object,8);
   }
   logic_resolve();((void (*)(void *,void *))0x10032e540UL)(event_barn,registry+0x9000);lsnapshot();
   for(uint32_t i=0;i<actions;i++){
    uint32_t *a=(void *)(registry+0x3c000+i*16);void *object=a[1]==UINT32_MAX?NULL:(void *)(uintptr_t)u64(registry+0xe800+a[1]*8);
    switch(a[0]){
     case 15:((void (*)(void *,void *))0x10043d7a0UL)(marker_barn,object?(uint8_t *)object-8:NULL);break;
     case 16:((void *(*)(void *,void *))0x10043d6a0UL)(marker_barn,registry+0x6800);break;
     case 18:memcpy(marker_barn+(a[2]==0?0x140b0:a[2]==1?0x10:0x30),a+3,4);break;
     case 19:((void (*)(void *,void *))0x10043d7a0UL)(marker_barn,marker_barn+0xb0+(a[2]==0?-80:81920));break;
     case 20:((void (*)(void *))0x10043d1d0UL)(marker_barn);break;
     case 21:((void *(*)(void *,void *))0x10043e1b0UL)(registry+0x6800,(uint8_t *)object-8);break;
     case 22:((uint8_t (*)(void *,void *,uint8_t))0x1004d2440UL)(object,registry+0x9000,a[2]);break;
     case 24:for(uint32_t j=0;j<a[1];j++)((void *(*)(void *,void *))0x10043d6a0UL)(marker_barn,registry+0x6800);break;
     case 0:((void (*)(void *,void *))0x10032ea90UL)(event_barn,registry+0x9000);lsnapshot();break;
     case 1:((void (*)(void *,uint8_t))0x1004d1f60UL)(object,a[2]);break;
     case 2:log_service(40,NULL,((uint8_t (*)(void *))0x1004d2050UL)(object));break;
     case 3:((void (*)(void *,uint32_t))0x10022b840UL)(object,a[2]);break;
     case 4:((void (*)(void *,void *))0x10022c0c0UL)(clump_barn,object);break;
     case 5:((void *(*)(void *,uint32_t))0x10022c000UL)(clump_barn,a[2]);break;
     case 6:memset((uint8_t *)object+0x18,0,8);break;
     case 14:memcpy((uint8_t *)object+a[2],a+3,4);break;case 12:memcpy(registry+0x9800+a[2],a+3,4);break;case 13:registry[0x99c0]=a[2];break;case 9:memcpy((uint8_t *)object-8+a[2],a+3,4);break;
     case 10:((void *(*)(void *,void *))0x10022c2d0UL)(NULL,object);break;
     case 11:((void (*)(void *))0x10022bd60UL)(object);break;
     case 8:for(uint32_t j=0;j<a[1];j++)((void *(*)(void *))0x10022bf80UL)(clump_barn);break;
     default:return 21;
    }
   }
   ((void (*)(void *,void *))0x10032e920UL)(event_barn,registry+0x9000);((void (*)(void *))0x10022bee0UL)(clump_barn);((void (*)(void *))0x10043d030UL)(marker_barn);((void (*)(void *))0x100715cd0UL)(registry+0xa000);((void (*)(void *))0x10032e4a0UL)(event_barn);
  }
  uint32_t out[]={error_line,severity,log_count,logic_frames};wr(out,16);wr(log_entries,log_count*12);
  for(uint32_t i=0;i<logic_frames;i++){wr(logic_frame_objects[i],0x4000);wr(logic_frame_markers[i],0x10b0);wr(logic_frame_seq+i,4);}
  wr(objects,0x10000);wr(marker_barn,0x140b4);wr(clump_barn,0x2a070);wr(event_barn,0x5100);wr(registry+0xd478,24);wr(registry+0xe800,nodes*8);
 }
 return 0;
}
