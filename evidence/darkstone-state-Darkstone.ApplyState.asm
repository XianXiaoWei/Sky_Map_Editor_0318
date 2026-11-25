0x10027e530: push rbp
0x10027e531: mov rbp, rsp
0x10027e534: push r15
0x10027e536: push r14
0x10027e538: push rbx
0x10027e539: sub rsp, 0xf8
0x10027e540: vmovss dword ptr [rbp - 0x30], xmm0
0x10027e545: mov r14, rsi
0x10027e548: mov rbx, rdi
0x10027e54b: vmovss xmm2, dword ptr [rip + 0x836b5d] ; 0x100ab50b0
0x10027e553: vmaxss xmm2, xmm2, xmm0
0x10027e557: vmovss xmm0, dword ptr [rip + 0x826b61] ; 0x100aa50c0
0x10027e55f: vminss xmm0, xmm0, xmm2
0x10027e563: vmovss dword ptr [rbp - 0x20], xmm0
0x10027e568: vmovss dword ptr [rbx + 0xd0], xmm0
0x10027e570: vmovss dword ptr [rbp - 0x1c], xmm1
0x10027e575: vmulss xmm0, xmm1, dword ptr [rip + 0x836b53] ; 0x100ab50d0
0x10027e57d: call 0x100aa2708 ; 0x100aa2708 _expf
0x10027e582: vmovss xmm3, dword ptr [rip + 0x826b36] ; 0x100aa50c0
0x10027e58a: vsubss xmm0, xmm3, xmm0
0x10027e58e: vxorps xmm1, xmm1, xmm1
0x10027e592: vmaxss xmm0, xmm1, xmm0
0x10027e596: vminss xmm0, xmm3, xmm0
0x10027e59a: vsubss xmm1, xmm3, xmm0
0x10027e59e: vmulss xmm1, xmm1, dword ptr [rbx + 0xd4]
0x10027e5a6: vmulss xmm0, xmm0, dword ptr [rbp - 0x30]
0x10027e5ab: vaddss xmm0, xmm0, xmm1
0x10027e5af: vmovss xmm1, dword ptr [rip + 0x836af9] ; 0x100ab50b0
0x10027e5b7: vmaxss xmm0, xmm1, xmm0
0x10027e5bb: vminss xmm0, xmm3, xmm0
0x10027e5bf: vmovss dword ptr [rbx + 0xd4], xmm0
0x10027e5c7: mov rax, qword ptr [rbx + 0x10]
0x10027e5cb: test rax, rax
0x10027e5ce: je 0x10027e5da
0x10027e5d0: cmp byte ptr [rax + 0x38], 0
0x10027e5d4: je 0x10027e923
0x10027e5da: vmovss xmm0, dword ptr [rbx + 0x190]
0x10027e5e2: vucomiss xmm3, xmm0
0x10027e5e6: jbe 0x10027e9ae
0x10027e5ec: test r14, r14
0x10027e5ef: je 0x10027e604
0x10027e5f1: vmovss xmm1, dword ptr [r14 + 0x190]
0x10027e5fa: vucomiss xmm1, dword ptr [rip + 0x826abe] ; 0x100aa50c0
0x10027e602: jb 0x10027e641
0x10027e604: vmovss xmm1, dword ptr [rbp - 0x1c]
0x10027e609: vmulss xmm1, xmm1, dword ptr [rbx + 0x194]
0x10027e611: vaddss xmm0, xmm0, xmm1
0x10027e615: vmovss dword ptr [rbx + 0x190], xmm0
0x10027e61d: mov rdi, qword ptr [rbx + 0x28]
0x10027e621: vmovss xmm0, dword ptr [rip + 0x830257] ; 0x100aae880
0x10027e629: xor esi, esi
0x10027e62b: vucomiss xmm0, dword ptr [rbp - 0x20]
0x10027e630: setb sil
0x10027e634: call 0x1003ffe50 ; 0x1003ffe50
0x10027e639: vmovss xmm3, dword ptr [rip + 0x826a7f] ; 0x100aa50c0
0x10027e641: vxorps xmm0, xmm0, xmm0
0x10027e645: vmaxss xmm0, xmm0, dword ptr [rbx + 0x190]
0x10027e64d: vminss xmm0, xmm3, xmm0
0x10027e651: vmovss dword ptr [rbx + 0x190], xmm0
0x10027e659: vsubss xmm1, xmm3, xmm0
0x10027e65d: vcvtss2sd xmm1, xmm1, xmm1
0x10027e661: vmulsd xmm1, xmm1, qword ptr [rip + 0x832a47] ; 0x100ab10b0
0x10027e669: vcvtss2sd xmm0, xmm0, xmm0
0x10027e66d: vaddsd xmm0, xmm1, xmm0
0x10027e671: vcvtsd2ss xmm0, xmm0, xmm0
0x10027e675: vmovaps xmm1, xmmword ptr [rbx + 0x70]
0x10027e67a: test r14, r14
0x10027e67d: jne 0x10027e6cb
0x10027e67f: mov al, byte ptr [rbx + 0xdc]
0x10027e685: test al, al
0x10027e687: jne 0x10027e6cb
0x10027e689: vmovss xmm2, dword ptr [rip + 0x825f27] ; 0x100aa45b8
0x10027e691: vmulss xmm3, xmm1, xmm2
0x10027e695: vmovshdup xmm4, xmm1
0x10027e699: vmulss xmm4, xmm4, dword ptr [rip + 0x828a53] ; 0x100aa70f4
0x10027e6a1: vinsertps xmm3, xmm3, xmm4, 0x10
0x10027e6a7: vpermilpd xmm4, xmm1, 1
0x10027e6ad: vmulss xmm2, xmm4, xmm2
0x10027e6b1: vinsertps xmm2, xmm3, xmm2, 0x20
0x10027e6b7: vsubps xmm1, xmm1, xmm2
0x10027e6bb: vpermilps xmm0, xmm0, 0xc0
0x10027e6c1: vmulps xmm0, xmm1, xmm0
0x10027e6c5: vaddps xmm0, xmm2, xmm0
0x10027e6c9: jmp 0x10027e6d5 ; 0x10027e6d5
0x10027e6cb: vpermilps xmm0, xmm0, 0xc0
0x10027e6d1: vmulps xmm0, xmm1, xmm0
0x10027e6d5: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10027e6da: mov rsi, qword ptr [rbx + 0x28]
0x10027e6de: mov rax, qword ptr [rsi]
0x10027e6e1: lea r14, [rbp - 0xd0]
0x10027e6e8: mov rdi, r14
0x10027e6eb: call qword ptr [rax + 0x18]
0x10027e6ee: vmovaps xmm0, xmmword ptr [rbx + 0x40]
0x10027e6f3: vmovaps xmm1, xmmword ptr [rbx + 0x50]
0x10027e6f8: vmovaps xmm2, xmmword ptr [rbx + 0x60]
0x10027e6fd: vmovaps xmm7, xmmword ptr [rbp - 0x30]
0x10027e702: vpermilps xmm3, xmm7, 0xc0
0x10027e708: vmulps xmm3, xmm3, xmm0
0x10027e70c: vxorps xmm4, xmm4, xmm4
0x10027e710: vmulps xmm5, xmm1, xmm4
0x10027e714: vaddps xmm3, xmm5, xmm3
0x10027e718: vmulps xmm6, xmm2, xmm4
0x10027e71c: vaddps xmm3, xmm6, xmm3
0x10027e720: vmulps xmm0, xmm0, xmm4
0x10027e724: vpermilps xmm4, xmm7, 0xd5
0x10027e72a: vmulps xmm1, xmm1, xmm4
0x10027e72e: vaddps xmm1, xmm1, xmm0
0x10027e732: vaddps xmm1, xmm6, xmm1
0x10027e736: vaddps xmm0, xmm5, xmm0
0x10027e73a: vpermilps xmm4, xmm7, 0xea
0x10027e740: vmulps xmm2, xmm2, xmm4
0x10027e744: vaddps xmm0, xmm2, xmm0
0x10027e748: vblendps xmm2, xmm3, xmmword ptr [rbp - 0xd0], 8
0x10027e752: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x10027e75a: vblendps xmm1, xmm1, xmmword ptr [rbp - 0xc0], 8
0x10027e764: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x10027e76c: vblendps xmm0, xmm0, xmmword ptr [rbp - 0xb0], 8
0x10027e776: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10027e77e: mov rdi, qword ptr [rbx + 0x28]
0x10027e782: mov rsi, r14
0x10027e785: call 0x1003ffe10 ; 0x1003ffe10
0x10027e78a: mov rax, qword ptr [rbx]
0x10027e78d: lea r15, [rbp - 0x110]
0x10027e794: mov rdi, r15
0x10027e797: mov rsi, rbx
0x10027e79a: call qword ptr [rax + 0x20]
0x10027e79d: lea rdi, [rbp - 0x70]
0x10027e7a1: mov rsi, r14
0x10027e7a4: mov rdx, r15
0x10027e7a7: call 0x100076df0 ; 0x100076df0
0x10027e7ac: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10027e7b1: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10027e7b9: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10027e7be: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x10027e7c6: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10027e7cb: vmovaps xmmword ptr [rbx + 0xa0], xmm0
0x10027e7d3: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10027e7d8: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x10027e7e0: vmovaps xmm0, xmmword ptr [rip + 0xaacca8] ; 0x100d2b490
0x10027e7e8: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10027e7ed: vmovss xmm0, dword ptr [rbp - 0x1c]
0x10027e7f2: vmulss xmm0, xmm0, dword ptr [rip + 0x82c546] ; 0x100aaad40
0x10027e7fa: call 0x100aa2708 ; 0x100aa2708 _expf
0x10027e7ff: vmovss xmm1, dword ptr [rip + 0x8268b9] ; 0x100aa50c0
0x10027e807: vmovaps xmm2, xmm1
0x10027e80b: vsubss xmm0, xmm2, xmm0
0x10027e80f: vxorps xmm1, xmm1, xmm1
0x10027e813: vmaxss xmm0, xmm1, xmm0
0x10027e817: vminss xmm0, xmm2, xmm0
0x10027e81b: vsubss xmm1, xmm2, xmm0
0x10027e81f: vpermilps xmm1, xmm1, 0
0x10027e825: vmulps xmm1, xmm1, xmmword ptr [rbx + 0x150]
0x10027e82d: vpermilps xmm0, xmm0, 0
0x10027e833: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x10027e838: vaddps xmm0, xmm0, xmm1
0x10027e83c: vmovaps xmmword ptr [rbx + 0x150], xmm0
0x10027e844: mov rdi, qword ptr [rbx + 0x28]
0x10027e848: mov qword ptr [rbp - 0x60], 0
0x10027e850: mov byte ptr [rbp - 0x70], 0x1c
0x10027e854: movabs rax, 0x726f6c6f43657375
0x10027e85e: mov qword ptr [rbp - 0x69], rax
0x10027e862: movabs rax, 0x7375666669645f75
0x10027e86c: mov qword ptr [rbp - 0x6f], rax
0x10027e870: mov byte ptr [rbp - 0x61], 0
0x10027e874: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10027e87c: lea rdx, [rbp - 0x70]
0x10027e880: lea rcx, [rbp - 0x90]
0x10027e887: xor esi, esi
0x10027e889: vxorps xmm0, xmm0, xmm0
0x10027e88d: call 0x1003fff20 ; 0x1003fff20
0x10027e892: test byte ptr [rbp - 0x70], 1
0x10027e896: je 0x10027e8ac
0x10027e898: mov r14, qword ptr [rbp - 0x60]
0x10027e89c: call 0x1007e50d0 ; 0x1007e50d0
0x10027e8a1: mov rdi, rax
0x10027e8a4: mov rsi, r14
0x10027e8a7: call 0x1007e5db0 ; 0x1007e5db0
0x10027e8ac: cmp byte ptr [rbx + 0x30], 0
0x10027e8b0: je 0x10027e9ae
0x10027e8b6: mov rdi, qword ptr [rbx + 0x28]
0x10027e8ba: vxorps xmm0, xmm0, xmm0
0x10027e8be: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027e8c3: mov qword ptr [rbp - 0x60], 0
0x10027e8cb: mov byte ptr [rbp - 0x70], 0x18
0x10027e8cf: movabs rax, 0x4373746f70735f75
0x10027e8d9: mov qword ptr [rbp - 0x6f], rax
0x10027e8dd: mov dword ptr [rbp - 0x67], 0x726f6c6f
0x10027e8e4: mov byte ptr [rbp - 0x63], 0
0x10027e8e8: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10027e8ed: lea rdx, [rbp - 0x70]
0x10027e8f1: lea rcx, [rbp - 0x80]
0x10027e8f5: xor esi, esi
0x10027e8f7: vxorps xmm0, xmm0, xmm0
0x10027e8fb: call 0x1003fff20 ; 0x1003fff20
0x10027e900: test byte ptr [rbp - 0x70], 1
0x10027e904: je 0x10027e9ae
0x10027e90a: mov rbx, qword ptr [rbp - 0x60]
0x10027e90e: call 0x1007e50d0 ; 0x1007e50d0
0x10027e913: mov rdi, rax
0x10027e916: mov rsi, rbx
0x10027e919: call 0x1007e5db0 ; 0x1007e5db0
0x10027e91e: jmp 0x10027e9ae ; 0x10027e9ae
0x10027e923: vmovss xmm0, dword ptr [rbx + 0x190]
0x10027e92b: vxorps xmm1, xmm1, xmm1
0x10027e92f: vucomiss xmm0, xmm1
0x10027e933: jbe 0x10027e9ae
0x10027e935: mov eax, dword ptr [rbx + 0x104]
0x10027e93b: test eax, eax
0x10027e93d: je 0x10027e97c
0x10027e93f: mov rcx, qword ptr [rbx + 0x18]
0x10027e943: mov edx, dword ptr [rcx + 0x1b220]
0x10027e949: xor esi, esi
0x10027e94b: vxorps xmm1, xmm1, xmm1
0x10027e94f: nop 
0x10027e950: mov edi, dword ptr [rbx + rsi*4 + 0xe4]
0x10027e957: cmp edx, edi
0x10027e959: jbe 0x10027e975
0x10027e95b: imul rdi, rdi, 0x1a0
0x10027e962: vmovss xmm2, dword ptr [rcx + rdi + 0x13b0]
0x10027e96b: vucomiss xmm2, xmm1
0x10027e96f: ja 0x10027e641
0x10027e975: inc rsi
0x10027e978: cmp eax, esi
0x10027e97a: ja 0x10027e950
0x10027e97c: vmovss xmm1, dword ptr [rbp - 0x1c]
0x10027e981: vmulss xmm1, xmm1, dword ptr [rbx + 0x194]
0x10027e989: vsubss xmm0, xmm0, xmm1
0x10027e98d: vmovss dword ptr [rbx + 0x190], xmm0
0x10027e995: vxorps xmm1, xmm1, xmm1
0x10027e999: vucomiss xmm1, xmm0
0x10027e99d: jb 0x10027e641
0x10027e9a3: mov rdi, qword ptr [rbx + 0x28]
0x10027e9a7: xor esi, esi
0x10027e9a9: jmp 0x10027e634 ; 0x10027e634
0x10027e9ae: add rsp, 0xf8
0x10027e9b5: pop rbx
0x10027e9b6: pop r14
0x10027e9b8: pop r15
0x10027e9ba: pop rbp
0x10027e9bb: ret 
0x10027e9bc: mov rdi, rax
0x10027e9bf: call 0x100011bf0 ; 0x100011bf0
0x10027e9c4: mov rbx, rax
0x10027e9c7: test byte ptr [rbp - 0x70], 1
0x10027e9cb: je 0x10027ea10
0x10027e9cd: mov r14, qword ptr [rbp - 0x60]
0x10027e9d1: call 0x1007e50d0 ; 0x1007e50d0
0x10027e9d6: mov rdi, rax
0x10027e9d9: mov rsi, r14
0x10027e9dc: call 0x1007e5db0 ; 0x1007e5db0
0x10027e9e1: jmp 0x10027ea10 ; 0x10027ea10
0x10027e9e3: mov rdi, rax
0x10027e9e6: call 0x100011bf0 ; 0x100011bf0
0x10027e9eb: mov rdi, rax
0x10027e9ee: call 0x100011bf0 ; 0x100011bf0
0x10027e9f3: mov rbx, rax
0x10027e9f6: test byte ptr [rbp - 0x70], 1
0x10027e9fa: je 0x10027ea10
0x10027e9fc: mov r14, qword ptr [rbp - 0x60]
0x10027ea00: call 0x1007e50d0 ; 0x1007e50d0
0x10027ea05: mov rdi, rax
0x10027ea08: mov rsi, r14
0x10027ea0b: call 0x1007e5db0 ; 0x1007e5db0
0x10027ea10: mov rdi, rbx
0x10027ea13: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10027ea18: mov rdi, rax
0x10027ea1b: call 0x100011bf0 ; 0x100011bf0

