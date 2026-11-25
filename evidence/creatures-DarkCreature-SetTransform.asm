0x10026c450: push rbp
0x10026c451: mov rbp, rsp
0x10026c454: push rbx
0x10026c455: sub rsp, 0x18
0x10026c459: mov rbx, rdi
0x10026c45c: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x10026c461: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10026c466: vmovaps xmm0, xmmword ptr [rsi]
0x10026c46a: vmovaps xmm1, xmmword ptr [rsi + 0x10]
0x10026c46f: vmovaps xmm2, xmmword ptr [rsi + 0x20]
0x10026c474: lea rsi, [rbx + 0x70]
0x10026c478: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10026c47d: vmovaps xmmword ptr [rbx + 0x80], xmm1
0x10026c485: vmovaps xmmword ptr [rbx + 0x90], xmm2
0x10026c48d: lea rdi, [rbp - 0x20]
0x10026c491: call 0x100789e80 ; 0x100789e80
0x10026c496: vmovaps xmm0, xmmword ptr [rbp - 0x20]
0x10026c49b: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x10026c4a3: vandps xmm1, xmm0, xmmword ptr [rip + 0x83b465] ; 0x100aa7910
0x10026c4ab: vmovss xmm2, dword ptr [rip + 0x83a5e9] ; 0x100aa6a9c
0x10026c4b3: vucomiss xmm2, xmm1
0x10026c4b7: jae 0x10026c52d
0x10026c4b9: vmovshdup xmm1, xmm0
0x10026c4bd: vandps xmm3, xmm1, xmmword ptr [rip + 0x83b44b] ; 0x100aa7910
0x10026c4c5: vucomiss xmm2, xmm3
0x10026c4c9: jae 0x10026c52d
0x10026c4cb: vpermilpd xmm3, xmm0, 1
0x10026c4d1: vandpd xmm4, xmm3, xmmword ptr [rip + 0x83b437] ; 0x100aa7910
0x10026c4d9: vucomiss xmm2, xmm4
0x10026c4dd: jae 0x10026c52d
0x10026c4df: vmovss xmm2, dword ptr [rip + 0x838bd9] ; 0x100aa50c0
0x10026c4e7: vdivss xmm0, xmm2, xmm0
0x10026c4eb: vdivss xmm1, xmm2, xmm1
0x10026c4ef: vdivss xmm2, xmm2, xmm3
0x10026c4f3: vpermilps xmm0, xmm0, 0xc0
0x10026c4f9: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x70]
0x10026c4fe: vpermilps xmm1, xmm1, 0xc0
0x10026c504: vmulps xmm1, xmm1, xmmword ptr [rbx + 0x80]
0x10026c50c: vpermilps xmm2, xmm2, 0xc0
0x10026c512: vmulps xmm2, xmm2, xmmword ptr [rbx + 0x90]
0x10026c51a: vinsertf128 ymm0, ymm0, xmm1, 1
0x10026c520: vmovups ymmword ptr [rbx + 0x70], ymm0
0x10026c525: vmovaps xmmword ptr [rbx + 0x90], xmm2
0x10026c52d: add rsp, 0x18
0x10026c531: pop rbx
0x10026c532: pop rbp
0x10026c533: vzeroupper 
0x10026c536: ret 
0x10026c537: nop word ptr [rax + rax]
