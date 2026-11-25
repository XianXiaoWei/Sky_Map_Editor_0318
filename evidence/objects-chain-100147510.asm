0x100147510: push rbp
0x100147511: mov rbp, rsp
0x100147514: push rbx
0x100147515: sub rsp, 0x38
0x100147519: mov rbx, rdi
0x10014751c: vmovaps xmm0, xmmword ptr [rsi]
0x100147520: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100147525: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10014752a: vxorps xmm1, xmm0, xmmword ptr [rip + 0x9603ce] ; 0x100aa7900
0x100147532: vinsertps xmm2, xmm0, xmm0, 0x4e
0x100147538: vinsertps xmm1, xmm2, xmm1, 0x20
0x10014753e: vxorps xmm2, xmm2, xmm2
0x100147542: vunpcklps xmm0, xmm0, xmm2
0x100147546: vmulps xmm1, xmm1, xmm2
0x10014754a: vaddps xmm1, xmm0, xmm1
0x10014754e: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x100147553: vmovss xmm0, dword ptr [rip + 0x95db65] ; 0x100aa50c0
0x10014755b: vmulps xmm0, xmm1, xmm0
0x10014755f: vpermilps xmm0, xmm0, 0xd2
0x100147565: vmulps xmm1, xmm1, xmmword ptr [rip + 0x9614c3] ; 0x100aa8a30
0x10014756d: vsubps xmm0, xmm0, xmm1
0x100147571: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x100147576: vmovshdup xmm0, xmmword ptr [rbp - 0x30]
0x10014757b: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100147580: vmovshdup xmm1, xmm0
0x100147584: vmovapd xmm5, xmmword ptr [rbp - 0x20]
0x100147589: vpermilpd xmm2, xmm5, 1
0x10014758f: vmovshdup xmm3, xmm5
0x100147593: vmulss xmm4, xmm2, xmm5
0x100147597: vmulss xmm8, xmm5, xmm3
0x10014759b: vmovaps xmm14, xmm5
0x10014759f: vmulss xmm9, xmm3, xmm2
0x1001475a3: vmovss xmm5, dword ptr [rip + 0x95db15] ; 0x100aa50c0
0x1001475ab: vsubss xmm7, xmm5, xmm1
0x1001475af: vmulss xmm5, xmm2, xmm2
0x1001475b3: vmulss xmm5, xmm7, xmm5
0x1001475b7: vaddss xmm10, xmm1, xmm5
0x1001475bb: vmulss xmm4, xmm7, xmm4
0x1001475bf: vmulss xmm6, xmm0, xmm3
0x1001475c3: vaddss xmm11, xmm6, xmm4
0x1001475c7: vmulss xmm9, xmm7, xmm9
0x1001475cc: vmulss xmm13, xmm0, xmm14
0x1001475d1: vsubss xmm12, xmm9, xmm13
0x1001475d6: vinsertps xmm5, xmm10, xmm11, 0x10
0x1001475dc: vinsertps xmm10, xmm5, xmm12, 0x20
0x1001475e2: vsubss xmm4, xmm4, xmm6
0x1001475e6: vmulss xmm6, xmm14, xmm14
0x1001475eb: vmulss xmm6, xmm7, xmm6
0x1001475ef: vaddss xmm6, xmm1, xmm6
0x1001475f3: vmulss xmm5, xmm7, xmm8
0x1001475f8: vmulss xmm0, xmm0, xmm2
0x1001475fc: vaddss xmm2, xmm0, xmm5
0x100147600: vinsertps xmm4, xmm4, xmm6, 0x10
0x100147606: vinsertps xmm2, xmm4, xmm2, 0x20
0x10014760c: vaddss xmm4, xmm13, xmm9
0x100147611: vsubss xmm0, xmm5, xmm0
0x100147615: vmulss xmm3, xmm3, xmm3
0x100147619: vmulss xmm3, xmm7, xmm3
0x10014761d: vaddss xmm1, xmm1, xmm3
0x100147621: vinsertps xmm0, xmm4, xmm0, 0x10
0x100147627: vinsertps xmm0, xmm0, xmm1, 0x20
0x10014762d: vmovaps xmm4, xmmword ptr [rbp - 0x40]
0x100147632: vpermilps xmm1, xmm4, 0xc0
0x100147638: vmulps xmm1, xmm1, xmm10
0x10014763d: vpermilps xmm3, xmm4, 0xd5
0x100147643: vmulps xmm2, xmm2, xmm3
0x100147647: vaddps xmm1, xmm2, xmm1
0x10014764b: vpermilps xmm2, xmm4, 0xea
0x100147651: vmulps xmm0, xmm0, xmm2
0x100147655: vaddps xmm0, xmm0, xmm1
0x100147659: vmulps xmm1, xmm0, xmm0
0x10014765d: vmovshdup xmm2, xmm1
0x100147661: vaddss xmm2, xmm1, xmm2
0x100147665: vpermilpd xmm1, xmm1, 1
0x10014766b: vaddss xmm1, xmm1, xmm2
0x10014766f: vsqrtss xmm1, xmm1, xmm1
0x100147673: vucomiss xmm1, dword ptr [rip + 0x960249] ; 0x100aa78c4
0x10014767b: jbe 0x100147687
0x10014767d: vpermilps xmm1, xmm1, 0xc0
0x100147683: vdivps xmm0, xmm0, xmm1
0x100147687: vmovaps xmmword ptr [rbx], xmm0
0x10014768b: mov rax, rbx
0x10014768e: add rsp, 0x38
0x100147692: pop rbx
0x100147693: pop rbp
0x100147694: ret 
0x100147695: nop word ptr cs:[rax + rax]
