#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint32_t calls, trace[3 * 16];
static void rd(void *p, size_t n) { if (fread(p, 1, n, stdin) != n) exit(10); }
static void wr(const void *p, size_t n) { if (fwrite(p, 1, n, stdout) != n) exit(11); }
static void hook(uintptr_t at, void *fn) { uint8_t b[14] = {0xff, 0x25}; memcpy(b + 6, &fn, 8); memcpy((void *)at, b, 14); }
static float power(float a, float b) { float out = powf(a, b); if (calls >= 16) exit(12); memcpy(trace + calls * 3, &a, 4); memcpy(trace + calls * 3 + 1, &b, 4); memcpy(trace + calls++ * 3 + 2, &out, 4); return out; }
int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  hook(0x100aa2a2cUL, power); if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 6;
  uint32_t count; rd(&count, 4); wr(&count, 4);
  while (count--) {
    uint8_t state[0x70] __attribute__((aligned(16))); float delta, weight; rd(state, 0x70); rd(&delta, 4); rd(&weight, 4); calls = 0;
    ((void (*)(void *, void *, float))0x100097df0UL)(state, &weight, delta);
    wr(state, 0x70); wr(&weight, 4); wr(&calls, 4); wr(trace, calls * 12);
  }
  return 0;
}
