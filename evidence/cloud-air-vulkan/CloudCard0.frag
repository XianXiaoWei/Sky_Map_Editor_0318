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

layout(location=3) in vec3 v_color;
layout(location=0) in vec2 v_uv;
layout(location=4) in vec3 v_eye;
layout(location=5) in vec3 v_norm;
layout(location=6) in vec3 v_worldPos;
layout(location=7) in float v_alphaMult;
layout(location=8) in vec2 v_closenessToSurface;
layout(set=0,binding=3) uniform sampler3D u_cloudNoise3D;
layout(set=0,binding=1) uniform sampler2D u_alphaTex;
layout(set=0,binding=5) uniform sampler2D u_depthHalfTex;
layout(location=0) out vec4 o_fragColor0;
layout(location=1) out vec4 o_fragColor1;
uniform vec3 u_cloudWindMove;
uniform vec3 u_cloudWindScroll;
uniform vec4 u_cloudNoiseTweaks;
uniform vec2 u_viewportSize;
uniform vec2 u_jitter;
uniform mat4 u_viewProjOld;
void main() {
  vec2 r16;
  vec2 r18;
  vec2 r19;
  float r20;
  float r21;
  vec4 r22;
  float r23;
  float r24;
  float r25;
  float r26;
  float r27;
  float r28;
  float r29;
  float r30;
  float r31;
  bool r32;
  f16vec4 r34;
  float16_t r35;
  float16_t r36;
  float r37;
  float16_t r38;
  float16_t r39;
  float16_t r40;
  float r41;
  float16_t r42;
  float r43;
  vec3 r44;
  float16_t r45;
  float r46;
  vec3 r47;
  float16_t r48;
  float r49;
  vec3 r50;
  float r51;
  float r52;
  vec3 r53;
  vec3 r54;
  vec3 r55;
  float r56;
  float r57;
  float r58;
  float r59;
  float r60;
  float r61;
  float r62;
  float r63;
  float r64;
  bool r65;
  vec4 r69;
  vec3 r70;
  vec3 r71;
  vec3 r72;
  f16vec4 r74;
  float16_t r75;
  f16vec4 r76;
  float16_t r77;
  float16_t r78;
  float16_t r79;
  float16_t r80;
  float16_t r81;
  float r82;
  float r83;
  float r84;
  float r85;
  vec4 r87;
  vec3 r88;
  vec3 r89;
  vec4 r90;
  vec4 r91;
  vec4 r92;
  vec4 r94;
  vec4 r95;
  float r99;
  vec4 r100;
  vec4 r101;
  int r102;
  vec4 r104;
  vec4 r105;
  vec4 r106;
  int r107;
  bool r108;
  float r110;
  float16_t r111;
  float16_t r112;
  float16_t r113;
  f16vec4 r114;
  f16vec4 r115;
  f16vec4 r116;
  float16_t r117;
  f16vec4 r118;
  float r119;
  float r120;
  float r121;
  float16_t r122;
  vec2 r123;
  vec2 r124;
  vec2 r125;
  vec2 r126;
  vec2 r128;
  vec2 r129;
  vec2 r130;
  vec2 r131;
  vec2 r132;
  vec2 r133;
  vec2 r134;
  vec2 r135;
  f16vec4 r136;
  float r137;
  float16_t r138;
  f16vec4 r139;
  float r140;
  float16_t r141;
  f16vec4 r142;
  f16vec4 r143;
  int r97;
  int p97;
  vec4 r98;
  vec4 p98;
  f16vec4 r145;
  f16vec4 p145;
  f16vec4 r146;
  f16vec4 p146;
  int _block = 15; int _prev = -1;
  for (;;) {
    switch (_block) {
    case 15: {
      r16 = vec2(gl_FragCoord[0], gl_FragCoord[1]);
      r18 = u_viewportSize;
      r19 = (r16 / r18);
      r20 = gl_FragCoord[3];
      r21 = (1.0 / r20);
      r22 = vec4(texture(u_depthHalfTex, r19, 0.0));
      r23 = r22[3];
      r24 = abs(r23);
      r25 = (r24 * 10.0);
      r26 = min(256000.0, r25);
      r27 = (r26 - r21);
      r28 = max(0.0, r27);
      r29 = (r28 * -2.0);
      r30 = exp2(r29);
      r31 = (1.0 - r30);
      r32 = (r31 > 0.0010000000474974513);
      _prev = _block; _block = (r32 ? 33 : 144); break;
    }
    case 33: {
      r34 = f16vec4(air_quantize(vec4(vec4(texture(u_alphaTex, v_uv, 0.0)))));
      r35 = float16_t(air_quantize(float(r34[3])));
      r36 = float16_t(air_quantize(float((float(r35) * float(float16_t(air_quantize(v_alphaMult)))))));
      r37 = float(r36);
      r38 = float16_t(air_quantize(float(f16vec2(air_quantize(v_closenessToSurface))[0])));
      r39 = float16_t(air_quantize(float((float(r38) * float(float16_t(5.0))))));
      r40 = float16_t(air_quantize(float(fma(float(r38), float(float16_t(5.0)), float(float16_t(1.0))))));
      r41 = float(r40);
      r42 = float16_t(air_quantize(float(f16vec3(air_quantize(v_norm))[0])));
      r43 = float(r42);
      r44 = vec3(0);
      r44[0] = r43;
      r45 = float16_t(air_quantize(float(f16vec3(air_quantize(v_norm))[1])));
      r46 = float(r45);
      r47 = r44;
      r47[1] = r46;
      r48 = float16_t(air_quantize(float(f16vec3(air_quantize(v_norm))[2])));
      r49 = float(r48);
      r50 = r47;
      r50[2] = r49;
      r51 = dot(v_eye, v_eye);
      r52 = inversesqrt(r51);
      r53 = vec3(0);
      r53[0] = r52;
      r54 = vec3(r53[0], r53[0], r53[0]);
      r55 = (r54 * v_eye);
      r56 = dot(r50, r55);
      r57 = abs(r56);
      r58 = (r21 + -2.0);
      r59 = clamp(r58, 0.0, 10.0);
      r60 = (r41 * 0.10000000149011612);
      r61 = (r60 * r31);
      r62 = (r61 * r37);
      r63 = (r62 * r57);
      r64 = (r63 * r59);
      r65 = (r64 > 0.0010000000474974513);
      _prev = _block; _block = (r65 ? 66 : 144); break;
    }
    case 66: {
      r69 = vec4(u_cloudWindScroll, 0.0);
      r70 = vec3(r69[0], r69[1], r69[2]);
      r71 = (v_worldPos - r70);
      r72 = (r71 * vec3(0.0234375));
      r74 = f16vec4(air_quantize(vec4(u_cloudNoiseTweaks)));
      r75 = float16_t(air_quantize(float(r74[0])));
      r76 = f16vec4(air_quantize(vec4(vec4(air_sample3d(u_cloudNoise3D, r72, ivec3(0), true, true)))));
      r77 = float16_t(air_quantize(float(r76[0])));
      r78 = float16_t(air_quantize(float((float(r77) * float(r75)))));
      r79 = float16_t(air_quantize(float((float(r78) / float(r75)))));
      r80 = float16_t(air_quantize(float(f16vec2(air_quantize(v_closenessToSurface))[1])));
      r81 = float16_t(air_quantize(float(mix(float(float16_t(1.0)), float(r79), float(r80)))));
      r82 = float(r81);
      r83 = (r64 * -3.0);
      r84 = (r83 * r82);
      r85 = exp2(r84);
      r87 = vec4(u_cloudWindMove, 0.0);
      r88 = vec3(r87[0], r87[1], r87[2]);
      r89 = (v_worldPos - r88);
      r90 = vec4(r89[0], r89[1], r89[2], 0.0);
      r91 = vec4(r90[0], r90[1], r90[2], vec4(float(0), float(0), float(0), 1.0)[3]);
      r92 = vec4(r89[0], r89[0], r89[0], r89[0]);
      r94 = u_viewProjOld[0];
      r95 = (r92 * r94);
      _prev = _block; _block = 96; break;
    }
    case 96: {
      p97 = (_prev == 66 ? 1 : r107);
      p98 = (_prev == 66 ? r95 : r106);
      r97 = p97;
      r98 = p98;
      r99 = r91[r97];
      r100 = vec4(0);
      r100[0] = r99;
      r101 = vec4(r100[0], r100[0], r100[0], r100[0]);
      r102 = int(r97);
      r104 = u_viewProjOld[r102];
      r105 = (r104 * r101);
      r106 = (r105 + r98);
      r107 = (r97 + 1);
      r108 = (r107 == 4);
      _prev = _block; _block = (r108 ? 109 : 96); break;
    }
    case 109: {
      r110 = (1.0 - r85);
      r111 = float16_t(air_quantize(float(f16vec3(air_quantize(v_color))[0])));
      r112 = float16_t(air_quantize(float(f16vec3(air_quantize(v_color))[1])));
      r113 = float16_t(air_quantize(float(f16vec3(air_quantize(v_color))[2])));
      r114 = f16vec4(0);
      r114[0] = r111;
      r115 = r114;
      r115[1] = r112;
      r116 = r115;
      r116[2] = r113;
      r117 = float16_t(air_quantize(float(r110)));
      r118 = r116;
      r118[3] = r117;
      r119 = clamp(r21, 1.0010000467300415, 256000.0);
      r120 = log2(r119);
      r121 = (r120 * 256.0);
      r122 = float16_t(air_quantize(float(r121)));
      r123 = vec2(r106[0], r106[1]);
      r124 = vec2(r106[3], r106[3]);
      r125 = (r123 / r124);
      r126 = (r125 * vec2(-0.5));
      r128 = u_jitter;
      r129 = (r19 + vec2(-0.5));
      r130 = (r129 + r126);
      r131 = (r130 - r128);
      r132 = vec2(0);
      r132[0] = r110;
      r133 = vec2(r132[0], r132[0]);
      r134 = (r133 * vec2(1024.0));
      r135 = (r134 * r131);
      r136 = f16vec4(0);
      r136[0] = r122;
      r137 = r135[0];
      r138 = float16_t(air_quantize(float(r137)));
      r139 = r136;
      r139[1] = r138;
      r140 = r135[1];
      r141 = float16_t(air_quantize(float(r140)));
      r142 = r139;
      r142[2] = r141;
      r143 = r142;
      r143[3] = r117;
      _prev = _block; _block = 144; break;
    }
    case 144: {
      p145 = (_prev == 109 ? r118 : (_prev == 33 ? f16vec4(0) : f16vec4(0)));
      p146 = (_prev == 109 ? r143 : (_prev == 33 ? f16vec4(0) : f16vec4(0)));
      r145 = p145;
      r146 = p146;
      o_fragColor0 = vec4(r145);
      o_fragColor1 = vec4(r146);
      return;
    }
    default: return;
    }
  }
}
