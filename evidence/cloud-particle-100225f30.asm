0x100225f30: push rbp
0x100225f31: mov rbp, rsp
0x100225f34: push r15
0x100225f36: push r14
0x100225f38: push r13
0x100225f3a: push r12
0x100225f3c: push rbx
0x100225f3d: sub rsp, 0x2eb8
0x100225f44: mov rbx, rdx
0x100225f47: mov r13, rsi
0x100225f4a: mov r12, rdi
0x100225f4d: mov rax, qword ptr [rip + 0x9e7984] ; 0x100c0d8d8
0x100225f54: mov rax, qword ptr [rax]
0x100225f57: mov qword ptr [rbp - 0x30], rax
0x100225f5b: call 0x1007e8410 ; 0x1007e8410
0x100225f60: vmovsd qword ptr [rbp - 0x2de8], xmm0
0x100225f68: lea rdi, [rbp - 0x2d30]
0x100225f6f: mov rsi, rbx
0x100225f72: call 0x10076be90 ; 0x10076be90
0x100225f77: vmovaps xmm6, xmmword ptr [rbp - 0x2d30]
0x100225f7f: vmovshdup xmm7, xmm6
0x100225f83: vmovapd xmm2, xmmword ptr [rbx + 0x140]
0x100225f8b: vmovapd xmm1, xmmword ptr [rbx + 0x150]
0x100225f93: vmovapd xmm0, xmmword ptr [rbx + 0x160]
0x100225f9b: vmovss xmm3, dword ptr [r13 + 0x14]
0x100225fa1: vmovss xmm4, dword ptr [r13 + 0x20]
0x100225fa7: lea rax, [rip + 0x1dd5122] ; 0x101ffb0d0
0x100225fae: cmp byte ptr [rax], 0
0x100225fb1: je 0x100225fc0
0x100225fb3: lea rax, [rip + 0xa92586] ; 0x100cb8540
0x100225fba: vmovss xmm5, dword ptr [rax]
0x100225fbe: jmp 0x100225fc8 ; 0x100225fc8
0x100225fc0: vmovss xmm5, dword ptr [rip + 0x87f0f8] ; 0x100aa50c0
0x100225fc8: vmovaps xmmword ptr [rbp - 0x2ed0], xmm7
0x100225fd0: vmulss xmm4, xmm4, xmm5
0x100225fd4: vmulss xmm3, xmm3, xmm4
0x100225fd8: mov r14, qword ptr [rbp + 0x18]
0x100225fdc: vmovss xmm4, dword ptr [rip + 0x880ab8] ; 0x100aa6a9c
0x100225fe4: vmaxss xmm3, xmm4, xmm3
0x100225fe8: vmovss xmm4, dword ptr [r13 + 0x24]
0x100225fee: vmovss dword ptr [rbp - 0x2dc4], xmm4
0x100225ff6: mov eax, 0x230
0x100225ffb: mov rcx, qword ptr [rip + 0x88209e] ; 0x100aa80a0
0x100226002: mov rdx, qword ptr [rip + 0x882a27] ; 0x100aa8a30
0x100226009: vmovss xmm7, dword ptr [rip + 0x87f0af] ; 0x100aa50c0
0x100226011: vxorps xmm4, xmm4, xmm4
0x100226015: vmovaps xmm5, xmmword ptr [rip + 0x8829e3] ; 0x100aa8a00
0x10022601d: nop dword ptr [rax]
0x100226020: mov qword ptr [rbp + rax - 0x2f10], rcx
0x100226028: mov dword ptr [rbp + rax - 0x2f08], 0
0x100226033: mov qword ptr [rbp + rax - 0x2f00], rdx
0x10022603b: mov dword ptr [rbp + rax - 0x2ef8], 0x3f800000
0x100226046: vmovlps qword ptr [rbp + rax - 0x2ef0], xmm7
0x10022604f: mov dword ptr [rbp + rax - 0x2ee8], 0
0x10022605a: vmovaps xmmword ptr [rbp + rax - 0x2ee0], xmm5
0x100226063: mov dword ptr [rbp + rax - 0x2ed0], 0x3f800000
0x10022606e: vmovlps qword ptr [rbp + rax - 0x2ec0], xmm4
0x100226077: mov dword ptr [rbp + rax - 0x2eb8], 0
0x100226082: vmovlps qword ptr [rbp + rax - 0x2eb0], xmm4
0x10022608b: mov dword ptr [rbp + rax - 0x2ea8], 0
0x100226096: mov qword ptr [rbp + rax - 0x2e50], rcx
0x10022609e: mov dword ptr [rbp + rax - 0x2e48], 0
0x1002260a9: mov qword ptr [rbp + rax - 0x2e40], rdx
0x1002260b1: mov dword ptr [rbp + rax - 0x2e38], 0x3f800000
0x1002260bc: vmovlps qword ptr [rbp + rax - 0x2e30], xmm7
0x1002260c5: mov dword ptr [rbp + rax - 0x2e28], 0
0x1002260d0: vmovaps xmmword ptr [rbp + rax - 0x2e20], xmm5
0x1002260d9: mov dword ptr [rbp + rax - 0x2e10], 0x3f800000
0x1002260e4: vmovlps qword ptr [rbp + rax - 0x2e00], xmm4
0x1002260ed: mov dword ptr [rbp + rax - 0x2df8], 0
0x1002260f8: vmovlps qword ptr [rbp + rax - 0x2df0], xmm4
0x100226101: mov dword ptr [rbp + rax - 0x2de8], 0
0x10022610c: mov qword ptr [rbp + rax - 0x2d90], rcx
0x100226114: mov dword ptr [rbp + rax - 0x2d88], 0
0x10022611f: mov qword ptr [rbp + rax - 0x2d80], rdx
0x100226127: mov dword ptr [rbp + rax - 0x2d78], 0x3f800000
0x100226132: vmovlps qword ptr [rbp + rax - 0x2d70], xmm7
0x10022613b: mov dword ptr [rbp + rax - 0x2d68], 0
0x100226146: vmovaps xmmword ptr [rbp + rax - 0x2d60], xmm5
0x10022614f: mov dword ptr [rbp + rax - 0x2d50], 0x3f800000
0x10022615a: vmovlps qword ptr [rbp + rax - 0x2d40], xmm4
0x100226163: mov dword ptr [rbp + rax - 0x2d38], 0
0x10022616e: vmovlps qword ptr [rbp + rax - 0x2d30], xmm4
0x100226177: mov dword ptr [rbp + rax - 0x2d28], 0
0x100226182: add rax, 0x240
0x100226188: cmp rax, 0x2630
0x10022618e: jne 0x100226020
0x100226194: vmovaps xmmword ptr [rbp - 0x2ee0], xmm6
0x10022619c: vpermilpd xmm4, xmm6, 1
0x1002261a2: vmovapd xmmword ptr [rbp - 0x2ec0], xmm4
0x1002261aa: vpermilpd xmm2, xmm2, 1
0x1002261b0: vmovapd xmmword ptr [rbp - 0x2eb0], xmm2
0x1002261b8: vpermilpd xmm1, xmm1, 1
0x1002261be: vmovapd xmmword ptr [rbp - 0x2ea0], xmm1
0x1002261c6: vpermilpd xmm0, xmm0, 1
0x1002261cc: vmovapd xmmword ptr [rbp - 0x2e90], xmm0
0x1002261d4: vmovss xmm0, dword ptr [rip + 0x8808c4] ; 0x100aa6aa0
0x1002261dc: vminss xmm0, xmm0, xmm3
0x1002261e0: vmovaps xmmword ptr [rbp - 0x2db0], xmm0
0x1002261e8: vpermilps xmm0, xmm0, 0xc0
0x1002261ee: vmovaps xmmword ptr [rbp - 0x2d90], xmm0
0x1002261f6: xor r15d, r15d
0x1002261f9: xor r13d, r13d
0x1002261fc: nop dword ptr [rax]
0x100226200: mov rdi, r14
0x100226203: mov esi, r13d
0x100226206: call 0x1001031d0 ; 0x1001031d0
0x10022620b: mov rbx, rax
0x10022620e: test rbx, rbx
0x100226211: je 0x1002264b0
0x100226217: mov rdi, rbx
0x10022621a: call 0x1000ff1e0 ; 0x1000ff1e0
0x10022621f: test al, al
0x100226221: vmovss xmm0, dword ptr [rip + 0x87ee97] ; 0x100aa50c0
0x100226229: je 0x1002264b0
0x10022622f: mov eax, r15d
0x100226232: mov rdx, qword ptr [rbx + 0x18]
0x100226236: mov rcx, qword ptr [rbx + 0x60]
0x10022623a: lea rax, [rax + rax*2]
0x10022623e: shl rax, 6
0x100226242: vmovaps xmm8, xmmword ptr [rdx + 0x20]
0x100226247: vmovaps xmmword ptr [rbp + rax - 0x2d30], xmm8
0x100226250: vmovaps xmm1, xmmword ptr [rdx + 0x10]
0x100226255: vmovaps xmmword ptr [rbp + rax - 0x2d20], xmm1
0x10022625e: vmovaps xmm1, xmmword ptr [rdx + 0x10]
0x100226263: vsubps xmm1, xmm1, xmmword ptr [rdx + 0x20]
0x100226268: vdivps xmm2, xmm1, xmmword ptr [rbp - 0x2d90]
0x100226270: vmovaps xmmword ptr [rbp + rax - 0x2d10], xmm2
0x100226279: vmulps xmm1, xmm2, xmm2
0x10022627d: vmovshdup xmm3, xmm1
0x100226281: vaddss xmm3, xmm1, xmm3
0x100226285: vpermilpd xmm1, xmm1, 1
0x10022628b: vaddss xmm1, xmm1, xmm3
0x10022628f: vsqrtss xmm1, xmm1, xmm1
0x100226293: vmovss xmm12, dword ptr [rip + 0x881629] ; 0x100aa78c4
0x10022629b: vucomiss xmm1, xmm12
0x1002262a0: jbe 0x1002262ac
0x1002262a2: vpermilps xmm3, xmm1, 0xc0
0x1002262a8: vdivps xmm2, xmm2, xmm3
0x1002262ac: vmovaps xmmword ptr [rbp + rax - 0x2d00], xmm2
0x1002262b5: vmovaps xmm2, xmmword ptr [rcx + 0xfe0]
0x1002262bd: vmovaps xmmword ptr [rbp + rax - 0x2cf0], xmm2
0x1002262c6: mov edx, dword ptr [rcx + 0xff0]
0x1002262cc: mov dword ptr [rbp + rax - 0x2cb0], edx
0x1002262d3: mov edx, dword ptr [rcx + 0xff8]
0x1002262d9: mov dword ptr [rbp + rax - 0x2cac], edx
0x1002262e0: mov rdx, qword ptr [rbx + 0x60]
0x1002262e4: vmovaps xmm2, xmmword ptr [rdx + 0xfe0]
0x1002262ec: vmulps xmm2, xmm2, xmm2
0x1002262f0: vmovshdup xmm3, xmm2
0x1002262f4: vaddss xmm3, xmm2, xmm3
0x1002262f8: vpermilpd xmm2, xmm2, 1
0x1002262fe: vaddss xmm2, xmm2, xmm3
0x100226302: vsqrtss xmm2, xmm2, xmm2
0x100226306: vaddss xmm2, xmm2, dword ptr [rip + 0x88baa2] ; 0x100ab1db0
0x10022630e: vdivss xmm2, xmm2, dword ptr [rip + 0x88ba9e] ; 0x100ab1db4
0x100226316: vxorps xmm5, xmm5, xmm5
0x10022631a: vmaxss xmm2, xmm5, xmm2
0x10022631e: vminss xmm2, xmm0, xmm2
0x100226322: vmovss dword ptr [rbp + rax - 0x2ca8], xmm2
0x10022632b: mov dword ptr [rbp + rax - 0x2ca4], 0x3f800000
0x100226336: vaddss xmm1, xmm1, dword ptr [rip + 0x8854da] ; 0x100aab818
0x10022633e: vdivss xmm1, xmm1, dword ptr [rip + 0x8849e2] ; 0x100aaad28
0x100226346: vmaxss xmm1, xmm5, xmm1
0x10022634a: vminss xmm1, xmm0, xmm1
0x10022634e: vsubss xmm2, xmm0, xmm1
0x100226352: vmulss xmm2, xmm2, dword ptr [rip + 0x88264e] ; 0x100aa89a8
0x10022635a: vmulss xmm1, xmm1, dword ptr [rip + 0x88485a] ; 0x100aaabbc
0x100226362: vaddss xmm1, xmm1, xmm2
0x100226366: vmovss dword ptr [rbp + rax - 0x2ca0], xmm1
0x10022636f: vmovaps xmm1, xmmword ptr [rcx + 0xfd0]
0x100226377: vpermilps xmm2, xmm1, 0xe7
0x10022637d: vmovshdup xmm3, xmm1
0x100226381: vmulss xmm4, xmm3, xmm5
0x100226385: vaddss xmm0, xmm2, xmm4
0x100226389: vpermilpd xmm6, xmm1, 1
0x10022638f: vmulss xmm7, xmm6, xmm5
0x100226393: vsubss xmm10, xmm0, xmm7
0x100226397: vmulss xmm0, xmm2, xmm5
0x10022639b: vaddss xmm9, xmm6, xmm0
0x10022639f: vmulss xmm5, xmm1, xmm5
0x1002263a3: vsubss xmm9, xmm9, xmm5
0x1002263a7: vaddss xmm0, xmm0, xmm5
0x1002263ab: vsubss xmm0, xmm0, xmm3
0x1002263af: vaddss xmm4, xmm1, xmm4
0x1002263b3: vaddss xmm4, xmm7, xmm4
0x1002263b7: vmulss xmm5, xmm1, xmm4
0x1002263bb: vmulss xmm7, xmm2, xmm10
0x1002263c0: vaddss xmm5, xmm5, xmm7
0x1002263c4: vmulss xmm7, xmm6, xmm9
0x1002263c9: vsubss xmm5, xmm5, xmm7
0x1002263cd: vmulss xmm7, xmm3, xmm0
0x1002263d1: vaddss xmm11, xmm7, xmm5
0x1002263d5: vmulss xmm7, xmm3, xmm4
0x1002263d9: vmulss xmm5, xmm2, xmm9
0x1002263de: vaddss xmm5, xmm7, xmm5
0x1002263e2: vmulss xmm7, xmm1, xmm0
0x1002263e6: vsubss xmm5, xmm5, xmm7
0x1002263ea: vmulss xmm7, xmm6, xmm10
0x1002263ef: vaddss xmm5, xmm7, xmm5
0x1002263f3: vmulss xmm4, xmm6, xmm4
0x1002263f7: vmulss xmm0, xmm2, xmm0
0x1002263fb: vaddss xmm0, xmm4, xmm0
0x1002263ff: vmulss xmm2, xmm3, xmm10
0x100226404: vsubss xmm0, xmm0, xmm2
0x100226408: vmulss xmm1, xmm1, xmm9
0x10022640d: vaddss xmm0, xmm1, xmm0
0x100226411: vinsertps xmm1, xmm11, xmm5, 0x10
0x100226417: vinsertps xmm0, xmm1, xmm0, 0x20
0x10022641d: vmovaps xmm1, xmmword ptr [rbp - 0x2d40]
0x100226425: vblendps xmm1, xmm0, xmm1, 8
0x10022642b: vmovaps xmmword ptr [rbp - 0x2d40], xmm1
0x100226433: vmovaps xmmword ptr [rbp + rax - 0x2cc0], xmm1
0x10022643c: mov rcx, qword ptr [rbx + 0x18]
0x100226440: vmovaps xmm1, xmmword ptr [rcx + 0x70]
0x100226445: vmovaps xmmword ptr [rbp + rax - 0x2ce0], xmm1
0x10022644e: mov rcx, qword ptr [rbx + 0x18]
0x100226452: vmovaps xmm2, xmmword ptr [rcx + 0x60]
0x100226457: vmovaps xmmword ptr [rbp + rax - 0x2cd0], xmm2
0x100226460: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8825d8] ; 0x100aa8a40
0x100226468: vsubps xmm2, xmm8, xmm0
0x10022646c: vmulps xmm1, xmm1, xmmword ptr [rip + 0x883bdc] ; 0x100aaa050
0x100226474: vsubps xmm2, xmm2, xmm1
0x100226478: vmovaps xmmword ptr [rbp + rax - 0x2c90], xmm2
0x100226481: vaddps xmm0, xmm8, xmm0
0x100226485: vsubps xmm0, xmm0, xmm1
0x100226489: vmovaps xmmword ptr [rbp + rax - 0x2c80], xmm0
0x100226492: inc r15d
0x100226495: inc r13d
0x100226498: cmp r13d, 0x10
0x10022649c: jb 0x100226200
0x1002264a2: jmp 0x1002264c5 ; 0x1002264c5
0x1002264a4: nop word ptr cs:[rax + rax]
0x1002264b0: vmovss xmm12, dword ptr [rip + 0x88140c] ; 0x100aa78c4
0x1002264b8: inc r13d
0x1002264bb: cmp r13d, 0x10
0x1002264bf: jb 0x100226200
0x1002264c5: mov eax, dword ptr [r12 + 0xc820]
0x1002264cd: test rax, rax
0x1002264d0: je 0x10022658a
0x1002264d6: lea rdx, [r12 + 0xc050]
0x1002264de: mov esi, r15d
0x1002264e1: xor ecx, ecx
0x1002264e3: nop word ptr cs:[rax + rax]
0x1002264f0: lea edi, [rsi + rcx]
0x1002264f3: lea rdi, [rdi + rdi*2]
0x1002264f7: shl rdi, 6
0x1002264fb: vmovaps xmm0, xmmword ptr [rdx - 0x20]
0x100226500: vmovaps xmmword ptr [rbp + rdi - 0x2d30], xmm0
0x100226509: vmovaps xmm1, xmmword ptr [rdx - 0x30]
0x10022650e: vmovaps xmmword ptr [rbp + rdi - 0x2d20], xmm1
0x100226517: vsubps xmm0, xmm1, xmm0
0x10022651b: vdivps xmm0, xmm0, xmmword ptr [rbp - 0x2d90]
0x100226523: vmovaps xmmword ptr [rbp + rdi - 0x2d10], xmm0
0x10022652c: vmulps xmm1, xmm0, xmm0
0x100226530: vmovshdup xmm2, xmm1
0x100226534: vaddss xmm2, xmm1, xmm2
0x100226538: vpermilpd xmm1, xmm1, 1
0x10022653e: vaddss xmm1, xmm1, xmm2
0x100226542: vsqrtss xmm1, xmm1, xmm1
0x100226546: vucomiss xmm1, xmm12
0x10022654b: jbe 0x100226557
0x10022654d: vpermilps xmm1, xmm1, 0xc0
0x100226553: vdivps xmm0, xmm0, xmm1
0x100226557: vmovaps xmmword ptr [rbp + rdi - 0x2d00], xmm0
0x100226560: vmovaps xmm0, xmmword ptr [rdx]
0x100226564: vmovaps xmmword ptr [rbp + rdi - 0x2cf0], xmm0
0x10022656d: mov ebx, dword ptr [rdx - 0x10]
0x100226570: mov dword ptr [rbp + rdi - 0x2ca4], ebx
0x100226577: inc rcx
0x10022657a: add rdx, 0x40
0x10022657e: cmp rcx, rax
0x100226581: jb 0x1002264f0
0x100226587: add r15d, ecx
0x10022658a: mov dword ptr [rbp - 0x2d48], r15d
0x100226591: mov dword ptr [r12 + 0xc820], 0
0x10022659d: cmp byte ptr [rip + 0x1bbc19c], 0 ; 0x101de2740
0x1002265a4: je 0x10022660f
0x1002265a6: cmp dword ptr [rbp - 0x2d48], 0
0x1002265ad: je 0x10022660f
0x1002265af: mov r15d, dword ptr [rbp - 0x2d48]
0x1002265b6: lea rbx, [rbp - 0x2d30]
0x1002265bd: xor r13d, r13d
0x1002265c0: lea r14, [rip + 0x1e19049] ; 0x10203f610
0x1002265c7: nop word ptr [rax + rax]
0x1002265d0: vmovss xmm0, dword ptr [rbx + 0x8c]
0x1002265d8: vmovss dword ptr [rbp - 0x2d40], xmm0
0x1002265e0: call 0x1002b9810 ; 0x1002b9810
0x1002265e5: mov ecx, 1
0x1002265ea: mov rdi, rax
0x1002265ed: mov rsi, rbx
0x1002265f0: vmovss xmm0, dword ptr [rbp - 0x2d40]
0x1002265f8: mov rdx, r14
0x1002265fb: call 0x1002bb510 ; 0x1002bb510
0x100226600: inc r13
0x100226603: add rbx, 0xc0
0x10022660a: cmp r13, r15
0x10022660d: jb 0x1002265d0
0x10022660f: mov eax, dword ptr [r12 + 0xc824]
0x100226617: mov ecx, dword ptr [r12 + 0xc828]
0x10022661f: test ecx, ecx
0x100226621: je 0x1002266d8
0x100226627: vmovaps xmm0, xmmword ptr [rbp - 0x2db0]
0x10022662f: vmulss xmm11, xmm0, dword ptr [rip + 0x888d55] ; 0x100aaf38c
0x100226637: mov edx, eax
0x100226639: and edx, 0x3ff
0x10022663f: vmovss xmm1, dword ptr [r12 + rdx*4 + 0x8018]
0x100226649: vsubss xmm1, xmm1, xmm11
0x10022664e: vmovss dword ptr [r12 + rdx*4 + 0x8018], xmm1
0x100226658: vxorpd xmm2, xmm2, xmm2
0x10022665c: xor edi, edi
0x10022665e: vucomiss xmm2, xmm1
0x100226662: seta dil
0x100226666: mov edx, 1
0x10022666b: cmp ecx, 1
0x10022666e: je 0x1002266dc
0x100226670: cmp ecx, 2
0x100226673: mov r10d, 2
0x100226679: mov r9d, 2
0x10022667f: cmova r9d, ecx
0x100226683: dec r9d
0x100226686: mov edx, 1
0x10022668b: cmp r9d, 0x1f
0x10022668f: ja 0x100227f04
0x100226695: vpxor xmm1, xmm1, xmm1
0x100226699: nop dword ptr [rax]
0x1002266a0: lea esi, [rax + rdx]
0x1002266a3: and esi, 0x3ff
0x1002266a9: vmovss xmm0, dword ptr [r12 + rsi*4 + 0x8018]
0x1002266b3: vsubss xmm0, xmm0, xmm11
0x1002266b8: vmovss dword ptr [r12 + rsi*4 + 0x8018], xmm0
0x1002266c2: xor esi, esi
0x1002266c4: vucomiss xmm1, xmm0
0x1002266c8: seta sil
0x1002266cc: add edi, esi
0x1002266ce: inc edx
0x1002266d0: cmp edx, ecx
0x1002266d2: jb 0x1002266a0
0x1002266d4: mov edx, ecx
0x1002266d6: jmp 0x1002266dc ; 0x1002266dc
0x1002266d8: xor edi, edi
0x1002266da: xor edx, edx
0x1002266dc: add eax, edi
0x1002266de: and eax, 0x3ff
0x1002266e3: mov dword ptr [r12 + 0xc824], eax
0x1002266eb: sub edx, edi
0x1002266ed: mov dword ptr [r12 + 0xc828], edx
0x1002266f5: je 0x100228293
0x1002266fb: vzeroupper 
0x1002266fe: call 0x1007c6c20 ; 0x1007c6c20
0x100226703: lea rcx, [rip + 0x1e22446] ; 0x102048b50
0x10022670a: mov rdx, qword ptr [rcx]
0x10022670d: mov esi, 0x1000
0x100226712: mov ecx, 4
0x100226717: mov rdi, rax
0x10022671a: call 0x100795530 ; 0x100795530
0x10022671f: mov r14, rax
0x100226722: mov qword ptr [rbp - 0x2d68], r14
0x100226729: call 0x1007c6c20 ; 0x1007c6c20
0x10022672e: lea rcx, [rip + 0x1e2241b] ; 0x102048b50
0x100226735: mov rdx, qword ptr [rcx]
0x100226738: mov esi, 0x1000
0x10022673d: mov ecx, 4
0x100226742: mov rdi, rax
0x100226745: call 0x100795530 ; 0x100795530
0x10022674a: mov r15, rax
0x10022674d: mov qword ptr [rbp - 0x2dc0], r15
0x100226754: call 0x1007c6c20 ; 0x1007c6c20
0x100226759: lea rcx, [rip + 0x1e223f0] ; 0x102048b50
0x100226760: mov rdx, qword ptr [rcx]
0x100226763: mov esi, 0x1000
0x100226768: mov ecx, 4
0x10022676d: mov rdi, rax
0x100226770: call 0x100795530 ; 0x100795530
0x100226775: mov rbx, rax
0x100226778: lea rsi, [r12 + 0x18]
0x10022677d: mov edx, 0x1000
0x100226782: mov rdi, r14
0x100226785: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10022678a: lea rsi, [r12 + 0x1018]
0x100226792: mov edx, 0x1000
0x100226797: mov rdi, r15
0x10022679a: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10022679f: lea rsi, [r12 + 0x2018]
0x1002267a7: mov edx, 0x1000
0x1002267ac: mov rdi, rbx
0x1002267af: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1002267b4: mov qword ptr [rbp - 0x2db8], rbx
0x1002267bb: call 0x1007c6c20 ; 0x1007c6c20
0x1002267c0: lea rcx, [rip + 0x1e22389] ; 0x102048b50
0x1002267c7: mov rdx, qword ptr [rcx]
0x1002267ca: mov esi, 0x1000
0x1002267cf: mov ecx, 4
0x1002267d4: mov rdi, rax
0x1002267d7: call 0x100795530 ; 0x100795530
0x1002267dc: mov r13, rax
0x1002267df: mov qword ptr [rbp - 0x2d60], r13
0x1002267e6: call 0x1007c6c20 ; 0x1007c6c20
0x1002267eb: lea rcx, [rip + 0x1e2235e] ; 0x102048b50
0x1002267f2: mov rdx, qword ptr [rcx]
0x1002267f5: mov esi, 0x1000
0x1002267fa: mov ecx, 4
0x1002267ff: mov rdi, rax
0x100226802: call 0x100795530 ; 0x100795530
0x100226807: mov rbx, rax
0x10022680a: mov qword ptr [rbp - 0x2d78], rbx
0x100226811: call 0x1007c6c20 ; 0x1007c6c20
0x100226816: lea rcx, [rip + 0x1e22333] ; 0x102048b50
0x10022681d: mov rdx, qword ptr [rcx]
0x100226820: mov esi, 0x1000
0x100226825: mov ecx, 4
0x10022682a: mov rdi, rax
0x10022682d: call 0x100795530 ; 0x100795530
0x100226832: mov qword ptr [rbp - 0x2d70], rax
0x100226839: vmovaps xmm0, xmmword ptr [rbp - 0x2db0]
0x100226841: vmulss xmm0, xmm0, dword ptr [rip + 0x88b56f] ; 0x100ab1db8
0x100226849: call 0x100aa2708 ; 0x100aa2708 _expf
0x10022684e: vmovss dword ptr [rbp - 0x2d40], xmm0
0x100226856: vmovaps xmm0, xmmword ptr [rbp - 0x2db0]
0x10022685e: vmulss xmm0, xmm0, dword ptr [rip + 0x88b556] ; 0x100ab1dbc
0x100226866: call 0x100aa2708 ; 0x100aa2708 _expf
0x10022686b: vmovss dword ptr [rbp - 0x2da0], xmm0
0x100226873: call 0x1007e8410 ; 0x1007e8410
0x100226878: vmovsd qword ptr [rbp - 0x2e48], xmm0
0x100226880: cmp dword ptr [r12 + 0xc828], 0
0x100226889: vmovss xmm9, dword ptr [rip + 0x87e82f] ; 0x100aa50c0
0x100226891: vmovss xmm10, dword ptr [rip + 0x88102b] ; 0x100aa78c4
0x100226899: je 0x10022788b
0x10022689f: vsubss xmm0, xmm9, dword ptr [rbp - 0x2d40]
0x1002268a7: vsubss xmm2, xmm9, dword ptr [rbp - 0x2da0]
0x1002268af: vsubss xmm1, xmm9, xmm0
0x1002268b3: vpermilps xmm1, xmm1, 0xc0
0x1002268b9: vmovaps xmmword ptr [rbp - 0x2e80], xmm1
0x1002268c1: vpermilps xmm0, xmm0, 0xc0
0x1002268c7: vmovaps xmmword ptr [rbp - 0x2e70], xmm0
0x1002268cf: vmovss dword ptr [rbp - 0x2dcc], xmm2
0x1002268d7: vsubss xmm0, xmm9, xmm2
0x1002268db: vmovss dword ptr [rbp - 0x2dc8], xmm0
0x1002268e3: mov eax, dword ptr [rbp - 0x2d48]
0x1002268e9: mov qword ptr [rbp - 0x2e50], rax
0x1002268f0: xor ecx, ecx
0x1002268f2: movabs r11, 0xaaaaaaaaaaaaaaab
0x1002268fc: vxorps xmm13, xmm13, xmm13
0x100226901: vmovss xmm12, dword ptr [rip + 0x8807eb] ; 0x100aa70f4
0x100226909: vmovss xmm8, dword ptr [rip + 0x880edb] ; 0x100aa77ec
0x100226911: nop word ptr cs:[rax + rax]
0x100226920: mov r15d, dword ptr [r12 + 0xc824]
0x100226928: mov dword ptr [rbp - 0x2d50], ecx
0x10022692e: add r15d, ecx
0x100226931: and r15d, 0x3ff
0x100226938: vmovss xmm1, dword ptr [r12 + r15*4 + 0x18]
0x10022693f: vinsertps xmm1, xmm1, dword ptr [r12 + r15*4 + 0x1018], 0x10
0x10022694a: vmovss xmm2, dword ptr [r12 + r15*4 + 0x2018]
0x100226954: vinsertps xmm1, xmm1, xmm2, 0x20
0x10022695a: vblendps xmm7, xmm1, xmm0, 8
0x100226960: mov eax, 0
0x100226965: cmp dword ptr [rbp - 0x2d48], 0
0x10022696c: je 0x100226a05
0x100226972: xor eax, eax
0x100226974: mov rcx, qword ptr [rbp - 0x2e50]
0x10022697b: lea rdx, [rbp - 0x2d30]
0x100226982: nop word ptr cs:[rax + rax]
0x100226990: mov esi, eax
0x100226992: mov eax, esi
0x100226994: lea rax, [rax + rax*2]
0x100226998: shl rax, 4
0x10022699c: mov qword ptr [rbp + rax - 0x930], rdx
0x1002269a4: vsubps xmm0, xmm7, xmmword ptr [rdx]
0x1002269a8: vmovaps xmmword ptr [rbp + rax - 0x920], xmm0
0x1002269b1: vmulps xmm0, xmm0, xmm0
0x1002269b5: vmovshdup xmm1, xmm0
0x1002269b9: vaddss xmm1, xmm0, xmm1
0x1002269bd: vpermilpd xmm0, xmm0, 1
0x1002269c3: vaddss xmm0, xmm0, xmm1
0x1002269c7: vmovss dword ptr [rbp + rax - 0x910], xmm0
0x1002269d0: vmulss xmm1, xmm8, dword ptr [rdx + 0x8c]
0x1002269d8: vmulss xmm1, xmm1, dword ptr [rdx + 0x90]
0x1002269e0: vmulss xmm1, xmm1, xmm1
0x1002269e4: xor eax, eax
0x1002269e6: vucomiss xmm0, xmm1
0x1002269ea: setbe al
0x1002269ed: add eax, esi
0x1002269ef: add rdx, 0xc0
0x1002269f6: dec rcx
0x1002269f9: jne 0x100226990
0x1002269fb: mov ecx, 3
0x100226a00: cmp eax, 2
0x100226a03: ja 0x100226a07
0x100226a05: mov ecx, eax
0x100226a07: mov r13d, ecx
0x100226a0a: mov rcx, r13
0x100226a0d: shl rcx, 4
0x100226a11: lea rcx, [rcx + rcx*2]
0x100226a15: mov r8d, eax
0x100226a18: mov rax, rcx
0x100226a1b: mov qword ptr [rbp - 0x2d40], rax
0x100226a22: cmp rcx, 0x31
0x100226a26: jb 0x100226b5b
0x100226a2c: cmp qword ptr [rbp - 0x2d40], 0x60
0x100226a34: jb 0x100226b5b
0x100226a3a: lea rax, [r13 - 2]
0x100226a3e: shr rax, 0x3f
0x100226a42: lea r9, [r13 + rax - 2]
0x100226a47: sar r9, 1
0x100226a4a: mov r14, r9
0x100226a4d: nop dword ptr [rax]
0x100226a50: mov rax, r14
0x100226a53: shl rax, 4
0x100226a57: lea rsi, [rax + rax*2]
0x100226a5b: mov rcx, rsi
0x100226a5e: sar rcx, 4
0x100226a62: imul rcx, r11
0x100226a66: cmp r9, rcx
0x100226a69: jl 0x100226b4e
0x100226a6f: lea rbx, [rcx + rcx + 1]
0x100226a74: lea rdx, [rbx + rbx*2]
0x100226a78: shl rdx, 4
0x100226a7c: lea rax, [rbp + rdx - 0x930]
0x100226a84: lea rcx, [rcx + rcx + 2]
0x100226a89: cmp rcx, r13
0x100226a8c: jge 0x100226aa8
0x100226a8e: lea rdi, [rax + 0x30]
0x100226a92: vmovss xmm0, dword ptr [rax + 0x50]
0x100226a97: vucomiss xmm0, dword ptr [rbp + rdx - 0x910]
0x100226aa0: cmova rbx, rcx
0x100226aa4: cmova rax, rdi
0x100226aa8: lea rcx, [r14 + r14*2]
0x100226aac: shl rcx, 4
0x100226ab0: vmovss xmm0, dword ptr [rbp + rcx - 0x910]
0x100226ab9: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226abe: ja 0x100226b4e
0x100226ac4: lea rsi, [rbp + rsi - 0x930]
0x100226acc: mov r10, qword ptr [rsi]
0x100226acf: vmovaps xmm1, xmmword ptr [rbp + rcx - 0x920]
0x100226ad8: nop dword ptr [rax + rax]
0x100226ae0: mov rdx, rax
0x100226ae3: mov rax, qword ptr [rdx]
0x100226ae6: mov qword ptr [rsi], rax
0x100226ae9: vmovaps xmm2, xmmword ptr [rdx + 0x10]
0x100226aee: vmovaps xmmword ptr [rsi + 0x10], xmm2
0x100226af3: mov eax, dword ptr [rdx + 0x20]
0x100226af6: mov dword ptr [rsi + 0x20], eax
0x100226af9: cmp r9, rbx
0x100226afc: jl 0x100226b41
0x100226afe: lea rcx, [rbx + rbx + 1]
0x100226b03: lea rdi, [rcx + rcx*2]
0x100226b07: shl rdi, 4
0x100226b0b: lea rax, [rbp + rdi - 0x930]
0x100226b13: lea rsi, [rbx + rbx + 2]
0x100226b18: cmp rsi, r13
0x100226b1b: jge 0x100226b34
0x100226b1d: vmovss xmm2, dword ptr [rax + 0x50]
0x100226b22: vucomiss xmm2, dword ptr [rbp + rdi - 0x910]
0x100226b2b: jbe 0x100226b34
0x100226b2d: add rax, 0x30
0x100226b31: mov rcx, rsi
0x100226b34: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226b39: mov rsi, rdx
0x100226b3c: mov rbx, rcx
0x100226b3f: jbe 0x100226ae0
0x100226b41: mov qword ptr [rdx], r10
0x100226b44: vmovaps xmmword ptr [rdx + 0x10], xmm1
0x100226b49: vmovss dword ptr [rdx + 0x20], xmm0
0x100226b4e: test r14, r14
0x100226b51: lea r14, [r14 - 1]
0x100226b55: jg 0x100226a50
0x100226b5b: mov rax, qword ptr [rbp - 0x2d40]
0x100226b62: lea r10, [rbp + rax - 0x930]
0x100226b6a: cmp r8d, 4
0x100226b6e: jb 0x100226e60
0x100226b74: mov rsi, qword ptr [rbp - 0x2d40]
0x100226b7b: cmp rsi, 0x5f
0x100226b7f: ja 0x100226c10
0x100226b85: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226b8d: lea rax, [r13 + r13*2]
0x100226b92: shl rax, 4
0x100226b96: lea rcx, [rbp - 0x910]
0x100226b9d: add rax, rcx
0x100226ba0: shl r8, 4
0x100226ba4: lea rdx, [r8 + r8*2]
0x100226ba8: sub rdx, rsi
0x100226bab: nop dword ptr [rax + rax]
0x100226bb0: vmovss xmm1, dword ptr [rax]
0x100226bb4: vucomiss xmm0, xmm1
0x100226bb8: jbe 0x100226bfe
0x100226bba: mov rcx, qword ptr [rax - 0x20]
0x100226bbe: vmovaps xmm0, xmmword ptr [rax - 0x10]
0x100226bc3: mov rsi, qword ptr [rbp - 0x930]
0x100226bca: mov qword ptr [rax - 0x20], rsi
0x100226bce: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226bd6: vmovaps xmmword ptr [rax - 0x10], xmm2
0x100226bdb: mov esi, dword ptr [rbp - 0x910]
0x100226be1: mov dword ptr [rax], esi
0x100226be3: mov qword ptr [rbp - 0x930], rcx
0x100226bea: vmovaps xmmword ptr [rbp - 0x920], xmm0
0x100226bf2: vmovss dword ptr [rbp - 0x910], xmm1
0x100226bfa: vmovaps xmm0, xmm1
0x100226bfe: add rax, 0x30
0x100226c02: add rdx, -0x30
0x100226c06: jne 0x100226bb0
0x100226c08: jmp 0x100226e60 ; 0x100226e60
0x100226c0d: nop dword ptr [rax]
0x100226c10: lea rax, [r8 + r8*2]
0x100226c14: shl rax, 4
0x100226c18: lea r9, [rbp + rax - 0x930]
0x100226c20: lea rax, [r13 - 2]
0x100226c24: shr rax, 0x3f
0x100226c28: lea r8, [r13 + rax - 2]
0x100226c2d: sar r8, 1
0x100226c30: mov rdi, r10
0x100226c33: mov rax, r10
0x100226c36: cmp rsi, 0x60
0x100226c3a: jne 0x100226d40
0x100226c40: vmovss xmm0, dword ptr [rax + 0x20]
0x100226c45: vmovss xmm1, dword ptr [rbp - 0x910]
0x100226c4d: vucomiss xmm1, xmm0
0x100226c51: jbe 0x100226d2e
0x100226c57: mov r14, qword ptr [rax]
0x100226c5a: vmovaps xmm1, xmmword ptr [rax + 0x10]
0x100226c5f: mov rcx, qword ptr [rbp - 0x930]
0x100226c66: mov qword ptr [rax], rcx
0x100226c69: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226c71: vmovaps xmmword ptr [rax + 0x10], xmm2
0x100226c76: mov ecx, dword ptr [rbp - 0x910]
0x100226c7c: mov dword ptr [rax + 0x20], ecx
0x100226c7f: mov qword ptr [rbp - 0x930], r14
0x100226c86: vmovaps xmmword ptr [rbp - 0x920], xmm1
0x100226c8e: vmovss dword ptr [rbp - 0x910], xmm0
0x100226c96: vucomiss xmm0, dword ptr [rbp - 0x8e0]
0x100226c9e: ja 0x100226d2e
0x100226ca4: lea rdx, [rbp - 0x930]
0x100226cab: mov ecx, 1
0x100226cb0: lea rdi, [rbp - 0x900]
0x100226cb7: nop word ptr [rax + rax]
0x100226cc0: mov rsi, rdi
0x100226cc3: mov rdi, qword ptr [rsi]
0x100226cc6: mov qword ptr [rdx], rdi
0x100226cc9: vmovaps xmm2, xmmword ptr [rsi + 0x10]
0x100226cce: vmovaps xmmword ptr [rdx + 0x10], xmm2
0x100226cd3: mov edi, dword ptr [rsi + 0x20]
0x100226cd6: mov dword ptr [rdx + 0x20], edi
0x100226cd9: cmp r8, rcx
0x100226cdc: jl 0x100226d21
0x100226cde: lea rbx, [rcx + rcx + 1]
0x100226ce3: lea rdx, [rbx + rbx*2]
0x100226ce7: shl rdx, 4
0x100226ceb: lea rdi, [rbp + rdx - 0x930]
0x100226cf3: lea rcx, [rcx + rcx + 2]
0x100226cf8: cmp rcx, r13
0x100226cfb: jge 0x100226d14
0x100226cfd: vmovss xmm2, dword ptr [rdi + 0x50]
0x100226d02: vucomiss xmm2, dword ptr [rbp + rdx - 0x910]
0x100226d0b: jbe 0x100226d14
0x100226d0d: add rdi, 0x30
0x100226d11: mov rbx, rcx
0x100226d14: vucomiss xmm0, dword ptr [rdi + 0x20]
0x100226d19: mov rdx, rsi
0x100226d1c: mov rcx, rbx
0x100226d1f: jbe 0x100226cc0
0x100226d21: mov qword ptr [rsi], r14
0x100226d24: vmovaps xmmword ptr [rsi + 0x10], xmm1
0x100226d29: vmovss dword ptr [rsi + 0x20], xmm0
0x100226d2e: add rax, 0x30
0x100226d32: cmp rax, r9
0x100226d35: jne 0x100226c40
0x100226d3b: jmp 0x100226e60 ; 0x100226e60
0x100226d40: vmovss xmm1, dword ptr [rdi + 0x20]
0x100226d45: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226d4d: vucomiss xmm0, xmm1
0x100226d51: jbe 0x100226e4f
0x100226d57: mov rax, qword ptr [rdi]
0x100226d5a: vmovaps xmm0, xmmword ptr [rdi + 0x10]
0x100226d5f: mov rcx, qword ptr [rbp - 0x930]
0x100226d66: mov qword ptr [rdi], rcx
0x100226d69: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226d71: vmovaps xmmword ptr [rdi + 0x10], xmm2
0x100226d76: mov ecx, dword ptr [rbp - 0x910]
0x100226d7c: mov dword ptr [rdi + 0x20], ecx
0x100226d7f: mov qword ptr [rbp - 0x930], rax
0x100226d86: vmovaps xmmword ptr [rbp - 0x920], xmm0
0x100226d8e: vmovss dword ptr [rbp - 0x910], xmm1
0x100226d96: vmovss xmm2, dword ptr [rbp - 0x8e0]
0x100226d9e: vmovss xmm3, dword ptr [rbp - 0x8b0]
0x100226da6: vucomiss xmm3, xmm2
0x100226daa: lea rsi, [rbp - 0x900]
0x100226db1: lea rcx, [rbp - 0x8d0]
0x100226db8: cmova rsi, rcx
0x100226dbc: vucomiss xmm1, dword ptr [rsi + 0x20]
0x100226dc1: ja 0x100226e4f
0x100226dc7: xor r14d, r14d
0x100226dca: vucomiss xmm3, xmm2
0x100226dce: seta r14b
0x100226dd2: inc r14
0x100226dd5: lea rbx, [rbp - 0x930]
0x100226ddc: nop dword ptr [rax]
0x100226de0: mov rdx, rsi
0x100226de3: mov rcx, qword ptr [rdx]
0x100226de6: mov qword ptr [rbx], rcx
0x100226de9: vmovaps xmm2, xmmword ptr [rdx + 0x10]
0x100226dee: vmovaps xmmword ptr [rbx + 0x10], xmm2
0x100226df3: mov ecx, dword ptr [rdx + 0x20]
0x100226df6: mov dword ptr [rbx + 0x20], ecx
0x100226df9: cmp r8, r14
0x100226dfc: jl 0x100226e42
0x100226dfe: lea rcx, [r14 + r14 + 1]
0x100226e03: lea r11, [rcx + rcx*2]
0x100226e07: shl r11, 4
0x100226e0b: lea rsi, [rbp + r11 - 0x930]
0x100226e13: lea rbx, [r14 + r14 + 2]
0x100226e18: cmp rbx, r13
0x100226e1b: jge 0x100226e35
0x100226e1d: vmovss xmm2, dword ptr [rsi + 0x50]
0x100226e22: vucomiss xmm2, dword ptr [rbp + r11 - 0x910]
0x100226e2c: jbe 0x100226e35
0x100226e2e: add rsi, 0x30
0x100226e32: mov rcx, rbx
0x100226e35: vucomiss xmm1, dword ptr [rsi + 0x20]
0x100226e3a: mov rbx, rdx
0x100226e3d: mov r14, rcx
0x100226e40: jbe 0x100226de0
0x100226e42: mov qword ptr [rdx], rax
0x100226e45: vmovaps xmmword ptr [rdx + 0x10], xmm0
0x100226e4a: vmovss dword ptr [rdx + 0x20], xmm1
0x100226e4f: add rdi, 0x30
0x100226e53: cmp rdi, r9
0x100226e56: jne 0x100226d40
0x100226e5c: nop dword ptr [rax]
0x100226e60: cmp qword ptr [rbp - 0x2d40], 0x31
0x100226e68: jb 0x100226f9f
0x100226e6e: mov r11, r13
0x100226e71: nop word ptr cs:[rax + rax]
0x100226e80: mov rax, qword ptr [rbp - 0x930]
0x100226e87: vmovaps xmm0, xmmword ptr [rbp - 0x920]
0x100226e8f: mov ecx, dword ptr [rbp - 0x910]
0x100226e95: mov rdx, qword ptr [r10 - 0x30]
0x100226e99: mov qword ptr [rbp - 0x930], rdx
0x100226ea0: vmovaps xmm1, xmmword ptr [r10 - 0x20]
0x100226ea6: vmovaps xmmword ptr [rbp - 0x920], xmm1
0x100226eae: mov edx, dword ptr [r10 - 0x10]
0x100226eb2: mov dword ptr [rbp - 0x910], edx
0x100226eb8: mov qword ptr [r10 - 0x30], rax
0x100226ebc: vmovaps xmmword ptr [r10 - 0x20], xmm0
0x100226ec2: mov dword ptr [r10 - 0x10], ecx
0x100226ec6: cmp r11, 2
0x100226eca: je 0x100226f9f
0x100226ed0: lea r9, [r11 - 1]
0x100226ed4: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226edc: vucomiss xmm0, dword ptr [rbp - 0x8e0]
0x100226ee4: ja 0x100226f8e
0x100226eea: lea rax, [r11 - 3]
0x100226eee: shr rax, 0x3f
0x100226ef2: lea rdi, [r11 + rax - 3]
0x100226ef7: sar rdi, 1
0x100226efa: mov r8, qword ptr [rbp - 0x930]
0x100226f01: vmovaps xmm1, xmmword ptr [rbp - 0x920]
0x100226f09: lea rdx, [rbp - 0x930]
0x100226f10: mov ecx, 1
0x100226f15: lea rax, [rbp - 0x900]
0x100226f1c: nop dword ptr [rax]
0x100226f20: mov rbx, rax
0x100226f23: mov rax, qword ptr [rbx]
0x100226f26: mov qword ptr [rdx], rax
0x100226f29: vmovaps xmm2, xmmword ptr [rbx + 0x10]
0x100226f2e: vmovaps xmmword ptr [rdx + 0x10], xmm2
0x100226f33: mov eax, dword ptr [rbx + 0x20]
0x100226f36: mov dword ptr [rdx + 0x20], eax
0x100226f39: cmp rdi, rcx
0x100226f3c: jl 0x100226f81
0x100226f3e: lea rsi, [rcx + rcx + 1]
0x100226f43: lea rdx, [rsi + rsi*2]
0x100226f47: shl rdx, 4
0x100226f4b: lea rax, [rbp + rdx - 0x930]
0x100226f53: lea rcx, [rcx + rcx + 2]
0x100226f58: cmp rcx, r9
0x100226f5b: jge 0x100226f74
0x100226f5d: vmovss xmm2, dword ptr [rax + 0x50]
0x100226f62: vucomiss xmm2, dword ptr [rbp + rdx - 0x910]
0x100226f6b: jbe 0x100226f74
0x100226f6d: add rax, 0x30
0x100226f71: mov rsi, rcx
0x100226f74: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226f79: mov rdx, rbx
0x100226f7c: mov rcx, rsi
0x100226f7f: jbe 0x100226f20
0x100226f81: mov qword ptr [rbx], r8
0x100226f84: vmovaps xmmword ptr [rbx + 0x10], xmm1
0x100226f89: vmovss dword ptr [rbx + 0x20], xmm0
0x100226f8e: add r10, -0x30
0x100226f92: cmp r11, 2
0x100226f96: mov r11, r9
0x100226f99: jg 0x100226e80
0x100226f9f: mov rax, qword ptr [rbp - 0x930]
0x100226fa6: lea rcx, [rbp - 0x2d30]
0x100226fad: sub rax, rcx
0x100226fb0: sar rax, 6
0x100226fb4: movabs r11, 0xaaaaaaaaaaaaaaab
0x100226fbe: imul rax, r11
0x100226fc2: test r13d, r13d
0x100226fc5: je 0x100227560
0x100226fcb: vmovaps xmmword ptr [rbp - 0x2de0], xmm7
0x100226fd3: vxorps xmm2, xmm2, xmm2
0x100226fd7: vxorps xmm15, xmm15, xmm15
0x100226fdc: lea rsi, [rbp - 0x910]
0x100226fe3: vmovss xmm14, dword ptr [rip + 0x8808cd] ; 0x100aa78b8
0x100226feb: vmovss dword ptr [rbp - 0x2da0], xmm14
0x100226ff3: vxorps xmm11, xmm11, xmm11
0x100226ff8: mov ecx, dword ptr [rbp - 0x2d50]
0x100226ffe: nop 
0x100227000: vmovaps xmmword ptr [rbp - 0x2e30], xmm2
0x100227008: mov rbx, qword ptr [rsi - 0x20]
0x10022700c: vmovaps xmm3, xmmword ptr [rsi - 0x10]
0x100227011: vxorps xmm6, xmm6, xmm6
0x100227015: vsqrtss xmm0, xmm6, dword ptr [rsi]
0x100227019: vucomiss xmm0, dword ptr [rip + 0x881593] ; 0x100aa85b4
0x100227021: vmovaps xmm2, xmmword ptr [rip + 0x8822b7] ; 0x100aa92e0
0x100227029: vmovaps xmm14, xmm2
0x10022702d: jbe 0x100227039
0x10022702f: vpermilps xmm1, xmm0, 0xc0
0x100227035: vdivps xmm14, xmm3, xmm1
0x100227039: vmovsd xmm1, qword ptr [rbx + 0x8c]
0x100227041: vmulss xmm4, xmm1, xmm8
0x100227046: vinsertps xmm4, xmm12, xmm4, 0x10
0x10022704c: vmulps xmm7, xmm4, xmm1
0x100227050: vmovshdup xmm4, xmm7
0x100227054: vsubss xmm1, xmm7, xmm4
0x100227058: vucomiss xmm1, xmm10
0x10022705d: vmovss xmm8, dword ptr [rip + 0x88256b] ; 0x100aa95d0
0x100227065: vmovss xmm2, dword ptr [rbp - 0x2da0]
0x10022706d: ja 0x100227079
0x10022706f: vucomiss xmm8, xmm1
0x100227073: vmovaps xmm5, xmm9
0x100227077: jbe 0x100227081
0x100227079: vsubss xmm4, xmm0, xmm4
0x10022707d: vdivss xmm5, xmm4, xmm1
0x100227081: vmaxss xmm1, xmm13, xmm5
0x100227085: vminss xmm4, xmm9, xmm1
0x100227089: vmovaps xmm1, xmmword ptr [rbx + 0x20]
0x10022708e: vmovaps xmmword ptr [rbp - 0x2d40], xmm1
0x100227096: vmovaps xmmword ptr [rbp - 0x2e20], xmm4
0x10022709e: vpermilps xmm1, xmm4, 0xc0
0x1002270a4: vmulps xmm4, xmm7, xmmword ptr [rip + 0x88ac94] ; 0x100ab1d40
0x1002270ac: vmovshdup xmm6, xmm4
0x1002270b0: vsubss xmm4, xmm4, xmm6
0x1002270b4: vucomiss xmm4, xmm10
0x1002270b9: ja 0x1002270c5
0x1002270bb: vucomiss xmm8, xmm4
0x1002270bf: vmovaps xmm5, xmm9
0x1002270c3: jbe 0x1002270cd
0x1002270c5: vsubss xmm5, xmm0, xmm6
0x1002270c9: vdivss xmm5, xmm5, xmm4
0x1002270cd: vmovaps xmmword ptr [rbp - 0x2e40], xmm11
0x1002270d5: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x2d40]
0x1002270dd: vmovaps xmmword ptr [rbp - 0x2e10], xmm1
0x1002270e5: vmaxss xmm1, xmm13, xmm5
0x1002270e9: vminss xmm1, xmm9, xmm1
0x1002270ed: vmulss xmm1, xmm1, dword ptr [rip + 0x8814d7] ; 0x100aa85cc
0x1002270f5: vmovaps xmm5, xmmword ptr [rbx + 0x40]
0x1002270fa: vpermilps xmm6, xmm5, 0xd2
0x100227100: vmulps xmm6, xmm3, xmm6
0x100227104: vpermilps xmm3, xmm3, 0xd2
0x10022710a: vmulps xmm3, xmm3, xmm5
0x10022710e: vsubps xmm3, xmm6, xmm3
0x100227112: vpermilps xmm3, xmm3, 0xd2
0x100227118: vpermilps xmm1, xmm1, 0xc0
0x10022711e: vmulps xmm1, xmm3, xmm1
0x100227122: vsqrtss xmm3, xmm0, xmm0
0x100227126: vpermilps xmm3, xmm3, 0xc0
0x10022712c: vdivps xmm1, xmm1, xmm3
0x100227130: vmovaps xmmword ptr [rbp - 0x2e00], xmm1
0x100227138: vmulps xmm1, xmm7, xmmword ptr [rip + 0x88ac10] ; 0x100ab1d50
0x100227140: vmovshdup xmm3, xmm1
0x100227144: vsubss xmm1, xmm1, xmm3
0x100227148: vucomiss xmm1, xmm10
0x10022714d: ja 0x100227159
0x10022714f: vucomiss xmm8, xmm1
0x100227153: vmovaps xmm4, xmm9
0x100227157: jbe 0x100227161
0x100227159: vsubss xmm3, xmm0, xmm3
0x10022715d: vdivss xmm4, xmm3, xmm1
0x100227161: vmovss dword ptr [rbp - 0x2d54], xmm4
0x100227169: vminss xmm2, xmm0, xmm2
0x10022716d: vmovss dword ptr [rbp - 0x2da0], xmm2
0x100227175: vmulps xmm0, xmm14, xmmword ptr [rip + 0x8887a3] ; 0x100aaf920
0x10022717d: vmovss xmm10, dword ptr [rbx + 0x84]
0x100227185: vmulss xmm1, xmm10, xmm12
0x10022718a: vaddss xmm1, xmm1, dword ptr [rbx + 0x80]
0x100227192: vpermilps xmm1, xmm1, 0xc0
0x100227198: vmulps xmm0, xmm0, xmm1
0x10022719c: vmovaps xmm1, xmmword ptr [rbx + 0x50]
0x1002271a1: vmovaps xmm7, xmmword ptr [rbx + 0x60]
0x1002271a6: vmovaps xmm3, xmmword ptr [rbx + 0x70]
0x1002271ab: vmulps xmm6, xmm1, xmm0
0x1002271af: vmovshdup xmm5, xmm6
0x1002271b3: vaddss xmm5, xmm6, xmm5
0x1002271b7: vpermilpd xmm6, xmm6, 1
0x1002271bd: vaddss xmm5, xmm6, xmm5
0x1002271c1: vpermilps xmm5, xmm5, 0xc0
0x1002271c7: vmulps xmm5, xmm1, xmm5
0x1002271cb: vsubps xmm0, xmm0, xmm5
0x1002271cf: vmovaps xmm2, xmmword ptr [rip + 0x882489] ; 0x100aa9660
0x1002271d7: vmulps xmm1, xmm1, xmm2
0x1002271db: vsubps xmm0, xmm0, xmm1
0x1002271df: vmulps xmm1, xmm7, xmmword ptr [rip + 0x880489] ; 0x100aa7670
0x1002271e7: vmulps xmm5, xmm7, xmm0
0x1002271eb: vmovshdup xmm6, xmm5
0x1002271ef: vaddss xmm6, xmm5, xmm6
0x1002271f3: vpermilpd xmm5, xmm5, 1
0x1002271f9: vaddss xmm5, xmm5, xmm6
0x1002271fd: vpermilps xmm5, xmm5, 0xc0
0x100227203: vmulps xmm1, xmm1, xmm5
0x100227207: vsubps xmm0, xmm0, xmm1
0x10022720b: vmulps xmm1, xmm3, xmm2
0x10022720f: vmulps xmm5, xmm3, xmm0
0x100227213: vmovshdup xmm6, xmm5
0x100227217: vaddss xmm6, xmm5, xmm6
0x10022721b: vpermilpd xmm5, xmm5, 1
0x100227221: vaddss xmm5, xmm5, xmm6
0x100227225: vpermilps xmm5, xmm5, 0xc0
0x10022722b: vmulps xmm1, xmm1, xmm5
0x10022722f: vaddps xmm6, xmm0, xmm1
0x100227233: vmovaps xmm14, xmmword ptr [rip + 0x8806c5] ; 0x100aa7900
0x10022723b: vxorps xmm1, xmm3, xmm14
0x100227240: vmovaps xmm11, xmmword ptr [rbp - 0x2de0]
0x100227248: vsubps xmm13, xmm11, xmmword ptr [rbx]
0x10022724c: vmulps xmm0, xmm7, xmmword ptr [rip + 0x88ab0c] ; 0x100ab1d60
0x100227254: vsubps xmm5, xmm11, xmmword ptr [rbx + 0xa0]
0x10022725c: vmulps xmm4, xmm7, xmm5
0x100227260: vmovshdup xmm2, xmm4
0x100227264: vaddss xmm2, xmm4, xmm2
0x100227268: vpermilpd xmm4, xmm4, 1
0x10022726e: vaddss xmm2, xmm4, xmm2
0x100227272: vpermilps xmm2, xmm2, 0xc0
0x100227278: vmulps xmm2, xmm7, xmm2
0x10022727c: vsubps xmm9, xmm5, xmm2
0x100227280: vmulps xmm2, xmm9, xmm9
0x100227285: vmovshdup xmm4, xmm2
0x100227289: vaddss xmm4, xmm2, xmm4
0x10022728d: vpermilpd xmm2, xmm2, 1
0x100227293: vaddss xmm2, xmm2, xmm4
0x100227297: vsqrtss xmm2, xmm2, xmm2
0x10022729b: vmovss xmm4, dword ptr [rip + 0x884745] ; 0x100aab9e8
0x1002272a3: vaddss xmm4, xmm2, xmm4
0x1002272a7: vxorps xmm4, xmm4, xmm14
0x1002272ac: vxorps xmm8, xmm8, xmm8
0x1002272b1: vmaxss xmm4, xmm8, xmm4
0x1002272b5: vmovss xmm5, dword ptr [rip + 0x87de03] ; 0x100aa50c0
0x1002272bd: vminss xmm4, xmm5, xmm4
0x1002272c1: vmulss xmm4, xmm4, xmm4
0x1002272c5: vmulps xmm1, xmm1, xmm13
0x1002272ca: vmovshdup xmm5, xmm1
0x1002272ce: vaddss xmm5, xmm1, xmm5
0x1002272d2: vpermilpd xmm1, xmm1, 1
0x1002272d8: vaddss xmm1, xmm1, xmm5
0x1002272dc: vmovss xmm5, dword ptr [rip + 0x881ef8] ; 0x100aa91dc
0x1002272e4: vmulss xmm1, xmm1, xmm5
0x1002272e8: vmaxss xmm1, xmm8, xmm1
0x1002272ec: vmovss xmm5, dword ptr [rip + 0x87ddcc] ; 0x100aa50c0
0x1002272f4: vminss xmm1, xmm5, xmm1
0x1002272f8: vmulss xmm1, xmm10, xmm1
0x1002272fc: vmulss xmm1, xmm4, xmm1
0x100227300: vxorps xmm4, xmm0, xmm14
0x100227305: vpshufd xmm4, xmm4, 0xd2
0x10022730a: vmulps xmm4, xmm4, xmm9
0x10022730f: vpermilps xmm5, xmm9, 0xd2
0x100227315: vmulps xmm5, xmm5, xmm0
0x100227319: vaddps xmm4, xmm4, xmm5
0x10022731d: vpermilps xmm4, xmm4, 0xd2
0x100227323: vpermilps xmm5, xmm1, 0xc0
0x100227329: vmulps xmm4, xmm5, xmm4
0x10022732d: vmulps xmm4, xmm5, xmm4
0x100227331: vaddps xmm4, xmm4, xmm6
0x100227335: vmovss xmm5, dword ptr [rip + 0x87dd83] ; 0x100aa50c0
0x10022733d: vdivss xmm2, xmm5, xmm2
0x100227341: vmovss xmm5, dword ptr [rip + 0x87dd77] ; 0x100aa50c0
0x100227349: vminss xmm5, xmm5, xmm2
0x10022734d: vcmpunordss xmm2, xmm2, xmm2
0x100227352: vandnps xmm5, xmm2, xmm5
0x100227356: vmovss xmm6, dword ptr [rip + 0x87dd62] ; 0x100aa50c0
0x10022735e: vandps xmm2, xmm2, xmm6
0x100227362: vorps xmm2, xmm5, xmm2
0x100227366: vaddss xmm1, xmm1, xmm1
0x10022736a: vpermilps xmm2, xmm2, 0xc0
0x100227370: vmulps xmm2, xmm2, xmm9
0x100227375: vpermilps xmm1, xmm1, 0xc0
0x10022737b: vmulps xmm1, xmm2, xmm1
0x10022737f: vsubps xmm1, xmm4, xmm1
0x100227383: vsubps xmm2, xmm11, xmmword ptr [rbx + 0xb0]
0x10022738b: vmulps xmm4, xmm7, xmm2
0x10022738f: vmovshdup xmm5, xmm4
0x100227393: vaddss xmm5, xmm4, xmm5
0x100227397: vpermilpd xmm4, xmm4, 1
0x10022739d: vaddss xmm4, xmm4, xmm5
0x1002273a1: vpermilps xmm4, xmm4, 0xc0
0x1002273a7: vmulps xmm4, xmm7, xmm4
0x1002273ab: vsubps xmm6, xmm2, xmm4
0x1002273af: vmulps xmm2, xmm6, xmm6
0x1002273b3: vmovshdup xmm4, xmm2
0x1002273b7: vaddss xmm4, xmm2, xmm4
0x1002273bb: vpermilpd xmm2, xmm2, 1
0x1002273c1: vaddss xmm2, xmm2, xmm4
0x1002273c5: vsqrtss xmm2, xmm2, xmm2
0x1002273c9: vmulps xmm3, xmm3, xmm13
0x1002273ce: vxorps xmm13, xmm13, xmm13
0x1002273d3: vmovss xmm9, dword ptr [rip + 0x87dce5] ; 0x100aa50c0
0x1002273db: vmovshdup xmm4, xmm3
0x1002273df: vaddss xmm4, xmm3, xmm4
0x1002273e3: vpermilpd xmm3, xmm3, 1
0x1002273e9: vaddss xmm3, xmm3, xmm4
0x1002273ed: vaddss xmm4, xmm2, dword ptr [rip + 0x8845f3] ; 0x100aab9e8
0x1002273f5: vxorps xmm4, xmm4, xmm14
0x1002273fa: vmaxss xmm4, xmm13, xmm4
0x1002273fe: vminss xmm4, xmm9, xmm4
0x100227402: vmulss xmm4, xmm4, xmm4
0x100227406: vmulss xmm3, xmm3, dword ptr [rip + 0x881dce] ; 0x100aa91dc
0x10022740e: vmaxss xmm3, xmm13, xmm3
0x100227412: vminss xmm3, xmm9, xmm3
0x100227416: vmulss xmm3, xmm10, xmm3
0x10022741a: vmulss xmm3, xmm4, xmm3
0x10022741e: vpermilps xmm4, xmm6, 0xd2
0x100227424: vmulps xmm4, xmm0, xmm4
0x100227428: vpermilps xmm0, xmm0, 0xd2
0x10022742e: vmulps xmm0, xmm0, xmm6
0x100227432: vsubps xmm0, xmm0, xmm4
0x100227436: vpermilps xmm0, xmm0, 0xd2
0x10022743c: vpermilps xmm4, xmm3, 0xc0
0x100227442: vmulps xmm0, xmm4, xmm0
0x100227446: vmulps xmm0, xmm4, xmm0
0x10022744a: vaddps xmm0, xmm0, xmm1
0x10022744e: vdivss xmm1, xmm9, xmm2
0x100227452: vminss xmm2, xmm9, xmm1
0x100227456: vcmpunordss xmm1, xmm1, xmm1
0x10022745b: vandnps xmm2, xmm1, xmm2
0x10022745f: vandps xmm1, xmm1, xmm9
0x100227464: vorps xmm1, xmm2, xmm1
0x100227468: vpermilps xmm1, xmm1, 0xc0
0x10022746e: vmulps xmm1, xmm1, xmm6
0x100227472: vaddss xmm2, xmm3, xmm3
0x100227476: vpermilps xmm2, xmm2, 0xc0
0x10022747c: vmulps xmm1, xmm2, xmm1
0x100227480: vsubps xmm0, xmm0, xmm1
0x100227484: vsubss xmm1, xmm9, dword ptr [rbp - 0x2e20]
0x10022748c: vmulss xmm1, xmm1, xmm10
0x100227491: vpermilps xmm1, xmm1, 0xc0
0x100227497: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x2d40]
0x10022749f: vaddps xmm0, xmm1, xmm0
0x1002274a3: vmaxss xmm1, xmm13, dword ptr [rbp - 0x2d54]
0x1002274ab: vminss xmm1, xmm9, xmm1
0x1002274af: vpermilps xmm1, xmm1, 0xc0
0x1002274b5: vmulps xmm0, xmm1, xmm0
0x1002274b9: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x2e00]
0x1002274c1: vmovaps xmm11, xmmword ptr [rbp - 0x2e40]
0x1002274c9: vaddps xmm11, xmm11, xmm0
0x1002274cd: vmovaps xmm2, xmmword ptr [rbp - 0x2e10]
0x1002274d5: vmulps xmm0, xmm2, xmm2
0x1002274d9: vmovshdup xmm1, xmm0
0x1002274dd: vaddss xmm1, xmm0, xmm1
0x1002274e1: vpermilpd xmm0, xmm0, 1
0x1002274e7: vaddss xmm0, xmm0, xmm1
0x1002274eb: vsqrtss xmm0, xmm0, xmm0
0x1002274ef: vpermilps xmm1, xmm0, 0xc0
0x1002274f5: vmulps xmm1, xmm2, xmm1
0x1002274f9: vmovaps xmm2, xmmword ptr [rbp - 0x2e30]
0x100227501: vaddps xmm2, xmm2, xmm1
0x100227505: vaddss xmm15, xmm15, xmm0
0x100227509: add rsi, 0x30
0x10022750d: dec r13
0x100227510: vmovss xmm10, dword ptr [rip + 0x8803ac] ; 0x100aa78c4
0x100227518: vmovss xmm8, dword ptr [rip + 0x8802cc] ; 0x100aa77ec
0x100227520: jne 0x100227000
0x100227526: vxorps xmm0, xmm0, xmm0
0x10022752a: vmovss xmm1, dword ptr [rip + 0x881082] ; 0x100aa85b4
0x100227532: vucomiss xmm1, xmm15
0x100227537: mov r13, qword ptr [rbp - 0x2d60]
0x10022753e: ja 0x10022754a
0x100227540: vpermilps xmm0, xmm15, 0xc0
0x100227546: vdivps xmm0, xmm2, xmm0
0x10022754a: vmovaps xmm7, xmmword ptr [rbp - 0x2de0]
0x100227552: vmovss xmm14, dword ptr [rbp - 0x2da0]
0x10022755a: jmp 0x10022757e ; 0x10022757e
0x10022755c: nop dword ptr [rax]
0x100227560: vxorps xmm11, xmm11, xmm11
0x100227565: vmovss xmm14, dword ptr [rip + 0x88034b] ; 0x100aa78b8
0x10022756d: vxorps xmm0, xmm0, xmm0
0x100227571: mov r13, qword ptr [rbp - 0x2d60]
0x100227578: mov ecx, dword ptr [rbp - 0x2d50]
0x10022757e: vaddps xmm0, xmm11, xmm0
0x100227582: vmovss xmm1, dword ptr [r12 + r15*4 + 0x4018]
0x10022758c: vinsertps xmm1, xmm1, dword ptr [r12 + r15*4 + 0x5018], 0x10
0x100227597: vinsertps xmm1, xmm1, dword ptr [r12 + r15*4 + 0x6018], 0x20
0x1002275a2: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x2e80]
0x1002275aa: movzx eax, al
0x1002275ad: lea rax, [rax + rax*2]
0x1002275b1: shl rax, 6
0x1002275b5: vmulps xmm0, xmm0, xmmword ptr [rip + 0x881483] ; 0x100aa8a40
0x1002275bd: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x2e70]
0x1002275c5: vaddps xmm0, xmm0, xmm1
0x1002275c9: vmulps xmm1, xmm0, xmm0
0x1002275cd: vmovshdup xmm2, xmm1
0x1002275d1: vaddss xmm2, xmm1, xmm2
0x1002275d5: vpermilpd xmm1, xmm1, 1
0x1002275db: vaddss xmm1, xmm1, xmm2
0x1002275df: vsqrtss xmm1, xmm1, xmm1
0x1002275e3: vdivss xmm1, xmm1, dword ptr [rip + 0x880fe1] ; 0x100aa85cc
0x1002275eb: vmovss xmm2, dword ptr [rbp - 0x2dc8]
0x1002275f3: vmulss xmm2, xmm2, dword ptr [r12 + r15*4 + 0x7018]
0x1002275fd: vmulss xmm1, xmm1, dword ptr [rbp - 0x2dcc]
0x100227605: vaddss xmm1, xmm2, xmm1
0x100227609: vsubps xmm2, xmm7, xmmword ptr [rbp + rax - 0x2d30]
0x100227612: vmovaps xmm3, xmmword ptr [rbp + rax - 0x2d00]
0x10022761b: vmulps xmm4, xmm3, xmm2
0x10022761f: vmovshdup xmm5, xmm4
0x100227623: vaddss xmm5, xmm4, xmm5
0x100227627: vpermilpd xmm4, xmm4, 1
0x10022762d: vaddss xmm4, xmm4, xmm5
0x100227631: vpermilps xmm4, xmm4, 0xc0
0x100227637: vmulps xmm3, xmm3, xmm4
0x10022763b: vsubps xmm2, xmm2, xmm3
0x10022763f: vmulps xmm3, xmm2, xmm2
0x100227643: vmovshdup xmm4, xmm3
0x100227647: vaddss xmm4, xmm3, xmm4
0x10022764b: vpermilpd xmm3, xmm3, 1
0x100227651: vaddss xmm3, xmm3, xmm4
0x100227655: vsqrtss xmm3, xmm3, xmm3
0x100227659: vucomiss xmm3, xmm10
0x10022765e: jbe 0x10022766a
0x100227660: vpermilps xmm3, xmm3, 0xc0
0x100227666: vdivps xmm2, xmm2, xmm3
0x10022766a: vmovaps xmm3, xmmword ptr [rbp + rax - 0x2d10]
0x100227673: vsubps xmm4, xmm0, xmm3
0x100227677: vmulps xmm5, xmm2, xmm4
0x10022767b: vmovshdup xmm6, xmm5
0x10022767f: vaddss xmm6, xmm5, xmm6
0x100227683: vpermilpd xmm5, xmm5, 1
0x100227689: vaddss xmm5, xmm5, xmm6
0x10022768d: vpermilps xmm5, xmm5, 0xc0
0x100227693: vmulps xmm2, xmm2, xmm5
0x100227697: vsubps xmm2, xmm4, xmm2
0x10022769b: vaddps xmm2, xmm3, xmm2
0x10022769f: vmovss xmm4, dword ptr [rip + 0x88a719] ; 0x100ab1dc0
0x1002276a7: vmulss xmm4, xmm4, dword ptr [rbp + rax - 0x2ca8]
0x1002276b0: vaddss xmm5, xmm14, dword ptr [rip + 0x884160] ; 0x100aab818
0x1002276b8: vdivss xmm5, xmm5, dword ptr [rip + 0x88412c] ; 0x100aab7ec
0x1002276c0: vmaxss xmm5, xmm13, xmm5
0x1002276c4: vminss xmm5, xmm9, xmm5
0x1002276c8: vmulss xmm4, xmm5, xmm4
0x1002276cc: vsubss xmm5, xmm9, xmm4
0x1002276d0: vpermilps xmm5, xmm5, 0xc0
0x1002276d6: vmulps xmm0, xmm0, xmm5
0x1002276da: vpermilps xmm4, xmm4, 0xc0
0x1002276e0: vmulps xmm2, xmm4, xmm2
0x1002276e4: vaddps xmm4, xmm0, xmm2
0x1002276e8: vmovss xmm2, dword ptr [r12 + r15*4 + 0x3018]
0x1002276f2: vmulps xmm0, xmm4, xmm4
0x1002276f6: vmovshdup xmm5, xmm0
0x1002276fa: vaddss xmm5, xmm0, xmm5
0x1002276fe: vpermilpd xmm0, xmm0, 1
0x100227704: vaddss xmm0, xmm0, xmm5
0x100227708: vsqrtss xmm0, xmm0, xmm0
0x10022770c: vmovss xmm5, dword ptr [rip + 0x8840e8] ; 0x100aab7fc
0x100227714: vmovaps xmm6, xmm5
0x100227718: vaddss xmm5, xmm0, xmm6
0x10022771c: vdivss xmm5, xmm5, xmm6
0x100227720: vmaxss xmm5, xmm13, xmm5
0x100227724: vminss xmm5, xmm9, xmm5
0x100227728: vsubss xmm6, xmm9, xmm5
0x10022772c: vmulss xmm5, xmm5, xmm13
0x100227731: vaddss xmm5, xmm5, xmm6
0x100227735: vmulss xmm5, xmm5, xmm5
0x100227739: vmulss xmm6, xmm1, dword ptr [rbp - 0x2db0]
0x100227741: vmulss xmm5, xmm6, xmm5
0x100227745: vucomiss xmm0, dword ptr [rip + 0x880e67] ; 0x100aa85b4
0x10022774d: vmovaps xmm6, xmmword ptr [rip + 0x88094b] ; 0x100aa80a0
0x100227755: jbe 0x100227761
0x100227757: vpermilps xmm0, xmm0, 0xc0
0x10022775d: vdivps xmm6, xmm4, xmm0
0x100227761: vpermilps xmm0, xmm5, 0xc0
0x100227767: vmulps xmm5, xmm0, xmm6
0x10022776b: vaddps xmm0, xmm7, xmm5
0x10022776f: vsubps xmm4, xmm4, xmm5
0x100227773: vsubps xmm5, xmm0, xmmword ptr [rbp + rax - 0x2d20]
0x10022777c: vsubps xmm6, xmm0, xmm7
0x100227780: vdivps xmm6, xmm6, xmmword ptr [rbp - 0x2d90]
0x100227788: vsubps xmm3, xmm6, xmm3
0x10022778c: vmulps xmm6, xmm5, xmm5
0x100227790: vmovshdup xmm7, xmm6
0x100227794: vaddss xmm7, xmm6, xmm7
0x100227798: vpermilpd xmm6, xmm6, 1
0x10022779e: vaddss xmm6, xmm6, xmm7
0x1002277a2: vsqrtss xmm6, xmm6, xmm6
0x1002277a6: vucomiss xmm6, xmm10
0x1002277ab: jbe 0x1002277b7
0x1002277ad: vpermilps xmm6, xmm6, 0xc0
0x1002277b3: vdivps xmm5, xmm5, xmm6
0x1002277b7: vmulps xmm3, xmm3, xmm5
0x1002277bb: vmovshdup xmm5, xmm3
0x1002277bf: vaddss xmm5, xmm3, xmm5
0x1002277c3: vpermilpd xmm3, xmm3, 1
0x1002277c9: vaddss xmm3, xmm3, xmm5
0x1002277cd: vmaxss xmm3, xmm13, xmm3
0x1002277d1: vminss xmm3, xmm9, xmm3
0x1002277d5: vmulss xmm3, xmm3, dword ptr [rip + 0x881e97] ; 0x100aa9674
0x1002277dd: vmaxss xmm5, xmm12, xmm3
0x1002277e1: vcmpunordss xmm3, xmm3, xmm3
0x1002277e6: vandnps xmm5, xmm3, xmm5
0x1002277ea: vandps xmm3, xmm3, xmm12
0x1002277ef: vorps xmm3, xmm5, xmm3
0x1002277f3: vmulss xmm3, xmm3, dword ptr [rbp - 0x2db0]
0x1002277fb: vaddss xmm2, xmm2, xmm3
0x1002277ff: vmovss dword ptr [r12 + r15*4 + 0x3018], xmm2
0x100227809: vmulps xmm2, xmm11, xmmword ptr [rip + 0x881adf] ; 0x100aa92f0
0x100227811: vmovss dword ptr [r13 + r15*4], xmm2
0x100227818: mov rax, qword ptr [rbp - 0x2d78]
0x10022781f: vextractps dword ptr [rax + r15*4], xmm2, 1
0x100227826: mov rax, qword ptr [rbp - 0x2d70]
0x10022782d: vextractps dword ptr [rax + r15*4], xmm2, 2
0x100227834: vmovss dword ptr [r12 + r15*4 + 0x18], xmm0
0x10022783b: vextractps dword ptr [r12 + r15*4 + 0x1018], xmm0, 1
0x100227846: vextractps dword ptr [r12 + r15*4 + 0x2018], xmm0, 2
0x100227851: vmovss dword ptr [r12 + r15*4 + 0x4018], xmm4
0x10022785b: vextractps dword ptr [r12 + r15*4 + 0x5018], xmm4, 1
0x100227866: vextractps dword ptr [r12 + r15*4 + 0x6018], xmm4, 2
0x100227871: vmovss dword ptr [r12 + r15*4 + 0x7018], xmm1
0x10022787b: inc ecx
0x10022787d: cmp ecx, dword ptr [r12 + 0xc828]
0x100227885: jb 0x100226920
0x10022788b: call 0x1007e8410 ; 0x1007e8410
0x100227890: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x100227898: call 0x1007e8410 ; 0x1007e8410
0x10022789d: vsubsd xmm0, xmm0, qword ptr [rip + 0xb0276b] ; 0x100d2a010
0x1002278a5: vmovsd xmm1, qword ptr [rip + 0x88a523] ; 0x100ab1dd0
0x1002278ad: vucomisd xmm1, xmm0
0x1002278b1: ja 0x100227953
0x1002278b7: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x1002278bf: vsubsd xmm0, xmm0, qword ptr [rbp - 0x2e48]
0x1002278c7: vmulsd xmm0, xmm0, qword ptr [rip + 0x88a509] ; 0x100ab1dd8
0x1002278cf: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x1002278d7: lea rdi, [rip + 0xb01472] ; 0x100d28d50
0x1002278de: lea r14, [rip + 0xb01463] ; 0x100d28d48
0x1002278e5: mov edx, 0x958
0x1002278ea: mov rsi, r14
0x1002278ed: call 0x100aa28fa ; 0x100aa28fa _memmove
0x1002278f2: lea r15, [rip + 0xb0140f] ; 0x100d28d08
0x1002278f9: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x100227901: vmovsd qword ptr [rip + 0xb0143f], xmm0 ; 0x100d28d48
0x100227909: mov ebx, dword ptr [rip + 0xb026f9] ; 0x100d2a008
0x10022790f: cmp ebx, 0x12c
0x100227915: adc ebx, 0
0x100227918: mov dword ptr [rip + 0xb026ea], ebx ; 0x100d2a008
0x10022791e: lea r13, [rip + 0xb01d83] ; 0x100d296a8
0x100227925: mov edx, 0x960
0x10022792a: mov rdi, r13
0x10022792d: mov rsi, r14
0x100227930: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100227935: lea rsi, [r15 + rbx*8 + 0x9a0]
0x10022793d: lea rdx, [rbp - 0x930]
0x100227944: mov rdi, r13
0x100227947: mov r13, qword ptr [rbp - 0x2d60]
0x10022794e: call 0x100aa2426 ; 0x100aa2426 __ZNSt3__16__sortIRNS_6__lessIddEEPdEEvT0_S5_T_
0x100227953: mov ebx, dword ptr [r12 + 0xc828]
0x10022795b: call 0x1007c6c20 ; 0x1007c6c20
0x100227960: shl rbx, 2
0x100227964: lea rcx, [rip + 0x1e211e5] ; 0x102048b50
0x10022796b: mov rdx, qword ptr [rcx]
0x10022796e: mov ecx, 4
0x100227973: mov rdi, rax
0x100227976: mov rsi, rbx
0x100227979: call 0x100795530 ; 0x100795530
0x10022797e: mov r14, rax
0x100227981: mov ebx, dword ptr [r12 + 0xc828]
0x100227989: mov qword ptr [rbp - 0x2d90], r14
0x100227990: call 0x1007c6c20 ; 0x1007c6c20
0x100227995: shl rbx, 5
0x100227999: lea rcx, [rip + 0x1e211b0] ; 0x102048b50
0x1002279a0: mov rdx, qword ptr [rcx]
0x1002279a3: mov ecx, 4
0x1002279a8: mov rdi, rax
0x1002279ab: mov rsi, rbx
0x1002279ae: call 0x100795530 ; 0x100795530
0x1002279b3: mov qword ptr [rbp - 0x2d50], rax
0x1002279ba: call 0x1007e8410 ; 0x1007e8410
0x1002279bf: vmovsd qword ptr [rbp - 0x2d48], xmm0
0x1002279c7: cmp dword ptr [r12 + 0xc828], 0
0x1002279d0: mov rcx, qword ptr [rbp - 0x2d68]
0x1002279d7: mov r8, qword ptr [rbp - 0x2db8]
0x1002279de: mov r15, qword ptr [rbp - 0x2d78]
0x1002279e5: mov r14, qword ptr [rbp - 0x2d70]
0x1002279ec: je 0x100227ddd
0x1002279f2: vmovss xmm0, dword ptr [rbp - 0x2dc4]
0x1002279fa: vdivss xmm0, xmm0, dword ptr [rip + 0x87f0a6] ; 0x100aa6aa8
0x100227a02: vmovss dword ptr [rbp - 0x2db0], xmm0
0x100227a0a: xor edx, edx
0x100227a0c: mov rbx, qword ptr [rbp - 0x2d50]
0x100227a13: mov qword ptr [rbp - 0x2e58], r12
0x100227a1a: nop word ptr [rax + rax]
0x100227a20: mov dword ptr [rbp - 0x2d40], edx
0x100227a26: mov eax, dword ptr [r12 + 0xc824]
0x100227a2e: add eax, edx
0x100227a30: and eax, 0x3ff
0x100227a35: vmovss xmm2, dword ptr [r12 + rax*4 + 0x18]
0x100227a3c: vmovaps xmmword ptr [rbp - 0x2e20], xmm2
0x100227a44: vmovss xmm0, dword ptr [r12 + rax*4 + 0x1018]
0x100227a4e: vmovaps xmmword ptr [rbp - 0x2e30], xmm0
0x100227a56: vmovss xmm1, dword ptr [r12 + rax*4 + 0x2018]
0x100227a60: vmovaps xmmword ptr [rbp - 0x2e10], xmm1
0x100227a68: vinsertps xmm0, xmm2, xmm0, 0x10
0x100227a6e: vinsertps xmm0, xmm0, xmm1, 0x20
0x100227a74: vblendps xmm6, xmm0, xmm6, 8
0x100227a7a: vmovaps xmmword ptr [rbp - 0x2e40], xmm6
0x100227a82: vmovss xmm0, dword ptr [rcx + rax*4]
0x100227a87: mov rcx, qword ptr [rbp - 0x2dc0]
0x100227a8e: vinsertps xmm0, xmm0, dword ptr [rcx + rax*4], 0x10
0x100227a95: vinsertps xmm0, xmm0, dword ptr [r8 + rax*4], 0x20
0x100227a9c: vblendps xmm7, xmm0, xmm7, 8
0x100227aa2: vmovaps xmmword ptr [rbp - 0x2da0], xmm7
0x100227aaa: vmovss xmm0, dword ptr [r13 + rax*4]
0x100227ab1: vinsertps xmm0, xmm0, dword ptr [r15 + rax*4], 0x10
0x100227ab8: vinsertps xmm0, xmm0, dword ptr [r14 + rax*4], 0x20
0x100227abf: vmovaps xmmword ptr [rbp - 0x2e00], xmm0
0x100227ac7: vmovss xmm0, dword ptr [r12 + rax*4 + 0x3018]
0x100227ad1: vmovss dword ptr [rbp - 0x2de0], xmm0
0x100227ad9: vmovss xmm0, dword ptr [r12 + rax*4 + 0x8018]
0x100227ae3: vmovss dword ptr [rbp - 0x2d54], xmm0
0x100227aeb: lea r13, [rax + rax*2]
0x100227aef: vmovss xmm0, dword ptr [rbp - 0x2db0]
0x100227af7: vaddss xmm0, xmm0, dword ptr [r12 + r13*4 + 0x9020]
0x100227b01: vmovss xmm1, dword ptr [rip + 0x87d5b7] ; 0x100aa50c0
0x100227b09: mov r12, r8
0x100227b0c: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100227b11: vmovaps xmm6, xmmword ptr [rbp - 0x2e40]
0x100227b19: vmovaps xmm7, xmmword ptr [rbp - 0x2da0]
0x100227b21: mov r8, r12
0x100227b24: mov r12, qword ptr [rbp - 0x2e58]
0x100227b2b: vmovaps xmm10, xmmword ptr [rbp - 0x2ea0]
0x100227b33: vmovaps xmm9, xmmword ptr [rbp - 0x2eb0]
0x100227b3b: vmovaps xmm8, xmmword ptr [rbp - 0x2ed0]
0x100227b43: mov rcx, qword ptr [rbp - 0x2d68]
0x100227b4a: vmovss xmm1, dword ptr [r12 + r13*4 + 0x9018]
0x100227b54: vaddss xmm1, xmm1, xmm1
0x100227b58: vmovss xmm15, dword ptr [rbp - 0x2de0]
0x100227b60: vdivss xmm1, xmm1, xmm15
0x100227b65: vmovss xmm5, dword ptr [rip + 0x87d553] ; 0x100aa50c0
0x100227b6d: vminss xmm2, xmm5, xmm1
0x100227b71: vcmpunordss xmm1, xmm1, xmm1
0x100227b76: vandnps xmm2, xmm1, xmm2
0x100227b7a: vandps xmm1, xmm1, xmm5
0x100227b7e: vorps xmm1, xmm2, xmm1
0x100227b82: vmovss xmm4, dword ptr [rbp - 0x2d54]
0x100227b8a: vsubss xmm2, xmm5, xmm4
0x100227b8e: vmovss xmm3, dword ptr [rip + 0x87fc56] ; 0x100aa77ec
0x100227b96: vmovaps xmm11, xmm3
0x100227b9a: vmulss xmm2, xmm2, xmm11
0x100227b9f: vdivss xmm2, xmm2, dword ptr [rip + 0x87fc41] ; 0x100aa77e8
0x100227ba7: vminss xmm3, xmm5, xmm2
0x100227bab: vcmpunordss xmm2, xmm2, xmm2
0x100227bb0: vandnps xmm3, xmm2, xmm3
0x100227bb4: vandps xmm2, xmm2, xmm5
0x100227bb8: vorps xmm2, xmm3, xmm2
0x100227bbc: vmulss xmm3, xmm1, dword ptr [r12 + r13*4 + 0x901c]
0x100227bc6: mov r13, qword ptr [rbp - 0x2d60]
0x100227bcd: vmulss xmm4, xmm4, xmm11
0x100227bd2: vdivss xmm4, xmm4, dword ptr [rip + 0x881612] ; 0x100aa91ec
0x100227bda: vmulss xmm1, xmm1, xmm3
0x100227bde: vminss xmm3, xmm5, xmm4
0x100227be2: vcmpunordss xmm4, xmm4, xmm4
0x100227be7: vandnps xmm3, xmm4, xmm3
0x100227beb: vandps xmm4, xmm4, xmm5
0x100227bef: vorps xmm3, xmm3, xmm4
0x100227bf3: vmovaps xmm14, xmmword ptr [rbp - 0x2ee0]
0x100227bfb: vmulss xmm2, xmm2, xmm3
0x100227bff: vmovaps xmm3, xmmword ptr [rip + 0x884319] ; 0x100aabf20
0x100227c07: vmovaps xmm13, xmm3
0x100227c0b: vmovaps xmm3, xmmword ptr [rbp - 0x2e00]
0x100227c13: vdivps xmm3, xmm3, xmm13
0x100227c18: vmulss xmm1, xmm1, xmm2
0x100227c1c: vxorps xmm12, xmm12, xmm12
0x100227c21: vcmpleps xmm2, xmm12, xmm3
0x100227c26: vmovaps xmm5, xmmword ptr [rip + 0x88a142] ; 0x100ab1d70
0x100227c2e: vmovaps xmm11, xmm5
0x100227c32: vmovaps xmm5, xmmword ptr [rip + 0x8802a6] ; 0x100aa7ee0
0x100227c3a: vblendvps xmm2, xmm5, xmm11, xmm2
0x100227c40: vmulps xmm2, xmm3, xmm2
0x100227c44: vmovaps xmm4, xmm15
0x100227c48: vaddss xmm3, xmm4, dword ptr [rip + 0x880a48] ; 0x100aa8698
0x100227c50: vdivss xmm3, xmm3, dword ptr [rip + 0x88a16c] ; 0x100ab1dc4
0x100227c58: vxorps xmm5, xmm5, xmm5
0x100227c5c: vmaxss xmm3, xmm5, xmm3
0x100227c60: vmovss xmm5, dword ptr [rip + 0x87d458] ; 0x100aa50c0
0x100227c68: vminss xmm3, xmm5, xmm3
0x100227c6c: vmulss xmm1, xmm3, xmm1
0x100227c70: vmaxps xmm3, xmm2, xmmword ptr [rip + 0x88a108] ; 0x100ab1d80
0x100227c78: vblendps xmm2, xmm3, xmm2, 8
0x100227c7e: vmulss xmm0, xmm0, dword ptr [rip + 0x8809b2] ; 0x100aa8638
0x100227c86: vdivss xmm3, xmm4, dword ptr [rip + 0x87f46a] ; 0x100aa70f8
0x100227c8e: vmulss xmm0, xmm0, dword ptr [rip + 0x88a132] ; 0x100ab1dc8
0x100227c96: vmulss xmm1, xmm1, dword ptr [rip + 0x87c91a] ; 0x100aa45b8
0x100227c9e: vunpcklps xmm0, xmm3, xmm0
0x100227ca2: vinsertps xmm0, xmm0, xmm1, 0x28
0x100227ca8: vsubps xmm1, xmm6, xmm7
0x100227cac: vdivps xmm1, xmm1, xmm13
0x100227cb1: vcmpleps xmm3, xmm12, xmm1
0x100227cb6: vmovaps xmm5, xmmword ptr [rip + 0x889572] ; 0x100ab1230
0x100227cbe: vmovaps xmm13, xmm5
0x100227cc2: vmovaps xmm5, xmmword ptr [rip + 0x889e66] ; 0x100ab1b30
0x100227cca: vblendvps xmm3, xmm5, xmm13, xmm3
0x100227cd0: vmulps xmm1, xmm1, xmm3
0x100227cd4: vmovaps xmm5, xmmword ptr [rbp - 0x2e20]
0x100227cdc: vmovss dword ptr [rbx], xmm5
0x100227ce0: vmovaps xmm3, xmmword ptr [rbp - 0x2e30]
0x100227ce8: vmovss dword ptr [rbx + 4], xmm3
0x100227ced: vmovaps xmm4, xmmword ptr [rbp - 0x2e10]
0x100227cf5: vmovss dword ptr [rbx + 8], xmm4
0x100227cfa: vminps xmm2, xmm2, xmm11
0x100227cff: vcvttps2dq xmm2, xmm2
0x100227d03: vpextrw word ptr [rbx + 0xc], xmm2, 0
0x100227d0a: vpextrw word ptr [rbx + 0xe], xmm2, 2
0x100227d11: vpextrw word ptr [rbx + 0x10], xmm2, 4
0x100227d18: vmaxps xmm2, xmm1, xmmword ptr [rip + 0x889e20] ; 0x100ab1b40
0x100227d20: vblendps xmm1, xmm2, xmm1, 8
0x100227d26: vsubss xmm2, xmm5, xmm14
0x100227d2b: vmulss xmm2, xmm9, xmm2
0x100227d2f: vsubss xmm3, xmm3, xmm8
0x100227d34: vmulss xmm3, xmm10, xmm3
0x100227d38: vaddss xmm2, xmm2, xmm3
0x100227d3c: vmovaps xmm3, xmmword ptr [rbp - 0x2e90]
0x100227d44: mov word ptr [rbx + 0x12], 0
0x100227d4a: vmovaps xmm5, xmmword ptr [rip + 0x88a03e] ; 0x100ab1d90
0x100227d52: vmulps xmm0, xmm0, xmm5
0x100227d56: vmaxps xmm0, xmm0, xmm12
0x100227d5b: vminps xmm0, xmm0, xmm5
0x100227d5f: vcvttps2dq xmm0, xmm0
0x100227d63: vpextrw word ptr [rbx + 0x14], xmm0, 0
0x100227d6a: vpextrw word ptr [rbx + 0x16], xmm0, 2
0x100227d71: vpextrw word ptr [rbx + 0x18], xmm0, 4
0x100227d78: vpextrw word ptr [rbx + 0x1a], xmm0, 6
0x100227d7f: vminps xmm0, xmm1, xmm13
0x100227d84: vmovaps xmm1, xmmword ptr [rbp - 0x2ec0]
0x100227d8c: vcvttps2dq xmm0, xmm0
0x100227d90: vpextrb byte ptr [rbx + 0x1c], xmm0, 0
0x100227d97: vpextrb byte ptr [rbx + 0x1d], xmm0, 4
0x100227d9e: vpextrb byte ptr [rbx + 0x1e], xmm0, 8
0x100227da5: vsubss xmm0, xmm4, xmm1
0x100227da9: vmulss xmm0, xmm3, xmm0
0x100227dad: vaddss xmm0, xmm0, xmm2
0x100227db1: mov eax, dword ptr [rbp - 0x2d40]
0x100227db7: mov rdx, qword ptr [rbp - 0x2d90]
0x100227dbe: vmovss dword ptr [rdx + rax*4], xmm0
0x100227dc3: mov edx, dword ptr [rbp - 0x2d40]
0x100227dc9: inc edx
0x100227dcb: add rbx, 0x20
0x100227dcf: cmp edx, dword ptr [r12 + 0xc828]
0x100227dd7: jb 0x100227a20
0x100227ddd: call 0x1007e8410 ; 0x1007e8410
0x100227de2: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x100227dea: mov r15, qword ptr [rbp - 0x2dc0]
0x100227df1: call 0x1007e8410 ; 0x1007e8410
0x100227df6: vsubsd xmm0, xmm0, qword ptr [rip + 0xb03522] ; 0x100d2b320
0x100227dfe: vmovsd xmm1, qword ptr [rip + 0x889fca] ; 0x100ab1dd0
0x100227e06: vucomisd xmm1, xmm0
0x100227e0a: ja 0x100227eaa
0x100227e10: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x100227e18: vsubsd xmm0, xmm0, qword ptr [rbp - 0x2d48]
0x100227e20: vmulsd xmm0, xmm0, qword ptr [rip + 0x889fb0] ; 0x100ab1dd8
0x100227e28: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x100227e30: lea rdi, [rip + 0xb02229] ; 0x100d2a060
0x100227e37: lea rsi, [rip + 0xb0221a] ; 0x100d2a058
0x100227e3e: mov edx, 0x958
0x100227e43: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100227e48: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x100227e50: vmovsd qword ptr [rip + 0xb02200], xmm0 ; 0x100d2a058
0x100227e58: mov r14d, dword ptr [rip + 0xb034b9] ; 0x100d2b318
0x100227e5f: cmp r14d, 0x12c
0x100227e66: adc r14d, 0
0x100227e6a: mov dword ptr [rip + 0xb034a7], r14d ; 0x100d2b318
0x100227e71: lea rbx, [rip + 0xb02b40] ; 0x100d2a9b8
0x100227e78: mov edx, 0x960
0x100227e7d: mov rdi, rbx
0x100227e80: lea rsi, [rip + 0xb021d1] ; 0x100d2a058
0x100227e87: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100227e8c: lea rax, [rip + 0xb02185] ; 0x100d2a018
0x100227e93: lea rsi, [rax + r14*8 + 0x9a0]
0x100227e9b: lea rdx, [rbp - 0x930]
0x100227ea2: mov rdi, rbx
0x100227ea5: call 0x100aa2426 ; 0x100aa2426 __ZNSt3__16__sortIRNS_6__lessIddEEPdEEvT0_S5_T_
0x100227eaa: cmp qword ptr [r12 + 0x10], 0
0x100227eb0: je 0x1002281f8
0x100227eb6: mov ebx, dword ptr [r12 + 0xc828]
0x100227ebe: call 0x1007c6c20 ; 0x1007c6c20
0x100227ec3: add rbx, rbx
0x100227ec6: lea rcx, [rip + 0x1e20c83] ; 0x102048b50
0x100227ecd: mov rdx, qword ptr [rcx]
0x100227ed0: mov ecx, 2
0x100227ed5: mov rdi, rax
0x100227ed8: mov rsi, rbx
0x100227edb: call 0x100795530 ; 0x100795530
0x100227ee0: mov r14, rax
0x100227ee3: mov ecx, dword ptr [r12 + 0xc828]
0x100227eeb: test rcx, rcx
0x100227eee: je 0x1002280cf
0x100227ef4: cmp ecx, 0xf
0x100227ef7: ja 0x1002280d3
0x100227efd: xor eax, eax
0x100227eff: jmp 0x100228130 ; 0x100228130
0x100227f04: cmp ecx, 2
0x100227f07: cmova r10d, ecx
0x100227f0b: add r10d, -2
0x100227f0f: lea ebx, [rax + 1]
0x100227f12: mov r8d, ebx
0x100227f15: and r8d, 0x3ff
0x100227f1c: mov r11d, r10d
0x100227f1f: and r11d, 0x3ff
0x100227f26: add r11d, r8d
0x100227f29: mov esi, r11d
0x100227f2c: and esi, 0x3ff
0x100227f32: cmp si, r11w
0x100227f36: jne 0x100226695
0x100227f3c: cmp r10d, 0x3ff
0x100227f43: ja 0x100226695
0x100227f49: mov r8d, r9d
0x100227f4c: and r8d, 0xffffffe0
0x100227f50: lea edx, [r8 + 1]
0x100227f54: vpermilps xmm1, xmm11, 0
0x100227f5a: vinsertf128 ymm4, ymm1, xmm1, 1
0x100227f60: vmovd xmm1, edi
0x100227f64: vxorps ymm12, ymm12, ymm12
0x100227f69: mov edi, r8d
0x100227f6c: vxorps ymm5, ymm5, ymm5
0x100227f70: vxorpd ymm2, ymm2, ymm2
0x100227f74: vxorps ymm3, ymm3, ymm3
0x100227f78: nop dword ptr [rax + rax]
0x100227f80: mov esi, ebx
0x100227f82: and esi, 0x3ff
0x100227f88: vmovups ymm7, ymmword ptr [r12 + rsi*4 + 0x8018]
0x100227f92: vmovups ymm8, ymmword ptr [r12 + rsi*4 + 0x8038]
0x100227f9c: vmovups ymm9, ymmword ptr [r12 + rsi*4 + 0x8058]
0x100227fa6: vmovups ymm10, ymmword ptr [r12 + rsi*4 + 0x8078]
0x100227fb0: vsubps ymm7, ymm7, ymm4
0x100227fb4: vsubps ymm8, ymm8, ymm4
0x100227fb8: vsubps ymm9, ymm9, ymm4
0x100227fbc: vsubps ymm10, ymm10, ymm4
0x100227fc0: vmovups ymmword ptr [r12 + rsi*4 + 0x8018], ymm7
0x100227fca: vmovups ymmword ptr [r12 + rsi*4 + 0x8038], ymm8
0x100227fd4: vmovups ymmword ptr [r12 + rsi*4 + 0x8058], ymm9
0x100227fde: vmovups ymmword ptr [r12 + rsi*4 + 0x8078], ymm10
0x100227fe8: vcmpltps ymm7, ymm7, ymm12
0x100227fee: vcmpltps ymm8, ymm8, ymm12
0x100227ff4: vcmpltps ymm9, ymm9, ymm12
0x100227ffa: vcmpltps ymm10, ymm10, ymm12
0x100228000: vextractf128 xmm0, ymm7, 1
0x100228006: vextractf128 xmm6, ymm1, 1
0x10022800c: vpsubd xmm0, xmm6, xmm0
0x100228010: vpsubd xmm1, xmm1, xmm7
0x100228014: vinsertf128 ymm1, ymm1, xmm0, 1
0x10022801a: vextractf128 xmm0, ymm8, 1
0x100228020: vextractf128 xmm6, ymm5, 1
0x100228026: vpsubd xmm0, xmm6, xmm0
0x10022802a: vpsubd xmm5, xmm5, xmm8
0x10022802f: vinsertf128 ymm5, ymm5, xmm0, 1
0x100228035: vextractf128 xmm0, ymm9, 1
0x10022803b: vextractf128 xmm6, ymm2, 1
0x100228041: vpsubd xmm0, xmm6, xmm0
0x100228045: vpsubd xmm2, xmm2, xmm9
0x10022804a: vinsertf128 ymm2, ymm2, xmm0, 1
0x100228050: vextractf128 xmm0, ymm10, 1
0x100228056: vextractf128 xmm6, ymm3, 1
0x10022805c: vpsubd xmm0, xmm6, xmm0
0x100228060: vpsubd xmm3, xmm3, xmm10
0x100228065: vinsertf128 ymm3, ymm3, xmm0, 1
0x10022806b: add ebx, 0x20
0x10022806e: add edi, -0x20
0x100228071: jne 0x100227f80
0x100228077: vextractf128 xmm0, ymm1, 1
0x10022807d: vextractf128 xmm4, ymm5, 1
0x100228083: vpaddd xmm0, xmm4, xmm0
0x100228087: vpaddd xmm1, xmm5, xmm1
0x10022808b: vextractf128 xmm4, ymm2, 1
0x100228091: vextractf128 xmm5, ymm3, 1
0x100228097: vpaddd xmm4, xmm4, xmm5
0x10022809b: vpaddd xmm0, xmm0, xmm4
0x10022809f: vpaddd xmm2, xmm2, xmm3
0x1002280a3: vpaddd xmm1, xmm1, xmm2
0x1002280a7: vpaddd xmm0, xmm1, xmm0
0x1002280ab: vpshufd xmm1, xmm0, 0x4e
0x1002280b0: vpaddd xmm0, xmm0, xmm1
0x1002280b4: vpshufd xmm1, xmm0, 0xe5
0x1002280b9: vpaddd xmm0, xmm0, xmm1
0x1002280bd: vmovd edi, xmm0
0x1002280c1: cmp r9d, r8d
0x1002280c4: jne 0x100226695
0x1002280ca: jmp 0x1002266d4 ; 0x1002266d4
0x1002280cf: xor ecx, ecx
0x1002280d1: jmp 0x10022813d ; 0x10022813d
0x1002280d3: mov edx, ecx
0x1002280d5: and edx, 0xf
0x1002280d8: mov rax, rcx
0x1002280db: sub rax, rdx
0x1002280de: vmovdqa ymm1, ymmword ptr [rip + 0x889cfa] ; 0x100ab1de0
0x1002280e6: vmovdqa xmm0, xmmword ptr [rip + 0x889cb2] ; 0x100ab1da0
0x1002280ee: mov rsi, rax
0x1002280f1: mov rdi, r14
0x1002280f4: nop word ptr cs:[rax + rax]
0x100228100: vmovdqu ymmword ptr [rdi], ymm1
0x100228104: vextractf128 xmm2, ymm1, 1
0x10022810a: vpaddw xmm2, xmm2, xmm0
0x10022810e: vpaddw xmm1, xmm1, xmm0
0x100228112: vinsertf128 ymm1, ymm1, xmm2, 1
0x100228118: add rdi, 0x20
0x10022811c: add rsi, -0x10
0x100228120: jne 0x100228100
0x100228122: test edx, edx
0x100228124: je 0x10022813d
0x100228126: nop word ptr cs:[rax + rax]
0x100228130: mov word ptr [r14 + rax*2], ax
0x100228135: inc rax
0x100228138: cmp rax, rcx
0x10022813b: jb 0x100228130
0x10022813d: mov eax, ecx
0x10022813f: lea rsi, [r14 + rax*2]
0x100228143: mov rax, qword ptr [rbp - 0x2d90]
0x10022814a: mov qword ptr [rbp - 0x930], rax
0x100228151: lea rdx, [rbp - 0x930]
0x100228158: mov rdi, r14
0x10022815b: vzeroupper 
0x10022815e: call 0x100229600 ; 0x100229600
0x100228163: mov rdi, qword ptr [r12 + 0x10]
0x100228168: cmp dword ptr [rdi + 0x190], 2
0x10022816f: jne 0x10022837e
0x100228175: cmp dword ptr [rdi + 0x120], 0x20
0x10022817c: jne 0x10022839d
0x100228182: add rdi, 0x188
0x100228189: call 0x100795060 ; 0x100795060
0x10022818e: cmp dword ptr [r12 + 0xc828], 0
0x100228197: je 0x1002281d9
0x100228199: xor ecx, ecx
0x10022819b: mov rdi, qword ptr [rbp - 0x2d50]
0x1002281a2: nop word ptr cs:[rax + rax]
0x1002281b0: mov edx, ecx
0x1002281b2: movzx esi, word ptr [r14 + rdx*2]
0x1002281b7: shl rsi, 5
0x1002281bb: shl rdx, 5
0x1002281bf: vmovupd ymm0, ymmword ptr [rdi + rsi]
0x1002281c4: vmovupd ymmword ptr [rax + rdx], ymm0
0x1002281c9: inc ecx
0x1002281cb: mov esi, dword ptr [r12 + 0xc828]
0x1002281d3: cmp ecx, esi
0x1002281d5: jb 0x1002281b0
0x1002281d7: jmp 0x1002281db ; 0x1002281db
0x1002281d9: xor esi, esi
0x1002281db: mov rdi, qword ptr [r12 + 0x10]
0x1002281e0: vzeroupper 
0x1002281e3: call 0x100473d40 ; 0x100473d40
0x1002281e8: call 0x1007c6c20 ; 0x1007c6c20
0x1002281ed: mov rdi, rax
0x1002281f0: mov rsi, r14
0x1002281f3: call 0x100795a70 ; 0x100795a70
0x1002281f8: call 0x1007c6c20 ; 0x1007c6c20
0x1002281fd: mov rdi, rax
0x100228200: mov rsi, qword ptr [rbp - 0x2d50]
0x100228207: call 0x100795a70 ; 0x100795a70
0x10022820c: call 0x1007c6c20 ; 0x1007c6c20
0x100228211: mov rdi, rax
0x100228214: mov rsi, qword ptr [rbp - 0x2d90]
0x10022821b: call 0x100795a70 ; 0x100795a70
0x100228220: call 0x1007c6c20 ; 0x1007c6c20
0x100228225: mov rdi, rax
0x100228228: mov rsi, qword ptr [rbp - 0x2d70]
0x10022822f: call 0x100795a70 ; 0x100795a70
0x100228234: call 0x1007c6c20 ; 0x1007c6c20
0x100228239: mov rbx, qword ptr [rbp - 0x2d68]
0x100228240: mov rdi, rax
0x100228243: mov rsi, qword ptr [rbp - 0x2d78]
0x10022824a: call 0x100795a70 ; 0x100795a70
0x10022824f: call 0x1007c6c20 ; 0x1007c6c20
0x100228254: mov rdi, rax
0x100228257: mov rsi, r13
0x10022825a: call 0x100795a70 ; 0x100795a70
0x10022825f: call 0x1007c6c20 ; 0x1007c6c20
0x100228264: mov rdi, rax
0x100228267: mov rsi, qword ptr [rbp - 0x2db8]
0x10022826e: call 0x100795a70 ; 0x100795a70
0x100228273: call 0x1007c6c20 ; 0x1007c6c20
0x100228278: mov rdi, rax
0x10022827b: mov rsi, r15
0x10022827e: call 0x100795a70 ; 0x100795a70
0x100228283: call 0x1007c6c20 ; 0x1007c6c20
0x100228288: mov rdi, rax
0x10022828b: mov rsi, rbx
0x10022828e: call 0x100795a70 ; 0x100795a70
0x100228293: vzeroupper 
0x100228296: call 0x1007e8410 ; 0x1007e8410
0x10022829b: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x1002282a3: call 0x1007e8410 ; 0x1007e8410
0x1002282a8: vsubsd xmm0, xmm0, qword ptr [rip + 0xb00a50] ; 0x100d28d00
0x1002282b0: vmovsd xmm1, qword ptr [rip + 0x889b18] ; 0x100ab1dd0
0x1002282b8: vucomisd xmm1, xmm0
0x1002282bc: ja 0x100228357
0x1002282c2: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x1002282ca: vsubsd xmm0, xmm0, qword ptr [rbp - 0x2de8]
0x1002282d2: vmulsd xmm0, xmm0, qword ptr [rip + 0x889afe] ; 0x100ab1dd8
0x1002282da: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x1002282e2: lea rdi, [rip + 0xaff757] ; 0x100d27a40
0x1002282e9: lea r14, [rip + 0xaff748] ; 0x100d27a38
0x1002282f0: mov edx, 0x958
0x1002282f5: mov rsi, r14
0x1002282f8: call 0x100aa28fa ; 0x100aa28fa _memmove
0x1002282fd: lea r15, [rip + 0xaff6f4] ; 0x100d279f8
0x100228304: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x10022830c: vmovsd qword ptr [rip + 0xaff724], xmm0 ; 0x100d27a38
0x100228314: mov ebx, dword ptr [rip + 0xb009de] ; 0x100d28cf8
0x10022831a: cmp ebx, 0x12c
0x100228320: adc ebx, 0
0x100228323: mov dword ptr [rip + 0xb009cf], ebx ; 0x100d28cf8
0x100228329: lea r12, [rip + 0xb00068] ; 0x100d28398
0x100228330: mov edx, 0x960
0x100228335: mov rdi, r12
0x100228338: mov rsi, r14
0x10022833b: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100228340: lea rsi, [r15 + rbx*8 + 0x9a0]
0x100228348: lea rdx, [rbp - 0x930]
0x10022834f: mov rdi, r12
0x100228352: call 0x100aa2426 ; 0x100aa2426 __ZNSt3__16__sortIRNS_6__lessIddEEPdEEvT0_S5_T_
0x100228357: mov rax, qword ptr [rip + 0x9e557a] ; 0x100c0d8d8
0x10022835e: mov rax, qword ptr [rax]
0x100228361: cmp rax, qword ptr [rbp - 0x30]
0x100228365: jne 0x100228379
0x100228367: add rsp, 0x2eb8
0x10022836e: pop rbx
0x10022836f: pop r12
0x100228371: pop r13
0x100228373: pop r14
0x100228375: pop r15
0x100228377: pop rbp
0x100228378: ret 
0x100228379: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10022837e: lea rdi, [rip + 0x94e996] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x100228385: lea rsi, [rip + 0x939eef] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10022838c: mov edx, 0x115
0x100228391: mov ecx, 3
0x100228396: call 0x1007e5f70 ; 0x1007e5f70
0x10022839b: jmp 0x1002283ba ; 0x1002283ba
0x10022839d: lea rdi, [rip + 0x94e9a9] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x1002283a4: lea rsi, [rip + 0x939ed0] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1002283ab: mov edx, 0x116
0x1002283b0: mov ecx, 3
0x1002283b5: call 0x1007e5f70 ; 0x1007e5f70
0x1002283ba: ud2 
0x1002283bc: jmp 0x1002283cd ; 0x1002283cd
0x1002283be: jmp 0x1002283ea ; 0x1002283ea
0x1002283c0: jmp 0x10022846c ; 0x10022846c
0x1002283c5: mov rdi, rax
0x1002283c8: call 0x100011bf0 ; 0x100011bf0
0x1002283cd: mov r12, rax
0x1002283d0: call 0x1007c6c20 ; 0x1007c6c20
0x1002283d5: mov rdi, rax
0x1002283d8: mov rsi, r14
0x1002283db: call 0x100795a70 ; 0x100795a70
0x1002283e0: jmp 0x1002283ed ; 0x1002283ed
0x1002283e2: mov rdi, rax
0x1002283e5: call 0x100011bf0 ; 0x100011bf0
0x1002283ea: mov r12, rax
0x1002283ed: call 0x1007c6c20 ; 0x1007c6c20
0x1002283f2: mov rdi, rax
0x1002283f5: mov rsi, qword ptr [rbp - 0x2d50]
0x1002283fc: call 0x100795a70 ; 0x100795a70
0x100228401: jmp 0x10022844e ; 0x10022844e
0x100228403: mov rdi, rax
0x100228406: call 0x100011bf0 ; 0x100011bf0
0x10022840b: mov rdi, rax
0x10022840e: call 0x100011bf0 ; 0x100011bf0
0x100228413: mov rdi, rax
0x100228416: call 0x100011bf0 ; 0x100011bf0
0x10022841b: mov rdi, rax
0x10022841e: call 0x100011bf0 ; 0x100011bf0
0x100228423: mov rdi, rax
0x100228426: call 0x100011bf0 ; 0x100011bf0
0x10022842b: mov rdi, rax
0x10022842e: call 0x100011bf0 ; 0x100011bf0
0x100228433: mov rdi, rax
0x100228436: call 0x100011bf0 ; 0x100011bf0
0x10022843b: mov rdi, rax
0x10022843e: call 0x100011bf0 ; 0x100011bf0
0x100228443: mov rdi, rax
0x100228446: call 0x100011bf0 ; 0x100011bf0
0x10022844b: mov r12, rax
0x10022844e: call 0x1007c6c20 ; 0x1007c6c20
0x100228453: mov rdi, rax
0x100228456: mov rsi, qword ptr [rbp - 0x2d90]
0x10022845d: call 0x100795a70 ; 0x100795a70
0x100228462: jmp 0x10022846f ; 0x10022846f
0x100228464: mov rdi, rax
0x100228467: call 0x100011bf0 ; 0x100011bf0
0x10022846c: mov r12, rax
0x10022846f: call 0x1007c6c20 ; 0x1007c6c20
0x100228474: mov rdi, rax
0x100228477: mov rsi, qword ptr [rbp - 0x2d70]
0x10022847e: call 0x100795a70 ; 0x100795a70
0x100228483: call 0x1007c6c20 ; 0x1007c6c20
0x100228488: mov rdi, rax
0x10022848b: mov rsi, qword ptr [rbp - 0x2d78]
0x100228492: call 0x100795a70 ; 0x100795a70
0x100228497: call 0x1007c6c20 ; 0x1007c6c20
0x10022849c: mov rdi, rax
0x10022849f: mov rsi, qword ptr [rbp - 0x2d60]
0x1002284a6: call 0x100795a70 ; 0x100795a70
0x1002284ab: call 0x1007c6c20 ; 0x1007c6c20
0x1002284b0: mov rdi, rax
0x1002284b3: mov rsi, qword ptr [rbp - 0x2db8]
0x1002284ba: call 0x100795a70 ; 0x100795a70
0x1002284bf: call 0x1007c6c20 ; 0x1007c6c20
0x1002284c4: mov rdi, rax
0x1002284c7: mov rsi, qword ptr [rbp - 0x2dc0]
0x1002284ce: call 0x100795a70 ; 0x100795a70
0x1002284d3: call 0x1007c6c20 ; 0x1007c6c20
0x1002284d8: mov rdi, rax
0x1002284db: mov rsi, qword ptr [rbp - 0x2d68]
0x1002284e2: call 0x100795a70 ; 0x100795a70
0x1002284e7: jmp 0x10022855f ; 0x10022855f
0x1002284e9: mov rdi, rax
0x1002284ec: call 0x100011bf0 ; 0x100011bf0
0x1002284f1: mov rdi, rax
0x1002284f4: call 0x100011bf0 ; 0x100011bf0
0x1002284f9: mov rdi, rax
0x1002284fc: call 0x100011bf0 ; 0x100011bf0
0x100228501: mov rdi, rax
0x100228504: call 0x100011bf0 ; 0x100011bf0
0x100228509: mov rdi, rax
0x10022850c: call 0x100011bf0 ; 0x100011bf0
0x100228511: mov rdi, rax
0x100228514: call 0x100011bf0 ; 0x100011bf0
0x100228519: mov r12, rax
0x10022851c: jmp 0x100228483 ; 0x100228483
0x100228521: mov r12, rax
0x100228524: jmp 0x100228497 ; 0x100228497
0x100228529: mov r12, rax
0x10022852c: jmp 0x1002284ab ; 0x1002284ab
0x100228531: mov r12, rax
0x100228534: jmp 0x1002284bf ; 0x1002284bf
0x100228536: mov r12, rax
0x100228539: jmp 0x1002284d3 ; 0x1002284d3
0x10022853b: jmp 0x10022855c ; 0x10022855c
0x10022853d: mov rdi, rax
0x100228540: call 0x100011bf0 ; 0x100011bf0
0x100228545: mov rdi, rax
0x100228548: call 0x100011bf0 ; 0x100011bf0
0x10022854d: mov r12, rax
0x100228550: mov rdi, r12
0x100228553: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100228558: jmp 0x10022855c ; 0x10022855c
0x10022855a: jmp 0x10022855c ; 0x10022855c
0x10022855c: mov r12, rax
0x10022855f: call 0x1007e8410 ; 0x1007e8410
0x100228564: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x10022856c: call 0x1007e8410 ; 0x1007e8410
0x100228571: vsubsd xmm0, xmm0, qword ptr [rip + 0xb00787] ; 0x100d28d00
0x100228579: vmovsd xmm1, qword ptr [rip + 0x88984f] ; 0x100ab1dd0
0x100228581: vucomisd xmm1, xmm0
0x100228585: ja 0x100228620
0x10022858b: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x100228593: vsubsd xmm0, xmm0, qword ptr [rbp - 0x2de8]
0x10022859b: vmulsd xmm0, xmm0, qword ptr [rip + 0x889835] ; 0x100ab1dd8
0x1002285a3: vmovsd qword ptr [rbp - 0x2d40], xmm0
0x1002285ab: lea rdi, [rip + 0xaff48e] ; 0x100d27a40
0x1002285b2: lea r14, [rip + 0xaff47f] ; 0x100d27a38
0x1002285b9: mov edx, 0x958
0x1002285be: mov rsi, r14
0x1002285c1: call 0x100aa28fa ; 0x100aa28fa _memmove
0x1002285c6: lea r15, [rip + 0xaff42b] ; 0x100d279f8
0x1002285cd: vmovsd xmm0, qword ptr [rbp - 0x2d40]
0x1002285d5: vmovsd qword ptr [rip + 0xaff45b], xmm0 ; 0x100d27a38
0x1002285dd: mov ebx, dword ptr [rip + 0xb00715] ; 0x100d28cf8
0x1002285e3: cmp ebx, 0x12c
0x1002285e9: adc ebx, 0
0x1002285ec: mov dword ptr [rip + 0xb00706], ebx ; 0x100d28cf8
0x1002285f2: lea r13, [rip + 0xaffd9f] ; 0x100d28398
0x1002285f9: mov edx, 0x960
0x1002285fe: mov rdi, r13
0x100228601: mov rsi, r14
0x100228604: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100228609: lea rsi, [r15 + rbx*8 + 0x9a0]
0x100228611: lea rdx, [rbp - 0x2d30]
0x100228618: mov rdi, r13
0x10022861b: call 0x100aa2426 ; 0x100aa2426 __ZNSt3__16__sortIRNS_6__lessIddEEPdEEvT0_S5_T_
0x100228620: mov rdi, r12
0x100228623: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100228628: mov rdi, rax
0x10022862b: call 0x100011bf0 ; 0x100011bf0
