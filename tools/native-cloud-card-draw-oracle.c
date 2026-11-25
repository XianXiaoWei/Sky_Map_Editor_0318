/* Run untouched original queue preparation, optional sort and draw submission
 * instructions. Explicit post-visibility card pointer order and eye inputs.
 * Camera getter and GPU draw calls are callbacks; no visibility/vertex math. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static void hook(uintptr_t at,void *fn) {
    uint8_t jump[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(jump+2,&fn,8);memcpy((void *)at,jump,12);
}
static void readin(void *p,size_t n) { if(fread(p,1,n,stdin)!=n)exit(10); }
static void eye_get(void *out,void *eye) { memcpy(out,eye,16); }
static void draw(void *renderer,uint32_t first,uint32_t count) { (void)renderer;fwrite(&first,4,1,stdout);fwrite(&count,4,1,stdout); }
static void noop(void) {}
__attribute__((naked,noinline)) static void run_queue(void **cards __attribute__((unused)),unsigned count __attribute__((unused)),
    float *eye __attribute__((unused)),void *queue __attribute__((unused))) {
    __asm__ volatile(
      "push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x148,%rsp\n"
      "mov %rdi,-0x38(%rbp)\nmov %rsi,-0x30(%rbp)\nmov %rdx,-0xa8(%rbp)\nmov %rcx,-0x80(%rbp)\n"
      "movq $0,-0xd8(%rbp)\nlea 8(%rcx),%rbx\nxor %r15d,%r15d\nlea -0x160(%rbp),%r14\n"
      "movabs $0x100221270,%rax\njmp *%rax\n");
}
int main(int argc,char **argv) {
    if(argc!=2)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
    fclose(file);
    static uint64_t guard=123;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    hook(0x10076be90UL,eye_get);hook(0x1007f6ae0UL,draw);hook(0x1007f6540UL,noop);
    /* Stop at the original epilogue before vertex/resources/debug cleanup. */
    uint8_t jump[5]={0xe9};int32_t relative=0x1002213bcUL-(0x100221339UL+5);memcpy(jump+1,&relative,4);memcpy((void *)0x100221339UL,jump,5);
    static _Alignas(32) uint8_t records[512*128],meshes[512*64],queue[512*12];static void *cards[512];
    uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
    for(unsigned c=0;c<cases;c++) {
        uint32_t count,sort;_Alignas(32) float eye[4]={0};readin(&count,4);readin(&sort,4);readin(eye,12);
        if(count>512||sort>1)return 5;
        memset(records,0,sizeof(records));memset(meshes,0,sizeof(meshes));memset(queue,0,sizeof(queue));
        for(unsigned i=0;i<count;i++) {
            cards[i]=records+i*128;void *mesh=meshes+i*64;memcpy(records+i*128+8,&mesh,8);
            readin(records+i*128+0x70,16);readin(records+i*128+0x1c,4);readin(meshes+i*64+0x38,4);
        }
        *(uint8_t *)0x100c96180UL=(uint8_t)sort;fwrite(&count,4,1,stdout);
        if(count)run_queue(cards,count,eye,queue);
        fwrite(queue,12,count,stdout);
    }
    return 0;
}
