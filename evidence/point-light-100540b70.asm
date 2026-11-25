0x100540b70: push rbp
0x100540b71: mov rbp, rsp
0x100540b74: vmovaps xmm1, xmmword ptr [rsi]
0x100540b78: vmulps xmm1, xmm1, xmmword ptr [rdx]
0x100540b7c: vmovshdup xmm2, xmm1
0x100540b80: vaddss xmm2, xmm1, xmm2
0x100540b84: vpermilpd xmm1, xmm1, 1
0x100540b8a: vaddss xmm2, xmm1, xmm2
0x100540b8e: vxorps xmm1, xmm1, xmm1
0x100540b92: vmaxss xmm3, xmm1, xmm2
0x100540b96: vcmpunordss xmm2, xmm2, xmm2
0x100540b9b: vandnps xmm2, xmm2, xmm3
0x100540b9f: vucomiss xmm2, xmm1
0x100540ba3: jne 0x100540ba7
0x100540ba5: jnp 0x100540c08
0x100540ba7: vmovaps xmm3, xmmword ptr [rdi + 0x10]
0x100540bac: vmulps xmm3, xmm3, xmm3
0x100540bb0: vpermilpd xmm4, xmm3, 1
0x100540bb6: vaddps xmm3, xmm3, xmm4
0x100540bba: vmovshdup xmm4, xmm3
0x100540bbe: vaddss xmm3, xmm3, xmm4
0x100540bc2: vsqrtss xmm3, xmm3, xmm3
0x100540bc6: vmulss xmm3, xmm3, dword ptr [rip + 0x5639ea] ; 0x100aa45b8
0x100540bce: vmulss xmm4, xmm3, dword ptr [rip + 0x58a61a] ; 0x100acb1f0
0x100540bd6: vucomiss xmm0, xmm4
0x100540bda: jae 0x100540c08
0x100540bdc: vdivss xmm1, xmm0, xmm4
0x100540be0: vmulss xmm1, xmm1, xmm1
0x100540be4: vmovss xmm4, dword ptr [rip + 0x5644d4] ; 0x100aa50c0
0x100540bec: vsubss xmm1, xmm4, xmm1
0x100540bf0: vdivss xmm0, xmm0, xmm1
0x100540bf4: vdivss xmm0, xmm0, xmm3
0x100540bf8: vaddss xmm0, xmm0, xmm4
0x100540bfc: vmulss xmm0, xmm0, xmm0
0x100540c00: vdivss xmm0, xmm4, xmm0
0x100540c04: vmulss xmm1, xmm2, xmm0
0x100540c08: vmovaps xmm0, xmm1
0x100540c0c: pop rbp
0x100540c0d: ret 
0x100540c0e: nop 
