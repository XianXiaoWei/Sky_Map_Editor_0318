0x100789e80: push rbp
0x100789e81: mov rbp, rsp
0x100789e84: vmovaps xmm0, xmmword ptr [rsi]
0x100789e88: vmovaps xmm1, xmmword ptr [rsi + 0x10]
0x100789e8d: vmovaps xmm2, xmmword ptr [rsi + 0x20]
0x100789e92: vmulps xmm0, xmm0, xmm0
0x100789e96: vmovshdup xmm3, xmm0
0x100789e9a: vaddss xmm3, xmm0, xmm3
0x100789e9e: vpermilpd xmm0, xmm0, 1
0x100789ea4: vaddss xmm0, xmm0, xmm3
0x100789ea8: vsqrtss xmm0, xmm0, xmm0
0x100789eac: vmulps xmm1, xmm1, xmm1
0x100789eb0: vmovshdup xmm3, xmm1
0x100789eb4: vaddss xmm3, xmm1, xmm3
0x100789eb8: vpermilpd xmm1, xmm1, 1
0x100789ebe: vaddss xmm1, xmm1, xmm3
0x100789ec2: vsqrtss xmm1, xmm1, xmm1
0x100789ec6: vmulps xmm2, xmm2, xmm2
0x100789eca: vmovshdup xmm3, xmm2
0x100789ece: vaddss xmm3, xmm2, xmm3
0x100789ed2: vpermilpd xmm2, xmm2, 1
0x100789ed8: vaddss xmm2, xmm2, xmm3
0x100789edc: vsqrtss xmm2, xmm2, xmm2
0x100789ee0: vinsertps xmm0, xmm0, xmm1, 0x10
0x100789ee6: vinsertps xmm0, xmm0, xmm2, 0x20
0x100789eec: vmovss dword ptr [rdi + 8], xmm2
0x100789ef1: vmovlps qword ptr [rdi], xmm0
0x100789ef5: mov rax, rdi
0x100789ef8: pop rbp
0x100789ef9: ret 
0x100789efa: nop word ptr [rax + rax]
