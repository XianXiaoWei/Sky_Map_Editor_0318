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

layout(location=0) in vec2 v_uv;
layout(set=0,binding=1) uniform sampler2D u_depthFullTex;
layout(location=0) out vec2 o_depths;
uniform vec2 u_jitterHalf;
void main() {
  f16vec4 r5;
  float16_t r6;
  f16vec4 r7;
  float16_t r8;
  f16vec4 r9;
  float16_t r10;
  f16vec4 r11;
  float16_t r12;
  float16_t r13;
  float16_t r14;
  float16_t r15;
  float16_t r16;
  float16_t r17;
  float16_t r18;
  float16_t r19;
  f16vec2 r20;
  bool r21;
  f16vec2 r22;
  vec2 r24;
  float r25;
  bool r26;
  float16_t r27;
  float16_t r28;
  float r29;
  bool r30;
  float16_t r31;
  f16vec2 r32;
  int _block = 4; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 4: {
      r5 = f16vec4(air_quantize(vec4(vec4(texture(u_depthFullTex, v_uv, 0.0)))));
      r6 = float16_t(air_quantize(float(r5[3])));
      r7 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthFullTex, v_uv, ivec2(1, 0), 0.0)))));
      r8 = float16_t(air_quantize(float(r7[3])));
      r9 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthFullTex, v_uv, ivec2(0, 1), 0.0)))));
      r10 = float16_t(air_quantize(float(r9[3])));
      r11 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthFullTex, v_uv, ivec2(1), 0.0)))));
      r12 = float16_t(air_quantize(float(r11[3])));
      r13 = float16_t(air_quantize(float(abs(float(r6)))));
      r14 = float16_t(air_quantize(float(abs(float(r8)))));
      r15 = float16_t(air_quantize(float(min(float(r13), float(r14)))));
      r16 = float16_t(air_quantize(float(abs(float(r10)))));
      r17 = float16_t(air_quantize(float(min(float(r15), float(r16)))));
      r18 = float16_t(air_quantize(float(abs(float(r12)))));
      r19 = float16_t(air_quantize(float(min(float(r17), float(r18)))));
      r20 = f16vec2(0);
      r20[0] = r19;
      r21 = (r19 == float16_t(0.0));
      r22 = f16vec2(air_quantize(vec2((r21 ? f16vec2(float16_t(25600.0), float16_t(0)) : r20))));
      r24 = u_jitterHalf;
      r25 = r24[0];
      r26 = (r25 < 0.0);
      r27 = float16_t(air_quantize(float((r26 ? r6 : r8))));
      r28 = float16_t(air_quantize(float((r26 ? r10 : r12))));
      r29 = r24[1];
      r30 = (r29 < 0.0);
      r31 = float16_t(air_quantize(float((r30 ? r27 : r28))));
      r32 = r22;
      r32[1] = r31;
      o_depths = vec2(r32);
      return;
    }
    default: return;
    }
  }
}
