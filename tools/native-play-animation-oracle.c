#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena = (void *)0x470000000UL;
static jmp_buf escape; static uint32_t line, severity, trace[1024], used, casts;
static uint32_t word(size_t at) { uint32_t n; memcpy(&n, arena + at, 4); return n; }
static void put32(size_t at, uint32_t n) { memcpy(arena + at, &n, 4); }
static void put64(size_t at, uint64_t n) { memcpy(arena + at, &n, 8); }
static void rd(void *p, size_t n) { if (fread(p, 1, n, stdin) != n) exit(10); }
static void wr(void *p, size_t n) { if (fwrite(p, 1, n, stdout) != n) exit(11); }
static void hook(uintptr_t at, void *fn) { uint8_t b[14] = {0xff, 0x25}; memcpy(b + 6, &fn, 8); memcpy((void *)at, b, 14); }
static uint32_t float_bits(float n) { uint32_t b; memcpy(&b, &n, 4); return b; }
static void logop(uint32_t op, void *p, uint32_t n, uint32_t index) { if (used + 4 > 1024) exit(12); trace[used++] = op; trace[used++] = (uintptr_t)p - (uintptr_t)arena; trace[used++] = n; trace[used++] = index; }
static void assertion(void *x, void *f, uint32_t l, uint32_t s, ...) { (void)x; (void)f; line = l; severity = s; longjmp(escape, 1); }
static void *meta(void) { return arena + 0xf000; }
static void cast(void *self, void **out, void **in, void *from) {
  (void)self; (void)from; logop(1, *in, 0, 0);
  if (++casts == 1) {
    uint32_t mutation = word(0xe008);
    if (mutation == 1) { put64(0x1038, (uintptr_t)arena + 0x4000); put64(0x4108, (uintptr_t)arena + 0x5000); }
    if (mutation == 2) put32(0x2010, 0);
    if (mutation == 3) put32(0x1074, 0x40000000);
    if (mutation == 4) arena[0x1081] = 0;
  }
  *out = word(0xe000) ? NULL : *in;
}
static int32_t defaults(void *p) { logop(2, p, 5, 0); return 5; }
static int32_t current(void *p, uint32_t kind) { logop(3, p, kind, 0); return (int32_t)word(0xe004); }
static void speed(void *p, int32_t index, float n) { logop(4, p, float_bits(n), index); }
static int32_t named(void *p, void *name, float weight) { logop(5, p, float_bits(weight), 0); logop(6, name, 0, 0); return 0; }
static int32_t sequence(void *p, void *name, uint32_t flags, float weight, float speed) { logop(7, p, float_bits(weight), flags); logop(8, name, float_bits(speed), 0); return 0; }
static void start(void *p) { logop(9, p, 0, 0); }
int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  if (mmap(arena, 0x10000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  hook(0x1007e5f70UL, assertion); hook(0x1007abc10UL, meta); hook(0x1003ffcf0UL, meta); hook(0x102200000UL, cast);
  hook(0x100096120UL, defaults); hook(0x10009d520UL, current); hook(0x100097c80UL, speed);
  hook(0x1000959b0UL, named); hook(0x1000967b0UL, sequence); hook(0x10032ef60UL, start);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; rd(&count, 4); wr(&count, 4);
  while (count--) {
    rd(arena, 0x10000); line = severity = used = casts = 0; memset(trace, 0, sizeof(trace));
    if (!setjmp(escape)) ((void (*)(void *))0x1005313d0UL)(arena + 0x1000);
    wr(&line, 4); wr(&severity, 4); wr(&used, 4); wr(trace, sizeof(trace)); wr(arena, 0x10000);
  }
  return 0;
}
