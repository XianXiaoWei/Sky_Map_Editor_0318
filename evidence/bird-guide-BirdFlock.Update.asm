0x10019bdc0: push rbp
0x10019bdc1: mov rbp, rsp
0x10019bdc4: push r15
0x10019bdc6: push r14
0x10019bdc8: push r13
0x10019bdca: push r12
0x10019bdcc: push rbx
0x10019bdcd: and rsp, 0xffffffffffffffe0
0x10019bdd1: sub rsp, 0x3c0
0x10019bdd8: mov r15, rsi
0x10019bddb: mov rbx, rdi
0x10019bdde: mov rax, qword ptr [rip + 0xa71af3] ; 0x100c0d8d8
0x10019bde5: mov rax, qword ptr [rax]
0x10019bde8: mov qword ptr [rsp + 0x3a0], rax
0x10019bdf0: mov rsi, qword ptr [rbx + 0x88]
0x10019bdf7: test rsi, rsi
0x10019bdfa: je 0x10019be13
0x10019bdfc: mov eax, dword ptr [rbx + 0x18]
0x10019bdff: cmp eax, dword ptr [rbx + 0x90]
0x10019be05: jbe 0x10019be50
0x10019be07: mov rdi, qword ptr [rbx + 0xa0]
0x10019be0e: call 0x100795a70 ; 0x100795a70
0x10019be13: mov rdi, qword ptr [rbx + 0xa0]
0x10019be1a: mov rdx, qword ptr [rip + 0x1c3dcbf] ; 0x101dd9ae0
0x10019be21: mov eax, dword ptr [rbx + 0x18]
0x10019be24: shl rax, 4
0x10019be28: lea rsi, [rax + rax*2]
0x10019be2c: mov ecx, 0x10
0x10019be31: call 0x100795530 ; 0x100795530
0x10019be36: mov qword ptr [rbx + 0x88], rax
0x10019be3d: mov eax, dword ptr [rbx + 0x18]
0x10019be40: mov dword ptr [rbx + 0x90], eax
0x10019be46: mov dword ptr [rbx + 0x94], 0
0x10019be50: mov rax, qword ptr [rbx + 0x10]
0x10019be54: mov rsi, qword ptr [rbx + 0x68]
0x10019be58: test rax, rax
0x10019be5b: je 0x10019be86
0x10019be5d: test rsi, rsi
0x10019be60: mov qword ptr [rsp], rbx
0x10019be64: je 0x10019beb3
0x10019be66: cmp qword ptr [rbx + 0x78], rax
0x10019be6a: je 0x10019c1d3
0x10019be70: lea r14, [rbx + 0x78]
0x10019be74: mov rdi, qword ptr [rbx + 0xa0]
0x10019be7b: call 0x100795a70 ; 0x100795a70
0x10019be80: mov rax, qword ptr [rbx + 0x10]
0x10019be84: jmp 0x10019beb7 ; 0x10019beb7
0x10019be86: test rsi, rsi
0x10019be89: je 0x10019be97
0x10019be8b: mov rdi, qword ptr [rbx + 0xa0]
0x10019be92: call 0x100795a70 ; 0x100795a70
0x10019be97: mov qword ptr [rbx + 0x68], 0
0x10019be9f: mov dword ptr [rbx + 0x70], 0
0x10019bea6: mov qword ptr [rbx + 0x78], 0
0x10019beae: jmp 0x10019c232 ; 0x10019c232
0x10019beb3: lea r14, [rbx + 0x78]
0x10019beb7: mov dword ptr [rbx + 0x80], 0
0x10019bec1: vmovss xmm0, dword ptr [rax + 0x18]
0x10019bec6: vdivss xmm0, xmm0, dword ptr [rip + 0x90bdee] ; 0x100aa7cbc
0x10019bece: vmovss xmm1, dword ptr [rip + 0x9091ea] ; 0x100aa50c0
0x10019bed6: vmaxss xmm0, xmm1, xmm0
0x10019beda: vmovss xmm1, dword ptr [rip + 0x90b90e] ; 0x100aa77f0
0x10019bee2: vminss xmm0, xmm1, xmm0
0x10019bee6: vmulss xmm0, xmm0, dword ptr [rip + 0x90abba] ; 0x100aa6aa8
0x10019beee: mov eax, dword ptr [rax + 0x28]
0x10019bef1: vcvtsi2ss xmm1, xmm2, rax
0x10019bef6: vmulss xmm0, xmm0, xmm1
0x10019befa: vcvttss2si rax, xmm0
0x10019beff: lea r13, [rbx + 0x70]
0x10019bf03: mov dword ptr [rbx + 0x70], eax
0x10019bf06: mov rdi, qword ptr [rbx + 0xa0]
0x10019bf0d: mov rdx, qword ptr [rip + 0x1c3dbc4] ; 0x101dd9ad8
0x10019bf14: mov esi, eax
0x10019bf16: shl rsi, 6
0x10019bf1a: mov ecx, 0x10
0x10019bf1f: call 0x100795530 ; 0x100795530
0x10019bf24: mov qword ptr [rbx + 0x68], rax
0x10019bf28: mov rsi, qword ptr [rbx + 0x10]
0x10019bf2c: mov qword ptr [r14], rsi
0x10019bf2f: test rax, rax
0x10019bf32: je 0x10019c1c6
0x10019bf38: mov eax, dword ptr [r13]
0x10019bf3c: test eax, eax
0x10019bf3e: mov rbx, qword ptr [rsp]
0x10019bf42: je 0x10019c232
0x10019bf48: mov qword ptr [rsp + 0x28], r15
0x10019bf4d: vcvtsi2ss xmm0, xmm2, rax
0x10019bf52: vmovss xmm1, dword ptr [rip + 0x909166] ; 0x100aa50c0
0x10019bf5a: vdivss xmm0, xmm1, xmm0
0x10019bf5e: vmovss dword ptr [rsp + 0x50], xmm0
0x10019bf64: xor r14d, r14d
0x10019bf67: lea r15, [rsp + 0x1a0]
0x10019bf6f: jmp 0x10019bf84 ; 0x10019bf84
0x10019bf71: nop word ptr cs:[rax + rax]
0x10019bf80: mov rsi, qword ptr [rbx + 0x10]
0x10019bf84: mov r12, rbx
0x10019bf87: mov ebx, r14d
0x10019bf8a: vcvtsi2ss xmm0, xmm2, rbx
0x10019bf8f: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x10019bf95: mov rdi, r15
0x10019bf98: call 0x100560b40 ; 0x100560b40
0x10019bf9d: vmovaps xmm0, xmmword ptr [rsp + 0x1a0]
0x10019bfa6: mov rax, qword ptr [r12 + 0x68]
0x10019bfab: shl rbx, 6
0x10019bfaf: vmovaps xmmword ptr [rax + rbx + 0x10], xmm0
0x10019bfb5: vmovaps xmm0, xmmword ptr [rsp + 0x1b0]
0x10019bfbe: mov rax, qword ptr [r12 + 0x68]
0x10019bfc3: vmovaps xmmword ptr [rax + rbx + 0x20], xmm0
0x10019bfc9: vmovaps xmm0, xmmword ptr [rsp + 0x1d0]
0x10019bfd2: mov rax, qword ptr [r12 + 0x68]
0x10019bfd7: vmovaps xmmword ptr [rax + rbx], xmm0
0x10019bfdc: inc r14d
0x10019bfdf: mov edi, dword ptr [r12 + 0x70]
0x10019bfe4: cmp r14d, edi
0x10019bfe7: mov rbx, r12
0x10019bfea: jb 0x10019bf80
0x10019bfec: test edi, edi
0x10019bfee: mov r15, qword ptr [rsp + 0x28]
0x10019bff3: je 0x10019c232
0x10019bff9: xor r8d, r8d
0x10019bffc: vmovaps xmm9, xmmword ptr [rip + 0x90b91c] ; 0x100aa7920
0x10019c004: vmovss xmm8, dword ptr [rip + 0x90b8b8] ; 0x100aa78c4
0x10019c00c: vmovaps xmm10, xmmword ptr [rip + 0x90ca1c] ; 0x100aa8a30
0x10019c014: vmovaps xmm11, xmmword ptr [rip + 0x90c084] ; 0x100aa80a0
0x10019c01c: vmovss xmm12, dword ptr [rip + 0x908594] ; 0x100aa45b8
0x10019c024: vmovss xmm13, dword ptr [rip + 0x90b890] ; 0x100aa78bc
0x10019c02c: vmovaps xmm14, xmmword ptr [rip + 0x9118ec] ; 0x100aad920
0x10019c034: vmovss xmm6, dword ptr [rip + 0x909084] ; 0x100aa50c0
0x10019c03c: nop dword ptr [rax]
0x10019c040: mov ebx, r8d
0x10019c043: mov rax, qword ptr [rsp]
0x10019c047: mov r9, qword ptr [rax + 0x68]
0x10019c04b: mov esi, ebx
0x10019c04d: shl rsi, 6
0x10019c051: lea rcx, [r9 + rsi]
0x10019c055: lea r8d, [rbx + 1]
0x10019c059: xor edx, edx
0x10019c05b: mov eax, r8d
0x10019c05e: div edi
0x10019c060: shl rdx, 6
0x10019c064: add rdx, r9
0x10019c067: dec edi
0x10019c069: cmp ebx, edi
0x10019c06b: mov rbx, qword ptr [rsp]
0x10019c06f: jne 0x10019c07b
0x10019c071: mov rax, qword ptr [rbx + 0x10]
0x10019c075: cmp byte ptr [rax + 0x2c], 0
0x10019c079: je 0x10019c0ad
0x10019c07b: vmovaps xmm0, xmmword ptr [rdx]
0x10019c07f: vsubps xmm0, xmm0, xmmword ptr [rcx]
0x10019c083: vmulps xmm0, xmm0, xmm0
0x10019c087: vmovshdup xmm1, xmm0
0x10019c08b: vaddss xmm1, xmm0, xmm1
0x10019c08f: vpermilpd xmm0, xmm0, 1
0x10019c095: vaddss xmm0, xmm0, xmm1
0x10019c099: vsqrtss xmm0, xmm0, xmm0
0x10019c09d: vaddss xmm0, xmm0, dword ptr [rbx + 0x80]
0x10019c0a5: vmovss dword ptr [rbx + 0x80], xmm0
0x10019c0ad: vmovaps xmm0, xmmword ptr [rdx]
0x10019c0b1: vsubps xmm1, xmm0, xmmword ptr [rcx]
0x10019c0b5: vmulps xmm0, xmm1, xmm1
0x10019c0b9: vmovshdup xmm7, xmm0
0x10019c0bd: vaddss xmm7, xmm0, xmm7
0x10019c0c1: vpermilpd xmm0, xmm0, 1
0x10019c0c7: vaddss xmm0, xmm0, xmm7
0x10019c0cb: vsqrtss xmm0, xmm0, xmm0
0x10019c0cf: vucomiss xmm0, xmm8
0x10019c0d4: vmovaps xmm7, xmm9
0x10019c0d8: jbe 0x10019c0e4
0x10019c0da: vpermilps xmm0, xmm0, 0xc0
0x10019c0e0: vdivps xmm7, xmm1, xmm0
0x10019c0e4: vmulps xmm0, xmm7, xmm10
0x10019c0e9: vpermilps xmm1, xmm7, 0xd2
0x10019c0ef: vmulps xmm2, xmm1, xmm11
0x10019c0f4: vsubps xmm0, xmm0, xmm2
0x10019c0f8: vpermilps xmm2, xmm0, 0xd2
0x10019c0fe: vmulps xmm1, xmm1, xmm2
0x10019c102: vpermilps xmm2, xmm2, 0xd2
0x10019c108: vmulps xmm2, xmm7, xmm2
0x10019c10c: vsubps xmm1, xmm1, xmm2
0x10019c110: vpermilpd xmm2, xmm0, 1
0x10019c116: vaddss xmm2, xmm2, xmm6
0x10019c11a: vaddss xmm2, xmm2, xmm1
0x10019c11e: vpermilpd xmm3, xmm7, 1
0x10019c124: vaddss xmm2, xmm3, xmm2
0x10019c128: vsqrtss xmm2, xmm2, xmm2
0x10019c12c: vmulss xmm2, xmm2, xmm12
0x10019c131: vmulss xmm3, xmm2, xmm13
0x10019c136: vdivss xmm3, xmm6, xmm3
0x10019c13a: vmovshdup xmm4, xmm1
0x10019c13e: vmovshdup xmm5, xmm7
0x10019c142: vsubss xmm4, xmm4, xmm5
0x10019c146: vmulss xmm4, xmm3, xmm4
0x10019c14a: vmovshdup xmm5, xmm0
0x10019c14e: vsubss xmm5, xmm7, xmm5
0x10019c152: vmulss xmm5, xmm3, xmm5
0x10019c156: vinsertps xmm4, xmm4, xmm5, 0x10
0x10019c15c: vpermilpd xmm1, xmm1, 1
0x10019c162: vsubss xmm0, xmm0, xmm1
0x10019c166: vmulss xmm0, xmm3, xmm0
0x10019c16a: vinsertps xmm0, xmm4, xmm0, 0x20
0x10019c170: vinsertps xmm0, xmm0, xmm2, 0x30
0x10019c176: vmulps xmm0, xmm0, xmm14
0x10019c17b: vcvttss2si eax, xmm0
0x10019c17f: mov byte ptr [r9 + rsi + 0x30], al
0x10019c184: vmovshdup xmm1, xmm0
0x10019c188: vcvttss2si eax, xmm1
0x10019c18c: mov rcx, qword ptr [rbx + 0x68]
0x10019c190: mov byte ptr [rcx + rsi + 0x31], al
0x10019c194: vpermilpd xmm1, xmm0, 1
0x10019c19a: vcvttss2si eax, xmm1
0x10019c19e: mov rcx, qword ptr [rbx + 0x68]
0x10019c1a2: mov byte ptr [rcx + rsi + 0x32], al
0x10019c1a6: vpermilps xmm0, xmm0, 0xe7
0x10019c1ac: vcvttss2si eax, xmm0
0x10019c1b0: mov rcx, qword ptr [rbx + 0x68]
0x10019c1b4: mov byte ptr [rcx + rsi + 0x33], al
0x10019c1b8: mov edi, dword ptr [rbx + 0x70]
0x10019c1bb: cmp r8d, edi
0x10019c1be: jb 0x10019c040
0x10019c1c4: jmp 0x10019c1da ; 0x10019c1da
0x10019c1c6: mov dword ptr [r13], 0
0x10019c1ce: jmp 0x10019d5fb ; 0x10019d5fb
0x10019c1d3: lea r13, [rbx + 0x70]
0x10019c1d7: mov edi, dword ptr [rbx + 0x70]
0x10019c1da: test edi, edi
0x10019c1dc: je 0x10019c232
0x10019c1de: cmp qword ptr [rbx + 0x78], 0
0x10019c1e3: je 0x10019c232
0x10019c1e5: cmp dword ptr [rbx + 0x94], 0
0x10019c1ec: mov qword ptr [rsp + 0x28], r15
0x10019c1f1: je 0x10019cda6
0x10019c1f7: vmovss xmm0, dword ptr [rbx + 0x24]
0x10019c1fc: vmulss xmm0, xmm0, dword ptr [rip + 0x90f5f8] ; 0x100aab7fc
0x10019c204: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10019c209: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10019c212: mov rax, qword ptr [r15 + 0x160]
0x10019c219: lea rcx, [rip + 0x1e5eeb0] ; 0x101ffb0d0
0x10019c220: cmp byte ptr [rcx], 0
0x10019c223: lea rcx, [rip + 0xb1c316] ; 0x100cb8540
0x10019c22a: je 0x10019c242
0x10019c22c: vmovss xmm0, dword ptr [rcx]
0x10019c230: jmp 0x10019c24a ; 0x10019c24a
0x10019c232: mov qword ptr [rbx + 0x94], 0
0x10019c23d: jmp 0x10019d5fb ; 0x10019d5fb
0x10019c242: vmovss xmm0, dword ptr [rip + 0x908e76] ; 0x100aa50c0
0x10019c24a: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10019c24f: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10019c254: vmovss xmm1, dword ptr [rip + 0x90a840] ; 0x100aa6a9c
0x10019c25c: vmaxss xmm0, xmm1, xmm0
0x10019c260: vmovss xmm1, dword ptr [rip + 0x90a838] ; 0x100aa6aa0
0x10019c268: vminss xmm0, xmm1, xmm0
0x10019c26c: vmulss xmm0, xmm0, dword ptr [rbx + 0x1c]
0x10019c271: vaddss xmm0, xmm0, dword ptr [rbx + 0x98]
0x10019c279: vmovss dword ptr [rbx + 0x98], xmm0
0x10019c281: mov rdi, qword ptr [r15 + 0x280]
0x10019c288: call 0x1000fc260 ; 0x1000fc260
0x10019c28d: cmp dword ptr [rbx + 0x94], 0
0x10019c294: je 0x10019cf24
0x10019c29a: mov qword ptr [rsp + 0x50], r13
0x10019c29f: vmovaps xmm9, xmmword ptr [rsp + 0xa0]
0x10019c2a8: vmovshdup xmm12, xmm9
0x10019c2ad: mov qword ptr [rsp + 0x30], rax
0x10019c2b2: mov rax, qword ptr [rax + 0x18]
0x10019c2b6: vmovss xmm10, dword ptr [rax + 0xb48]
0x10019c2be: lea rax, [rbx + 0x41]
0x10019c2c2: mov qword ptr [rsp + 0x80], rax
0x10019c2ca: xor esi, esi
0x10019c2cc: vmovss xmm11, dword ptr [rip + 0x908dec] ; 0x100aa50c0
0x10019c2d4: vxorps xmm6, xmm6, xmm6
0x10019c2d8: vmovss xmm13, dword ptr [rip + 0x90c2f0] ; 0x100aa85d0
0x10019c2e0: vmovss xmm14, dword ptr [rip + 0x90a7c0] ; 0x100aa6aa8
0x10019c2e8: vmovss xmm15, dword ptr [rip + 0x908dd4] ; 0x100aa50c4
0x10019c2f0: lea r12, [rip + 0x91ba89] ; 0x100ab7d80
0x10019c2f7: lea r15, [rip + 0x919982] ; 0x100ab5c80
0x10019c2fe: lea r13, [rip + 0x91b97b] ; 0x100ab7c80
0x10019c305: vmovss xmm7, dword ptr [rip + 0x90a78f] ; 0x100aa6a9c
0x10019c30d: vmovaps xmm8, xmm7
0x10019c311: vmovss xmm7, dword ptr [rip + 0x90a787] ; 0x100aa6aa0
0x10019c319: vmovaps xmmword ptr [rsp + 0x90], xmm12
0x10019c322: vmovss dword ptr [rsp + 0xc], xmm10
0x10019c328: nop dword ptr [rax + rax]
0x10019c330: mov rdx, qword ptr [rbx + 0x88]
0x10019c337: mov eax, esi
0x10019c339: lea r10, [rax + rax*2]
0x10019c33d: shl r10, 4
0x10019c341: mov rax, qword ptr [rsp + 0x28]
0x10019c346: mov rax, qword ptr [rax + 0x160]
0x10019c34d: lea rcx, [rip + 0x1e5ed7c] ; 0x101ffb0d0
0x10019c354: cmp byte ptr [rcx], 0
0x10019c357: vmovaps xmm0, xmm11
0x10019c35b: je 0x10019c368
0x10019c35d: lea rcx, [rip + 0xb1c1dc] ; 0x100cb8540
0x10019c364: vmovss xmm0, dword ptr [rcx]
0x10019c368: lea r14, [rdx + r10]
0x10019c36c: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10019c371: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10019c376: vmaxss xmm0, xmm8, xmm0
0x10019c37a: vminss xmm0, xmm7, xmm0
0x10019c37e: vmulss xmm0, xmm0, dword ptr [rbx + 0x20]
0x10019c383: vucomiss xmm0, xmm6
0x10019c387: jbe 0x10019c5d0
0x10019c38d: mov dword ptr [rsp + 0x10], esi
0x10019c391: mov qword ptr [rsp + 0x60], rdx
0x10019c396: lea r11, [rdx + r10 + 0x1c]
0x10019c39b: vmovaps xmm1, xmmword ptr [r14]
0x10019c3a0: mov dword ptr [rsp + 0x40], 0
0x10019c3a8: nop dword ptr [rax + rax]
0x10019c3b0: vmovss xmm2, dword ptr [r11]
0x10019c3b5: vminss xmm3, xmm2, xmm0
0x10019c3b9: vpermilps xmm4, xmm3, 0xc0
0x10019c3bf: vmulps xmm4, xmm4, xmmword ptr [r11 - 0xc]
0x10019c3c5: vmulss xmm5, xmm3, xmm13
0x10019c3ca: vmulss xmm5, xmm5, xmm14
0x10019c3cf: vinsertps xmm4, xmm4, xmm5, 0x30
0x10019c3d5: vaddps xmm1, xmm1, xmm4
0x10019c3d9: vmovaps xmmword ptr [r14], xmm1
0x10019c3de: vsubss xmm2, xmm2, xmm3
0x10019c3e2: vsubss xmm0, xmm0, xmm3
0x10019c3e6: vucomiss xmm6, xmm2
0x10019c3ea: jae 0x10019c400
0x10019c3ec: vmovss dword ptr [r11], xmm2
0x10019c3f1: vucomiss xmm0, xmm6
0x10019c3f5: ja 0x10019c3b0
0x10019c3f7: jmp 0x10019c5bc ; 0x10019c5bc
0x10019c3fc: nop dword ptr [rax]
0x10019c400: movzx esi, word ptr [r11 + 8]
0x10019c405: lea eax, [rsi + 1]
0x10019c408: mov rcx, qword ptr [rsp + 0x50]
0x10019c40d: mov edi, dword ptr [rcx]
0x10019c40f: xor edx, edx
0x10019c411: div edi
0x10019c413: mov ecx, edx
0x10019c415: add esi, 2
0x10019c418: xor edx, edx
0x10019c41a: mov eax, esi
0x10019c41c: div edi
0x10019c41e: test edx, edx
0x10019c420: jne 0x10019c450
0x10019c422: mov rax, qword ptr [rbx + 0x10]
0x10019c426: cmp byte ptr [rax + 0x2c], 0
0x10019c42a: je 0x10019c443
0x10019c42c: vaddss xmm1, xmm15, dword ptr [rbx + 0x98]
0x10019c434: vmovss dword ptr [rbx + 0x98], xmm1
0x10019c43c: vmovaps xmm1, xmmword ptr [r14]
0x10019c441: jmp 0x10019c450 ; 0x10019c450
0x10019c443: mov al, 1
0x10019c445: mov dword ptr [rsp + 0x40], eax
0x10019c449: nop dword ptr [rax]
0x10019c450: mov word ptr [r11 + 8], cx
0x10019c455: movzx eax, word ptr [r11 + 4]
0x10019c45a: mov rcx, rax
0x10019c45d: shr rcx, 0xa
0x10019c461: movzx esi, word ptr [r12 + rcx*2]
0x10019c466: and eax, 0x3ff
0x10019c46b: add rax, rsi
0x10019c46e: mov ecx, dword ptr [r13 + rcx*4]
0x10019c473: add ecx, dword ptr [r15 + rax*4]
0x10019c477: vmovd xmm2, ecx
0x10019c47b: vmulss xmm3, xmm12, xmm2
0x10019c47f: movzx eax, word ptr [r11 + 6]
0x10019c484: mov rcx, rax
0x10019c487: shr rcx, 0xa
0x10019c48b: movzx esi, word ptr [r12 + rcx*2]
0x10019c490: and eax, 0x3ff
0x10019c495: add rax, rsi
0x10019c498: mov ecx, dword ptr [r13 + rcx*4]
0x10019c49d: add ecx, dword ptr [r15 + rax*4]
0x10019c4a1: vmovd xmm4, ecx
0x10019c4a5: vmulss xmm5, xmm9, xmm4
0x10019c4a9: vsubss xmm3, xmm3, xmm5
0x10019c4ad: vmulss xmm4, xmm12, xmm4
0x10019c4b1: vmulss xmm2, xmm9, xmm2
0x10019c4b5: vaddss xmm2, xmm2, xmm4
0x10019c4b9: vmovd esi, xmm3
0x10019c4bd: mov eax, esi
0x10019c4bf: shr eax, 0x17
0x10019c4c2: mov r9, qword ptr [rip + 0xa713df] ; 0x100c0d8a8
0x10019c4c9: movzx edi, word ptr [r9 + rax*2]
0x10019c4ce: and esi, 0x7fffff
0x10019c4d4: mov r8, qword ptr [rip + 0xa713d5] ; 0x100c0d8b0
0x10019c4db: movzx ecx, byte ptr [r8 + rax]
0x10019c4e0: shr esi, cl
0x10019c4e2: add esi, edi
0x10019c4e4: mov word ptr [r11 + 4], si
0x10019c4e9: vmovd eax, xmm2
0x10019c4ed: mov ecx, eax
0x10019c4ef: shr ecx, 0x17
0x10019c4f2: movzx edi, word ptr [r9 + rcx*2]
0x10019c4f7: and eax, 0x7fffff
0x10019c4fc: movzx ecx, byte ptr [r8 + rcx]
0x10019c501: shr eax, cl
0x10019c503: add eax, edi
0x10019c505: mov word ptr [r11 + 6], ax
0x10019c50a: mov rcx, qword ptr [rbx + 0x68]
0x10019c50e: mov edx, edx
0x10019c510: shl rdx, 6
0x10019c514: mov edi, esi
0x10019c516: shr edi, 0xa
0x10019c519: and edi, 0x3f
0x10019c51c: movzx ebx, word ptr [r12 + rdi*2]
0x10019c521: and esi, 0x3ff
0x10019c527: add rsi, rbx
0x10019c52a: mov rbx, qword ptr [rsp]
0x10019c52e: mov edi, dword ptr [r13 + rdi*4]
0x10019c533: add edi, dword ptr [r15 + rsi*4]
0x10019c537: vmovd xmm2, edi
0x10019c53b: vpermilps xmm2, xmm2, 0xc0
0x10019c541: vmulps xmm2, xmm2, xmmword ptr [rcx + rdx + 0x10]
0x10019c547: vaddps xmm2, xmm2, xmmword ptr [rcx + rdx]
0x10019c54c: mov esi, eax
0x10019c54e: shr esi, 0xa
0x10019c551: and esi, 0x3f
0x10019c554: movzx edi, word ptr [r12 + rsi*2]
0x10019c559: and eax, 0x3ff
0x10019c55e: add rax, rdi
0x10019c561: mov esi, dword ptr [r13 + rsi*4]
0x10019c566: add esi, dword ptr [r15 + rax*4]
0x10019c56a: vmovd xmm3, esi
0x10019c56e: vpermilps xmm3, xmm3, 0xc0
0x10019c574: vmulps xmm3, xmm3, xmmword ptr [rcx + rdx + 0x20]
0x10019c57a: vaddps xmm2, xmm2, xmm3
0x10019c57e: vsubps xmm2, xmm2, xmm1
0x10019c582: vmulps xmm3, xmm2, xmm2
0x10019c586: vmovshdup xmm4, xmm3
0x10019c58a: vaddss xmm4, xmm3, xmm4
0x10019c58e: vpermilpd xmm3, xmm3, 1
0x10019c594: vaddss xmm3, xmm3, xmm4
0x10019c598: vsqrtss xmm3, xmm3, xmm3
0x10019c59c: vpermilps xmm4, xmm3, 0xc0
0x10019c5a2: vdivps xmm2, xmm2, xmm4
0x10019c5a6: vinsertps xmm2, xmm2, xmm3, 0x30
0x10019c5ac: vmovaps xmmword ptr [r11 - 0xc], xmm2
0x10019c5b2: vucomiss xmm0, xmm6
0x10019c5b6: ja 0x10019c3b0
0x10019c5bc: test byte ptr [rsp + 0x40], 1
0x10019c5c1: mov esi, dword ptr [rsp + 0x10]
0x10019c5c5: mov rdx, qword ptr [rsp + 0x60]
0x10019c5ca: jne 0x10019c6a0
0x10019c5d0: vucomiss xmm10, xmm11
0x10019c5d5: jne 0x10019ca76
0x10019c5db: jp 0x10019ca76
0x10019c5e1: vmovaps xmm0, xmmword ptr [r14]
0x10019c5e6: mov rax, qword ptr [rsp + 0x30]
0x10019c5eb: mov rax, qword ptr [rax + 0x18]
0x10019c5ef: vsubps xmm2, xmm0, xmmword ptr [rax + 0x10]
0x10019c5f4: vmulps xmm0, xmm2, xmm2
0x10019c5f8: vmovshdup xmm1, xmm0
0x10019c5fc: vaddss xmm1, xmm0, xmm1
0x10019c600: vpermilpd xmm0, xmm0, 1
0x10019c606: vaddss xmm3, xmm0, xmm1
0x10019c60a: vmovss xmm0, dword ptr [rip + 0x90b2aa] ; 0x100aa78bc
0x10019c612: vucomiss xmm0, xmm3
0x10019c616: jbe 0x10019ca76
0x10019c61c: vmovaps xmmword ptr [rsp + 0x40], xmm2
0x10019c622: vmovaps xmm2, xmmword ptr [rdx + r10 + 0x10]
0x10019c629: vmulps xmm0, xmm2, xmm2
0x10019c62d: vmovshdup xmm1, xmm0
0x10019c631: vaddss xmm1, xmm0, xmm1
0x10019c635: vpermilpd xmm0, xmm0, 1
0x10019c63b: vaddss xmm0, xmm0, xmm1
0x10019c63f: vsqrtss xmm0, xmm0, xmm0
0x10019c643: vucomiss xmm0, dword ptr [rip + 0x90b279] ; 0x100aa78c4
0x10019c64b: jbe 0x10019c657
0x10019c64d: vpermilps xmm0, xmm0, 0xc0
0x10019c653: vdivps xmm2, xmm2, xmm0
0x10019c657: mov rcx, qword ptr [rsp + 0x30]
0x10019c65c: vmovaps xmmword ptr [rsp + 0x70], xmm2
0x10019c662: vmovss xmm0, dword ptr [rip + 0x907f4e] ; 0x100aa45b8
0x10019c66a: vmaxss xmm0, xmm0, xmm3
0x10019c66e: vdivss xmm1, xmm11, xmm0
0x10019c672: mov rax, qword ptr [rcx + 0x30]
0x10019c676: vucomiss xmm1, xmm6
0x10019c67a: mov dword ptr [rsp + 0x10], esi
0x10019c67e: vmovaps xmmword ptr [rsp + 0x60], xmm1
0x10019c684: vmovss dword ptr [rsp + 0xb0], xmm3
0x10019c68d: jbe 0x10019c6f0
0x10019c68f: vaddss xmm0, xmm1, dword ptr [rax + 0x14]
0x10019c694: vmovss dword ptr [rax + 0x14], xmm0
0x10019c699: jmp 0x10019c6fe ; 0x10019c6fe
0x10019c69b: nop dword ptr [rax + rax]
0x10019c6a0: mov rax, qword ptr [rbx + 0x88]
0x10019c6a7: mov ecx, dword ptr [rbx + 0x94]
0x10019c6ad: dec ecx
0x10019c6af: mov dword ptr [rbx + 0x94], ecx
0x10019c6b5: dec esi
0x10019c6b7: lea rcx, [rcx + rcx*2]
0x10019c6bb: shl rcx, 4
0x10019c6bf: vmovaps xmm0, xmmword ptr [rax + rcx]
0x10019c6c4: vmovaps xmmword ptr [rax + r10], xmm0
0x10019c6ca: vmovaps xmm0, xmmword ptr [rax + rcx + 0x10]
0x10019c6d0: vmovaps xmmword ptr [rax + r10 + 0x10], xmm0
0x10019c6d7: movzx edx, word ptr [rax + rcx + 0x24]
0x10019c6dc: mov word ptr [rax + r10 + 0x24], dx
0x10019c6e2: mov ecx, dword ptr [rax + rcx + 0x20]
0x10019c6e6: mov dword ptr [rax + r10 + 0x20], ecx
0x10019c6eb: jmp 0x10019ca76 ; 0x10019ca76
0x10019c6f0: vmovss xmm0, dword ptr [rax + 0x18]
0x10019c6f5: vsubss xmm0, xmm0, xmm1
0x10019c6f9: vmovss dword ptr [rax + 0x18], xmm0
0x10019c6fe: mov rax, qword ptr [rcx + 0x60]
0x10019c702: vmovaps xmm0, xmmword ptr [r14]
0x10019c707: vmovaps xmmword ptr [rax + 0x370], xmm0
0x10019c70f: mov qword ptr [rax + 0x368], 0
0x10019c71a: mov rdi, qword ptr [rcx + 0x20]
0x10019c71e: call 0x10015e8b0 ; 0x10015e8b0
0x10019c723: test al, al
0x10019c725: jne 0x10019ca22
0x10019c72b: vxorps xmm9, xmm9, xmm9
0x10019c730: vsqrtss xmm0, xmm9, dword ptr [rsp + 0xb0]
0x10019c739: vucomiss xmm0, dword ptr [rip + 0x90b183] ; 0x100aa78c4
0x10019c741: vmovss xmm3, dword ptr [rip + 0x908977] ; 0x100aa50c0
0x10019c749: vxorps xmm4, xmm4, xmm4
0x10019c74d: jbe 0x10019c766
0x10019c74f: vpermilps xmm0, xmm0, 0xc0
0x10019c755: vmovaps xmm1, xmmword ptr [rsp + 0x40]
0x10019c75b: vdivps xmm1, xmm1, xmm0
0x10019c75f: mov rax, qword ptr [rsp + 0x30]
0x10019c764: jmp 0x10019c771 ; 0x10019c771
0x10019c766: mov rax, qword ptr [rsp + 0x30]
0x10019c76b: vmovaps xmm1, xmmword ptr [rsp + 0x40]
0x10019c771: vmovaps xmmword ptr [rsp + 0x40], xmm1
0x10019c777: mov rdi, qword ptr [rax + 0x18]
0x10019c77b: vmovss xmm0, dword ptr [rip + 0x9101e9] ; 0x100aac96c
0x10019c783: vmulss xmm0, xmm0, dword ptr [rbx + 0x20]
0x10019c788: vmovaps xmm5, xmmword ptr [rsp + 0x70]
0x10019c78e: vmulps xmm1, xmm5, xmm1
0x10019c792: vmovshdup xmm2, xmm1
0x10019c796: vaddss xmm2, xmm1, xmm2
0x10019c79a: vpermilpd xmm1, xmm1, 1
0x10019c7a0: vaddss xmm1, xmm1, xmm2
0x10019c7a4: vmaxss xmm1, xmm4, xmm1
0x10019c7a8: vminss xmm1, xmm3, xmm1
0x10019c7ac: vmulss xmm0, xmm0, xmm1
0x10019c7b0: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10019c7b6: vpermilps xmm0, xmm0, 0xc0
0x10019c7bc: vmulps xmm0, xmm5, xmm0
0x10019c7c0: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10019c7c9: lea rsi, [rsp + 0x110]
0x10019c7d1: call 0x100148750 ; 0x100148750
0x10019c7d6: mov rax, qword ptr [rsp + 0x30]
0x10019c7db: mov rdi, qword ptr [rax + 0x18]
0x10019c7df: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10019c7e5: vmulps xmm0, xmm2, xmmword ptr [rdi + 0x50]
0x10019c7ea: vmovshdup xmm1, xmm0
0x10019c7ee: vaddss xmm1, xmm0, xmm1
0x10019c7f2: vpermilpd xmm0, xmm0, 1
0x10019c7f8: vaddss xmm0, xmm0, xmm1
0x10019c7fc: vxorps xmm1, xmm1, xmm1
0x10019c800: vmaxss xmm0, xmm1, xmm0
0x10019c804: vmovss xmm1, dword ptr [rip + 0x9088b4] ; 0x100aa50c0
0x10019c80c: vminss xmm0, xmm1, xmm0
0x10019c810: vmulss xmm0, xmm0, dword ptr [rip + 0x90a290] ; 0x100aa6aa8
0x10019c818: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10019c81e: vpermilps xmm0, xmm0, 0xc0
0x10019c824: vmulps xmm0, xmm2, xmm0
0x10019c828: vmovaps xmmword ptr [rsp + 0x100], xmm0
0x10019c831: lea rsi, [rsp + 0x100]
0x10019c839: call 0x100148750 ; 0x100148750
0x10019c83e: mov rax, qword ptr [rsp + 0x30]
0x10019c843: mov rdi, qword ptr [rax + 0x18]
0x10019c847: vpermilps xmm0, xmmword ptr [rsp + 0x60], 0xc0
0x10019c84f: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x40]
0x10019c855: vmovaps xmmword ptr [rsp + 0xf0], xmm0
0x10019c85e: lea rsi, [rsp + 0xf0]
0x10019c866: call 0x100148750 ; 0x100148750
0x10019c86b: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019c870: vcvtsi2ss xmm0, xmm9, eax
0x10019c874: vmulss xmm0, xmm0, dword ptr [rip + 0x90a874] ; 0x100aa70f0
0x10019c87c: mov rax, qword ptr [rsp + 0x30]
0x10019c881: mov rdi, qword ptr [rax + 0x20]
0x10019c885: vucomiss xmm0, dword ptr [rip + 0x90a867] ; 0x100aa70f4
0x10019c88d: lea rsi, [rip + 0x9c9ca5] ; 0x100b66539 FlapPV2
0x10019c894: ja 0x10019c8c1
0x10019c896: vucomiss xmm0, dword ptr [rip + 0x907d1a] ; 0x100aa45b8
0x10019c89e: lea rsi, [rip + 0x9c9ca4] ; 0x100b66549 FlapPF1
0x10019c8a5: ja 0x10019c8c1
0x10019c8a7: vucomiss xmm0, dword ptr [rip + 0x90bd45] ; 0x100aa85f4
0x10019c8af: lea rsi, [rip + 0x9cafe3] ; 0x100b67899 SpinL
0x10019c8b6: lea rax, [rip + 0x9cafee] ; 0x100b678ab SpinR
0x10019c8bd: cmova rsi, rax
0x10019c8c1: xor edx, edx
0x10019c8c3: xor ecx, ecx
0x10019c8c5: vmovss xmm0, dword ptr [rip + 0x9087f3] ; 0x100aa50c0
0x10019c8cd: vmovaps xmm1, xmm0
0x10019c8d1: call 0x10016c6c0 ; 0x10016c6c0
0x10019c8d6: mov rax, qword ptr [rsp + 0x28]
0x10019c8db: mov rdi, qword ptr [rax + 0x3c8]
0x10019c8e2: vmovaps xmm0, xmmword ptr [r14]
0x10019c8e7: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10019c8f0: vxorps xmm1, xmm1, xmm1
0x10019c8f4: mov ecx, 1
0x10019c8f9: lea rsi, [rsp + 0xe0]
0x10019c901: lea rdx, [rip + 0x1ea2da8] ; 0x10203f6b0
0x10019c908: vmovss xmm0, dword ptr [rip + 0x90bcf8] ; 0x100aa8608
0x10019c910: call 0x1005a16c0 ; 0x1005a16c0
0x10019c915: mov byte ptr [rax + 0x53], 1
0x10019c919: vbroadcastss xmm0, dword ptr [rbx + 0x20]
0x10019c91f: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x70]
0x10019c925: vaddps xmm0, xmm0, xmm0
0x10019c929: vmovaps xmmword ptr [rax + 0x10], xmm0
0x10019c92e: movzx eax, byte ptr [rbx + 0x40]
0x10019c932: mov rcx, rax
0x10019c935: shr rcx, 1
0x10019c938: test al, 1
0x10019c93a: cmovne rcx, qword ptr [rbx + 0x48]
0x10019c93f: test rcx, rcx
0x10019c942: je 0x10019ca22
0x10019c948: mov rcx, qword ptr [rsp + 0x28]
0x10019c94d: mov rdi, qword ptr [rcx + 0x5c8]
0x10019c954: mov rsi, qword ptr [rsp + 0x80]
0x10019c95c: test al, 1
0x10019c95e: je 0x10019c964
0x10019c960: mov rsi, qword ptr [rbx + 0x50]
0x10019c964: vxorps ymm0, ymm0, ymm0
0x10019c968: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10019c971: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10019c97a: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10019c983: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10019c98c: vmovups ymmword ptr [rsp + 0x330], ymm0
0x10019c995: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10019c99e: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10019c9a7: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10019c9b0: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10019c9b9: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10019c9c2: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10019c9cb: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10019c9d4: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10019c9dd: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10019c9e6: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10019c9ef: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10019c9f8: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10019ca01: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10019ca0a: lea rdx, [rsp + 0x120]
0x10019ca12: lea rcx, [rsp + 0x1a0]
0x10019ca1a: vzeroupper 
0x10019ca1d: call 0x1006018a0 ; 0x1006018a0
0x10019ca22: vmovaps xmm9, xmmword ptr [rsp + 0xa0]
0x10019ca2b: vmovss xmm7, dword ptr [rip + 0x90a069] ; 0x100aa6a9c
0x10019ca33: vmovaps xmm8, xmm7
0x10019ca37: vmovss xmm7, dword ptr [rip + 0x90a061] ; 0x100aa6aa0
0x10019ca3f: vmovaps xmm12, xmmword ptr [rsp + 0x90]
0x10019ca48: vmovss xmm10, dword ptr [rsp + 0xc]
0x10019ca4e: mov esi, dword ptr [rsp + 0x10]
0x10019ca52: vmovss xmm11, dword ptr [rip + 0x908666] ; 0x100aa50c0
0x10019ca5a: vxorps xmm6, xmm6, xmm6
0x10019ca5e: vmovss xmm13, dword ptr [rip + 0x90bb6a] ; 0x100aa85d0
0x10019ca66: vmovss xmm14, dword ptr [rip + 0x90a03a] ; 0x100aa6aa8
0x10019ca6e: vmovss xmm15, dword ptr [rip + 0x90864e] ; 0x100aa50c4
0x10019ca76: inc esi
0x10019ca78: mov eax, dword ptr [rbx + 0x94]
0x10019ca7e: cmp esi, eax
0x10019ca80: jb 0x10019c330
0x10019ca86: cmp byte ptr [rbx + 0xc], 0
0x10019ca8a: je 0x10019cf30
0x10019ca90: vmovss xmm0, dword ptr [rbx + 0x98]
0x10019ca98: vucomiss xmm0, dword ptr [rip + 0x908620] ; 0x100aa50c0
0x10019caa0: jb 0x10019cf3a
0x10019caa6: vmovss xmm2, dword ptr [rip + 0x908612] ; 0x100aa50c0
0x10019caae: lea r13, [rip + 0x9191cb] ; 0x100ab5c80
0x10019cab5: lea r12, [rip + 0x91b1c4] ; 0x100ab7c80
0x10019cabc: vmovss xmm1, dword ptr [rip + 0x908600] ; 0x100aa50c4
0x10019cac4: cmp eax, dword ptr [rbx + 0x90]
0x10019caca: jae 0x10019cd8b
0x10019cad0: jmp 0x10019caf2 ; 0x10019caf2
0x10019cad2: nop word ptr cs:[rax + rax]
0x10019cae0: mov eax, dword ptr [rbx + 0x94]
0x10019cae6: cmp eax, dword ptr [rbx + 0x90]
0x10019caec: jae 0x10019cd8b
0x10019caf2: mov r14, qword ptr [rbx + 0x88]
0x10019caf9: lea ecx, [rax + 1]
0x10019cafc: mov dword ptr [rbx + 0x94], ecx
0x10019cb02: mov r15d, eax
0x10019cb05: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019cb0a: vxorps xmm5, xmm5, xmm5
0x10019cb0e: vcvtsi2ss xmm0, xmm5, eax
0x10019cb12: vmovss xmm1, dword ptr [rip + 0x90a5d6] ; 0x100aa70f0
0x10019cb1a: vmulss xmm0, xmm0, xmm1
0x10019cb1e: vsubss xmm1, xmm0, dword ptr [rip + 0x90859a] ; 0x100aa50c0
0x10019cb26: vaddss xmm0, xmm0, xmm1
0x10019cb2a: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x10019cb30: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019cb35: vxorps xmm5, xmm5, xmm5
0x10019cb39: vcvtsi2ss xmm0, xmm5, eax
0x10019cb3d: vmulss xmm0, xmm0, dword ptr [rip + 0x90a5ab] ; 0x100aa70f0
0x10019cb45: vsubss xmm1, xmm0, dword ptr [rip + 0x908573] ; 0x100aa50c0
0x10019cb4d: vaddss xmm0, xmm0, xmm1
0x10019cb51: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x10019cb57: vinsertps xmm0, xmm1, xmm0, 0x1c
0x10019cb5d: vmovaps xmm1, xmmword ptr [rsp + 0x50]
0x10019cb63: vinsertps xmm1, xmm0, xmm1, 0xf4
0x10019cb69: vmovaps xmm3, xmmword ptr [rsp + 0x40]
0x10019cb6f: vblendps xmm3, xmm3, xmmword ptr [rip + 0x907a27], 7 ; 0x100aa45a0
0x10019cb79: vmovaps xmmword ptr [rsp + 0x50], xmm1
0x10019cb7f: vmulps xmm1, xmm1, xmm1
0x10019cb83: vmovshdup xmm2, xmm1
0x10019cb87: vaddss xmm2, xmm1, xmm2
0x10019cb8b: vpermilpd xmm1, xmm1, 1
0x10019cb91: vaddss xmm1, xmm1, xmm2
0x10019cb95: vsqrtss xmm1, xmm1, xmm1
0x10019cb99: vucomiss xmm1, dword ptr [rip + 0x90ad23] ; 0x100aa78c4
0x10019cba1: vmovaps xmmword ptr [rsp + 0x40], xmm3
0x10019cba7: jbe 0x10019cbb3
0x10019cba9: vpermilps xmm1, xmm1, 0xc0
0x10019cbaf: vdivps xmm3, xmm0, xmm1
0x10019cbb3: vmovaps xmmword ptr [rsp + 0x10], xmm3
0x10019cbb9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019cbbe: vxorps xmm5, xmm5, xmm5
0x10019cbc2: vcvtsi2ss xmm0, xmm5, eax
0x10019cbc6: vmovss xmm1, dword ptr [rip + 0x90a522] ; 0x100aa70f0
0x10019cbce: vmulss xmm0, xmm0, xmm1
0x10019cbd2: vmovss xmm1, dword ptr [rip + 0x9084e6] ; 0x100aa50c0
0x10019cbda: vsubss xmm1, xmm1, xmm0
0x10019cbde: vxorps xmm2, xmm2, xmm2
0x10019cbe2: vmulss xmm1, xmm1, xmm2
0x10019cbe6: vaddss xmm0, xmm0, xmm1
0x10019cbea: vpermilps xmm0, xmm0, 0xc0
0x10019cbf0: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x10]
0x10019cbf6: vextractps edx, xmm0, 0
0x10019cbfc: mov eax, edx
0x10019cbfe: shr eax, 0x17
0x10019cc01: mov rcx, qword ptr [rip + 0xa70ca0] ; 0x100c0d8a8
0x10019cc08: mov rdi, rcx
0x10019cc0b: movzx esi, word ptr [rdi + rax*2]
0x10019cc0f: and edx, 0x7fffff
0x10019cc15: mov rcx, qword ptr [rip + 0xa70c94] ; 0x100c0d8b0
0x10019cc1c: mov rbx, rcx
0x10019cc1f: mov cl, byte ptr [rbx + rax]
0x10019cc22: shr edx, cl
0x10019cc24: add edx, esi
0x10019cc26: lea r15, [r15 + r15*2]
0x10019cc2a: shl r15, 4
0x10019cc2e: mov word ptr [r14 + r15 + 0x20], dx
0x10019cc34: vextractps eax, xmm0, 1
0x10019cc3a: mov ecx, eax
0x10019cc3c: shr ecx, 0x17
0x10019cc3f: movzx esi, word ptr [rdi + rcx*2]
0x10019cc43: and eax, 0x7fffff
0x10019cc48: mov cl, byte ptr [rbx + rcx]
0x10019cc4b: shr eax, cl
0x10019cc4d: add eax, esi
0x10019cc4f: mov word ptr [r14 + r15 + 0x22], ax
0x10019cc55: mov rbx, qword ptr [rsp]
0x10019cc59: mov rcx, qword ptr [rbx + 0x68]
0x10019cc5d: mov esi, edx
0x10019cc5f: shr esi, 0xa
0x10019cc62: and esi, 0x3f
0x10019cc65: lea rdi, [rip + 0x91b114] ; 0x100ab7d80
0x10019cc6c: mov r8, rdi
0x10019cc6f: movzx edi, word ptr [r8 + rsi*2]
0x10019cc74: and edx, 0x3ff
0x10019cc7a: add rdx, rdi
0x10019cc7d: mov esi, dword ptr [r12 + rsi*4]
0x10019cc81: add esi, dword ptr [r13 + rdx*4]
0x10019cc86: vmovd xmm0, esi
0x10019cc8a: vpermilps xmm0, xmm0, 0xc0
0x10019cc90: vmulps xmm1, xmm0, xmmword ptr [rcx + 0x10]
0x10019cc95: vaddps xmm1, xmm1, xmmword ptr [rcx]
0x10019cc99: mov edx, eax
0x10019cc9b: shr edx, 0xa
0x10019cc9e: and edx, 0x3f
0x10019cca1: movzx esi, word ptr [r8 + rdx*2]
0x10019cca6: and eax, 0x3ff
0x10019ccab: add rax, rsi
0x10019ccae: mov edx, dword ptr [r12 + rdx*4]
0x10019ccb2: add edx, dword ptr [r13 + rax*4]
0x10019ccb7: vmovd xmm2, edx
0x10019ccbb: vpermilps xmm2, xmm2, 0xc0
0x10019ccc1: vmulps xmm3, xmm2, xmmword ptr [rcx + 0x20]
0x10019ccc6: vaddps xmm3, xmm1, xmm3
0x10019ccca: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x10019ccd0: vmulps xmm0, xmm0, xmmword ptr [rcx + 0x50]
0x10019ccd5: vaddps xmm0, xmm0, xmmword ptr [rcx + 0x40]
0x10019ccda: vmulps xmm1, xmm2, xmmword ptr [rcx + 0x60]
0x10019ccdf: vaddps xmm0, xmm0, xmm1
0x10019cce3: vsubps xmm0, xmm0, xmm3
0x10019cce7: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x10019cced: vmulps xmm0, xmm0, xmm0
0x10019ccf1: vmovshdup xmm1, xmm0
0x10019ccf5: vaddss xmm1, xmm0, xmm1
0x10019ccf9: vpermilpd xmm0, xmm0, 1
0x10019ccff: vaddss xmm0, xmm0, xmm1
0x10019cd03: vsqrtss xmm0, xmm0, xmm0
0x10019cd07: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x10019cd0d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019cd12: vmovss xmm2, dword ptr [rip + 0x9083a6] ; 0x100aa50c0
0x10019cd1a: vcvtsi2ss xmm0, xmm4, eax
0x10019cd1e: vmulss xmm0, xmm0, dword ptr [rip + 0x90a3ca] ; 0x100aa70f0
0x10019cd26: vsubss xmm1, xmm2, xmm0
0x10019cd2a: vmulss xmm1, xmm1, dword ptr [rip + 0x90a3b2] ; 0x100aa70e4
0x10019cd32: vmulss xmm0, xmm0, dword ptr [rip + 0x90b936] ; 0x100aa8670
0x10019cd3a: vaddss xmm0, xmm0, xmm1
0x10019cd3e: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x10019cd44: vinsertps xmm0, xmm1, xmm0, 0x30
0x10019cd4a: vmovaps xmmword ptr [r14 + r15], xmm0
0x10019cd50: vmovaps xmm3, xmmword ptr [rsp + 0x60]
0x10019cd56: vpermilps xmm0, xmm3, 0xc0
0x10019cd5c: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x10019cd62: vdivps xmm0, xmm1, xmm0
0x10019cd66: vinsertps xmm0, xmm0, xmm3, 0x30
0x10019cd6c: vmovaps xmmword ptr [r14 + r15 + 0x10], xmm0
0x10019cd73: mov word ptr [r14 + r15 + 0x24], 0
0x10019cd7b: vmovss xmm0, dword ptr [rbx + 0x98]
0x10019cd83: vmovss xmm1, dword ptr [rip + 0x908339] ; 0x100aa50c4
0x10019cd8b: vaddss xmm0, xmm0, xmm1
0x10019cd8f: vmovss dword ptr [rbx + 0x98], xmm0
0x10019cd97: vucomiss xmm0, xmm2
0x10019cd9b: jae 0x10019cae0
0x10019cda1: jmp 0x10019cf3a ; 0x10019cf3a
0x10019cda6: cmp byte ptr [rbx + 0xd], 0
0x10019cdaa: je 0x10019c1f7
0x10019cdb0: cmp edi, 2
0x10019cdb3: jb 0x10019c1f7
0x10019cdb9: mov al, byte ptr [rbx + 0xc]
0x10019cdbc: test al, al
0x10019cdbe: je 0x10019c1f7
0x10019cdc4: mov qword ptr [rsp + 0x50], r13
0x10019cdc9: vmovss xmm0, dword ptr [rbx + 0x20]
0x10019cdce: vdivss xmm0, xmm0, dword ptr [rbx + 0x1c]
0x10019cdd3: vmovss xmm1, dword ptr [rbx + 0x80]
0x10019cddb: vdivss xmm0, xmm1, xmm0
0x10019cddf: vroundss xmm0, xmm0, xmm0, 0xa
0x10019cde5: vcvttss2si rcx, xmm0
0x10019cdea: mov eax, dword ptr [rbx + 0x18]
0x10019cded: mov qword ptr [rsp + 0x10], rcx
0x10019cdf2: cmp eax, ecx
0x10019cdf4: jae 0x10019d625
0x10019cdfa: lea r13, [rsp + 0x2f0]
0x10019ce02: lea r12, [rsp + 0x1a8]
0x10019ce0a: mov rax, qword ptr [rip + 0xa6d70f] ; 0x100c0a520
0x10019ce11: lea rcx, [rax + 0x18]
0x10019ce15: mov qword ptr [rsp + 0x1a0], rcx
0x10019ce1d: add rax, 0x40
0x10019ce21: mov qword ptr [rsp + 0x2f0], rax
0x10019ce29: mov rdi, r13
0x10019ce2c: mov rsi, r12
0x10019ce2f: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10019ce34: mov qword ptr [rsp + 0x378], 0
0x10019ce40: mov dword ptr [rsp + 0x380], 0xffffffff
0x10019ce4b: mov rbx, qword ptr [rip + 0xa70776] ; 0x100c0d5c8
0x10019ce52: lea r15, [rbx + 0x18]
0x10019ce56: mov qword ptr [rsp + 0x1a0], r15
0x10019ce5e: add rbx, 0x40
0x10019ce62: mov qword ptr [rsp + 0x2f0], rbx
0x10019ce6a: lea rsi, [rip + 0x9da771] ; 0x100b775e2 BirdFlock
0x10019ce71: mov edx, 1
0x10019ce76: mov rdi, r12
0x10019ce79: call 0x1007a56a0 ; 0x1007a56a0
0x10019ce7e: lea rsi, [rip + 0x9da81a] ; 0x100b7769f WARNING! This prepopulated rail would need 
0x10019ce85: lea rdi, [rsp + 0x1a0]
0x10019ce8d: mov edx, 0x2b
0x10019ce92: call 0x100011930 ; 0x100011930
0x10019ce97: mov rdi, rax
0x10019ce9a: mov rsi, qword ptr [rsp + 0x10]
0x10019ce9f: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10019cea4: lea rsi, [rip + 0x9da820] ; 0x100b776cb  birds to saturate, but maxInstances is only 
0x10019ceab: mov edx, 0x2d
0x10019ceb0: mov rdi, rax
0x10019ceb3: call 0x100011930 ; 0x100011930
0x10019ceb8: mov rcx, qword ptr [rsp]
0x10019cebc: mov esi, dword ptr [rcx + 0x18]
0x10019cebf: mov rdi, rax
0x10019cec2: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10019cec7: lea rsi, [rip + 0x9da82b] ; 0x100b776f9 . Birds will be more sparse than intended or patchy.
0x10019cece: mov edx, 0x34
0x10019ced3: mov rdi, rax
0x10019ced6: call 0x100011930 ; 0x100011930
0x10019cedb: mov qword ptr [rsp + 0x1a0], r15
0x10019cee3: mov qword ptr [rsp + 0x2f0], rbx
0x10019ceeb: mov rdi, r12
0x10019ceee: call 0x1007a58d0 ; 0x1007a58d0
0x10019cef3: mov rsi, qword ptr [rip + 0xa6d686] ; 0x100c0a580
0x10019cefa: add rsi, 8
0x10019cefe: lea rdi, [rsp + 0x1a0]
0x10019cf06: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10019cf0b: mov rdi, r13
0x10019cf0e: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10019cf13: mov rax, qword ptr [rsp]
0x10019cf17: mov eax, dword ptr [rax + 0x18]
0x10019cf1a: mov qword ptr [rsp + 0x10], rax
0x10019cf1f: jmp 0x10019d74a ; 0x10019d74a
0x10019cf24: xor eax, eax
0x10019cf26: cmp byte ptr [rbx + 0xc], 0
0x10019cf2a: jne 0x10019ca90
0x10019cf30: mov dword ptr [rbx + 0x98], 0
0x10019cf3a: mov r12, qword ptr [rsp + 0x28]
0x10019cf3f: mov rax, qword ptr [r12 + 0x5c8]
0x10019cf47: mov rdi, qword ptr [rax + 0x10]
0x10019cf4b: mov rax, qword ptr [rdi]
0x10019cf4e: call qword ptr [rax + 0xc8]
0x10019cf54: mov ecx, dword ptr [rax + 0x1ac]
0x10019cf5a: test ecx, ecx
0x10019cf5c: je 0x10019cf86
0x10019cf5e: mov edx, dword ptr [rax + 0x1a0]
0x10019cf64: mov r14, rax
0x10019cf67: add r14, 0x20
0x10019cf6b: xor esi, esi
0x10019cf6d: nop dword ptr [rax]
0x10019cf70: cmp byte ptr [rax + rsi], 0x12
0x10019cf74: jne 0x10019cf7b
0x10019cf76: bt edx, esi
0x10019cf79: jb 0x10019cf89
0x10019cf7b: inc rsi
0x10019cf7e: add r14, 4
0x10019cf82: cmp ecx, esi
0x10019cf84: ja 0x10019cf70
0x10019cf86: xor r14d, r14d
0x10019cf89: cmp byte ptr [rbx + 0xc], 0
0x10019cf8d: je 0x10019d12d
0x10019cf93: mov rdi, qword ptr [rbx + 0x10]
0x10019cf97: test rdi, rdi
0x10019cf9a: je 0x10019d12d
0x10019cfa0: movzx eax, byte ptr [rbx + 0x28]
0x10019cfa4: mov rcx, rax
0x10019cfa7: shr rcx, 1
0x10019cfaa: test al, 1
0x10019cfac: cmovne rcx, qword ptr [rbx + 0x30]
0x10019cfb1: test rcx, rcx
0x10019cfb4: je 0x10019d55d
0x10019cfba: mov rax, qword ptr [r12 + 0x5c8]
0x10019cfc2: vmovaps xmm0, xmmword ptr [rax + 0x30]
0x10019cfc7: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x10019cfd0: lea rsi, [rsp + 0xc0]
0x10019cfd8: lea rdx, [rsp + 0xd0]
0x10019cfe0: call 0x10055d820 ; 0x10055d820
0x10019cfe5: vmovaps xmm1, xmmword ptr [rsp + 0xc0]
0x10019cfee: vmovaps xmm0, xmmword ptr [rsp + 0xd0]
0x10019cff7: vsubps xmm1, xmm1, xmm0
0x10019cffb: vmulps xmm1, xmm1, xmm1
0x10019cfff: vmovshdup xmm2, xmm1
0x10019d003: vaddss xmm2, xmm1, xmm2
0x10019d007: vpermilpd xmm1, xmm1, 1
0x10019d00d: vaddss xmm1, xmm1, xmm2
0x10019d011: vsqrtss xmm1, xmm1, xmm1
0x10019d015: vaddss xmm1, xmm1, dword ptr [rip + 0x90b647] ; 0x100aa8664
0x10019d01d: vmulss xmm1, xmm1, dword ptr [rip + 0x90b623] ; 0x100aa8648
0x10019d025: vxorps xmm2, xmm2, xmm2
0x10019d029: vmaxss xmm1, xmm2, xmm1
0x10019d02d: vmovss xmm3, dword ptr [rip + 0x90808b] ; 0x100aa50c0
0x10019d035: vminss xmm1, xmm3, xmm1
0x10019d039: vsubss xmm3, xmm3, xmm1
0x10019d03d: vmulss xmm3, xmm3, dword ptr [rip + 0x90a0a3] ; 0x100aa70e8
0x10019d045: vmulss xmm1, xmm1, xmm2
0x10019d049: vaddss xmm1, xmm1, xmm3
0x10019d04d: vmovss dword ptr [rsp + 0x50], xmm1
0x10019d053: mov rcx, qword ptr [rsp]
0x10019d057: mov rax, qword ptr [rcx + 0x58]
0x10019d05b: test rax, rax
0x10019d05e: je 0x10019d069
0x10019d060: mov eax, dword ptr [rax + 0x10]
0x10019d063: mov dword ptr [rcx + 0xc0], eax
0x10019d069: vxorps ymm1, ymm1, ymm1
0x10019d06d: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10019d076: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10019d07f: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10019d088: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10019d091: mov byte ptr [rsp + 0x12d], 1
0x10019d099: mov dword ptr [rsp + 0x120], 0x3f800000
0x10019d0a4: vmovaps xmmword ptr [rsp + 0x130], xmm0
0x10019d0ad: mov rax, qword ptr [rcx + 0x60]
0x10019d0b1: mov qword ptr [rsp + 0x168], rax
0x10019d0b9: vmovss xmm0, dword ptr [rsp + 0x50]
0x10019d0bf: vmovss dword ptr [rsp + 0x164], xmm0
0x10019d0c8: mov dword ptr [rsp + 0x190], 0xe31
0x10019d0d3: mov rdi, qword ptr [rcx + 0xa8]
0x10019d0da: test rdi, rdi
0x10019d0dd: mov rbx, rcx
0x10019d0e0: je 0x10019d110
0x10019d0e2: mov r15, qword ptr [rbx + 0xb0]
0x10019d0e9: test r15, r15
0x10019d0ec: je 0x10019d110
0x10019d0ee: mov rax, qword ptr [rdi]
0x10019d0f1: vzeroupper 
0x10019d0f4: call qword ptr [rax]
0x10019d0f6: cmp r15, rax
0x10019d0f9: jne 0x10019d110
0x10019d0fb: mov rdi, qword ptr [rbx + 0xa8]
0x10019d102: mov rax, qword ptr [rdi]
0x10019d105: call qword ptr [rax + 0x10]
0x10019d108: test al, al
0x10019d10a: jne 0x10019d27b
0x10019d110: lea rsi, [rbx + 0x28]
0x10019d114: mov rdi, qword ptr [r12 + 0x5c8]
0x10019d11c: test byte ptr [rsi], 1
0x10019d11f: jne 0x10019d1cf
0x10019d125: inc rsi
0x10019d128: jmp 0x10019d1d3 ; 0x10019d1d3
0x10019d12d: mov rdi, qword ptr [rbx + 0xa8]
0x10019d134: test rdi, rdi
0x10019d137: je 0x10019d55d
0x10019d13d: mov rax, qword ptr [rsp]
0x10019d141: mov rbx, qword ptr [rax + 0xb0]
0x10019d148: test rbx, rbx
0x10019d14b: je 0x10019d55d
0x10019d151: mov rax, qword ptr [rdi]
0x10019d154: call qword ptr [rax]
0x10019d156: cmp rbx, rax
0x10019d159: jne 0x10019d55d
0x10019d15f: mov rax, qword ptr [rsp]
0x10019d163: mov rdi, qword ptr [rax + 0xa8]
0x10019d16a: mov rax, qword ptr [rdi]
0x10019d16d: call qword ptr [rax + 0x10]
0x10019d170: test al, al
0x10019d172: je 0x10019d55d
0x10019d178: mov rax, qword ptr [rsp]
0x10019d17c: mov rdi, qword ptr [rax + 0xa8]
0x10019d183: test rdi, rdi
0x10019d186: je 0x10019d55d
0x10019d18c: mov rax, qword ptr [rsp]
0x10019d190: mov rbx, qword ptr [rax + 0xb0]
0x10019d197: test rbx, rbx
0x10019d19a: je 0x10019d55d
0x10019d1a0: mov rax, qword ptr [rdi]
0x10019d1a3: call qword ptr [rax]
0x10019d1a5: cmp rbx, rax
0x10019d1a8: jne 0x10019d55d
0x10019d1ae: mov rax, qword ptr [rsp]
0x10019d1b2: mov rdi, qword ptr [rax + 0xa8]
0x10019d1b9: mov rax, qword ptr [rdi]
0x10019d1bc: xor esi, esi
0x10019d1be: call qword ptr [rax + 0x30]
0x10019d1c1: test r14, r14
0x10019d1c4: jne 0x10019d566
0x10019d1ca: jmp 0x10019d5fb ; 0x10019d5fb
0x10019d1cf: mov rsi, qword ptr [rbx + 0x38]
0x10019d1d3: vxorps ymm0, ymm0, ymm0
0x10019d1d7: vmovups ymmword ptr [rsp + 0x330], ymm0
0x10019d1e0: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10019d1e9: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10019d1f2: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10019d1fb: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10019d204: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10019d20d: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10019d216: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10019d21f: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10019d228: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10019d231: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10019d23a: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10019d243: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10019d24c: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10019d255: lea rdx, [rsp + 0x120]
0x10019d25d: lea rcx, [rsp + 0x1a0]
0x10019d265: vzeroupper 
0x10019d268: call 0x1006018a0 ; 0x1006018a0
0x10019d26d: mov qword ptr [rbx + 0xa8], rax
0x10019d274: mov qword ptr [rbx + 0xb0], rdx
0x10019d27b: vxorps ymm0, ymm0, ymm0
0x10019d27f: vmovups ymmword ptr [rsp + 0x32c], ymm0
0x10019d288: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10019d291: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10019d29a: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10019d2a3: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10019d2ac: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10019d2b5: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10019d2be: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10019d2c7: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10019d2d0: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10019d2d9: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10019d2e2: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10019d2eb: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10019d2f4: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10019d2fd: mov eax, dword ptr [rbx + 0x1c]
0x10019d300: mov byte ptr [rsp + 0x1a0], 0x5c
0x10019d308: mov dword ptr [rsp + 0x1c0], eax
0x10019d30f: mov dword ptr [rsp + 0x340], 1
0x10019d31a: mov dword ptr [rsp + 0x34c], 1
0x10019d325: mov rdi, qword ptr [rbx + 0xa8]
0x10019d32c: test rdi, rdi
0x10019d32f: je 0x10019d36d
0x10019d331: mov r15, qword ptr [rbx + 0xb0]
0x10019d338: test r15, r15
0x10019d33b: je 0x10019d36d
0x10019d33d: mov rax, qword ptr [rdi]
0x10019d340: vzeroupper 
0x10019d343: call qword ptr [rax]
0x10019d345: vxorps ymm0, ymm0, ymm0
0x10019d349: cmp r15, rax
0x10019d34c: jne 0x10019d36d
0x10019d34e: mov rdi, qword ptr [rbx + 0xa8]
0x10019d355: mov rax, qword ptr [rdi]
0x10019d358: lea rsi, [rsp + 0x1a0]
0x10019d360: vzeroupper 
0x10019d363: call qword ptr [rax + 0x88]
0x10019d369: vxorps ymm0, ymm0, ymm0
0x10019d36d: vmovups ymmword ptr [rsp + 0x32c], ymm0
0x10019d376: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10019d37f: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10019d388: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10019d391: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10019d39a: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10019d3a3: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10019d3ac: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10019d3b5: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10019d3be: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10019d3c7: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10019d3d0: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10019d3d9: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10019d3e2: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10019d3eb: mov eax, dword ptr [rbx + 0xc0]
0x10019d3f1: mov byte ptr [rsp + 0x1a0], 0x43
0x10019d3f9: mov dword ptr [rsp + 0x1c0], eax
0x10019d400: mov dword ptr [rsp + 0x340], 1
0x10019d40b: mov dword ptr [rsp + 0x34c], 1
0x10019d416: mov rdi, qword ptr [rbx + 0xa8]
0x10019d41d: test rdi, rdi
0x10019d420: je 0x10019d453
0x10019d422: mov r15, qword ptr [rbx + 0xb0]
0x10019d429: test r15, r15
0x10019d42c: je 0x10019d453
0x10019d42e: mov rax, qword ptr [rdi]
0x10019d431: vzeroupper 
0x10019d434: call qword ptr [rax]
0x10019d436: cmp r15, rax
0x10019d439: jne 0x10019d453
0x10019d43b: mov rdi, qword ptr [rbx + 0xa8]
0x10019d442: mov rax, qword ptr [rdi]
0x10019d445: lea rsi, [rsp + 0x1a0]
0x10019d44d: call qword ptr [rax + 0x88]
0x10019d453: vxorps ymm1, ymm1, ymm1
0x10019d457: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10019d460: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10019d469: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10019d472: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10019d47b: vmovaps xmm0, xmmword ptr [rsp + 0xd0]
0x10019d484: vmovaps xmmword ptr [rsp + 0x1b0], xmm0
0x10019d48d: mov dword ptr [rsp + 0x210], 0x20
0x10019d498: mov rdi, qword ptr [rbx + 0xa8]
0x10019d49f: test rdi, rdi
0x10019d4a2: je 0x10019d4dd
0x10019d4a4: mov r15, qword ptr [rbx + 0xb0]
0x10019d4ab: test r15, r15
0x10019d4ae: je 0x10019d4dd
0x10019d4b0: mov rax, qword ptr [rdi]
0x10019d4b3: vzeroupper 
0x10019d4b6: call qword ptr [rax]
0x10019d4b8: vxorps ymm1, ymm1, ymm1
0x10019d4bc: cmp r15, rax
0x10019d4bf: jne 0x10019d4dd
0x10019d4c1: mov rdi, qword ptr [rbx + 0xa8]
0x10019d4c8: mov rax, qword ptr [rdi]
0x10019d4cb: lea rsi, [rsp + 0x1a0]
0x10019d4d3: vzeroupper 
0x10019d4d6: call qword ptr [rax + 0x68]
0x10019d4d9: vxorps ymm1, ymm1, ymm1
0x10019d4dd: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10019d4e6: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10019d4ef: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10019d4f8: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10019d501: vmovss xmm0, dword ptr [rsp + 0x50]
0x10019d507: vmovss dword ptr [rsp + 0x1e4], xmm0
0x10019d510: mov dword ptr [rsp + 0x210], 0x200
0x10019d51b: mov rdi, qword ptr [rbx + 0xa8]
0x10019d522: test rdi, rdi
0x10019d525: je 0x10019d55d
0x10019d527: mov rax, qword ptr [rsp]
0x10019d52b: mov rbx, qword ptr [rax + 0xb0]
0x10019d532: test rbx, rbx
0x10019d535: je 0x10019d55d
0x10019d537: mov rax, qword ptr [rdi]
0x10019d53a: vzeroupper 
0x10019d53d: call qword ptr [rax]
0x10019d53f: cmp rbx, rax
0x10019d542: jne 0x10019d55d
0x10019d544: mov rax, qword ptr [rsp]
0x10019d548: mov rdi, qword ptr [rax + 0xa8]
0x10019d54f: mov rax, qword ptr [rdi]
0x10019d552: lea rsi, [rsp + 0x1a0]
0x10019d55a: call qword ptr [rax + 0x68]
0x10019d55d: test r14, r14
0x10019d560: je 0x10019d5fb
0x10019d566: vmovss xmm0, dword ptr [r14]
0x10019d56b: vcvtss2sd xmm0, xmm0, xmm0
0x10019d56f: mov rbx, qword ptr [rsp]
0x10019d573: vmovsd xmm1, qword ptr [rbx + 0xb8]
0x10019d57b: vucomisd xmm1, xmm0
0x10019d57f: jne 0x10019d583
0x10019d581: jnp 0x10019d5ea
0x10019d583: mov rdi, qword ptr [rbx + 0xa8]
0x10019d58a: test rdi, rdi
0x10019d58d: je 0x10019d5ea
0x10019d58f: mov r15, qword ptr [rbx + 0xb0]
0x10019d596: test r15, r15
0x10019d599: je 0x10019d5ea
0x10019d59b: mov rax, qword ptr [rdi]
0x10019d59e: vzeroupper 
0x10019d5a1: call qword ptr [rax]
0x10019d5a3: cmp r15, rax
0x10019d5a6: jne 0x10019d5ea
0x10019d5a8: mov rdi, qword ptr [rbx + 0xa8]
0x10019d5af: mov rax, qword ptr [rdi]
0x10019d5b2: call qword ptr [rax + 0x10]
0x10019d5b5: test al, al
0x10019d5b7: je 0x10019d5ea
0x10019d5b9: mov rdi, qword ptr [rbx + 0xa8]
0x10019d5c0: test rdi, rdi
0x10019d5c3: je 0x10019d5ea
0x10019d5c5: mov r15, qword ptr [rbx + 0xb0]
0x10019d5cc: test r15, r15
0x10019d5cf: je 0x10019d5ea
0x10019d5d1: mov rax, qword ptr [rdi]
0x10019d5d4: call qword ptr [rax]
0x10019d5d6: cmp r15, rax
0x10019d5d9: jne 0x10019d5ea
0x10019d5db: mov rdi, qword ptr [rbx + 0xa8]
0x10019d5e2: mov rax, qword ptr [rdi]
0x10019d5e5: xor esi, esi
0x10019d5e7: call qword ptr [rax + 0x30]
0x10019d5ea: vmovss xmm0, dword ptr [r14]
0x10019d5ef: vcvtss2sd xmm0, xmm0, xmm0
0x10019d5f3: vmovsd qword ptr [rbx + 0xb8], xmm0
0x10019d5fb: mov rax, qword ptr [rip + 0xa702d6] ; 0x100c0d8d8
0x10019d602: mov rax, qword ptr [rax]
0x10019d605: cmp rax, qword ptr [rsp + 0x3a0]
0x10019d60d: jne 0x10019db89
0x10019d613: lea rsp, [rbp - 0x28]
0x10019d617: pop rbx
0x10019d618: pop r12
0x10019d61a: pop r13
0x10019d61c: pop r14
0x10019d61e: pop r15
0x10019d620: pop rbp
0x10019d621: vzeroupper 
0x10019d624: ret 
0x10019d625: shr eax, 1
0x10019d627: cmp eax, dword ptr [rsp + 0x10]
0x10019d62b: jbe 0x10019d74a
0x10019d631: lea r13, [rsp + 0x2f0]
0x10019d639: lea r12, [rsp + 0x1a8]
0x10019d641: mov rax, qword ptr [rip + 0xa6ced8] ; 0x100c0a520
0x10019d648: lea rcx, [rax + 0x18]
0x10019d64c: mov qword ptr [rsp + 0x1a0], rcx
0x10019d654: add rax, 0x40
0x10019d658: mov qword ptr [rsp + 0x2f0], rax
0x10019d660: mov rdi, r13
0x10019d663: mov rsi, r12
0x10019d666: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10019d66b: mov qword ptr [rsp + 0x378], 0
0x10019d677: mov dword ptr [rsp + 0x380], 0xffffffff
0x10019d682: mov rbx, qword ptr [rip + 0xa6ff3f] ; 0x100c0d5c8
0x10019d689: lea r15, [rbx + 0x18]
0x10019d68d: mov qword ptr [rsp + 0x1a0], r15
0x10019d695: add rbx, 0x40
0x10019d699: mov qword ptr [rsp + 0x2f0], rbx
0x10019d6a1: lea rsi, [rip + 0x9d9f3a] ; 0x100b775e2 BirdFlock
0x10019d6a8: mov edx, 1
0x10019d6ad: mov rdi, r12
0x10019d6b0: call 0x1007a56a0 ; 0x1007a56a0
0x10019d6b5: lea rsi, [rip + 0x9da072] ; 0x100b7772e WARNING! This prepopulated rail is allocating for 
0x10019d6bc: lea rdi, [rsp + 0x1a0]
0x10019d6c4: mov edx, 0x32
0x10019d6c9: call 0x100011930 ; 0x100011930
0x10019d6ce: mov rcx, qword ptr [rsp]
0x10019d6d2: mov esi, dword ptr [rcx + 0x18]
0x10019d6d5: mov rdi, rax
0x10019d6d8: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10019d6dd: lea rsi, [rip + 0x9da07d] ; 0x100b77761  maxInstances, but will probably only need around 
0x10019d6e4: mov edx, 0x32
0x10019d6e9: mov rdi, rax
0x10019d6ec: call 0x100011930 ; 0x100011930
0x10019d6f1: mov rdi, rax
0x10019d6f4: mov rsi, qword ptr [rsp + 0x10]
0x10019d6f9: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10019d6fe: lea rsi, [rip + 0x9da08f] ; 0x100b77794 . Much waste. Many bytes.
0x10019d705: mov edx, 0x19
0x10019d70a: mov rdi, rax
0x10019d70d: call 0x100011930 ; 0x100011930
0x10019d712: mov qword ptr [rsp + 0x1a0], r15
0x10019d71a: mov qword ptr [rsp + 0x2f0], rbx
0x10019d722: mov rdi, r12
0x10019d725: call 0x1007a58d0 ; 0x1007a58d0
0x10019d72a: mov rsi, qword ptr [rip + 0xa6ce4f] ; 0x100c0a580
0x10019d731: add rsi, 8
0x10019d735: lea rdi, [rsp + 0x1a0]
0x10019d73d: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10019d742: mov rdi, r13
0x10019d745: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10019d74a: cmp dword ptr [rsp + 0x10], 0
0x10019d74f: mov rbx, qword ptr [rsp]
0x10019d753: mov r15, qword ptr [rsp + 0x28]
0x10019d758: mov r13, qword ptr [rsp + 0x50]
0x10019d75d: je 0x10019c1f7
0x10019d763: mov rax, qword ptr [rbx + 0x68]
0x10019d767: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x10019d76c: vsubps xmm0, xmm0, xmmword ptr [rax]
0x10019d770: vmulps xmm0, xmm0, xmm0
0x10019d774: vmovss xmm1, dword ptr [rbx + 0x80]
0x10019d77c: mov rax, qword ptr [rsp + 0x10]
0x10019d781: lea eax, [rax - 1]
0x10019d784: vcvtsi2ss xmm2, xmm9, rax
0x10019d789: vdivss xmm1, xmm1, xmm2
0x10019d78d: vmovss dword ptr [rsp + 0x8c], xmm1
0x10019d796: vpermilpd xmm1, xmm0, 1
0x10019d79c: vmovshdup xmm2, xmm0
0x10019d7a0: vaddss xmm0, xmm0, xmm2
0x10019d7a4: vaddss xmm0, xmm1, xmm0
0x10019d7a8: vsqrtss xmm0, xmm0, xmm0
0x10019d7ac: vmovss dword ptr [rsp + 0xc], xmm0
0x10019d7b2: xor eax, eax
0x10019d7b4: mov qword ptr [rsp + 0x90], rax
0x10019d7bc: vxorps xmm0, xmm0, xmm0
0x10019d7c0: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10019d7c6: mov r14, qword ptr [rsp]
0x10019d7ca: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10019d7d0: vblendps xmm0, xmm0, xmmword ptr [rip + 0x906dc6], 7 ; 0x100aa45a0
0x10019d7da: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10019d7e0: mov r12, qword ptr [rbx + 0x88]
0x10019d7e7: mov r15d, dword ptr [rbx + 0x94]
0x10019d7ee: lea eax, [r15 + 1]
0x10019d7f2: mov dword ptr [rbx + 0x94], eax
0x10019d7f8: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019d7fd: vcvtsi2ss xmm0, xmm6, eax
0x10019d801: vmovss xmm1, dword ptr [rip + 0x9098e7] ; 0x100aa70f0
0x10019d809: vmulss xmm0, xmm0, xmm1
0x10019d80d: vmovss xmm1, dword ptr [rip + 0x9078ab] ; 0x100aa50c0
0x10019d815: vsubss xmm1, xmm0, xmm1
0x10019d819: vaddss xmm0, xmm0, xmm1
0x10019d81d: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x10019d823: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019d828: vcvtsi2ss xmm0, xmm6, eax
0x10019d82c: vmulss xmm0, xmm0, dword ptr [rip + 0x9098bc] ; 0x100aa70f0
0x10019d834: vsubss xmm1, xmm0, dword ptr [rip + 0x907884] ; 0x100aa50c0
0x10019d83c: vaddss xmm0, xmm0, xmm1
0x10019d840: vmovaps xmm1, xmmword ptr [rsp + 0x70]
0x10019d846: vinsertps xmm0, xmm1, xmm0, 0x1c
0x10019d84c: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x10019d852: vinsertps xmm1, xmm0, xmm1, 0xf4
0x10019d858: vmovaps xmmword ptr [rsp + 0x60], xmm1
0x10019d85e: vmulps xmm1, xmm1, xmm1
0x10019d862: vmovshdup xmm2, xmm1
0x10019d866: vaddss xmm2, xmm1, xmm2
0x10019d86a: vpermilpd xmm1, xmm1, 1
0x10019d870: vaddss xmm1, xmm1, xmm2
0x10019d874: vsqrtss xmm1, xmm1, xmm1
0x10019d878: vucomiss xmm1, dword ptr [rip + 0x90a044] ; 0x100aa78c4
0x10019d880: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10019d886: jbe 0x10019d892
0x10019d888: vpermilps xmm1, xmm1, 0xc0
0x10019d88e: vdivps xmm2, xmm0, xmm1
0x10019d892: vmovaps xmmword ptr [rsp + 0x70], xmm2
0x10019d898: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019d89d: vcvtsi2ss xmm0, xmm6, eax
0x10019d8a1: vmovss xmm1, dword ptr [rip + 0x909847] ; 0x100aa70f0
0x10019d8a9: vmulss xmm0, xmm0, xmm1
0x10019d8ad: vmovss xmm1, dword ptr [rip + 0x90780b] ; 0x100aa50c0
0x10019d8b5: vsubss xmm1, xmm1, xmm0
0x10019d8b9: vxorps xmm2, xmm2, xmm2
0x10019d8bd: vmulss xmm1, xmm1, xmm2
0x10019d8c1: vaddss xmm0, xmm0, xmm1
0x10019d8c5: vpermilps xmm0, xmm0, 0xc0
0x10019d8cb: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x70]
0x10019d8d1: vextractps edx, xmm0, 0
0x10019d8d7: mov eax, edx
0x10019d8d9: shr eax, 0x17
0x10019d8dc: mov rcx, qword ptr [rip + 0xa6ffc5] ; 0x100c0d8a8
0x10019d8e3: mov rdi, rcx
0x10019d8e6: movzx esi, word ptr [rdi + rax*2]
0x10019d8ea: and edx, 0x7fffff
0x10019d8f0: mov rcx, qword ptr [rip + 0xa6ffb9] ; 0x100c0d8b0
0x10019d8f7: mov r8, rcx
0x10019d8fa: movzx ecx, byte ptr [r8 + rax]
0x10019d8ff: shr edx, cl
0x10019d901: add edx, esi
0x10019d903: lea r13, [r15 + r15*2]
0x10019d907: shl r13, 4
0x10019d90b: mov word ptr [r12 + r13 + 0x20], dx
0x10019d911: vextractps r10d, xmm0, 1
0x10019d917: mov ecx, r10d
0x10019d91a: shr ecx, 0x17
0x10019d91d: movzx esi, word ptr [rdi + rcx*2]
0x10019d921: and r10d, 0x7fffff
0x10019d928: movzx ecx, byte ptr [r8 + rcx]
0x10019d92d: shr r10d, cl
0x10019d930: add r10d, esi
0x10019d933: mov word ptr [r12 + r13 + 0x22], r10w
0x10019d939: mov rcx, qword ptr [r14 + 0x68]
0x10019d93d: mov esi, edx
0x10019d93f: shr esi, 0xa
0x10019d942: and esi, 0x3f
0x10019d945: lea rdi, [rip + 0x91a434] ; 0x100ab7d80
0x10019d94c: mov r8, rdi
0x10019d94f: movzx edi, word ptr [r8 + rsi*2]
0x10019d954: and edx, 0x3ff
0x10019d95a: add rdx, rdi
0x10019d95d: mov r15, qword ptr [rsp + 0x90]
0x10019d965: mov edi, r15d
0x10019d968: lea rbx, [rip + 0x91a311] ; 0x100ab7c80
0x10019d96f: mov r9, rbx
0x10019d972: mov esi, dword ptr [r9 + rsi*4]
0x10019d976: lea rbx, [rip + 0x918303] ; 0x100ab5c80
0x10019d97d: add esi, dword ptr [rbx + rdx*4]
0x10019d980: vmovd xmm0, esi
0x10019d984: mov edx, r10d
0x10019d987: shr edx, 0xa
0x10019d98a: and edx, 0x3f
0x10019d98d: movzx esi, word ptr [r8 + rdx*2]
0x10019d992: and r10d, 0x3ff
0x10019d999: add r10, rsi
0x10019d99c: lea eax, [r15 + 1]
0x10019d9a0: mov esi, dword ptr [r9 + rdx*4]
0x10019d9a4: add esi, dword ptr [rbx + r10*4]
0x10019d9a8: xor edx, edx
0x10019d9aa: vmovd xmm1, esi
0x10019d9ae: mov dword ptr [rsp + 0x80], eax
0x10019d9b5: div dword ptr [r14 + 0x70]
0x10019d9b9: shl rdi, 6
0x10019d9bd: vpermilps xmm0, xmm0, 0xc0
0x10019d9c3: vmulps xmm2, xmm0, xmmword ptr [rcx + rdi + 0x10]
0x10019d9c9: vaddps xmm2, xmm2, xmmword ptr [rcx + rdi]
0x10019d9ce: vpermilps xmm1, xmm1, 0xc0
0x10019d9d4: vmulps xmm3, xmm1, xmmword ptr [rcx + rdi + 0x20]
0x10019d9da: shl rdx, 6
0x10019d9de: vmulps xmm0, xmm0, xmmword ptr [rcx + rdx + 0x10]
0x10019d9e4: vaddps xmm0, xmm0, xmmword ptr [rcx + rdx]
0x10019d9e9: vmulps xmm1, xmm1, xmmword ptr [rcx + rdx + 0x20]
0x10019d9ef: vaddps xmm2, xmm2, xmm3
0x10019d9f3: vmovaps xmmword ptr [rsp + 0xb0], xmm2
0x10019d9fc: vaddps xmm0, xmm0, xmm1
0x10019da00: vsubps xmm0, xmm0, xmm2
0x10019da04: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x10019da0a: vmulps xmm0, xmm0, xmm0
0x10019da0e: vmovshdup xmm1, xmm0
0x10019da12: vaddss xmm1, xmm0, xmm1
0x10019da16: vpermilpd xmm0, xmm0, 1
0x10019da1c: vaddss xmm0, xmm0, xmm1
0x10019da20: vsqrtss xmm0, xmm0, xmm0
0x10019da24: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10019da2d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10019da32: vcvtsi2ss xmm0, xmm4, eax
0x10019da36: vmulss xmm0, xmm0, dword ptr [rip + 0x9096b2] ; 0x100aa70f0
0x10019da3e: vmovss xmm1, dword ptr [rip + 0x90767a] ; 0x100aa50c0
0x10019da46: vsubss xmm1, xmm1, xmm0
0x10019da4a: vxorps xmm5, xmm5, xmm5
0x10019da4e: vmulss xmm1, xmm1, xmm5
0x10019da52: vmulss xmm0, xmm0, dword ptr [rip + 0x90ac16] ; 0x100aa8670
0x10019da5a: vaddss xmm0, xmm0, xmm1
0x10019da5e: vmovaps xmm1, xmmword ptr [rsp + 0xb0]
0x10019da67: vinsertps xmm0, xmm1, xmm0, 0x30
0x10019da6d: vmovaps xmm3, xmmword ptr [rsp + 0xa0]
0x10019da76: vpermilps xmm1, xmm3, 0xc0
0x10019da7c: vmovaps xmm2, xmmword ptr [rsp + 0x70]
0x10019da82: vdivps xmm1, xmm2, xmm1
0x10019da86: vinsertps xmm1, xmm1, xmm3, 0x30
0x10019da8c: vmovaps xmmword ptr [r12 + r13 + 0x10], xmm1
0x10019da93: mov word ptr [r12 + r13 + 0x24], r15w
0x10019da99: vmovaps xmm4, xmmword ptr [rsp + 0x30]
0x10019da9f: vpermilps xmm2, xmm4, 0xc0
0x10019daa5: vmulps xmm1, xmm2, xmm1
0x10019daa9: vmovss xmm2, dword ptr [r12 + r13 + 0x1c]
0x10019dab0: vmovss xmm3, dword ptr [rip + 0x906b00] ; 0x100aa45b8
0x10019dab8: vaddss xmm3, xmm3, dword ptr [r12 + r13 + 0x14]
0x10019dabf: vmulss xmm3, xmm3, dword ptr [rip + 0x90962d] ; 0x100aa70f4
0x10019dac7: vmulss xmm3, xmm4, xmm3
0x10019dacb: vmaxss xmm3, xmm5, xmm3
0x10019dacf: vmulss xmm3, xmm3, dword ptr [rip + 0x908fd1] ; 0x100aa6aa8
0x10019dad7: vinsertps xmm1, xmm1, xmm3, 0x30
0x10019dadd: vaddps xmm0, xmm0, xmm1
0x10019dae1: vmovaps xmmword ptr [r12 + r13], xmm0
0x10019dae7: vsubss xmm0, xmm2, xmm4
0x10019daeb: vmovss dword ptr [r12 + r13 + 0x1c], xmm0
0x10019daf2: mov rbx, r14
0x10019daf5: vaddss xmm4, xmm4, dword ptr [rsp + 0x8c]
0x10019dafe: vucomiss xmm4, dword ptr [rsp + 0xc]
0x10019db04: jb 0x10019db62
0x10019db06: mov ecx, dword ptr [rbx + 0x70]
0x10019db09: xor edx, edx
0x10019db0b: mov eax, dword ptr [rsp + 0x80]
0x10019db12: div ecx
0x10019db14: mov edi, edx
0x10019db16: mov rsi, qword ptr [rbx + 0x68]
0x10019db1a: lea eax, [rdi + 1]
0x10019db1d: xor edx, edx
0x10019db1f: div ecx
0x10019db21: shl rdx, 6
0x10019db25: mov rax, rdi
0x10019db28: mov qword ptr [rsp + 0x90], rax
0x10019db30: shl rdi, 6
0x10019db34: vmovaps xmm0, xmmword ptr [rsi + rdx]
0x10019db39: vsubps xmm0, xmm0, xmmword ptr [rsi + rdi]
0x10019db3e: vmulps xmm0, xmm0, xmm0
0x10019db42: vmovshdup xmm1, xmm0
0x10019db46: vaddss xmm1, xmm0, xmm1
0x10019db4a: vpermilpd xmm0, xmm0, 1
0x10019db50: vaddss xmm0, xmm0, xmm1
0x10019db54: vsqrtss xmm0, xmm0, xmm0
0x10019db58: vmovss dword ptr [rsp + 0xc], xmm0
0x10019db5e: vxorps xmm4, xmm4, xmm4
0x10019db62: vmovaps xmmword ptr [rsp + 0x30], xmm4
0x10019db68: mov rax, qword ptr [rsp + 0x10]
0x10019db6d: dec eax
0x10019db6f: mov qword ptr [rsp + 0x10], rax
0x10019db74: mov r15, qword ptr [rsp + 0x28]
0x10019db79: mov r13, qword ptr [rsp + 0x50]
0x10019db7e: jne 0x10019d7ca
0x10019db84: jmp 0x10019c1f7 ; 0x10019c1f7
0x10019db89: vzeroupper 
0x10019db8c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10019db91: jmp 0x10019db98 ; 0x10019db98
0x10019db93: mov r14, rax
0x10019db96: jmp 0x10019dbd7 ; 0x10019dbd7
0x10019db98: mov r14, rax
0x10019db9b: jmp 0x10019dbbf ; 0x10019dbbf
0x10019db9d: mov r14, rax
0x10019dba0: jmp 0x10019dbd7 ; 0x10019dbd7
0x10019dba2: jmp 0x10019dba4 ; 0x10019dba4
0x10019dba4: mov r14, rax
0x10019dba7: mov qword ptr [rsp + 0x1a0], r15
0x10019dbaf: mov qword ptr [rsp + 0x2f0], rbx
0x10019dbb7: mov rdi, r12
0x10019dbba: call 0x1007a58d0 ; 0x1007a58d0
0x10019dbbf: mov rsi, qword ptr [rip + 0xa6c9ba] ; 0x100c0a580
0x10019dbc6: add rsi, 8
0x10019dbca: lea rdi, [rsp + 0x1a0]
0x10019dbd2: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10019dbd7: mov rdi, r13
0x10019dbda: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10019dbdf: mov rdi, r14
0x10019dbe2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10019dbe7: nop word ptr [rax + rax]
