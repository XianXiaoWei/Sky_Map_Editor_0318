0x10062f710: cmp byte ptr [rdi + 0x10], 0
0x10062f714: je 0x10062f7cf
0x10062f71a: vandps xmm3, xmm0, xmmword ptr [rip + 0x4781ee] ; 0x100aa7910
0x10062f722: vmovss xmm2, dword ptr [rip + 0x47819a] ; 0x100aa78c4
0x10062f72a: vucomiss xmm2, xmm3
0x10062f72e: jae 0x10062f7ce
0x10062f734: vmovaps xmm3, xmmword ptr [rsi]
0x10062f738: vsubps xmm3, xmm3, xmmword ptr [rdi + 0x20]
0x10062f73d: vmulps xmm4, xmm3, xmm3
0x10062f741: vmovshdup xmm5, xmm4
0x10062f745: vaddss xmm5, xmm4, xmm5
0x10062f749: vpermilpd xmm4, xmm4, 1
0x10062f74f: vaddss xmm4, xmm4, xmm5
0x10062f753: vsqrtss xmm4, xmm4, xmm4
0x10062f757: vucomiss xmm4, dword ptr [rip + 0x478e55] ; 0x100aa85b4
0x10062f75f: jbe 0x10062f76b
0x10062f761: vpermilps xmm5, xmm4, 0xc0
0x10062f767: vdivps xmm3, xmm3, xmm5
0x10062f76b: vdivss xmm4, xmm4, xmm1
0x10062f76f: vcmpltss xmm5, xmm1, dword ptr [rip + 0x479e58] ; 0x100aa95d0
0x10062f778: vandps xmm6, xmm5, xmm4
0x10062f77c: vmovss xmm7, dword ptr [rip + 0x47593c] ; 0x100aa50c0
0x10062f784: vandnps xmm5, xmm5, xmm7
0x10062f788: vorps xmm5, xmm5, xmm6
0x10062f78c: vcmpltss xmm1, xmm2, xmm1
0x10062f791: vblendvps xmm1, xmm5, xmm4, xmm1
0x10062f797: vxorps xmm2, xmm2, xmm2
0x10062f79b: vmaxss xmm1, xmm2, xmm1
0x10062f79f: vminss xmm1, xmm7, xmm1
0x10062f7a3: vpermilps xmm1, xmm1, 0xc0
0x10062f7a9: vmulps xmm1, xmm1, xmm3
0x10062f7ad: vbroadcastss xmm2, dword ptr [rdi + 0x74]
0x10062f7b3: vmulps xmm1, xmm1, xmm2
0x10062f7b7: vsubps xmm1, xmm1, xmmword ptr [rdi + 0x60]
0x10062f7bc: vpermilps xmm0, xmm0, 0xc0
0x10062f7c2: vmulps xmm0, xmm0, xmm1
0x10062f7c6: vaddps xmm0, xmm0, xmmword ptr [rdi]
0x10062f7ca: vmovaps xmmword ptr [rdi], xmm0
0x10062f7ce: ret 
0x10062f7cf: push rbp
0x10062f7d0: mov rbp, rsp
0x10062f7d3: lea rdi, [rip + 0x567ec7] ; 0x100b976a1 m_accum
0x10062f7da: lea rsi, [rip + 0x567ec8] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062f7e1: mov edx, 0x24e
0x10062f7e6: mov ecx, 3
0x10062f7eb: call 0x1007e5f70 ; 0x1007e5f70
0x10062f7f0: ud2 
0x10062f7f2: nop word ptr cs:[rax + rax]
