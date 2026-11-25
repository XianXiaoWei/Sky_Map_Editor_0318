0x10055d2d0: push rbp
0x10055d2d1: mov rbp, rsp
0x10055d2d4: vmovaps xmm0, xmmword ptr [rsi + 0x60]
0x10055d2d9: vmulps xmm1, xmm0, xmm0
0x10055d2dd: vmovshdup xmm2, xmm1
0x10055d2e1: vaddss xmm2, xmm1, xmm2
0x10055d2e5: vpermilpd xmm1, xmm1, 1
0x10055d2eb: vaddss xmm1, xmm1, xmm2
0x10055d2ef: vsqrtss xmm1, xmm1, xmm1
0x10055d2f3: vucomiss xmm1, dword ptr [rip + 0x54a5c9] ; 0x100aa78c4
0x10055d2fb: jbe 0x10055d307
0x10055d2fd: vpermilps xmm1, xmm1, 0xc0
0x10055d303: vdivps xmm0, xmm0, xmm1
0x10055d307: vmovaps xmmword ptr [rdi], xmm0
0x10055d30b: mov rax, rdi
0x10055d30e: pop rbp
0x10055d30f: ret 
