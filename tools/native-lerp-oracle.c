/* Execute only the original pure field interpolation routine under x64 QEMU.
 * Build: x86_64-linux-gnu-gcc -O2 -static tools/native-lerp-oracle.c -o /tmp/sky-lerp-oracle
 * The executable SHA must be checked by the Python caller before invocation.
 * Input/output are binary records; no game initialization or file writes occur.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

typedef struct { uint32_t tag, offset; float weight; uint32_t reserved; uint8_t a[16], b[16]; } Case;
typedef void (*Lerp)(const uint32_t *, const void *, const void *, void *, float);
int main(int argc, char **argv) {
    if (argc < 2 || argc > 3) return 2;
    FILE *file = fopen(argv[1], "rb");
    if (!file) return 3;
    const size_t length = 0xc00000;
    void *text = mmap((void *)0x100000000UL, length, PROT_READ | PROT_WRITE,
                     MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
    if (text == MAP_FAILED) { perror("mmap"); return 4; }
    if (fread(text, 1, length, file) != length) return 5;
    fclose(file);
    if (mprotect(text, length, PROT_READ | PROT_EXEC)) return 6;
    if (argc == 3 && strcmp(argv[2], "--vars") == 0) {
        typedef void (*Convert)(void *);
        Convert functions[3] = {(Convert)0x10031bb10UL, (Convert)0x10031be30UL, (Convert)0x10031c050UL};
        struct { uint32_t tag; uint8_t storage[1024]; } record;
        while (fread(&record, sizeof(record), 1, stdin) == 1) {
            if (record.tag >= 3) return 7;
            _Alignas(16) uint8_t storage[1024]; memcpy(storage, record.storage, 1024);
            functions[record.tag](storage);
            if (fwrite(storage, sizeof(storage), 1, stdout) != 1) return 8;
        }
        return ferror(stdin) ? 9 : 0;
    }
    if (argc == 3 && strcmp(argv[2], "--fade") == 0) {
        typedef void (*Fade)(void *, float);
        Fade fade = (Fade)0x10031a450UL;
        float record[8];
        while (fread(record, sizeof(record), 1, stdin) == 1) {
            _Alignas(16) uint8_t node[0x90] = {0}, runtime[0x40] = {0};
            void *ptr = node; memcpy(runtime + 0x10, &ptr, 8);
            memcpy(runtime + 0x1c, record + 1, 20);
            node[0x50] = record[6] != 0; runtime[0x30] = record[7] != 0;
            fade(runtime, record[0]);
            float out[4]; memcpy(out, runtime + 0x28, 8);
            out[2] = node[0x50]; out[3] = runtime[0x30];
            if (fwrite(out, sizeof(out), 1, stdout) != 1) return 8;
        }
        return ferror(stdin) ? 9 : 0;
    }
    if (argc == 3 && strcmp(argv[2], "--spatial") == 0) {
        typedef void (*Weight)(const void *, const float *, float *, void **);
        Weight weight = (Weight)0x10031a6f0UL;
        float record[18];
        while (fread(record, sizeof(record), 1, stdin) == 1) {
            _Alignas(16) uint8_t node[0x90] = {0}, runtime[0x40] = {0};
            _Alignas(16) float point[4];
            memcpy(node + 0x60, record, 16);
            memcpy(node + 0x70, record + 4, 16);
            memcpy(node + 0x80, record + 8, 16);
            memcpy(point, record + 12, 16);
            void *ptr = node;
            memcpy(runtime + 0x10, &ptr, 8);
            memcpy(runtime + 0x18, record + 16, 4);
            memcpy(runtime + 0x2c, record + 17, 4);
            float out; void *vars;
            weight(runtime, point, &out, &vars);
            if (fwrite(&out, 4, 1, stdout) != 1) return 8;
        }
        return ferror(stdin) ? 9 : 0;
    }
    Lerp lerp = (Lerp)0x10031a230UL;
    Case input;
    while (fread(&input, sizeof(input), 1, stdin) == 1) {
        if (input.tag > 11 || input.offset) return 7;
        _Alignas(16) uint8_t a[16], b[16], out[16] = {0};
        for (int i = 0; i < 16; i++) { a[i] = input.a[i]; b[i] = input.b[i]; }
        lerp(&input.tag, a, b, out, input.weight);
        if (fwrite(out, 16, 1, stdout) != 1) return 8;
    }
    return ferror(stdin) ? 9 : 0;
}
