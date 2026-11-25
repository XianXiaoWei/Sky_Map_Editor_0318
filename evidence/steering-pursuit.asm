0x10062f660: cmp byte ptr [rdi + 0x10], 0
0x10062f664: je 0x10062f6df
0x10062f666: vandps xmm2, xmm0, xmmword ptr [rip + 0x4782a2] ; 0x100aa7910
0x10062f66e: vmovss xmm3, dword ptr [rip + 0x47824e] ; 0x100aa78c4
0x10062f676: vucomiss xmm3, xmm2
0x10062f67a: jae 0x10062f6de
0x10062f67c: vpermilps xmm1, xmm1, 0xc0
0x10062f682: vmulps xmm1, xmm1, xmmword ptr [rdx]
0x10062f686: vaddps xmm1, xmm1, xmmword ptr [rsi]
0x10062f68a: vsubps xmm1, xmm1, xmmword ptr [rdi + 0x20]
0x10062f68f: vmulps xmm2, xmm1, xmm1
0x10062f693: vmovshdup xmm3, xmm2
0x10062f697: vaddss xmm3, xmm2, xmm3
0x10062f69b: vpermilpd xmm2, xmm2, 1
0x10062f6a1: vaddss xmm2, xmm2, xmm3
0x10062f6a5: vsqrtss xmm2, xmm2, xmm2
0x10062f6a9: vucomiss xmm2, dword ptr [rip + 0x478213] ; 0x100aa78c4
0x10062f6b1: jbe 0x10062f6bd
0x10062f6b3: vpermilps xmm2, xmm2, 0xc0
0x10062f6b9: vdivps xmm1, xmm1, xmm2
0x10062f6bd: vbroadcastss xmm2, dword ptr [rdi + 0x74]
0x10062f6c3: vmulps xmm1, xmm1, xmm2
0x10062f6c7: vsubps xmm1, xmm1, xmmword ptr [rdi + 0x60]
0x10062f6cc: vpermilps xmm0, xmm0, 0xc0
0x10062f6d2: vmulps xmm0, xmm0, xmm1
0x10062f6d6: vaddps xmm0, xmm0, xmmword ptr [rdi]
0x10062f6da: vmovaps xmmword ptr [rdi], xmm0
0x10062f6de: ret 
0x10062f6df: push rbp
0x10062f6e0: mov rbp, rsp
0x10062f6e3: lea rdi, [rip + 0x567fb7] ; 0x100b976a1 m_accum
0x10062f6ea: lea rsi, [rip + 0x567fb8] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062f6f1: mov edx, 0x1f2
0x10062f6f6: mov ecx, 3
0x10062f6fb: call 0x1007e5f70 ; 0x1007e5f70
0x10062f700: ud2 
0x10062f702: nop word ptr cs:[rax + rax]
