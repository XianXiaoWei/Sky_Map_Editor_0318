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

layout(set=0,binding=1) uniform sampler2D u_cloudTex0;
layout(location=0) out vec4 o_fragColor0;
uniform vec2 u_viewportSize;
void main() {
  vec2 r5;
  vec2 r7;
  vec2 r8;
  f16vec4 r9;
  float16_t r10;
  bool r11;
  f16vec3 r13;
  f16vec3 r14;
  f16vec3 r15;
  f16vec4 r16;
  float r19;
  float r20;
  float r21;
  float r22;
  float16_t r23;
  float16_t r24;
  f16vec4 r25;
  f16vec4 r18;
  f16vec4 p18;
  int _block = 4; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 4: {
      r5 = vec2(gl_FragCoord[0], gl_FragCoord[1]);
      r7 = u_viewportSize;
      r8 = (r5 / r7);
      r9 = f16vec4(air_quantize(vec4(vec4(textureLod(u_cloudTex0, r8, 0.0)))));
      r10 = float16_t(air_quantize(float(r9[3])));
      r11 = (r10 > float16_t(0.0));
      _prev = _block; _block = (r11 ? 12 : 17); break;
    }
    case 12: {
      r13 = f16vec3(air_quantize(vec3(f16vec3(r9[0], r9[1], r9[2]))));
      r14 = f16vec3(air_quantize(vec3(f16vec3(r9[3], r9[3], r9[3]))));
      r15 = f16vec3(air_quantize(vec3((vec3(r13) / vec3(r14)))));
      r16 = f16vec4(air_quantize(vec4(f16vec4(r15[0], r15[1], r15[2], float16_t(0.0)))));
      _prev = _block; _block = 17; break;
    }
    case 17: {
      p18 = (_prev == 12 ? r16 : f16vec4(float16_t(0.0), float16_t(0.0), float16_t(0.0), float16_t(0)));
      r18 = p18;
      r19 = gl_FragCoord[3];
      r20 = (1.0 / r19);
      r21 = min(256000.0, r20);
      r22 = (r21 * 0.10000000149011612);
      r23 = float16_t(air_quantize(float(r22)));
      r24 = float16_t(air_quantize(float((float(float16_t(-0.0)) - float(r23)))));
      r25 = r18;
      r25[3] = r24;
      o_fragColor0 = vec4(r25);
      return;
    }
    default: return;
    }
  }
}
