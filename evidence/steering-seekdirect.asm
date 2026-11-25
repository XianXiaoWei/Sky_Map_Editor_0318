0x10062f190: cmp byte ptr [rdi + 0x10], 0
0x10062f194: je 0x10062f20f
0x10062f196: vandps xmm2, xmm0, xmmword ptr [rip + 0x478772] ; 0x100aa7910
0x10062f19e: vmovss xmm3, dword ptr [rip + 0x47871e] ; 0x100aa78c4
0x10062f1a6: vucomiss xmm3, xmm2
0x10062f1aa: jae 0x10062f20e
0x10062f1ac: vmovaps xmm2, xmmword ptr [rsi]
0x10062f1b0: vsubps xmm2, xmm2, xmmword ptr [rdi + 0x20]
0x10062f1b5: vmulps xmm3, xmm2, xmm2
0x10062f1b9: vmovshdup xmm4, xmm3
0x10062f1bd: vaddss xmm4, xmm3, xmm4
0x10062f1c1: vpermilpd xmm3, xmm3, 1
0x10062f1c7: vaddss xmm3, xmm3, xmm4
0x10062f1cb: vsqrtss xmm3, xmm3, xmm3
0x10062f1cf: vucomiss xmm3, dword ptr [rip + 0x4786ed] ; 0x100aa78c4
0x10062f1d7: jbe 0x10062f1e3
0x10062f1d9: vpermilps xmm3, xmm3, 0xc0
0x10062f1df: vdivps xmm2, xmm2, xmm3
0x10062f1e3: vbroadcastss xmm3, dword ptr [rdi + 0x74]
0x10062f1e9: vmulps xmm2, xmm2, xmm3
0x10062f1ed: vpermilps xmm1, xmm1, 0xc0
0x10062f1f3: vmulps xmm1, xmm1, xmm2
0x10062f1f7: vsubps xmm1, xmm1, xmmword ptr [rdi + 0x60]
0x10062f1fc: vpermilps xmm0, xmm0, 0xc0
0x10062f202: vmulps xmm0, xmm0, xmm1
0x10062f206: vaddps xmm0, xmm0, xmmword ptr [rdi]
0x10062f20a: vmovaps xmmword ptr [rdi], xmm0
0x10062f20e: ret 
0x10062f20f: push rbp
0x10062f210: mov rbp, rsp
0x10062f213: lea rdi, [rip + 0x568487] ; 0x100b976a1 m_accum
0x10062f21a: lea rsi, [rip + 0x568488] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062f221: mov edx, 0x1fb
0x10062f226: mov ecx, 3
0x10062f22b: call 0x1007e5f70 ; 0x1007e5f70
0x10062f230: ud2 
0x10062f232: nop word ptr cs:[rax + rax]
