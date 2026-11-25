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

layout(location=0) in vec2 a_position;
layout(location=1) in vec2 a_uv;
layout(location=0) out vec4 v_rayVecSize;
layout(location=1) out vec4 v_bMinU;
layout(location=2) out vec4 v_bMaxV;
uniform vec3 u_cloudBinMinWorld;
uniform vec3 u_cloudBinRangeWorld;
uniform vec4 u_cloudVoxelScales;
uniform vec2 u_jitter;
uniform vec2 u_jitterHalf;
uniform vec2 u_viewportSize;
uniform vec3 u_projPlaneU;
uniform vec3 u_projPlaneV;
uniform vec3 u_projPlaneOrigin;
uniform vec3 u_eyePos;
void main() {
  vec2 r5;
  vec2 r6;
  vec2 r8;
  vec2 r9;
  vec4 r10;
  vec4 r11;
  vec4 r14;
  vec3 r15;
  vec3 r16;
  vec4 r19;
  vec3 r20;
  vec3 r21;
  vec3 r22;
  vec3 r23;
  vec4 r26;
  vec3 r27;
  vec3 r28;
  vec3 r29;
  vec4 r30;
  float r31;
  float r32;
  float r33;
  vec2 r35;
  float r36;
  float r37;
  float r38;
  vec4 r39;
  vec4 r41;
  vec4 r43;
  float r44;
  float r45;
  vec3 r46;
  vec3 r47;
  vec3 r48;
  vec4 r51;
  vec4 r52;
  vec3 r53;
  vec3 r54;
  vec4 r55;
  vec4 r56;
  vec4 r59;
  vec4 r60;
  vec4 r61;
  vec4 r62;
  vec4 r63;
  float r64;
  float r65;
  vec4 r66;
  vec4 r67;
  int _block = 3; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 3: {
      r5 = u_jitter;
      r6 = (r5 + a_uv);
      r8 = u_jitterHalf;
      r9 = (r6 + r8);
      r10 = vec4(0.0, 0.0, 0.0, r9[0]);
      r11 = vec4(0.0, 0.0, 0.0, r9[1]);
      r14 = vec4(u_projPlaneOrigin, 0.0);
      r15 = vec3(r14[0], r14[1], r14[2]);
      r16 = vec3(r9[0], r9[0], r9[0]);
      r19 = vec4(u_projPlaneU, 0.0);
      r20 = vec3(r19[0], r19[1], r19[2]);
      r21 = (r20 * r16);
      r22 = (r21 + r15);
      r23 = vec3(r9[1], r9[1], r9[1]);
      r26 = vec4(u_projPlaneV, 0.0);
      r27 = vec3(r26[0], r26[1], r26[2]);
      r28 = (r27 * r23);
      r29 = (r22 + r28);
      r30 = vec4(r29[0], r29[1], r29[2], 0.0);
      r31 = dot(r20, r20);
      r32 = sqrt(r31);
      r33 = (r32 * 0.5);
      r35 = u_viewportSize;
      r36 = r35[0];
      r37 = (r33 / r36);
      r38 = (r37 * 1.0606600046157837);
      r39 = r30;
      r39[3] = r38;
      r41 = vec4(u_cloudBinMinWorld, 0.0);
      r43 = u_cloudVoxelScales;
      r44 = r43[0];
      r45 = (r44 * 0.5);
      r46 = vec3(0);
      r46[0] = r45;
      r47 = vec3(r46[0], r46[0], r46[0]);
      r48 = (r47 * vec3(1.0099999904632568));
      r51 = vec4(u_eyePos, 0.0);
      r52 = (r41 - r51);
      r53 = vec3(r52[0], r52[1], r52[2]);
      r54 = (r53 + r48);
      r55 = vec4(r54[0], r54[1], r54[2], 0.0);
      r56 = vec4(r55[0], r55[1], r55[2], r10[3]);
      r59 = vec4(u_cloudBinRangeWorld, 0.0);
      r60 = (r52 + r59);
      r61 = vec4(r60[0], r60[1], r60[2], r11[3]);
      r62 = vec4(a_position[0], 0.0, 0.0, 0.0);
      r63 = vec4(r62[0], 0.0, 0.0, vec4(float(0), float(0), float(0), 1.0)[3]);
      r64 = a_position[1];
      r65 = (-0.0 - r64);
      r66 = r63;
      r66[1] = r65;
      r67 = r66;
      r67[2] = 0.5;
      gl_Position = vec4(r67);
      v_rayVecSize = vec4(r39);
      v_bMinU = vec4(r56);
      v_bMaxV = vec4(r61);
      return;
    }
    default: return;
    }
  }
}
