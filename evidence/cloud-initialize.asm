0x100211690: push rbp
0x100211691: mov rbp, rsp
0x100211694: push r15
0x100211696: push r14
0x100211698: push r13
0x10021169a: push r12
0x10021169c: push rbx
0x10021169d: sub rsp, 0x88
0x1002116a4: mov qword ptr [rbp - 0x40], rdx
0x1002116a8: mov r12, rsi
0x1002116ab: mov rbx, rdi
0x1002116ae: mov byte ptr [rbx + 0xc], 1
0x1002116b2: mov dword ptr [rbx + 0x2c0], 0
0x1002116bc: vxorps xmm0, xmm0, xmm0
0x1002116c0: vmovaps xmmword ptr [rbx + 0x2d0], xmm0
0x1002116c8: mov dword ptr [rbp - 0x80], 1
0x1002116cf: vmovaps ymm0, ymmword ptr [rip + 0x89fba9] ; 0x100ab1280
0x1002116d7: vmovups ymmword ptr [rbp - 0xa0], ymm0
0x1002116df: lea rdi, [rbx + 0x308]
0x1002116e6: lea r13, [rbp - 0xa0]
0x1002116ed: mov qword ptr [rbp - 0x38], rdi
0x1002116f1: mov rsi, r13
0x1002116f4: vzeroupper 
0x1002116f7: call 0x1007f04d0 ; 0x1007f04d0
0x1002116fc: mov qword ptr [rbp - 0x94], 0
0x100211707: mov dword ptr [rbp - 0x8c], 0
0x100211711: lea rdi, [rbx + 0x2e0]
0x100211718: mov rsi, r13
0x10021171b: call 0x1007f04d0 ; 0x1007f04d0
0x100211720: movabs rax, 0x100000001
0x10021172a: mov qword ptr [rbp - 0xa0], rax
0x100211731: lea rdi, [rbx + 0x330]
0x100211738: mov rsi, r13
0x10021173b: call 0x1007f04d0 ; 0x1007f04d0
0x100211740: mov r13, qword ptr [r12 + 0xe8]
0x100211748: lea r8, [r13 + 4]
0x10021174c: vxorps xmm2, xmm2, xmm2
0x100211750: vmovss xmm1, dword ptr [rip + 0x893968] ; 0x100aa50c0
0x100211758: xor edx, edx
0x10021175a: vmovsd xmm0, qword ptr [rip + 0x898e2e] ; 0x100aaa590
0x100211762: nop word ptr cs:[rax + rax]
0x100211770: mov rsi, r8
0x100211773: xor edi, edi
0x100211775: nop word ptr cs:[rax + rax]
0x100211780: xor ecx, ecx
0x100211782: nop word ptr cs:[rax + rax]
0x100211790: vmovss xmm3, dword ptr [rsi + rcx*4 - 4]
0x100211796: vmovss xmm4, dword ptr [rsi + rcx*4]
0x10021179b: vcvtss2sd xmm3, xmm3, xmm3
0x10021179f: vmulsd xmm3, xmm3, xmm0
0x1002117a3: vaddsd xmm3, xmm3, xmm0
0x1002117a7: vcvtsd2ss xmm3, xmm3, xmm3
0x1002117ab: vminss xmm1, xmm3, xmm1
0x1002117af: vmaxss xmm2, xmm3, xmm2
0x1002117b3: vcvtss2sd xmm3, xmm4, xmm4
0x1002117b7: vmulsd xmm3, xmm3, xmm0
0x1002117bb: vaddsd xmm3, xmm3, xmm0
0x1002117bf: vcvtsd2ss xmm3, xmm3, xmm3
0x1002117c3: vminss xmm1, xmm3, xmm1
0x1002117c7: vmaxss xmm2, xmm3, xmm2
0x1002117cb: add rcx, 2
0x1002117cf: cmp rcx, 0x40
0x1002117d3: jne 0x100211790
0x1002117d5: inc rdi
0x1002117d8: add rsi, 0x100
0x1002117df: cmp rdi, 0x40
0x1002117e3: jne 0x100211780
0x1002117e5: inc rdx
0x1002117e8: add r8, 0x4000
0x1002117ef: cmp rdx, 0x40
0x1002117f3: jne 0x100211770
0x1002117f9: vsubss xmm2, xmm2, xmm1
0x1002117fd: vucomiss xmm2, dword ptr [rip + 0x8960bf] ; 0x100aa78c4
0x100211805: seta cl
0x100211808: vmovss xmm3, dword ptr [rip + 0x897dc0] ; 0x100aa95d0
0x100211810: vucomiss xmm3, xmm2
0x100211814: seta al
0x100211817: or al, cl
0x100211819: mov byte ptr [rbp - 0x29], al
0x10021181c: vpermilps xmm3, xmm1, 0
0x100211822: vinsertf128 ymm11, ymm3, xmm3, 1
0x100211828: vpermilps xmm4, xmm2, 0
0x10021182e: vinsertf128 ymm13, ymm4, xmm4, 1
0x100211834: lea rdx, [rbx + 0x3f358]
0x10021183b: lea rax, [rbx + 0x358]
0x100211842: xor r9d, r9d
0x100211845: vxorps xmm5, xmm5, xmm5
0x100211849: vmovss xmm6, dword ptr [rip + 0x89386f] ; 0x100aa50c0
0x100211851: vmovss xmm7, dword ptr [rip + 0x896e3b] ; 0x100aa8694
0x100211859: mov ecx, 0x1000
0x10021185e: vmovq xmm3, rcx
0x100211863: vpslldq xmm3, xmm3, 8
0x100211868: vmovdqa xmmword ptr [rbp - 0xb0], xmm3
0x100211870: vmovapd ymm12, ymmword ptr [rip + 0x89fa28] ; 0x100ab12a0
0x100211878: vmovaps ymm14, ymmword ptr [rip + 0x89fa40] ; 0x100ab12c0
0x100211880: vmovaps ymm15, ymmword ptr [rip + 0x89fa58] ; 0x100ab12e0
0x100211888: vmovdqa xmm9, xmmword ptr [rip + 0x89b560] ; 0x100aacdf0
0x100211890: mov rcx, r13
0x100211893: nop word ptr cs:[rax + rax]
0x1002118a0: cmp byte ptr [rbp - 0x29], 0
0x1002118a4: mov qword ptr [rbp - 0x50], rax
0x1002118a8: mov qword ptr [rbp - 0x48], rcx
0x1002118ac: je 0x100212200
0x1002118b2: lea rsi, [r9 + 0x3f001]
0x1002118b9: mov qword ptr [rbp - 0x70], rsi
0x1002118bd: mov r10, r9
0x1002118c0: shl r10, 0xc
0x1002118c4: lea r12, [r10 + 0x40]
0x1002118c8: mov rsi, rcx
0x1002118cb: xor r14d, r14d
0x1002118ce: mov qword ptr [rbp - 0x68], r9
0x1002118d2: mov qword ptr [rbp - 0x60], r10
0x1002118d6: mov qword ptr [rbp - 0x58], r12
0x1002118da: nop word ptr [rax + rax]
0x1002118e0: mov rcx, r14
0x1002118e3: shl rcx, 6
0x1002118e7: lea r8, [rcx + r9]
0x1002118eb: lea r15, [rcx + r10]
0x1002118ef: lea rdi, [r12 + rcx]
0x1002118f3: lea rdi, [r13 + rdi*4]
0x1002118f8: lea r11, [rbx + r8 + 0x358]
0x100211900: cmp r11, rdi
0x100211903: mov qword ptr [rbp - 0x78], rax
0x100211907: jae 0x100211980
0x100211909: lea rdi, [r13 + r15*4]
0x10021190e: add rcx, qword ptr [rbp - 0x70]
0x100211912: lea rcx, [rbx + rcx + 0x358]
0x10021191a: cmp rcx, rdi
0x10021191d: jbe 0x100211980
0x10021191f: mov rcx, rax
0x100211922: xor edi, edi
0x100211924: nop word ptr cs:[rax + rax]
0x100211930: vmovss xmm3, dword ptr [rsi + rdi*4]
0x100211935: vcvtss2sd xmm3, xmm3, xmm3
0x100211939: vmulsd xmm3, xmm3, xmm0
0x10021193d: vaddsd xmm3, xmm3, xmm0
0x100211941: vcvtsd2ss xmm3, xmm3, xmm3
0x100211945: vsubss xmm3, xmm3, xmm1
0x100211949: vdivss xmm3, xmm3, xmm2
0x10021194d: vmaxss xmm3, xmm5, xmm3
0x100211951: vminss xmm3, xmm6, xmm3
0x100211955: vmulss xmm3, xmm3, xmm7
0x100211959: vcvttss2si eax, xmm3
0x10021195d: mov byte ptr [rcx], al
0x10021195f: inc rdi
0x100211962: add rcx, 0x1000
0x100211969: cmp rdi, 0x40
0x10021196d: jne 0x100211930
0x10021196f: jmp 0x1002121dd ; 0x1002121dd
0x100211974: nop word ptr cs:[rax + rax]
0x100211980: vmovq xmm3, r8
0x100211985: vpshufd xmm10, xmm3, 0x44
0x10021198a: vcvtps2pd ymm3, xmmword ptr [r13 + r15*4 + 0x10]
0x100211991: vcvtps2pd ymm8, xmmword ptr [r13 + r15*4]
0x100211998: vmulpd ymm8, ymm8, ymm12
0x10021199d: vmulpd ymm3, ymm3, ymm12
0x1002119a2: vaddpd ymm3, ymm3, ymm12
0x1002119a7: vaddpd ymm8, ymm8, ymm12
0x1002119ac: vcvtpd2ps xmm8, ymm8
0x1002119b1: vcvtpd2ps xmm3, ymm3
0x1002119b5: vinsertf128 ymm3, ymm8, xmm3, 1
0x1002119bb: vsubps ymm3, ymm3, ymm11
0x1002119c0: vdivps ymm3, ymm3, ymm13
0x1002119c5: vxorpd ymm8, ymm8, ymm8
0x1002119ca: vmaxps ymm3, ymm8, ymm3
0x1002119ce: vminps ymm3, ymm14, ymm3
0x1002119d2: vmulps ymm3, ymm3, ymm15
0x1002119d7: vcvttps2dq ymm3, ymm3
0x1002119db: vextractf128 xmm4, ymm3, 1
0x1002119e1: vpshufb xmm4, xmm4, xmm9
0x1002119e6: vpshufb xmm3, xmm3, xmm9
0x1002119eb: vpunpcklqdq xmm3, xmm3, xmm4
0x1002119ef: vpaddq xmm4, xmm10, xmmword ptr [rbp - 0xb0]
0x1002119f7: vpextrq rcx, xmm4, 1
0x1002119fd: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f9eb] ; 0x100ab13f0
0x100211a05: vmovq rdi, xmm4
0x100211a0a: vpextrq rax, xmm4, 1
0x100211a10: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f9c8] ; 0x100ab13e0
0x100211a18: vmovq r11, xmm4
0x100211a1d: vpextrq r10, xmm4, 1
0x100211a23: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f9a5] ; 0x100ab13d0
0x100211a2b: mov r9, r13
0x100211a2e: vmovq r13, xmm4
0x100211a33: vpextrq r12, xmm4, 1
0x100211a39: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 0
0x100211a44: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211a4f: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211a5a: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 6
0x100211a65: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 8
0x100211a70: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 0xa
0x100211a7b: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xc
0x100211a86: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xe
0x100211a91: mov rax, r15
0x100211a94: or rax, 8
0x100211a98: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211a9f: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211aa5: vmulpd ymm4, ymm4, ymm12
0x100211aaa: vmulpd ymm3, ymm3, ymm12
0x100211aaf: vaddpd ymm3, ymm3, ymm12
0x100211ab4: vaddpd ymm4, ymm4, ymm12
0x100211ab9: vcvtpd2ps xmm4, ymm4
0x100211abd: vcvtpd2ps xmm3, ymm3
0x100211ac1: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211ac7: vsubps ymm3, ymm3, ymm11
0x100211acc: vdivps ymm3, ymm3, ymm13
0x100211ad1: vmaxps ymm3, ymm8, ymm3
0x100211ad5: vminps ymm3, ymm14, ymm3
0x100211ad9: vmulps ymm3, ymm3, ymm15
0x100211ade: vcvttps2dq ymm3, ymm3
0x100211ae2: vextractf128 xmm4, ymm3, 1
0x100211ae8: vpshufb xmm4, xmm4, xmm9
0x100211aed: vpshufb xmm3, xmm3, xmm9
0x100211af2: vpunpcklqdq xmm3, xmm3, xmm4
0x100211af6: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f932] ; 0x100ab1430
0x100211afe: vmovq rax, xmm4
0x100211b03: vpextrq rcx, xmm4, 1
0x100211b09: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f90f] ; 0x100ab1420
0x100211b11: vmovq rdi, xmm4
0x100211b16: vpextrq r8, xmm4, 1
0x100211b1c: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f8ec] ; 0x100ab1410
0x100211b24: vmovq r10, xmm4
0x100211b29: vpextrq r11, xmm4, 1
0x100211b2f: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f8c9] ; 0x100ab1400
0x100211b37: vmovq r12, xmm4
0x100211b3c: vpextrq r13, xmm4, 1
0x100211b42: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100211b4d: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211b58: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211b63: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x100211b6e: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x100211b79: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x100211b84: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x100211b8f: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x100211b9a: mov rax, r15
0x100211b9d: or rax, 0x10
0x100211ba1: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211ba8: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211bae: vmulpd ymm4, ymm4, ymm12
0x100211bb3: vmulpd ymm3, ymm3, ymm12
0x100211bb8: vaddpd ymm3, ymm3, ymm12
0x100211bbd: vaddpd ymm4, ymm4, ymm12
0x100211bc2: vcvtpd2ps xmm4, ymm4
0x100211bc6: vcvtpd2ps xmm3, ymm3
0x100211bca: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211bd0: vsubps ymm3, ymm3, ymm11
0x100211bd5: vdivps ymm3, ymm3, ymm13
0x100211bda: vmaxps ymm3, ymm8, ymm3
0x100211bde: vminps ymm3, ymm14, ymm3
0x100211be2: vmulps ymm3, ymm3, ymm15
0x100211be7: vcvttps2dq ymm3, ymm3
0x100211beb: vextractf128 xmm4, ymm3, 1
0x100211bf1: vpshufb xmm4, xmm4, xmm9
0x100211bf6: vpshufb xmm3, xmm3, xmm9
0x100211bfb: vpunpcklqdq xmm3, xmm3, xmm4
0x100211bff: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f869] ; 0x100ab1470
0x100211c07: vmovq rax, xmm4
0x100211c0c: vpextrq rcx, xmm4, 1
0x100211c12: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f846] ; 0x100ab1460
0x100211c1a: vmovq rdi, xmm4
0x100211c1f: vpextrq r8, xmm4, 1
0x100211c25: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f823] ; 0x100ab1450
0x100211c2d: vmovq r10, xmm4
0x100211c32: vpextrq r11, xmm4, 1
0x100211c38: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f800] ; 0x100ab1440
0x100211c40: vmovq r12, xmm4
0x100211c45: vpextrq r13, xmm4, 1
0x100211c4b: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100211c56: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211c61: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211c6c: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x100211c77: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x100211c82: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x100211c8d: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x100211c98: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x100211ca3: mov rax, r15
0x100211ca6: or rax, 0x18
0x100211caa: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211cb1: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211cb7: vmulpd ymm4, ymm4, ymm12
0x100211cbc: vmulpd ymm3, ymm3, ymm12
0x100211cc1: vaddpd ymm3, ymm3, ymm12
0x100211cc6: vaddpd ymm4, ymm4, ymm12
0x100211ccb: vcvtpd2ps xmm4, ymm4
0x100211ccf: vcvtpd2ps xmm3, ymm3
0x100211cd3: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211cd9: vsubps ymm3, ymm3, ymm11
0x100211cde: vdivps ymm3, ymm3, ymm13
0x100211ce3: vmaxps ymm3, ymm8, ymm3
0x100211ce7: vminps ymm3, ymm14, ymm3
0x100211ceb: vmulps ymm3, ymm3, ymm15
0x100211cf0: vcvttps2dq ymm3, ymm3
0x100211cf4: vextractf128 xmm4, ymm3, 1
0x100211cfa: vpshufb xmm4, xmm4, xmm9
0x100211cff: vpshufb xmm3, xmm3, xmm9
0x100211d04: vpunpcklqdq xmm3, xmm3, xmm4
0x100211d08: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f7a0] ; 0x100ab14b0
0x100211d10: vmovq rax, xmm4
0x100211d15: vpextrq rcx, xmm4, 1
0x100211d1b: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f77d] ; 0x100ab14a0
0x100211d23: vmovq rdi, xmm4
0x100211d28: vpextrq r8, xmm4, 1
0x100211d2e: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f75a] ; 0x100ab1490
0x100211d36: vmovq r10, xmm4
0x100211d3b: vpextrq r11, xmm4, 1
0x100211d41: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f737] ; 0x100ab1480
0x100211d49: vmovq r12, xmm4
0x100211d4e: vpextrq r13, xmm4, 1
0x100211d54: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100211d5f: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211d6a: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211d75: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x100211d80: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x100211d8b: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x100211d96: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x100211da1: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x100211dac: mov rax, r15
0x100211daf: or rax, 0x20
0x100211db3: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211dba: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211dc0: vmulpd ymm4, ymm4, ymm12
0x100211dc5: vmulpd ymm3, ymm3, ymm12
0x100211dca: vaddpd ymm3, ymm3, ymm12
0x100211dcf: vaddpd ymm4, ymm4, ymm12
0x100211dd4: vcvtpd2ps xmm4, ymm4
0x100211dd8: vcvtpd2ps xmm3, ymm3
0x100211ddc: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211de2: vsubps ymm3, ymm3, ymm11
0x100211de7: vdivps ymm3, ymm3, ymm13
0x100211dec: vmaxps ymm3, ymm8, ymm3
0x100211df0: vminps ymm3, ymm14, ymm3
0x100211df4: vmulps ymm3, ymm3, ymm15
0x100211df9: vcvttps2dq ymm3, ymm3
0x100211dfd: vextractf128 xmm4, ymm3, 1
0x100211e03: vpshufb xmm4, xmm4, xmm9
0x100211e08: vpshufb xmm3, xmm3, xmm9
0x100211e0d: vpunpcklqdq xmm3, xmm3, xmm4
0x100211e11: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f6d7] ; 0x100ab14f0
0x100211e19: vmovq rax, xmm4
0x100211e1e: vpextrq rcx, xmm4, 1
0x100211e24: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f6b4] ; 0x100ab14e0
0x100211e2c: vmovq rdi, xmm4
0x100211e31: vpextrq r8, xmm4, 1
0x100211e37: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f691] ; 0x100ab14d0
0x100211e3f: vmovq r10, xmm4
0x100211e44: vpextrq r11, xmm4, 1
0x100211e4a: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f66e] ; 0x100ab14c0
0x100211e52: vmovq r12, xmm4
0x100211e57: vpextrq r13, xmm4, 1
0x100211e5d: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100211e68: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211e73: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211e7e: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x100211e89: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x100211e94: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x100211e9f: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x100211eaa: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x100211eb5: mov rax, r15
0x100211eb8: or rax, 0x28
0x100211ebc: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211ec3: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211ec9: vmulpd ymm4, ymm4, ymm12
0x100211ece: vmulpd ymm3, ymm3, ymm12
0x100211ed3: vaddpd ymm3, ymm3, ymm12
0x100211ed8: vaddpd ymm4, ymm4, ymm12
0x100211edd: vcvtpd2ps xmm4, ymm4
0x100211ee1: vcvtpd2ps xmm3, ymm3
0x100211ee5: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211eeb: vsubps ymm3, ymm3, ymm11
0x100211ef0: vdivps ymm3, ymm3, ymm13
0x100211ef5: vmaxps ymm3, ymm8, ymm3
0x100211ef9: vminps ymm3, ymm14, ymm3
0x100211efd: vmulps ymm3, ymm3, ymm15
0x100211f02: vcvttps2dq ymm3, ymm3
0x100211f06: vextractf128 xmm4, ymm3, 1
0x100211f0c: vpshufb xmm4, xmm4, xmm9
0x100211f11: vpshufb xmm3, xmm3, xmm9
0x100211f16: vpunpcklqdq xmm3, xmm3, xmm4
0x100211f1a: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f60e] ; 0x100ab1530
0x100211f22: vmovq rax, xmm4
0x100211f27: vpextrq rcx, xmm4, 1
0x100211f2d: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f5eb] ; 0x100ab1520
0x100211f35: vmovq rdi, xmm4
0x100211f3a: vpextrq r8, xmm4, 1
0x100211f40: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f5c8] ; 0x100ab1510
0x100211f48: vmovq r10, xmm4
0x100211f4d: vpextrq r11, xmm4, 1
0x100211f53: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f5a5] ; 0x100ab1500
0x100211f5b: vmovq r12, xmm4
0x100211f60: vpextrq r13, xmm4, 1
0x100211f66: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100211f71: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100211f7c: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100211f87: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x100211f92: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x100211f9d: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x100211fa8: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x100211fb3: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x100211fbe: mov rax, r15
0x100211fc1: or rax, 0x30
0x100211fc5: vcvtps2pd ymm3, xmmword ptr [r9 + rax*4 + 0x10]
0x100211fcc: vcvtps2pd ymm4, xmmword ptr [r9 + rax*4]
0x100211fd2: vmulpd ymm4, ymm4, ymm12
0x100211fd7: vmulpd ymm3, ymm3, ymm12
0x100211fdc: vaddpd ymm3, ymm3, ymm12
0x100211fe1: vaddpd ymm4, ymm4, ymm12
0x100211fe6: vcvtpd2ps xmm4, ymm4
0x100211fea: vcvtpd2ps xmm3, ymm3
0x100211fee: vinsertf128 ymm3, ymm4, xmm3, 1
0x100211ff4: vsubps ymm3, ymm3, ymm11
0x100211ff9: vdivps ymm3, ymm3, ymm13
0x100211ffe: vmaxps ymm3, ymm8, ymm3
0x100212002: vminps ymm3, ymm14, ymm3
0x100212006: vmulps ymm3, ymm3, ymm15
0x10021200b: vcvttps2dq ymm3, ymm3
0x10021200f: vextractf128 xmm4, ymm3, 1
0x100212015: vpshufb xmm4, xmm4, xmm9
0x10021201a: vpshufb xmm3, xmm3, xmm9
0x10021201f: vpunpcklqdq xmm3, xmm3, xmm4
0x100212023: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f545] ; 0x100ab1570
0x10021202b: vmovq rax, xmm4
0x100212030: vpextrq rcx, xmm4, 1
0x100212036: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f522] ; 0x100ab1560
0x10021203e: vmovq rdi, xmm4
0x100212043: vpextrq r8, xmm4, 1
0x100212049: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f4ff] ; 0x100ab1550
0x100212051: vmovq r10, xmm4
0x100212056: vpextrq r11, xmm4, 1
0x10021205c: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f4dc] ; 0x100ab1540
0x100212064: vmovq r12, xmm4
0x100212069: vpextrq r13, xmm4, 1
0x10021206f: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x10021207a: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100212085: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x100212090: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x10021209b: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x1002120a6: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x1002120b1: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xc
0x1002120bc: vpextrb byte ptr [rbx + r13 + 0x358], xmm3, 0xe
0x1002120c7: mov r13, r9
0x1002120ca: mov r9, qword ptr [rbp - 0x68]
0x1002120ce: or r15, 0x38
0x1002120d2: vcvtps2pd ymm3, xmmword ptr [r13 + r15*4 + 0x10]
0x1002120d9: vcvtps2pd ymm4, xmmword ptr [r13 + r15*4]
0x1002120e0: vmulpd ymm4, ymm4, ymm12
0x1002120e5: vmulpd ymm3, ymm3, ymm12
0x1002120ea: vaddpd ymm3, ymm3, ymm12
0x1002120ef: vaddpd ymm4, ymm4, ymm12
0x1002120f4: vcvtpd2ps xmm4, ymm4
0x1002120f8: vcvtpd2ps xmm3, ymm3
0x1002120fc: vinsertf128 ymm3, ymm4, xmm3, 1
0x100212102: vsubps ymm3, ymm3, ymm11
0x100212107: vdivps ymm3, ymm3, ymm13
0x10021210c: vmaxps ymm3, ymm8, ymm3
0x100212110: vminps ymm3, ymm14, ymm3
0x100212114: vmulps ymm3, ymm3, ymm15
0x100212119: vcvttps2dq ymm3, ymm3
0x10021211d: vextractf128 xmm4, ymm3, 1
0x100212123: vpshufb xmm4, xmm4, xmm9
0x100212128: vpshufb xmm3, xmm3, xmm9
0x10021212d: vpunpcklqdq xmm3, xmm3, xmm4
0x100212131: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f477] ; 0x100ab15b0
0x100212139: vmovq rax, xmm4
0x10021213e: vpextrq rcx, xmm4, 1
0x100212144: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f454] ; 0x100ab15a0
0x10021214c: vmovq rdi, xmm4
0x100212151: vpextrq r8, xmm4, 1
0x100212157: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f431] ; 0x100ab1590
0x10021215f: vmovq r10, xmm4
0x100212164: vpextrq r11, xmm4, 1
0x10021216a: vpaddq xmm4, xmm10, xmmword ptr [rip + 0x89f40e] ; 0x100ab1580
0x100212172: vmovq r15, xmm4
0x100212177: vpextrq r12, xmm4, 1
0x10021217d: vpextrb byte ptr [rbx + rax + 0x358], xmm3, 0
0x100212188: vpextrb byte ptr [rbx + rcx + 0x358], xmm3, 2
0x100212193: vpextrb byte ptr [rbx + rdi + 0x358], xmm3, 4
0x10021219e: vpextrb byte ptr [rbx + r8 + 0x358], xmm3, 6
0x1002121a9: vpextrb byte ptr [rbx + r10 + 0x358], xmm3, 8
0x1002121b4: mov r10, qword ptr [rbp - 0x60]
0x1002121b8: vpextrb byte ptr [rbx + r11 + 0x358], xmm3, 0xa
0x1002121c3: vpextrb byte ptr [rbx + r15 + 0x358], xmm3, 0xc
0x1002121ce: vpextrb byte ptr [rbx + r12 + 0x358], xmm3, 0xe
0x1002121d9: mov r12, qword ptr [rbp - 0x58]
0x1002121dd: inc r14
0x1002121e0: mov rax, qword ptr [rbp - 0x78]
0x1002121e4: add rax, 0x40
0x1002121e8: add rsi, 0x100
0x1002121ef: cmp r14, 0x40
0x1002121f3: jne 0x1002118e0
0x1002121f9: jmp 0x100212416 ; 0x100212416
0x1002121fe: nop 
0x100212200: mov rcx, 0xfffffffffffff000
0x100212207: nop word ptr [rax + rax]
0x100212210: mov byte ptr [rdx + rcx - 0x3e000], 0xff
0x100212218: mov byte ptr [rdx + rcx - 0x3d000], 0xff
0x100212220: mov byte ptr [rdx + rcx - 0x3c000], 0xff
0x100212228: mov byte ptr [rdx + rcx - 0x3b000], 0xff
0x100212230: mov byte ptr [rdx + rcx - 0x3a000], 0xff
0x100212238: mov byte ptr [rdx + rcx - 0x39000], 0xff
0x100212240: mov byte ptr [rdx + rcx - 0x38000], 0xff
0x100212248: mov byte ptr [rdx + rcx - 0x37000], 0xff
0x100212250: mov byte ptr [rdx + rcx - 0x36000], 0xff
0x100212258: mov byte ptr [rdx + rcx - 0x35000], 0xff
0x100212260: mov byte ptr [rdx + rcx - 0x34000], 0xff
0x100212268: mov byte ptr [rdx + rcx - 0x33000], 0xff
0x100212270: mov byte ptr [rdx + rcx - 0x32000], 0xff
0x100212278: mov byte ptr [rdx + rcx - 0x31000], 0xff
0x100212280: mov byte ptr [rdx + rcx - 0x30000], 0xff
0x100212288: mov byte ptr [rdx + rcx - 0x2f000], 0xff
0x100212290: mov byte ptr [rdx + rcx - 0x2e000], 0xff
0x100212298: mov byte ptr [rdx + rcx - 0x2d000], 0xff
0x1002122a0: mov byte ptr [rdx + rcx - 0x2c000], 0xff
0x1002122a8: mov byte ptr [rdx + rcx - 0x2b000], 0xff
0x1002122b0: mov byte ptr [rdx + rcx - 0x2a000], 0xff
0x1002122b8: mov byte ptr [rdx + rcx - 0x29000], 0xff
0x1002122c0: mov byte ptr [rdx + rcx - 0x28000], 0xff
0x1002122c8: mov byte ptr [rdx + rcx - 0x27000], 0xff
0x1002122d0: mov byte ptr [rdx + rcx - 0x26000], 0xff
0x1002122d8: mov byte ptr [rdx + rcx - 0x25000], 0xff
0x1002122e0: mov byte ptr [rdx + rcx - 0x24000], 0xff
0x1002122e8: mov byte ptr [rdx + rcx - 0x23000], 0xff
0x1002122f0: mov byte ptr [rdx + rcx - 0x22000], 0xff
0x1002122f8: mov byte ptr [rdx + rcx - 0x21000], 0xff
0x100212300: mov byte ptr [rdx + rcx - 0x20000], 0xff
0x100212308: mov byte ptr [rdx + rcx - 0x1f000], 0xff
0x100212310: mov byte ptr [rdx + rcx - 0x1e000], 0xff
0x100212318: mov byte ptr [rdx + rcx - 0x1d000], 0xff
0x100212320: mov byte ptr [rdx + rcx - 0x1c000], 0xff
0x100212328: mov byte ptr [rdx + rcx - 0x1b000], 0xff
0x100212330: mov byte ptr [rdx + rcx - 0x1a000], 0xff
0x100212338: mov byte ptr [rdx + rcx - 0x19000], 0xff
0x100212340: mov byte ptr [rdx + rcx - 0x18000], 0xff
0x100212348: mov byte ptr [rdx + rcx - 0x17000], 0xff
0x100212350: mov byte ptr [rdx + rcx - 0x16000], 0xff
0x100212358: mov byte ptr [rdx + rcx - 0x15000], 0xff
0x100212360: mov byte ptr [rdx + rcx - 0x14000], 0xff
0x100212368: mov byte ptr [rdx + rcx - 0x13000], 0xff
0x100212370: mov byte ptr [rdx + rcx - 0x12000], 0xff
0x100212378: mov byte ptr [rdx + rcx - 0x11000], 0xff
0x100212380: mov byte ptr [rdx + rcx - 0x10000], 0xff
0x100212388: mov byte ptr [rdx + rcx - 0xf000], 0xff
0x100212390: mov byte ptr [rdx + rcx - 0xe000], 0xff
0x100212398: mov byte ptr [rdx + rcx - 0xd000], 0xff
0x1002123a0: mov byte ptr [rdx + rcx - 0xc000], 0xff
0x1002123a8: mov byte ptr [rdx + rcx - 0xb000], 0xff
0x1002123b0: mov byte ptr [rdx + rcx - 0xa000], 0xff
0x1002123b8: mov byte ptr [rdx + rcx - 0x9000], 0xff
0x1002123c0: mov byte ptr [rdx + rcx - 0x8000], 0xff
0x1002123c8: mov byte ptr [rdx + rcx - 0x7000], 0xff
0x1002123d0: mov byte ptr [rdx + rcx - 0x6000], 0xff
0x1002123d8: mov byte ptr [rdx + rcx - 0x5000], 0xff
0x1002123e0: mov byte ptr [rdx + rcx - 0x4000], 0xff
0x1002123e8: mov byte ptr [rdx + rcx - 0x3000], 0xff
0x1002123f0: mov byte ptr [rdx + rcx - 0x2000], 0xff
0x1002123f8: mov byte ptr [rdx + rcx - 0x1000], 0xff
0x100212400: mov byte ptr [rdx + rcx], 0xff
0x100212404: mov byte ptr [rdx + rcx + 0x1000], 0xff
0x10021240c: add rcx, 0x40
0x100212410: jne 0x100212210
0x100212416: inc r9
0x100212419: inc rdx
0x10021241c: mov rax, qword ptr [rbp - 0x50]
0x100212420: inc rax
0x100212423: mov rcx, qword ptr [rbp - 0x48]
0x100212427: add rcx, 0x4000
0x10021242e: cmp r9, 0x40
0x100212432: jne 0x1002118a0
0x100212438: lea r12, [rbx + 0x40358]
0x10021243f: lea rsi, [rip + 0x9682c1] ; 0x100b7a707 CloudNoise3D
0x100212446: mov edx, 1
0x10021244b: mov ecx, 0x40
0x100212450: mov r8d, 0x40
0x100212456: mov r9d, 0x40
0x10021245c: mov rdi, r12
0x10021245f: push 0
0x100212461: push 2
0x100212463: vzeroupper 
0x100212466: call 0x1007f0960 ; 0x1007f0960
0x10021246b: add rsp, 0x10
0x10021246f: mov esi, 2
0x100212474: mov rdi, r12
0x100212477: call 0x1007f0c80 ; 0x1007f0c80
0x10021247c: mov rax, qword ptr [rbp - 0x38]
0x100212480: mov qword ptr [rbx + 0x40360], rax
0x100212487: lea rsi, [rbx + 0x358]
0x10021248e: mov rdi, r12
0x100212491: call 0x1007f0e00 ; 0x1007f0e00
0x100212496: add rbx, 0x40d70
0x10021249d: mov rdi, qword ptr [rbp - 0x40]
0x1002124a1: mov rsi, rbx
0x1002124a4: call 0x10031b220 ; 0x10031b220
0x1002124a9: add rsp, 0x88
0x1002124b0: pop rbx
0x1002124b1: pop r12
0x1002124b3: pop r13
0x1002124b5: pop r14
0x1002124b7: pop r15
0x1002124b9: pop rbp
0x1002124ba: ret 
0x1002124bb: nop dword ptr [rax + rax]
