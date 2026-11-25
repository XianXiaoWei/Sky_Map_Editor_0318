0x100630480: cmp byte ptr [rdi + 0x10], 0
0x100630484: je 0x1006304ff
0x100630486: vandps xmm1, xmm0, xmmword ptr [rip + 0x477482] ; 0x100aa7910
0x10063048e: vmovss xmm2, dword ptr [rip + 0x47742e] ; 0x100aa78c4
0x100630496: vucomiss xmm2, xmm1
0x10063049a: jae 0x1006304fe
0x10063049c: vmovaps xmm1, xmmword ptr [rdi + 0x60]
0x1006304a1: vmulps xmm2, xmm1, xmm1
0x1006304a5: vmovshdup xmm3, xmm2
0x1006304a9: vaddss xmm3, xmm2, xmm3
0x1006304ad: vpermilpd xmm2, xmm2, 1
0x1006304b3: vaddss xmm3, xmm2, xmm3
0x1006304b7: vmovss xmm2, dword ptr [rdi + 0x74]
0x1006304bc: vmulss xmm4, xmm2, xmm2
0x1006304c0: vucomiss xmm4, xmm3
0x1006304c4: ja 0x1006304e8
0x1006304c6: vsqrtss xmm3, xmm3, xmm3
0x1006304ca: vucomiss xmm3, dword ptr [rip + 0x4773f2] ; 0x100aa78c4
0x1006304d2: jbe 0x1006304de
0x1006304d4: vpermilps xmm3, xmm3, 0xc0
0x1006304da: vdivps xmm1, xmm1, xmm3
0x1006304de: vpermilps xmm2, xmm2, 0xc0
0x1006304e4: vmulps xmm1, xmm2, xmm1
0x1006304e8: vpermilps xmm0, xmm0, 0xc0
0x1006304ee: vmulps xmm0, xmm0, xmm1
0x1006304f2: vmovaps xmm1, xmmword ptr [rdi]
0x1006304f6: vsubps xmm0, xmm1, xmm0
0x1006304fa: vmovaps xmmword ptr [rdi], xmm0
0x1006304fe: ret 
0x1006304ff: push rbp
0x100630500: mov rbp, rsp
0x100630503: lea rdi, [rip + 0x567197] ; 0x100b976a1 m_accum
0x10063050a: lea rsi, [rip + 0x567198] ; 0x100b976a9 SteeringBehaviors.cpp
0x100630511: mov edx, 0x2a8
0x100630516: mov ecx, 3
0x10063051b: call 0x1007e5f70 ; 0x1007e5f70
0x100630520: ud2 
0x100630522: nop word ptr cs:[rax + rax]
