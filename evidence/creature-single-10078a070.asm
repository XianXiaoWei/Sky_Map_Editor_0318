0x10078a070: push rbp
0x10078a071: mov rbp, rsp
0x10078a074: vmovaps xmm3, xmmword ptr [rsi]
0x10078a078: vmovaps xmm2, xmmword ptr [rsi + 0x10]
0x10078a07d: vmovaps xmm1, xmmword ptr [rsi + 0x20]
0x10078a082: vmulps xmm4, xmm3, xmm3
0x10078a086: vmovshdup xmm5, xmm4
0x10078a08a: vaddss xmm5, xmm4, xmm5
0x10078a08e: vpermilpd xmm4, xmm4, 1
0x10078a094: vaddss xmm4, xmm4, xmm5
0x10078a098: vsqrtss xmm6, xmm4, xmm4
0x10078a09c: vmulps xmm4, xmm2, xmm2
0x10078a0a0: vmovshdup xmm5, xmm4
0x10078a0a4: vaddss xmm5, xmm4, xmm5
0x10078a0a8: vpermilpd xmm4, xmm4, 1
0x10078a0ae: vaddss xmm4, xmm4, xmm5
0x10078a0b2: vsqrtss xmm5, xmm4, xmm4
0x10078a0b6: vmulps xmm4, xmm1, xmm1
0x10078a0ba: vmovshdup xmm7, xmm4
0x10078a0be: vaddss xmm7, xmm4, xmm7
0x10078a0c2: vpermilpd xmm4, xmm4, 1
0x10078a0c8: vaddss xmm4, xmm4, xmm7
0x10078a0cc: vsqrtss xmm4, xmm4, xmm4
0x10078a0d0: vinsertps xmm7, xmm6, xmm5, 0x10
0x10078a0d6: vinsertps xmm7, xmm7, xmm4, 0x20
0x10078a0dc: vmovss dword ptr [rdi + 8], xmm4
0x10078a0e1: vmovlps qword ptr [rdi], xmm7
0x10078a0e5: vucomiss xmm6, xmm0
0x10078a0e9: ja 0x10078a0fc
0x10078a0eb: vucomiss xmm5, xmm0
0x10078a0ef: ja 0x10078a110
0x10078a0f1: vucomiss xmm4, xmm0
0x10078a0f5: ja 0x10078a125
0x10078a0f7: mov rax, rdi
0x10078a0fa: pop rbp
0x10078a0fb: ret 
0x10078a0fc: vpermilps xmm6, xmm6, 0xc0
0x10078a102: vdivps xmm3, xmm3, xmm6
0x10078a106: vmovaps xmmword ptr [rsi], xmm3
0x10078a10a: vucomiss xmm5, xmm0
0x10078a10e: jbe 0x10078a0f1
0x10078a110: vpermilps xmm3, xmm5, 0xc0
0x10078a116: vdivps xmm2, xmm2, xmm3
0x10078a11a: vmovaps xmmword ptr [rsi + 0x10], xmm2
0x10078a11f: vucomiss xmm4, xmm0
0x10078a123: jbe 0x10078a0f7
0x10078a125: vpermilps xmm0, xmm4, 0xc0
0x10078a12b: vdivps xmm0, xmm1, xmm0
0x10078a12f: vmovaps xmmword ptr [rsi + 0x20], xmm0
0x10078a134: mov rax, rdi
0x10078a137: pop rbp
0x10078a138: ret 
0x10078a139: nop dword ptr [rax]
