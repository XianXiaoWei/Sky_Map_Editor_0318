0x100168830: push rbp
0x100168831: mov rbp, rsp
0x100168834: push r14
0x100168836: push rbx
0x100168837: sub rsp, 0x20
0x10016883b: mov r14, rsi
0x10016883e: mov rbx, rdi
0x100168841: vmovaps xmm2, xmmword ptr [rdx]
0x100168845: vmulps xmm0, xmm2, xmm2
0x100168849: vmovshdup xmm1, xmm0
0x10016884d: vaddss xmm1, xmm0, xmm1
0x100168851: vpermilpd xmm0, xmm0, 1
0x100168857: vaddss xmm0, xmm0, xmm1
0x10016885b: vsqrtss xmm1, xmm0, xmm0
0x10016885f: vucomiss xmm1, dword ptr [rip + 0x93f05d] ; 0x100aa78c4
0x100168867: vmovaps xmm0, xmm2
0x10016886b: jbe 0x100168877
0x10016886d: vpermilps xmm0, xmm1, 0xc0
0x100168873: vdivps xmm0, xmm2, xmm0
0x100168877: vmovaps xmmword ptr [rbp - 0x30], xmm2
0x10016887c: vmovaps xmm3, xmmword ptr [rcx]
0x100168880: vmulps xmm1, xmm3, xmm3
0x100168884: vmovshdup xmm2, xmm1
0x100168888: vaddss xmm2, xmm1, xmm2
0x10016888c: vpermilpd xmm1, xmm1, 1
0x100168892: vaddss xmm1, xmm1, xmm2
0x100168896: vsqrtss xmm2, xmm1, xmm1
0x10016889a: vucomiss xmm2, dword ptr [rip + 0x93f022] ; 0x100aa78c4
0x1001688a2: vmovaps xmm1, xmm3
0x1001688a6: jbe 0x1001688b2
0x1001688a8: vpermilps xmm1, xmm2, 0xc0
0x1001688ae: vdivps xmm1, xmm3, xmm1
0x1001688b2: vmovaps xmmword ptr [rbp - 0x20], xmm3
0x1001688b7: vmulps xmm0, xmm0, xmm1
0x1001688bb: vmovshdup xmm1, xmm0
0x1001688bf: vaddss xmm1, xmm0, xmm1
0x1001688c3: vpermilpd xmm0, xmm0, 1
0x1001688c9: vaddss xmm0, xmm0, xmm1
0x1001688cd: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1001688d2: vandps xmm2, xmm0, xmmword ptr [rip + 0x93f036] ; 0x100aa7910
0x1001688da: vmovss xmm1, dword ptr [rip + 0x93efe2] ; 0x100aa78c4
0x1001688e2: vucomiss xmm1, xmm2
0x1001688e6: jae 0x100168a4d
0x1001688ec: vmovaps xmm5, xmmword ptr [rbp - 0x30]
0x1001688f1: vpermilps xmm3, xmm5, 0xd2
0x1001688f7: vmovaps xmm4, xmmword ptr [rbp - 0x20]
0x1001688fc: vmulps xmm3, xmm3, xmm4
0x100168900: vpermilps xmm4, xmm4, 0xd2
0x100168906: vmulps xmm4, xmm5, xmm4
0x10016890a: vsubps xmm3, xmm3, xmm4
0x10016890e: vpermilps xmm5, xmm3, 0xd2
0x100168914: vmulps xmm3, xmm3, xmm3
0x100168918: vpermilpd xmm4, xmm3, 1
0x10016891e: vaddss xmm4, xmm4, xmm3
0x100168922: vmovshdup xmm3, xmm3
0x100168926: vaddss xmm3, xmm3, xmm4
0x10016892a: vsqrtss xmm3, xmm3, xmm3
0x10016892e: vucomiss xmm3, dword ptr [rip + 0x93ef8e] ; 0x100aa78c4
0x100168936: jbe 0x100168942
0x100168938: vpermilps xmm3, xmm3, 0xc0
0x10016893e: vdivps xmm5, xmm5, xmm3
0x100168942: vaddss xmm2, xmm2, dword ptr [rip + 0x944056] ; 0x100aac9a0
0x10016894a: vandps xmm2, xmm2, xmmword ptr [rip + 0x93efbe] ; 0x100aa7910
0x100168952: vucomiss xmm1, xmm2
0x100168956: jb 0x100168960
0x100168958: vmovaps xmm5, xmmword ptr [rip + 0x93f740] ; 0x100aa80a0
0x100168960: vmovaps xmmword ptr [rbp - 0x20], xmm5
0x100168965: vmovss xmm1, dword ptr [r14]
0x10016896a: vucomiss xmm1, xmm0
0x10016896e: ja 0x100168974
0x100168970: vmovaps xmm0, xmm1
0x100168974: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100168979: vmovshdup xmm14, xmm0
0x10016897d: vmovaps xmm1, xmmword ptr [rbp - 0x20]
0x100168982: vmovshdup xmm2, xmm1
0x100168986: vpermilpd xmm3, xmm1, 1
0x10016898c: vmulss xmm4, xmm1, xmm2
0x100168990: vmulss xmm8, xmm2, xmm3
0x100168994: vmulss xmm9, xmm3, xmm1
0x100168998: vmovss xmm7, dword ptr [rip + 0x93c720] ; 0x100aa50c0
0x1001689a0: vsubss xmm7, xmm7, xmm14
0x1001689a5: vmulss xmm5, xmm1, xmm1
0x1001689a9: vmulss xmm5, xmm5, xmm7
0x1001689ad: vaddss xmm10, xmm14, xmm5
0x1001689b1: vmulss xmm4, xmm4, xmm7
0x1001689b5: vmulss xmm6, xmm3, xmm0
0x1001689b9: vaddss xmm11, xmm6, xmm4
0x1001689bd: vmulss xmm9, xmm9, xmm7
0x1001689c1: vmulss xmm13, xmm2, xmm0
0x1001689c5: vsubss xmm12, xmm9, xmm13
0x1001689ca: vinsertps xmm5, xmm10, xmm11, 0x10
0x1001689d0: vinsertps xmm10, xmm5, xmm12, 0x20
0x1001689d6: vsubss xmm4, xmm4, xmm6
0x1001689da: vmulss xmm2, xmm2, xmm2
0x1001689de: vmulss xmm2, xmm2, xmm7
0x1001689e2: vaddss xmm2, xmm14, xmm2
0x1001689e6: vmulss xmm6, xmm8, xmm7
0x1001689ea: vmulss xmm0, xmm1, xmm0
0x1001689ee: vaddss xmm5, xmm0, xmm6
0x1001689f2: vinsertps xmm2, xmm4, xmm2, 0x10
0x1001689f8: vinsertps xmm2, xmm2, xmm5, 0x20
0x1001689fe: vaddss xmm4, xmm13, xmm9
0x100168a03: vsubss xmm0, xmm6, xmm0
0x100168a07: vmulss xmm3, xmm3, xmm3
0x100168a0b: vmulss xmm3, xmm3, xmm7
0x100168a0f: vaddss xmm1, xmm14, xmm3
0x100168a13: vinsertps xmm0, xmm4, xmm0, 0x10
0x100168a19: vinsertps xmm0, xmm0, xmm1, 0x20
0x100168a1f: vmovaps xmm4, xmmword ptr [rbp - 0x30]
0x100168a24: vpermilps xmm1, xmm4, 0xc0
0x100168a2a: vmulps xmm1, xmm1, xmm10
0x100168a2f: vpermilps xmm3, xmm4, 0xd5
0x100168a35: vmulps xmm2, xmm2, xmm3
0x100168a39: vaddps xmm1, xmm2, xmm1
0x100168a3d: vpermilps xmm2, xmm4, 0xea
0x100168a43: vmulps xmm0, xmm0, xmm2
0x100168a47: vaddps xmm0, xmm0, xmm1
0x100168a4b: jmp 0x100168a52 ; 0x100168a52
0x100168a4d: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100168a52: vmovaps xmmword ptr [rbx], xmm0
0x100168a56: mov rax, rbx
0x100168a59: add rsp, 0x20
0x100168a5d: pop rbx
0x100168a5e: pop r14
0x100168a60: pop rbp
0x100168a61: ret 
0x100168a62: nop word ptr cs:[rax + rax]
