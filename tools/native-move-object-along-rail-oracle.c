/* Whole original lifecycle bodies. Only metadata, heap, rail-query and
 * random boundaries are replaced. The caller supplies the unwritten scale W. */
#define main resource_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
#include <math.h>
#define MOVE_SIZE 0x50000
#define MOVE_ROW 128
static uint8_t *mo = (void *)0x440000000UL, move_trace[MOVE_ROW * 2048];
static uint32_t move_calls, move_rand_count, move_nearest_count, move_distance_count, move_alloc_count, move_mutated, move_kind_count[32];
static uint32_t mu32(size_t at) { return word(mo, at); }
static void mp32(size_t at, uint32_t n) { memcpy(mo + at, &n, 4); }
static void mp64(size_t at, uint64_t n) { memcpy(mo + at, &n, 8); }
static uint8_t *mrecord(uint32_t kind, uint64_t first, uint64_t second) {
  if (move_calls >= 2048) exit(21); uint8_t *r = move_trace + move_calls++ * MOVE_ROW; memset(r, 0, MOVE_ROW);
  uint64_t values[] = {kind, first, second}; memcpy(r, values, 24); move_kind_count[kind]++; return r;
}
static void mmutate(uint32_t kind) {
  if (move_mutated || kind != mu32(0x4f00c) || move_kind_count[kind] != mu32(0x4f014)) return;
  move_mutated = 1;
  switch (mu32(0x4f010)) {
    case 1: mp32(0x4010, 0); break;
    case 2: mp64(0x1040, (uintptr_t)mo + 0x4200); break;
    case 3: mp64(0x1038, (uintptr_t)mo + 0x4600); break;
    case 4: mp32(0x4418, 0x42480000); break;
    case 5: mp64(0x10c0, (uintptr_t)mo + 0x8000); break;
    case 6: mo[0x10a0] ^= 1; break;
    case 7: mp32(0x31168, mu32(0x4f018)); break;
    case 8: mo[0x105a] ^= 1; break;
    case 9: mp32(0x4f100 + ((move_rand_count % 16) * 4), 0x7fffffff); break;
  }
}
static void *move_meta(void) { void *p = mo + 0x48000; mrecord(1, (uintptr_t)p, 0); mmutate(1); return p; }
static void move_cast(void *metadata, void **out, void **in, void *source) {
  uint8_t *r = mrecord(2, (uintptr_t)metadata, (uintptr_t)*in); uint64_t p = (uintptr_t)source; memcpy(r + 24, &p, 8);
  *out = *in && ((uint8_t *)*in)[0xf0] != 3 ? *in : NULL;
  p = (uintptr_t)*out; memcpy(r + 32, &p, 8); mmutate(2);
}
static void *move_transform(void *out, void *object) {
  uint8_t *r = mrecord(3, (uintptr_t)object, 0); memcpy(out, (uint8_t *)object + 0x80, 64); memcpy(r + 32, out, 64); mmutate(3); return out;
}
static float move_nearest(void *rail, void *position, void *closest) {
  uint32_t n = mu32(0x4f200 + (move_nearest_count++ % 16) * 4); float result; memcpy(&result, &n, 4);
  uint8_t *r = mrecord(4, (uintptr_t)rail, n); memcpy(r + 32, position, 16); memcpy(closest, position, 16); mmutate(4); return result;
}
static float move_distance(void *rail, float parameter) {
  uint32_t n = mu32(0x4f240 + (move_distance_count++ % 16) * 4); float result; memcpy(&result, &n, 4);
  uint8_t *r = mrecord(5, (uintptr_t)rail, n); memcpy(r + 24, &parameter, 4); mmutate(5); return result;
}
static int32_t move_random(void) {
  int32_t n = mu32(0x4f100 + (move_rand_count++ % 16) * 4); mrecord(6, (uint32_t)n, 0); mmutate(6); return n;
}
static void *move_allocate(void *heap, size_t size, void *tag, uint32_t alignment) {
  void *p = mo + (move_alloc_count++ % 2 ? 0x18000 : 0x10000);
  if (size > 0x8000) exit(22); uint8_t *r = mrecord(7, (uintptr_t)heap, size);
  uint64_t values[] = {(uintptr_t)tag, alignment, (uintptr_t)p}; memcpy(r + 24, values, 24); mmutate(7); return p;
}
static void move_release(void *heap, void *allocation) { mrecord(8, (uintptr_t)heap, (uintptr_t)allocation); mmutate(8); }
static void *move_network(void *manager) { void *p = mo + 0x31000; mrecord(9, (uintptr_t)manager, (uintptr_t)p); mmutate(9); return p; }
static void move_assertion(const char *expression, const char *file, uint32_t l, uint32_t s, ...) {
  line = l; severity = s; uint8_t *r = mrecord(10, l, s); strncpy((char *)r + 24, expression, 64); strncpy((char *)r + 88, file, 32); longjmp(escape, 1);
}
/* rbp-0xa0 W in the original Enable equals rsp-0xa4 here. The original
 * instruction body is untouched; saved caller XMM lanes are not this W. */
__attribute__((naked,noinline)) static void move_enable(void *event __attribute__((unused)), void *game __attribute__((unused))) {
  __asm__ volatile("push %rbp\nmov %rsp,%rbp\nmovabs $0x44004f020,%rax\nmov (%rax),%eax\nmov %eax,-0xa4(%rsp)\nmovabs $0x100484640,%rax\ncall *%rax\nleave\nret");
}
#ifndef MOVE_RAIL_NO_MAIN
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  if (mmap(mo, MOVE_SIZE, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  hook(0x1007abc10UL, move_meta); hook(0x102220000UL, move_cast); hook(0x1004d1e40UL, move_transform);
  uint8_t nearest_code[14], distance_code[14]; memcpy(nearest_code, (void *)0x10055d820UL, 14); memcpy(distance_code, (void *)0x10055d410UL, 14);
  imported(0x100aa2b22UL, move_random); imported(0x100aa2744UL, fmodf);
  hook(0x100795530UL, move_allocate); hook(0x100795a70UL, move_release); hook(0x100410c90UL, move_network);
  hook(0x1007e5f70UL, move_assertion); hook(0x1007e6030UL, move_assertion);
  uint32_t n; rd(&n, 4); put_word(n);
  while (n--) {
    uint32_t mode; rd(&mode, 4); rd(mo, MOVE_SIZE); move_calls = line = severity = move_rand_count = move_nearest_count = move_distance_count = move_alloc_count = move_mutated = 0; memset(move_kind_count, 0, sizeof move_kind_count);
    if (mode == 6) { memcpy((void *)0x10055d820UL, nearest_code, 14); memcpy((void *)0x10055d410UL, distance_code, 14); }
    else { hook(0x10055d820UL, move_nearest); hook(0x10055d410UL, move_distance); }
    uint64_t p = (uintptr_t)mo + 0x48800; mp64(0x48000, p); mp64(0x48840, 0x102220000UL);
    p = (uintptr_t)mo + 0x48a00; memcpy((void *)0x101df4208UL, &p, 8); p = (uintptr_t)mo + 0x48b00; memcpy((void *)0x102009380UL, &p, 8);
    p = (uintptr_t)mo + 0x48c00; memcpy((void *)0x102009350UL, &p, 8);
    if (!setjmp(escape)) for (uint32_t step = 0; step < mu32(0x4f000); step++) {
      if (mode == 0) ((void *(*)(void *, void *))0x100486f40UL)(NULL, mo + 0x1000);
      else if (mode == 1) ((void (*)(void *, void *, void *))0x1004844b0UL)(mo + 0x1000, mo + 0x2000, mo + 0x3000);
      else if (mode == 2) move_enable(mo + 0x1000, mo + 0x2000);
      else if (mode == 3) ((void (*)(void *, void *))0x100484a70UL)(mo + 0x1000, mo + 0x2000);
      else if (mode == 4) ((void (*)(void *, void *, void *))0x1004845f0UL)(mo + 0x1000, mo + 0x2000, mo + 0x3000);
      else if (mode == 5 || mode == 6) {
        ((void (*)(void *, void *, void *))0x1004844b0UL)(mo + 0x1000, mo + 0x2000, mo + 0x3000);
        move_enable(mo + 0x1000, mo + 0x2000);
        ((void (*)(void *, void *))0x100484a70UL)(mo + 0x1000, mo + 0x2000);
        ((void (*)(void *, void *, void *))0x1004845f0UL)(mo + 0x1000, mo + 0x2000, mo + 0x3000);
      } else return 7;
    }
    uint32_t h[] = {line, severity, move_calls, 0}; wr(h, 16); wr(mo, MOVE_SIZE); wr(move_trace, move_calls * MOVE_ROW);
  }
  return 0;
}
#endif
