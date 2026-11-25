/* SHA-gated by probe-native-check.ts. Executes the original cube constructor
 * and reduction/upload data preparation. Ray jobs are skipped at an explicit
 * boundary: their scene intersections/colors must be supplied by the caller.
 * No history, SH, mip or half conversion instructions are replaced. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static void clear_bytes(void *p, size_t n) { memset(p, 0, n); }
static uint8_t *flush_ambience;
static uint32_t upload_calls;
static uint32_t sampler_requests[9];
static uint64_t capture_message(void *receiver, uintptr_t selector, uint64_t argument, float scalar) {
    (void)receiver;
    const uintptr_t slots[9]={0x100c69fb0UL,0x100c69fb8UL,0x100c69fa8UL,
        0x100c69fc0UL,0x100c69fc8UL,0x100c69fd0UL,0x100c69fd8UL,0x100c69fe0UL,0x100c69fe8UL};
    for(int i=0;i<9;i++) if(selector==*(uintptr_t *)slots[i]) {
        if(i==6 || i==7) memcpy(sampler_requests+i,&scalar,4);
        else sampler_requests[i]=(uint32_t)argument;
    }
    return 0x12345678;
}
static void release_object(void *object) { (void)object; }
static void capture_upload(void *texture, uint32_t face, uint32_t mip, void *data) {
    (void)texture;
    uintptr_t offset = (uint8_t *)data - (flush_ambience+0x87050);
    uint32_t entry[3] = {face, mip, offset/2};
    fwrite(entry, sizeof(entry), 1, stdout); upload_calls++;
}
static void capture_finish(void *texture) { (void)texture; }
static void redirect_call(uintptr_t address, void *callback) {
    memcpy((void *)address, "\x48\xb8", 2);
    memcpy((void *)(address+2), &callback, 8);
    memcpy((void *)(address+10), "\xff\xe0", 2);
}
static int load_game(const char *path) {
    FILE *file = fopen(path, "rb"); if (!file) return 3;
    void *memory = mmap((void *)0x100000000UL, 0x2400000, PROT_READ|PROT_WRITE,
        MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE, -1, 0);
    if (memory == MAP_FAILED) return 4;
    if (fread(memory, 1, 0xd22000, file) != 0xd22000) return 5;
    fclose(file);
    void (*zero)(void *, size_t) = clear_bytes;
    memcpy((void *)0x100c0e4b8UL, &zero, 8);
    static uint64_t guard = 0x123456789abcdefUL;
    const void *guard_ptr = &guard; memcpy((void *)0x100c0d8d8UL, &guard_ptr, 8);
    /* Original prologue and stack guard, then original reduction boundary. */
    if (memcmp((void *)0x100060eedUL, "\x48\xb8\x01\x00\x00", 5)) return 6;
    *(uint8_t *)0x100060eedUL = 0xe9;
    int32_t jump = 0x10006103bUL - (0x100060eedUL + 5);
    memcpy((void *)0x100060eeeUL, &jump, 4);
    /* Original probe uniform stores/uploads, skip unrelated final globals. */
    if (memcmp((void *)0x10005ca07UL, "\x41\x80\xbf", 3)) return 6;
    *(uint8_t *)0x10005ca07UL = 0xe9;
    jump = 0x10005cb4fUL - (0x10005ca07UL+5);
    memcpy((void *)0x10005ca08UL, &jump, 4);
    redirect_call(0x1007f1150UL, capture_upload);
    redirect_call(0x1007f1390UL, capture_finish);
    if (mprotect(memory, 0xc05000, PROT_READ|PROT_EXEC)) return 7;
    return 0;
}
int main(int argc, char **argv) {
    if (argc < 2 || argc > 3) return 2;
    int error = load_game(argv[1]); if (error) return error;
    _Alignas(32) uint8_t constructor[0x50900] = {0};
    ((void (*)(void *))0x10005cb80UL)(constructor);
    if (argc == 3 && !strcmp(argv[2], "--flush")) {
        _Alignas(32) uint8_t ambience[0x97100] = {0};
        flush_ambience = ambience;
        while (fread(ambience+0x67000, 4, 27, stdin) == 27) {
            upload_calls=0;
            ((void (*)(void *, void *, void *))0x10005c6d0UL)(ambience, NULL, NULL);
            if (upload_calls != 36 || fwrite(ambience+0x65580, 136, 1, stdout)!=1) return 10;
        }
        return ferror(stdin) ? 11 : 0;
    }
    if (argc == 3 && !strcmp(argv[2], "--sampler")) {
        _Alignas(32) uint8_t renderer[0x120]={0}, vtable[0x108]={0}, descriptor[40]={0}, output[40]={0};
        uintptr_t slots[32]={0}; uint32_t used=0, capacity=32;
        void *p=vtable;memcpy(renderer,&p,8);
        p=(void *)0x100a6aa30UL;memcpy(vtable+0x100,&p,8);
        memcpy(renderer+0xf8,&capacity,4);p=slots;memcpy(renderer+0x100,&p,8);
        p=&used;memcpy(renderer+0x108,&p,8);p=renderer;memcpy((void *)0x102048460UL,&p,8);
        p=capture_message;memcpy((void *)0x100c0db10UL,&p,8);
        p=release_object;memcpy((void *)0x100c0db18UL,&p,8);
        memcpy(descriptor,(void *)0x100aa81a0UL,32);
        *(uint32_t *)(descriptor+32)=1;
        ((void (*)(void *,void *))0x1007f04d0UL)(output,descriptor);
        if(fwrite(output,36,1,stdout)!=1 || fwrite(sampler_requests,36,1,stdout)!=1) return 10;
        return 0;
    }
    if (argc == 3 && !strcmp(argv[2], "--table")) {
        if (fwrite(constructor+0x914, 2046*16*4, 1, stdout) != 1) return 10;
        if (fwrite((void *)0x100ab1ec0UL, 1024, 1, stdout) != 1) return 10;
        if (fwrite((void *)0x100ab22c0UL, 512, 1, stdout) != 1) return 10;
        return 0;
    }
    if (argc == 3 && !strcmp(argv[2], "--half")) {
        uint32_t count, hardware;
        while (fread(&count, 4, 1, stdin) == 1) {
            if (count > 1000000 || fread(&hardware, 4, 1, stdin) != 1) return 8;
            float *input = malloc((count+1)*4); uint16_t *output = malloc((count+1)*2);
            if (!input || !output || fread(input, 4, count, stdin) != count) return 8;
            *(uint8_t *)0x102049438UL = hardware != 0;
            ((void (*)(void *, void *, uint32_t))0x1007ec050UL)(output, input, count);
            if (fwrite(output, 2, count, stdout) != count) return 10;
            free(input); free(output);
        }
        return ferror(stdin) ? 11 : 0;
    }
    if (argc != 2) return 2;
    uint32_t count, hardware;
    while (fread(&count, 4, 1, stdin) == 1) {
        if (count > 384 || fread(&hardware, 4, 1, stdin) != 1) return 8;
        _Alignas(32) uint8_t context[0x30900] = {0}, job[0x40] = {0};
        _Alignas(32) float coordinates[384][4], directions[384][4], colors[384][4];
        if (fread(context+0x870, 4, 27, stdin) != 27 ||
            fread(context+0x8e0, 16, 6144, stdin) != 6144 ||
            fread(coordinates, 16, count, stdin) != count ||
            fread(directions, 16, count, stdin) != count ||
            fread(colors, 16, count, stdin) != count) return 8;
        void *p = context; memcpy(job+0x10, &p, 8);
        p = coordinates; memcpy(context+0x18, &p, 8);
        p = directions; memcpy(context+0x20, &p, 8);
        p = colors; memcpy(context+0x28, &p, 8);
        memcpy(context+0x30, &count, 4);
        p = constructor+0x914; memcpy(context+0x50, &p, 8);
        *(uint8_t *)0x102049438UL = hardware != 0;
        ((void (*)(void *))0x100060ec0UL)(job);
        if (fwrite(context+0x870, 4, 27, stdout) != 27 ||
            fwrite(context+0x8e0, 16, 8190, stdout) != 8190 ||
            fwrite(context+0x208c0, 2, 32760, stdout) != 32760) return 10;
    }
    return ferror(stdin) ? 11 : 0;
}
