0x100076940: push rbp
0x100076941: mov rbp, rsp
0x100076944: sub rsp, 0x140
0x10007694b: vmovaps xmm3, xmmword ptr [rsi]
0x10007694f: vmovaps xmm10, xmmword ptr [rsi + 0x10]
0x100076954: vmovaps xmm8, xmmword ptr [rsi + 0x20]
0x100076959: vmovaps xmm2, xmmword ptr [rsi + 0x30]
0x10007695e: vmovshdup xmm4, xmm3
0x100076962: vpermilpd xmm13, xmm3, 1
0x100076968: vmovshdup xmm12, xmm10
0x10007696d: vpermilpd xmm14, xmm10, 1
0x100076973: vmovshdup xmm1, xmm8
0x100076978: vpermilpd xmm0, xmm8, 1
0x10007697e: vmovshdup xmm15, xmm2
0x100076982: vpermilpd xmm5, xmm2, 1
0x100076988: vmovapd xmmword ptr [rbp - 0xc0], xmm0
0x100076990: vmovaps xmmword ptr [rbp - 0x60], xmm4
0x100076995: vmulss xmm0, xmm4, xmm0
0x100076999: vmulss xmm4, xmm13, xmm1
0x10007699d: vsubss xmm7, xmm0, xmm4
0x1000769a1: vmovapd xmmword ptr [rbp - 0xd0], xmm5
0x1000769a9: vmulss xmm0, xmm12, xmm5
0x1000769ad: vmulss xmm4, xmm14, xmm15
0x1000769b2: vsubss xmm6, xmm0, xmm4
0x1000769b6: vshufps xmm0, xmm10, xmm3, 0xff
0x1000769bb: vpermilps xmm0, xmm0, 0xd8
0x1000769c1: vshufps xmm4, xmm2, xmm8, 0x99
0x1000769c7: vpermilps xmm4, xmm4, 0xd8
0x1000769cd: vmulps xmm0, xmm0, xmm4
0x1000769d1: vshufps xmm4, xmm10, xmm3, 0x99
0x1000769d6: vpermilps xmm4, xmm4, 0xd8
0x1000769dc: vshufps xmm5, xmm2, xmm8, 0xff
0x1000769e2: vpermilps xmm5, xmm5, 0xd8
0x1000769e8: vmulps xmm4, xmm4, xmm5
0x1000769ec: vsubps xmm11, xmm0, xmm4
0x1000769f0: vpermilps xmm4, xmm8, 0xe7
0x1000769f6: vpermilpd xmm0, xmm11, 1
0x1000769fc: vmovapd xmmword ptr [rbp - 0x40], xmm0
0x100076a01: vmovaps xmm9, xmm1
0x100076a05: vmulss xmm0, xmm1, xmm0
0x100076a09: vmovaps xmmword ptr [rbp - 0x90], xmm4
0x100076a11: vmulss xmm4, xmm4, xmm6
0x100076a15: vsubss xmm0, xmm0, xmm4
0x100076a19: vpermilps xmm5, xmm2, 0xe7
0x100076a1f: vpermilps xmm4, xmm11, 0xe7
0x100076a25: vmovaps xmmword ptr [rbp - 0x50], xmm4
0x100076a2a: vmulss xmm4, xmm15, xmm4
0x100076a2e: vmovaps xmmword ptr [rbp - 0x80], xmm5
0x100076a33: vmulss xmm5, xmm5, xmm7
0x100076a37: vsubss xmm5, xmm4, xmm5
0x100076a3b: vpermilps xmm4, xmm3, 0xe7
0x100076a41: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x100076a46: vmovss dword ptr [rbp - 4], xmm6
0x100076a4b: vmulss xmm4, xmm4, xmm6
0x100076a4f: vmovaps xmmword ptr [rbp - 0xb0], xmm13
0x100076a57: vmulss xmm6, xmm13, xmm11
0x100076a5c: vaddss xmm6, xmm4, xmm6
0x100076a60: vpermilps xmm4, xmm10, 0xe7
0x100076a66: vmovaps xmmword ptr [rbp - 0xa0], xmm4
0x100076a6e: vmovss dword ptr [rbp - 0x30], xmm7
0x100076a73: vmulss xmm7, xmm4, xmm7
0x100076a77: vmovshdup xmm4, xmm11
0x100076a7c: vmovaps xmmword ptr [rbp - 0x120], xmm4
0x100076a84: vmovaps xmmword ptr [rbp - 0xe0], xmm14
0x100076a8c: vmulss xmm4, xmm14, xmm4
0x100076a90: vaddss xmm4, xmm7, xmm4
0x100076a94: vinsertps xmm0, xmm0, xmm5, 0x10
0x100076a9a: vinsertps xmm0, xmm0, xmm6, 0x20
0x100076aa0: vinsertps xmm0, xmm0, xmm4, 0x30
0x100076aa6: vunpckhps xmm4, xmm8, xmm2
0x100076aaa: vinsertps xmm4, xmm4, xmm3, 0x68
0x100076ab0: vinsertps xmm4, xmm4, xmm10, 0x70
0x100076ab6: vmulps xmm4, xmm4, xmm11
0x100076abb: vsubps xmm0, xmm0, xmm4
0x100076abf: vmovshdup xmm4, xmm0
0x100076ac3: vmulss xmm4, xmm10, xmm4
0x100076ac7: vmulss xmm5, xmm3, xmm0
0x100076acb: vaddss xmm4, xmm4, xmm5
0x100076acf: vpermilpd xmm5, xmm0, 1
0x100076ad5: vmulss xmm5, xmm8, xmm5
0x100076ad9: vaddss xmm4, xmm5, xmm4
0x100076add: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x100076ae5: vpermilps xmm5, xmm0, 0xe7
0x100076aeb: vmulss xmm5, xmm2, xmm5
0x100076aef: vaddss xmm4, xmm5, xmm4
0x100076af3: vmovss xmm5, dword ptr [rip + 0xa2e5c5] ; 0x100aa50c0
0x100076afb: vdivss xmm0, xmm5, xmm4
0x100076aff: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x100076b07: vucomiss xmm0, xmm0
0x100076b0b: jp 0x100076dc6
0x100076b11: vmulss xmm4, xmm8, dword ptr [rbp - 0x60]
0x100076b16: vmulss xmm5, xmm3, xmm9
0x100076b1b: vsubss xmm5, xmm4, xmm5
0x100076b1f: vmulss xmm4, xmm12, xmm2
0x100076b23: vmulss xmm6, xmm10, xmm15
0x100076b28: vmovaps xmmword ptr [rbp - 0x110], xmm12
0x100076b30: vsubss xmm12, xmm4, xmm6
0x100076b34: vmovaps xmm14, xmmword ptr [rbp - 0x70]
0x100076b39: vmulss xmm4, xmm14, xmm8
0x100076b3e: vmovaps xmm7, xmmword ptr [rbp - 0x90]
0x100076b46: vmulss xmm6, xmm3, xmm7
0x100076b4a: vsubss xmm0, xmm4, xmm6
0x100076b4e: vmovss dword ptr [rbp - 0xc], xmm0
0x100076b53: vmulss xmm4, xmm2, dword ptr [rbp - 0xa0]
0x100076b5b: vmovaps xmm13, xmmword ptr [rbp - 0x80]
0x100076b60: vmulss xmm6, xmm10, xmm13
0x100076b65: vmovaps xmmword ptr [rbp - 0xf0], xmm9
0x100076b6d: vmovaps xmmword ptr [rbp - 0x100], xmm15
0x100076b75: vsubss xmm15, xmm4, xmm6
0x100076b79: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100076b7e: vmulss xmm1, xmm8, xmm0
0x100076b82: vmovss dword ptr [rbp - 0x20], xmm1
0x100076b87: vmulss xmm0, xmm3, xmm0
0x100076b8b: vmovss dword ptr [rbp - 0x40], xmm0
0x100076b90: vmovss xmm0, dword ptr [rbp - 4]
0x100076b95: vmulss xmm1, xmm8, xmm0
0x100076b99: vmovss dword ptr [rbp - 0x14], xmm1
0x100076b9e: vmulss xmm0, xmm3, xmm0
0x100076ba2: vmovss dword ptr [rbp - 0x1c], xmm0
0x100076ba7: vmulss xmm0, xmm8, xmm11
0x100076bac: vmulss xmm1, xmm3, xmm11
0x100076bb1: vmovss dword ptr [rbp - 8], xmm1
0x100076bb6: vmulss xmm4, xmm8, dword ptr [rbp - 0xb0]
0x100076bbe: vmulss xmm3, xmm3, dword ptr [rbp - 0xc0]
0x100076bc6: vsubss xmm11, xmm4, xmm3
0x100076bca: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x100076bcf: vmulss xmm1, xmm2, xmm4
0x100076bd3: vmovss dword ptr [rbp - 4], xmm1
0x100076bd8: vmulss xmm1, xmm10, xmm4
0x100076bdc: vmovss dword ptr [rbp - 0x50], xmm1
0x100076be1: vmovss xmm4, dword ptr [rbp - 0x30]
0x100076be6: vmulss xmm1, xmm2, xmm4
0x100076bea: vmovss dword ptr [rbp - 0x10], xmm1
0x100076bef: vmulss xmm1, xmm10, xmm4
0x100076bf3: vmovss dword ptr [rbp - 0x18], xmm1
0x100076bf8: vmovaps xmm1, xmmword ptr [rbp - 0x120]
0x100076c00: vmulss xmm4, xmm2, xmm1
0x100076c04: vmulss xmm1, xmm10, xmm1
0x100076c08: vmovss dword ptr [rbp - 0x30], xmm1
0x100076c0d: vmulss xmm2, xmm2, dword ptr [rbp - 0xe0]
0x100076c15: vmulss xmm1, xmm10, dword ptr [rbp - 0xd0]
0x100076c1d: vsubss xmm10, xmm2, xmm1
0x100076c21: vmulss xmm2, xmm7, xmm12
0x100076c26: vmulss xmm8, xmm9, xmm15
0x100076c2b: vsubss xmm2, xmm2, xmm8
0x100076c30: vaddss xmm2, xmm0, xmm2
0x100076c34: vmulss xmm7, xmm13, xmm5
0x100076c38: vmovss xmm8, dword ptr [rbp - 0xc]
0x100076c3d: vmovaps xmm1, xmmword ptr [rbp - 0x100]
0x100076c45: vmulss xmm6, xmm1, xmm8
0x100076c4a: vsubss xmm6, xmm7, xmm6
0x100076c4e: vaddss xmm6, xmm4, xmm6
0x100076c52: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x100076c57: vmulss xmm7, xmm3, xmm15
0x100076c5c: vmulss xmm4, xmm14, xmm12
0x100076c61: vsubss xmm4, xmm7, xmm4
0x100076c65: vsubss xmm4, xmm4, dword ptr [rbp - 8]
0x100076c6a: vmovaps xmm9, xmmword ptr [rbp - 0x110]
0x100076c72: vmulss xmm7, xmm9, xmm8
0x100076c77: vmovaps xmm14, xmm8
0x100076c7c: vmovaps xmm13, xmmword ptr [rbp - 0xa0]
0x100076c84: vmulss xmm0, xmm13, xmm5
0x100076c88: vsubss xmm0, xmm7, xmm0
0x100076c8c: vsubss xmm0, xmm0, dword ptr [rbp - 0x30]
0x100076c91: vinsertps xmm2, xmm2, xmm6, 0x10
0x100076c97: vinsertps xmm2, xmm2, xmm4, 0x20
0x100076c9d: vinsertps xmm0, xmm2, xmm0, 0x30
0x100076ca3: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100076ca8: vmulss xmm0, xmm10, dword ptr [rbp - 0xf0]
0x100076cb0: vmovaps xmm2, xmmword ptr [rbp - 0xc0]
0x100076cb8: vmulss xmm4, xmm2, xmm12
0x100076cbd: vsubss xmm0, xmm0, xmm4
0x100076cc1: vaddss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100076cc6: vmulss xmm4, xmm1, xmm11
0x100076ccb: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x100076cd3: vmulss xmm6, xmm1, xmm5
0x100076cd7: vsubss xmm4, xmm4, xmm6
0x100076cdb: vaddss xmm4, xmm4, dword ptr [rbp - 0x10]
0x100076ce0: vmovaps xmm8, xmmword ptr [rbp - 0xb0]
0x100076ce8: vmulss xmm6, xmm8, xmm12
0x100076ced: vmulss xmm7, xmm3, xmm10
0x100076cf2: vsubss xmm6, xmm6, xmm7
0x100076cf6: vsubss xmm6, xmm6, dword ptr [rbp - 0x1c]
0x100076cfb: vmovaps xmm12, xmmword ptr [rbp - 0xe0]
0x100076d03: vmulss xmm5, xmm12, xmm5
0x100076d07: vmulss xmm7, xmm9, xmm11
0x100076d0c: vsubss xmm5, xmm5, xmm7
0x100076d10: vsubss xmm5, xmm5, dword ptr [rbp - 0x18]
0x100076d15: vinsertps xmm0, xmm0, xmm4, 0x10
0x100076d1b: vinsertps xmm0, xmm0, xmm6, 0x20
0x100076d21: vinsertps xmm0, xmm0, xmm5, 0x30
0x100076d27: vmulss xmm4, xmm2, xmm15
0x100076d2c: vmulss xmm5, xmm10, dword ptr [rbp - 0x90]
0x100076d34: vsubss xmm4, xmm4, xmm5
0x100076d38: vsubss xmm4, xmm4, dword ptr [rbp - 0x20]
0x100076d3d: vmulss xmm5, xmm1, xmm14
0x100076d42: vmulss xmm6, xmm11, dword ptr [rbp - 0x80]
0x100076d47: vsubss xmm5, xmm5, xmm6
0x100076d4b: vsubss xmm5, xmm5, dword ptr [rbp - 4]
0x100076d50: vmulss xmm1, xmm10, dword ptr [rbp - 0x70]
0x100076d55: vmulss xmm6, xmm8, xmm15
0x100076d5a: vsubss xmm1, xmm1, xmm6
0x100076d5e: vaddss xmm1, xmm1, dword ptr [rbp - 0x40]
0x100076d63: vmulss xmm3, xmm13, xmm11
0x100076d68: vmulss xmm6, xmm12, xmm14
0x100076d6d: vsubss xmm3, xmm3, xmm6
0x100076d71: vaddss xmm3, xmm3, dword ptr [rbp - 0x50]
0x100076d76: vinsertps xmm4, xmm4, xmm5, 0x10
0x100076d7c: vinsertps xmm1, xmm4, xmm1, 0x20
0x100076d82: vinsertps xmm1, xmm1, xmm3, 0x30
0x100076d88: vpermilps xmm3, xmmword ptr [rbp - 0x130], 0
0x100076d92: vmulps xmm4, xmm3, xmmword ptr [rbp - 0x140]
0x100076d9a: vmulps xmm1, xmm1, xmm3
0x100076d9e: vmulps xmm2, xmm3, xmmword ptr [rbp - 0x30]
0x100076da3: vmulps xmm0, xmm0, xmm3
0x100076da7: vmovaps xmmword ptr [rdi], xmm4
0x100076dab: vmovaps xmmword ptr [rdi + 0x10], xmm1
0x100076db0: vmovaps xmmword ptr [rdi + 0x20], xmm2
0x100076db5: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x100076dba: mov rax, rdi
0x100076dbd: add rsp, 0x140
0x100076dc4: pop rbp
0x100076dc5: ret 
0x100076dc6: lea rdi, [rip + 0xaedd3d] ; 0x100b64b0a inverse
0x100076dcd: lea rsi, [rip + 0xaedd3e] ; 0x100b64b12 ../../../Code/3rdParty/Vectormath/simd/mat_aos.h
0x100076dd4: lea rcx, [rip + 0xaedd68] ; 0x100b64b43 !isnan(detInv) && "Invalid matrix, cannot inverse it!"
0x100076ddb: mov edx, 0x247
0x100076de0: call 0x100aa24a4 ; 0x100aa24a4 ___assert_rtn
0x100076de5: nop word ptr cs:[rax + rax]
