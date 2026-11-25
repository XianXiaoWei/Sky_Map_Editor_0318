0x10078a710: push rbp
0x10078a711: mov rbp, rsp
0x10078a714: vmovaps xmm1, xmmword ptr [rdi + 0x10]
0x10078a719: vmovaps xmm0, xmmword ptr [rdi + 0x20]
0x10078a71e: vmulps xmm2, xmm1, xmm1
0x10078a722: vmovshdup xmm3, xmm2
0x10078a726: vaddss xmm3, xmm2, xmm3
0x10078a72a: vpermilpd xmm2, xmm2, 1
0x10078a730: vaddss xmm2, xmm2, xmm3
0x10078a734: vsqrtss xmm3, xmm2, xmm2
0x10078a738: vmulps xmm2, xmm0, xmm0
0x10078a73c: vmovshdup xmm4, xmm2
0x10078a740: vaddss xmm4, xmm2, xmm4
0x10078a744: vpermilpd xmm2, xmm2, 1
0x10078a74a: vaddss xmm2, xmm2, xmm4
0x10078a74e: vsqrtss xmm2, xmm2, xmm2
0x10078a752: vucomiss xmm3, dword ptr [rip + 0x31d16a] ; 0x100aa78c4
0x10078a75a: jbe 0x10078a766
0x10078a75c: vpermilps xmm3, xmm3, 0xc0
0x10078a762: vdivps xmm1, xmm1, xmm3
0x10078a766: vucomiss xmm2, dword ptr [rip + 0x31d156] ; 0x100aa78c4
0x10078a76e: jbe 0x10078a77a
0x10078a770: vpermilps xmm2, xmm2, 0xc0
0x10078a776: vdivps xmm0, xmm0, xmm2
0x10078a77a: vxorps xmm2, xmm0, xmmword ptr [rip + 0x31d17e] ; 0x100aa7900
0x10078a782: vmovaps xmm3, xmmword ptr [rsi]
0x10078a786: vpermilps xmm4, xmm3, 0xd2
0x10078a78c: vmulps xmm4, xmm4, xmm2
0x10078a790: vpshufd xmm5, xmm2, 0xd2
0x10078a795: vmulps xmm3, xmm3, xmm5
0x10078a799: vsubps xmm3, xmm4, xmm3
0x10078a79d: vmulps xmm4, xmm3, xmm2
0x10078a7a1: vpermilps xmm4, xmm4, 0xd2
0x10078a7a7: vpermilps xmm3, xmm3, 0xc9
0x10078a7ad: vmulps xmm0, xmm3, xmm0
0x10078a7b1: vaddps xmm0, xmm4, xmm0
0x10078a7b5: vpermilps xmm3, xmm0, 0xd2
0x10078a7bb: vpermilps xmm0, xmm3, 0xd2
0x10078a7c1: vmulps xmm0, xmm1, xmm0
0x10078a7c5: vpermilps xmm4, xmm1, 0xd2
0x10078a7cb: vmulps xmm4, xmm4, xmm3
0x10078a7cf: vsubps xmm0, xmm0, xmm4
0x10078a7d3: vpermilps xmm0, xmm0, 0xd2
0x10078a7d9: vmulps xmm0, xmm0, xmm2
0x10078a7dd: vmovshdup xmm2, xmm0
0x10078a7e1: vaddss xmm2, xmm0, xmm2
0x10078a7e5: vpermilpd xmm0, xmm0, 1
0x10078a7eb: vaddss xmm0, xmm0, xmm2
0x10078a7ef: vmulps xmm1, xmm1, xmm3
0x10078a7f3: vmovshdup xmm2, xmm1
0x10078a7f7: vaddss xmm2, xmm1, xmm2
0x10078a7fb: vpermilpd xmm1, xmm1, 1
0x10078a801: vaddss xmm1, xmm1, xmm2
0x10078a805: pop rbp
0x10078a806: jmp 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10078a80b: nop dword ptr [rax + rax]
