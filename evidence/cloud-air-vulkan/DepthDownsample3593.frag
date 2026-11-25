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
layout(set=0,binding=1) uniform sampler2D u_depthMinTex;
layout(location=0) out vec4 o_depths;
uniform vec2 u_jitterHalf;
void main() {
  f16vec4 r5;
  f16vec4 r6;
  f16vec4 r7;
  f16vec4 r8;
  f16vec4 r9;
  f16vec4 r10;
  f16vec4 r11;
  vec2 r13;
  float r14;
  bool r15;
  f16vec4 r16;
  f16vec4 r17;
  float r18;
  bool r19;
  f16vec4 r20;
  f16vec4 r21;
  int _block = 4; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 4: {
      r5 = f16vec4(air_quantize(vec4(vec4(texture(u_depthMinTex, v_uv, 0.0)))));
      r6 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthMinTex, v_uv, ivec2(1, 0), 0.0)))));
      r7 = f16vec4(air_quantize(vec4(f16vec4(r6[1], float16_t(0.0), float16_t(0.0), r5[1]))));
      r8 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthMinTex, v_uv, ivec2(0, 1), 0.0)))));
      r9 = f16vec4(air_quantize(vec4(f16vec4(r7[0], r8[1], float16_t(0.0), r7[3]))));
      r10 = f16vec4(air_quantize(vec4(vec4(textureOffset(u_depthMinTex, v_uv, ivec2(1), 0.0)))));
      r11 = f16vec4(air_quantize(vec4(f16vec4(r9[0], r9[1], r10[1], r9[3]))));
      r13 = u_jitterHalf;
      r14 = r13[0];
      r15 = (r14 > 0.0);
      r16 = f16vec4(air_quantize(vec4(f16vec4(r11[3], r11[2], r11[1], r11[0]))));
      r17 = f16vec4(air_quantize(vec4((r15 ? r16 : r11))));
      r18 = r13[1];
      r19 = (r18 > 0.0);
      r20 = f16vec4(air_quantize(vec4(f16vec4(r17[2], r17[3], r17[0], r17[1]))));
      r21 = f16vec4(air_quantize(vec4((r19 ? r20 : r17))));
      o_depths = vec4(r21);
      return;
    }
    default: return;
    }
  }
}
