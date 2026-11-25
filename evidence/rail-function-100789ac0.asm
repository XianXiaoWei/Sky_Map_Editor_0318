0x100789ac0: push rbp
0x100789ac1: mov rbp, rsp
0x100789ac4: vmovaps xmm0, xmmword ptr [rdx]
0x100789ac8: vmovaps xmm1, xmmword ptr [rsi]
0x100789acc: vsubps xmm4, xmm0, xmm1
0x100789ad0: vmovaps xmm2, xmmword ptr [rdi]
0x100789ad4: vsubps xmm1, xmm2, xmm1
0x100789ad8: vmulps xmm3, xmm4, xmm1
0x100789adc: vmovshdup xmm5, xmm3
0x100789ae0: vaddss xmm5, xmm3, xmm5
0x100789ae4: vpermilpd xmm3, xmm3, 1
0x100789aea: vaddss xmm3, xmm3, xmm5
0x100789aee: vxorps xmm5, xmm5, xmm5
0x100789af2: vucomiss xmm5, xmm3
0x100789af6: jae 0x100789b38
0x100789af8: vmulps xmm4, xmm4, xmm4
0x100789afc: vmovshdup xmm5, xmm4
0x100789b00: vaddss xmm5, xmm4, xmm5
0x100789b04: vpermilpd xmm4, xmm4, 1
0x100789b0a: vaddss xmm4, xmm4, xmm5
0x100789b0e: vucomiss xmm3, xmm4
0x100789b12: jae 0x100789b3e
0x100789b14: vmulps xmm0, xmm1, xmm1
0x100789b18: vmovshdup xmm1, xmm0
0x100789b1c: vaddss xmm1, xmm0, xmm1
0x100789b20: vpermilpd xmm0, xmm0, 1
0x100789b26: vaddss xmm0, xmm0, xmm1
0x100789b2a: vmulss xmm1, xmm3, xmm3
0x100789b2e: vdivss xmm1, xmm1, xmm4
0x100789b32: vsubss xmm0, xmm0, xmm1
0x100789b36: pop rbp
0x100789b37: ret 
0x100789b38: vmulps xmm0, xmm1, xmm1
0x100789b3c: jmp 0x100789b46 ; 0x100789b46
0x100789b3e: vsubps xmm0, xmm2, xmm0
0x100789b42: vmulps xmm0, xmm0, xmm0
0x100789b46: vmovshdup xmm1, xmm0
0x100789b4a: vaddss xmm1, xmm0, xmm1
0x100789b4e: vpermilpd xmm0, xmm0, 1
0x100789b54: vaddss xmm0, xmm0, xmm1
0x100789b58: pop rbp
0x100789b59: ret 
0x100789b5a: nop word ptr [rax + rax]
