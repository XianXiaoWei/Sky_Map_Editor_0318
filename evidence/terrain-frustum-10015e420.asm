0x10015e420: push rbp
0x10015e421: mov rbp, rsp
0x10015e424: vmovaps xmm2, xmmword ptr [rsi]
0x10015e428: vmovaps xmm3, xmmword ptr [rsi + 0x10]
0x10015e42d: vmovaps xmm7, xmmword ptr [rsi + 0x20]
0x10015e432: vmovaps xmm8, xmmword ptr [rsi + 0x30]
0x10015e437: vmulps xmm1, xmm2, xmm2
0x10015e43b: vmovshdup xmm4, xmm1
0x10015e43f: vaddss xmm4, xmm1, xmm4
0x10015e443: vpermilpd xmm1, xmm1, 1
0x10015e449: vaddss xmm1, xmm1, xmm4
0x10015e44d: vsqrtss xmm6, xmm1, xmm1
0x10015e451: vmulps xmm1, xmm3, xmm3
0x10015e455: vmovshdup xmm4, xmm1
0x10015e459: vaddss xmm4, xmm1, xmm4
0x10015e45d: vpermilpd xmm1, xmm1, 1
0x10015e463: vaddss xmm1, xmm1, xmm4
0x10015e467: vsqrtss xmm13, xmm1, xmm1
0x10015e46b: vmulps xmm4, xmm7, xmm7
0x10015e46f: vmovshdup xmm5, xmm4
0x10015e473: vaddss xmm5, xmm4, xmm5
0x10015e477: vpermilpd xmm4, xmm4, 1
0x10015e47d: vaddss xmm4, xmm4, xmm5
0x10015e481: vsqrtss xmm0, xmm4, xmm4
0x10015e485: vpermilps xmm4, xmm6, 0xc0
0x10015e48b: vdivps xmm11, xmm2, xmm4
0x10015e48f: vpermilps xmm2, xmm13, 0xc0
0x10015e495: vdivps xmm12, xmm3, xmm2
0x10015e499: vpermilps xmm2, xmm0, 0xc0
0x10015e49f: vdivps xmm10, xmm7, xmm2
0x10015e4a3: vmovaps xmm7, xmmword ptr [rdi]
0x10015e4a7: vpermilps xmm14, xmm7, 0xe7
0x10015e4ad: vmulps xmm2, xmm11, xmm7
0x10015e4b1: vmulps xmm4, xmm12, xmm7
0x10015e4b5: vmovshdup xmm5, xmm4
0x10015e4b9: vaddss xmm5, xmm4, xmm5
0x10015e4bd: vpermilpd xmm4, xmm4, 1
0x10015e4c3: vaddss xmm4, xmm4, xmm5
0x10015e4c7: vmovaps xmm9, xmmword ptr [rip + 0x949441] ; 0x100aa7910
0x10015e4cf: vandps xmm4, xmm4, xmm9
0x10015e4d4: vmulss xmm4, xmm13, xmm4
0x10015e4d8: vmulps xmm5, xmm10, xmm7
0x10015e4dc: vinsertps xmm1, xmm5, xmm2, 0x1c
0x10015e4e2: vinsertps xmm3, xmm2, xmm5, 0x4c
0x10015e4e8: vaddps xmm1, xmm1, xmm3
0x10015e4ec: vunpckhps xmm2, xmm5, xmm2
0x10015e4f0: vaddps xmm1, xmm2, xmm1
0x10015e4f4: vandps xmm1, xmm1, xmm9
0x10015e4f9: vinsertps xmm6, xmm0, xmm6, 0x10
0x10015e4ff: vmulps xmm0, xmm6, xmm1
0x10015e503: vmovshdup xmm1, xmm0
0x10015e507: vaddss xmm1, xmm1, xmm4
0x10015e50b: vaddss xmm0, xmm0, xmm1
0x10015e50f: vmulps xmm1, xmm8, xmm7
0x10015e513: vmovshdup xmm2, xmm1
0x10015e517: vaddss xmm2, xmm1, xmm2
0x10015e51b: vpermilpd xmm1, xmm1, 1
0x10015e521: vaddss xmm1, xmm1, xmm2
0x10015e525: vaddss xmm1, xmm14, xmm1
0x10015e529: vxorps xmm0, xmm0, xmmword ptr [rip + 0x9493cf] ; 0x100aa7900
0x10015e531: vucomiss xmm0, xmm1
0x10015e535: jae 0x10015e7f2
0x10015e53b: vmovaps xmm0, xmmword ptr [rdi + 0x10]
0x10015e540: vpermilps xmm1, xmm0, 0xe7
0x10015e546: vmulps xmm2, xmm11, xmm0
0x10015e54a: vmulps xmm3, xmm12, xmm0
0x10015e54e: vmovshdup xmm4, xmm3
0x10015e552: vaddss xmm4, xmm3, xmm4
0x10015e556: vpermilpd xmm3, xmm3, 1
0x10015e55c: vaddss xmm3, xmm3, xmm4
0x10015e560: vandps xmm3, xmm3, xmm9
0x10015e565: vmulss xmm3, xmm13, xmm3
0x10015e569: vmulps xmm4, xmm10, xmm0
0x10015e56d: vinsertps xmm5, xmm4, xmm2, 0x1c
0x10015e573: vinsertps xmm7, xmm2, xmm4, 0x4c
0x10015e579: vaddps xmm5, xmm5, xmm7
0x10015e57d: vunpckhps xmm2, xmm4, xmm2
0x10015e581: vaddps xmm2, xmm2, xmm5
0x10015e585: vandps xmm2, xmm2, xmm9
0x10015e58a: vmulps xmm2, xmm6, xmm2
0x10015e58e: vmovshdup xmm4, xmm2
0x10015e592: vaddss xmm3, xmm4, xmm3
0x10015e596: vaddss xmm2, xmm2, xmm3
0x10015e59a: vmulps xmm0, xmm8, xmm0
0x10015e59e: vmovshdup xmm3, xmm0
0x10015e5a2: vaddss xmm3, xmm0, xmm3
0x10015e5a6: vpermilpd xmm0, xmm0, 1
0x10015e5ac: vaddss xmm0, xmm0, xmm3
0x10015e5b0: vaddss xmm0, xmm1, xmm0
0x10015e5b4: vxorps xmm1, xmm2, xmmword ptr [rip + 0x949344] ; 0x100aa7900
0x10015e5bc: vucomiss xmm1, xmm0
0x10015e5c0: jae 0x10015e7f2
0x10015e5c6: vmovaps xmm0, xmmword ptr [rdi + 0x20]
0x10015e5cb: vpermilps xmm1, xmm0, 0xe7
0x10015e5d1: vmulps xmm2, xmm11, xmm0
0x10015e5d5: vmulps xmm3, xmm12, xmm0
0x10015e5d9: vmovshdup xmm4, xmm3
0x10015e5dd: vaddss xmm4, xmm3, xmm4
0x10015e5e1: vpermilpd xmm3, xmm3, 1
0x10015e5e7: vaddss xmm3, xmm3, xmm4
0x10015e5eb: vandps xmm3, xmm3, xmm9
0x10015e5f0: vmulss xmm3, xmm13, xmm3
0x10015e5f4: vmulps xmm4, xmm10, xmm0
0x10015e5f8: vinsertps xmm5, xmm4, xmm2, 0x1c
0x10015e5fe: vinsertps xmm7, xmm2, xmm4, 0x4c
0x10015e604: vaddps xmm5, xmm5, xmm7
0x10015e608: vunpckhps xmm2, xmm4, xmm2
0x10015e60c: vaddps xmm2, xmm2, xmm5
0x10015e610: vandps xmm2, xmm2, xmm9
0x10015e615: vmulps xmm2, xmm6, xmm2
0x10015e619: vmovshdup xmm4, xmm2
0x10015e61d: vaddss xmm3, xmm4, xmm3
0x10015e621: vaddss xmm2, xmm2, xmm3
0x10015e625: vmulps xmm0, xmm8, xmm0
0x10015e629: vmovshdup xmm3, xmm0
0x10015e62d: vaddss xmm3, xmm0, xmm3
0x10015e631: vpermilpd xmm0, xmm0, 1
0x10015e637: vaddss xmm0, xmm0, xmm3
0x10015e63b: vaddss xmm0, xmm1, xmm0
0x10015e63f: vxorps xmm1, xmm2, xmmword ptr [rip + 0x9492b9] ; 0x100aa7900
0x10015e647: vucomiss xmm1, xmm0
0x10015e64b: jae 0x10015e7f2
0x10015e651: vmovaps xmm0, xmmword ptr [rdi + 0x30]
0x10015e656: vpermilps xmm1, xmm0, 0xe7
0x10015e65c: vmulps xmm2, xmm11, xmm0
0x10015e660: vmulps xmm3, xmm12, xmm0
0x10015e664: vmovshdup xmm4, xmm3
0x10015e668: vaddss xmm4, xmm3, xmm4
0x10015e66c: vpermilpd xmm3, xmm3, 1
0x10015e672: vaddss xmm3, xmm3, xmm4
0x10015e676: vandps xmm3, xmm3, xmm9
0x10015e67b: vmulss xmm3, xmm13, xmm3
0x10015e67f: vmulps xmm4, xmm10, xmm0
0x10015e683: vinsertps xmm5, xmm4, xmm2, 0x1c
0x10015e689: vinsertps xmm7, xmm2, xmm4, 0x4c
0x10015e68f: vaddps xmm5, xmm5, xmm7
0x10015e693: vunpckhps xmm2, xmm4, xmm2
0x10015e697: vaddps xmm2, xmm2, xmm5
0x10015e69b: vandps xmm2, xmm2, xmm9
0x10015e6a0: vmulps xmm2, xmm6, xmm2
0x10015e6a4: vmovshdup xmm4, xmm2
0x10015e6a8: vaddss xmm3, xmm4, xmm3
0x10015e6ac: vaddss xmm2, xmm2, xmm3
0x10015e6b0: vmulps xmm0, xmm8, xmm0
0x10015e6b4: vmovshdup xmm3, xmm0
0x10015e6b8: vaddss xmm3, xmm0, xmm3
0x10015e6bc: vpermilpd xmm0, xmm0, 1
0x10015e6c2: vaddss xmm0, xmm0, xmm3
0x10015e6c6: vaddss xmm0, xmm1, xmm0
0x10015e6ca: vxorps xmm1, xmm2, xmmword ptr [rip + 0x94922e] ; 0x100aa7900
0x10015e6d2: vucomiss xmm1, xmm0
0x10015e6d6: jae 0x10015e7f2
0x10015e6dc: vmovaps xmm0, xmmword ptr [rdi + 0x40]
0x10015e6e1: vpermilps xmm1, xmm0, 0xe7
0x10015e6e7: vmulps xmm2, xmm11, xmm0
0x10015e6eb: vmulps xmm3, xmm12, xmm0
0x10015e6ef: vmovshdup xmm4, xmm3
0x10015e6f3: vaddss xmm4, xmm3, xmm4
0x10015e6f7: vpermilpd xmm3, xmm3, 1
0x10015e6fd: vaddss xmm3, xmm3, xmm4
0x10015e701: vandps xmm3, xmm3, xmm9
0x10015e706: vmulss xmm3, xmm13, xmm3
0x10015e70a: vmulps xmm4, xmm10, xmm0
0x10015e70e: vinsertps xmm5, xmm4, xmm2, 0x1c
0x10015e714: vinsertps xmm7, xmm2, xmm4, 0x4c
0x10015e71a: vaddps xmm5, xmm5, xmm7
0x10015e71e: vunpckhps xmm2, xmm4, xmm2
0x10015e722: vaddps xmm2, xmm2, xmm5
0x10015e726: vandps xmm2, xmm2, xmm9
0x10015e72b: vmulps xmm2, xmm6, xmm2
0x10015e72f: vmovshdup xmm4, xmm2
0x10015e733: vaddss xmm3, xmm4, xmm3
0x10015e737: vaddss xmm2, xmm2, xmm3
0x10015e73b: vmulps xmm0, xmm8, xmm0
0x10015e73f: vmovshdup xmm3, xmm0
0x10015e743: vaddss xmm3, xmm0, xmm3
0x10015e747: vpermilpd xmm0, xmm0, 1
0x10015e74d: vaddss xmm0, xmm0, xmm3
0x10015e751: vaddss xmm0, xmm1, xmm0
0x10015e755: vxorps xmm1, xmm2, xmmword ptr [rip + 0x9491a3] ; 0x100aa7900
0x10015e75d: vucomiss xmm1, xmm0
0x10015e761: jae 0x10015e7f2
0x10015e767: vmovaps xmm0, xmmword ptr [rdi + 0x50]
0x10015e76c: vpermilps xmm1, xmm0, 0xe7
0x10015e772: vmulps xmm2, xmm11, xmm0
0x10015e776: vmulps xmm3, xmm12, xmm0
0x10015e77a: vmovshdup xmm4, xmm3
0x10015e77e: vaddss xmm4, xmm3, xmm4
0x10015e782: vpermilpd xmm3, xmm3, 1
0x10015e788: vaddss xmm3, xmm3, xmm4
0x10015e78c: vandps xmm3, xmm3, xmm9
0x10015e791: vmulss xmm3, xmm13, xmm3
0x10015e795: vmulps xmm4, xmm10, xmm0
0x10015e799: vinsertps xmm5, xmm4, xmm2, 0x1c
0x10015e79f: vinsertps xmm7, xmm2, xmm4, 0x4c
0x10015e7a5: vaddps xmm5, xmm5, xmm7
0x10015e7a9: vunpckhps xmm2, xmm4, xmm2
0x10015e7ad: vaddps xmm2, xmm2, xmm5
0x10015e7b1: vandps xmm2, xmm2, xmm9
0x10015e7b6: vmulps xmm2, xmm6, xmm2
0x10015e7ba: vmovshdup xmm4, xmm2
0x10015e7be: vaddss xmm3, xmm4, xmm3
0x10015e7c2: vaddss xmm2, xmm2, xmm3
0x10015e7c6: vmulps xmm0, xmm8, xmm0
0x10015e7ca: vmovshdup xmm3, xmm0
0x10015e7ce: vaddss xmm3, xmm0, xmm3
0x10015e7d2: vpermilpd xmm0, xmm0, 1
0x10015e7d8: vaddss xmm0, xmm0, xmm3
0x10015e7dc: vaddss xmm0, xmm1, xmm0
0x10015e7e0: vxorps xmm1, xmm2, xmmword ptr [rip + 0x949118] ; 0x100aa7900
0x10015e7e8: vucomiss xmm1, xmm0
0x10015e7ec: jae 0x10015e7f2
0x10015e7ee: mov al, 1
0x10015e7f0: pop rbp
0x10015e7f1: ret 
0x10015e7f2: xor eax, eax
0x10015e7f4: pop rbp
0x10015e7f5: ret 
0x10015e7f6: nop word ptr cs:[rax + rax]
