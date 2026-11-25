#define SKY_ANIMATION_FINALIZE_HELPERS_ONLY
#include "native-resource-animation-finalize-oracle.c"
static const uintptr_t trampoline = 0x4a0000000UL;
static void *refs[16]; static uint32_t ref_count;
static uint32_t ref_id(void *p) { for (uint32_t i = ref_count; i > 0; i--) if (refs[i - 1] == p) return i - 1; exit(30); }
static void log_load(uint32_t kind, uint32_t a, uint32_t b) {
  uint32_t count = word(memory, 0x9600), row[3] = {kind, a, b};
  if (count >= 180) exit(31); memcpy(memory + 0x9700 + count * 12, row, 12); count++; memcpy(memory + 0x9600, &count, 4);
}
static void capture(void *p) { memcpy(memory + 0x1c000 + ref_id(p) * 32, p, 32); }
static void ref_construct(void *p) {
  if (ref_count >= 16) exit(32); refs[ref_count] = p; log_load(1, ref_count, 0); ref_count++;
  memcpy(p, memory + 0x1c000 + ref_id(p) * 32, 32); ((void (*)(void *))(trampoline + 32))(p); capture(p);
}
static void ref_observe(void *resource, void *p) { ((void (*)(void *, void *))trampoline)(resource, p); capture(p); }
static void ref_destroy(void *p) { ((void (*)(void *))(trampoline + 64))(p); capture(p); }
static void callback(uint32_t slot, void *resource, void *p) {
  const uint32_t offset = (uint8_t *)resource - memory; log_load(3, offset, (slot << 16) | ref_id(p));
  if (slot == 0x38 && word(memory, 0x8a40) == (offset == 0x1d000 ? 1U : 2U)) ((void (*)(void *))0x1007c2600UL)(p);
}
static void added(void *r, void *p) { callback(0x38, r, p); }
static void removed(void *r, void *p) { callback(0x30, r, p); }
static void replaced(void *r, void *p) { callback(0x40, r, p); }
static void *load_mesh_type(void) { return memory + 0x9020; }
static void *load_pack_type(void) { return memory + 0x9030; }
static void *load_lookup(void *manager, void *type, void *name) {
  if (manager != memory + 0x9040) exit(33);
  const uint32_t mesh = type == memory + 0x9020, flag = mesh ? 1 : 2;
  log_load(2, (uint8_t *)type - memory, (uint8_t *)name - memory);
  if (!strcmp(name, "explicit-missing-resource")) return NULL;
  return word(memory, 0x8a3c) & flag ? memory + (mesh ? 0x1d000 : 0x1e000) : NULL;
}
static void normalize(void) {
  for (uint32_t at = 0x1c000; at < 0x1c200; at += 32) for (uint32_t slot = 0; slot < 3; slot++) {
    uintptr_t p = (uintptr_t)ptr(memory, at + slot * 8);
    for (uint32_t i = 0; i < ref_count; i++) if (p == (uintptr_t)refs[i]) { p = (uintptr_t)(memory + 0x1c000 + i * 32); memcpy(memory + at + slot * 8, &p, 8); break; }
  }
  for (uint32_t resource = 0; resource < 2; resource++) for (uint32_t slot = 0; slot < 2; slot++) {
    const uint32_t at = (resource ? 0x1e000 : 0x1d000) + 64 + slot * 8;
    uintptr_t p = (uintptr_t)ptr(memory, at);
    for (uint32_t i = 0; i < ref_count; i++) if (p == (uintptr_t)refs[i]) { p = (uintptr_t)(memory + 0x1c000 + i * 32); memcpy(memory + at, &p, 8); break; }
  }
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  memory = mmap((void *)0x490000000UL, 0x60000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 6;
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  if (mmap((void *)trampoline, 4096, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  // Copy only PC-independent, instruction-aligned entry prefixes; absolute
  // jumps resume original Observe/destructor tails with flags intact.
  memcpy((void *)trampoline, (void *)0x1007c2310UL, 16); hook(trampoline + 16, (void *)0x1007c2320UL);
  memcpy((void *)(trampoline + 32), (void *)0x1007c2530UL, 19);
  memcpy((void *)(trampoline + 64), (void *)0x1007c2570UL, 16); hook(trampoline + 80, (void *)0x1007c2580UL);
  hook(trampoline + 0x100, removed); hook(trampoline + 0x120, added); hook(trampoline + 0x140, replaced);
  hook(0x100795530UL, owner_allocate); hook(0x1007e5790UL, string_allocate); hook(0x1007e50d0UL, allocator); hook(0x1007e5db0UL, release); hook(0x1007abc10UL, types);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion); hook(0x10009fcd0UL, loaded_library);
  hook(0x1007c2530UL, ref_construct); hook(0x1007c2310UL, ref_observe); hook(0x1007c2570UL, ref_destroy);
  hook(0x1004559d0UL, load_mesh_type); hook(0x1000e42c0UL, load_pack_type); hook(0x1007c4360UL, load_lookup);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa28faUL, memmove); imported(0x100aa2c7eUL, strlen); imported(0x100aa2c90UL, strncpy);
  imported(0x100aa2c9cUL, strrchr); imported(0x100aa2c4eUL, strcmp); imported(0x100aa2c48UL, strchr); imported(0x100aa2522UL, ascii_lower); imported(0x100aa2906UL, pattern16);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  uint8_t type[0x80] = {0}; void *type_pointer = type; for (uintptr_t at = 0x101d74640UL; at <= 0x101d74760UL; at += 0x60) memcpy((void *)at, &type_pointer, 8);
  void *tag = memory + 0x9000; memcpy((void *)0x101d74608UL, &tag, 8); tag = memory + 0x9010; memcpy((void *)0x101dd2b68UL, &tag, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5) || mprotect((void *)trampoline, 4096, 5)) return 7;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    uint32_t size; rd(&size, 4); if (size > 4000000) return 8; uint8_t *input = malloc(size); rd(input, size); rd(memory, 0x60000);
    used = ref_count = 0; owner_used = 0x20000; line = severity = 0; memset(library, 0, sizeof library);
    if (size) {
      uint8_t stream[0x50] __attribute__((aligned(16))) = {0}; ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
      if (!setjmp(escape)) ((void (*)(void *, void *, void *))0x1000dd370UL)(library, stream, arena); if (line) return 23;
    }
    memcpy((void *)0x101dd2af8UL, memory + 0x1c400, 0x28);
    memcpy((void *)0x100d22ed0UL, memory + 0x8000, 0x400); memcpy((void *)0x100d232d0UL, memory + 0x8400, 0x400);
    uint32_t returned = 0;
    if (!setjmp(escape)) {
      if (word(memory, 0x8a38)) returned = ((uint32_t (*)(void *, void *, void *))0x100095170UL)(memory, memory + 0x9040, memory + 0x1c800);
      else ((void (*)(void *, void *, void *, uint32_t))0x1000942e0UL)(memory, memory + 0x9040, memory + 0x1c800, 0);
    }
    normalize(); memcpy(memory + 0x8a44, &returned, 4);
    memcpy(memory + 0x8000, (void *)0x100d22ed0UL, 0x400); memcpy(memory + 0x8400, (void *)0x100d232d0UL, 0x400);
    memcpy(memory + 0x8a20, &line, 4); memcpy(memory + 0x8a24, &severity, 4); wr(memory, 0x60000); free(input);
  }
  return 0;
}
