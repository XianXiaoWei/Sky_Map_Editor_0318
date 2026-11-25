/* Execute the original CloudCardBarn load. Intercept sort to capture the
 * original pre-sort bounds/groups; mock resource/GPU operations explicitly. */
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static _Alignas(32) uint8_t barn[0x20a00], level[0xb0];
static uint8_t **resources, **meshes;
static unsigned count;
static int sorted;
static uint8_t original_sort[12];
static uint32_t *uploaded_indices, uploaded_count;
static void ptr(void *p, size_t at, void *v) { memcpy((char *)p+at,&v,8); }
static void put32(void *p, size_t at, uint32_t v) { memcpy((char *)p+at,&v,4); }
static void readin(void *p, size_t n) { if(fread(p,1,n,stdin)!=n)exit(10); }
static void hook(uintptr_t at, void *fn) {
    uint8_t jump[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(jump+2,&fn,8); memcpy((void *)at,jump,12);
}
static void bind(uintptr_t stub, void *fn) {
    int32_t rel; memcpy(&rel,(void *)(stub+2),4); ptr((void *)(stub+6+rel),0,fn);
}
static void *allocate(void *heap,size_t n,void *tag,unsigned align) {
    (void)heap;(void)tag;(void)align;
    void *p=NULL;if(posix_memalign(&p,32,n?n:32))exit(11);memset(p,0,n?n:32);return p;
}
static void release(void *heap,void *p) { (void)heap;free(p); }
static void *dummy(void) { static uint8_t value[32];return value; }
static void noop(void) {}
static void observer_init(void *p) { memset(p,0,32); }
static void observer_set(void *resource,void *p) { ptr(p,0,resource); }
static void *find(void *manager,void *type,uintptr_t name) {
    (void)manager;(void)type;return name&&name<=count?resources[name-1]:NULL;
}
static unsigned get_id(void *card) { return (unsigned)(((uint8_t *)card-barn-0x10)/0x80); }
static uintptr_t get_name(void *card) { return get_id(card)+1; }
static unsigned bake_missing(void *handle,unsigned guid,void **out) { (void)handle;(void)guid;(void)out;return 0; }
static void renderer_init(void) { barn[0x209a8]=1; }
static void index_upload(void *object,unsigned slot,unsigned type,unsigned usage,unsigned n,void *data) {
    (void)object;(void)slot;(void)usage;
    if(type!=9)exit(13);
    uploaded_count=n;uploaded_indices=malloc(n?n*4:1);memcpy(uploaded_indices,data,n*4);
}
static void capture_sort(void *begin,void *end) {
    if((char *)end-(char *)begin!=(ptrdiff_t)count*128)exit(12);
    for(unsigned i=0;i<count;i++) {
        uint8_t *p=(uint8_t *)begin+i*128;
        fwrite(p+0x70,4,4,stdout);fwrite(p+0x20,4,1,stdout);
    }
    if(sorted) {
        memcpy((void *)0x100222830UL,original_sort,12);
        ((void (*)(void *,void *))0x100222830UL)(begin,end);
        hook(0x100222830UL,capture_sort);
    }
}
int main(int argc,char **argv) {
    if(argc!=2&&argc!=3)return 2;
    sorted=argc==3&&!strcmp(argv[2],"--sorted");
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
    fclose(file);
    static uint64_t guard=123;ptr((void *)0x100c0d8d8UL,0,&guard);
    bind(0x100aa2900UL,memset);
    hook(0x1007c6c20UL,dummy);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);
    hook(0x1007c2530UL,observer_init);hook(0x1007c2570UL,noop);hook(0x1007c2310UL,observer_set);
    hook(0x1003f10c0UL,dummy);hook(0x1004559d0UL,dummy);hook(0x10079ac90UL,dummy);
    hook(0x1007c4360UL,find);hook(0x1007c4640UL,find);hook(0x1003f68d0UL,bake_missing);
    memcpy(original_sort,(void *)0x100222830UL,12);hook(0x100222830UL,capture_sort);
    const uintptr_t mocks[]={0x1007f53c0UL,0x1007f5430UL,0x1007f5690UL,0x1007be8b0UL};
    for(unsigned i=0;i<sizeof(mocks)/sizeof(*mocks);i++)hook(mocks[i],noop);
    if(sorted)hook(0x1007f55d0UL,index_upload);else hook(0x1007f55d0UL,noop);
    hook(0x1007f5d90UL,renderer_init);
    static void *vtable[8];vtable[6]=get_id;vtable[7]=get_name;
    uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
    for(unsigned c=0;c<cases;c++) {
        readin(&count,4);if(count>512)return 5;fwrite(&count,4,1,stdout);
        memset(barn,0,sizeof(barn));memset(level,0,sizeof(level));
        resources=calloc(count?count:1,sizeof(*resources));meshes=calloc(count?count:1,sizeof(*meshes));
        ptr(barn,0x10018,allocate(NULL,count*128,NULL,32));put32(barn,0x10010,count);
        for(unsigned i=0;i<count;i++) {
            uint8_t *card=barn+0x10+i*128;ptr(card,0,vtable);readin(card+0x10,64);
            meshes[i]=allocate(NULL,0xc0,NULL,32);readin(meshes[i]+4,24);
            uint32_t vc,ic;readin(&vc,4);readin(&ic,4);put32(meshes[i],0x34,vc);put32(meshes[i],0x38,ic);
            void *positions=allocate(NULL,vc*16,NULL,32),*indices=allocate(NULL,ic*4,NULL,32);
            readin(positions,vc*16);readin(indices,ic*4);ptr(meshes[i],0x60,positions);ptr(meshes[i],0x80,indices);
            resources[i]=allocate(NULL,0x20,NULL,32);void *observed=allocate(NULL,0x100,NULL,32);
            ptr(resources[i],0x10,observed);ptr(observed,0xf0,meshes[i]);
        }
        ((void (*)(void *,void *,void *,void *))0x10021fb40UL)(barn,(void *)1,(void *)1,level);
        if(sorted) {
            void *records;memcpy(&records,barn+0x10018,8);
            for(unsigned i=0;i<count;i++) {
                uint8_t *record=(uint8_t *)records+i*128;void *card,*mesh;
                memcpy(&card,record,8);memcpy(&mesh,record+8,8);
                const uint32_t id=get_id(card);fwrite(&id,4,1,stdout);
                fwrite(record+0x20,4,1,stdout);fwrite(record+0x18,4,2,stdout);fwrite((char *)mesh+0x34,4,2,stdout);
            }
            fwrite(&uploaded_count,4,1,stdout);fwrite(uploaded_indices,4,uploaded_count,stdout);
            free(uploaded_indices);uploaded_indices=NULL;uploaded_count=0;
        }
        /* Case allocations are small and live until process exit; captured
         * original temporary allocations are released by its own load path. */
    }
    return 0;
}
