/* Execute unchanged Noise VOLU decoding, Noise initialization and CloudBarn
 * normalization/transpose. File I/O, heap, sampler and GPU upload are mocks.
 * The scalar/vector arithmetic and original resource selection are preserved.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static const char *data_root;
static void hook(uintptr_t at, void *fn) {
    uint8_t jump[] = {0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};
    memcpy(jump+2, &fn, 8); memcpy((void *)at, jump, 12);
}
static void bind(uintptr_t stub, void *fn) {
    int32_t rel; memcpy(&rel, (void *)(stub+2), 4); memcpy((void *)(stub+6+rel), &fn, 8);
}
static void *allocate(void *heap, size_t n, void *tag, unsigned align) { (void)heap; (void)tag; (void)align; return calloc(1,n?n:1); }
static void release(void *heap, void *p) { (void)heap; free(p); }
static void *dummy(void) { return (void *)1; }
static void noop(void) {}
static FILE *open_resource(const char *name) {
    char file[4096]; snprintf(file,sizeof(file),"%s/%s",data_root,!strncmp(name,"Data/",5)?name+5:name);
    return fopen(file,"rb");
}
static unsigned exists(void *resource, const char *name, uint64_t *size) {
    (void)resource; FILE *f=open_resource(name); if(!f)return 0;
    fseek(f,0,SEEK_END); *size=ftell(f); fclose(f); return 1;
}
static void read_resource(void *resource, const char *name, void *dest, uint32_t limit, uint32_t *size) {
    (void)resource; FILE *f=open_resource(name); if(!f)exit(10);
    *size=fread(dest,1,limit,f); fclose(f);
}
static uint32_t texture_header[5];
static void create_texture(void *object, const char *name, unsigned kind, unsigned w, unsigned h, unsigned d, unsigned format, unsigned flags) {
    (void)object; (void)flags; if(strcmp(name,"CloudNoise3D"))exit(11);
    texture_header[0]=w;texture_header[1]=h;texture_header[2]=d;texture_header[3]=format;texture_header[4]=kind;
}
static void upload(void *object, void *data) {
    (void)object;fwrite(texture_header,4,5,stdout);
    fwrite(data,1,(size_t)texture_header[0]*texture_header[1]*texture_header[2],stdout);
}
int main(int argc, char **argv) {
    if(argc!=4)return 2;data_root=argv[2]; FILE *f=fopen(argv[1],"rb");if(!f)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
    static uint64_t guard=123;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    bind(0x100aa2492UL,malloc);bind(0x100aa2c7eUL,strlen);bind(0x100aa2c5aUL,strcpy);
    hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x1007c6c20UL,dummy);
    hook(0x1007f81e0UL,exists);hook(0x1007f86c0UL,read_resource);
    hook(0x1007f04d0UL,noop);hook(0x1007f0960UL,create_texture);
    hook(0x1007f0c80UL,noop);hook(0x1007f0e00UL,upload);hook(0x10031b220UL,noop);
    if(strcmp(argv[3],"initialize")) {
        float *samples=NULL;uint32_t n=0;
        ((void (*)(void *,const char *,float **,uint32_t *))0x1004ba510UL)((void *)1,argv[3],&samples,&n);
        fwrite(&n,4,1,stdout);fwrite(samples,4,(size_t)n*n*n,stdout);return 0;
    }
    _Alignas(32) uint8_t noise[0x200]={0},args[64]={0},barn[0x40e00]={0};void *resource=(void *)1;memcpy(args+16,&resource,8);
    ((void (*)(void *,void *))0x1004b72d0UL)(noise,args);
    // Record exactly which file-backed slots were populated by native code.
    uint32_t count=0;for(unsigned i=0;i<20;i++){void *p;memcpy(&p,noise+0x60+i*8,8);if(p)count++;}
    fwrite(&count,4,1,stdout);
    for(unsigned i=0;i<20;i++) {
        float *p;memcpy(&p,noise+0x60+i*8,8);if(!p)continue;
        uint32_t n;memcpy(&n,noise+0x0c+i*4,4);fwrite(&i,4,1,stdout);fwrite(&n,4,1,stdout);fwrite(p,4,(size_t)n*n*n,stdout);
    }
    ((void (*)(void *,void *,void *))0x100211690UL)(barn,noise,(void *)1);
    uint32_t points;if(fread(&points,4,1,stdin)!=1)return 12;fwrite(&points,4,1,stdout);
    for(uint32_t i=0;i<points;i++) {
        _Alignas(32) float position[4]={0};if(fread(position,4,3,stdin)!=3)return 13;
        float sample=((float (*)(void *,const float *))0x100214810UL)(barn,position);fwrite(&sample,4,1,stdout);
    }
    return 0;
}
