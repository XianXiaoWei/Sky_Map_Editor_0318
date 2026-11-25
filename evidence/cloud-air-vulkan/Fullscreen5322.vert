#version 450
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
// Generated from original Metal AIR. GPU equivalence remains unverified.
float air_quantize(float v) {
  uint bits = floatBitsToUint(v), magnitude = bits & 0x7fffffffu;
  if (magnitude >= 0x7f800000u) return v;
  if (magnitude < 0x38800000u) {
    float q = roundEven(abs(v) * 16777216.0) * 0.000000059604644775390625;
    return uintBitsToFloat((bits & 0x80000000u) | floatBitsToUint(q));
  }
  uint rounded = magnitude + 0xfffu + ((magnitude >> 13u) & 1u);
  if (rounded >= 0x47800000u) rounded = 0x7f800000u;
  return uintBitsToFloat((bits & 0x80000000u) | (rounded & 0x7fffe000u));
}
vec2 air_quantize(vec2 v) { return vec2(air_quantize(v[0]), air_quantize(v[1])); }
vec3 air_quantize(vec3 v) { return vec3(air_quantize(v[0]), air_quantize(v[1]), air_quantize(v[2])); }
vec4 air_quantize(vec4 v) { return vec4(air_quantize(v[0]), air_quantize(v[1]), air_quantize(v[2]), air_quantize(v[3])); }

ivec3 air_texel_coord(ivec3 p, ivec3 size, bool repeat) {
  // The only recovered repeating cloud resource is the power-of-two 64^3
  // CloudFluffy volume. Integer masking also handles its negative coordinates.
  return repeat ? (p & (size-1)) : clamp(p,ivec3(0),size-1);
}
vec4 air_sample3d(sampler3D image,vec3 uv,ivec3 offset,bool linear,bool repeat) {
  ivec3 size=textureSize(image,0);
  precise vec3 p=uv*vec3(size)+vec3(offset)-(linear?vec3(0.5):vec3(0.0));
  ivec3 base=ivec3(floor(p));
  if(!linear) return texelFetch(image,air_texel_coord(base,size,repeat),0);
  precise vec3 f=p-vec3(base);
  vec4 a000=texelFetch(image,air_texel_coord(base,size,repeat),0);
  vec4 a100=texelFetch(image,air_texel_coord(base+ivec3(1,0,0),size,repeat),0);
  vec4 a010=texelFetch(image,air_texel_coord(base+ivec3(0,1,0),size,repeat),0);
  vec4 a110=texelFetch(image,air_texel_coord(base+ivec3(1,1,0),size,repeat),0);
  vec4 a001=texelFetch(image,air_texel_coord(base+ivec3(0,0,1),size,repeat),0);
  vec4 a101=texelFetch(image,air_texel_coord(base+ivec3(1,0,1),size,repeat),0);
  vec4 a011=texelFetch(image,air_texel_coord(base+ivec3(0,1,1),size,repeat),0);
  vec4 a111=texelFetch(image,air_texel_coord(base+ivec3(1,1,1),size,repeat),0);
  precise vec4 x00=a000*(1.0-f.x)+a100*f.x;
  precise vec4 x10=a010*(1.0-f.x)+a110*f.x;
  precise vec4 x01=a001*(1.0-f.x)+a101*f.x;
  precise vec4 x11=a011*(1.0-f.x)+a111*f.x;
  precise vec4 y0=x00*(1.0-f.y)+x10*f.y;
  precise vec4 y1=x01*(1.0-f.y)+x11*f.y;
  precise vec4 z=y0*(1.0-f.z)+y1*f.z;
  return z;
}

layout(location=0) out vec2 v_uv;
uniform vec2 u_jitterHalf;
void main() {
  int r3;
  int r4;
  bool r8;
  float16_t r9;
  f16vec2 r10;
  f16vec2 r11;
  f16vec2 r13;
  f16vec2 r14;
  float16_t r15;
  float r16;
  vec2 r17;
  float16_t r18;
  float r19;
  vec2 r20;
  f16vec2 r21;
  f16vec2 r22;
  float16_t r23;
  float r24;
  vec4 r25;
  float16_t r26;
  float r27;
  vec4 r28;
  float r29;
  vec4 r30;
  vec4 r31;
  float16_t r7;
  float16_t p7;
  int _block = 2; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 2: {
      r3 = int(uint(gl_VertexIndex) << 16u);
      r4 = (r3 >> 16);
      _prev = _block; _block = (r4 == 0 ? 6 : (r4 == 3 ? 6 : 5)); break;
    }
    case 5: {
      _prev = _block; _block = 6; break;
    }
    case 6: {
      p7 = (_prev == 5 ? float16_t(1.0) : (_prev == 2 ? float16_t(-1.0) : float16_t(-1.0)));
      r7 = p7;
      r8 = (r3 < 131072);
      r9 = float16_t(air_quantize(float((r8 ? float16_t(1.0) : float16_t(-1.0)))));
      r10 = f16vec2(0);
      r10[0] = r7;
      r11 = r10;
      r11[1] = r9;
      r13 = f16vec2(air_quantize(vec2(u_jitterHalf)));
      r14 = f16vec2(air_quantize(vec2((vec2(r11) + vec2(r13)))));
      r15 = float16_t(air_quantize(float(r14[0])));
      r16 = float(r15);
      r17 = vec2(0);
      r17[0] = r16;
      r18 = float16_t(air_quantize(float(r14[1])));
      r19 = float(r18);
      r20 = r17;
      r20[1] = r19;
      r21 = f16vec2(air_quantize(vec2((vec2(r11) * vec2(f16vec2(float16_t(2.0)))))));
      r22 = f16vec2(air_quantize(vec2(fma(vec2(r11), vec2(f16vec2(float16_t(2.0))), vec2(f16vec2(float16_t(-1.0)))))));
      r23 = float16_t(air_quantize(float(r22[0])));
      r24 = float(r23);
      r25 = vec4(0);
      r25[0] = r24;
      r26 = float16_t(air_quantize(float(r22[1])));
      r27 = float(r26);
      r28 = r25;
      r28[3] = 1.0;
      r29 = (-0.0 - r27);
      r30 = r28;
      r30[1] = r29;
      r31 = r30;
      r31[2] = 0.5;
      gl_Position = vec4(r31);
      v_uv = vec2(r20);
      return;
    }
    default: return;
    }
  }
}
