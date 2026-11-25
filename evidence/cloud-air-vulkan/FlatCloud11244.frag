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

layout(location=0) in vec4 v_uv;
layout(location=9) in float v_frame2Weight;
layout(location=3) in vec4 v_color;
layout(location=10) in float v_radius;
layout(location=11) in float v_fragDepth;
layout(location=12) in float v_softParticleScale;
layout(location=13) in vec2 v_uvVel;
layout(location=14) in float v_externalLighting;
layout(set=0,binding=8) uniform sampler2D u_texture;
layout(set=0,binding=7) uniform sampler2D u_depthHalfTex;
layout(location=0) out vec4 o_fragColor0;
layout(location=1) out vec4 o_fragColor1;
uniform vec2 u_viewportSize;
void main() {
  f16vec4 r15;
  f16vec4 r16;
  f16vec4 r17;
  float r18;
  float16_t r19;
  float r20;
  float16_t r21;
  float r22;
  vec2 r23;
  float r24;
  vec2 r25;
  f16vec4 r26;
  float16_t r27;
  float16_t r28;
  float16_t r29;
  float16_t r30;
  float16_t r31;
  vec2 r32;
  vec2 r34;
  vec2 r35;
  float r36;
  float16_t r37;
  float r38;
  float16_t r39;
  float r40;
  vec2 r41;
  float r42;
  vec2 r43;
  vec4 r44;
  float r45;
  float r46;
  float r47;
  float r48;
  float16_t r49;
  float r50;
  float r51;
  float r52;
  float r53;
  float r54;
  float r55;
  float r56;
  float r57;
  float r58;
  float r59;
  float r60;
  float16_t r61;
  float16_t r62;
  f16vec4 r63;
  float r64;
  float r65;
  float r66;
  float r67;
  float r68;
  float16_t r69;
  f16vec4 r70;
  f16vec4 r71;
  f16vec4 r72;
  f16vec4 r73;
  int _block = 14; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 14: {
      r15 = f16vec4(0);
      r15[0] = float16_t(air_quantize(v_externalLighting));
      r16 = f16vec4(air_quantize(vec4(f16vec4(r15[0], r15[0], r15[0], r15[0]))));
      r17 = f16vec4(air_quantize(vec4((vec4(r16) * vec4(f16vec4(air_quantize(v_color)))))));
      r18 = v_uv[0];
      r19 = float16_t(air_quantize(float(r18)));
      r20 = v_uv[1];
      r21 = float16_t(air_quantize(float(r20)));
      r22 = float(r19);
      r23 = vec2(0);
      r23[0] = r22;
      r24 = float(r21);
      r25 = r23;
      r25[1] = r24;
      r26 = f16vec4(air_quantize(vec4(vec4(texture(u_texture, r25, 0.0)))));
      r27 = float16_t(air_quantize(float(r26[3])));
      r28 = float16_t(air_quantize(float(r26[2])));
      r29 = float16_t(air_quantize(float(mix(float(r27), float(r28), float(float16_t(air_quantize(v_frame2Weight)))))));
      r30 = float16_t(air_quantize(float(r17[3])));
      r31 = float16_t(air_quantize(float((float(r29) * float(r30)))));
      r32 = vec2(gl_FragCoord[0], gl_FragCoord[1]);
      r34 = u_viewportSize;
      r35 = (r32 / r34);
      r36 = r35[0];
      r37 = float16_t(air_quantize(float(r36)));
      r38 = r35[1];
      r39 = float16_t(air_quantize(float(r38)));
      r40 = float(r37);
      r41 = vec2(0);
      r41[0] = r40;
      r42 = float(r39);
      r43 = r41;
      r43[1] = r42;
      r44 = vec4(textureLod(u_depthHalfTex, r43, 0.0));
      r45 = r44[3];
      r46 = abs(r45);
      r47 = (r46 * 10.0);
      r48 = min(256000.0, r47);
      r49 = float16_t(air_quantize(float((float(r29) * float(float16_t(air_quantize(v_radius)))))));
      r50 = float(r49);
      r51 = (r50 - v_fragDepth);
      r52 = (r51 + r48);
      r53 = float(float16_t(air_quantize(v_softParticleScale)));
      r54 = (r52 * r53);
      r55 = clamp(r54, 0.0, 1.0);
      r56 = clamp(r55, 0.0, 1.0);
      r57 = (r56 * 2.0);
      r58 = (3.0 - r57);
      r59 = (r56 * r56);
      r60 = (r59 * r58);
      r61 = float16_t(air_quantize(float(r60)));
      r62 = float16_t(air_quantize(float((float(r31) * float(r61)))));
      r63 = r17;
      r63[3] = r62;
      r64 = gl_FragCoord[3];
      r65 = (1.0 / r64);
      r66 = clamp(r65, 1.0010000467300415, 256000.0);
      r67 = log2(r66);
      r68 = (r67 * 256.0);
      r69 = float16_t(air_quantize(float(r68)));
      r70 = f16vec4(0);
      r70[0] = r69;
      r71 = f16vec4(air_quantize(vec4(f16vec4(f16vec2(air_quantize(v_uvVel))[0], f16vec2(air_quantize(v_uvVel))[1], float16_t(0.0), float16_t(0.0)))));
      r72 = f16vec4(air_quantize(vec4(f16vec4(r70[0], r71[0], r71[1], float16_t(0.0)))));
      r73 = r72;
      r73[3] = r62;
      o_fragColor0 = vec4(r63);
      o_fragColor1 = vec4(r73);
      return;
    }
    default: return;
    }
  }
}
