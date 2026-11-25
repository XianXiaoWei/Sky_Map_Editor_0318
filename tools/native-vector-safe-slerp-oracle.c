#define main resource_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
#include <math.h>
static uint32_t math_trace[4096 * 3], math_count;
__attribute__((used)) static uint32_t sin_w;
static float traced_math(float input, uint32_t kind) {
  if (math_count >= 4096) exit(20);
  float result = kind == 1 ? acosf(input) : sinf(input);
  uint32_t *r = math_trace + math_count++ * 3;
  r[0] = kind; memcpy(r + 1, &input, 4); memcpy(r + 2, &result, 4);
  return result;
}
static float traced_acos(float input) { return traced_math(input, 1); }
__attribute__((used,noinline)) static float traced_sin(float input) { return traced_math(input, 2); }
/* Keep the scalar return untouched, but control its caller-clobbered W lane.
 * The original VPERMILPS 0xc0 consumes W separately from the scalar result. */
__attribute__((naked,noinline)) static void sin_entry(void) {
  __asm__ volatile("push %rbp\nmov %rsp,%rbp\ncall traced_sin\nvmovd %xmm0,%eax\nvmovd %eax,%xmm0\nvpinsrd $3,sin_w(%rip),%xmm0,%xmm0\nleave\nret");
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  imported(0x100aa2576UL, traced_acos); imported(0x100aa2bcaUL, sin_entry);
  hook(0x1007e6030UL, assertion);
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    uint8_t input[96] __attribute__((aligned(16))); rd(input, sizeof input);
    math_count = line = severity = 0; sin_w = word(input, 68);
    uint32_t alias = word(input, 72); void *out = input + (alias ? (alias - 1) * 16 : 48);
    float factor; memcpy(&factor, input + 64, 4);
    if (!setjmp(escape)) ((void *(*)(void *, void *, void *, void *, float))0x100111b90UL)(out, input, input + 16, input + 32, factor);
    uint32_t h[] = {line, severity, math_count}; wr(h, sizeof h); wr(input, sizeof input); wr(math_trace, math_count * 12);
  }
  return 0;
}
