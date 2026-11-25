/* Original vector-default parser inside TGCL loader, 0x10040cc78..0x10040cec3.
 * A trampoline supplies its real stack layout. Escape after parsing uses
 * setjmp/longjmp; the original instructions are never patched. Imported
 * strncpy/strlen/strtof are bound to Linux libc: this verifies the instruction
 * path with these dependencies, not the unavailable original macOS libc.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>

static jmp_buf escape;
static uintptr_t type_vtable[3];
static uintptr_t *type_object=type_vtable;
static void *get_type(void) { return &type_object; }
static size_t get_size(void *p) { (void)p; return 16; }
static void stop_parsing(void) { longjmp(escape, 1); }
extern void run_vector(const char *, void *, void *);
__asm__(
    ".text\n"
    ".global run_vector\n"
    "run_vector:\n"
    "and $-32, %rsp\n"
    "sub $0x17a0, %rsp\n"
    "mov %rsi, %r12\n"
    "mov %rsi, 0x28(%rsp)\n"
    "movq $0, 0x38(%rsp)\n"
    "mov %rdx, 0x10(%rsp)\n"
    "lea 0x100(%rsp), %r15\n"
    "mov %rdi, 8(%r15)\n"
    "lea 0x1580(%rsp), %r14\n"
    "movabs $0x10040cc78, %rax\n"
    "jmp *%rax\n"
);
static void bind(uintptr_t address, const void *fn) { memcpy((void *)address, &fn, 8); }
int main(int argc, char **argv) {
    if (argc!=2) return 2;
    FILE *file=fopen(argv[1],"rb"); if(!file) return 3;
    void *text=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(text==MAP_FAILED) return 4;
    if(fread(text,1,0xd22000,file)!=0xd22000) return 5;
    fclose(file);
    if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC)) return 6;
    /* Imported stub GOT slots, validated by Python against the native stubs. */
    bind(0x100c0ef40UL,strncpy); bind(0x100c0ef28UL,strlen); bind(0x100c0ef78UL,strtof);
    uintptr_t wrapper[7]={0}; wrapper[0x28/8]=(uintptr_t)get_type; wrapper[0x30/8]=(uintptr_t)stop_parsing;
    type_vtable[0x10/8]=(uintptr_t)get_size;
    char input[128];
    while(fread(input,1,sizeof(input),stdin)==sizeof(input)) {
        if(input[127]) return 7;
        static uint8_t record[28]; memset(record,0,sizeof(record));
        if(setjmp(escape)==0) run_vector(input,record,wrapper);
        if(fwrite(record+12,16,1,stdout)!=1) return 8;
    }
    return ferror(stdin)?9:0;
}
