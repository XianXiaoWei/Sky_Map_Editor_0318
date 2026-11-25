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

layout(location=0) in vec3 a_position;
layout(location=1) in vec4 a_normal;
uniform float u_time;
uniform vec3 u_localAvatarPos;
uniform float u_cloudUndulationScale;
uniform mat4 u_viewProj;
void main() {
  float r4;
  float16_t r6;
  float r7;
  float r9;
  float r10;
  float r11;
  float r12;
  float r13;
  float r14;
  float r15;
  float r16;
  float r17;
  float r18;
  float r19;
  float r20;
  float r21;
  float r22;
  float r23;
  float r24;
  float r25;
  float r26;
  float r27;
  float r28;
  float r29;
  float r30;
  float r31;
  float r32;
  float r33;
  float r34;
  float r35;
  float r36;
  float r37;
  vec3 r38;
  vec4 r39;
  vec4 r42;
  vec4 r43;
  vec3 r44;
  float r45;
  float r46;
  float r47;
  float r48;
  float r49;
  vec3 r50;
  vec3 r51;
  vec3 r52;
  float r53;
  float r54;
  vec3 r55;
  vec3 r56;
  vec3 r57;
  vec3 r58;
  vec3 r59;
  vec4 r60;
  vec4 r61;
  vec4 r62;
  vec4 r64;
  vec4 r65;
  float r69;
  vec4 r70;
  vec4 r71;
  int r72;
  vec4 r74;
  vec4 r75;
  vec4 r76;
  int r77;
  bool r78;
  float r80;
  float r81;
  vec4 r82;
  float r83;
  float r84;
  float r85;
  float r86;
  vec4 r87;
  int r67;
  int p67;
  vec4 r68;
  vec4 p68;
  int _block = 3; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 3: {
      r4 = a_position[1];
      r6 = float16_t(air_quantize(float(u_cloudUndulationScale)));
      r7 = float(r6);
      r9 = u_time;
      r10 = (r9 * 0.09324999898672104);
      r11 = a_position[0];
      r12 = (r11 * 0.20000000298023224);
      r13 = (r12 + r4);
      r14 = (r13 * 0.12999999523162842);
      r15 = (r10 + r14);
      r16 = sin(r15);
      r17 = (r16 * 0.25);
      r18 = (r9 * 0.18649999797344208);
      r19 = a_position[2];
      r20 = (r4 * 0.20000000298023224);
      r21 = (r20 - r19);
      r22 = (r21 * 0.06499999761581421);
      r23 = (r18 + r22);
      r24 = sin(r23);
      r25 = (r24 * 0.5);
      r26 = (r9 * 0.37299999594688416);
      r27 = (r19 * 0.20000000298023224);
      r28 = (r27 - r11);
      r29 = (r28 * 0.032499998807907104);
      r30 = (r26 + r29);
      r31 = sin(r30);
      r32 = (r17 + -1.0);
      r33 = (r32 + r25);
      r34 = (r33 + r31);
      r35 = (r7 * 2.0);
      r36 = (r35 * r34);
      r37 = (r4 - r36);
      r38 = a_position;
      r38[1] = r37;
      r39 = vec4(r38[0], r38[1], r38[2], 0.0);
      r42 = vec4(u_localAvatarPos, 0.0);
      r43 = (r42 - r39);
      r44 = vec3(r43[0], r43[1], r43[2]);
      r45 = dot(r44, r44);
      r46 = (r45 * 0.012500000186264515);
      r47 = (1.0 - r46);
      r48 = max(0.5, r47);
      r49 = (r48 * 4.0);
      r50 = vec3(0);
      r50[0] = r49;
      r51 = vec3(r50[0], r50[0], r50[0]);
      r52 = vec3(a_normal[0], a_normal[1], a_normal[2]);
      r53 = dot(r52, r52);
      r54 = inversesqrt(r53);
      r55 = vec3(0);
      r55[0] = r54;
      r56 = vec3(r55[0], r55[0], r55[0]);
      r57 = (r51 * r52);
      r58 = (r57 * r56);
      r59 = (r38 - r58);
      r60 = vec4(r59[0], r59[1], r59[2], 0.0);
      r61 = vec4(r60[0], r60[1], r60[2], vec4(float(0), float(0), float(0), 1.0)[3]);
      r62 = vec4(r59[0], r59[0], r59[0], r59[0]);
      r64 = u_viewProj[0];
      r65 = (r62 * r64);
      _prev = _block; _block = 66; break;
    }
    case 66: {
      p67 = (_prev == 3 ? 1 : r77);
      p68 = (_prev == 3 ? r65 : r76);
      r67 = p67;
      r68 = p68;
      r69 = r61[r67];
      r70 = vec4(0);
      r70[0] = r69;
      r71 = vec4(r70[0], r70[0], r70[0], r70[0]);
      r72 = int(r67);
      r74 = u_viewProj[r72];
      r75 = (r74 * r71);
      r76 = (r75 + r68);
      r77 = (r67 + 1);
      r78 = (r77 == 4);
      _prev = _block; _block = (r78 ? 79 : 66); break;
    }
    case 79: {
      r80 = r76[1];
      r81 = (-0.0 - r80);
      r82 = r76;
      r82[1] = r81;
      r83 = r76[2];
      r84 = r76[3];
      r85 = (r83 + r84);
      r86 = (r85 * 0.5);
      r87 = r82;
      r87[2] = r86;
      gl_Position = vec4(r87);
      return;
    }
    default: return;
    }
  }
}
