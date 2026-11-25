0x10027edc0: push rbp
0x10027edc1: mov rbp, rsp
0x10027edc4: push r15
0x10027edc6: push r14
0x10027edc8: push r13
0x10027edca: push r12
0x10027edcc: push rbx
0x10027edcd: sub rsp, 0x1118
0x10027edd4: mov r15, r9
0x10027edd7: mov r12, r8
0x10027edda: mov r13, rcx
0x10027eddd: mov rbx, rdx
0x10027ede0: mov r14, rsi
0x10027ede3: mov qword ptr [rbp - 0x10c0], rdi
0x10027edea: mov rax, qword ptr [rip + 0x98eae7] ; 0x100c0d8d8
0x10027edf1: mov rax, qword ptr [rax]
0x10027edf4: mov qword ptr [rbp - 0x30], rax
0x10027edf8: mov rdi, r14
0x10027edfb: call 0x1000fc260 ; 0x1000fc260
0x10027ee00: test rax, rax
0x10027ee03: je 0x10027f63b
0x10027ee09: mov qword ptr [rbp - 0x10d8], rax
0x10027ee10: mov rdi, qword ptr [rbp + 0x50]
0x10027ee14: call 0x100410ca0 ; 0x100410ca0
0x10027ee19: mov qword ptr [rbp - 0x10e0], rax
0x10027ee20: vmovss xmm0, dword ptr [rip + 0xa20538] ; 0x100c9f360
0x10027ee28: vsubss xmm1, xmm0, dword ptr [rip + 0xa20808] ; 0x100c9f638
0x10027ee30: vandps xmm1, xmm1, xmmword ptr [rip + 0x828ad8] ; 0x100aa7910
0x10027ee38: vmovss xmm2, dword ptr [rip + 0x828a84] ; 0x100aa78c4
0x10027ee40: vucomiss xmm2, xmm1
0x10027ee44: jae 0x10027ee58
0x10027ee46: vmovss dword ptr [rip + 0xa207ea], xmm0 ; 0x100c9f638
0x10027ee4e: mov al, 1
0x10027ee50: mov dword ptr [rbp - 0x10c4], eax
0x10027ee56: jmp 0x10027ee62 ; 0x10027ee62
0x10027ee58: mov dword ptr [rbp - 0x10c4], 0
0x10027ee62: vmovss xmm0, dword ptr [rbx + 0x14]
0x10027ee67: vmovss dword ptr [rbp - 0x10b4], xmm0
0x10027ee6f: vmovss xmm0, dword ptr [rbx + 0x20]
0x10027ee74: vmovss dword ptr [rbp - 0x10d0], xmm0
0x10027ee7c: lea rax, [rip + 0x1d7c24d] ; 0x101ffb0d0
0x10027ee83: cmp byte ptr [rax], 0
0x10027ee86: je 0x10027ee95
0x10027ee88: lea rax, [rip + 0xa396b1] ; 0x100cb8540
0x10027ee8f: vmovss xmm0, dword ptr [rax]
0x10027ee93: jmp 0x10027ee9d ; 0x10027ee9d
0x10027ee95: vmovss xmm0, dword ptr [rip + 0x826223] ; 0x100aa50c0
0x10027ee9d: vmovss dword ptr [rbp - 0x10b8], xmm0
0x10027eea5: vmovss xmm0, dword ptr [rbx + 0x24]
0x10027eeaa: vmovss dword ptr [rbp - 0x10c8], xmm0
0x10027eeb2: lea rsi, [rbp - 0xb0]
0x10027eeb9: mov edx, 1
0x10027eebe: mov rdi, r14
0x10027eec1: call 0x1001032a0 ; 0x1001032a0
0x10027eec6: mov ebx, eax
0x10027eec8: lea rdi, [rbp - 0x10b0]
0x10027eecf: mov esi, 0x1000
0x10027eed4: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10027eed9: mov r9, qword ptr [rbp - 0x10c0]
0x10027eee0: mov eax, dword ptr [r9 + 0x1b220]
0x10027eee7: test eax, eax
0x10027eee9: je 0x10027f2cc
0x10027eeef: vmovss xmm0, dword ptr [rbp - 0x10b8]
0x10027eef7: vmulss xmm0, xmm0, dword ptr [rbp - 0x10d0]
0x10027eeff: vmulss xmm0, xmm0, dword ptr [rbp - 0x10b4]
0x10027ef07: vmovss xmm1, dword ptr [rip + 0x827b8d] ; 0x100aa6a9c
0x10027ef0f: vmaxss xmm0, xmm1, xmm0
0x10027ef13: vmovss xmm1, dword ptr [rip + 0x827b85] ; 0x100aa6aa0
0x10027ef1b: vminss xmm1, xmm1, xmm0
0x10027ef1f: test ebx, ebx
0x10027ef21: vmovss dword ptr [rbp - 0x10b4], xmm1
0x10027ef29: je 0x10027f191
0x10027ef2f: mov qword ptr [rbp - 0x10e8], r13
0x10027ef36: mov qword ptr [rbp - 0x10f0], r12
0x10027ef3d: mov qword ptr [rbp - 0x10f8], r15
0x10027ef44: mov qword ptr [rbp - 0x10d0], rbx
0x10027ef4b: mov ebx, ebx
0x10027ef4d: mov dword ptr [rbp - 0x10b8], 0
0x10027ef57: xor r15d, r15d
0x10027ef5a: nop word ptr [rax + rax]
0x10027ef60: mov r15d, r15d
0x10027ef63: imul r12, r15, 0x1a0
0x10027ef6a: lea r13, [r9 + r12 + 0x1220]
0x10027ef72: mov ecx, dword ptr [r9 + r12 + 0x1240]
0x10027ef7a: mov edx, dword ptr [r9 + r12 + 0x1300]
0x10027ef82: imul rsi, rdx, 0x1a0
0x10027ef89: cmp eax, edx
0x10027ef8b: lea r14, [r9 + rsi + 0x1220]
0x10027ef93: mov eax, 0
0x10027ef98: cmovbe r14, rax
0x10027ef9c: mov rax, qword ptr [rbp - 0x10e0]
0x10027efa3: vmovss xmm0, dword ptr [rax + rcx*4 + 0x930]
0x10027efac: mov rdi, r13
0x10027efaf: mov rsi, r14
0x10027efb2: call 0x10027e530 ; 0x10027e530
0x10027efb7: mov r9, qword ptr [rbp - 0x10c0]
0x10027efbe: mov rax, qword ptr [r9 + r12 + 0x1230]
0x10027efc6: test rax, rax
0x10027efc9: je 0x10027efd1
0x10027efcb: cmp byte ptr [rax + 0x38], 0
0x10027efcf: je 0x10027efe5
0x10027efd1: vmovss xmm0, dword ptr [rip + 0x8260e7] ; 0x100aa50c0
0x10027efd9: vucomiss xmm0, dword ptr [r9 + r12 + 0x13b0]
0x10027efe3: jbe 0x10027f000
0x10027efe5: vmovss xmm1, dword ptr [rbp - 0x10b4]
0x10027efed: mov r10, qword ptr [rbp + 0x58]
0x10027eff1: mov r11, qword ptr [rbp + 0x40]
0x10027eff5: jmp 0x10027f0a3 ; 0x10027f0a3
0x10027effa: nop word ptr [rax + rax]
0x10027f000: mov rax, qword ptr [r13]
0x10027f004: lea rdi, [rbp - 0x1140]
0x10027f00b: mov rsi, r13
0x10027f00e: call qword ptr [rax + 0x28]
0x10027f011: mov r9, qword ptr [rbp - 0x10c0]
0x10027f018: vmovaps xmm0, xmmword ptr [rbp - 0x1110]
0x10027f020: xor eax, eax
0x10027f022: mov r10, qword ptr [rbp + 0x58]
0x10027f026: mov r11, qword ptr [rbp + 0x40]
0x10027f02a: vmovd xmm3, dword ptr [rip + 0x82b46e] ; 0x100aaa4a0
0x10027f032: nop word ptr cs:[rax + rax]
0x10027f040: mov rcx, qword ptr [rbp + rax*8 - 0xb0]
0x10027f048: mov rcx, qword ptr [rcx + 0x18]
0x10027f04c: vsubps xmm1, xmm0, xmmword ptr [rcx + 0x10]
0x10027f051: vmulps xmm1, xmm1, xmm1
0x10027f055: vmovshdup xmm2, xmm1
0x10027f059: vaddss xmm2, xmm1, xmm2
0x10027f05d: vpermilpd xmm1, xmm1, 1
0x10027f063: vaddss xmm1, xmm1, xmm2
0x10027f067: vucomiss xmm3, xmm1
0x10027f06b: ja 0x10027f077
0x10027f06d: inc rax
0x10027f070: cmp rax, rbx
0x10027f073: jb 0x10027f040
0x10027f075: jmp 0x10027f09b ; 0x10027f09b
0x10027f077: mov ecx, dword ptr [rbp - 0x10b8]
0x10027f07d: mov eax, ecx
0x10027f07f: inc ecx
0x10027f081: mov dword ptr [rbp - 0x10b8], ecx
0x10027f087: shl rax, 4
0x10027f08b: mov qword ptr [rbp + rax - 0x10b0], r13
0x10027f093: mov qword ptr [rbp + rax - 0x10a8], r14
0x10027f09b: vmovss xmm1, dword ptr [rbp - 0x10b4]
0x10027f0a3: inc r15d
0x10027f0a6: mov eax, dword ptr [r9 + 0x1b220]
0x10027f0ad: cmp r15d, eax
0x10027f0b0: jb 0x10027ef60
0x10027f0b6: mov eax, dword ptr [rbp - 0x10b8]
0x10027f0bc: test eax, eax
0x10027f0be: mov r15, qword ptr [rbp - 0x10f8]
0x10027f0c5: mov r12, qword ptr [rbp - 0x10f0]
0x10027f0cc: mov r13, qword ptr [rbp - 0x10e8]
0x10027f0d3: je 0x10027f2cc
0x10027f0d9: mov r14d, eax
0x10027f0dc: cmp byte ptr [rbp - 0x10c4], 0
0x10027f0e3: je 0x10027f24e
0x10027f0e9: lea rbx, [rbp - 0x10a8]
0x10027f0f0: mov rdi, qword ptr [rbx - 8]
0x10027f0f4: vmovss xmm0, dword ptr [rip + 0x835fb4] ; 0x100ab50b0
0x10027f0fc: vmaxss xmm0, xmm0, dword ptr [rip + 0xa2025c] ; 0x100c9f360
0x10027f104: vmovss xmm1, dword ptr [rip + 0x825fb4] ; 0x100aa50c0
0x10027f10c: vminss xmm0, xmm1, xmm0
0x10027f110: vmovss dword ptr [rdi + 0xd0], xmm0
0x10027f118: vmovss dword ptr [rdi + 0xd4], xmm0
0x10027f120: mov rsi, r13
0x10027f123: mov rdx, r12
0x10027f126: mov rcx, r15
0x10027f129: mov r8, qword ptr [rbp + 0x10]
0x10027f12d: vmovss xmm0, dword ptr [rbp - 0x10c8]
0x10027f135: vmovss xmm1, dword ptr [rbp - 0x10b4]
0x10027f13d: push qword ptr [rbp - 0x10d0]
0x10027f143: lea rax, [rbp - 0xb0]
0x10027f14a: push rax
0x10027f14b: push qword ptr [rbp - 0x10d8]
0x10027f151: push qword ptr [rbx]
0x10027f153: push r10
0x10027f155: push r11
0x10027f157: push qword ptr [rbp + 0x38]
0x10027f15a: push qword ptr [rbp + 0x30]
0x10027f15d: push qword ptr [rbp + 0x28]
0x10027f160: mov rax, qword ptr [rbp + 0x20]
0x10027f164: push qword ptr [rax + 0x10]
0x10027f167: call 0x10027b7f0 ; 0x10027b7f0
0x10027f16c: mov r11, qword ptr [rbp + 0x40]
0x10027f170: mov r10, qword ptr [rbp + 0x58]
0x10027f174: mov r9, qword ptr [rbp - 0x10c0]
0x10027f17b: add rsp, 0x50
0x10027f17f: add rbx, 0x10
0x10027f183: dec r14
0x10027f186: jne 0x10027f0f0
0x10027f18c: jmp 0x10027f2cc ; 0x10027f2cc
0x10027f191: xor r15d, r15d
0x10027f194: lea r12, [rbp - 0x1140]
0x10027f19b: xor ebx, ebx
0x10027f19d: nop dword ptr [rax]
0x10027f1a0: mov ebx, ebx
0x10027f1a2: imul r14, rbx, 0x1a0
0x10027f1a9: lea r13, [r9 + r14 + 0x1220]
0x10027f1b1: mov ecx, dword ptr [r9 + r14 + 0x1240]
0x10027f1b9: mov edx, dword ptr [r9 + r14 + 0x1300]
0x10027f1c1: imul rsi, rdx, 0x1a0
0x10027f1c8: cmp eax, edx
0x10027f1ca: lea rsi, [r9 + rsi + 0x1220]
0x10027f1d2: cmovbe rsi, r15
0x10027f1d6: mov rax, qword ptr [rbp - 0x10e0]
0x10027f1dd: vmovss xmm0, dword ptr [rax + rcx*4 + 0x930]
0x10027f1e6: mov rdi, r13
0x10027f1e9: call 0x10027e530 ; 0x10027e530
0x10027f1ee: mov r9, qword ptr [rbp - 0x10c0]
0x10027f1f5: mov rax, qword ptr [r9 + r14 + 0x1230]
0x10027f1fd: test rax, rax
0x10027f200: je 0x10027f208
0x10027f202: cmp byte ptr [rax + 0x38], 0
0x10027f206: je 0x10027f230
0x10027f208: vmovss xmm0, dword ptr [rip + 0x825eb0] ; 0x100aa50c0
0x10027f210: vucomiss xmm0, dword ptr [r9 + r14 + 0x13b0]
0x10027f21a: ja 0x10027f230
0x10027f21c: mov rax, qword ptr [r13]
0x10027f220: mov rdi, r12
0x10027f223: mov rsi, r13
0x10027f226: call qword ptr [rax + 0x28]
0x10027f229: mov r9, qword ptr [rbp - 0x10c0]
0x10027f230: inc ebx
0x10027f232: mov eax, dword ptr [r9 + 0x1b220]
0x10027f239: cmp ebx, eax
0x10027f23b: vmovss xmm1, dword ptr [rbp - 0x10b4]
0x10027f243: jb 0x10027f1a0
0x10027f249: jmp 0x10027f2cc ; 0x10027f2cc
0x10027f24e: lea rbx, [rbp - 0x10a8]
0x10027f255: nop word ptr cs:[rax + rax]
0x10027f260: mov rdi, qword ptr [rbx - 8]
0x10027f264: mov rsi, r13
0x10027f267: mov rdx, r12
0x10027f26a: mov rcx, r15
0x10027f26d: mov r8, qword ptr [rbp + 0x10]
0x10027f271: vmovss xmm0, dword ptr [rbp - 0x10c8]
0x10027f279: vmovss xmm1, dword ptr [rbp - 0x10b4]
0x10027f281: push qword ptr [rbp - 0x10d0]
0x10027f287: lea rax, [rbp - 0xb0]
0x10027f28e: push rax
0x10027f28f: push qword ptr [rbp - 0x10d8]
0x10027f295: push qword ptr [rbx]
0x10027f297: push r10
0x10027f299: push r11
0x10027f29b: push qword ptr [rbp + 0x38]
0x10027f29e: push qword ptr [rbp + 0x30]
0x10027f2a1: push qword ptr [rbp + 0x28]
0x10027f2a4: mov rax, qword ptr [rbp + 0x20]
0x10027f2a8: push qword ptr [rax + 0x10]
0x10027f2ab: call 0x10027b7f0 ; 0x10027b7f0
0x10027f2b0: mov r11, qword ptr [rbp + 0x40]
0x10027f2b4: mov r10, qword ptr [rbp + 0x58]
0x10027f2b8: mov r9, qword ptr [rbp - 0x10c0]
0x10027f2bf: add rsp, 0x50
0x10027f2c3: add rbx, 0x10
0x10027f2c7: dec r14
0x10027f2ca: jne 0x10027f260
0x10027f2cc: mov r14, qword ptr [rbp + 0x48]
0x10027f2d0: cmp dword ptr [r9 + 0x1210], 0
0x10027f2d8: je 0x10027f53e
0x10027f2de: xor ebx, ebx
0x10027f2e0: vmovss xmm8, dword ptr [rip + 0x82f598] ; 0x100aae880
0x10027f2e8: vmovaps xmm9, xmmword ptr [rip + 0x835df0] ; 0x100ab50e0
0x10027f2f0: mov ebx, ebx
0x10027f2f2: lea r15, [rbx + rbx*8]
0x10027f2f6: mov rcx, qword ptr [r9 + r15*8 + 0x50]
0x10027f2fb: test rcx, rcx
0x10027f2fe: je 0x10027f4d0
0x10027f304: mov rax, qword ptr [r9 + r15*8 + 0x18]
0x10027f309: mov eax, dword ptr [rax + 0x10]
0x10027f30c: test rax, rax
0x10027f30f: je 0x10027f320
0x10027f311: cmp eax, 0x10
0x10027f314: jae 0x10027f334
0x10027f316: xor esi, esi
0x10027f318: xor edx, edx
0x10027f31a: jmp 0x10027f450 ; 0x10027f450
0x10027f31f: nop 
0x10027f320: xor edx, edx
0x10027f322: lea r12, [r9 + r15*8 + 0x4a]
0x10027f327: cmp edx, eax
0x10027f329: je 0x10027f491
0x10027f32f: jmp 0x10027f4f0 ; 0x10027f4f0
0x10027f334: mov r8d, eax
0x10027f337: and r8d, 0xf
0x10027f33b: mov rsi, rax
0x10027f33e: sub rsi, r8
0x10027f341: lea rdi, [rcx + 0x1930]
0x10027f348: vxorps xmm0, xmm0, xmm0
0x10027f34c: mov rdx, rsi
0x10027f34f: vxorps xmm1, xmm1, xmm1
0x10027f353: vxorps xmm2, xmm2, xmm2
0x10027f357: vpxor xmm3, xmm3, xmm3
0x10027f35b: nop dword ptr [rax + rax]
0x10027f360: vmovss xmm4, dword ptr [rdi - 0x1860]
0x10027f368: vinsertps xmm4, xmm4, dword ptr [rdi - 0x16c0], 0x10
0x10027f372: vinsertps xmm4, xmm4, dword ptr [rdi - 0x1520], 0x20
0x10027f37c: vinsertps xmm4, xmm4, dword ptr [rdi - 0x1380], 0x30
0x10027f386: vmovss xmm5, dword ptr [rdi - 0x11e0]
0x10027f38e: vinsertps xmm5, xmm5, dword ptr [rdi - 0x1040], 0x10
0x10027f398: vinsertps xmm5, xmm5, dword ptr [rdi - 0xea0], 0x20
0x10027f3a2: vinsertps xmm5, xmm5, dword ptr [rdi - 0xd00], 0x30
0x10027f3ac: vmovss xmm6, dword ptr [rdi - 0xb60]
0x10027f3b4: vinsertps xmm6, xmm6, dword ptr [rdi - 0x9c0], 0x10
0x10027f3be: vinsertps xmm6, xmm6, dword ptr [rdi - 0x820], 0x20
0x10027f3c8: vinsertps xmm6, xmm6, dword ptr [rdi - 0x680], 0x30
0x10027f3d2: vmovss xmm7, dword ptr [rdi - 0x4e0]
0x10027f3da: vinsertps xmm7, xmm7, dword ptr [rdi - 0x340], 0x10
0x10027f3e4: vinsertps xmm7, xmm7, dword ptr [rdi - 0x1a0], 0x20
0x10027f3ee: vinsertps xmm7, xmm7, dword ptr [rdi], 0x30
0x10027f3f4: vcmpleps xmm4, xmm4, xmm9
0x10027f3fa: vpsubd xmm0, xmm0, xmm4
0x10027f3fe: vcmpleps xmm4, xmm5, xmm9
0x10027f404: vpsubd xmm1, xmm1, xmm4
0x10027f408: vcmpleps xmm4, xmm6, xmm9
0x10027f40e: vpsubd xmm2, xmm2, xmm4
0x10027f412: vcmpleps xmm4, xmm7, xmm9
0x10027f418: vpsubd xmm3, xmm3, xmm4
0x10027f41c: add rdi, 0x1a00
0x10027f423: add rdx, -0x10
0x10027f427: jne 0x10027f360
0x10027f42d: vpaddd xmm0, xmm1, xmm0
0x10027f431: vpaddd xmm0, xmm2, xmm0
0x10027f435: vpaddd xmm0, xmm3, xmm0
0x10027f439: vpshufd xmm1, xmm0, 0x4e
0x10027f43e: vpaddd xmm0, xmm0, xmm1
0x10027f442: vphaddd xmm0, xmm0, xmm0
0x10027f447: vmovd edx, xmm0
0x10027f44b: test r8d, r8d
0x10027f44e: je 0x10027f488
0x10027f450: mov rdi, rax
0x10027f453: sub rdi, rsi
0x10027f456: imul rsi, rsi, 0x1a0
0x10027f45d: lea rcx, [rcx + rsi + 0xd0]
0x10027f465: nop word ptr cs:[rax + rax]
0x10027f470: xor esi, esi
0x10027f472: vucomiss xmm8, dword ptr [rcx]
0x10027f476: setae sil
0x10027f47a: add edx, esi
0x10027f47c: add rcx, 0x1a0
0x10027f483: dec rdi
0x10027f486: jne 0x10027f470
0x10027f488: lea r12, [r9 + r15*8 + 0x4a]
0x10027f48d: cmp edx, eax
0x10027f48f: jne 0x10027f4f0
0x10027f491: cmp byte ptr [r12], 0
0x10027f496: jne 0x10027f4c8
0x10027f498: mov rdi, qword ptr [r9 + r15*8 + 0x20]
0x10027f49d: test rdi, rdi
0x10027f4a0: je 0x10027f4c8
0x10027f4a2: mov esi, 1
0x10027f4a7: call 0x1004d1f60 ; 0x1004d1f60
0x10027f4ac: vmovaps xmm9, xmmword ptr [rip + 0x835c2c] ; 0x100ab50e0
0x10027f4b4: vmovss xmm8, dword ptr [rip + 0x82f3c4] ; 0x100aae880
0x10027f4bc: mov r9, qword ptr [rbp - 0x10c0]
0x10027f4c3: mov byte ptr [r12], 1
0x10027f4c8: cmp byte ptr [r9 + r15*8 + 0x49], 0
0x10027f4ce: je 0x10027f4fe
0x10027f4d0: inc ebx
0x10027f4d2: cmp ebx, dword ptr [r9 + 0x1210]
0x10027f4d9: jb 0x10027f2f0
0x10027f4df: jmp 0x10027f53e ; 0x10027f53e
0x10027f4e1: nop word ptr cs:[rax + rax]
0x10027f4f0: mov byte ptr [r12], 0
0x10027f4f5: lea r12, [r9 + r15*8 + 0x49]
0x10027f4fa: xor eax, eax
0x10027f4fc: jmp 0x10027f52b ; 0x10027f52b
0x10027f4fe: lea r12, [r9 + r15*8 + 0x49]
0x10027f503: mov rdi, qword ptr [r9 + r15*8 + 0x28]
0x10027f508: mov esi, 1
0x10027f50d: call 0x1004d1f60 ; 0x1004d1f60
0x10027f512: vmovaps xmm9, xmmword ptr [rip + 0x835bc6] ; 0x100ab50e0
0x10027f51a: vmovss xmm8, dword ptr [rip + 0x82f35e] ; 0x100aae880
0x10027f522: mov r9, qword ptr [rbp - 0x10c0]
0x10027f529: mov al, 1
0x10027f52b: mov byte ptr [r12], al
0x10027f52f: inc ebx
0x10027f531: cmp ebx, dword ptr [r9 + 0x1210]
0x10027f538: jb 0x10027f2f0
0x10027f53e: mov rdi, qword ptr [r14 + 0x40]
0x10027f542: call 0x1004a0a20 ; 0x1004a0a20
0x10027f547: test al, al
0x10027f549: je 0x10027f63b
0x10027f54f: mov rdi, qword ptr [rbp + 0x50]
0x10027f553: call 0x100410c90 ; 0x100410c90
0x10027f558: mov rcx, qword ptr [rbp - 0x10c0]
0x10027f55f: mov r8d, dword ptr [rcx + 0x1b220]
0x10027f566: test r8, r8
0x10027f569: je 0x10027f63b
0x10027f56f: lea rsi, [r8 - 1]
0x10027f573: mov ecx, r8d
0x10027f576: and ecx, 3
0x10027f579: cmp rsi, 3
0x10027f57d: jae 0x10027f58b
0x10027f57f: xor esi, esi
0x10027f581: test rcx, rcx
0x10027f584: jne 0x10027f5fd
0x10027f586: jmp 0x10027f63b ; 0x10027f63b
0x10027f58b: sub r8, rcx
0x10027f58e: mov rdx, qword ptr [rbp - 0x10c0]
0x10027f595: lea rdi, [rdx + 0x17d0]
0x10027f59c: xor esi, esi
0x10027f59e: nop 
0x10027f5a0: mov ebx, dword ptr [rdi - 0x590]
0x10027f5a6: mov edx, dword ptr [rdi - 0x4e0]
0x10027f5ac: mov dword ptr [rax + rbx*4 + 0x930], edx
0x10027f5b3: mov edx, dword ptr [rdi - 0x3f0]
0x10027f5b9: mov ebx, dword ptr [rdi - 0x340]
0x10027f5bf: mov dword ptr [rax + rdx*4 + 0x930], ebx
0x10027f5c6: mov edx, dword ptr [rdi - 0x250]
0x10027f5cc: mov ebx, dword ptr [rdi - 0x1a0]
0x10027f5d2: mov dword ptr [rax + rdx*4 + 0x930], ebx
0x10027f5d9: mov edx, dword ptr [rdi - 0xb0]
0x10027f5df: mov ebx, dword ptr [rdi]
0x10027f5e1: mov dword ptr [rax + rdx*4 + 0x930], ebx
0x10027f5e8: add rsi, 4
0x10027f5ec: add rdi, 0x680
0x10027f5f3: cmp r8, rsi
0x10027f5f6: jne 0x10027f5a0
0x10027f5f8: test rcx, rcx
0x10027f5fb: je 0x10027f63b
0x10027f5fd: imul rdx, rsi, 0x1a0
0x10027f604: mov rsi, qword ptr [rbp - 0x10c0]
0x10027f60b: lea rdx, [rsi + rdx + 0x12f0]
0x10027f613: neg rcx
0x10027f616: nop word ptr cs:[rax + rax]
0x10027f620: mov esi, dword ptr [rdx - 0xb0]
0x10027f626: mov edi, dword ptr [rdx]
0x10027f628: mov dword ptr [rax + rsi*4 + 0x930], edi
0x10027f62f: add rdx, 0x1a0
0x10027f636: inc rcx
0x10027f639: jne 0x10027f620
0x10027f63b: mov rax, qword ptr [rip + 0x98e296] ; 0x100c0d8d8
0x10027f642: mov rax, qword ptr [rax]
0x10027f645: cmp rax, qword ptr [rbp - 0x30]
0x10027f649: jne 0x10027f65d
0x10027f64b: add rsp, 0x1118
0x10027f652: pop rbx
0x10027f653: pop r12
0x10027f655: pop r13
0x10027f657: pop r14
0x10027f659: pop r15
0x10027f65b: pop rbp
0x10027f65c: ret 
0x10027f65d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10027f662: nop word ptr cs:[rax + rax]
