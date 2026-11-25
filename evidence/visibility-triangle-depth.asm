0x10071ee60: push rbp
0x10071ee61: mov rbp, rsp
0x10071ee64: push r15
0x10071ee66: push r14
0x10071ee68: push r13
0x10071ee6a: push r12
0x10071ee6c: push rbx
0x10071ee6d: sub rsp, 0x3b8
0x10071ee74: mov qword ptr [rbp - 0xd0], rsi
0x10071ee7b: mov rax, qword ptr [rip + 0x4eea56] ; 0x100c0d8d8
0x10071ee82: mov rax, qword ptr [rax]
0x10071ee85: mov qword ptr [rbp - 0x30], rax
0x10071ee89: mov eax, r9d
0x10071ee8c: mov esi, 0xaaaaaaab
0x10071ee91: imul rsi, rax
0x10071ee95: shr rsi, 0x23
0x10071ee99: shl esi, 2
0x10071ee9c: lea eax, [rsi + rsi*2]
0x10071ee9f: mov dword ptr [rbp - 0xc4], eax
0x10071eea5: test eax, eax
0x10071eea7: je 0x10071f75c
0x10071eead: mov rax, qword ptr [rbp - 0xd0]
0x10071eeb4: vmovd xmm0, eax
0x10071eeb8: vpshufd xmm0, xmm0, 0
0x10071eebd: vmovdqa xmmword ptr [rbp - 0x120], xmm0
0x10071eec5: vmovd xmm0, edx
0x10071eec9: vpshufd xmm0, xmm0, 0
0x10071eece: vmovdqa xmmword ptr [rbp - 0x110], xmm0
0x10071eed6: lea r12d, [rax + rax]
0x10071eeda: xor r13d, r13d
0x10071eedd: vxorps xmm11, xmm11, xmm11
0x10071eee2: nop word ptr cs:[rax + rax]
0x10071eef0: mov r11d, r13d
0x10071eef3: or r11d, 3
0x10071eef7: lea r10d, [r13 + 6]
0x10071eefb: lea r9d, [r13 + 9]
0x10071eeff: mov edx, r13d
0x10071ef02: movzx r14d, word ptr [r8 + rdx*2]
0x10071ef07: shl r14, 4
0x10071ef0b: movzx esi, word ptr [r8 + r11*2]
0x10071ef10: shl rsi, 4
0x10071ef14: movzx eax, word ptr [r8 + r10*2]
0x10071ef19: shl rax, 4
0x10071ef1d: movzx ebx, word ptr [r8 + r9*2]
0x10071ef22: shl rbx, 4
0x10071ef26: vmovss xmm0, dword ptr [rcx + r14]
0x10071ef2c: vmovss xmm1, dword ptr [rcx + r14 + 4]
0x10071ef33: vinsertps xmm0, xmm0, dword ptr [rcx + rsi], 0x10
0x10071ef3a: vinsertps xmm0, xmm0, dword ptr [rcx + rax], 0x20
0x10071ef41: vinsertps xmm0, xmm0, dword ptr [rcx + rbx], 0x30
0x10071ef48: vinsertps xmm1, xmm1, dword ptr [rcx + rsi + 4], 0x10
0x10071ef50: vinsertps xmm1, xmm1, dword ptr [rcx + rax + 4], 0x20
0x10071ef58: vinsertps xmm1, xmm1, dword ptr [rcx + rbx + 4], 0x30
0x10071ef60: vmovss xmm2, dword ptr [rcx + r14 + 8]
0x10071ef67: vinsertps xmm2, xmm2, dword ptr [rcx + rsi + 8], 0x10
0x10071ef6f: vinsertps xmm2, xmm2, dword ptr [rcx + rax + 8], 0x20
0x10071ef77: vinsertps xmm2, xmm2, dword ptr [rcx + rbx + 8], 0x30
0x10071ef7f: vmovaps xmm6, xmmword ptr [rip + 0x38a739] ; 0x100aa96c0
0x10071ef87: vaddps xmm0, xmm0, xmm6
0x10071ef8b: vcvtps2dq xmm0, xmm0
0x10071ef8f: vmovapd xmmword ptr [rbp - 0x60], xmm0
0x10071ef94: vaddps xmm0, xmm1, xmm6
0x10071ef98: vcvtps2dq xmm0, xmm0
0x10071ef9c: vmovapd xmmword ptr [rbp - 0x90], xmm0
0x10071efa4: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10071efac: mov rax, rdx
0x10071efaf: or rax, 1
0x10071efb3: movzx r9d, word ptr [r8 + rax*2]
0x10071efb8: shl r9, 4
0x10071efbc: lea eax, [r11 + 1]
0x10071efc0: movzx eax, word ptr [r8 + rax*2]
0x10071efc5: shl rax, 4
0x10071efc9: lea ebx, [r13 + 7]
0x10071efcd: movzx ebx, word ptr [r8 + rbx*2]
0x10071efd2: shl rbx, 4
0x10071efd6: lea esi, [r13 + 0xa]
0x10071efda: movzx esi, word ptr [r8 + rsi*2]
0x10071efdf: shl rsi, 4
0x10071efe3: vmovss xmm0, dword ptr [rcx + r9]
0x10071efe9: vmovss xmm1, dword ptr [rcx + r9 + 4]
0x10071eff0: vinsertps xmm0, xmm0, dword ptr [rcx + rax], 0x10
0x10071eff7: vinsertps xmm0, xmm0, dword ptr [rcx + rbx], 0x20
0x10071effe: vinsertps xmm0, xmm0, dword ptr [rcx + rsi], 0x30
0x10071f005: vinsertps xmm1, xmm1, dword ptr [rcx + rax + 4], 0x10
0x10071f00d: vinsertps xmm1, xmm1, dword ptr [rcx + rbx + 4], 0x20
0x10071f015: vinsertps xmm1, xmm1, dword ptr [rcx + rsi + 4], 0x30
0x10071f01d: vmovss xmm2, dword ptr [rcx + r9 + 8]
0x10071f024: vinsertps xmm2, xmm2, dword ptr [rcx + rax + 8], 0x10
0x10071f02c: vinsertps xmm2, xmm2, dword ptr [rcx + rbx + 8], 0x20
0x10071f034: vinsertps xmm8, xmm2, dword ptr [rcx + rsi + 8], 0x30
0x10071f03c: vaddps xmm0, xmm0, xmm6
0x10071f040: vcvtps2dq xmm12, xmm0
0x10071f044: vmovapd xmmword ptr [rbp - 0x50], xmm12
0x10071f049: vaddps xmm0, xmm1, xmm6
0x10071f04d: vcvtps2dq xmm10, xmm0
0x10071f051: vmovapd xmmword ptr [rbp - 0x80], xmm10
0x10071f056: vmovaps xmmword ptr [rbp - 0xb0], xmm8
0x10071f05e: mov rax, rdx
0x10071f061: or rax, 2
0x10071f065: movzx r9d, word ptr [r8 + rax*2]
0x10071f06a: shl r9, 4
0x10071f06e: add r11d, 2
0x10071f072: movzx eax, word ptr [r8 + r11*2]
0x10071f077: shl rax, 4
0x10071f07b: lea ebx, [r13 + 8]
0x10071f07f: movzx ebx, word ptr [r8 + rbx*2]
0x10071f084: shl rbx, 4
0x10071f088: lea esi, [r13 + 0xb]
0x10071f08c: movzx esi, word ptr [r8 + rsi*2]
0x10071f091: shl rsi, 4
0x10071f095: vmovss xmm1, dword ptr [rcx + r9]
0x10071f09b: vmovss xmm4, dword ptr [rcx + r9 + 4]
0x10071f0a2: vinsertps xmm1, xmm1, dword ptr [rcx + rax], 0x10
0x10071f0a9: vinsertps xmm1, xmm1, dword ptr [rcx + rbx], 0x20
0x10071f0b0: vinsertps xmm5, xmm1, dword ptr [rcx + rsi], 0x30
0x10071f0b7: vinsertps xmm1, xmm4, dword ptr [rcx + rax + 4], 0x10
0x10071f0bf: vinsertps xmm1, xmm1, dword ptr [rcx + rbx + 4], 0x20
0x10071f0c7: vinsertps xmm4, xmm1, dword ptr [rcx + rsi + 4], 0x30
0x10071f0cf: vmovss xmm1, dword ptr [rcx + r9 + 8]
0x10071f0d6: vinsertps xmm1, xmm1, dword ptr [rcx + rax + 8], 0x10
0x10071f0de: vinsertps xmm1, xmm1, dword ptr [rcx + rbx + 8], 0x20
0x10071f0e6: vinsertps xmm9, xmm1, dword ptr [rcx + rsi + 8], 0x30
0x10071f0ee: vaddps xmm5, xmm5, xmm6
0x10071f0f2: vcvtps2dq xmm5, xmm5
0x10071f0f6: vmovapd xmmword ptr [rbp - 0x40], xmm5
0x10071f0fb: vaddps xmm4, xmm4, xmm6
0x10071f0ff: vcvtps2dq xmm4, xmm4
0x10071f103: vmovapd xmmword ptr [rbp - 0x70], xmm4
0x10071f108: vmovaps xmm13, xmmword ptr [rbp - 0xc0]
0x10071f110: vcmpltps xmm6, xmm11, xmm13
0x10071f116: vcmpltps xmm7, xmm11, xmm8
0x10071f11c: vandps xmm1, xmm7, xmm6
0x10071f120: vcmpltps xmm0, xmm11, xmm9
0x10071f126: vandps xmm1, xmm1, xmm0
0x10071f12a: vmovaps xmmword ptr [rbp - 0x250], xmm1
0x10071f132: vorps xmm1, xmm7, xmm6
0x10071f136: vorps xmm0, xmm1, xmm0
0x10071f13a: vmovaps xmmword ptr [rbp - 0x240], xmm0
0x10071f142: vmovdqa xmm7, xmmword ptr [rbp - 0x90]
0x10071f14a: vpsubd xmm2, xmm4, xmm7
0x10071f14e: vmovdqa xmm6, xmmword ptr [rbp - 0x60]
0x10071f153: vpmulld xmm0, xmm12, xmm4
0x10071f158: vpmulld xmm1, xmm5, xmm10
0x10071f15d: vpsubd xmm0, xmm0, xmm1
0x10071f161: vmovdqa xmmword ptr [rbp - 0x150], xmm0
0x10071f169: vpmulld xmm0, xmm5, xmm7
0x10071f16e: vpmulld xmm1, xmm6, xmm4
0x10071f173: vpsubd xmm0, xmm0, xmm1
0x10071f177: vmovdqa xmmword ptr [rbp - 0x140], xmm0
0x10071f17f: vpmulld xmm0, xmm6, xmm10
0x10071f184: vpmulld xmm1, xmm12, xmm7
0x10071f189: vpsubd xmm0, xmm0, xmm1
0x10071f18d: vmovdqa xmmword ptr [rbp - 0x130], xmm0
0x10071f195: vpsubd xmm1, xmm7, xmm10
0x10071f19a: vpsubd xmm3, xmm6, xmm5
0x10071f19e: vpsubd xmm0, xmm12, xmm6
0x10071f1a2: vmovdqa xmmword ptr [rbp - 0x210], xmm2
0x10071f1aa: vmovdqa xmmword ptr [rbp - 0x1e0], xmm0
0x10071f1b2: vpmulld xmm0, xmm0, xmm2
0x10071f1b7: vmovdqa xmmword ptr [rbp - 0x200], xmm1
0x10071f1bf: vmovdqa xmmword ptr [rbp - 0x1f0], xmm3
0x10071f1c7: vpmulld xmm1, xmm3, xmm1
0x10071f1cc: vpsubd xmm0, xmm0, xmm1
0x10071f1d0: vmovdqa xmmword ptr [rbp - 0x230], xmm0
0x10071f1d8: vcvtdq2ps xmm0, xmm0
0x10071f1dc: vrcpps xmm1, xmm0
0x10071f1e0: vmulps xmm2, xmm0, xmm1
0x10071f1e4: vmovaps xmm3, xmmword ptr [rip + 0x39a054] ; 0x100ab9240
0x10071f1ec: vsubps xmm2, xmm3, xmm2
0x10071f1f0: vmulps xmm1, xmm1, xmm2
0x10071f1f4: vmulps xmm0, xmm0, xmm1
0x10071f1f8: vsubps xmm0, xmm3, xmm0
0x10071f1fc: vmulps xmm0, xmm1, xmm0
0x10071f200: vsubps xmm1, xmm8, xmm13
0x10071f205: vmulps xmm8, xmm1, xmm0
0x10071f209: vmovaps xmmword ptr [rbp - 0x220], xmm13
0x10071f211: vsubps xmm1, xmm9, xmm13
0x10071f216: vmulps xmm9, xmm1, xmm0
0x10071f21a: vpminsd xmm0, xmm12, xmm6
0x10071f21f: vpmaxsd xmm1, xmm12, xmm6
0x10071f224: vpsubd xmm2, xmm5, xmm12
0x10071f229: vmovdqa xmmword ptr [rbp - 0x1b0], xmm2
0x10071f231: vpminsd xmm0, xmm0, xmm5
0x10071f236: vpmaxsd xmm1, xmm1, xmm5
0x10071f23b: vpminsd xmm2, xmm7, xmm10
0x10071f240: vpmaxsd xmm5, xmm7, xmm10
0x10071f245: vpsubd xmm3, xmm10, xmm4
0x10071f249: vmovdqa xmmword ptr [rbp - 0x1a0], xmm3
0x10071f251: vpminsd xmm2, xmm2, xmm4
0x10071f256: vpmaxsd xmm4, xmm5, xmm4
0x10071f25b: vpmaxsd xmm0, xmm0, xmm11
0x10071f260: vmovdqa xmm3, xmmword ptr [rip + 0x3ba608] ; 0x100ad9870
0x10071f268: vpand xmm6, xmm0, xmm3
0x10071f26c: vpcmpeqd xmm5, xmm5, xmm5
0x10071f270: vpsubd xmm0, xmm1, xmm5
0x10071f274: vpminsd xmm1, xmm0, xmmword ptr [rbp - 0x120]
0x10071f27d: vpmaxsd xmm0, xmm2, xmm11
0x10071f282: vpand xmm2, xmm0, xmm3
0x10071f286: vpsubd xmm0, xmm4, xmm5
0x10071f28a: vpminsd xmm3, xmm0, xmmword ptr [rbp - 0x110]
0x10071f293: vmovdqa xmmword ptr [rbp - 0x190], xmm6
0x10071f29b: vmovdqa xmmword ptr [rbp - 0x180], xmm1
0x10071f2a3: vpcmpgtd xmm0, xmm1, xmm6
0x10071f2a7: vmovdqa xmmword ptr [rbp - 0x170], xmm2
0x10071f2af: vmovdqa xmmword ptr [rbp - 0x160], xmm3
0x10071f2b7: vpcmpgtd xmm1, xmm3, xmm2
0x10071f2bb: vpand xmm0, xmm0, xmm1
0x10071f2bf: vmovdqa xmmword ptr [rbp - 0x260], xmm0
0x10071f2c7: vmovaps xmmword ptr [rbp - 0x1d0], xmm8
0x10071f2cf: vmovaps xmmword ptr [rbp - 0xb0], xmm8
0x10071f2d7: vmovaps xmmword ptr [rbp - 0x1c0], xmm9
0x10071f2df: vmovaps xmmword ptr [rbp - 0xa0], xmm9
0x10071f2e7: mov eax, 0xaaaaaaab
0x10071f2ec: imul rdx, rax
0x10071f2f0: shr rdx, 0x21
0x10071f2f4: mov qword ptr [rbp - 0xd8], rdx
0x10071f2fb: xor eax, eax
0x10071f2fd: nop dword ptr [rax]
0x10071f300: vmovdqa xmm0, xmmword ptr [rbp - 0x260]
0x10071f308: vmovdqa xmmword ptr [rbp - 0x3e0], xmm0
0x10071f310: mov esi, eax
0x10071f312: and esi, 3
0x10071f315: test byte ptr [rbp + rsi*4 - 0x3e0], 1
0x10071f31d: je 0x10071f740
0x10071f323: vmovaps xmm0, xmmword ptr [rbp - 0x250]
0x10071f32b: vmovaps xmmword ptr [rbp - 0x3d0], xmm0
0x10071f333: cmp qword ptr [rbp + 0x10], 0
0x10071f338: je 0x10071f3b0
0x10071f33a: mov esi, eax
0x10071f33c: and esi, 3
0x10071f33f: mov bl, byte ptr [rbp + rsi*4 - 0x3d0]
0x10071f346: not bl
0x10071f348: test bl, 1
0x10071f34b: je 0x10071f3b0
0x10071f34d: vmovdqa xmm0, xmmword ptr [rbp - 0x240]
0x10071f355: vmovdqa xmmword ptr [rbp - 0x2b0], xmm0
0x10071f35d: mov esi, eax
0x10071f35f: and esi, 3
0x10071f362: test byte ptr [rbp + rsi*4 - 0x2b0], 1
0x10071f36a: je 0x10071f740
0x10071f370: mov rsi, qword ptr [rbp + 0x18]
0x10071f374: mov esi, dword ptr [rsi]
0x10071f376: cmp esi, dword ptr [rbp + 0x20]
0x10071f379: jae 0x10071f740
0x10071f37f: mov rdx, qword ptr [rbp - 0xd8]
0x10071f386: lea ebx, [rax + rdx]
0x10071f389: mov rdx, qword ptr [rbp + 0x10]
0x10071f38d: mov dword ptr [rdx + rsi*4], ebx
0x10071f390: mov rsi, qword ptr [rbp + 0x18]
0x10071f394: inc dword ptr [rsi]
0x10071f396: inc eax
0x10071f398: cmp eax, 4
0x10071f39b: jne 0x10071f300
0x10071f3a1: jmp 0x10071f74b ; 0x10071f74b
0x10071f3a6: nop word ptr cs:[rax + rax]
0x10071f3b0: vmovdqa xmm0, xmmword ptr [rbp - 0x230]
0x10071f3b8: vpcmpgtd xmm0, xmm0, xmm11
0x10071f3bd: vmovdqa xmmword ptr [rbp - 0x3c0], xmm0
0x10071f3c5: mov esi, eax
0x10071f3c7: and esi, 3
0x10071f3ca: test byte ptr [rbp + rsi*4 - 0x3c0], 1
0x10071f3d2: je 0x10071f740
0x10071f3d8: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10071f3e0: vmovaps xmmword ptr [rbp - 0x3b0], xmm0
0x10071f3e8: mov esi, eax
0x10071f3ea: and esi, 3
0x10071f3ed: vbroadcastss xmm0, dword ptr [rbp + rsi*4 - 0x3b0]
0x10071f3f7: vmovaps xmmword ptr [rbp - 0x2a0], xmm0
0x10071f3ff: vmovaps xmm0, xmmword ptr [rbp - 0x1d0]
0x10071f407: vmovaps xmmword ptr [rbp - 0x3a0], xmm0
0x10071f40f: vbroadcastss xmm0, dword ptr [rbp + rsi*4 - 0x3a0]
0x10071f419: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x10071f421: vmovaps xmm0, xmmword ptr [rbp - 0x1c0]
0x10071f429: vmovaps xmmword ptr [rbp - 0x390], xmm0
0x10071f431: vbroadcastss xmm0, dword ptr [rbp + rsi*4 - 0x390]
0x10071f43b: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10071f443: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x10071f44b: vmovaps xmmword ptr [rbp - 0x380], xmm0
0x10071f453: mov ebx, dword ptr [rbp + rsi*4 - 0x380]
0x10071f45a: vmovaps xmm0, xmmword ptr [rbp - 0x180]
0x10071f462: vmovaps xmmword ptr [rbp - 0x370], xmm0
0x10071f46a: mov r14d, dword ptr [rbp + rsi*4 - 0x370]
0x10071f472: vmovaps xmm0, xmmword ptr [rbp - 0x170]
0x10071f47a: vmovaps xmmword ptr [rbp - 0x360], xmm0
0x10071f482: mov r9d, dword ptr [rbp + rsi*4 - 0x360]
0x10071f48a: vmovaps xmm0, xmmword ptr [rbp - 0x160]
0x10071f492: vmovaps xmmword ptr [rbp - 0x350], xmm0
0x10071f49a: mov r10d, dword ptr [rbp + rsi*4 - 0x350]
0x10071f4a2: vmovaps xmm0, xmmword ptr [rbp - 0x1a0]
0x10071f4aa: vmovaps xmmword ptr [rbp - 0x340], xmm0
0x10071f4b2: vmovd xmm8, dword ptr [rbp + rsi*4 - 0x340]
0x10071f4bb: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10071f4c3: vmovaps xmmword ptr [rbp - 0x330], xmm0
0x10071f4cb: vmovd xmm1, dword ptr [rbp + rsi*4 - 0x330]
0x10071f4d4: vmovaps xmm0, xmmword ptr [rbp - 0x200]
0x10071f4dc: vmovaps xmmword ptr [rbp - 0x320], xmm0
0x10071f4e4: vmovd xmm5, dword ptr [rbp + rsi*4 - 0x320]
0x10071f4ed: vmovaps xmm0, xmmword ptr [rbp - 0x1b0]
0x10071f4f5: vmovaps xmmword ptr [rbp - 0x310], xmm0
0x10071f4fd: vmovd xmm9, dword ptr [rbp + rsi*4 - 0x310]
0x10071f506: vmovaps xmm0, xmmword ptr [rbp - 0x1f0]
0x10071f50e: vmovaps xmmword ptr [rbp - 0x300], xmm0
0x10071f516: vmovd xmm6, dword ptr [rbp + rsi*4 - 0x300]
0x10071f51f: vmovdqa xmm0, xmmword ptr [rbp - 0x1e0]
0x10071f527: vmovdqa xmmword ptr [rbp - 0x2f0], xmm0
0x10071f52f: cmp r9d, r10d
0x10071f532: jge 0x10071f740
0x10071f538: cmp ebx, r14d
0x10071f53b: jge 0x10071f740
0x10071f541: vpshufd xmm4, xmm1, 0
0x10071f546: vpshufd xmm2, xmm5, 0
0x10071f54b: vpshufd xmm3, xmm6, 0
0x10071f550: vmovd xmm1, dword ptr [rbp + rsi*4 - 0x2f0]
0x10071f559: vpshufd xmm1, xmm1, 0
0x10071f55e: vpaddd xmm10, xmm4, xmm4
0x10071f562: vpaddd xmm12, xmm2, xmm2
0x10071f566: vmovd xmm6, ebx
0x10071f56a: vpshufd xmm6, xmm6, 0
0x10071f56f: vpaddd xmm7, xmm6, xmmword ptr [rip + 0x3ba309] ; 0x100ad9880 -> 0x100000000 __mh_execute_header
0x10071f577: vmovd xmm6, r9d
0x10071f57c: vpshufd xmm6, xmm6, 0
0x10071f581: vpaddd xmm0, xmm6, xmmword ptr [rip + 0x3ba307] ; 0x100ad9890
0x10071f589: vcvtdq2ps xmm6, xmm10
0x10071f58e: vmulps xmm6, xmm6, xmmword ptr [rbp - 0x100]
0x10071f596: vcvtdq2ps xmm5, xmm12
0x10071f59b: vmulps xmm5, xmm5, xmmword ptr [rbp - 0xf0]
0x10071f5a3: vaddps xmm13, xmm6, xmm5
0x10071f5a7: vpmulld xmm5, xmm0, xmm1
0x10071f5ac: vmovaps xmm6, xmmword ptr [rbp - 0x130]
0x10071f5b4: vmovaps xmmword ptr [rbp - 0x2e0], xmm6
0x10071f5bc: mov esi, eax
0x10071f5be: and esi, 3
0x10071f5c1: vmovd xmm6, dword ptr [rbp + rsi*4 - 0x2e0]
0x10071f5ca: vpshufd xmm6, xmm6, 0
0x10071f5cf: vpaddd xmm5, xmm5, xmm6
0x10071f5d3: vpmulld xmm2, xmm7, xmm2
0x10071f5d8: vpaddd xmm15, xmm5, xmm2
0x10071f5dc: vpmulld xmm2, xmm0, xmm3
0x10071f5e1: vmovaps xmm5, xmmword ptr [rbp - 0x140]
0x10071f5e9: vmovaps xmmword ptr [rbp - 0x2d0], xmm5
0x10071f5f1: vmovd xmm5, dword ptr [rbp + rsi*4 - 0x2d0]
0x10071f5fa: vpshufd xmm5, xmm5, 0
0x10071f5ff: vpaddd xmm2, xmm2, xmm5
0x10071f603: vpshufd xmm5, xmm9, 0
0x10071f609: vpmulld xmm4, xmm7, xmm4
0x10071f60e: vpaddd xmm6, xmm2, xmm4
0x10071f612: vpmulld xmm0, xmm0, xmm5
0x10071f617: vmovaps xmm2, xmmword ptr [rbp - 0x150]
0x10071f61f: vmovaps xmmword ptr [rbp - 0x2c0], xmm2
0x10071f627: vmovd xmm2, dword ptr [rbp + rsi*4 - 0x2c0]
0x10071f630: vpshufd xmm2, xmm2, 0
0x10071f635: vpaddd xmm0, xmm0, xmm2
0x10071f639: vpshufd xmm2, xmm8, 0
0x10071f63f: vpmulld xmm4, xmm7, xmm2
0x10071f644: vpaddd xmm8, xmm0, xmm4
0x10071f648: vpaddd xmm14, xmm2, xmm2
0x10071f64c: vpaddd xmm0, xmm5, xmm5
0x10071f650: vmovdqa xmmword ptr [rbp - 0x290], xmm0
0x10071f658: vpaddd xmm0, xmm3, xmm3
0x10071f65c: vmovdqa xmmword ptr [rbp - 0x280], xmm0
0x10071f664: vpaddd xmm0, xmm1, xmm1
0x10071f668: vmovdqa xmmword ptr [rbp - 0x270], xmm0
0x10071f670: mov esi, r9d
0x10071f673: imul esi, dword ptr [rbp - 0xd0]
0x10071f67a: lea r11d, [rsi + rbx*2]
0x10071f67e: nop 
0x10071f680: movsxd rsi, r11d
0x10071f683: lea rsi, [rdi + rsi*4]
0x10071f687: vcvtdq2ps xmm0, xmm6
0x10071f68b: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x100]
0x10071f693: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x2a0]
0x10071f69b: vcvtdq2ps xmm1, xmm15
0x10071f6a0: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xf0]
0x10071f6a8: vaddps xmm1, xmm0, xmm1
0x10071f6ac: mov r15d, ebx
0x10071f6af: vmovdqa xmm7, xmm15
0x10071f6b3: vmovdqa xmm0, xmm6
0x10071f6b7: vmovdqa xmm2, xmm8
0x10071f6bb: nop dword ptr [rax + rax]
0x10071f6c0: vpor xmm4, xmm0, xmm2
0x10071f6c4: vpor xmm4, xmm4, xmm7
0x10071f6c8: vpcmpgtd xmm4, xmm4, xmm11
0x10071f6cd: vmovups xmm5, xmmword ptr [rsi]
0x10071f6d1: vminps xmm3, xmm1, xmm5
0x10071f6d5: vblendvps xmm9, xmm5, xmm3, xmm4
0x10071f6db: test sil, 0xf
0x10071f6df: je 0x10071f6f0
0x10071f6e1: vmovups xmmword ptr [rsi], xmm9
0x10071f6e5: jmp 0x10071f6f4 ; 0x10071f6f4
0x10071f6e7: nop word ptr [rax + rax]
0x10071f6f0: vmovaps xmmword ptr [rsi], xmm9
0x10071f6f4: vpaddd xmm2, xmm2, xmm14
0x10071f6f9: vpaddd xmm0, xmm0, xmm10
0x10071f6fe: vpaddd xmm7, xmm7, xmm12
0x10071f703: vaddps xmm1, xmm13, xmm1
0x10071f707: add r15d, 2
0x10071f70b: add rsi, 0x10
0x10071f70f: cmp r15d, r14d
0x10071f712: jl 0x10071f6c0
0x10071f714: add r11d, r12d
0x10071f717: vpaddd xmm8, xmm8, xmmword ptr [rbp - 0x290]
0x10071f71f: vpaddd xmm6, xmm6, xmmword ptr [rbp - 0x280]
0x10071f727: vpaddd xmm15, xmm15, xmmword ptr [rbp - 0x270]
0x10071f72f: add r9d, 2
0x10071f733: cmp r9d, r10d
0x10071f736: jl 0x10071f680
0x10071f73c: nop dword ptr [rax]
0x10071f740: inc eax
0x10071f742: cmp eax, 4
0x10071f745: jne 0x10071f300
0x10071f74b: add r13d, 0xc
0x10071f74f: cmp r13d, dword ptr [rbp - 0xc4]
0x10071f756: jb 0x10071eef0
0x10071f75c: mov rax, qword ptr [rip + 0x4ee175] ; 0x100c0d8d8
0x10071f763: mov rax, qword ptr [rax]
0x10071f766: cmp rax, qword ptr [rbp - 0x30]
0x10071f76a: jne 0x10071f77e
0x10071f76c: add rsp, 0x3b8
0x10071f773: pop rbx
0x10071f774: pop r12
0x10071f776: pop r13
0x10071f778: pop r14
0x10071f77a: pop r15
0x10071f77c: pop rbp
0x10071f77d: ret 
0x10071f77e: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10071f783: nop word ptr cs:[rax + rax]
