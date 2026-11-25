0x100111b90: push rbp
0x100111b91: mov rbp, rsp
0x100111b94: push rbx
0x100111b95: sub rsp, 0x48
0x100111b99: mov rbx, rdi
0x100111b9c: vmovaps xmm6, xmmword ptr [rsi]
0x100111ba0: vmulps xmm1, xmm6, xmm6
0x100111ba4: vmovshdup xmm2, xmm1
0x100111ba8: vaddss xmm2, xmm1, xmm2
0x100111bac: vpermilpd xmm1, xmm1, 1
0x100111bb2: vaddss xmm1, xmm1, xmm2
0x100111bb6: vsqrtss xmm1, xmm1, xmm1
0x100111bba: vucomiss xmm1, dword ptr [rip + 0x995d02] ; 0x100aa78c4
0x100111bc2: jbe 0x100111bce
0x100111bc4: vpermilps xmm1, xmm1, 0xc0
0x100111bca: vdivps xmm6, xmm6, xmm1
0x100111bce: vmovaps xmm7, xmmword ptr [rdx]
0x100111bd2: vmulps xmm1, xmm7, xmm7
0x100111bd6: vmovshdup xmm2, xmm1
0x100111bda: vaddss xmm2, xmm1, xmm2
0x100111bde: vpermilpd xmm1, xmm1, 1
0x100111be4: vaddss xmm1, xmm1, xmm2
0x100111be8: vsqrtss xmm1, xmm1, xmm1
0x100111bec: vucomiss xmm1, dword ptr [rip + 0x995cd0] ; 0x100aa78c4
0x100111bf4: jbe 0x100111c00
0x100111bf6: vpermilps xmm1, xmm1, 0xc0
0x100111bfc: vdivps xmm7, xmm7, xmm1
0x100111c00: vmulps xmm1, xmm6, xmm7
0x100111c04: vmovshdup xmm2, xmm1
0x100111c08: vaddss xmm2, xmm1, xmm2
0x100111c0c: vpermilpd xmm1, xmm1, 1
0x100111c12: vaddss xmm1, xmm1, xmm2
0x100111c16: vmovss xmm2, dword ptr [rip + 0x999112] ; 0x100aaad30
0x100111c1e: vucomiss xmm2, xmm1
0x100111c22: jbe 0x100111d89
0x100111c28: vxorps xmm1, xmm1, xmm1
0x100111c2c: vucomiss xmm0, xmm1
0x100111c30: jne 0x100111c38
0x100111c32: jnp 0x100111ebc
0x100111c38: vucomiss xmm0, dword ptr [rip + 0x993480] ; 0x100aa50c0
0x100111c40: jne 0x100111c4d
0x100111c42: jp 0x100111c4d
0x100111c44: vmovaps xmm6, xmm7
0x100111c48: jmp 0x100111ebc ; 0x100111ebc
0x100111c4d: vmovaps xmm1, xmmword ptr [rcx]
0x100111c51: vmulps xmm2, xmm1, xmm1
0x100111c55: vmovshdup xmm3, xmm2
0x100111c59: vaddss xmm3, xmm2, xmm3
0x100111c5d: vpermilpd xmm2, xmm2, 1
0x100111c63: vaddss xmm2, xmm2, xmm3
0x100111c67: vsqrtss xmm2, xmm2, xmm2
0x100111c6b: vucomiss xmm2, dword ptr [rip + 0x995c51] ; 0x100aa78c4
0x100111c73: jbe 0x100111c7f
0x100111c75: vpermilps xmm2, xmm2, 0xc0
0x100111c7b: vdivps xmm1, xmm1, xmm2
0x100111c7f: vmulps xmm2, xmm6, xmm1
0x100111c83: vmovshdup xmm3, xmm2
0x100111c87: vaddss xmm3, xmm2, xmm3
0x100111c8b: vpermilpd xmm2, xmm2, 1
0x100111c91: vaddss xmm3, xmm2, xmm3
0x100111c95: vmovaps xmm2, xmmword ptr [rip + 0x995c73] ; 0x100aa7910
0x100111c9d: vandps xmm4, xmm3, xmm2
0x100111ca1: vmovss xmm3, dword ptr [rip + 0x996cf3] ; 0x100aa899c
0x100111ca9: vucomiss xmm4, xmm3
0x100111cad: jbe 0x100111cb7
0x100111caf: vmovaps xmm1, xmmword ptr [rip + 0x996d79] ; 0x100aa8a30
0x100111cb7: vmulps xmm4, xmm6, xmm1
0x100111cbb: vmovshdup xmm5, xmm4
0x100111cbf: vaddss xmm5, xmm4, xmm5
0x100111cc3: vpermilpd xmm4, xmm4, 1
0x100111cc9: vaddss xmm4, xmm4, xmm5
0x100111ccd: vandps xmm2, xmm4, xmm2
0x100111cd1: vucomiss xmm2, xmm3
0x100111cd5: jbe 0x100111cdf
0x100111cd7: vmovaps xmm1, xmmword ptr [rip + 0x9963c1] ; 0x100aa80a0
0x100111cdf: vmulps xmm2, xmm6, xmm1
0x100111ce3: vmovshdup xmm3, xmm2
0x100111ce7: vaddss xmm3, xmm2, xmm3
0x100111ceb: vpermilpd xmm2, xmm2, 1
0x100111cf1: vaddss xmm2, xmm2, xmm3
0x100111cf5: vpermilps xmm2, xmm2, 0xc0
0x100111cfb: vmulps xmm2, xmm6, xmm2
0x100111cff: vsubps xmm1, xmm1, xmm2
0x100111d03: vmulps xmm2, xmm1, xmm1
0x100111d07: vmovshdup xmm3, xmm2
0x100111d0b: vaddss xmm3, xmm2, xmm3
0x100111d0f: vpermilpd xmm2, xmm2, 1
0x100111d15: vaddss xmm2, xmm2, xmm3
0x100111d19: vsqrtss xmm2, xmm2, xmm2
0x100111d1d: vucomiss xmm2, dword ptr [rip + 0x995b9f] ; 0x100aa78c4
0x100111d25: jbe 0x100111d31
0x100111d27: vpermilps xmm2, xmm2, 0xc0
0x100111d2d: vdivps xmm1, xmm1, xmm2
0x100111d31: vpermilps xmm2, xmm1, 0xd2
0x100111d37: vmulps xmm2, xmm6, xmm2
0x100111d3b: vpermilps xmm3, xmm6, 0xd2
0x100111d41: vmulps xmm1, xmm3, xmm1
0x100111d45: vsubps xmm1, xmm2, xmm1
0x100111d49: vmulps xmm1, xmm1, xmmword ptr [rip + 0x99627f] ; 0x100aa7fd0
0x100111d51: vpermilps xmm1, xmm1, 0xd2
0x100111d57: vaddps xmm6, xmm6, xmm1
0x100111d5b: vmulps xmm1, xmm6, xmm6
0x100111d5f: vmovshdup xmm2, xmm1
0x100111d63: vaddss xmm2, xmm1, xmm2
0x100111d67: vpermilpd xmm1, xmm1, 1
0x100111d6d: vaddss xmm1, xmm1, xmm2
0x100111d71: vsqrtss xmm1, xmm1, xmm1
0x100111d75: vucomiss xmm1, dword ptr [rip + 0x995b47] ; 0x100aa78c4
0x100111d7d: jbe 0x100111d89
0x100111d7f: vpermilps xmm1, xmm1, 0xc0
0x100111d85: vdivps xmm6, xmm6, xmm1
0x100111d89: vandps xmm1, xmm0, xmmword ptr [rip + 0x995b7f] ; 0x100aa7910
0x100111d91: vmovss xmm2, dword ptr [rip + 0x996893] ; 0x100aa862c
0x100111d99: vcmpnless xmm1, xmm2, xmm1
0x100111d9e: vandps xmm2, xmm1, xmm0
0x100111da2: vmovss xmm3, dword ptr [rip + 0x993316] ; 0x100aa50c0
0x100111daa: vandnps xmm1, xmm1, xmm3
0x100111dae: vorps xmm1, xmm1, xmm2
0x100111db2: vcmpordss xmm0, xmm0, xmm0
0x100111db7: vandps xmm1, xmm0, xmm1
0x100111dbb: vandnps xmm0, xmm0, xmm3
0x100111dbf: vorps xmm2, xmm0, xmm1
0x100111dc3: vmulps xmm0, xmm7, xmm6
0x100111dc7: vmovshdup xmm1, xmm0
0x100111dcb: vaddss xmm1, xmm0, xmm1
0x100111dcf: vpermilpd xmm0, xmm0, 1
0x100111dd5: vaddss xmm0, xmm0, xmm1
0x100111dd9: vmovss xmm1, dword ptr [rip + 0x995aeb] ; 0x100aa78cc
0x100111de1: vucomiss xmm1, xmm0
0x100111de5: vmovaps xmmword ptr [rbp - 0x20], xmm2
0x100111dea: jbe 0x100111e54
0x100111dec: vmovaps xmmword ptr [rbp - 0x50], xmm6
0x100111df1: vmovaps xmmword ptr [rbp - 0x40], xmm7
0x100111df6: call 0x100aa2576 ; 0x100aa2576 _acosf
0x100111dfb: vmovss dword ptr [rbp - 0xc], xmm0
0x100111e00: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100111e05: vmovss xmm1, dword ptr [rip + 0x9932b3] ; 0x100aa50c0
0x100111e0d: vdivss xmm0, xmm1, xmm0
0x100111e11: vmovss dword ptr [rbp - 0x10], xmm0
0x100111e16: vsubss xmm0, xmm1, dword ptr [rbp - 0x20]
0x100111e1b: vmulss xmm0, xmm0, dword ptr [rbp - 0xc]
0x100111e20: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100111e25: vmulss xmm0, xmm0, dword ptr [rbp - 0x10]
0x100111e2a: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100111e2f: vmovss xmm0, dword ptr [rbp - 0xc]
0x100111e34: vmulss xmm0, xmm0, dword ptr [rbp - 0x20]
0x100111e39: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100111e3e: vmovaps xmm1, xmmword ptr [rbp - 0x30]
0x100111e43: vmovaps xmm7, xmmword ptr [rbp - 0x40]
0x100111e48: vmovaps xmm6, xmmword ptr [rbp - 0x50]
0x100111e4d: vmulss xmm0, xmm0, dword ptr [rbp - 0x10]
0x100111e52: jmp 0x100111e5c ; 0x100111e5c
0x100111e54: vsubss xmm1, xmm3, xmm2
0x100111e58: vmovaps xmm0, xmm2
0x100111e5c: vpermilps xmm1, xmm1, 0xc0
0x100111e62: vmulps xmm1, xmm6, xmm1
0x100111e66: vpermilps xmm0, xmm0, 0xc0
0x100111e6c: vmulps xmm0, xmm7, xmm0
0x100111e70: vaddps xmm0, xmm0, xmm1
0x100111e74: vmovshdup xmm1, xmm0
0x100111e78: vucomiss xmm0, xmm1
0x100111e7c: jp 0x100111eca
0x100111e7e: vpermilpd xmm1, xmm0, 1
0x100111e84: vucomiss xmm1, xmm1
0x100111e88: jp 0x100111eca
0x100111e8a: vmulps xmm1, xmm0, xmm0
0x100111e8e: vmovshdup xmm2, xmm1
0x100111e92: vaddss xmm2, xmm1, xmm2
0x100111e96: vpermilpd xmm1, xmm1, 1
0x100111e9c: vaddss xmm1, xmm1, xmm2
0x100111ea0: vsqrtss xmm1, xmm1, xmm1
0x100111ea4: vucomiss xmm1, dword ptr [rip + 0x995a18] ; 0x100aa78c4
0x100111eac: vmovaps xmm6, xmm0
0x100111eb0: jbe 0x100111ebc
0x100111eb2: vpermilps xmm1, xmm1, 0xc0
0x100111eb8: vdivps xmm6, xmm0, xmm1
0x100111ebc: vmovaps xmmword ptr [rbx], xmm6
0x100111ec0: mov rax, rbx
0x100111ec3: add rsp, 0x48
0x100111ec7: pop rbx
0x100111ec8: pop rbp
0x100111ec9: ret 
0x100111eca: vcvtss2sd xmm0, xmm6, xmm6
0x100111ece: vmovshdup xmm1, xmm6
0x100111ed2: vcvtss2sd xmm1, xmm1, xmm1
0x100111ed6: vpermilpd xmm2, xmm6, 1
0x100111edc: vcvtss2sd xmm2, xmm2, xmm2
0x100111ee0: vcvtss2sd xmm3, xmm7, xmm7
0x100111ee4: vmovshdup xmm4, xmm7
0x100111ee8: vcvtss2sd xmm4, xmm4, xmm4
0x100111eec: vpermilpd xmm5, xmm7, 1
0x100111ef2: vcvtss2sd xmm5, xmm5, xmm5
0x100111ef6: vmovaps xmm6, xmmword ptr [rbp - 0x20]
0x100111efb: vcvtss2sd xmm6, xmm6, xmm6
0x100111eff: lea rdi, [rip + 0xa61a9c] ; 0x100b739a2 !isNan(result[0]) && !isNan(result[1]) && !isNan(result[2])
0x100111f06: lea rsi, [rip + 0xa61ad1] ; 0x100b739de ../../../Code/Base/TGCMath.h
0x100111f0d: lea r8, [rip + 0xa61ae7] ; 0x100b739fb SafeSlerp: slerp returned NaN, likely because input vectors were opposing or NaN. norm(a): <%.2f %.2f %.2f>, norm(b): <%.2f %.2f %.2f> t:%.2f
0x100111f14: mov edx, 0x237
0x100111f19: mov ecx, 4
0x100111f1e: mov al, 7
0x100111f20: call 0x1007e6030 ; 0x1007e6030
0x100111f25: ud2 
0x100111f27: nop word ptr [rax + rax]
