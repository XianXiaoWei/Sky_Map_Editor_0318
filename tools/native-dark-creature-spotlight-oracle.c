#define main resource_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
#include <math.h>
#define SPOT_SIZE 0x20000
#define SPOT_ROW 160
static uint8_t *spot = (void *)0x440000000UL, spot_trace[4096 * SPOT_ROW];
static uint32_t spot_calls, spot_color_count, spot_mutated;
__attribute__((used)) static uint32_t sincos_upper[2];
static uint32_t su32(size_t at) { return word(spot, at); }
static uint32_t fbits(float x) { uint32_t n; memcpy(&n, &x, 4); return n; }
static uint8_t *srecord(uint64_t kind, uint64_t x, uint64_t y) { if (spot_calls >= 4096) exit(20); uint8_t *r = spot_trace + spot_calls++ * SPOT_ROW; memset(r, 0, SPOT_ROW); uint64_t v[] = {kind, x, y}; memcpy(r, v, 24); return r; }
static void smutate(uint32_t kind) {
  if (spot_mutated || kind != su32(0x1f00c)) return; spot_mutated = 1;
  switch (su32(0x1f010)) {
    case 1: spot[0x12c7] = 3; break;
    case 2: memcpy(spot + 0x11b0, spot + 0x1f0b0, 16); break;
    case 3: { uint64_t p = (uintptr_t)spot + 0xa400; memcpy(spot + 0x11e8, &p, 8); break; }
    case 4: { uint64_t p = (uintptr_t)spot + 0xb400; memcpy(spot + 0x11d8, &p, 8); break; }
    case 5: { uint64_t p = (uintptr_t)spot + 0xc400; memcpy(spot + 0x11f8, &p, 8); break; }
    case 6: memcpy(spot + 0x1140, spot + 0x1f018, 4); break;
  }
}
__attribute__((used,noinline)) static uint64_t spot_sincos(float x) {
  float sine = sinf(x), cosine = cosf(x); uint32_t pair[] = {fbits(sine), fbits(cosine), sincos_upper[0], sincos_upper[1]};
  memcpy(srecord(1, fbits(x), 0) + 32, pair, 16); smutate(1); uint64_t result; memcpy(&result, pair, 8); return result;
}
__attribute__((naked,noinline)) static void sincos_entry(void) {
  __asm__ volatile("push %rbp\nmov %rsp,%rbp\ncall spot_sincos\nvmovq %rax,%xmm0\nvpinsrd $2,sincos_upper(%rip),%xmm0,%xmm0\nvpinsrd $3,sincos_upper+4(%rip),%xmm0,%xmm0\nleave\nret");
}
static float spot_exp(float x) { float result = expf(x); uint32_t n = fbits(result); memcpy(srecord(2, fbits(x), 0) + 32, &n, 4); smutate(2); return result; }
static float spot_sine(float x) { float result = sinf(x); uint32_t n = fbits(result); memcpy(srecord(10, fbits(x), 0) + 32, &n, 4); smutate(10); return result; }
static float spot_acos(float x) { float result = acosf(x); uint32_t n = fbits(result); memcpy(srecord(11, fbits(x), 0) + 32, &n, 4); smutate(11); return result; }
static uint8_t spot_ray(void *world, void *origin, void *direction, void *query, void *out, float length) {
  uint32_t hit = su32(0x1f008); uint8_t *r = srecord(3, (uintptr_t)world, fbits(length));
  memcpy(r + 32, origin, 16); memcpy(r + 48, direction, 16); memcpy(r + 64, query, 32); memcpy(r + 96, &hit, 4);
  if (hit & 255) { memcpy(out, spot + 0x1f0a0, 16); memcpy(r + 112, out, 16); } smutate(3); return hit;
}
static void *spot_avatar(void *owner, void *id) { void *p = su32(0x1f004) & 1 ? NULL : spot + 0x7000; uint8_t *r = srecord(4, (uintptr_t)owner, word(id, 0)); memcpy(r + 32, &p, 8); smutate(4); return p; }
static void *spot_bird(void *out, void *bird) { uint8_t *r = srecord(5, (uintptr_t)bird, 0); memcpy(out, (uint8_t *)bird + 16, 16); memcpy(r + 32, out, 16); smutate(5); return out; }
static void spot_color(void *owner, void *out, void *position, float gain, float range, float ambient) {
  uint8_t *r = srecord(6, (uintptr_t)owner, spot_color_count % 2 ? 0 : (uintptr_t)position); uint32_t args[] = {fbits(gain), fbits(range), fbits(ambient)};
  memcpy(r + 24, args, 12); memcpy(r + 48, out, 16); memcpy(r + 64, position, 16);
  memcpy(out, spot + 0x1f0c0 + (spot_color_count++ % 2) * 16, 16); memcpy(r + 80, out, 16); smutate(6);
}
static void spot_diffuse(void *model, uint32_t index, char *name, void *color) { uint8_t *r = srecord(7, (uintptr_t)model, index); strncpy((char *)r + 32, name, 32); memcpy(r + 64, color, 16); smutate(7); }
static void *spot_position(void *out, void *transform) { uint8_t *r = srecord(8, (uintptr_t)transform, 0); memcpy(out, (uint8_t *)transform + 176, 16); memcpy(r + 32, out, 16); smutate(8); return out; }
static void spot_marker(void *marker, void *matrix) { uint8_t *r = srecord(9, (uintptr_t)marker, 0); memcpy(r + 32, matrix, 64); memcpy((uint8_t *)marker + 16, matrix, 64); smutate(9); }
static void spot_eye(void *model, void *matrix) { uint8_t *r = srecord(12, (uintptr_t)model, 0); memcpy(r + 32, matrix, 64); memcpy((uint8_t *)model + 16, matrix, 64); smutate(12); }
__attribute__((used,noinline,noreturn)) static void spot_stop(void) { longjmp(escape, 1); }
__attribute__((naked,noinline)) static void stop_entry(void) { __asm__ volatile("sub $8,%rsp\njmp spot_stop"); }
static uint32_t spot_probe(uint32_t op, uint32_t aa, uint32_t bb) {
  float x, y, z; memcpy(&x, &aa, 4); memcpy(&y, &bb, 4);
  switch (op) {
    case 0: __asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y)); break;
    case 1: __asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y)); break;
    case 2: __asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y)); break;
    default: __asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));
  }
  return fbits(z);
}
__attribute__((naked,noinline)) static void spot_run(void) {
  __asm__ volatile("push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nand $-32,%rsp\nsub $0x3e0,%rsp\nmov %rsp,%rdi\nmov $0x73,%al\nmov $0x3e0,%ecx\nrep stosb\nmovabs $0x440001000,%r12\nmovabs $0x440008000,%r13\nmovabs $0x440009400,%r14\nlea 0x110(%r12),%rbx\nmovabs $0x440009000,%rax\nmov %rax,0x58(%rsp)\nmovabs $0x440009600,%rax\nmov %rax,0xc8(%rsp)\nmovabs $0x44001f020,%rax\nvmovaps (%rax),%xmm0\nvmovaps %xmm0,0x70(%rsp)\nvmovaps 0x10(%rax),%xmm0\nvmovaps %xmm0,0x40(%rsp)\nvmovaps 0x20(%rax),%xmm0\nvmovaps %xmm0,0xa0(%rsp)\nvmovaps 0x60(%rax),%xmm0\nvmovaps %xmm0,0x80(%rsp)\nvmovaps 0xe0(%rax),%xmm0\nvmovaps %xmm0,0x340(%rsp)\nvmovaps 0xf0(%rax),%xmm0\nvmovaps %xmm0,0x350(%rsp)\nvmovaps 0x120(%rax),%xmm0\nvmovaps %xmm0,0xd0(%rsp)\nvmovaps 0x130(%rax),%xmm0\nvmovaps %xmm0,0xe0(%rsp)\nvmovaps 0x140(%rax),%xmm0\nvmovaps %xmm0,0xf0(%rsp)\nvmovaps 0x150(%rax),%xmm0\nvmovaps %xmm0,0x100(%rsp)\nmovabs $0x44001f014,%rax\ncmpb $0,(%rax)\nmovabs $0x10026eda3,%rax\nje 1f\nmovabs $0x10026e7da,%rax\n1: jmp *%rax");
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  if (mmap(spot, SPOT_SIZE, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  imported(0x100aa250aUL, sincos_entry); imported(0x100aa2708UL, spot_exp);
  imported(0x100aa2bcaUL, spot_sine); imported(0x100aa2576UL, spot_acos); hook(0x100463750UL, spot_eye);
  hook(0x100776a90UL, spot_ray); hook(0x100101e20UL, spot_avatar); hook(0x100416140UL, spot_color);
  hook(0x100466a50UL, spot_diffuse); hook(0x1007f26b0UL, spot_position); hook(0x10043ccd0UL, spot_marker); hook(0x10026f41eUL, stop_entry);
  uint32_t count; rd(&count, 4); put_word(count);
  put_word(16); uint32_t values[] = {0x7fc00000, 0xffc00000};
  for (uint32_t op = 0; op < 4; op++) for (uint32_t x = 0; x < 2; x++) for (uint32_t y = 0; y < 2; y++) {
    uint32_t row[] = {op, values[x], values[y], spot_probe(op, values[x], values[y])}; wr(row, 16);
  }
  while (count--) {
    rd(spot, SPOT_SIZE); spot_calls = spot_color_count = spot_mutated = 0; memcpy(sincos_upper, spot + 0x1f050, 8); memcpy((void *)0x100d2b470UL, spot + 0x1f048, 4);
    void *fn = spot_bird; memcpy(spot + 0x1e058, &fn, 8);
    for (uint32_t step = 0; step < su32(0x1f000); step++) if (!setjmp(escape)) spot_run();
    memset(spot + 0x1e000, 0, 0x100); put_word(spot_calls); wr(spot, SPOT_SIZE); wr(spot_trace, spot_calls * SPOT_ROW);
  }
  return 0;
}
