0x10078de40: vmovaps xmm9, xmmword ptr [rdi]
0x10078de44: vmulps xmm0, xmm9, xmm9
0x10078de49: vmovshdup xmm1, xmm0
0x10078de4d: vaddss xmm1, xmm0, xmm1
0x10078de51: vpermilpd xmm0, xmm0, 1
0x10078de57: vaddss xmm0, xmm0, xmm1
0x10078de5b: vsqrtss xmm0, xmm0, xmm0
0x10078de5f: vucomiss xmm0, dword ptr [rip + 0x319a5d] ; 0x100aa78c4
0x10078de67: jbe 0x10078de73
0x10078de69: vpermilps xmm1, xmm0, 0xc0
0x10078de6f: vdivps xmm9, xmm9, xmm1
0x10078de73: vmovaps xmm8, xmmword ptr [rdi + 0x10]
0x10078de78: vmulps xmm1, xmm8, xmm8
0x10078de7d: vmovshdup xmm4, xmm1
0x10078de81: vaddss xmm4, xmm1, xmm4
0x10078de85: vpermilpd xmm1, xmm1, 1
0x10078de8b: vaddss xmm1, xmm1, xmm4
0x10078de8f: vsqrtss xmm4, xmm1, xmm1
0x10078de93: vucomiss xmm4, dword ptr [rip + 0x319a29] ; 0x100aa78c4
0x10078de9b: jbe 0x10078dea7
0x10078de9d: vpermilps xmm1, xmm4, 0xc0
0x10078dea3: vdivps xmm8, xmm8, xmm1
0x10078dea7: vmovaps xmm11, xmmword ptr [rdi + 0x20]
0x10078deac: vmulps xmm1, xmm11, xmm11
0x10078deb1: vmovshdup xmm5, xmm1
0x10078deb5: vaddss xmm5, xmm1, xmm5
0x10078deb9: vpermilpd xmm1, xmm1, 1
0x10078debf: vaddss xmm1, xmm1, xmm5
0x10078dec3: vsqrtss xmm5, xmm1, xmm1
0x10078dec7: vucomiss xmm5, dword ptr [rip + 0x3199f5] ; 0x100aa78c4
0x10078decf: jbe 0x10078dedb
0x10078ded1: vpermilps xmm1, xmm5, 0xc0
0x10078ded7: vdivps xmm11, xmm11, xmm1
0x10078dedb: push rbp
0x10078dedc: mov rbp, rsp
0x10078dedf: sub rsp, 0xe0
0x10078dee6: vinsertps xmm0, xmm0, xmm4, 0x10
0x10078deec: vinsertps xmm0, xmm0, xmm5, 0x20
0x10078def2: vmovss dword ptr [rbp - 0x98], xmm5
0x10078defa: vmovlps qword ptr [rbp - 0xa0], xmm0
0x10078df02: vmovaps xmm4, xmmword ptr [rsi]
0x10078df06: vmulps xmm0, xmm4, xmm4
0x10078df0a: vmovshdup xmm1, xmm0
0x10078df0e: vaddss xmm1, xmm0, xmm1
0x10078df12: vpermilpd xmm0, xmm0, 1
0x10078df18: vaddss xmm0, xmm0, xmm1
0x10078df1c: vsqrtss xmm0, xmm0, xmm0
0x10078df20: vucomiss xmm0, dword ptr [rip + 0x31999c] ; 0x100aa78c4
0x10078df28: jbe 0x10078df34
0x10078df2a: vpermilps xmm1, xmm0, 0xc0
0x10078df30: vdivps xmm4, xmm4, xmm1
0x10078df34: vmovaps xmm5, xmmword ptr [rsi + 0x10]
0x10078df39: vmulps xmm1, xmm5, xmm5
0x10078df3d: vmovshdup xmm6, xmm1
0x10078df41: vaddss xmm6, xmm1, xmm6
0x10078df45: vpermilpd xmm1, xmm1, 1
0x10078df4b: vaddss xmm1, xmm1, xmm6
0x10078df4f: vsqrtss xmm7, xmm1, xmm1
0x10078df53: vucomiss xmm7, dword ptr [rip + 0x319969] ; 0x100aa78c4
0x10078df5b: jbe 0x10078df67
0x10078df5d: vpermilps xmm1, xmm7, 0xc0
0x10078df63: vdivps xmm5, xmm5, xmm1
0x10078df67: vmovaps xmm6, xmmword ptr [rsi + 0x20]
0x10078df6c: vmulps xmm1, xmm6, xmm6
0x10078df70: vmovshdup xmm2, xmm1
0x10078df74: vaddss xmm2, xmm1, xmm2
0x10078df78: vpermilpd xmm1, xmm1, 1
0x10078df7e: vaddss xmm1, xmm1, xmm2
0x10078df82: vsqrtss xmm1, xmm1, xmm1
0x10078df86: vucomiss xmm1, dword ptr [rip + 0x319936] ; 0x100aa78c4
0x10078df8e: jbe 0x10078df9a
0x10078df90: vpermilps xmm2, xmm1, 0xc0
0x10078df96: vdivps xmm6, xmm6, xmm2
0x10078df9a: vinsertps xmm0, xmm0, xmm7, 0x10
0x10078dfa0: vinsertps xmm0, xmm0, xmm1, 0x20
0x10078dfa6: vmovss dword ptr [rbp - 0x88], xmm1
0x10078dfae: vmulps xmm1, xmm9, xmm4
0x10078dfb2: vmovshdup xmm2, xmm1
0x10078dfb6: vaddss xmm2, xmm1, xmm2
0x10078dfba: vpermilpd xmm1, xmm1, 1
0x10078dfc0: vaddss xmm10, xmm1, xmm2
0x10078dfc4: vmovss dword ptr [rbp - 0x70], xmm10
0x10078dfc9: vmulps xmm1, xmm9, xmm5
0x10078dfcd: vmulps xmm7, xmm8, xmm4
0x10078dfd1: vinsertps xmm2, xmm7, xmm1, 0x1c
0x10078dfd7: vinsertps xmm3, xmm1, xmm7, 0x4c
0x10078dfdd: vaddps xmm2, xmm2, xmm3
0x10078dfe1: vunpckhps xmm1, xmm7, xmm1
0x10078dfe5: vaddps xmm7, xmm1, xmm2
0x10078dfe9: vextractps dword ptr [rbp - 0x6c], xmm7, 1
0x10078dff0: vmulps xmm1, xmm9, xmm6
0x10078dff4: vmulps xmm2, xmm11, xmm4
0x10078dff8: vinsertps xmm3, xmm2, xmm1, 0x1c
0x10078dffe: vinsertps xmm4, xmm1, xmm2, 0x4c
0x10078e004: vaddps xmm3, xmm3, xmm4
0x10078e008: vunpckhps xmm1, xmm2, xmm1
0x10078e00c: vaddps xmm4, xmm1, xmm3
0x10078e010: vextractps dword ptr [rbp - 0x68], xmm4, 1
0x10078e017: vmovlps qword ptr [rbp - 0x90], xmm0
0x10078e01f: vmovss dword ptr [rbp - 0x60], xmm7
0x10078e024: vmulps xmm0, xmm8, xmm5
0x10078e028: vmulps xmm1, xmm11, xmm6
0x10078e02c: vinsertps xmm2, xmm1, xmm0, 0x1c
0x10078e032: vinsertps xmm3, xmm0, xmm1, 0x4c
0x10078e038: vaddps xmm2, xmm2, xmm3
0x10078e03c: vunpckhps xmm0, xmm1, xmm0
0x10078e040: vaddps xmm15, xmm0, xmm2
0x10078e044: vextractps dword ptr [rbp - 0x5c], xmm15, 1
0x10078e04b: vmulps xmm0, xmm8, xmm6
0x10078e04f: vmovaps xmmword ptr [rbp - 0x30], xmm11
0x10078e054: vmulps xmm1, xmm11, xmm5
0x10078e058: vinsertps xmm2, xmm1, xmm0, 0x1c
0x10078e05e: vinsertps xmm3, xmm0, xmm1, 0x4c
0x10078e064: vaddps xmm2, xmm2, xmm3
0x10078e068: vunpckhps xmm0, xmm1, xmm0
0x10078e06c: vaddps xmm0, xmm0, xmm2
0x10078e070: vextractps dword ptr [rbp - 0x58], xmm0, 1
0x10078e077: vmovss dword ptr [rbp - 0x50], xmm4
0x10078e07c: vmovss dword ptr [rbp - 0x4c], xmm0
0x10078e081: vmovss dword ptr [rbp - 0x48], xmm15
0x10078e086: vmovaps xmm1, xmmword ptr [rsi + 0x30]
0x10078e08b: vsubps xmm11, xmm1, xmmword ptr [rdi + 0x30]
0x10078e090: vmulps xmm1, xmm9, xmm11
0x10078e095: vmovshdup xmm2, xmm1
0x10078e099: vaddss xmm2, xmm1, xmm2
0x10078e09d: vpermilpd xmm1, xmm1, 1
0x10078e0a3: vaddss xmm3, xmm1, xmm2
0x10078e0a7: vmovaps xmm13, xmmword ptr [rip + 0x319861] ; 0x100aa7910
0x10078e0af: vmovaps xmmword ptr [rbp - 0xf0], xmm10
0x10078e0b7: vandps xmm1, xmm10, xmm13
0x10078e0bc: vaddss xmm5, xmm1, dword ptr [rip + 0x319800] ; 0x100aa78c4
0x10078e0c4: vandps xmm1, xmm7, xmm13
0x10078e0c9: vmovaps xmm14, xmmword ptr [rip + 0x34d38f] ; 0x100adb460
0x10078e0d1: vaddps xmm12, xmm1, xmm14
0x10078e0d6: vmovshdup xmm10, xmm12
0x10078e0db: vandps xmm2, xmm4, xmm13
0x10078e0e0: vaddps xmm1, xmm2, xmm14
0x10078e0e5: vmovaps xmmword ptr [rbp - 0x100], xmm1
0x10078e0ed: vmovshdup xmm9, xmm1
0x10078e0f1: vmovss xmm1, dword ptr [rbp - 0x90]
0x10078e0f9: vmovss xmm6, dword ptr [rbp - 0x8c]
0x10078e101: vmovaps xmmword ptr [rbp - 0x140], xmm5
0x10078e109: vmulss xmm2, xmm1, xmm5
0x10078e10d: vmulss xmm5, xmm6, xmm10
0x10078e112: vaddss xmm2, xmm2, xmm5
0x10078e116: vmovss xmm7, dword ptr [rbp - 0x88]
0x10078e11e: vmulss xmm5, xmm7, xmm9
0x10078e123: vaddss xmm2, xmm2, xmm5
0x10078e127: vmovss xmm4, dword ptr [rbp - 0xa0]
0x10078e12f: vmovaps xmm5, xmm4
0x10078e133: vaddss xmm2, xmm4, xmm2
0x10078e137: vmovaps xmmword ptr [rbp - 0x160], xmm3
0x10078e13f: vandps xmm4, xmm3, xmm13
0x10078e144: vucomiss xmm4, xmm2
0x10078e148: ja 0x10078e66f
0x10078e14e: vmulps xmm2, xmm8, xmm11
0x10078e153: vmovshdup xmm4, xmm2
0x10078e157: vaddss xmm4, xmm2, xmm4
0x10078e15b: vpermilpd xmm2, xmm2, 1
0x10078e161: vaddss xmm3, xmm2, xmm4
0x10078e165: vandps xmm0, xmm0, xmm13
0x10078e16a: vaddps xmm8, xmm0, xmm14
0x10078e16f: vandps xmm0, xmm15, xmm13
0x10078e174: vaddps xmm14, xmm0, xmm14
0x10078e179: vmovss xmm13, dword ptr [rbp - 0x9c]
0x10078e181: vmulss xmm0, xmm1, xmm12
0x10078e186: vmovshdup xmm2, xmm14
0x10078e18b: vmovaps xmmword ptr [rbp - 0x130], xmm2
0x10078e193: vmulss xmm2, xmm6, xmm2
0x10078e197: vaddss xmm2, xmm0, xmm2
0x10078e19b: vmovshdup xmm0, xmm8
0x10078e1a0: vmulss xmm4, xmm7, xmm0
0x10078e1a4: vaddss xmm2, xmm2, xmm4
0x10078e1a8: vmovaps xmmword ptr [rbp - 0x150], xmm3
0x10078e1b0: vandps xmm4, xmm3, xmmword ptr [rip + 0x319758] ; 0x100aa7910
0x10078e1b8: vmovaps xmm3, xmm13
0x10078e1bc: vaddss xmm2, xmm13, xmm2
0x10078e1c0: vucomiss xmm4, xmm2
0x10078e1c4: ja 0x10078e66f
0x10078e1ca: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x10078e1d2: vmovaps xmmword ptr [rbp - 0xd0], xmm15
0x10078e1da: vmovaps xmmword ptr [rbp - 0xe0], xmm12
0x10078e1e2: vmulps xmm2, xmm11, xmmword ptr [rbp - 0x30]
0x10078e1e7: vmovshdup xmm4, xmm2
0x10078e1eb: vaddss xmm4, xmm2, xmm4
0x10078e1ef: vpermilpd xmm2, xmm2, 1
0x10078e1f5: vaddss xmm0, xmm2, xmm4
0x10078e1f9: vmovss xmm15, dword ptr [rbp - 0x98]
0x10078e201: vmovaps xmm13, xmmword ptr [rbp - 0x100]
0x10078e209: vmulss xmm2, xmm1, xmm13
0x10078e20e: vmovaps xmmword ptr [rbp - 0x80], xmm6
0x10078e213: vmulss xmm4, xmm6, xmm8
0x10078e218: vaddss xmm2, xmm2, xmm4
0x10078e21c: vmulss xmm4, xmm7, xmm14
0x10078e221: vaddss xmm2, xmm2, xmm4
0x10078e225: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10078e22a: vandps xmm4, xmm0, xmmword ptr [rip + 0x3196de] ; 0x100aa7910
0x10078e232: vaddss xmm2, xmm15, xmm2
0x10078e236: vucomiss xmm4, xmm2
0x10078e23a: ja 0x10078e66f
0x10078e240: vmovaps xmmword ptr [rbp - 0xc0], xmm14
0x10078e248: vmovaps xmmword ptr [rbp - 0xb0], xmm7
0x10078e250: vmovaps xmmword ptr [rbp - 0x40], xmm8
0x10078e255: vmovaps xmm7, xmmword ptr [rbp - 0x140]
0x10078e25d: vmovaps xmm6, xmm5
0x10078e261: vmulss xmm2, xmm6, xmm7
0x10078e265: vmulss xmm4, xmm3, dword ptr [rbp - 0xe0]
0x10078e26d: vaddss xmm2, xmm2, xmm4
0x10078e271: vmulss xmm4, xmm15, xmm13
0x10078e276: vaddss xmm2, xmm2, xmm4
0x10078e27a: vmovaps xmm5, xmmword ptr [rbp - 0xf0]
0x10078e282: vmovaps xmm14, xmmword ptr [rbp - 0x160]
0x10078e28a: vmulss xmm4, xmm5, xmm14
0x10078e28f: vmovss xmm0, dword ptr [rbp - 0x60]
0x10078e294: vmovss xmm8, dword ptr [rbp - 0x50]
0x10078e299: vmovaps xmm12, xmmword ptr [rbp - 0x150]
0x10078e2a1: vmovss dword ptr [rbp - 0x18], xmm0
0x10078e2a6: vmulss xmm0, xmm12, xmm0
0x10078e2aa: vaddss xmm0, xmm4, xmm0
0x10078e2ae: vmovaps xmm11, xmmword ptr [rbp - 0x30]
0x10078e2b3: vmovss dword ptr [rbp - 0x1c], xmm8
0x10078e2b8: vmulss xmm4, xmm11, xmm8
0x10078e2bd: vaddss xmm0, xmm0, xmm4
0x10078e2c1: vandps xmm0, xmm0, xmmword ptr [rip + 0x319647] ; 0x100aa7910
0x10078e2c9: vaddss xmm2, xmm1, xmm2
0x10078e2cd: vucomiss xmm0, xmm2
0x10078e2d1: ja 0x10078e66f
0x10078e2d7: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x10078e2df: vmulss xmm2, xmm6, xmm10
0x10078e2e4: vmovaps xmm7, xmmword ptr [rbp - 0x130]
0x10078e2ec: vmulss xmm4, xmm3, xmm7
0x10078e2f0: vaddss xmm2, xmm2, xmm4
0x10078e2f4: vmulss xmm4, xmm15, dword ptr [rbp - 0x40]
0x10078e2f9: vaddss xmm10, xmm2, xmm4
0x10078e2fd: vmovss xmm1, dword ptr [rbp - 0x6c]
0x10078e302: vmovss xmm0, dword ptr [rbp - 0x5c]
0x10078e307: vmulss xmm4, xmm1, xmm14
0x10078e30c: vmulss xmm2, xmm12, xmm0
0x10078e310: vaddss xmm2, xmm4, xmm2
0x10078e314: vmovss xmm5, dword ptr [rbp - 0x4c]
0x10078e319: vmulss xmm4, xmm11, xmm5
0x10078e31d: vaddss xmm2, xmm2, xmm4
0x10078e321: vandps xmm2, xmm2, xmmword ptr [rip + 0x3195e7] ; 0x100aa7910
0x10078e329: vaddss xmm4, xmm10, dword ptr [rbp - 0x80]
0x10078e32e: vucomiss xmm2, xmm4
0x10078e332: vmovaps xmm8, xmm14
0x10078e337: ja 0x10078e66f
0x10078e33d: vmovaps xmm14, xmm7
0x10078e341: vmovss dword ptr [rbp - 0x14], xmm5
0x10078e346: vmovss dword ptr [rbp - 0x10], xmm0
0x10078e34b: vmulss xmm2, xmm6, xmm9
0x10078e350: vmulss xmm4, xmm3, dword ptr [rbp - 0x120]
0x10078e358: vaddss xmm2, xmm2, xmm4
0x10078e35c: vmulss xmm4, xmm15, dword ptr [rbp - 0xc0]
0x10078e364: vaddss xmm9, xmm2, xmm4
0x10078e368: vmovss xmm5, dword ptr [rbp - 0x68]
0x10078e36d: vmovss xmm7, dword ptr [rbp - 0x58]
0x10078e372: vmulss xmm4, xmm5, xmm8
0x10078e377: vmulss xmm2, xmm12, xmm7
0x10078e37b: vaddss xmm2, xmm4, xmm2
0x10078e37f: vmulss xmm4, xmm11, dword ptr [rbp - 0xd0]
0x10078e387: vaddss xmm2, xmm2, xmm4
0x10078e38b: vandps xmm2, xmm2, xmmword ptr [rip + 0x31957d] ; 0x100aa7910
0x10078e393: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10078e39b: vaddss xmm4, xmm0, xmm9
0x10078e3a0: vucomiss xmm2, xmm4
0x10078e3a4: ja 0x10078e66f
0x10078e3aa: vmovss dword ptr [rbp - 0xc], xmm7
0x10078e3af: vmovss dword ptr [rbp - 8], xmm5
0x10078e3b4: vinsertps xmm2, xmm3, dword ptr [rbp - 0x80], 0x10
0x10078e3bb: vmulps xmm2, xmm2, xmm13
0x10078e3c0: vinsertps xmm9, xmm15, xmm0, 0x10
0x10078e3c6: vmulps xmm4, xmm9, xmmword ptr [rbp - 0xe0]
0x10078e3ce: vaddps xmm2, xmm2, xmm4
0x10078e3d2: vmulss xmm10, xmm11, dword ptr [rbp - 0x18]
0x10078e3d7: vmulss xmm4, xmm12, dword ptr [rbp - 0x1c]
0x10078e3dc: vsubss xmm4, xmm10, xmm4
0x10078e3e0: vandps xmm10, xmm4, xmmword ptr [rip + 0x319528] ; 0x100aa7910
0x10078e3e8: vmovshdup xmm4, xmm2
0x10078e3ec: vaddss xmm2, xmm2, xmm4
0x10078e3f0: vucomiss xmm10, xmm2
0x10078e3f4: ja 0x10078e66f
0x10078e3fa: vmovss dword ptr [rbp - 4], xmm1
0x10078e3ff: vmovaps xmm5, xmmword ptr [rbp - 0x110]
0x10078e407: vinsertps xmm2, xmm3, xmm5, 0x10
0x10078e40d: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10078e412: vblendps xmm4, xmm1, xmm13, 2
0x10078e418: vmulps xmm2, xmm2, xmm4
0x10078e41c: vmovaps xmm4, xmmword ptr [rbp - 0x140]
0x10078e424: vinsertps xmm0, xmm14, xmm4, 0x10
0x10078e42a: vmovaps xmm7, xmm4
0x10078e42e: vmulps xmm4, xmm9, xmm0
0x10078e432: vaddps xmm2, xmm2, xmm4
0x10078e436: vmulss xmm9, xmm11, dword ptr [rbp - 0x10]
0x10078e43b: vmulss xmm4, xmm12, dword ptr [rbp - 0x14]
0x10078e440: vsubss xmm4, xmm9, xmm4
0x10078e444: vandps xmm9, xmm4, xmmword ptr [rip + 0x3194c4] ; 0x100aa7910
0x10078e44c: vmovshdup xmm4, xmm2
0x10078e450: vaddss xmm2, xmm2, xmm4
0x10078e454: vucomiss xmm9, xmm2
0x10078e458: ja 0x10078e66f
0x10078e45e: vmovaps xmm10, xmm11
0x10078e463: vmovaps xmm11, xmmword ptr [rbp - 0xe0]
0x10078e46b: vblendps xmm2, xmm11, xmmword ptr [rbp - 0xc0], 0xd
0x10078e475: vpermilps xmm2, xmm2, 0xe1
0x10078e47b: vmovaps xmm13, xmm3
0x10078e47f: vinsertps xmm4, xmm5, xmm3, 0x10
0x10078e485: vmulps xmm2, xmm2, xmm4
0x10078e489: vmovaps xmm5, xmmword ptr [rbp - 0x80]
0x10078e48e: vinsertps xmm9, xmm5, xmm15, 0x10
0x10078e494: vblendps xmm4, xmm7, xmm1, 2
0x10078e49a: vmulps xmm4, xmm9, xmm4
0x10078e49e: vaddps xmm2, xmm2, xmm4
0x10078e4a2: vmulss xmm10, xmm10, dword ptr [rbp - 0xc]
0x10078e4a7: vmovaps xmm3, xmm12
0x10078e4ab: vmulss xmm4, xmm12, dword ptr [rbp - 0xd0]
0x10078e4b3: vsubss xmm4, xmm10, xmm4
0x10078e4b7: vandps xmm10, xmm4, xmmword ptr [rip + 0x319451] ; 0x100aa7910
0x10078e4bf: vmovshdup xmm4, xmm2
0x10078e4c3: vaddss xmm2, xmm2, xmm4
0x10078e4c7: vucomiss xmm10, xmm2
0x10078e4cb: ja 0x10078e66f
0x10078e4d1: vinsertps xmm10, xmm5, xmm6, 0x10
0x10078e4d7: vmovaps xmm5, xmmword ptr [rbp - 0x120]
0x10078e4df: vinsertps xmm2, xmm5, dword ptr [rbp - 0x100], 0x1c
0x10078e4e9: vmulps xmm2, xmm10, xmm2
0x10078e4ed: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x10078e4f5: vinsertps xmm1, xmm1, xmm15, 0x10
0x10078e4fb: vmulps xmm4, xmm1, xmm0
0x10078e4ff: vaddps xmm2, xmm4, xmm2
0x10078e503: vmulss xmm0, xmm8, dword ptr [rbp - 0x1c]
0x10078e508: vmovaps xmm4, xmmword ptr [rbp - 0x30]
0x10078e50d: vmulss xmm4, xmm4, dword ptr [rbp - 0xf0]
0x10078e515: vsubss xmm4, xmm0, xmm4
0x10078e519: vandps xmm0, xmm4, xmmword ptr [rip + 0x3193ef] ; 0x100aa7910
0x10078e521: vmovshdup xmm4, xmm2
0x10078e525: vaddss xmm2, xmm2, xmm4
0x10078e529: vucomiss xmm0, xmm2
0x10078e52d: ja 0x10078e66f
0x10078e533: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10078e53b: vinsertps xmm15, xmm0, xmm6, 0x10
0x10078e541: vinsertps xmm0, xmm5, dword ptr [rbp - 0x40], 0x1c
0x10078e548: vmulps xmm0, xmm15, xmm0
0x10078e54c: vmulps xmm2, xmm11, xmm1
0x10078e550: vaddps xmm0, xmm2, xmm0
0x10078e554: vmulss xmm2, xmm8, dword ptr [rbp - 0x14]
0x10078e559: vmovaps xmm1, xmmword ptr [rbp - 0x30]
0x10078e55e: vmulss xmm4, xmm1, dword ptr [rbp - 4]
0x10078e563: vsubss xmm2, xmm2, xmm4
0x10078e567: vandps xmm2, xmm2, xmmword ptr [rip + 0x3193a1] ; 0x100aa7910
0x10078e56f: vmovshdup xmm4, xmm0
0x10078e573: vaddss xmm0, xmm0, xmm4
0x10078e577: vucomiss xmm2, xmm0
0x10078e57b: ja 0x10078e66f
0x10078e581: vmovaps xmm5, xmmword ptr [rbp - 0xc0]
0x10078e589: vmovaps xmm0, xmmword ptr [rbp - 0x130]
0x10078e591: vinsertps xmm0, xmm0, xmm5, 0x1c
0x10078e597: vmulps xmm0, xmm0, xmm15
0x10078e59c: vmovaps xmm1, xmm11
0x10078e5a0: vmovaps xmm11, xmmword ptr [rbp - 0x100]
0x10078e5a8: vblendps xmm2, xmm1, xmm11, 2
0x10078e5ae: vmulps xmm2, xmm2, xmm9
0x10078e5b3: vaddps xmm0, xmm2, xmm0
0x10078e5b7: vmulss xmm2, xmm8, dword ptr [rbp - 0xd0]
0x10078e5bf: vmovaps xmm4, xmmword ptr [rbp - 0x30]
0x10078e5c4: vmulss xmm4, xmm4, dword ptr [rbp - 8]
0x10078e5c9: vsubss xmm2, xmm2, xmm4
0x10078e5cd: vandps xmm2, xmm2, xmmword ptr [rip + 0x31933b] ; 0x100aa7910
0x10078e5d5: vmovshdup xmm4, xmm0
0x10078e5d9: vaddss xmm0, xmm0, xmm4
0x10078e5dd: vucomiss xmm2, xmm0
0x10078e5e1: ja 0x10078e66f
0x10078e5e7: vinsertps xmm0, xmm5, xmm1, 0x1c
0x10078e5ed: vmulps xmm2, xmm10, xmm0
0x10078e5f1: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10078e5f9: vinsertps xmm0, xmm0, xmm13, 0x10
0x10078e5ff: vmovaps xmm4, xmmword ptr [rbp - 0x40]
0x10078e604: vinsertps xmm4, xmm4, xmm7, 0x10
0x10078e60a: vmulps xmm4, xmm0, xmm4
0x10078e60e: vaddps xmm2, xmm4, xmm2
0x10078e612: vmulss xmm4, xmm3, dword ptr [rbp - 0xf0]
0x10078e61a: vmulss xmm6, xmm8, dword ptr [rbp - 0x18]
0x10078e61f: vsubss xmm4, xmm4, xmm6
0x10078e623: vandps xmm4, xmm4, xmmword ptr [rip + 0x3192e5] ; 0x100aa7910
0x10078e62b: vmovshdup xmm6, xmm2
0x10078e62f: vaddss xmm2, xmm2, xmm6
0x10078e633: vucomiss xmm4, xmm2
0x10078e637: ja 0x10078e66f
0x10078e639: vmulps xmm2, xmm15, xmm5
0x10078e63d: vblendps xmm1, xmm11, xmm1, 2
0x10078e643: vmulps xmm0, xmm1, xmm0
0x10078e647: vaddps xmm0, xmm0, xmm2
0x10078e64b: vmulss xmm1, xmm3, dword ptr [rbp - 4]
0x10078e650: vmulss xmm2, xmm8, dword ptr [rbp - 0x10]
0x10078e655: vsubss xmm1, xmm1, xmm2
0x10078e659: vandps xmm1, xmm1, xmmword ptr [rip + 0x3192af] ; 0x100aa7910
0x10078e661: vmovshdup xmm2, xmm0
0x10078e665: vaddss xmm0, xmm0, xmm2
0x10078e669: vucomiss xmm1, xmm0
0x10078e66d: jbe 0x10078e67a
0x10078e66f: xor eax, eax
0x10078e671: add rsp, 0xe0
0x10078e678: pop rbp
0x10078e679: ret 
0x10078e67a: vmulps xmm0, xmm15, xmmword ptr [rbp - 0x40]
0x10078e67f: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x10078e684: vinsertps xmm1, xmm1, xmm13, 0x10
0x10078e68a: vmulps xmm1, xmm11, xmm1
0x10078e68e: vaddps xmm0, xmm1, xmm0
0x10078e692: vmulss xmm1, xmm3, dword ptr [rbp - 8]
0x10078e697: vmulss xmm2, xmm8, dword ptr [rbp - 0xc]
0x10078e69c: vsubss xmm1, xmm1, xmm2
0x10078e6a0: vandps xmm1, xmm1, xmmword ptr [rip + 0x319268] ; 0x100aa7910
0x10078e6a8: vmovshdup xmm2, xmm0
0x10078e6ac: vaddss xmm0, xmm0, xmm2
0x10078e6b0: vucomiss xmm1, xmm0
0x10078e6b4: setbe al
0x10078e6b7: jmp 0x10078e671 ; 0x10078e671
0x10078e6b9: nop dword ptr [rax]
