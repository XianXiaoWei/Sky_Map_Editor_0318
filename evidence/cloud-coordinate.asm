0x100216670: push rbp
0x100216671: mov rbp, rsp
0x100216674: push r15
0x100216676: push r14
0x100216678: push r12
0x10021667a: push rbx
0x10021667b: sub rsp, 0x40
0x10021667f: mov ebx, r9d
0x100216682: mov r12, rcx
0x100216685: mov r14, rdx
0x100216688: mov r15, rsi
0x10021668b: vmovaps xmm1, xmmword ptr [rdi]
0x10021668f: vpermilps xmm0, xmm0, 0xc0
0x100216695: vdivps xmm0, xmm1, xmm0
0x100216699: vmovd xmm1, dword ptr [r8]
0x10021669e: vpinsrd xmm1, xmm1, dword ptr [r8 + 4], 1
0x1002166a5: vpinsrd xmm1, xmm1, dword ptr [r8 + 8], 2
0x1002166ac: vcvtdq2ps xmm1, xmm1
0x1002166b0: mov eax, ebx
0x1002166b2: vcvtsi2ss xmm2, xmm2, rax
0x1002166b7: vmovss dword ptr [rbp - 0x2c], xmm2
0x1002166bc: vmovd xmm2, ebx
0x1002166c0: vpshufd xmm2, xmm2, 0xc0
0x1002166c5: vpblendw xmm3, xmm2, xmmword ptr [rip + 0x8923c1], 0xaa ; 0x100aa8a90
0x1002166cf: vpsrld xmm2, xmm2, 0x10
0x1002166d4: vpblendw xmm2, xmm2, xmmword ptr [rip + 0x8923c2], 0xaa ; 0x100aa8aa0
0x1002166de: vaddps xmm2, xmm2, xmmword ptr [rip + 0x8923ca] ; 0x100aa8ab0
0x1002166e6: vaddps xmm2, xmm3, xmm2
0x1002166ea: vmulps xmm1, xmm2, xmm1
0x1002166ee: vsubps xmm1, xmm0, xmm1
0x1002166f2: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1002166f7: vroundss xmm0, xmm1, xmm1, 9
0x1002166fd: vsubss xmm0, xmm1, xmm0
0x100216701: vaddss xmm0, xmm0, dword ptr [rip + 0x88deaf] ; 0x100aa45b8
0x100216709: vmovss xmm1, dword ptr [rip + 0x88e9af] ; 0x100aa50c0
0x100216711: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100216716: vmovss dword ptr [rbp - 0x24], xmm0
0x10021671b: vmovss dword ptr [r12], xmm0
0x100216721: vmovshdup xmm1, xmmword ptr [rbp - 0x40]
0x100216726: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x10021672b: vroundss xmm0, xmm1, xmm1, 9
0x100216731: vsubss xmm0, xmm1, xmm0
0x100216735: vaddss xmm0, xmm0, dword ptr [rip + 0x88de7b] ; 0x100aa45b8
0x10021673d: vmovss xmm1, dword ptr [rip + 0x88e97b] ; 0x100aa50c0
0x100216745: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10021674a: vmovss dword ptr [rbp - 0x28], xmm0
0x10021674f: vmovss dword ptr [r12 + 4], xmm0
0x100216756: vpermilpd xmm1, xmmword ptr [rbp - 0x40], 1
0x10021675d: vmovapd xmmword ptr [rbp - 0x50], xmm1
0x100216762: vroundss xmm0, xmm1, xmm1, 9
0x100216768: vsubss xmm0, xmm1, xmm0
0x10021676c: vaddss xmm0, xmm0, dword ptr [rip + 0x88de44] ; 0x100aa45b8
0x100216774: vmovss xmm1, dword ptr [rip + 0x88e944] ; 0x100aa50c0
0x10021677c: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100216781: vmovss dword ptr [r12 + 8], xmm0
0x100216788: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10021678d: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x100216792: vdivss xmm1, xmm3, xmm2
0x100216796: vroundss xmm1, xmm1, xmm1, 9
0x10021679c: vcvttss2si eax, xmm1
0x1002167a0: mov dword ptr [r15], eax
0x1002167a3: vmovaps xmm5, xmmword ptr [rbp - 0x60]
0x1002167a8: vdivss xmm1, xmm5, xmm2
0x1002167ac: vroundss xmm1, xmm1, xmm1, 9
0x1002167b2: vcvttss2si ecx, xmm1
0x1002167b6: mov dword ptr [r15 + 4], ecx
0x1002167ba: vmovaps xmm6, xmmword ptr [rbp - 0x50]
0x1002167bf: vdivss xmm1, xmm6, xmm2
0x1002167c3: vroundss xmm1, xmm1, xmm1, 9
0x1002167c9: vcvttss2si ecx, xmm1
0x1002167cd: mov dword ptr [r15 + 8], ecx
0x1002167d1: imul eax, ebx
0x1002167d4: vcvtsi2ss xmm1, xmm4, rax
0x1002167d9: vsubss xmm1, xmm3, xmm1
0x1002167dd: vroundss xmm1, xmm1, xmm1, 9
0x1002167e3: vmovss xmm3, dword ptr [rip + 0x88ddcd] ; 0x100aa45b8
0x1002167eb: vcmpless xmm2, xmm3, dword ptr [rbp - 0x24]
0x1002167f1: vmovss xmm4, dword ptr [rip + 0x88e8c7] ; 0x100aa50c0
0x1002167f9: vandps xmm2, xmm2, xmm4
0x1002167fd: vsubss xmm1, xmm1, xmm2
0x100216801: vcvttss2si eax, xmm1
0x100216805: mov dword ptr [r14], eax
0x100216808: mov eax, dword ptr [r15 + 4]
0x10021680c: imul eax, ebx
0x10021680f: vcvtsi2ss xmm1, xmm7, rax
0x100216814: vsubss xmm1, xmm5, xmm1
0x100216818: vroundss xmm1, xmm1, xmm1, 9
0x10021681e: vcmpless xmm2, xmm3, dword ptr [rbp - 0x28]
0x100216824: vandps xmm2, xmm2, xmm4
0x100216828: vsubss xmm1, xmm1, xmm2
0x10021682c: vcvttss2si eax, xmm1
0x100216830: mov dword ptr [r14 + 4], eax
0x100216834: imul ebx, dword ptr [r15 + 8]
0x100216839: vcvtsi2ss xmm1, xmm7, rbx
0x10021683e: vsubss xmm1, xmm6, xmm1
0x100216842: vroundss xmm1, xmm1, xmm1, 9
0x100216848: vcmpless xmm0, xmm3, xmm0
0x10021684d: vandps xmm0, xmm0, xmm4
0x100216851: vsubss xmm0, xmm1, xmm0
0x100216855: vcvttss2si eax, xmm0
0x100216859: mov dword ptr [r14 + 8], eax
0x10021685d: add rsp, 0x40
0x100216861: pop rbx
0x100216862: pop r12
0x100216864: pop r14
0x100216866: pop r15
0x100216868: pop rbp
0x100216869: ret 
0x10021686a: nop word ptr [rax + rax]
