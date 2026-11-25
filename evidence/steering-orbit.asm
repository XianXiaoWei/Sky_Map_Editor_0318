0x100630190: cmp byte ptr [rdi + 0x10], 0
0x100630194: je 0x100630318
0x10063019a: vandps xmm2, xmm0, xmmword ptr [rip + 0x47776e] ; 0x100aa7910
0x1006301a2: vmovss xmm4, dword ptr [rip + 0x47771a] ; 0x100aa78c4
0x1006301aa: vucomiss xmm4, xmm2
0x1006301ae: jae 0x100630317
0x1006301b4: vmovaps xmm8, xmmword ptr [rsi]
0x1006301b8: vmovaps xmm9, xmmword ptr [rdi + 0x20]
0x1006301bd: vsubps xmm5, xmm8, xmm9
0x1006301c2: vmulps xmm6, xmm5, xmm5
0x1006301c6: vmovshdup xmm7, xmm6
0x1006301ca: vaddss xmm7, xmm6, xmm7
0x1006301ce: vpermilpd xmm6, xmm6, 1
0x1006301d4: vaddss xmm6, xmm6, xmm7
0x1006301d8: vsqrtss xmm6, xmm6, xmm6
0x1006301dc: vucomiss xmm6, dword ptr [rip + 0x4776e0] ; 0x100aa78c4
0x1006301e4: jbe 0x1006301f0
0x1006301e6: vpermilps xmm6, xmm6, 0xc0
0x1006301ec: vdivps xmm5, xmm5, xmm6
0x1006301f0: vmulps xmm6, xmm5, xmm5
0x1006301f4: vmovshdup xmm7, xmm6
0x1006301f8: vaddss xmm7, xmm6, xmm7
0x1006301fc: vpermilpd xmm6, xmm6, 1
0x100630202: vaddss xmm6, xmm6, xmm7
0x100630206: vmovaps xmm7, xmmword ptr [rip + 0x477702] ; 0x100aa7910
0x10063020e: vandps xmm6, xmm6, xmm7
0x100630212: vucomiss xmm4, xmm6
0x100630216: jb 0x100630220
0x100630218: vmovaps xmm5, xmmword ptr [rip + 0x478810] ; 0x100aa8a30
0x100630220: vmovddup xmm6, qword ptr [rip + 0x4776b0] ; 0x100aa78d8
0x100630228: vmulps xmm2, xmm5, xmm6
0x10063022c: vmovshdup xmm3, xmm2
0x100630230: vaddss xmm3, xmm2, xmm3
0x100630234: vpermilpd xmm2, xmm2, 1
0x10063023a: vaddss xmm2, xmm2, xmm3
0x10063023e: vandps xmm2, xmm2, xmm7
0x100630242: vaddss xmm2, xmm2, dword ptr [rip + 0x474e7a] ; 0x100aa50c4
0x10063024a: vandps xmm2, xmm2, xmm7
0x10063024e: vucomiss xmm4, xmm2
0x100630252: jb 0x10063025c
0x100630254: vmovss xmm6, dword ptr [rip + 0x474e64] ; 0x100aa50c0
0x10063025c: vpermilps xmm2, xmm5, 0xd2
0x100630262: vmulps xmm2, xmm2, xmm6
0x100630266: vpermilps xmm3, xmm6, 0xd2
0x10063026c: vmulps xmm3, xmm5, xmm3
0x100630270: vsubps xmm2, xmm2, xmm3
0x100630274: vpermilps xmm5, xmm2, 0xd2
0x10063027a: vmulps xmm2, xmm2, xmm2
0x10063027e: vpermilpd xmm3, xmm2, 1
0x100630284: vaddss xmm3, xmm3, xmm2
0x100630288: vmovshdup xmm2, xmm2
0x10063028c: vaddss xmm2, xmm2, xmm3
0x100630290: vsqrtss xmm6, xmm2, xmm2
0x100630294: vucomiss xmm6, xmm4
0x100630298: jbe 0x1006302a4
0x10063029a: vpermilps xmm2, xmm6, 0xc0
0x1006302a0: vdivps xmm5, xmm5, xmm2
0x1006302a4: vpermilps xmm1, xmm1, 0xc0
0x1006302aa: vmulps xmm1, xmm1, xmm5
0x1006302ae: vmovd xmm2, edx
0x1006302b2: vpshufd xmm2, xmm2, 0xc0
0x1006302b7: vcvtdq2ps xmm2, xmm2
0x1006302bb: vmulps xmm1, xmm2, xmm1
0x1006302bf: vaddps xmm1, xmm8, xmm1
0x1006302c3: vsubps xmm1, xmm1, xmm9
0x1006302c8: vmulps xmm2, xmm1, xmm1
0x1006302cc: vmovshdup xmm3, xmm2
0x1006302d0: vaddss xmm3, xmm2, xmm3
0x1006302d4: vpermilpd xmm2, xmm2, 1
0x1006302da: vaddss xmm2, xmm2, xmm3
0x1006302de: vsqrtss xmm2, xmm2, xmm2
0x1006302e2: vucomiss xmm2, dword ptr [rip + 0x4775da] ; 0x100aa78c4
0x1006302ea: jbe 0x1006302f6
0x1006302ec: vpermilps xmm2, xmm2, 0xc0
0x1006302f2: vdivps xmm1, xmm1, xmm2
0x1006302f6: vbroadcastss xmm2, dword ptr [rdi + 0x74]
0x1006302fc: vmulps xmm1, xmm1, xmm2
0x100630300: vsubps xmm1, xmm1, xmmword ptr [rdi + 0x60]
0x100630305: vpermilps xmm0, xmm0, 0xc0
0x10063030b: vmulps xmm0, xmm0, xmm1
0x10063030f: vaddps xmm0, xmm0, xmmword ptr [rdi]
0x100630313: vmovaps xmmword ptr [rdi], xmm0
0x100630317: ret 
0x100630318: push rbp
0x100630319: mov rbp, rsp
0x10063031c: lea rdi, [rip + 0x56737e] ; 0x100b976a1 m_accum
0x100630323: lea rsi, [rip + 0x56737f] ; 0x100b976a9 SteeringBehaviors.cpp
0x10063032a: mov edx, 0x296
0x10063032f: mov ecx, 3
0x100630334: call 0x1007e5f70 ; 0x1007e5f70
0x100630339: ud2 
0x10063033b: nop dword ptr [rax + rax]
