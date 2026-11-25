0x10027b120: push rbp
0x10027b121: mov rbp, rsp
0x10027b124: push rbx
0x10027b125: push rax
0x10027b126: mov rbx, rdi
0x10027b129: mov rcx, qword ptr [rbx + 0x40]
0x10027b12d: test rcx, rcx
0x10027b130: je 0x10027b301
0x10027b136: mov rax, qword ptr [rbx + 8]
0x10027b13a: mov eax, dword ptr [rax + 0x10]
0x10027b13d: test rax, rax
0x10027b140: je 0x10027b150
0x10027b142: cmp eax, 0x10
0x10027b145: jae 0x10027b15f
0x10027b147: xor esi, esi
0x10027b149: xor edx, edx
0x10027b14b: jmp 0x10027b280 ; 0x10027b280
0x10027b150: xor edx, edx
0x10027b152: cmp edx, eax
0x10027b154: je 0x10027b2bc
0x10027b15a: jmp 0x10027b2f5 ; 0x10027b2f5
0x10027b15f: mov r8d, eax
0x10027b162: and r8d, 0xf
0x10027b166: mov rsi, rax
0x10027b169: sub rsi, r8
0x10027b16c: lea rdi, [rcx + 0x1930]
0x10027b173: vpxor xmm0, xmm0, xmm0
0x10027b177: vmovaps xmm8, xmmword ptr [rip + 0x839f61] ; 0x100ab50e0
0x10027b17f: mov rdx, rsi
0x10027b182: vpxor xmm2, xmm2, xmm2
0x10027b186: vpxor xmm3, xmm3, xmm3
0x10027b18a: vpxor xmm4, xmm4, xmm4
0x10027b18e: nop 
0x10027b190: vmovss xmm5, dword ptr [rdi - 0x1860]
0x10027b198: vinsertps xmm5, xmm5, dword ptr [rdi - 0x16c0], 0x10
0x10027b1a2: vinsertps xmm5, xmm5, dword ptr [rdi - 0x1520], 0x20
0x10027b1ac: vinsertps xmm5, xmm5, dword ptr [rdi - 0x1380], 0x30
0x10027b1b6: vmovss xmm6, dword ptr [rdi - 0x11e0]
0x10027b1be: vinsertps xmm6, xmm6, dword ptr [rdi - 0x1040], 0x10
0x10027b1c8: vinsertps xmm6, xmm6, dword ptr [rdi - 0xea0], 0x20
0x10027b1d2: vinsertps xmm6, xmm6, dword ptr [rdi - 0xd00], 0x30
0x10027b1dc: vmovss xmm7, dword ptr [rdi - 0xb60]
0x10027b1e4: vinsertps xmm7, xmm7, dword ptr [rdi - 0x9c0], 0x10
0x10027b1ee: vinsertps xmm7, xmm7, dword ptr [rdi - 0x820], 0x20
0x10027b1f8: vinsertps xmm7, xmm7, dword ptr [rdi - 0x680], 0x30
0x10027b202: vmovss xmm1, dword ptr [rdi - 0x4e0]
0x10027b20a: vinsertps xmm1, xmm1, dword ptr [rdi - 0x340], 0x10
0x10027b214: vinsertps xmm1, xmm1, dword ptr [rdi - 0x1a0], 0x20
0x10027b21e: vinsertps xmm1, xmm1, dword ptr [rdi], 0x30
0x10027b224: vcmpleps xmm5, xmm5, xmm8
0x10027b22a: vpsubd xmm0, xmm0, xmm5
0x10027b22e: vcmpleps xmm5, xmm6, xmm8
0x10027b234: vpsubd xmm2, xmm2, xmm5
0x10027b238: vcmpleps xmm5, xmm7, xmm8
0x10027b23e: vpsubd xmm3, xmm3, xmm5
0x10027b242: vcmpleps xmm1, xmm1, xmm8
0x10027b248: vpsubd xmm4, xmm4, xmm1
0x10027b24c: add rdi, 0x1a00
0x10027b253: add rdx, -0x10
0x10027b257: jne 0x10027b190
0x10027b25d: vpaddd xmm0, xmm2, xmm0
0x10027b261: vpaddd xmm0, xmm3, xmm0
0x10027b265: vpaddd xmm0, xmm4, xmm0
0x10027b269: vpshufd xmm1, xmm0, 0x4e
0x10027b26e: vpaddd xmm0, xmm0, xmm1
0x10027b272: vphaddd xmm0, xmm0, xmm0
0x10027b277: vmovd edx, xmm0
0x10027b27b: test r8d, r8d
0x10027b27e: je 0x10027b2b8
0x10027b280: mov rdi, rax
0x10027b283: sub rdi, rsi
0x10027b286: imul rsi, rsi, 0x1a0
0x10027b28d: lea rcx, [rcx + rsi + 0xd0]
0x10027b295: vmovd xmm0, dword ptr [rip + 0x8335e3] ; 0x100aae880
0x10027b29d: nop dword ptr [rax]
0x10027b2a0: xor esi, esi
0x10027b2a2: vucomiss xmm0, dword ptr [rcx]
0x10027b2a6: setae sil
0x10027b2aa: add edx, esi
0x10027b2ac: add rcx, 0x1a0
0x10027b2b3: dec rdi
0x10027b2b6: jne 0x10027b2a0
0x10027b2b8: cmp edx, eax
0x10027b2ba: jne 0x10027b2f5
0x10027b2bc: cmp byte ptr [rbx + 0x3a], 0
0x10027b2c0: jne 0x10027b2d9
0x10027b2c2: mov rdi, qword ptr [rbx + 0x10]
0x10027b2c6: test rdi, rdi
0x10027b2c9: je 0x10027b2d9
0x10027b2cb: mov esi, 1
0x10027b2d0: call 0x1004d1f60 ; 0x1004d1f60
0x10027b2d5: mov byte ptr [rbx + 0x3a], 1
0x10027b2d9: cmp byte ptr [rbx + 0x39], 0
0x10027b2dd: jne 0x10027b301
0x10027b2df: mov rdi, qword ptr [rbx + 0x18]
0x10027b2e3: add rbx, 0x39
0x10027b2e7: mov esi, 1
0x10027b2ec: call 0x1004d1f60 ; 0x1004d1f60
0x10027b2f1: mov al, 1
0x10027b2f3: jmp 0x10027b2ff ; 0x10027b2ff
0x10027b2f5: mov byte ptr [rbx + 0x3a], 0
0x10027b2f9: add rbx, 0x39
0x10027b2fd: xor eax, eax
0x10027b2ff: mov byte ptr [rbx], al
0x10027b301: add rsp, 8
0x10027b305: pop rbx
0x10027b306: pop rbp
0x10027b307: ret 
0x10027b308: nop dword ptr [rax + rax]

