/* Execute untouched original inverse and local camera direction instructions.
 * Camera getter is an explicit callback; stop before axis-angle/vertex logic. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static void readin(void *p,size_t n) {if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn) {
    uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);
}
static void eye_get(void *out,void *eye) {memcpy(out,eye,16);}
__attribute__((naked,noinline)) static void run_facing(void **cards __attribute__((unused)),unsigned count __attribute__((unused)),
    float *eye __attribute__((unused)),float *directions __attribute__((unused))) {
    __asm__ volatile("push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x148,%rsp\n"
      "mov %rdi,-0x38(%rbp)\nmov %rsi,-0x30(%rbp)\nmov %rdx,%r13\nmov %rcx,%r12\n"
      "xor %r15d,%r15d\nlea -0x120(%rbp),%r14\nmovabs $0x100220bd0,%rax\njmp *%rax\n");
}
int main(int argc,char **argv) {
    if(argc!=2)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
    fclose(file);hook(0x10076be90UL,eye_get);
    uint8_t j[5]={0xe9};int32_t relative=0x1002213bcUL-(0x100220c79UL+5);memcpy(j+1,&relative,4);memcpy((void *)0x100220c79UL,j,5);
    static _Alignas(32) uint8_t records[512*128];static _Alignas(32) float worlds[512*16],directions[512*4];static void *cards[512];
    uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
    for(unsigned c=0;c<cases;c++) {
        uint32_t count,n;readin(&count,4);readin(&n,4);if(count>512||n>count)return 5;
        _Alignas(32) float eye[4]={0,0,0,1};uint32_t order[512];readin(eye,12);readin(order,n*4);readin(worlds,count*64);
        fwrite(&count,4,1,stdout);
        for(unsigned i=0;i<count;i++) {
            void *inverse=records+i*128+0x30;
            ((void *(*)(void *,void *))0x100076940UL)(inverse,worlds+i*16);fwrite(inverse,64,1,stdout);
        }
        for(unsigned i=0;i<n;i++){if(order[i]>=count)return 6;cards[i]=records+order[i]*128;}
        fwrite(&n,4,1,stdout);if(n)run_facing(cards,n,eye,directions);fwrite(directions,16,n,stdout);
    }
    return 0;
}
