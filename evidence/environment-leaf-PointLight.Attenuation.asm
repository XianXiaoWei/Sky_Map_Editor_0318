0x100540ac0: push rbp
0x100540ac1: mov rbp, rsp
0x100540ac4: vmovaps xmm1, xmmword ptr [rsi]
0x100540ac8: vmulps xmm1, xmm1, xmmword ptr [rdx]
0x100540acc: vmovshdup xmm2, xmm1
0x100540ad0: vaddss xmm2, xmm1, xmm2
0x100540ad4: vpermilpd xmm1, xmm1, 1
0x100540ada: vaddss xmm2, xmm1, xmm2
0x100540ade: vxorps xmm1, xmm1, xmm1
0x100540ae2: vmaxss xmm3, xmm1, xmm2
0x100540ae6: vcmpunordss xmm2, xmm2, xmm2
0x100540aeb: vandnps xmm2, xmm2, xmm3
0x100540aef: vucomiss xmm2, xmm1
0x100540af3: jne 0x100540af7
0x100540af5: jnp 0x100540b5c
0x100540af7: vmovaps xmm3, xmmword ptr [rdi + 0x10]
0x100540afc: vmulps xmm3, xmm3, xmm3
0x100540b00: vpermilpd xmm4, xmm3, 1
0x100540b06: vaddps xmm3, xmm3, xmm4
0x100540b0a: vmovshdup xmm4, xmm3
0x100540b0e: vaddss xmm3, xmm3, xmm4
0x100540b12: vsqrtss xmm3, xmm3, xmm3
0x100540b16: vmulss xmm3, xmm3, dword ptr [rip + 0x563a9a] ; 0x100aa45b8
0x100540b1e: vmulss xmm4, xmm3, dword ptr [rip + 0x58a6ca] ; 0x100acb1f0
0x100540b26: vucomiss xmm0, xmm4
0x100540b2a: jae 0x100540b5c
0x100540b2c: vdivss xmm1, xmm0, xmm4
0x100540b30: vmulss xmm1, xmm1, xmm1
0x100540b34: vmovss xmm4, dword ptr [rip + 0x564584] ; 0x100aa50c0
0x100540b3c: vsubss xmm1, xmm4, xmm1
0x100540b40: vdivss xmm0, xmm0, xmm1
0x100540b44: vdivss xmm0, xmm0, xmm3
0x100540b48: vaddss xmm0, xmm0, xmm4
0x100540b4c: vmulss xmm0, xmm0, xmm0
0x100540b50: vdivss xmm0, xmm4, xmm0
0x100540b54: vmovss dword ptr [rcx], xmm2
0x100540b58: vmulss xmm1, xmm2, xmm0
0x100540b5c: vmovaps xmm0, xmm1
0x100540b60: pop rbp
0x100540b61: ret 
0x100540b62: nop word ptr cs:[rax + rax]
