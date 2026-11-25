/* Calls original Environment registration, update and four-layer evaluation.
 * The Python caller SHA-gates the supplied Mach-O. No game assets are written.
 * Synthetic metadata defines ONE field per type; callbacks supply only size,
 * placement construction and metadata identity. All runtime algorithms, class
 * lookup, interpolation, OBB and fade execute unmodified original instructions.
 * The sole imported function on these paths is byte-zeroing, bound to memset.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

typedef struct { uintptr_t *vtable; uintptr_t reserved; } Meta;
static Meta metadata[8];
static Meta *identity(Meta *m) { return m; }
static size_t object_size(Meta *m) { (void)m; return 32; }
static void *construct(Meta *m, void *p) { memset(p, 0, 32); *(uint32_t *)p = (uint32_t)(m - metadata); return p; }
static void zero_bytes(void *p, size_t n) { memset(p, 0, n); }
static void setptr(uintptr_t address, const void *value) { memcpy((void *)address, &value, 8); }
static void put32(void *p, size_t offset, uint32_t value) { memcpy((uint8_t *)p + offset, &value, 4); }
static void putptr(void *p, size_t offset, const void *value) { memcpy((uint8_t *)p + offset, &value, 8); }
static int read_bytes(void *p, size_t n) { return fread(p, 1, n, stdin) == n; }
static int write_bytes(const void *p, size_t n) { return fwrite(p, 1, n, stdout) == n; }

int main(int argc, char **argv) {
    if (argc != 2) return 2;
    FILE *file = fopen(argv[1], "rb"); if (!file) return 3;
    const size_t mapped = 0x2400000, backed = 0xd22000;
    void *memory = mmap((void *)0x100000000UL, mapped, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
    if (memory == MAP_FAILED) return 4;
    if (fread(memory, 1, backed, file) != backed) return 5;
    fclose(file);
    if (mprotect(memory, 0xc05000, PROT_READ | PROT_EXEC)) return 6;
    static uint64_t guard = 0x123456789abcdef;
    setptr(0x100c0d8d8UL, &guard);
    /* Original ___bzero stub 0x100aa24aa jumps through this GOT slot. */
    setptr(0x100c0e4b8UL, zero_bytes);
    static uint8_t registry[0x98 + 0x500 * 8];
    setptr(0x102047c70UL, registry);
    uintptr_t vtable[32] = {0};
    vtable[0x68/8] = (uintptr_t)identity;
    vtable[0xa0/8] = (uintptr_t)object_size;
    vtable[0xc0/8] = (uintptr_t)construct;
    for (int i = 0; i < 8; ++i) { metadata[i].vtable = vtable; putptr(registry, 0x98 + i*8, &metadata[i]); }

    typedef void (*Init)(void *);
    typedef void (*RegisterVars)(void *, void *);
    typedef void *(*RegisterHull)(void *, void *, void *, uint32_t, float, float, float, float);
    typedef void (*DefaultVars)(void *, void *);
    typedef void (*Update)(void *, void *, void *);
    Init initialize = (Init)0x100319840UL;
    RegisterVars register_vars = (RegisterVars)0x10031b220UL;
    RegisterHull register_hull = (RegisterHull)0x10031b6e0UL;
    DefaultVars register_default = (DefaultVars)0x10031b2e0UL;
    Update update = (Update)0x100319a30UL;

    /* Header: tag, type count, node count, frame count, default enabled. */
    uint32_t header[5];
    while (read_bytes(header, sizeof(header))) {
        uint32_t tag=header[0], nv=header[1], nn=header[2], nf=header[3];
        if (tag>11 || !nv || nv>8 || nn>16 || nf>128) return 7;
        _Alignas(32) uint8_t env[0x2e270] = {0};
        _Alignas(16) uint8_t outputs[8][32] = {0}, defaults[8][32] = {0};
        _Alignas(16) uint8_t nodes[16][0x90] = {0}, values[16][8][32] = {0};
        uint32_t fields[8][2];
        uint8_t caches[8][24] = {0};
        uint8_t *runtimes[8][16];
        initialize(env);
        for (uint32_t v=0; v<nv; ++v) {
            put32(outputs[v], 0, v); put32(defaults[v], 0, v);
            if (!read_bytes(outputs[v]+16, 16) || !read_bytes(defaults[v]+16, 16)) return 9;
            register_vars(env, outputs[v]);
            fields[v][0]=tag; fields[v][1]=16;
            putptr(caches[v], 0, fields[v]); put32(caches[v], 8, 1); putptr(caches[v], 16, &metadata[v]);
            putptr(env, 0x50+v*8, caches[v]);
        }
        env[0x2e264]=0; /* use explicit synthetic field caches; no game initialization */
        if (header[4]) for (uint32_t v=0; v<nv; ++v) register_default(env, defaults[v]);
        for (uint32_t j=0; j<nn; ++j) {
            uint32_t control[2]; float timing[4];
            if (!read_bytes(control, 8) || !read_bytes(timing, 16) || !read_bytes(nodes[j]+0x60, 48)) return 9;
            nodes[j][0x50]=control[1]!=0;
            for (uint32_t v=0; v<nv; ++v) {
                put32(values[j][v], 0, v);
                if (!read_bytes(values[j][v]+16, 16)) return 9;
                runtimes[v][j]=register_hull(env, values[j][v], nodes[j], control[0], timing[0], timing[1], timing[2], timing[3]);
                /* Pointer-free original 32-byte config+state suffix. */
                if (!write_bytes(runtimes[v][j]+24, 32)) return 8;
            }
        }
        for (uint32_t frame=0; frame<nf; ++frame) {
            float clock[4]; uint32_t mask; _Alignas(16) uint8_t camera[0x1a0]={0}, time[0x30]={0};
            if (!read_bytes(clock, 16) || !read_bytes(&mask, 4) || !read_bytes(camera+0x190, 16)) return 9;
            memcpy(time+0x14, clock, 4); memcpy(time+0x20, clock+1, 4);
            *(uint8_t *)0x101ffb0d0UL=clock[3]!=0;
            memcpy((void *)0x100cb8540UL, clock+2, 4);
            if (mask!=UINT32_MAX) for (uint32_t j=0; j<nn; ++j) nodes[j][0x50]=(mask>>j)&1;
            update(env, time, camera);
            for (uint32_t v=0; v<nv; ++v) if (!write_bytes(outputs[v]+16, 16)) return 8;
            for (uint32_t j=0; j<nn; ++j) {
                uint32_t enabled=nodes[j][0x50]; if (!write_bytes(&enabled, 4)) return 8;
                for (uint32_t v=0; v<nv; ++v) if (!write_bytes(runtimes[v][j]+40, 16)) return 8;
            }
        }
    }
    return ferror(stdin) ? 9 : 0;
}
