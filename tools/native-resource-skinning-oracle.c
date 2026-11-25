#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <immintrin.h>
#include <sys/mman.h>

static uint8_t *scratch_bytes;
static size_t scratch_size;
static uint32_t allocated, released;
static void rd(void *p, size_t n) { if (fread(p, 1, n, stdin) != n) exit(10); }
static void wr(const void *p, size_t n) { if (fwrite(p, 1, n, stdout) != n) exit(11); }
static void hook(uintptr_t at, void *fn) { uint8_t b[14] = {0xff, 0x25}; memcpy(b + 6, &fn, 8); memcpy((void *)at, b, 14); }
static void *scratch(void) { return (void *)0x300000000UL; }
static void *allocate(void *owner, size_t n, void *tag, uint32_t alignment) {
  (void)owner; (void)tag;
  if (allocated++ || n != scratch_size || alignment != 16) exit(12);
  memset(scratch_bytes, 0xa5, scratch_size + 16); return scratch_bytes;
}
static void release(void *owner, void *p) { (void)owner; if (released++ || p != scratch_bytes) exit(13); }
static void *aligned(size_t n) { void *p; if (posix_memalign(&p, 16, n + 16)) exit(14); memset(p, 0xa5, n + 16); return p; }
static void pointer(uint8_t *p, size_t at, void *v) { memcpy(p + at, &v, 8); }
int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  hook(0x1007c6c20UL, scratch); hook(0x100795530UL, allocate); hook(0x100795a70UL, release);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 6;
  uint32_t cases; rd(&cases, 4); wr(&cases, 4);
  while (cases--) {
    uint32_t count, bones, groups[4]; rd(&count, 4); rd(&bones, 4); rd(groups, 16);
    if (count > 1000000 || !bones || bones > 257 || (uint64_t)groups[0] + groups[1] + groups[2] + groups[3] != count) return 7;
    uint8_t lod[0xb8] __attribute__((aligned(16))) = {0}; memcpy(lod + 0x34, &count, 4); memcpy(lod + 0x50, groups, 16);
    uint8_t *positions = aligned(count * 16), *normals = aligned(count * 4), *skin = aligned(count * 8);
    float *palette = aligned(bones * 64); rd(positions, count * 16); rd(normals, count * 4); rd(skin, count * 8); rd(palette, bones * 64);
    pointer(lod, 0x60, positions); pointer(lod, 0x68, normals); pointer(lod, 0x78, skin);
    uint8_t *out1 = aligned(count * 16), *out2 = aligned(count * 16), *outnorm = aligned(count * 4);
    scratch_size = count * 16; scratch_bytes = aligned(scratch_size); allocated = released = 0;
    ((void (*)(void *, void *, void *))0x100457f50UL)(out1, lod, palette);
    ((void (*)(void *, void *, void *, void *))0x100458540UL)(out2, outnorm, lod, palette);
    if (allocated != 1 || released != 1) return 8;
    wr(out1, count * 16 + 16); wr(out2, count * 16 + 16); wr(outnorm, count * 4 + 16);
    // The fourth SIMD normal lane is scratch-only; consumers read XYZ.
    for (uint32_t i = 0; i < count; i++) ((float *)scratch_bytes)[i * 4 + 3] = 0;
    wr(scratch_bytes, scratch_size + 16);
    for (uint32_t i = 0; i < count; i++) {
      __m128 n = _mm_load_ps((float *)scratch_bytes + i * 4), square = _mm_mul_ps(n, n);
      __m128 sum = _mm_add_ss(square, _mm_shuffle_ps(square, square, 0x55));
      sum = _mm_add_ss(_mm_shuffle_ps(square, square, 0xaa), sum);
      uint32_t pair[2] = {_mm_cvtsi128_si32(_mm_castps_si128(sum)), _mm_cvtsi128_si32(_mm_castps_si128(_mm_rsqrt_ss(sum)))}; wr(pair, 8);
    }
    free(positions); free(normals); free(skin); free(palette); free(out1); free(out2); free(outnorm); free(scratch_bytes);
  }
  return 0;
}
