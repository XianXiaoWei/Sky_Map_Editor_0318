/* Explicit CPU test sampler for retargeted original AIR. No Metal driver.
 * R8 conversion and normalized clamp/repeat nearest/trilinear sampling use
 * float32. Hardware filtering/fast intrinsics can differ across drivers. */
#include <stdint.h>
#include <math.h>
#include <stdbool.h>
#include <string.h>
typedef float F2 __attribute__((ext_vector_type(2)));
typedef float F3 __attribute__((ext_vector_type(3)));
typedef float F4 __attribute__((ext_vector_type(4)));
typedef _Float16 H2 __attribute__((ext_vector_type(2)));
typedef _Float16 H3 __attribute__((ext_vector_type(3)));
typedef _Float16 H4 __attribute__((ext_vector_type(4)));
typedef int I2 __attribute__((ext_vector_type(2)));
typedef int I3 __attribute__((ext_vector_type(3)));
typedef bool B2 __attribute__((ext_vector_type(2)));
typedef struct { const uint8_t* data; int dimensions[3], channels, kind, linear, repeat; } Texture;

static int texindex(int i, int n, int repeat) {
    if (repeat) return ((i % n) + n) % n;
    return i < 0 ? 0 : i >= n ? n - 1 : i;
}
static F4 texel(const Texture* t, int x, int y, int z) {
    x = texindex(x, t->dimensions[0], t->repeat);
    y = texindex(y, t->dimensions[1], t->repeat);
    z = texindex(z, t->dimensions[2], t->repeat);
    int i = (x + t->dimensions[0] * (y + t->dimensions[1] * z)) * t->channels;
    F4 out = {0, 0, 0, 1};
    for (int c = 0; c < t->channels; c++) {
        if (t->kind == 0) out[c] = (float)t->data[i + c] / 255.f;
        else if (t->kind == 2) { _Float16 value; memcpy(&value, t->data + (i + c) * 2, 2); out[c] = (float)value; }
        else { float value; memcpy(&value, t->data + (i + c) * 4, 4); out[c] = value; }
    }
    return out;
}
static F4 sample(const Texture* t, F3 uv, I3 offset, int dimensions) {
    F3 p = {0, 0, 0}, f = {0, 0, 0}; I3 base = {0, 0, 0};
    for (int i = 0; i < dimensions; i++) {
        p[i] = uv[i] * t->dimensions[i] + offset[i] - (t->linear ? .5f : 0.f);
        if (!isfinite(p[i])) return (F4){NAN, NAN, NAN, NAN};
        base[i] = (int)floorf(p[i]); f[i] = p[i] - base[i];
    }
    if (!t->linear) return texel(t, base[0], base[1], base[2]);
    F4 zvalues[2];
    for (int z = 0; z < (dimensions == 3 ? 2 : 1); z++) {
        F4 yvalues[2];
        for (int y = 0; y < 2; y++) {
            F4 a = texel(t, base[0], base[1] + y, base[2] + z);
            F4 b = texel(t, base[0] + 1, base[1] + y, base[2] + z);
            yvalues[y] = a * (1.f - f[0]) + b * f[0];
        }
        zvalues[z] = yvalues[0] * (1.f - f[1]) + yvalues[1] * f[1];
    }
    return dimensions == 3 ? zvalues[0] * (1.f - f[2]) + zvalues[1] * f[2] : zvalues[0];
}
