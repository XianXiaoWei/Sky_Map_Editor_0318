0x1004d5190: push rbp
0x1004d5191: mov rbp, rsp
0x1004d5194: push r15
0x1004d5196: push r14
0x1004d5198: push r13
0x1004d519a: push r12
0x1004d519c: push rbx
0x1004d519d: sub rsp, 0x238
0x1004d51a4: mov qword ptr [rbp - 0x50], rcx
0x1004d51a8: mov r13, rdx
0x1004d51ab: mov r12, rsi
0x1004d51ae: mov r14, rdi
0x1004d51b1: mov r15, qword ptr [r12 + 0x2c8]
0x1004d51b9: mov rsi, qword ptr [r12 + 0x70]
0x1004d51be: lea rbx, [rbp - 0xc0]
0x1004d51c5: mov rdi, rbx
0x1004d51c8: call 0x10076be90 ; 0x10076be90
0x1004d51cd: lea rdi, [rbp - 0x240]
0x1004d51d4: mov rsi, r15
0x1004d51d7: mov rdx, rbx
0x1004d51da: call 0x100328200 ; 0x100328200
0x1004d51df: vmovaps xmm0, xmmword ptr [rbp - 0x240]
0x1004d51e7: vmulps xmm0, xmm0, xmmword ptr [rip + 0x5df751] ; 0x100ab4940
0x1004d51ef: mov rax, qword ptr [r12 + 0x160]
0x1004d51f7: lea rcx, [rip + 0x1b25ed2] ; 0x101ffb0d0
0x1004d51fe: cmp byte ptr [rcx], 0
0x1004d5201: je 0x1004d5210
0x1004d5203: lea rcx, [rip + 0x7e3336] ; 0x100cb8540
0x1004d520a: vmovss xmm1, dword ptr [rcx]
0x1004d520e: jmp 0x1004d5218 ; 0x1004d5218
0x1004d5210: vmovss xmm1, dword ptr [rip + 0x5cfea8] ; 0x100aa50c0
0x1004d5218: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1004d521d: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1004d5222: vmovss xmm2, dword ptr [rip + 0x5d1872] ; 0x100aa6a9c
0x1004d522a: vmaxss xmm1, xmm2, xmm1
0x1004d522e: vmovss xmm2, dword ptr [rip + 0x5d186a] ; 0x100aa6aa0
0x1004d5236: vminss xmm1, xmm2, xmm1
0x1004d523a: vpermilps xmm1, xmm1, 0xc0
0x1004d5240: vmulps xmm0, xmm0, xmm1
0x1004d5244: vmovaps xmm1, xmmword ptr [r14 + 0x13b0]
0x1004d524d: vsubps xmm0, xmm1, xmm0
0x1004d5251: vmovaps xmmword ptr [r14 + 0x13b0], xmm0
0x1004d525a: mov rdi, qword ptr [r12 + 0x280]
0x1004d5262: call 0x1000ff210 ; 0x1000ff210
0x1004d5267: mov rbx, rax
0x1004d526a: test rbx, rbx
0x1004d526d: je 0x1004d5d3d
0x1004d5273: mov r15, qword ptr [rbx + 0x18]
0x1004d5277: mov rax, qword ptr [rbx + 0x20]
0x1004d527b: mov qword ptr [rbp - 0x108], rax
0x1004d5282: mov rsi, qword ptr [r12 + 0x70]
0x1004d5287: mov rdx, qword ptr [r12 + 0x2c8]
0x1004d528f: mov rdi, r14
0x1004d5292: call 0x1004d5f00 ; 0x1004d5f00
0x1004d5297: mov rsi, qword ptr [r12 + 0x70]
0x1004d529c: lea rdi, [rbp - 0x150]
0x1004d52a3: call 0x10076be90 ; 0x10076be90
0x1004d52a8: vxorps xmm0, xmm0, xmm0
0x1004d52ac: vucomiss xmm0, dword ptr [rbp - 0x14c]
0x1004d52b4: mov qword ptr [rbp - 0x40], r14
0x1004d52b8: mov qword ptr [rbp - 0x68], r12
0x1004d52bc: mov qword ptr [rbp - 0xf0], r15
0x1004d52c3: mov qword ptr [rbp - 0x80], r13
0x1004d52c7: mov qword ptr [rbp - 0xe0], rbx
0x1004d52ce: jbe 0x1004d52da
0x1004d52d0: mov al, 1
0x1004d52d2: mov dword ptr [rbp - 0x60], eax
0x1004d52d5: jmp 0x1004d53a3 ; 0x1004d53a3
0x1004d52da: xor r13d, r13d
0x1004d52dd: cmp dword ptr [r14 + 0x13c8], 0
0x1004d52e5: je 0x1004d5398
0x1004d52eb: mov al, 1
0x1004d52ed: mov dword ptr [rbp - 0x60], eax
0x1004d52f0: lea rbx, [r14 + 0x13e0]
0x1004d52f7: lea r14, [rbp - 0x1c0]
0x1004d52fe: lea r15, [rbp - 0xc0]
0x1004d5305: lea r12, [rbp - 0x180]
0x1004d530c: nop dword ptr [rax]
0x1004d5310: vmovss xmm0, dword ptr [rip + 0x5cf2a0] ; 0x100aa45b8
0x1004d5318: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004d5320: vmovaps xmm0, xmmword ptr [rip + 0x5d25c8] ; 0x100aa78f0
0x1004d5328: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1004d5330: vmovaps xmm0, xmmword ptr [rip + 0x5dd2a8] ; 0x100ab25e0
0x1004d5338: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d5340: vmovaps xmm0, xmmword ptr [rip + 0x5d36b8] ; 0x100aa8a00
0x1004d5348: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1004d5350: mov rdi, r14
0x1004d5353: mov rsi, rbx
0x1004d5356: mov rdx, r15
0x1004d5359: call 0x100076df0 ; 0x100076df0
0x1004d535e: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x1004d5366: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1004d536e: mov rdi, r12
0x1004d5371: mov rsi, r14
0x1004d5374: call 0x10078ccc0 ; 0x10078ccc0
0x1004d5379: test al, al
0x1004d537b: jne 0x1004d539f
0x1004d537d: inc r13d
0x1004d5380: add rbx, 0x5d0
0x1004d5387: mov rax, qword ptr [rbp - 0x40]
0x1004d538b: cmp dword ptr [rax + 0x13c8], r13d
0x1004d5392: ja 0x1004d5310
0x1004d5398: mov dword ptr [rbp - 0x60], 0
0x1004d539f: mov r12, qword ptr [rbp - 0x68]
0x1004d53a3: mov rsi, qword ptr [r12 + 0x298]
0x1004d53ab: add rsi, 0x1b0
0x1004d53b2: lea rdi, [rbp - 0x140]
0x1004d53b9: call 0x1001e0cf0 ; 0x1001e0cf0
0x1004d53be: vxorps xmm0, xmm0, xmm0
0x1004d53c2: vucomiss xmm0, dword ptr [rbp - 0x13c]
0x1004d53ca: ja 0x1004d54cf
0x1004d53d0: mov rax, qword ptr [rbp - 0x40]
0x1004d53d4: cmp dword ptr [rax + 0x13c8], 0
0x1004d53db: je 0x1004d5498
0x1004d53e1: mov rax, qword ptr [rbp - 0x40]
0x1004d53e5: lea rbx, [rax + 0x13e0]
0x1004d53ec: xor r13d, r13d
0x1004d53ef: lea r15, [rbp - 0x1c0]
0x1004d53f6: lea r14, [rbp - 0xc0]
0x1004d53fd: lea r12, [rbp - 0x180]
0x1004d5404: nop word ptr cs:[rax + rax]
0x1004d5410: vmovss xmm0, dword ptr [rip + 0x5cf1a0] ; 0x100aa45b8
0x1004d5418: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004d5420: vmovaps xmm0, xmmword ptr [rip + 0x5d24c8] ; 0x100aa78f0
0x1004d5428: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1004d5430: vmovaps xmm0, xmmword ptr [rip + 0x5dd1a8] ; 0x100ab25e0
0x1004d5438: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d5440: vmovaps xmm0, xmmword ptr [rip + 0x5d35b8] ; 0x100aa8a00
0x1004d5448: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1004d5450: mov rdi, r15
0x1004d5453: mov rsi, rbx
0x1004d5456: mov rdx, r14
0x1004d5459: call 0x100076df0 ; 0x100076df0
0x1004d545e: vmovaps xmm0, xmmword ptr [rbp - 0x140]
0x1004d5466: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1004d546e: mov rdi, r12
0x1004d5471: mov rsi, r15
0x1004d5474: call 0x10078ccc0 ; 0x10078ccc0
0x1004d5479: test al, al
0x1004d547b: jne 0x1004d54cf
0x1004d547d: inc r13d
0x1004d5480: add rbx, 0x5d0
0x1004d5487: mov rax, qword ptr [rbp - 0x40]
0x1004d548b: cmp dword ptr [rax + 0x13c8], r13d
0x1004d5492: ja 0x1004d5410
0x1004d5498: mov ecx, dword ptr [rbp - 0x60]
0x1004d549b: test cl, cl
0x1004d549d: mov rbx, qword ptr [rbp - 0x50]
0x1004d54a1: je 0x1004d5d78
0x1004d54a7: mov r13, qword ptr [rbp - 0x68]
0x1004d54ab: mov rdi, qword ptr [r13 + 0x5c8]
0x1004d54b2: vmovss xmm0, dword ptr [rip + 0x5e7262] ; 0x100abc71c
0x1004d54ba: vmovss xmm1, dword ptr [rip + 0x5d310e] ; 0x100aa85d0
0x1004d54c2: xor esi, esi
0x1004d54c4: call 0x100603040 ; 0x100603040
0x1004d54c9: mov r15, qword ptr [rbp - 0x40]
0x1004d54cd: jmp 0x1004d54ff ; 0x1004d54ff
0x1004d54cf: cmp byte ptr [rbp - 0x60], 0
0x1004d54d3: mov r15, qword ptr [rbp - 0x40]
0x1004d54d7: mov r13, qword ptr [rbp - 0x68]
0x1004d54db: mov rbx, qword ptr [rbp - 0x50]
0x1004d54df: jne 0x1004d54ff
0x1004d54e1: mov rdi, qword ptr [r13 + 0x5c8]
0x1004d54e8: vmovss xmm0, dword ptr [rip + 0x5d5a50] ; 0x100aaaf40
0x1004d54f0: vmovss xmm1, dword ptr [rip + 0x5d30d8] ; 0x100aa85d0
0x1004d54f8: xor esi, esi
0x1004d54fa: call 0x100603040 ; 0x100603040
0x1004d54ff: mov rdi, rbx
0x1004d5502: call 0x100257030 ; 0x100257030
0x1004d5507: mov qword ptr [rbp - 0x1c0], rax
0x1004d550e: call 0x100255de0 ; 0x100255de0
0x1004d5513: mov r14, rax
0x1004d5516: mov qword ptr [rbp - 0xc0], 0
0x1004d5521: call 0x10029fe80 ; 0x10029fe80
0x1004d5526: mov rbx, qword ptr [rax]
0x1004d5529: lea rsi, [rbp - 0xc0]
0x1004d5530: lea rdx, [rbp - 0x1c0]
0x1004d5537: mov rdi, rax
0x1004d553a: mov rcx, r14
0x1004d553d: call qword ptr [rbx + 0x40]
0x1004d5540: cmp qword ptr [rbp - 0xc0], 0
0x1004d5548: je 0x1004d555c
0x1004d554a: lea rdi, [rbp - 0x130]
0x1004d5551: mov rsi, qword ptr [rbp - 0x80]
0x1004d5555: call 0x10076be90 ; 0x10076be90
0x1004d555a: jmp 0x1004d5570 ; 0x1004d5570
0x1004d555c: mov rax, qword ptr [rbp - 0xf0]
0x1004d5563: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1004d5568: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x1004d5570: mov rbx, qword ptr [rbp - 0x108]
0x1004d5577: mov rsi, qword ptr [rbx + 0x258]
0x1004d557e: lea rdi, [rbp - 0x230]
0x1004d5585: call 0x1007f26b0 ; 0x1007f26b0
0x1004d558a: mov rsi, qword ptr [rbx + 0x260]
0x1004d5591: lea rdi, [rbp - 0xc0]
0x1004d5598: call 0x1007f26b0 ; 0x1007f26b0
0x1004d559d: vmovaps xmm0, xmmword ptr [rbp - 0x230]
0x1004d55a5: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xc0]
0x1004d55ad: vmulps xmm0, xmm0, xmmword ptr [rip + 0x5d20bb] ; 0x100aa7670
0x1004d55b5: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1004d55bd: vmovaps xmm0, xmmword ptr [rbp - 0x130]
0x1004d55c5: vsubps xmm0, xmm0, xmmword ptr [rip + 0x5d9e63] ; 0x100aaf430
0x1004d55cd: vdivps xmm0, xmm0, xmmword ptr [rip + 0x5f006b] ; 0x100ac5640
0x1004d55d5: vroundss xmm1, xmm0, xmm0, 9
0x1004d55db: vmovshdup xmm2, xmm0
0x1004d55df: vroundss xmm2, xmm2, xmm2, 9
0x1004d55e5: vpermilpd xmm0, xmm0, 1
0x1004d55eb: vroundss xmm0, xmm0, xmm0, 9
0x1004d55f1: vinsertps xmm1, xmm1, xmm2, 0x10
0x1004d55f7: vinsertps xmm0, xmm1, xmm0, 0x20
0x1004d55fd: vmulps xmm1, xmm0, xmm0
0x1004d5601: vmovshdup xmm2, xmm1
0x1004d5605: vaddss xmm2, xmm1, xmm2
0x1004d5609: vpermilpd xmm1, xmm1, 1
0x1004d560f: vaddss xmm1, xmm1, xmm2
0x1004d5613: vmovss xmm2, dword ptr [rip + 0x5d3061] ; 0x100aa867c
0x1004d561b: vucomiss xmm2, xmm1
0x1004d561f: vxorps xmm1, xmm1, xmm1
0x1004d5623: ja 0x1004d5629
0x1004d5625: vmovaps xmm1, xmm0
0x1004d5629: mov al, byte ptr [rip + 0x856db1] ; 0x100d2c3e0
0x1004d562f: test al, al
0x1004d5631: mov rbx, qword ptr [rbp - 0xf0]
0x1004d5638: vmovaps xmmword ptr [rbp - 0x80], xmm1
0x1004d563d: jne 0x1004d566d
0x1004d563f: lea rdi, [rip + 0x856d9a] ; 0x100d2c3e0
0x1004d5646: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1004d564b: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1004d5650: test eax, eax
0x1004d5652: je 0x1004d566d
0x1004d5654: vmovaps xmmword ptr [rip + 0x856d74], xmm1 ; 0x100d2c3d0
0x1004d565c: lea rdi, [rip + 0x856d7d] ; 0x100d2c3e0
0x1004d5663: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1004d5668: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1004d566d: vmovaps xmm0, xmmword ptr [rip + 0x856d5b] ; 0x100d2c3d0
0x1004d5675: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1004d567d: vmovaps xmmword ptr [rip + 0x856d4b], xmm1 ; 0x100d2c3d0
0x1004d5685: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1004d568a: vmulps xmm0, xmm0, xmm0
0x1004d568e: vmovshdup xmm1, xmm0
0x1004d5692: vaddss xmm1, xmm0, xmm1
0x1004d5696: vpermilpd xmm0, xmm0, 1
0x1004d569c: vaddss xmm0, xmm0, xmm1
0x1004d56a0: vsqrtss xmm0, xmm0, xmm0
0x1004d56a4: vmovss dword ptr [rbp - 0x50], xmm0
0x1004d56a9: mov rdi, qword ptr [r13 + 0x3b8]
0x1004d56b0: lea rsi, [rbp - 0x100]
0x1004d56b7: lea rdx, [rbp - 0x6c]
0x1004d56bb: lea rcx, [rbp - 0x220]
0x1004d56c2: xor r12d, r12d
0x1004d56c5: xor r8d, r8d
0x1004d56c8: call 0x1002149c0 ; 0x1002149c0
0x1004d56cd: vmovss xmm0, dword ptr [rbp - 0x6c]
0x1004d56d2: vbroadcastss xmm1, dword ptr [rip + 0x5d4da5] ; 0x100aaa480
0x1004d56db: vxorps xmm1, xmm0, xmm1
0x1004d56df: vmovss dword ptr [rbp - 0x6c], xmm1
0x1004d56e4: vcvtss2sd xmm0, xmm0, xmm0
0x1004d56e8: lea rax, [rip + 0x7c0125] ; 0x100c95814
0x1004d56ef: vmovss xmm1, dword ptr [rax]
0x1004d56f3: vcvtss2sd xmm1, xmm1, xmm1
0x1004d56f7: vmovsd xmm2, qword ptr [rip + 0x5d7489] ; 0x100aacb88
0x1004d56ff: vsubsd xmm1, xmm2, xmm1
0x1004d5703: vdivsd xmm0, xmm0, xmm1
0x1004d5707: vmovsd xmm1, qword ptr [rip + 0x5d07a1] ; 0x100aa5eb0
0x1004d570f: vaddsd xmm0, xmm0, xmm1
0x1004d5713: vxorpd xmm2, xmm2, xmm2
0x1004d5717: vmaxsd xmm0, xmm2, xmm0
0x1004d571b: vminsd xmm0, xmm1, xmm0
0x1004d571f: vcvtsd2ss xmm0, xmm0, xmm0
0x1004d5723: vmovss xmm1, dword ptr [rbp - 0x21c]
0x1004d572b: vaddss xmm1, xmm1, dword ptr [rip + 0x5cee85] ; 0x100aa45b8
0x1004d5733: vmulss xmm1, xmm1, dword ptr [rip + 0x5d3f49] ; 0x100aa9684
0x1004d573b: vxorpd xmm2, xmm2, xmm2
0x1004d573f: vmaxss xmm1, xmm2, xmm1
0x1004d5743: vmovss xmm2, dword ptr [rip + 0x5cf975] ; 0x100aa50c0
0x1004d574b: vminss xmm1, xmm2, xmm1
0x1004d574f: vmovss dword ptr [rbp - 0x120], xmm1
0x1004d5757: vmovss xmm1, dword ptr [rbp - 0x50]
0x1004d575c: vmulss xmm1, xmm1, dword ptr [rip + 0x5d60d8] ; 0x100aab83c
0x1004d5764: vmulss xmm0, xmm1, xmm0
0x1004d5768: vmovss dword ptr [rbp - 0xc4], xmm0
0x1004d5770: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x1004d5778: vaddps xmm0, xmm0, xmmword ptr [rip + 0x5d3ab0] ; 0x100aa9230
0x1004d5780: vmovaps xmmword ptr [rbp - 0x210], xmm0
0x1004d5788: vmovaps xmmword ptr [rbp - 0x1f0], xmm0
0x1004d5790: vmovddup xmm0, qword ptr [rip + 0x5de490] ; 0x100ab3c28
0x1004d5798: vmovapd xmmword ptr [rbp - 0x50], xmm0
0x1004d579d: vmovapd xmmword ptr [rbp - 0x1e0], xmm0
0x1004d57a5: lea rsi, [rbp - 0x1f0]
0x1004d57ac: lea rdx, [rbp - 0x1e0]
0x1004d57b3: lea rcx, [rbp - 0x200]
0x1004d57ba: lea r8, [rbp - 0x260]
0x1004d57c1: xor r9d, r9d
0x1004d57c4: mov rdi, r15
0x1004d57c7: vmovaps xmm0, xmm2
0x1004d57cb: call 0x1004d6220 ; 0x1004d6220
0x1004d57d0: mov byte ptr [rbp - 0x60], al
0x1004d57d3: mov rdi, qword ptr [r13 + 0x138]
0x1004d57da: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1004d57df: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004d57e7: lea rsi, [rbp - 0x210]
0x1004d57ee: lea rdx, [rbp - 0xc0]
0x1004d57f5: lea r8, [rbp - 0x180]
0x1004d57fc: xor ecx, ecx
0x1004d57fe: vmovss xmm0, dword ptr [rip + 0x5cf8ba] ; 0x100aa50c0
0x1004d5806: call 0x100776a90 ; 0x100776a90
0x1004d580b: mov byte ptr [rbp - 0x29], al
0x1004d580e: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x1004d5816: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1004d581b: vmovshdup xmm0, xmm0
0x1004d581f: vxorps xmm1, xmm1, xmm1
0x1004d5823: vucomiss xmm1, xmm0
0x1004d5827: ja 0x1004d595d
0x1004d582d: mov rax, qword ptr [rbp - 0x40]
0x1004d5831: cmp dword ptr [rax + 0x13c8], 0
0x1004d5838: je 0x1004d58f0
0x1004d583e: mov rax, qword ptr [rbp - 0x40]
0x1004d5842: lea rbx, [rax + 0x13e0]
0x1004d5849: xor r13d, r13d
0x1004d584c: lea r15, [rbp - 0x1c0]
0x1004d5853: lea r14, [rbp - 0x250]
0x1004d585a: nop word ptr [rax + rax]
0x1004d5860: vmovss xmm0, dword ptr [rip + 0x5ced50] ; 0x100aa45b8
0x1004d5868: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004d5870: vmovaps xmm0, xmmword ptr [rip + 0x5d2078] ; 0x100aa78f0
0x1004d5878: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1004d5880: vmovaps xmm0, xmmword ptr [rip + 0x5dcd58] ; 0x100ab25e0
0x1004d5888: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d5890: vmovaps xmm0, xmmword ptr [rip + 0x5d3168] ; 0x100aa8a00
0x1004d5898: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1004d58a0: mov rdi, r15
0x1004d58a3: mov rsi, rbx
0x1004d58a6: lea rdx, [rbp - 0xc0]
0x1004d58ad: call 0x100076df0 ; 0x100076df0
0x1004d58b2: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1004d58b7: vmovaps xmmword ptr [rbp - 0x250], xmm0
0x1004d58bf: mov rdi, r14
0x1004d58c2: mov rsi, r15
0x1004d58c5: call 0x10078ccc0 ; 0x10078ccc0
0x1004d58ca: test al, al
0x1004d58cc: jne 0x1004d595d
0x1004d58d2: mov rax, qword ptr [rbp - 0x40]
0x1004d58d6: mov r12d, dword ptr [rax + 0x13c8]
0x1004d58dd: inc r13d
0x1004d58e0: add rbx, 0x5d0
0x1004d58e7: cmp r12d, r13d
0x1004d58ea: ja 0x1004d5860
0x1004d58f0: mov al, byte ptr [rbp - 0x60]
0x1004d58f3: mov cl, byte ptr [rbp - 0x29]
0x1004d58f6: and cl, al
0x1004d58f8: cmp cl, 1
0x1004d58fb: jne 0x1004d5910
0x1004d58fd: vmovss xmm0, dword ptr [rbp - 0x1fc]
0x1004d5905: vucomiss xmm0, dword ptr [rbp - 0x17c]
0x1004d590d: seta al
0x1004d5910: test al, al
0x1004d5912: mov r14, qword ptr [rbp - 0x40]
0x1004d5916: jne 0x1004d5968
0x1004d5918: mov rbx, qword ptr [rbp - 0xf0]
0x1004d591f: vmovss xmm0, dword ptr [rbx + 0xe0]
0x1004d5927: vaddss xmm0, xmm0, dword ptr [rip + 0x5d3091] ; 0x100aa89c0
0x1004d592f: vdivss xmm0, xmm0, dword ptr [rip + 0x5d38a9] ; 0x100aa91e0
0x1004d5937: vxorps xmm1, xmm1, xmm1
0x1004d593b: vmaxss xmm0, xmm1, xmm0
0x1004d593f: vmovss xmm1, dword ptr [rip + 0x5cf779] ; 0x100aa50c0
0x1004d5947: vminss xmm0, xmm1, xmm0
0x1004d594b: vmulss xmm0, xmm0, dword ptr [rip + 0x5d1e95] ; 0x100aa77e8
0x1004d5953: vmovss dword ptr [rbp - 0x50], xmm0
0x1004d5958: jmp 0x1004d5ac3 ; 0x1004d5ac3
0x1004d595d: mov r14, qword ptr [rbp - 0x40]
0x1004d5961: mov r12d, dword ptr [r14 + 0x13c8]
0x1004d5968: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x1004d5970: vsubps xmm2, xmm0, xmmword ptr [rip + 0x5d38b8] ; 0x100aa9230
0x1004d5978: vmovshdup xmm0, xmm2
0x1004d597c: vxorps xmm0, xmm0, xmmword ptr [rip + 0x5d1f7c] ; 0x100aa7900
0x1004d5984: vxorps xmm1, xmm1, xmm1
0x1004d5988: vmaxss xmm0, xmm1, xmm0
0x1004d598c: vmovss dword ptr [rbp - 0x60], xmm0
0x1004d5991: test r12d, r12d
0x1004d5994: je 0x1004d5aa6
0x1004d599a: vmovaps xmmword ptr [rbp - 0x50], xmm2
0x1004d599f: lea rbx, [r14 + 0x13e0]
0x1004d59a6: xor r13d, r13d
0x1004d59a9: lea r12, [rbp - 0x1c0]
0x1004d59b0: lea r15, [rbp - 0xc0]
0x1004d59b7: lea r14, [rbp - 0x180]
0x1004d59be: nop 
0x1004d59c0: vmovss xmm0, dword ptr [rip + 0x5cebf0] ; 0x100aa45b8
0x1004d59c8: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004d59d0: vmovaps xmm0, xmmword ptr [rip + 0x5d1f18] ; 0x100aa78f0
0x1004d59d8: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1004d59e0: vmovaps xmm0, xmmword ptr [rip + 0x5dcbf8] ; 0x100ab25e0
0x1004d59e8: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d59f0: vmovaps xmm0, xmmword ptr [rip + 0x5d3008] ; 0x100aa8a00
0x1004d59f8: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1004d5a00: mov rdi, r12
0x1004d5a03: mov rsi, rbx
0x1004d5a06: mov rdx, r15
0x1004d5a09: call 0x100076df0 ; 0x100076df0
0x1004d5a0e: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1004d5a13: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1004d5a1b: mov rdi, r14
0x1004d5a1e: mov rsi, r12
0x1004d5a21: call 0x10078ccc0 ; 0x10078ccc0
0x1004d5a26: test al, al
0x1004d5a28: je 0x1004d5a8b
0x1004d5a2a: vmovaps xmm0, xmmword ptr [rbp - 0x1b0]
0x1004d5a32: vmovaps xmm1, xmmword ptr [rbp - 0x190]
0x1004d5a3a: vmulps xmm2, xmm0, xmm0
0x1004d5a3e: vmovshdup xmm3, xmm2
0x1004d5a42: vaddss xmm3, xmm2, xmm3
0x1004d5a46: vpermilpd xmm2, xmm2, 1
0x1004d5a4c: vaddss xmm2, xmm2, xmm3
0x1004d5a50: vsqrtss xmm2, xmm2, xmm2
0x1004d5a54: vpermilps xmm3, xmm2, 0xc0
0x1004d5a5a: vdivps xmm0, xmm0, xmm3
0x1004d5a5e: vsubps xmm1, xmm1, xmmword ptr [rbp - 0x50]
0x1004d5a63: vmulps xmm0, xmm1, xmm0
0x1004d5a67: vmovshdup xmm1, xmm0
0x1004d5a6b: vaddss xmm1, xmm0, xmm1
0x1004d5a6f: vpermilpd xmm0, xmm0, 1
0x1004d5a75: vaddss xmm0, xmm0, xmm1
0x1004d5a79: vaddss xmm0, xmm2, xmm0
0x1004d5a7d: vmovss xmm1, dword ptr [rbp - 0x60]
0x1004d5a82: vmaxss xmm1, xmm0, xmm1
0x1004d5a86: vmovss dword ptr [rbp - 0x60], xmm1
0x1004d5a8b: inc r13d
0x1004d5a8e: add rbx, 0x5d0
0x1004d5a95: mov rax, qword ptr [rbp - 0x40]
0x1004d5a99: cmp dword ptr [rax + 0x13c8], r13d
0x1004d5aa0: ja 0x1004d59c0
0x1004d5aa6: vmovss xmm0, dword ptr [rbp - 0x60]
0x1004d5aab: vmulss xmm0, xmm0, dword ptr [rip + 0x5d2b7d] ; 0x100aa8630
0x1004d5ab3: vmovss dword ptr [rbp - 0x50], xmm0
0x1004d5ab8: mov r14, qword ptr [rbp - 0x40]
0x1004d5abc: mov rbx, qword ptr [rbp - 0xf0]
0x1004d5ac3: vmovss xmm0, dword ptr [rbp - 0xc4]
0x1004d5acb: vmulss xmm0, xmm0, dword ptr [rbp - 0x120]
0x1004d5ad3: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1004d5ad8: lea rdi, [rbp - 0xc0]
0x1004d5adf: mov rsi, rbx
0x1004d5ae2: call 0x1001477a0 ; 0x1001477a0
0x1004d5ae7: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1004d5aef: vmulps xmm0, xmm0, xmm0
0x1004d5af3: vmovshdup xmm1, xmm0
0x1004d5af7: vaddss xmm1, xmm0, xmm1
0x1004d5afb: vpermilpd xmm0, xmm0, 1
0x1004d5b01: vaddss xmm0, xmm0, xmm1
0x1004d5b05: vsqrtss xmm0, xmm0, xmm0
0x1004d5b09: vdivss xmm0, xmm0, dword ptr [rip + 0x5d1cdb] ; 0x100aa77ec
0x1004d5b11: vxorps xmm1, xmm1, xmm1
0x1004d5b15: vmaxss xmm0, xmm1, xmm0
0x1004d5b19: vmovss xmm2, dword ptr [rip + 0x5cf59f] ; 0x100aa50c0
0x1004d5b21: vminss xmm0, xmm2, xmm0
0x1004d5b25: vmulss xmm5, xmm0, dword ptr [rbp - 0x50]
0x1004d5b2a: mov r15b, 1
0x1004d5b2d: cmp byte ptr [rbx + 0x1b0], 0
0x1004d5b34: jne 0x1004d5b41
0x1004d5b36: cmp byte ptr [rbx + 0xbc1], 0
0x1004d5b3d: setne r15b
0x1004d5b41: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x1004d5b46: vsubps xmm0, xmm4, xmmword ptr [rbp - 0xe0]
0x1004d5b4e: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x1004d5b53: vcmpltss xmm1, xmm1, xmm2
0x1004d5b58: vblendvps xmm6, xmm5, xmm2, xmm1
0x1004d5b5e: vmovaps xmm1, xmmword ptr [rbx + 0x50]
0x1004d5b63: vmulps xmm2, xmm1, xmm1
0x1004d5b67: vmovshdup xmm3, xmm2
0x1004d5b6b: vaddss xmm3, xmm2, xmm3
0x1004d5b6f: vpermilpd xmm2, xmm2, 1
0x1004d5b75: vaddss xmm2, xmm2, xmm3
0x1004d5b79: vsqrtss xmm2, xmm2, xmm2
0x1004d5b7d: vucomiss xmm2, dword ptr [rip + 0x5d1d3f] ; 0x100aa78c4
0x1004d5b85: mov r12, qword ptr [rbp - 0x68]
0x1004d5b89: vmovaps xmmword ptr [rbp - 0x50], xmm5
0x1004d5b8e: vmovaps xmmword ptr [rbp - 0x60], xmm6
0x1004d5b93: jbe 0x1004d5ba1
0x1004d5b95: vpermilps xmm2, xmm2, 0xc0
0x1004d5b9b: vdivps xmm1, xmm1, xmm2
0x1004d5b9f: jmp 0x1004d5ba6 ; 0x1004d5ba6
0x1004d5ba1: vmovaps xmm1, xmmword ptr [rbx + 0x60]
0x1004d5ba6: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x1004d5bae: vmovaps xmm1, xmmword ptr [rip + 0x5efa8a] ; 0x100ac5640
0x1004d5bb6: vmulps xmm1, xmm4, xmm1
0x1004d5bba: vmovaps xmmword ptr [rbp - 0xe0], xmm1
0x1004d5bc2: vmulps xmm0, xmm0, xmmword ptr [rip + 0x5efa86] ; 0x100ac5650
0x1004d5bca: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1004d5bcf: vmovaps xmm0, xmmword ptr [rbx + 0x140]
0x1004d5bd7: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1004d5bdf: mov rbx, qword ptr [rbp - 0x108]
0x1004d5be6: mov rsi, qword ptr [rbx + 0x258]
0x1004d5bed: lea rdi, [rbp - 0x1d0]
0x1004d5bf4: call 0x1007f26b0 ; 0x1007f26b0
0x1004d5bf9: mov rsi, qword ptr [rbx + 0x260]
0x1004d5c00: lea rdi, [rbp - 0xc0]
0x1004d5c07: call 0x1007f26b0 ; 0x1007f26b0
0x1004d5c0c: vxorps xmm0, xmm0, xmm0
0x1004d5c10: test r15b, r15b
0x1004d5c13: jne 0x1004d5c1b
0x1004d5c15: vxorps xmm1, xmm1, xmm1
0x1004d5c19: jmp 0x1004d5c83 ; 0x1004d5c83
0x1004d5c1b: vmovaps xmm3, xmmword ptr [rbp - 0x120]
0x1004d5c23: vpermilps xmm1, xmm3, 0xd2
0x1004d5c29: vmovaps xmm2, xmmword ptr [rbp - 0xf0]
0x1004d5c31: vmulps xmm1, xmm1, xmm2
0x1004d5c35: vpermilps xmm2, xmm2, 0xd2
0x1004d5c3b: vmulps xmm2, xmm3, xmm2
0x1004d5c3f: vsubps xmm1, xmm1, xmm2
0x1004d5c43: vpermilps xmm1, xmm1, 0xd2
0x1004d5c49: vmovaps xmm2, xmmword ptr [rbp - 0x1d0]
0x1004d5c51: vsubps xmm2, xmm2, xmmword ptr [rbp - 0xc0]
0x1004d5c59: vmulps xmm1, xmm1, xmm2
0x1004d5c5d: vmovshdup xmm2, xmm1
0x1004d5c61: vaddss xmm2, xmm1, xmm2
0x1004d5c65: vpermilpd xmm1, xmm1, 1
0x1004d5c6b: vaddss xmm1, xmm1, xmm2
0x1004d5c6f: vandps xmm1, xmm1, xmmword ptr [rip + 0x5d1c99] ; 0x100aa7910
0x1004d5c77: vmovss xmm2, dword ptr [rip + 0x5d2989] ; 0x100aa8608
0x1004d5c7f: vmaxss xmm1, xmm2, xmm1
0x1004d5c83: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x1004d5c88: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x1004d5c8d: vmovaps xmm4, xmmword ptr [rbp - 0x60]
0x1004d5c92: vmovaps xmm5, xmmword ptr [rbp - 0x80]
0x1004d5c97: vmovaps xmm6, xmmword ptr [rbp - 0xe0]
0x1004d5c9f: vcmpltss xmm0, xmm0, xmm2
0x1004d5ca4: vandnps xmm1, xmm0, xmm1
0x1004d5ca8: vmovss xmm2, dword ptr [rip + 0x5d2d14] ; 0x100aa89c4
0x1004d5cb0: vandps xmm0, xmm0, xmm2
0x1004d5cb4: vmovss dword ptr [r14 + 0x40], xmm6
0x1004d5cba: vextractps dword ptr [r14 + 0x44], xmm6, 2
0x1004d5cc1: vorps xmm0, xmm1, xmm0
0x1004d5cc5: vmovss dword ptr [r14 + 0x48], xmm0
0x1004d5ccb: mov dword ptr [r14 + 0x4c], 0x3d800000
0x1004d5cd3: vmovss dword ptr [r14 + 0x50], xmm5
0x1004d5cd9: vextractps dword ptr [r14 + 0x54], xmm5, 2
0x1004d5ce0: vmovss dword ptr [r14 + 0x58], xmm3
0x1004d5ce6: vmovss dword ptr [r14 + 0x5c], xmm4
0x1004d5cec: mov rax, qword ptr [r14 + 0x60]
0x1004d5cf0: mov qword ptr [r14 + 0x68], rax
0x1004d5cf4: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x1004d5cfc: vmovss dword ptr [r14 + 0x60], xmm0
0x1004d5d02: vextractps dword ptr [r14 + 0x64], xmm0, 2
0x1004d5d09: cmp byte ptr [rip + 0x1b3bfb8], 0 ; 0x102011cc8
0x1004d5d10: je 0x1004d5d3d
0x1004d5d12: mov eax, dword ptr [r14 + 0x80]
0x1004d5d19: test eax, eax
0x1004d5d1b: jne 0x1004d5d2d
0x1004d5d1d: mov dword ptr [r14 + 0x80], 3
0x1004d5d28: mov eax, 3
0x1004d5d2d: dec eax
0x1004d5d2f: mov dword ptr [r14 + 0x80], eax
0x1004d5d36: setne byte ptr [rip + 0x1b3bf8b] ; 0x102011cc8
0x1004d5d3d: cmp byte ptr [r14 + 0x1390], 0
0x1004d5d45: je 0x1004d5d66
0x1004d5d47: mov al, byte ptr [rip + 0x7fd6cf] ; 0x100cd341c
0x1004d5d4d: test al, al
0x1004d5d4f: je 0x1004d5d66
0x1004d5d51: mov rsi, qword ptr [r12 + 0x70]
0x1004d5d56: mov rcx, qword ptr [r12 + 0x2b0]
0x1004d5d5e: mov rdi, r14
0x1004d5d61: call 0x1004d67d0 ; 0x1004d67d0
0x1004d5d66: add rsp, 0x238
0x1004d5d6d: pop rbx
0x1004d5d6e: pop r12
0x1004d5d70: pop r13
0x1004d5d72: pop r14
0x1004d5d74: pop r15
0x1004d5d76: pop rbp
0x1004d5d77: ret 
0x1004d5d78: cmp byte ptr [rip + 0x7fd69f], 0 ; 0x100cd341e
0x1004d5d7f: sete al
0x1004d5d82: or cl, al
0x1004d5d84: mov r15, qword ptr [rbp - 0x40]
0x1004d5d88: mov r13, qword ptr [rbp - 0x68]
0x1004d5d8c: jne 0x1004d54ff
0x1004d5d92: mov rdi, qword ptr [r13 + 0x3b8]
0x1004d5d99: mov rax, qword ptr [rbp - 0xe0]
0x1004d5da0: mov rsi, qword ptr [rax + 0x18]
0x1004d5da4: add rsi, 0x10
0x1004d5da8: lea rdx, [rbp - 0x1c0]
0x1004d5daf: lea rcx, [rbp - 0xc0]
0x1004d5db6: mov r8d, 1
0x1004d5dbc: call 0x1002149c0 ; 0x1002149c0
0x1004d5dc1: vmovss xmm0, dword ptr [rbp - 0x1c0]
0x1004d5dc9: vaddss xmm0, xmm0, dword ptr [rip + 0x5d3423] ; 0x100aa91f4
0x1004d5dd1: vdivss xmm0, xmm0, dword ptr [rip + 0x5e3797] ; 0x100ab9570
0x1004d5dd9: vxorps xmm1, xmm1, xmm1
0x1004d5ddd: vmaxss xmm0, xmm1, xmm0
0x1004d5de1: vmovss xmm1, dword ptr [rip + 0x5cf2d7] ; 0x100aa50c0
0x1004d5de9: vminss xmm0, xmm1, xmm0
0x1004d5ded: vmulss xmm0, xmm0, xmm0
0x1004d5df1: vmovss dword ptr [rbp - 0x60], xmm0
0x1004d5df6: mov rax, qword ptr [r13 + 0x5c8]
0x1004d5dfd: mov rdi, qword ptr [rax + 0x10]
0x1004d5e01: mov rax, qword ptr [rdi]
0x1004d5e04: call qword ptr [rax + 0x120]
0x1004d5e0a: mov eax, eax
0x1004d5e0c: vcvtsi2ss xmm0, xmm3, rax
0x1004d5e11: vmovss xmm2, dword ptr [rbp - 0x60]
0x1004d5e16: vmovss xmm1, dword ptr [rip + 0x5cf2a2] ; 0x100aa50c0
0x1004d5e1e: vsubss xmm1, xmm1, xmm2
0x1004d5e22: vmulss xmm1, xmm1, dword ptr [rip + 0x5ef866] ; 0x100ac5690
0x1004d5e2a: vmulss xmm0, xmm2, xmm0
0x1004d5e2e: vaddss xmm0, xmm0, xmm1
0x1004d5e32: mov rdi, qword ptr [r13 + 0x5c8]
0x1004d5e39: xor esi, esi
0x1004d5e3b: vxorps xmm1, xmm1, xmm1
0x1004d5e3f: jmp 0x1004d54fa ; 0x1004d54fa
0x1004d5e44: nop word ptr cs:[rax + rax]
