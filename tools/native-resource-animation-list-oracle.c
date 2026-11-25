#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <signal.h>
#include <ucontext.h>
#include <sys/mman.h>
static uint8_t *arena; static size_t used; static uint32_t line, severity; static jmp_buf escape;
static void fault(int sig, siginfo_t *info, void *context) { ucontext_t *c = context; fprintf(stderr, "native fault %d at %p rip=%llx rdi=%llx rsi=%llx rax=%llx used=%zu\n", sig, info->si_addr, (unsigned long long)c->uc_mcontext.gregs[REG_RIP], (unsigned long long)c->uc_mcontext.gregs[REG_RDI], (unsigned long long)c->uc_mcontext.gregs[REG_RSI], (unsigned long long)c->uc_mcontext.gregs[REG_RAX], used); _Exit(16); }
static void rd(void *p, size_t n) { if (fread(p, 1, n, stdin) != n) exit(10); }
static void wr(const void *p, size_t n) { if (fwrite(p, 1, n, stdout) != n) exit(11); }
static uint32_t word(const void *p, size_t at) { uint32_t n; memcpy(&n, (uint8_t *)p + at, 4); return n; }
static void *ptr(const void *p, size_t at) { void *n; memcpy(&n, (uint8_t *)p + at, 8); return n; }
static void put_word(uint32_t n) { wr(&n, 4); }
static void hook(uintptr_t at, void *fn) { uint8_t b[14] = {0xff, 0x25}; memcpy(b + 6, &fn, 8); memcpy((void *)at, b, 14); }
// Preserve adjacent six-byte import stubs. Resolve the original RIP-indirect
// target slot and bind the C service there, without overwriting its neighbors.
static void imported(uintptr_t at, void *fn) { uint8_t *p = (void *)at; int32_t displacement; if (p[0] != 0xff || p[1] != 0x25) exit(12); memcpy(&displacement, p + 2, 4); memcpy(p + 6 + displacement, &fn, 8); }
static void *allocate(void *owner, size_t n, void *tag, uint32_t alignment) { (void)owner; (void)tag; if (!alignment || alignment & (alignment - 1)) exit(13); used = (used + alignment - 1) & ~(size_t)(alignment - 1); if (used + n > 64 * 1024 * 1024) exit(14); void *p = arena + used; memset(p, 0, n); used += n + 16; return p; }
static void *string_allocate(void *owner, size_t n) { return allocate(owner, n, NULL, 16); }
static void release(void *owner, void *p) { (void)owner; (void)p; }
static void *allocator(void) { return arena; }
static void types(void) {}
static void assertion(void *expression, void *file, uint32_t l, uint32_t s, ...) { (void)expression; (void)file; line = l; severity = s; longjmp(escape, 1); }
static void name(void *string) { uint8_t *s = string; const char *text = s[0] & 1 ? ptr(s, 0x10) : (char *)s + 1; char out[64] = {0}; size_t size = strnlen(text, 64); if (size >= 64) exit(15); memcpy(out, text, size); wr(out, 64); }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, allocate); hook(0x1007e5790UL, string_allocate); hook(0x1007e50d0UL, allocator); hook(0x1007e5db0UL, release); hook(0x1007abc10UL, types);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa28faUL, memmove); imported(0x100aa2c7eUL, strlen); imported(0x100aa2c90UL, strncpy);
  uint64_t stack_guard = 0; void *guard_pointer = &stack_guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  uint8_t type[0x80] = {0}; void *type_pointer = type;
  for (uintptr_t at = 0x101d74640UL; at <= 0x101d74760UL; at += 0x60) memcpy((void *)at, &type_pointer, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    uint32_t size; rd(&size, 4); if (!size || size > 4000000) return 8;
    uint8_t *input = malloc(size), list[0x9020] __attribute__((aligned(16))) = {0}, stream[0x50] __attribute__((aligned(16))) = {0}; rd(input, size); used = line = severity = 0;
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    if (!setjmp(escape)) ((void (*)(void *, void *, void *))0x1000dd370UL)(list, stream, arena);
    put_word(line); put_word(severity);
    if (!line) {
      put_word((uint8_t *)ptr(stream, 0x20) - input); put_word(word(input, 0)); put_word(word(list, 8)); put_word(word(list, 0x1010));
      for (uint32_t i = 0; i < word(list, 8); i++) {
        uint8_t *file = ptr(list, 0x10 + i * 8); name(file + 8); wr(file + 0x20, 8);
        for (uint32_t j = 0; j < word(file, 0x20); j++) {
          uint8_t *meta = ptr(list, 0x1018 + (word(file, 0x24) + j) * 8); name(meta + 0x10); wr(meta + 0x28, 8); wr(meta + 4, 8); wr(meta + 0x30, 16); wr(meta + 0x40, 3); wr(meta + 0xc8, 4); wr(meta + 0x100, 4);
          for (uint32_t k = 0; k < word(meta, 0xc8); k++) { uint8_t *sound = ptr(meta, 0x48 + k * 8); wr(sound + 4, 4); name(sound + 8); name(sound + 0x20); wr(sound + 0x38, 24); }
          for (uint32_t k = 0; k < word(meta, 0x100); k++) { uint8_t *emitter = ptr(meta, 0xd0 + k * 8); wr(emitter + 4, 8); name(emitter + 0x10); name(emitter + 0x28); wr(emitter + 0x40, 13); wr(emitter + 0x50, 8); }
        }
      }
    }
    free(input);
  }
  return 0;
}
