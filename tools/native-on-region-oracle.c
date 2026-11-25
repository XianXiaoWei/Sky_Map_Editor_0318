#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
#include <immintrin.h>
#define SIZE 0x50000
#define ROW 192
static uint8_t *a = (void *)0x440000000UL, trace[ROW * 10000];
static uint32_t calls, active_mode, contains_calls, mutation_done;
static uint32_t u32(size_t at) { return word(a, at); }
static void put32(size_t at, uint32_t n) { memcpy(a + at, &n, 4); }
static void pointer(size_t at, size_t to) { uint64_t p = to ? (uintptr_t)a + to : 0; memcpy(a + at, &p, 8); }
static uint8_t *record(uint64_t kind, uint64_t first, uint64_t second) {
  if (calls >= 10000) exit(21); uint8_t *r = trace + calls++ * ROW; memset(r, 0, ROW);
  uint64_t v[] = {kind, first, second}; memcpy(r, v, 24); return r;
}
static void mutate(uint32_t kind) {
  if (mutation_done || kind != u32(0x4f00c)) return; mutation_done = 1;
  switch (u32(0x4f010)) {
    case 1: a[0x1053] = 1; break;
    case 2: pointer(0x1048, 0x4200); break;
    case 3: put32(0x4010, u32(0x4f014)); break;
    case 4: a[0x105d] = 1; a[0x1050] = 0; break;
    case 5: a[0x1051] = 1; a[0x1068] = 1; break;
    case 6: a[0x1050] ^= 1; break;
    case 7: a[0x5040] = 0; break;
    case 8: pointer(0x1040, 0x4600); break;
    case 9: a[0x1054] = 0; a[0x1055] = 1; break;
  }
}
static uint8_t ready(void *barn) { uint8_t on = u32(0x4f004); record(1, (uintptr_t)barn, on); mutate(1); return on; }
static int32_t count(void *barn, int32_t *indices, uint32_t local) {
  int32_t n = u32(0x4f008); record(2, (uintptr_t)barn, local); for (int i = 0; i < 16; i++) indices[i] = 15 - i; mutate(2); return n;
}
/* bzero is an explicit boundary. Seed private XMM2 after zeroing the hit
 * array so allocator/libc register choices cannot supply an implicit W. */
static void zero_hits(void *p, size_t n) {
  volatile uint8_t *b = p; for (size_t i = 0; i < n; i++) b[i] = 0;
  __asm__ volatile("vmovdqu (%0), %%xmm2" :: "r"(a + 0x4f080) : "xmm2");
}
static void *avatar_at(void *barn, uint32_t i) { record(3, (uintptr_t)barn, i); mutate(3); return a + 0x10000 + i * 0x2400; }
static void *camera(void *out, void *owner) { uint8_t *r = record(4, (uintptr_t)owner, 0); memcpy(out, a + 0x4f090, 16); memcpy(r + 32, out, 16); mutate(4); return out; }
static uint8_t enabled(void *obj) { uint8_t on = ((uint8_t *)obj)[0x21b2]; record(5, (uintptr_t)obj, on); mutate(5); return on; }
static void *meta(uint32_t kind) { void *p = a + 0x48000 + kind * 0x100; record(6, kind, (uintptr_t)p); mutate(6); return p; }
static void *object_type(void) { return meta(0); } static void *marker_type(void) { return meta(1); } static void *mesh_type(void) { return meta(2); }
static void cast(void *metadata, void **out, void **in, void *source) {
  uint32_t kind = ((uint8_t *)metadata - a - 0x48000) / 0x100;
  uint8_t *r = record(7, (uintptr_t)metadata, (uintptr_t)*in); uint64_t p = (uintptr_t)source; memcpy(r + 24, &p, 8);
  uint8_t *obj = *in; *out = obj && ((kind == 0 && obj[0xf0] != 3) || (kind == 1 && obj[0xf0] == 1) || (kind == 2 && obj[0xf0] == 2)) ? obj : NULL;
  if (u32(0x4f018) == kind + 1 && u32(0x4f01c)) *in = a + u32(0x4f01c);
  uint64_t values[] = {(uintptr_t)*in, (uintptr_t)*out}; memcpy(r + 32, values, 16); mutate(7);
}
static void *transform(void *out, void *obj) { uint8_t *r = record(8, (uintptr_t)obj, 0); memcpy(out, (uint8_t *)obj + 0x80, 64); memcpy(r + 32, out, 64); mutate(8); return out; }
static void *obb(void *out, void *obj) { uint8_t *r = record(9, (uintptr_t)obj, 0); memcpy(out, a + 0x4f100, 64); memcpy(r + 32, out, 64); mutate(9); return out; }
static uint8_t contains(void *point, void *box, float tolerance) {
  uint32_t on = u32(0x4f200 + (contains_calls++ % 32) * 4); uint8_t *r = record(10, on, 0); memcpy(r + 24, &tolerance, 4); memcpy(r + 32, point, 16); memcpy(r + 48, box, 64); mutate(10); return on;
}
static void set_enabled(void *clump, uint32_t on) { record(11, (uintptr_t)clump, on); ((uint8_t *)clump)[0x20] = on; mutate(11); }
static void start(void *event) { record(12, (uintptr_t)event, 0); ((uint8_t *)event)[0x25] = 1; mutate(12); }
static void region_assertion(const char *x, const char *f, uint32_t l, uint32_t s, ...) {
  line = l; severity = s; uint8_t *r = record(13, l, s); strncpy((char *)r + 24, x, 64); strncpy((char *)r + 88, f, 64); longjmp(escape, 1);
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  if (mmap(a, SIZE, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  hook(0x1000fe060UL, ready); hook(0x1001032a0UL, count); imported(0x100aa24aaUL, zero_hits);
  hook(0x1001031d0UL, avatar_at); hook(0x10076be90UL, camera); hook(0x1000fe050UL, enabled);
  hook(0x1007abc10UL, object_type); hook(0x10043ccc0UL, marker_type); hook(0x1003ffcf0UL, mesh_type);
  hook(0x1004d1f60UL, set_enabled); hook(0x10032ef60UL, start); hook(0x1007e5f70UL, region_assertion);
  hook(0x102220000UL, cast); hook(0x102220020UL, transform); hook(0x102220040UL, obb);
  uint8_t original_contains[14]; memcpy(original_contains, (void *)0x10078d450UL, 14);
  uint32_t n; rd(&n, 4); put_word(n);
  while (n--) {
    rd(&active_mode, 4); rd(a, SIZE); calls = line = severity = contains_calls = mutation_done = 0;
    for (uint32_t i = 0; i < 3; i++) pointer(0x48000 + i * 0x100, 0x48800);
    uint64_t p = 0x102220000UL; memcpy(a + 0x48840, &p, 8);
    p = 0x102220020UL; memcpy(a + 0x48918, &p, 8); p = 0x102220040UL; memcpy(a + 0x48920, &p, 8);
    p = (uintptr_t)a + 0x4e000; memcpy((void *)0x100c0d8d8UL, &p, 8);
    p = (uintptr_t)a + 0x48a00; memcpy((void *)0x101df4208UL, &p, 8);
    p = (uintptr_t)a + 0x48b00; memcpy((void *)0x102012f58UL, &p, 8);
    memcpy((void *)0x102018fc8UL, &p, 8);
    if (active_mode == 0) hook(0x10078d450UL, contains); else memcpy((void *)0x10078d450UL, original_contains, 14);
    uint32_t result = 0;
    if (!setjmp(escape)) for (uint32_t step = 0; step < u32(0x4f000); step++) {
      if (active_mode == 0 || active_mode == 1) ((void (*)(void *, void *))0x1004dfab0UL)(a + 0x1000, a + 0x2000);
      else if (active_mode == 2) ((void *(*)(void *, void *))0x1004df970UL)(NULL, a + 0x1000);
      else if (active_mode == 3) ((void (*)(void *, void *))0x1004dfa90UL)(a + 0x1000, a + 0x2000);
      else if (active_mode == 5) ((void *(*)(void *, void *))0x1005311f0UL)(NULL, a + 0x1000);
      else { float tolerance; memcpy(&tolerance, a + 0x4f020, 4); result = ((uint8_t (*)(void *, void *, float))0x10078d450UL)(a + 0x4f090, a + 0x4f100, tolerance); }
    }
    uint32_t h[] = {line, severity, calls, result}; wr(h, 16); wr(a, SIZE); wr(trace, calls * ROW);
  }
  return 0;
}
