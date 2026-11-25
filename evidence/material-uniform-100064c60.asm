0x100064c60: push rbp
0x100064c61: mov rbp, rsp
0x100064c64: push r14
0x100064c66: push rbx
0x100064c67: sub rsp, 0x80
0x100064c6e: mov rbx, rsi
0x100064c71: mov r14, rdi
0x100064c74: vmovaps xmm1, xmmword ptr [rbx + 0x97080]
0x100064c7c: vmovaps xmm0, xmmword ptr [rdx]
0x100064c80: vsubps xmm2, xmm1, xmm0
0x100064c84: vmulps xmm2, xmm2, xmm2
0x100064c88: vmovshdup xmm3, xmm2
0x100064c8c: vaddss xmm3, xmm2, xmm3
0x100064c90: vpermilpd xmm2, xmm2, 1
0x100064c96: vaddss xmm2, xmm2, xmm3
0x100064c9a: vsqrtss xmm2, xmm2, xmm2
0x100064c9e: vpermilps xmm3, xmm1, 0xe7
0x100064ca4: vmulss xmm2, xmm2, xmm2
0x100064ca8: vmulss xmm4, xmm3, xmm3
0x100064cac: vsubss xmm2, xmm2, xmm4
0x100064cb0: vxorps xmm4, xmm4, xmm4
0x100064cb4: vmaxss xmm4, xmm4, xmm2
0x100064cb8: vxorps xmm6, xmm6, xmm6
0x100064cbc: vcmpunordss xmm2, xmm2, xmm2
0x100064cc1: vandnps xmm2, xmm2, xmm4
0x100064cc5: vsqrtss xmm2, xmm2, xmm2
0x100064cc9: vmovss xmm4, dword ptr [rip + 0xa4393b] ; 0x100aa860c
0x100064cd1: vmaxss xmm5, xmm4, xmm2
0x100064cd5: vcmpunordss xmm2, xmm2, xmm2
0x100064cda: vandnps xmm5, xmm2, xmm5
0x100064cde: vandps xmm2, xmm2, xmm4
0x100064ce2: vorps xmm2, xmm5, xmm2
0x100064ce6: vmovaps xmm5, xmmword ptr [rcx]
0x100064cea: vmovaps xmmword ptr [rbp - 0x70], xmm5
0x100064cef: vmulps xmm4, xmm5, xmmword ptr [rip + 0xa432b9] ; 0x100aa7fb0
0x100064cf7: vaddps xmm4, xmm0, xmm4
0x100064cfb: vpermilps xmm2, xmm2, 0xc0
0x100064d01: vmulps xmm2, xmm2, xmm5
0x100064d05: vaddps xmm2, xmm0, xmm2
0x100064d09: vsubps xmm1, xmm2, xmm1
0x100064d0d: vmulps xmm1, xmm1, xmm1
0x100064d11: vmovshdup xmm2, xmm1
0x100064d15: vaddss xmm2, xmm1, xmm2
0x100064d19: vpermilpd xmm1, xmm1, 1
0x100064d1f: vaddss xmm1, xmm1, xmm2
0x100064d23: vsqrtss xmm1, xmm1, xmm1
0x100064d27: vsubss xmm1, xmm1, xmm3
0x100064d2b: vinsertps xmm1, xmm4, xmm1, 0x10
0x100064d31: vsubps xmm1, xmm1, xmm0
0x100064d35: vmovshdup xmm3, xmm0
0x100064d39: vmovaps xmmword ptr [rbp - 0x20], xmm3
0x100064d3e: vmulps xmm0, xmm1, xmm1
0x100064d42: vmovshdup xmm2, xmm0
0x100064d46: vaddss xmm2, xmm0, xmm2
0x100064d4a: vpermilpd xmm0, xmm0, 1
0x100064d50: vaddss xmm0, xmm0, xmm2
0x100064d54: vsqrtss xmm2, xmm0, xmm0
0x100064d58: vmovss dword ptr [rbp - 0x40], xmm2
0x100064d5d: vmovshdup xmm0, xmm1
0x100064d61: vdivss xmm0, xmm0, xmm2
0x100064d65: xor eax, eax
0x100064d67: vucomiss xmm6, xmm0
0x100064d6b: seta al
0x100064d6e: vandps xmm1, xmm0, xmmword ptr [rip + 0xa42b9a] ; 0x100aa7910
0x100064d76: vcmpltss xmm1, xmm1, dword ptr [rip + 0xa42a69] ; 0x100aa77e8
0x100064d7f: lea rcx, [rip + 0xa43942] ; 0x100aa86c8
0x100064d86: vmovss xmm2, dword ptr [rcx + rax*4]
0x100064d8b: vblendvps xmm0, xmm0, xmm2, xmm1
0x100064d91: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100064d96: vmovss xmm0, dword ptr [rip + 0xa43872] ; 0x100aa8610
0x100064d9e: vmulss xmm0, xmm0, dword ptr [rbx + 0xb0]
0x100064da6: vmovss dword ptr [rbp - 0x60], xmm0
0x100064dab: vmulss xmm0, xmm3, dword ptr [rip + 0xa43861] ; 0x100aa8614
0x100064db3: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064db8: vmovss dword ptr [rbp - 0x50], xmm0
0x100064dbd: vmovss xmm0, dword ptr [rbp - 0x40]
0x100064dc2: vmulss xmm0, xmm0, dword ptr [rbp - 0x30]
0x100064dc7: vaddss xmm0, xmm0, dword ptr [rbp - 0x20]
0x100064dcc: vmovss dword ptr [rbp - 0x90], xmm0
0x100064dd4: vmulss xmm0, xmm0, dword ptr [rip + 0xa43838] ; 0x100aa8614
0x100064ddc: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064de1: vmovss xmm1, dword ptr [rbp - 0x50]
0x100064de6: vsubss xmm0, xmm1, xmm0
0x100064dea: vmulss xmm0, xmm0, dword ptr [rbp - 0x60]
0x100064def: vmovss xmm1, dword ptr [rip + 0xa43821] ; 0x100aa8618
0x100064df7: vmulss xmm2, xmm1, dword ptr [rbp - 0x30]
0x100064dfc: vdivss xmm0, xmm0, xmm2
0x100064e00: vxorps xmm2, xmm2, xmm2
0x100064e04: vmaxss xmm0, xmm2, xmm0
0x100064e08: vmovss xmm2, dword ptr [rip + 0xa4380c] ; 0x100aa861c
0x100064e10: vminss xmm0, xmm2, xmm0
0x100064e14: vmovss dword ptr [rbp - 0x40], xmm0
0x100064e19: vmovss xmm0, dword ptr [rip + 0xa437ef] ; 0x100aa8610
0x100064e21: vmulss xmm0, xmm0, dword ptr [rbx + 0x1f4]
0x100064e29: vmovss dword ptr [rbp - 0x60], xmm0
0x100064e2e: vdivss xmm0, xmm1, dword ptr [rbx + 0x1f8]
0x100064e36: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100064e3b: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42abd] ; 0x100aa7900
0x100064e43: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100064e48: vmulss xmm0, xmm0, dword ptr [rbp - 0x20]
0x100064e4d: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064e52: vmovss dword ptr [rbp - 0x20], xmm0
0x100064e57: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x100064e5c: vmulss xmm0, xmm0, dword ptr [rbp - 0x90]
0x100064e64: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064e69: vmovss xmm1, dword ptr [rbp - 0x20]
0x100064e6e: vsubss xmm0, xmm1, xmm0
0x100064e72: vmulss xmm0, xmm0, dword ptr [rbp - 0x60]
0x100064e77: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x100064e7c: vmulss xmm1, xmm1, dword ptr [rbp - 0x30]
0x100064e81: vdivss xmm0, xmm0, xmm1
0x100064e85: vxorps xmm1, xmm1, xmm1
0x100064e89: vmaxss xmm0, xmm1, xmm0
0x100064e8d: vmovss xmm1, dword ptr [rip + 0xa43787] ; 0x100aa861c
0x100064e95: vminss xmm0, xmm1, xmm0
0x100064e99: vmovss dword ptr [rbp - 0x20], xmm0
0x100064e9e: vmovaps xmm0, xmmword ptr [rip + 0xa42a5a] ; 0x100aa7900
0x100064ea6: vxorps xmm0, xmm0, xmmword ptr [rbx + 0x290]
0x100064eae: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x70]
0x100064eb3: vmovshdup xmm1, xmm0
0x100064eb7: vaddss xmm1, xmm0, xmm1
0x100064ebb: vpermilpd xmm0, xmm0, 1
0x100064ec1: vaddss xmm1, xmm0, xmm1
0x100064ec5: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x100064eca: vmulss xmm0, xmm1, xmm1
0x100064ece: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100064ed3: vinsertps xmm0, xmm1, xmm0, 0x10
0x100064ed9: vcvtps2pd xmm0, xmm0
0x100064edd: vmulpd xmm0, xmm0, xmmword ptr [rip + 0xa4328b] ; 0x100aa8170
0x100064ee5: vpermilpd xmm1, xmm0, 1
0x100064eeb: vaddsd xmm0, xmm0, xmm1
0x100064eef: vaddsd xmm0, xmm0, qword ptr [rip + 0xa437d9] ; 0x100aa86d0
0x100064ef7: vcvtsd2ss xmm0, xmm0, xmm0
0x100064efb: vmovss dword ptr [rbp - 0x30], xmm0
0x100064f00: vmovss xmm0, dword ptr [rbp - 0x40]
0x100064f05: vmulss xmm0, xmm0, dword ptr [rip + 0xa43753] ; 0x100aa8660
0x100064f0d: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064f12: vmovss xmm1, dword ptr [rip + 0xa401a6] ; 0x100aa50c0
0x100064f1a: vsubss xmm0, xmm1, xmm0
0x100064f1e: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100064f26: vaddss xmm0, xmm1, dword ptr [rbp - 0x70]
0x100064f2b: vmovss dword ptr [rbp - 0x50], xmm0
0x100064f30: vmovss xmm0, dword ptr [rbp - 0x30]
0x100064f35: vmulss xmm0, xmm0, dword ptr [rbp - 0x40]
0x100064f3a: vmulss xmm0, xmm0, dword ptr [rbx + 0xc70]
0x100064f42: vmulss xmm0, xmm0, dword ptr [rip + 0xa43756] ; 0x100aa86a0
0x100064f4a: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100064f4f: vmovss xmm3, dword ptr [rip + 0xa40169] ; 0x100aa50c0
0x100064f57: vminss xmm0, xmm3, xmm0
0x100064f5b: vmulss xmm0, xmm0, dword ptr [rip + 0xa436d5] ; 0x100aa8638
0x100064f63: vroundss xmm1, xmm0, xmm0, 9
0x100064f69: vcvttss2si rax, xmm1
0x100064f6e: mov ecx, eax
0x100064f70: vcvtsi2ss xmm1, xmm6, rcx
0x100064f75: vsubss xmm0, xmm0, xmm1
0x100064f79: cmp eax, 0x3f
0x100064f7c: mov ecx, 0x3f
0x100064f81: mov edx, 0x3f
0x100064f86: cmovb edx, eax
0x100064f89: shl rdx, 4
0x100064f8d: inc eax
0x100064f8f: cmp eax, 0x3f
0x100064f92: cmovae eax, ecx
0x100064f95: shl rax, 4
0x100064f99: vmovaps xmm1, xmmword ptr [rbx + rax + 0x4c80]
0x100064fa2: vmovaps xmm2, xmmword ptr [rbx + rdx + 0x4c80]
0x100064fab: vsubps xmm1, xmm1, xmm2
0x100064faf: vpermilps xmm0, xmm0, 0xc0
0x100064fb5: vmulps xmm0, xmm1, xmm0
0x100064fb9: vaddps xmm0, xmm2, xmm0
0x100064fbd: vinsertps xmm0, xmm0, xmm3, 0x30
0x100064fc3: vmovaps xmm1, xmmword ptr [rbx + 0xc60]
0x100064fcb: vmovaps xmmword ptr [rbp - 0x80], xmm1
0x100064fd0: vmulps xmm0, xmm1, xmm0
0x100064fd4: vmovss xmm1, dword ptr [rbp - 0x50]
0x100064fd9: vmulss xmm1, xmm1, dword ptr [rbp - 0x40]
0x100064fde: vmulss xmm1, xmm1, dword ptr [rbp - 0x30]
0x100064fe3: vpermilps xmm1, xmm1, 0xc0
0x100064fe9: vmulps xmm0, xmm1, xmm0
0x100064fed: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100064ff2: vmovss xmm0, dword ptr [rbp - 0x20]
0x100064ff7: vmulss xmm0, xmm0, dword ptr [rip + 0xa436a5] ; 0x100aa86a4
0x100064fff: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100065004: vmovss xmm5, dword ptr [rip + 0xa400b4] ; 0x100aa50c0
0x10006500c: vsubss xmm0, xmm5, xmm0
0x100065010: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x100065015: vaddss xmm1, xmm3, dword ptr [rip + 0xa400a7] ; 0x100aa50c4
0x10006501d: vmovss xmm2, dword ptr [rip + 0xa43683] ; 0x100aa86a8
0x100065025: vsubss xmm1, xmm2, xmm1
0x100065029: vdivss xmm1, xmm2, xmm1
0x10006502d: vmovss xmm2, dword ptr [rbp - 0x20]
0x100065032: vmulss xmm2, xmm2, dword ptr [rip + 0xa43672] ; 0x100aa86ac
0x10006503a: vmulss xmm1, xmm2, xmm1
0x10006503e: vmulss xmm2, xmm3, dword ptr [rbp - 0x70]
0x100065043: vxorps xmm6, xmm6, xmm6
0x100065047: vmaxss xmm2, xmm2, xmm6
0x10006504b: vmovaps xmm3, xmmword ptr [rbx + 0x20]
0x100065050: vpermilps xmm2, xmm2, 0xc0
0x100065056: vmulps xmm2, xmm3, xmm2
0x10006505a: vblendps xmm2, xmm2, xmm3, 8
0x100065060: vmovaps xmm3, xmmword ptr [rbx + 0xc30]
0x100065068: vaddps xmm2, xmm3, xmm2
0x10006506c: vsubss xmm4, xmm5, xmm0
0x100065070: vmovaps xmm7, xmm5
0x100065074: vmulss xmm1, xmm4, xmm1
0x100065078: vmulss xmm5, xmm0, dword ptr [rbp - 0x30]
0x10006507d: vaddss xmm1, xmm1, xmm5
0x100065081: vpermilps xmm1, xmm1, 0xc0
0x100065087: vmulps xmm1, xmm1, xmm2
0x10006508b: vblendps xmm1, xmm1, xmm3, 8
0x100065091: vmovaps xmm5, xmmword ptr [rbp - 0x90]
0x100065099: vpermilps xmm2, xmm5, 0xc0
0x10006509f: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x40]
0x1000650a4: vblendps xmm2, xmm2, xmmword ptr [rbp - 0x80], 8
0x1000650ab: vmaxss xmm3, xmm6, xmm0
0x1000650af: vminss xmm3, xmm7, xmm3
0x1000650b3: vsubps xmm1, xmm1, xmm2
0x1000650b7: vpermilps xmm3, xmm3, 0
0x1000650bd: vmulps xmm1, xmm3, xmm1
0x1000650c1: vaddps xmm1, xmm2, xmm1
0x1000650c5: vmulss xmm2, xmm5, xmm4
0x1000650c9: vaddss xmm0, xmm0, xmm2
0x1000650cd: vmulps xmm1, xmm1, xmmword ptr [rip + 0xa4259b] ; 0x100aa7670
0x1000650d5: vinsertps xmm0, xmm1, xmm0, 0x30
0x1000650db: vmovaps xmmword ptr [r14], xmm0
0x1000650e0: mov rax, r14
0x1000650e3: add rsp, 0x80
0x1000650ea: pop rbx
0x1000650eb: pop r14
0x1000650ed: pop rbp
0x1000650ee: ret 
0x1000650ef: nop 
