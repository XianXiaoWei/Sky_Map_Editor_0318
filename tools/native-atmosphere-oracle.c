/* Execute the supplied game's unmodified Ambience samplers. The caller checks
 * the executable SHA. Only imported expf/exp2f are bound to Linux libm; this
 * checks the game algorithm, not the unavailable macOS libm implementation. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>

static int bind_import(uintptr_t stub, float (*fn)(float)) {
    const uint8_t *p = (const uint8_t *)stub;
    if (p[0] != 0xff || p[1] != 0x25) return 0;
    int32_t displacement; memcpy(&displacement, p+2, 4);
    uintptr_t got = stub + 6 + displacement;
    if (got < 0x100c05000UL || got >= 0x100d22000UL) return 0;
    memcpy((void *)got, &fn, 8); return 1;
}
/* Prepared caller for the original non-cheap-fog probe miss suffix. The
 * scene query has already returned no hit. Original clamp, RSQRT/Newton,
 * atmosphere call, output stores and checked epilogue all execute. */
__attribute__((naked,noinline)) static void *probe_miss(void *result, void *ambience, void *eye, void *direction) {
    __asm__ volatile("push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x178,%rsp\n"
        "mov %rdi,%r14\nmov %rsi,%r12\nmov %rdx,%r15\nmov %rcx,%rbx\n"
        "movabs $0x100c0d8d8,%rax\nmov (%rax),%rax\nmov (%rax),%rax\nmov %rax,-0x30(%rbp)\n"
        "movabs $0x1000624fd,%rax\njmp *%rax\n");
}
static void *capture_miss_direction(void *result, void *ambience, void *eye, void *direction) {
    (void)ambience;(void)eye;memcpy(result,direction,16);return result;
}
int main(int argc, char **argv) {
    if (argc != 2 && (argc != 3 || (strcmp(argv[2], "--initial") && strcmp(argv[2], "--probe-miss-directions") && strcmp(argv[2], "--probe-rsqrt")))) return 2;
    FILE *file = fopen(argv[1], "rb"); if (!file) return 3;
    void *memory = mmap((void *)0x100000000UL, 0x2400000, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
    if (memory == MAP_FAILED) return 4;
    if (fread(memory, 1, 0xd22000, file) != 0xd22000) return 5;
    fclose(file);
    static uint64_t guard = 0x123456789abcdefUL;
    const void *guard_ptr = &guard; memcpy((void *)0x100c0d8d8UL, &guard_ptr, 8);
    if(argc==3 && !strcmp(argv[2],"--probe-rsqrt")) {
        /* Isolate the four bytes of the very same original RSQRT instruction.
         * Register moves/ret are the explicit caller boundary, not an oracle
         * reimplementation of its arithmetic. */
        uint8_t code[]={0xc5,0xfa,0x10,0xd0, 0,0,0,0, 0xc5,0xf8,0x28,0xc3,0xc3};
        memcpy(code+4,(void *)0x10006253bUL,4);
        void *kernel=mmap(NULL,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
        if(kernel==MAP_FAILED)return 4;memcpy(kernel,code,sizeof(code));if(mprotect(kernel,4096,PROT_READ|PROT_EXEC))return 6;
        float input;while(fread(&input,4,1,stdin)==1){float output=((float(*)(float))kernel)(input);if(fwrite(&output,4,1,stdout)!=1)return 10;}
        return ferror(stdin)?11:0;
    }
    if(argc==3 && !strcmp(argv[2],"--probe-miss-directions")) {
        void *capture=capture_miss_direction;
        memcpy((void *)0x100064c60UL,"\x48\xb8",2);memcpy((void *)0x100064c62UL,&capture,8);memcpy((void *)0x100064c6aUL,"\xff\xe0",2);
    }
    if (mprotect(memory, 0xc05000, PROT_READ | PROT_EXEC)) return 6;
    if (!bind_import(0x100aa2708UL, expf) || !bind_import(0x100aa2702UL, exp2f)) return 7;
    if (argc == 3 && !strcmp(argv[2], "--initial")) {
        /* Isolate the original initialization prefix. The endpoint jumps to
         * the original checked epilogue; unrelated random-array generation
         * is a no-op callback. All environment field stores remain original. */
        if (memcmp((void *)0x100059c4cUL, "\x48\x8d\x43\x20", 4)) return 12;
        if (mprotect(memory, 0xc05000, PROT_READ | PROT_WRITE | PROT_EXEC)) return 6;
        *(uint8_t *)0x1004143b0UL = 0xc3;
        *(uint8_t *)0x100059c4cUL = 0xe9;
        int32_t jump = 0x10005a83eUL - (0x100059c4cUL + 5);
        memcpy((void *)0x100059c4dUL, &jump, 4);
        if (mprotect(memory, 0xc05000, PROT_READ | PROT_EXEC)) return 6;
        static uint64_t guard = 0x123456789abcdefUL;
        const void *guard_ptr = &guard; memcpy((void *)0x100c0d8d8UL, &guard_ptr, 8);
        uint32_t quality;
        while (fread(&quality, 4, 1, stdin) == 1) {
            _Alignas(32) uint8_t ambience[0xb70d0], settings[0x220] = {0};
            memset(ambience, 0xa5, sizeof(ambience));
            if (fread((void *)0x10203f6b0UL, 16, 1, stdin) != 1) return 8;
            memcpy(settings+0x210, &quality, 4);
            typedef void (*Init)(void *, void *, void *, void *, void *);
            ((Init)0x100059a50UL)(ambience, NULL, NULL, NULL, settings);
            if (fwrite(ambience, 0x290, 1, stdout) != 1) return 10;
        }
        return ferror(stdin) ? 11 : 0;
    }
    typedef void *(*Sky)(void *, void *, float, float);
    typedef void *(*Cheap)(void *, void *, float, float, float);
    typedef void *(*Ray)(void *, void *, void *, void *);
    uint32_t tag;
    while (fread(&tag, 4, 1, stdin) == 1) {
        _Alignas(32) uint8_t ambience[0x97100] = {0};
        _Alignas(16) float result[4], eye[4], direction[4];
        if (tag < 2) {
            float params[3], colors[5][4];
            if (fread(params, 4, 3, stdin) != 3 || fread(colors, 16, 5, stdin) != 5) return 8;
            for (int i=0; i<5; ++i) memcpy(ambience+(tag ? 0x100 : 0xa0)-i*16, colors[i], 16);
            if (tag) ((Cheap)0x100064a20UL)(result, ambience, params[0], params[1], params[2]);
            else ((Sky)0x100064820UL)(result, ambience, params[0], params[1]);
        } else if (tag == 2 || tag == 3) {
            const size_t offsets[] = {0x97080, 0x290, 0x20, 0xc30, 0xc60};
            float v[4], scalars[4];
            if (fread(eye, 16, 1, stdin) != 1 || fread(direction, 16, 1, stdin) != 1) return 8;
            for (int i=0; i<5; ++i) {
                if (fread(v, 16, 1, stdin) != 1) return 8;
                memcpy(ambience+offsets[i], v, 16);
            }
            if (fread(scalars, 4, 4, stdin) != 4) return 8;
            memcpy(ambience+0xb0, scalars, 4); memcpy(ambience+0x1f4, scalars+1, 4);
            memcpy(ambience+0x1f8, scalars+2, 4); memcpy(ambience+0xc70, scalars+3, 4);
            if (fread(ambience+0x4c80, 4, 256, stdin) != 256) return 8;
            if(tag==3)probe_miss(result,ambience,eye,direction);
            else ((Ray)0x100064c60UL)(result, ambience, eye, direction);
        } else return 9;
        if (fwrite(result, 16, 1, stdout) != 1) return 10;
    }
    return ferror(stdin) ? 11 : 0;
}
