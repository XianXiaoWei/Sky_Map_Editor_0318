0x1003a01f0: push rbp
0x1003a01f1: mov rbp, rsp
0x1003a01f4: push r15
0x1003a01f6: push r14
0x1003a01f8: push r13
0x1003a01fa: push r12
0x1003a01fc: push rbx
0x1003a01fd: sub rsp, 0x178
0x1003a0204: mov r15, rsi
0x1003a0207: mov r13, rdi
0x1003a020a: cmp qword ptr [r13 + 0x70], 0
0x1003a020f: je 0x1003a025f
0x1003a0211: mov rdi, qword ptr [r15 + 0x280]
0x1003a0218: call 0x1000fc260 ; 0x1000fc260
0x1003a021d: test rax, rax
0x1003a0220: je 0x1003a0e43
0x1003a0226: mov rbx, qword ptr [r13 + 0x70]
0x1003a022a: mov rax, qword ptr [rax + 0x20]
0x1003a022e: mov rsi, qword ptr [rax + 0x288]
0x1003a0235: lea r14, [rbp - 0xf0]
0x1003a023c: mov rdi, r14
0x1003a023f: call 0x1007f26b0 ; 0x1007f26b0
0x1003a0244: vmovss xmm0, dword ptr [rip + 0x7083e8] ; 0x100aa8634
0x1003a024c: mov rdi, r14
0x1003a024f: mov rsi, rbx
0x1003a0252: call 0x10039fe40 ; 0x10039fe40
0x1003a0257: test al, al
0x1003a0259: je 0x1003a0e43
0x1003a025f: mov rsi, qword ptr [r15 + 0x298]
0x1003a0266: lea rdi, [rbp - 0xf0]
0x1003a026d: xor edx, edx
0x1003a026f: call 0x1001e2ac0 ; 0x1001e2ac0
0x1003a0274: mov rax, qword ptr [rbp - 0xf0]
0x1003a027b: test rax, rax
0x1003a027e: je 0x1003a0e43
0x1003a0284: mov rbx, qword ptr [rax + 0x10]
0x1003a0288: mov rcx, qword ptr [rbp - 0xe8]
0x1003a028f: mov rdx, qword ptr [rbp - 0xe0]
0x1003a0296: test rdx, rdx
0x1003a0299: lea rdx, [rdx + 8]
0x1003a029d: cmove rdx, rax
0x1003a02a1: mov qword ptr [rdx], rcx
0x1003a02a4: mov rcx, qword ptr [rbp - 0xe8]
0x1003a02ab: mov rdx, qword ptr [rbp - 0xe0]
0x1003a02b2: add rax, 8
0x1003a02b6: test rcx, rcx
0x1003a02b9: lea rcx, [rcx + 0x10]
0x1003a02bd: cmove rcx, rax
0x1003a02c1: mov qword ptr [rcx], rdx
0x1003a02c4: test rbx, rbx
0x1003a02c7: je 0x1003a0e43
0x1003a02cd: mov rdi, qword ptr [r15 + 0x280]
0x1003a02d4: call 0x1000fc260 ; 0x1000fc260
0x1003a02d9: mov qword ptr [rbp - 0xa8], rax
0x1003a02e0: mov rax, qword ptr [rax + 0x18]
0x1003a02e4: lea rcx, [rip + 0x72154d] ; 0x100ac1838
0x1003a02eb: vbroadcastss xmm0, dword ptr [rcx]
0x1003a02f0: vmulps xmm0, xmm0, xmmword ptr [rip + 0x707da8] ; 0x100aa80a0
0x1003a02f8: vmulps xmm0, xmm0, xmmword ptr [rip + 0x707370] ; 0x100aa7670
0x1003a0300: vaddps xmm0, xmm0, xmmword ptr [rax + 0x10]
0x1003a0305: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1003a030a: mov rcx, qword ptr [r15 + 0x160]
0x1003a0311: lea rdx, [rip + 0x1c5adb8] ; 0x101ffb0d0
0x1003a0318: cmp byte ptr [rdx], 0
0x1003a031b: je 0x1003a032a
0x1003a031d: lea rdx, [rip + 0x91821c] ; 0x100cb8540
0x1003a0324: vmovss xmm0, dword ptr [rdx]
0x1003a0328: jmp 0x1003a0332 ; 0x1003a0332
0x1003a032a: vmovss xmm0, dword ptr [rip + 0x704d8e] ; 0x100aa50c0
0x1003a0332: vmulss xmm0, xmm0, dword ptr [rcx + 0x20]
0x1003a0337: vmulss xmm0, xmm0, dword ptr [rcx + 0x14]
0x1003a033c: vmovss xmm1, dword ptr [rip + 0x706758] ; 0x100aa6a9c
0x1003a0344: vxorps xmm2, xmm2, xmm2
0x1003a0348: vmovlps qword ptr [rbp - 0xa0], xmm2
0x1003a0350: mov dword ptr [rbp - 0x98], 0
0x1003a035a: mov rcx, qword ptr [r15 + 0x270]
0x1003a0361: vmovss xmm4, dword ptr [rcx + 0xac80]
0x1003a0369: vmovss xmm2, dword ptr [rax + 0xb48]
0x1003a0371: vxorps xmm3, xmm3, xmm3
0x1003a0375: vucomiss xmm4, xmm3
0x1003a0379: jne 0x1003a037d
0x1003a037b: jnp 0x1003a0387
0x1003a037d: mov byte ptr [r13 + 0xa4], 1
0x1003a0385: jmp 0x1003a0396 ; 0x1003a0396
0x1003a0387: vucomiss xmm2, xmm3
0x1003a038b: jbe 0x1003a0396
0x1003a038d: cmp byte ptr [rax + 0x100], 0
0x1003a0394: jne 0x1003a037d
0x1003a0396: vmaxss xmm0, xmm1, xmm0
0x1003a039a: vmovss xmm1, dword ptr [rip + 0x7066fe] ; 0x100aa6aa0
0x1003a03a2: vxorps xmm3, xmm3, xmm3
0x1003a03a6: vucomiss xmm2, xmm3
0x1003a03aa: jbe 0x1003a03bd
0x1003a03ac: cmp byte ptr [rax + 0x100], 0
0x1003a03b3: jne 0x1003a03bd
0x1003a03b5: mov byte ptr [r13 + 0xa4], 0
0x1003a03bd: vminss xmm0, xmm1, xmm0
0x1003a03c1: vmovss dword ptr [rbp - 0x4c], xmm0
0x1003a03c6: mov rax, qword ptr [r13 + 0x38]
0x1003a03ca: test rax, rax
0x1003a03cd: mov qword ptr [rbp - 0x38], r13
0x1003a03d1: je 0x1003a08d2
0x1003a03d7: mov qword ptr [rbp - 0x68], rbx
0x1003a03db: cmp dword ptr [rax + 0x10], 0
0x1003a03df: je 0x1003a0a53
0x1003a03e5: mov qword ptr [rbp - 0x48], r15
0x1003a03e9: xor r15d, r15d
0x1003a03ec: vmovss xmm1, dword ptr [rip + 0x70e608] ; 0x100aae9fc
0x1003a03f4: lea r14, [rbp - 0xf0]
0x1003a03fb: lea r12, [rbp - 0x130]
0x1003a0402: vmovss dword ptr [rbp - 0x40], xmm1
0x1003a0407: nop word ptr [rax + rax]
0x1003a0410: vmovss dword ptr [rbp - 0x2c], xmm1
0x1003a0415: mov rax, qword ptr [rax + 8]
0x1003a0419: mov ecx, r15d
0x1003a041c: mov rax, qword ptr [rax + rcx*8]
0x1003a0420: mov qword ptr [rbp - 0x130], rax
0x1003a0427: call 0x1007abc10 ; 0x1007abc10
0x1003a042c: mov r13, rax
0x1003a042f: mov qword ptr [rbp - 0xf0], 0
0x1003a043a: call 0x1007abc10 ; 0x1007abc10
0x1003a043f: mov rbx, qword ptr [rax]
0x1003a0442: mov rdi, rax
0x1003a0445: mov rsi, r14
0x1003a0448: mov rdx, r12
0x1003a044b: mov rcx, r13
0x1003a044e: call qword ptr [rbx + 0x40]
0x1003a0451: mov rbx, qword ptr [rbp - 0xf0]
0x1003a0458: test rbx, rbx
0x1003a045b: je 0x1003a0e55
0x1003a0461: mov rdi, r14
0x1003a0464: mov rsi, rbx
0x1003a0467: call 0x1004d1e40 ; 0x1004d1e40
0x1003a046c: mov rdi, r12
0x1003a046f: mov rsi, rbx
0x1003a0472: call 0x1004d2140 ; 0x1004d2140
0x1003a0477: lea r13, [rbp - 0x170]
0x1003a047e: mov rdi, r13
0x1003a0481: mov rsi, r14
0x1003a0484: mov rdx, r12
0x1003a0487: call 0x100076df0 ; 0x100076df0
0x1003a048c: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1003a0494: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1003a0499: mov rdi, rbx
0x1003a049c: call 0x1004d2050 ; 0x1004d2050
0x1003a04a1: mov ebx, eax
0x1003a04a3: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1003a04a8: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x1003a04b0: lea rdi, [rbp - 0x1a0]
0x1003a04b7: mov rsi, r13
0x1003a04ba: call 0x10078ce10 ; 0x10078ce10
0x1003a04bf: vmovss dword ptr [rbp - 0x30], xmm0
0x1003a04c4: mov r13, qword ptr [rbp - 0x38]
0x1003a04c8: cmp byte ptr [r13 + 0xa4], 0
0x1003a04d0: je 0x1003a04f0
0x1003a04d2: mov rax, qword ptr [rbp - 0x48]
0x1003a04d6: mov rsi, qword ptr [rax + 0x70]
0x1003a04da: lea rdi, [rbp - 0x90]
0x1003a04e1: call 0x10076bef0 ; 0x10076bef0
0x1003a04e6: jmp 0x1003a0508 ; 0x1003a0508
0x1003a04e8: nop dword ptr [rax + rax]
0x1003a04f0: mov rax, qword ptr [rbp - 0xa8]
0x1003a04f7: mov rax, qword ptr [rax + 0x18]
0x1003a04fb: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x1003a0500: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1003a0508: vxorps xmm3, xmm3, xmm3
0x1003a050c: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1003a0511: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x1003a0516: vmulps xmm1, xmm0, xmm0
0x1003a051a: vmovshdup xmm2, xmm1
0x1003a051e: vaddss xmm2, xmm1, xmm2
0x1003a0522: vpermilpd xmm1, xmm1, 1
0x1003a0528: vaddss xmm1, xmm1, xmm2
0x1003a052c: vsqrtss xmm1, xmm1, xmm1
0x1003a0530: vucomiss xmm1, dword ptr [rip + 0x70738c] ; 0x100aa78c4
0x1003a0538: jbe 0x1003a0544
0x1003a053a: vpermilps xmm1, xmm1, 0xc0
0x1003a0540: vdivps xmm0, xmm0, xmm1
0x1003a0544: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x1003a054c: vmovshdup xmm1, xmm0
0x1003a0550: vaddss xmm1, xmm0, xmm1
0x1003a0554: vpermilpd xmm0, xmm0, 1
0x1003a055a: vaddss xmm1, xmm0, xmm1
0x1003a055e: vmovss xmm0, dword ptr [r13 + 0x78]
0x1003a0564: vucomiss xmm0, xmm3
0x1003a0568: jbe 0x1003a0574
0x1003a056a: vucomiss xmm3, xmm1
0x1003a056e: ja 0x1003a06a0
0x1003a0574: test bl, bl
0x1003a0576: je 0x1003a06a0
0x1003a057c: vmovss xmm2, dword ptr [rip + 0x704b3c] ; 0x100aa50c0
0x1003a0584: vaddss xmm1, xmm1, xmm2
0x1003a0588: vmulss xmm1, xmm1, dword ptr [rip + 0x70724c] ; 0x100aa77dc
0x1003a0590: vmaxss xmm0, xmm3, xmm0
0x1003a0594: vminss xmm0, xmm2, xmm0
0x1003a0598: vsubss xmm2, xmm2, xmm0
0x1003a059c: vmulss xmm0, xmm0, xmm1
0x1003a05a0: vaddss xmm0, xmm2, xmm0
0x1003a05a4: vmovss xmm2, dword ptr [rbp - 0x30]
0x1003a05a9: vdivss xmm3, xmm2, xmm0
0x1003a05ad: vmovss xmm0, dword ptr [rbp - 0x40]
0x1003a05b2: vucomiss xmm0, xmm3
0x1003a05b6: lea rbx, [rbp - 0x90]
0x1003a05bd: jbe 0x1003a06a0
0x1003a05c3: vucomiss xmm2, dword ptr [r13 + 0x5c]
0x1003a05c9: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a05ce: jbe 0x1003a06a5
0x1003a05d4: vmovss dword ptr [rbp - 0x2c], xmm3
0x1003a05d9: vxorps xmm0, xmm0, xmm0
0x1003a05dd: vmovlps qword ptr [rbp - 0x90], xmm0
0x1003a05e5: mov dword ptr [rbp - 0x88], 0
0x1003a05ef: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1003a05f4: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x1003a05fc: vaddss xmm0, xmm2, dword ptr [rip + 0x707fac] ; 0x100aa85b0
0x1003a0604: lea rdi, [rbp - 0x190]
0x1003a060b: lea rsi, [rbp - 0x170]
0x1003a0612: mov rdx, rbx
0x1003a0615: call 0x10078d250 ; 0x10078d250
0x1003a061a: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1003a0622: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1003a062a: cmp byte ptr [rip + 0x1c5c13f], 0 ; 0x101ffc770
0x1003a0631: je 0x1003a0688
0x1003a0633: call 0x1002b9810 ; 0x1002b9810
0x1003a0638: xor ecx, ecx
0x1003a063a: mov rdi, rax
0x1003a063d: mov rsi, rbx
0x1003a0640: vmovss xmm0, dword ptr [rip + 0x7071a0] ; 0x100aa77e8
0x1003a0648: lea rax, [rip + 0x1c9eff1] ; 0x10203f640
0x1003a064f: mov rdx, rax
0x1003a0652: call 0x1002bb510 ; 0x1002bb510
0x1003a0657: call 0x1002b9810 ; 0x1002b9810
0x1003a065c: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1003a0664: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1003a066c: xor r8d, r8d
0x1003a066f: mov rdi, rax
0x1003a0672: lea rsi, [rbp - 0x180]
0x1003a0679: mov rdx, rbx
0x1003a067c: lea rcx, [rip + 0x1c9efbd] ; 0x10203f640
0x1003a0683: call 0x1002b9d50 ; 0x1002b9d50
0x1003a0688: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1003a068d: vmovss dword ptr [rbp - 0x40], xmm0
0x1003a0692: vmovss xmm1, dword ptr [rbp - 0x30]
0x1003a0697: jmp 0x1003a06a5 ; 0x1003a06a5
0x1003a0699: nop dword ptr [rax]
0x1003a06a0: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a06a5: inc r15d
0x1003a06a8: mov rax, qword ptr [r13 + 0x38]
0x1003a06ac: cmp r15d, dword ptr [rax + 0x10]
0x1003a06b0: jb 0x1003a0410
0x1003a06b6: cmp byte ptr [rip + 0x1c5c0b3], 0 ; 0x101ffc770
0x1003a06bd: vmovss dword ptr [rbp - 0x2c], xmm1
0x1003a06c2: je 0x1003a06f2
0x1003a06c4: call 0x1002b9810 ; 0x1002b9810
0x1003a06c9: lea rdx, [rip + 0x1c9ef70] ; 0x10203f640
0x1003a06d0: lea rsi, [rbp - 0xa0]
0x1003a06d7: vmovss xmm0, dword ptr [rip + 0x707ef1] ; 0x100aa85d0
0x1003a06df: xor ecx, ecx
0x1003a06e1: mov rdi, rax
0x1003a06e4: call 0x1002bb510 ; 0x1002bb510
0x1003a06e9: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a06ee: mov rax, qword ptr [r13 + 0x38]
0x1003a06f2: vxorps xmm0, xmm0, xmm0
0x1003a06f6: vmovlps qword ptr [rbp - 0x130], xmm0
0x1003a06fe: mov dword ptr [rbp - 0x128], 0
0x1003a0708: cmp dword ptr [rax + 0x10], 0
0x1003a070c: je 0x1003a084a
0x1003a0712: xor r12d, r12d
0x1003a0715: vmovss xmm0, dword ptr [rip + 0x71e833] ; 0x100abef50
0x1003a071d: vmovss dword ptr [rbp - 0x30], xmm0
0x1003a0722: lea r15, [rbp - 0xf0]
0x1003a0729: xor r13d, r13d
0x1003a072c: nop dword ptr [rax]
0x1003a0730: mov rax, qword ptr [rax + 8]
0x1003a0734: mov ecx, r13d
0x1003a0737: mov rax, qword ptr [rax + rcx*8]
0x1003a073b: mov qword ptr [rbp - 0x170], rax
0x1003a0742: call 0x1007abc10 ; 0x1007abc10
0x1003a0747: mov r14, rax
0x1003a074a: mov qword ptr [rbp - 0xf0], 0
0x1003a0755: call 0x1007abc10 ; 0x1007abc10
0x1003a075a: mov rbx, qword ptr [rax]
0x1003a075d: mov rdi, rax
0x1003a0760: mov rsi, r15
0x1003a0763: lea rdx, [rbp - 0x170]
0x1003a076a: mov rcx, r14
0x1003a076d: call qword ptr [rbx + 0x40]
0x1003a0770: mov rbx, qword ptr [rbp - 0xf0]
0x1003a0777: test rbx, rbx
0x1003a077a: je 0x1003a0e55
0x1003a0780: mov rdi, r15
0x1003a0783: mov rsi, rbx
0x1003a0786: call 0x1004d1e40 ; 0x1004d1e40
0x1003a078b: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1003a0793: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1003a0798: mov rdi, rbx
0x1003a079b: call 0x1004d2050 ; 0x1004d2050
0x1003a07a0: test al, al
0x1003a07a2: je 0x1003a07f2
0x1003a07a4: vmovaps xmm2, xmmword ptr [rbp - 0x80]
0x1003a07a9: vsubps xmm0, xmm2, xmmword ptr [rbp - 0x60]
0x1003a07ae: vmulps xmm0, xmm0, xmm0
0x1003a07b2: vmovshdup xmm1, xmm0
0x1003a07b6: vaddss xmm1, xmm0, xmm1
0x1003a07ba: vpermilpd xmm0, xmm0, 1
0x1003a07c0: vaddss xmm0, xmm0, xmm1
0x1003a07c4: vsqrtss xmm0, xmm0, xmm0
0x1003a07c8: vmovss xmm1, dword ptr [rbp - 0x30]
0x1003a07cd: vucomiss xmm1, xmm0
0x1003a07d1: jbe 0x1003a07f2
0x1003a07d3: mov rax, qword ptr [rbp - 0x38]
0x1003a07d7: vmovss xmm1, dword ptr [rax + 0x5c]
0x1003a07dc: vucomiss xmm1, xmm0
0x1003a07e0: jbe 0x1003a07f2
0x1003a07e2: vmovaps xmmword ptr [rbp - 0x130], xmm2
0x1003a07ea: mov r12b, 1
0x1003a07ed: vmovss dword ptr [rbp - 0x30], xmm0
0x1003a07f2: inc r13d
0x1003a07f5: mov rax, qword ptr [rbp - 0x38]
0x1003a07f9: mov rax, qword ptr [rax + 0x38]
0x1003a07fd: cmp r13d, dword ptr [rax + 0x10]
0x1003a0801: jb 0x1003a0730
0x1003a0807: test r12b, 1
0x1003a080b: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a0810: mov r13, qword ptr [rbp - 0x38]
0x1003a0814: je 0x1003a084a
0x1003a0816: mov al, byte ptr [rip + 0x1c5bf54] ; 0x101ffc770
0x1003a081c: test al, al
0x1003a081e: je 0x1003a084a
0x1003a0820: call 0x1002b9810 ; 0x1002b9810
0x1003a0825: lea rdx, [rip + 0x1c9ede4] ; 0x10203f610
0x1003a082c: lea rsi, [rbp - 0x130]
0x1003a0833: vmovss xmm0, dword ptr [rip + 0x707d95] ; 0x100aa85d0
0x1003a083b: xor ecx, ecx
0x1003a083d: mov rdi, rax
0x1003a0840: call 0x1002bb510 ; 0x1002bb510
0x1003a0845: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a084a: mov rbx, qword ptr [rbp - 0x68]
0x1003a084e: vmovss xmm0, dword ptr [r13 + 0x5c]
0x1003a0854: vucomiss xmm0, xmm1
0x1003a0858: jbe 0x1003a0ba3
0x1003a085e: vdivss xmm1, xmm1, xmm0
0x1003a0862: vcmpltss xmm2, xmm0, dword ptr [rip + 0x708d65] ; 0x100aa95d0
0x1003a086b: vandps xmm3, xmm2, xmm1
0x1003a086f: vmovss xmm4, dword ptr [rip + 0x704849] ; 0x100aa50c0
0x1003a0877: vandnps xmm2, xmm2, xmm4
0x1003a087b: vorps xmm2, xmm2, xmm3
0x1003a087f: vmovss xmm3, dword ptr [rip + 0x70703d] ; 0x100aa78c4
0x1003a0887: vcmpltss xmm0, xmm3, xmm0
0x1003a088c: vblendvps xmm0, xmm2, xmm1, xmm0
0x1003a0892: vxorps xmm1, xmm1, xmm1
0x1003a0896: vmaxss xmm0, xmm1, xmm0
0x1003a089a: vminss xmm1, xmm4, xmm0
0x1003a089e: cmp qword ptr [r13 + 0x38], 0
0x1003a08a3: jne 0x1003a0c1e
0x1003a08a9: cmp qword ptr [r13 + 0x80], 0
0x1003a08b1: jne 0x1003a0c1e
0x1003a08b7: cmp qword ptr [r13 + 0x88], 0
0x1003a08bf: jne 0x1003a0c1e
0x1003a08c5: vmovss xmm1, dword ptr [rip + 0x7047f3] ; 0x100aa50c0
0x1003a08cd: jmp 0x1003a0c2c ; 0x1003a0c2c
0x1003a08d2: mov rax, qword ptr [r13 + 0x80]
0x1003a08d9: vmovss xmm1, dword ptr [rip + 0x70e11b] ; 0x100aae9fc
0x1003a08e1: test rax, rax
0x1003a08e4: je 0x1003a084e
0x1003a08ea: mov r14, qword ptr [r13 + 0x88]
0x1003a08f1: test r14, r14
0x1003a08f4: je 0x1003a084e
0x1003a08fa: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1003a08ff: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1003a0907: cmp dword ptr [rax + 0x10], 0
0x1003a090b: je 0x1003a0a72
0x1003a0911: mov qword ptr [rbp - 0x68], rbx
0x1003a0915: lea rcx, [r13 + 0xa0]
0x1003a091c: mov qword ptr [rbp - 0x40], rcx
0x1003a0920: vxorps xmm0, xmm0, xmm0
0x1003a0924: vmovss dword ptr [rbp - 0x30], xmm0
0x1003a0929: mov dword ptr [rbp - 0x48], 0xffffffff
0x1003a0930: vmovss xmm0, dword ptr [rip + 0x706f80] ; 0x100aa78b8
0x1003a0938: vmovss dword ptr [rbp - 0x2c], xmm0
0x1003a093d: xor r13d, r13d
0x1003a0940: lea r12, [rbp - 0x130]
0x1003a0947: lea r15, [rbp - 0x170]
0x1003a094e: nop 
0x1003a0950: mov rax, qword ptr [rax + 8]
0x1003a0954: mov ecx, r13d
0x1003a0957: mov rax, qword ptr [rax + rcx*8]
0x1003a095b: mov qword ptr [rbp - 0x170], rax
0x1003a0962: call 0x1007abc10 ; 0x1007abc10
0x1003a0967: mov r14, rax
0x1003a096a: mov qword ptr [rbp - 0x130], 0
0x1003a0975: call 0x10055b490 ; 0x10055b490
0x1003a097a: mov rbx, qword ptr [rax]
0x1003a097d: mov rdi, rax
0x1003a0980: mov rsi, r12
0x1003a0983: mov rdx, r15
0x1003a0986: mov rcx, r14
0x1003a0989: call qword ptr [rbx + 0x40]
0x1003a098c: mov rbx, qword ptr [rbp - 0x130]
0x1003a0993: test rbx, rbx
0x1003a0996: je 0x1003a0e55
0x1003a099c: mov rdi, rbx
0x1003a099f: lea rsi, [rbp - 0xf0]
0x1003a09a6: mov rdx, r12
0x1003a09a9: call 0x10055d820 ; 0x10055d820
0x1003a09ae: mov rdi, r15
0x1003a09b1: mov rsi, rbx
0x1003a09b4: vmovss dword ptr [rbp - 0x80], xmm0
0x1003a09b9: call 0x10055e420 ; 0x10055e420
0x1003a09be: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x1003a09c6: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x170]
0x1003a09ce: vmulps xmm0, xmm0, xmm0
0x1003a09d2: vmovshdup xmm1, xmm0
0x1003a09d6: vaddss xmm1, xmm0, xmm1
0x1003a09da: vpermilpd xmm0, xmm0, 1
0x1003a09e0: vaddss xmm0, xmm0, xmm1
0x1003a09e4: vsqrtss xmm0, xmm0, xmm0
0x1003a09e8: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a09ed: vucomiss xmm1, xmm0
0x1003a09f1: jbe 0x1003a0a22
0x1003a09f3: mov rax, qword ptr [rbp - 0x38]
0x1003a09f7: cmp rbx, qword ptr [rax + 0x98]
0x1003a09fe: je 0x1003a0a0f
0x1003a0a00: mov rax, qword ptr [rbp - 0x40]
0x1003a0a04: vmovss xmm1, dword ptr [rbp - 0x80]
0x1003a0a09: vmovss dword ptr [rax], xmm1
0x1003a0a0d: jmp 0x1003a0a14 ; 0x1003a0a14
0x1003a0a0f: vmovss xmm1, dword ptr [rbp - 0x80]
0x1003a0a14: vmovss dword ptr [rbp - 0x30], xmm1
0x1003a0a19: vmovss dword ptr [rbp - 0x2c], xmm0
0x1003a0a1e: mov dword ptr [rbp - 0x48], r13d
0x1003a0a22: inc r13d
0x1003a0a25: mov rax, qword ptr [rbp - 0x38]
0x1003a0a29: mov rax, qword ptr [rax + 0x80]
0x1003a0a30: cmp r13d, dword ptr [rax + 0x10]
0x1003a0a34: jb 0x1003a0950
0x1003a0a3a: mov r13, qword ptr [rbp - 0x38]
0x1003a0a3e: mov r14, qword ptr [r13 + 0x88]
0x1003a0a45: mov rbx, qword ptr [rbp - 0x68]
0x1003a0a49: mov r12d, dword ptr [rbp - 0x48]
0x1003a0a4d: mov r15, qword ptr [rbp - 0x40]
0x1003a0a51: jmp 0x1003a0a95 ; 0x1003a0a95
0x1003a0a53: vmovss xmm1, dword ptr [rip + 0x70dfa1] ; 0x100aae9fc
0x1003a0a5b: cmp byte ptr [rip + 0x1c5bd0e], 0 ; 0x101ffc770
0x1003a0a62: vmovss dword ptr [rbp - 0x2c], xmm1
0x1003a0a67: jne 0x1003a06c4
0x1003a0a6d: jmp 0x1003a06f2 ; 0x1003a06f2
0x1003a0a72: lea r15, [r13 + 0xa0]
0x1003a0a79: vmovss xmm0, dword ptr [rip + 0x706e37] ; 0x100aa78b8
0x1003a0a81: vmovss dword ptr [rbp - 0x2c], xmm0
0x1003a0a86: mov r12d, 0xffffffff
0x1003a0a8c: vxorps xmm0, xmm0, xmm0
0x1003a0a90: vmovss dword ptr [rbp - 0x30], xmm0
0x1003a0a95: vmovss xmm0, dword ptr [rbp - 0x4c]
0x1003a0a9a: vmulss xmm0, xmm0, dword ptr [rip + 0x70ad8e] ; 0x100aab830
0x1003a0aa2: call 0x100aa2708 ; 0x100aa2708 _expf
0x1003a0aa7: vmovss xmm1, dword ptr [rip + 0x704611] ; 0x100aa50c0
0x1003a0aaf: vsubss xmm0, xmm1, xmm0
0x1003a0ab3: vsubss xmm1, xmm1, xmm0
0x1003a0ab7: vmulss xmm1, xmm1, dword ptr [r15]
0x1003a0abc: vmulss xmm0, xmm0, dword ptr [rbp - 0x30]
0x1003a0ac1: vaddss xmm0, xmm0, xmm1
0x1003a0ac5: vmovss dword ptr [r15], xmm0
0x1003a0aca: cmp dword ptr [r14 + 0x10], r12d
0x1003a0ace: jbe 0x1003a0e74
0x1003a0ad4: mov rax, qword ptr [r14 + 8]
0x1003a0ad8: mov ecx, r12d
0x1003a0adb: mov rax, qword ptr [rax + rcx*8]
0x1003a0adf: mov qword ptr [rbp - 0x170], rax
0x1003a0ae6: call 0x1007abc10 ; 0x1007abc10
0x1003a0aeb: mov r14, rax
0x1003a0aee: mov qword ptr [rbp - 0x130], 0
0x1003a0af9: call 0x10055b490 ; 0x10055b490
0x1003a0afe: mov r8, qword ptr [rax]
0x1003a0b01: lea rsi, [rbp - 0x130]
0x1003a0b08: lea rdx, [rbp - 0x170]
0x1003a0b0f: mov rdi, rax
0x1003a0b12: mov rcx, r14
0x1003a0b15: call qword ptr [r8 + 0x40]
0x1003a0b19: mov rsi, qword ptr [rbp - 0x130]
0x1003a0b20: test rsi, rsi
0x1003a0b23: je 0x1003a0e55
0x1003a0b29: vmovss xmm0, dword ptr [r15]
0x1003a0b2e: lea rdi, [rbp - 0x130]
0x1003a0b35: call 0x10055e420 ; 0x10055e420
0x1003a0b3a: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1003a0b3f: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x130]
0x1003a0b47: vmulps xmm1, xmm0, xmm0
0x1003a0b4b: vmovshdup xmm2, xmm1
0x1003a0b4f: vaddss xmm2, xmm1, xmm2
0x1003a0b53: vpermilpd xmm1, xmm1, 1
0x1003a0b59: vaddss xmm1, xmm1, xmm2
0x1003a0b5d: vsqrtss xmm1, xmm1, xmm1
0x1003a0b61: vucomiss xmm1, dword ptr [rip + 0x706d5b] ; 0x100aa78c4
0x1003a0b69: jbe 0x1003a0b75
0x1003a0b6b: vpermilps xmm1, xmm1, 0xc0
0x1003a0b71: vdivps xmm0, xmm0, xmm1
0x1003a0b75: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1003a0b7a: vmulss xmm1, xmm1, xmm1
0x1003a0b7e: vmulps xmm0, xmm0, xmmword ptr [rip + 0x7073da] ; 0x100aa7f60
0x1003a0b86: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x1003a0b8b: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1003a0b93: vmovss xmm0, dword ptr [r13 + 0x5c]
0x1003a0b99: vucomiss xmm0, xmm1
0x1003a0b9d: ja 0x1003a085e
0x1003a0ba3: vmovss xmm0, dword ptr [r13 + 0x60]
0x1003a0ba9: vmovaps xmm2, xmm1
0x1003a0bad: vaddss xmm1, xmm0, dword ptr [rip + 0x70450f] ; 0x100aa50c4
0x1003a0bb5: vmovaps xmm4, xmm2
0x1003a0bb9: vucomiss xmm2, xmm1
0x1003a0bbd: jbe 0x1003a0c0b
0x1003a0bbf: vsubss xmm2, xmm0, xmm1
0x1003a0bc3: vucomiss xmm2, dword ptr [rip + 0x706cf9] ; 0x100aa78c4
0x1003a0bcb: vmovss xmm0, dword ptr [rip + 0x7044ed] ; 0x100aa50c0
0x1003a0bd3: ja 0x1003a0be7
0x1003a0bd5: vmovss xmm3, dword ptr [rip + 0x7089f3] ; 0x100aa95d0
0x1003a0bdd: vucomiss xmm3, xmm2
0x1003a0be1: vmovaps xmm3, xmm0
0x1003a0be5: jbe 0x1003a0bef
0x1003a0be7: vsubss xmm1, xmm4, xmm1
0x1003a0beb: vdivss xmm3, xmm1, xmm2
0x1003a0bef: vxorps xmm1, xmm1, xmm1
0x1003a0bf3: vmaxss xmm1, xmm1, xmm3
0x1003a0bf7: vminss xmm1, xmm0, xmm1
0x1003a0bfb: vsubss xmm1, xmm0, xmm1
0x1003a0bff: cmp qword ptr [r13 + 0x38], 0
0x1003a0c04: jne 0x1003a0c1e
0x1003a0c06: jmp 0x1003a08a9 ; 0x1003a08a9
0x1003a0c0b: vmovss xmm1, dword ptr [rip + 0x7044ad] ; 0x100aa50c0
0x1003a0c13: cmp qword ptr [r13 + 0x38], 0
0x1003a0c18: je 0x1003a08a9
0x1003a0c1e: vucomiss xmm1, dword ptr [rip + 0x70798a] ; 0x100aa85b0
0x1003a0c26: jbe 0x1003a0e03
0x1003a0c2c: mov rax, qword ptr [rbp - 0xa8]
0x1003a0c33: mov rax, qword ptr [rax + 0x18]
0x1003a0c37: vmovss xmm0, dword ptr [rax + 0xb48]
0x1003a0c3f: vxorps xmm2, xmm2, xmm2
0x1003a0c43: vucomiss xmm0, xmm2
0x1003a0c47: jne 0x1003a0d2f
0x1003a0c4d: jp 0x1003a0d2f
0x1003a0c53: cmp byte ptr [r13 + 0xa4], 0
0x1003a0c5b: vmovss dword ptr [rbp - 0x38], xmm1
0x1003a0c60: jne 0x1003a0da1
0x1003a0c66: cmp byte ptr [r13 + 0x45], 0
0x1003a0c6b: je 0x1003a0cdd
0x1003a0c6d: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1003a0c75: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x1003a0c7a: vxorps xmm1, xmm1, xmm1
0x1003a0c7e: vblendps xmm0, xmm0, xmm1, 2
0x1003a0c84: vmulps xmm1, xmm0, xmm0
0x1003a0c88: vmovshdup xmm2, xmm1
0x1003a0c8c: vaddss xmm2, xmm1, xmm2
0x1003a0c90: vpermilpd xmm1, xmm1, 1
0x1003a0c96: vaddss xmm1, xmm1, xmm2
0x1003a0c9a: vsqrtss xmm1, xmm1, xmm1
0x1003a0c9e: vucomiss xmm1, dword ptr [rip + 0x706c1e] ; 0x100aa78c4
0x1003a0ca6: jbe 0x1003a0cb2
0x1003a0ca8: vpermilps xmm1, xmm1, 0xc0
0x1003a0cae: vdivps xmm0, xmm0, xmm1
0x1003a0cb2: vpermilpd xmm1, xmm0, 1
0x1003a0cb8: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x1003a0cbd: mov rax, qword ptr [rbx]
0x1003a0cc0: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0cc5: vmulss xmm1, xmm1, dword ptr [r13 + 0x50]
0x1003a0ccb: movzx esi, byte ptr [r13 + 0x54]
0x1003a0cd0: xor edx, edx
0x1003a0cd2: mov rdi, rbx
0x1003a0cd5: call qword ptr [rax + 0x20]
0x1003a0cd8: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0cdd: cmp byte ptr [r13 + 0x44], 0
0x1003a0ce2: je 0x1003a0da1
0x1003a0ce8: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1003a0cf0: vsubps xmm1, xmm0, xmmword ptr [rbp - 0x60]
0x1003a0cf5: vxorps xmm0, xmm0, xmm0
0x1003a0cf9: vblendps xmm0, xmm1, xmm0, 2
0x1003a0cff: vmulps xmm2, xmm0, xmm0
0x1003a0d03: vmovshdup xmm3, xmm2
0x1003a0d07: vaddss xmm3, xmm2, xmm3
0x1003a0d0b: vpermilpd xmm2, xmm2, 1
0x1003a0d11: vaddss xmm2, xmm2, xmm3
0x1003a0d15: vsqrtss xmm2, xmm2, xmm2
0x1003a0d19: vucomiss xmm2, dword ptr [rip + 0x706ba3] ; 0x100aa78c4
0x1003a0d21: jbe 0x1003a0d3f
0x1003a0d23: vpermilps xmm2, xmm2, 0xc0
0x1003a0d29: vdivps xmm2, xmm0, xmm2
0x1003a0d2d: jmp 0x1003a0d49 ; 0x1003a0d49
0x1003a0d2f: cmp byte ptr [r13 + 0x7c], 0
0x1003a0d34: jne 0x1003a0e03
0x1003a0d3a: jmp 0x1003a0c53 ; 0x1003a0c53
0x1003a0d3f: vxorps ymm0, ymm0, ymm0
0x1003a0d43: vblendps xmm2, xmm1, xmm0, 2
0x1003a0d49: vmulps xmm0, xmm1, xmmword ptr [rip + 0x70734f] ; 0x100aa80a0
0x1003a0d51: vmovshdup xmm3, xmm0
0x1003a0d55: vaddss xmm3, xmm0, xmm3
0x1003a0d59: vpermilpd xmm0, xmm0, 1
0x1003a0d5f: vaddss xmm0, xmm0, xmm3
0x1003a0d63: vmulps xmm1, xmm1, xmm2
0x1003a0d67: vmovshdup xmm2, xmm1
0x1003a0d6b: vaddss xmm2, xmm1, xmm2
0x1003a0d6f: vpermilpd xmm1, xmm1, 1
0x1003a0d75: vaddss xmm1, xmm1, xmm2
0x1003a0d79: vzeroupper 
0x1003a0d7c: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x1003a0d81: mov rax, qword ptr [rbx]
0x1003a0d84: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0d89: vmulss xmm1, xmm1, dword ptr [r13 + 0x4c]
0x1003a0d8f: movzx esi, byte ptr [r13 + 0x54]
0x1003a0d94: xor edx, edx
0x1003a0d96: mov rdi, rbx
0x1003a0d99: call qword ptr [rax + 0x28]
0x1003a0d9c: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0da1: cmp byte ptr [r13 + 0x46], 0
0x1003a0da6: je 0x1003a0dbc
0x1003a0da8: mov rax, qword ptr [rbx]
0x1003a0dab: vmovss xmm0, dword ptr [r13 + 0x40]
0x1003a0db1: mov rdi, rbx
0x1003a0db4: call qword ptr [rax + 0x30]
0x1003a0db7: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0dbc: cmp byte ptr [r13 + 0x47], 0
0x1003a0dc1: je 0x1003a0ddd
0x1003a0dc3: mov rax, qword ptr [rbx]
0x1003a0dc6: vmovss xmm0, dword ptr [r13 + 0x64]
0x1003a0dcc: vmovss xmm1, dword ptr [r13 + 0x68]
0x1003a0dd2: mov rdi, rbx
0x1003a0dd5: call qword ptr [rax + 0x38]
0x1003a0dd8: vmovss xmm1, dword ptr [rbp - 0x38]
0x1003a0ddd: cmp byte ptr [r13 + 0x48], 0
0x1003a0de2: je 0x1003a0df3
0x1003a0de4: mov rax, qword ptr [rbx]
0x1003a0de7: vmovss xmm0, dword ptr [r13 + 0x6c]
0x1003a0ded: mov rdi, rbx
0x1003a0df0: call qword ptr [rax + 0x48]
0x1003a0df3: cmp byte ptr [r13 + 0x49], 0
0x1003a0df8: je 0x1003a0e03
0x1003a0dfa: mov rax, qword ptr [rbx]
0x1003a0dfd: mov rdi, rbx
0x1003a0e00: call qword ptr [rax + 0x50]
0x1003a0e03: vmovss xmm0, dword ptr [rbp - 0x4c]
0x1003a0e08: vaddss xmm0, xmm0, dword ptr [r13 + 0x90]
0x1003a0e11: vmovss dword ptr [r13 + 0x90], xmm0
0x1003a0e1a: vmovss xmm1, dword ptr [r13 + 0x58]
0x1003a0e20: vxorps xmm2, xmm2, xmm2
0x1003a0e24: vucomiss xmm1, xmm2
0x1003a0e28: jbe 0x1003a0e43
0x1003a0e2a: vucomiss xmm0, xmm1
0x1003a0e2e: jb 0x1003a0e43
0x1003a0e30: mov dword ptr [r13 + 0x90], 0
0x1003a0e3b: mov rdi, r13
0x1003a0e3e: call 0x10032ef60 ; 0x10032ef60
0x1003a0e43: add rsp, 0x178
0x1003a0e4a: pop rbx
0x1003a0e4b: pop r12
0x1003a0e4d: pop r13
0x1003a0e4f: pop r14
0x1003a0e51: pop r15
0x1003a0e53: pop rbp
0x1003a0e54: ret 
0x1003a0e55: lea rdi, [rip + 0x7c0c9c] ; 0x100b61af8 ret
0x1003a0e5c: lea rsi, [rip + 0x7c0b00] ; 0x100b61963 ./Clump.h
0x1003a0e63: mov edx, 0x47
0x1003a0e68: mov ecx, 3
0x1003a0e6d: call 0x1007e5f70 ; 0x1007e5f70
0x1003a0e72: ud2 
0x1003a0e74: lea rdi, [rip + 0x7c0add] ; 0x100b61958 idx < size
0x1003a0e7b: lea rsi, [rip + 0x7c0ae1] ; 0x100b61963 ./Clump.h
0x1003a0e82: mov edx, 0x36
0x1003a0e87: mov ecx, 3
0x1003a0e8c: call 0x1007e5f70 ; 0x1007e5f70
0x1003a0e91: ud2 
0x1003a0e93: nop word ptr cs:[rax + rax]
