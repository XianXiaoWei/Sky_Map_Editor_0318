0x1005abf50: push rbp
0x1005abf51: mov rbp, rsp
0x1005abf54: push r15
0x1005abf56: push r14
0x1005abf58: push r13
0x1005abf5a: push r12
0x1005abf5c: push rbx
0x1005abf5d: and rsp, 0xffffffffffffffe0
0x1005abf61: sub rsp, 0x1a0
0x1005abf68: mov rbx, rsi
0x1005abf6b: mov rax, qword ptr [rip + 0x661966] ; 0x100c0d8d8
0x1005abf72: mov rax, qword ptr [rax]
0x1005abf75: mov qword ptr [rsp + 0x180], rax
0x1005abf7d: mov dword ptr [rdi + 0x18], 0
0x1005abf84: mov qword ptr [rdi + 0x641f0], 0
0x1005abf8f: mov rax, qword ptr [rbx + 0xf8]
0x1005abf96: mov qword ptr [rsp + 0x10], rdi
0x1005abf9b: mov qword ptr [rdi + 0x641e8], rax
0x1005abfa2: lea rdi, [rsp + 0x60]
0x1005abfa7: call 0x1007c2530 ; 0x1007c2530
0x1005abfac: mov r15, qword ptr [rbx + 0x140]
0x1005abfb3: mov qword ptr [rsp + 0x50], rbx
0x1005abfb8: mov r14, qword ptr [rbx + 0x610]
0x1005abfbf: call 0x1003f10c0 ; 0x1003f10c0
0x1005abfc4: mov rdi, r15
0x1005abfc7: mov rsi, rax
0x1005abfca: mov rdx, r14
0x1005abfcd: call 0x1007c4360 ; 0x1007c4360
0x1005abfd2: test rax, rax
0x1005abfd5: je 0x1005abfe6
0x1005abfd7: lea rsi, [rsp + 0x60]
0x1005abfdc: mov rdi, rax
0x1005abfdf: call 0x1007c2310 ; 0x1007c2310
0x1005abfe4: jmp 0x1005abffa ; 0x1005abffa
0x1005abfe6: call 0x1003f10c0 ; 0x1003f10c0
0x1005abfeb: mov rsi, qword ptr [rax + 8]
0x1005abfef: mov rdi, r15
0x1005abff2: mov rdx, r14
0x1005abff5: call 0x1007c4640 ; 0x1007c4640
0x1005abffa: mov rax, qword ptr [rsp + 0x60]
0x1005abfff: mov rcx, qword ptr [rax + 0x10]
0x1005ac003: cmp byte ptr [rcx + 0x120], 0
0x1005ac00a: je 0x1005ac03d
0x1005ac00c: lea rdi, [rsp + 0x60]
0x1005ac011: call 0x1007c2570 ; 0x1007c2570
0x1005ac016: mov rax, qword ptr [rip + 0x6618bb] ; 0x100c0d8d8
0x1005ac01d: mov rax, qword ptr [rax]
0x1005ac020: cmp rax, qword ptr [rsp + 0x180]
0x1005ac028: jne 0x1005ac92d
0x1005ac02e: lea rsp, [rbp - 0x28]
0x1005ac032: pop rbx
0x1005ac033: pop r12
0x1005ac035: pop r13
0x1005ac037: pop r14
0x1005ac039: pop r15
0x1005ac03b: pop rbp
0x1005ac03c: ret 
0x1005ac03d: cmp dword ptr [rcx + 0x264], 0
0x1005ac044: js 0x1005ac970
0x1005ac04a: mov ecx, dword ptr [rcx + 0xd8]
0x1005ac050: mov rbx, qword ptr [rsp + 0x10]
0x1005ac055: mov dword ptr [rbx + 0x18], ecx
0x1005ac058: mov rax, qword ptr [rax + 0x10]
0x1005ac05c: cmp dword ptr [rax + 0x264], 0
0x1005ac063: js 0x1005ac98f
0x1005ac069: mov rax, qword ptr [rax + 0xf8]
0x1005ac070: mov qword ptr [rsp + 0x18], rax
0x1005ac075: mov rdi, qword ptr [rbx + 0x641e8]
0x1005ac07c: shl rcx, 4
0x1005ac080: lea rsi, [rcx + rcx*2]
0x1005ac084: mov rdx, qword ptr [rip + 0x1a7678d] ; 0x102022818
0x1005ac08b: mov ecx, 0x10
0x1005ac090: call 0x100795530 ; 0x100795530
0x1005ac095: mov qword ptr [rbx + 0x641f0], rax
0x1005ac09c: mov dword ptr [rbx + 0x1c], 0
0x1005ac0a3: mov esi, dword ptr [rbx + 0x18]
0x1005ac0a6: test rsi, rsi
0x1005ac0a9: mov r8, rbx
0x1005ac0ac: mov r9, qword ptr [rsp + 0x18]
0x1005ac0b1: je 0x1005ac0cc
0x1005ac0b3: mov eax, dword ptr [r8 + 0x20]
0x1005ac0b7: mov edx, esi
0x1005ac0b9: and edx, 1
0x1005ac0bc: cmp esi, 1
0x1005ac0bf: jne 0x1005ac0d0
0x1005ac0c1: xor ecx, ecx
0x1005ac0c3: xor ebx, ebx
0x1005ac0c5: test rdx, rdx
0x1005ac0c8: jne 0x1005ac0fd
0x1005ac0ca: jmp 0x1005ac10a ; 0x1005ac10a
0x1005ac0cc: xor ebx, ebx
0x1005ac0ce: jmp 0x1005ac112 ; 0x1005ac112
0x1005ac0d0: sub rsi, rdx
0x1005ac0d3: lea rdi, [r9 + 0x30]
0x1005ac0d7: xor ecx, ecx
0x1005ac0d9: xor ebx, ebx
0x1005ac0db: nop dword ptr [rax + rax]
0x1005ac0e0: add ebx, dword ptr [rdi - 0x30]
0x1005ac0e3: add eax, dword ptr [rdi - 0x20]
0x1005ac0e6: add ebx, dword ptr [rdi - 0x10]
0x1005ac0e9: add eax, dword ptr [rdi]
0x1005ac0eb: add rcx, 2
0x1005ac0ef: add rdi, 0x40
0x1005ac0f3: cmp rsi, rcx
0x1005ac0f6: jne 0x1005ac0e0
0x1005ac0f8: test rdx, rdx
0x1005ac0fb: je 0x1005ac10a
0x1005ac0fd: shl rcx, 5
0x1005ac101: add eax, dword ptr [r9 + rcx + 0x10]
0x1005ac106: add ebx, dword ptr [r9 + rcx]
0x1005ac10a: mov dword ptr [r8 + 0x1c], ebx
0x1005ac10e: mov dword ptr [r8 + 0x20], eax
0x1005ac112: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac117: mov ecx, ebx
0x1005ac119: shl rcx, 2
0x1005ac11d: lea rsi, [rcx + rcx*8]
0x1005ac121: lea r12, [rip + 0x1a9ca28] ; 0x102048b50
0x1005ac128: mov rdx, qword ptr [r12]
0x1005ac12c: mov ecx, 4
0x1005ac131: mov rdi, rax
0x1005ac134: call 0x100795530 ; 0x100795530
0x1005ac139: mov r15, rax
0x1005ac13c: mov rax, qword ptr [rsp + 0x10]
0x1005ac141: mov ebx, dword ptr [rax + 0x1c]
0x1005ac144: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac149: shl rbx, 2
0x1005ac14d: mov rdx, qword ptr [r12]
0x1005ac151: mov ecx, 1
0x1005ac156: mov rdi, rax
0x1005ac159: mov rsi, rbx
0x1005ac15c: call 0x100795530 ; 0x100795530
0x1005ac161: mov r13, rax
0x1005ac164: mov rax, qword ptr [rsp + 0x10]
0x1005ac169: mov r14d, dword ptr [rax + 0x1c]
0x1005ac16d: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac172: shl r14, 2
0x1005ac176: mov rdx, qword ptr [r12]
0x1005ac17a: mov ecx, 1
0x1005ac17f: mov rdi, rax
0x1005ac182: mov rsi, r14
0x1005ac185: call 0x100795530 ; 0x100795530
0x1005ac18a: mov qword ptr [rsp + 0x38], rax
0x1005ac18f: mov rax, qword ptr [rsp + 0x10]
0x1005ac194: mov r14d, dword ptr [rax + 0x20]
0x1005ac198: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac19d: shl r14, 2
0x1005ac1a1: mov rdx, qword ptr [r12]
0x1005ac1a5: mov ecx, 4
0x1005ac1aa: mov rdi, rax
0x1005ac1ad: mov rsi, r14
0x1005ac1b0: call 0x100795530 ; 0x100795530
0x1005ac1b5: mov r12, rax
0x1005ac1b8: mov r8, qword ptr [rsp + 0x10]
0x1005ac1bd: cmp dword ptr [r8 + 0x18], 0
0x1005ac1c2: mov r10, qword ptr [rsp + 0x18]
0x1005ac1c7: je 0x1005ac432
0x1005ac1cd: xor r9d, r9d
0x1005ac1d0: mov dword ptr [rsp + 0x20], 0
0x1005ac1d8: xor eax, eax
0x1005ac1da: jmp 0x1005ac2e0 ; 0x1005ac2e0
0x1005ac1df: nop 
0x1005ac1e0: lea rax, [r14 - 1]
0x1005ac1e4: mov esi, dword ptr [rsp + 0x20]
0x1005ac1e8: add esi, eax
0x1005ac1ea: jb 0x1005ac36a
0x1005ac1f0: shr rax, 0x20
0x1005ac1f4: mov edi, 0
0x1005ac1f9: jne 0x1005ac36c
0x1005ac1ff: mov r10d, r14d
0x1005ac202: and r10d, 0x1f
0x1005ac206: mov rdi, r14
0x1005ac209: sub rdi, r10
0x1005ac20c: vmovd xmm0, r9d
0x1005ac211: vpshufd xmm0, xmm0, 0
0x1005ac216: vinsertf128 ymm0, ymm0, xmm0, 1
0x1005ac21c: lea rax, [r11 + 0x30]
0x1005ac220: mov rsi, rdi
0x1005ac223: mov ebx, dword ptr [rsp + 0x20]
0x1005ac227: nop word ptr [rax + rax]
0x1005ac230: vpmovzxwd xmm1, qword ptr [rax - 0x30]
0x1005ac236: vpmovzxwd xmm2, qword ptr [rax - 0x28]
0x1005ac23c: vpmovzxwd xmm3, qword ptr [rax - 0x20]
0x1005ac242: vpmovzxwd xmm4, qword ptr [rax - 0x18]
0x1005ac248: vpmovzxwd xmm9, qword ptr [rax - 0x10]
0x1005ac24e: vpmovzxwd xmm6, qword ptr [rax - 8]
0x1005ac254: vpmovzxwd xmm8, qword ptr [rax]
0x1005ac259: vpmovzxwd xmm7, qword ptr [rax + 8]
0x1005ac25f: vextractf128 xmm5, ymm0, 1
0x1005ac265: vpaddd xmm2, xmm5, xmm2
0x1005ac269: vpaddd xmm1, xmm0, xmm1
0x1005ac26d: vinsertf128 ymm1, ymm1, xmm2, 1
0x1005ac273: vpaddd xmm2, xmm5, xmm4
0x1005ac277: vpaddd xmm3, xmm0, xmm3
0x1005ac27b: vinsertf128 ymm2, ymm3, xmm2, 1
0x1005ac281: vpaddd xmm3, xmm5, xmm6
0x1005ac285: vpaddd xmm4, xmm0, xmm9
0x1005ac28a: vinsertf128 ymm3, ymm4, xmm3, 1
0x1005ac290: vpaddd xmm4, xmm5, xmm7
0x1005ac294: vpaddd xmm5, xmm0, xmm8
0x1005ac299: vinsertf128 ymm4, ymm5, xmm4, 1
0x1005ac29f: mov ecx, ebx
0x1005ac2a1: vmovups ymmword ptr [r12 + rcx*4], ymm1
0x1005ac2a7: vmovups ymmword ptr [r12 + rcx*4 + 0x20], ymm2
0x1005ac2ae: vmovups ymmword ptr [r12 + rcx*4 + 0x40], ymm3
0x1005ac2b5: vmovups ymmword ptr [r12 + rcx*4 + 0x60], ymm4
0x1005ac2bc: add ebx, 0x20
0x1005ac2bf: add rax, 0x40
0x1005ac2c3: add rsi, -0x20
0x1005ac2c7: jne 0x1005ac230
0x1005ac2cd: test r10d, r10d
0x1005ac2d0: mov r10, qword ptr [rsp + 0x18]
0x1005ac2d5: jne 0x1005ac36c
0x1005ac2db: jmp 0x1005ac40b ; 0x1005ac40b
0x1005ac2e0: mov dword ptr [rsp + 0x30], eax
0x1005ac2e4: mov eax, eax
0x1005ac2e6: shl rax, 5
0x1005ac2ea: mov ecx, dword ptr [r10 + rax]
0x1005ac2ee: mov r14d, dword ptr [r10 + rax + 0x10]
0x1005ac2f3: mov r11, qword ptr [r10 + rax + 0x18]
0x1005ac2f8: mov qword ptr [rsp + 0x40], rcx
0x1005ac2fd: test rcx, rcx
0x1005ac300: je 0x1005ac357
0x1005ac302: mov rax, qword ptr [r10 + rax + 8]
0x1005ac307: mov rsi, qword ptr [rsp + 0x40]
0x1005ac30c: mov edi, r9d
0x1005ac30f: nop 
0x1005ac310: mov ecx, edi
0x1005ac312: lea rbx, [rcx + rcx*8]
0x1005ac316: mov edx, dword ptr [rax + 0x20]
0x1005ac319: mov dword ptr [r15 + rbx*4 + 0x20], edx
0x1005ac31e: vmovdqu ymm0, ymmword ptr [rax]
0x1005ac322: vmovdqu ymmword ptr [r15 + rbx*4], ymm0
0x1005ac328: movzx edx, byte ptr [rax + 0x24]
0x1005ac32c: mov byte ptr [r13 + rcx*4], dl
0x1005ac331: movzx edx, byte ptr [rax + 0x25]
0x1005ac335: mov byte ptr [r13 + rcx*4 + 1], dl
0x1005ac33a: movzx edx, byte ptr [rax + 0x26]
0x1005ac33e: mov byte ptr [r13 + rcx*4 + 2], dl
0x1005ac343: movzx edx, byte ptr [rax + 0x27]
0x1005ac347: mov byte ptr [r13 + rcx*4 + 3], dl
0x1005ac34c: add rax, 0x28
0x1005ac350: inc edi
0x1005ac352: dec rsi
0x1005ac355: jne 0x1005ac310
0x1005ac357: test r14d, r14d
0x1005ac35a: je 0x1005ac40b
0x1005ac360: cmp r14d, 0x1f
0x1005ac364: ja 0x1005ac1e0
0x1005ac36a: xor edi, edi
0x1005ac36c: mov esi, r14d
0x1005ac36f: sub esi, edi
0x1005ac371: lea r10, [r14 - 1]
0x1005ac375: sub r10, rdi
0x1005ac378: and rsi, 3
0x1005ac37c: je 0x1005ac3a7
0x1005ac37e: mov ebx, dword ptr [rsp + 0x20]
0x1005ac382: neg rsi
0x1005ac385: nop word ptr cs:[rax + rax]
0x1005ac390: lea eax, [rbx + rdi]
0x1005ac393: movzx r8d, word ptr [r11 + rdi*2]
0x1005ac398: add r8d, r9d
0x1005ac39b: mov dword ptr [r12 + rax*4], r8d
0x1005ac39f: inc rdi
0x1005ac3a2: inc rsi
0x1005ac3a5: jne 0x1005ac390
0x1005ac3a7: cmp r10, 3
0x1005ac3ab: mov r8, qword ptr [rsp + 0x10]
0x1005ac3b0: mov r10, qword ptr [rsp + 0x18]
0x1005ac3b5: jb 0x1005ac40b
0x1005ac3b7: mov eax, dword ptr [rsp + 0x20]
0x1005ac3bb: nop dword ptr [rax + rax]
0x1005ac3c0: lea rcx, [rax + rdi]
0x1005ac3c4: movzx edx, word ptr [r11 + rdi*2]
0x1005ac3c9: add edx, r9d
0x1005ac3cc: mov esi, ecx
0x1005ac3ce: mov dword ptr [r12 + rsi*4], edx
0x1005ac3d2: lea edx, [rcx + 1]
0x1005ac3d5: movzx esi, word ptr [r11 + rdi*2 + 2]
0x1005ac3db: add esi, r9d
0x1005ac3de: mov dword ptr [r12 + rdx*4], esi
0x1005ac3e2: lea edx, [rcx + 2]
0x1005ac3e5: movzx esi, word ptr [r11 + rdi*2 + 4]
0x1005ac3eb: add esi, r9d
0x1005ac3ee: mov dword ptr [r12 + rdx*4], esi
0x1005ac3f2: add ecx, 3
0x1005ac3f5: movzx edx, word ptr [r11 + rdi*2 + 6]
0x1005ac3fb: add edx, r9d
0x1005ac3fe: mov dword ptr [r12 + rcx*4], edx
0x1005ac402: add rdi, 4
0x1005ac406: cmp r14, rdi
0x1005ac409: jne 0x1005ac3c0
0x1005ac40b: mov rcx, qword ptr [rsp + 0x40]
0x1005ac410: add ecx, r9d
0x1005ac413: add r14d, dword ptr [rsp + 0x20]
0x1005ac418: mov eax, dword ptr [rsp + 0x30]
0x1005ac41c: inc eax
0x1005ac41e: mov r9d, ecx
0x1005ac421: mov ecx, r14d
0x1005ac424: mov dword ptr [rsp + 0x20], ecx
0x1005ac428: cmp eax, dword ptr [r8 + 0x18]
0x1005ac42c: jb 0x1005ac2e0
0x1005ac432: lea r14, [r8 + 0x63db0]
0x1005ac439: mov edx, dword ptr [r8 + 0x1c]
0x1005ac43d: lea rsi, [rip + 0x5ca7e7] ; 0x100b76c2b Skirts
0x1005ac444: mov rdi, r14
0x1005ac447: vzeroupper 
0x1005ac44a: call 0x1007f53c0 ; 0x1007f53c0
0x1005ac44f: lea rcx, [rsp + 0x9c]
0x1005ac457: vmovdqa ymm0, ymmword ptr [rip + 0x521d01] ; 0x100ace160
0x1005ac45f: vmovdqu ymmword ptr [rsp + 0x80], ymm0
0x1005ac468: movabs rax, 0x2000000003
0x1005ac472: mov qword ptr [rsp + 0xa0], rax
0x1005ac47a: movabs rax, 0xd00000021
0x1005ac484: mov qword ptr [rsp + 0xa8], rax
0x1005ac48c: movabs rax, 0xf0000000e
0x1005ac496: mov qword ptr [rsp + 0xb0], rax
0x1005ac49e: mov qword ptr [rsp + 8], r15
0x1005ac4a3: mov dword ptr [rsp], 0
0x1005ac4aa: lea rdx, [rsp + 0x80]
0x1005ac4b2: mov esi, 0
0x1005ac4b7: mov r8d, 7
0x1005ac4bd: mov r9d, 1
0x1005ac4c3: mov rdi, r14
0x1005ac4c6: vzeroupper 
0x1005ac4c9: call 0x1007f5430 ; 0x1007f5430
0x1005ac4ce: movabs rax, 0x1800000018
0x1005ac4d8: mov qword ptr [rsp + 0x80], rax
0x1005ac4e0: lea rcx, [rsp + 0x84]
0x1005ac4e8: mov rax, qword ptr [rsp + 0x38]
0x1005ac4ed: mov qword ptr [rsp + 8], rax
0x1005ac4f2: mov dword ptr [rsp], 0
0x1005ac4f9: lea rdx, [rsp + 0x80]
0x1005ac501: mov esi, 2
0x1005ac506: mov r8d, 1
0x1005ac50c: mov r9d, 1
0x1005ac512: mov rdi, r14
0x1005ac515: call 0x1007f5430 ; 0x1007f5430
0x1005ac51a: movabs rax, 0x1900000018
0x1005ac524: mov qword ptr [rsp + 0x80], rax
0x1005ac52c: lea rcx, [rsp + 0x84]
0x1005ac534: mov qword ptr [rsp + 8], r13
0x1005ac539: mov dword ptr [rsp], 0
0x1005ac540: lea rdx, [rsp + 0x80]
0x1005ac548: mov esi, 3
0x1005ac54d: mov r8d, 1
0x1005ac553: mov r9d, 1
0x1005ac559: mov rdi, r14
0x1005ac55c: call 0x1007f5430 ; 0x1007f5430
0x1005ac561: mov rax, qword ptr [rsp + 0x10]
0x1005ac566: mov r8d, dword ptr [rax + 0x20]
0x1005ac56a: mov esi, 0
0x1005ac56f: mov edx, 9
0x1005ac574: mov ecx, 1
0x1005ac579: mov rdi, r14
0x1005ac57c: mov r9, r12
0x1005ac57f: call 0x1007f55d0 ; 0x1007f55d0
0x1005ac584: mov rdi, r14
0x1005ac587: call 0x1007f5690 ; 0x1007f5690
0x1005ac58c: call 0x10043fb50 ; 0x10043fb50
0x1005ac591: mov qword ptr [rsp + 0x30], rax
0x1005ac596: mov rax, qword ptr [rsp + 0x10]
0x1005ac59b: mov dword ptr [rax + 0x24], 0x1e
0x1005ac5a2: lea rbx, [rax + 0x568]
0x1005ac5a9: mov rcx, 0xffffffffffffffff
0x1005ac5b0: mov qword ptr [rsp + 0x58], r14
0x1005ac5b5: nop word ptr cs:[rax + rax]
0x1005ac5c0: mov qword ptr [rsp + 0x20], rcx
0x1005ac5c5: lea esi, [rcx + 1]
0x1005ac5c8: mov rdi, qword ptr [rsp + 0x30]
0x1005ac5cd: call 0x100443560 ; 0x100443560
0x1005ac5d2: mov qword ptr [rsp + 0x40], rax
0x1005ac5d7: mov rsi, qword ptr [rax + 8]
0x1005ac5db: mov edx, 0x100
0x1005ac5e0: lea r14, [rsp + 0x80]
0x1005ac5e8: mov rdi, r14
0x1005ac5eb: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1005ac5f0: mov rdi, r14
0x1005ac5f3: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1005ac5f8: movabs rcx, 0x696b536168706c41
0x1005ac602: mov qword ptr [rsp + rax + 0x80], rcx
0x1005ac60a: mov byte ptr [rsp + rax + 0x8a], 0
0x1005ac612: mov word ptr [rsp + rax + 0x88], 0x7472
0x1005ac61c: lea rdi, [rbx - 0x538]
0x1005ac623: mov rax, qword ptr [rsp + 0x50]
0x1005ac628: mov rdx, qword ptr [rax + 0x140]
0x1005ac62f: mov r8, qword ptr [rax + 0x148]
0x1005ac636: mov eax, 0x498
0x1005ac63b: add r8, rax
0x1005ac63e: mov r9d, 4
0x1005ac644: mov rsi, qword ptr [rsp + 0x58]
0x1005ac649: mov rcx, r14
0x1005ac64c: call 0x1007f5d90 ; 0x1007f5d90
0x1005ac651: cmp byte ptr [rbx], 0
0x1005ac654: je 0x1005ac932
0x1005ac65a: lea r14, [rbx - 0x2c8]
0x1005ac661: mov rdi, r14
0x1005ac664: lea rsi, [rip + 0x5e7c8d] ; 0x100b942f8 u_skirtDRange
0x1005ac66b: vmovd xmm0, dword ptr [rip + 0x4fa435] ; 0x100aa6aa8
0x1005ac673: call 0x1007be530 ; 0x1007be530
0x1005ac678: cmp byte ptr [rbx], 0
0x1005ac67b: je 0x1005ac951
0x1005ac681: mov rax, qword ptr [rsp + 0x50]
0x1005ac686: mov rdx, qword ptr [rax + 0x140]
0x1005ac68d: mov rdi, r14
0x1005ac690: mov rsi, qword ptr [rsp + 0x40]
0x1005ac695: call 0x100443810 ; 0x100443810
0x1005ac69a: mov rcx, qword ptr [rsp + 0x20]
0x1005ac69f: inc rcx
0x1005ac6a2: add rbx, 0x3540
0x1005ac6a9: cmp rcx, 0x1d
0x1005ac6ad: jb 0x1005ac5c0
0x1005ac6b3: mov rdi, qword ptr [rsp + 0x10]
0x1005ac6b8: cmp dword ptr [rdi + 0x18], 0
0x1005ac6bc: je 0x1005ac8e3
0x1005ac6c2: xor ebx, ebx
0x1005ac6c4: vmovaps xmm0, xmmword ptr [rip + 0x4faf74] ; 0x100aa7640
0x1005ac6cc: vmovaps xmm1, xmmword ptr [rip + 0x4faf7c] ; 0x100aa7650
0x1005ac6d4: vxorps ymm2, ymm2, ymm2
0x1005ac6d8: vblendps xmm3, xmm1, xmm3, 8
0x1005ac6de: vblendps xmm4, xmm0, xmm4, 8
0x1005ac6e4: mov ebx, ebx
0x1005ac6e6: mov rcx, rbx
0x1005ac6e9: shl rcx, 5
0x1005ac6ed: mov rsi, rbx
0x1005ac6f0: mov rbx, qword ptr [rsp + 0x18]
0x1005ac6f5: mov eax, dword ptr [rbx + rcx + 0x10]
0x1005ac6f9: mov rdx, qword ptr [rdi + 0x641f0]
0x1005ac700: mov r8, rsi
0x1005ac703: shl rsi, 4
0x1005ac707: lea rsi, [rsi + rsi*2]
0x1005ac70b: mov dword ptr [rdx + rsi + 0x20], eax
0x1005ac70f: mov dword ptr [rdx + rsi + 0x24], 0
0x1005ac717: vmovaps xmmword ptr [rsp + 0x40], xmm4
0x1005ac71d: vmovaps xmmword ptr [rdx + rsi], xmm4
0x1005ac722: mov rax, qword ptr [rdi + 0x641f0]
0x1005ac729: vmovaps xmmword ptr [rsp + 0x20], xmm3
0x1005ac72f: vmovaps xmmword ptr [rax + rsi + 0x10], xmm3
0x1005ac735: vmovaps ymmword ptr [rsp + 0x160], ymm2
0x1005ac73e: vmovaps ymmword ptr [rsp + 0x140], ymm2
0x1005ac747: vmovaps ymmword ptr [rsp + 0x120], ymm2
0x1005ac750: vmovaps ymmword ptr [rsp + 0x100], ymm2
0x1005ac759: vmovaps ymmword ptr [rsp + 0xe0], ymm2
0x1005ac762: vmovaps ymmword ptr [rsp + 0xc0], ymm2
0x1005ac76b: vmovaps ymmword ptr [rsp + 0xa0], ymm2
0x1005ac774: vmovaps ymmword ptr [rsp + 0x80], ymm2
0x1005ac77d: mov eax, dword ptr [rbx + rcx]
0x1005ac780: test eax, eax
0x1005ac782: je 0x1005ac85b
0x1005ac788: mov rdi, qword ptr [rdi + 0x641f0]
0x1005ac78f: mov rcx, qword ptr [rbx + rcx + 8]
0x1005ac794: lea rbx, [r8 + r8*2]
0x1005ac798: shl rbx, 4
0x1005ac79c: lea rdx, [rdi + rbx]
0x1005ac7a0: vmovss xmm0, dword ptr [rdi + rbx]
0x1005ac7a5: vmovss xmm1, dword ptr [rdi + rbx + 4]
0x1005ac7ab: lea rsi, [rdi + rbx + 4]
0x1005ac7b0: vmovss xmm2, dword ptr [rdi + rbx + 8]
0x1005ac7b6: vmovss xmm3, dword ptr [rdi + rbx + 0x10]
0x1005ac7bc: vmovss xmm4, dword ptr [rdi + rbx + 0x14]
0x1005ac7c2: vmovss xmm5, dword ptr [rdi + rbx + 0x18]
0x1005ac7c8: add rcx, 0x13
0x1005ac7cc: xor edi, edi
0x1005ac7ce: nop 
0x1005ac7d0: vminss xmm0, xmm0, dword ptr [rcx - 0x13]
0x1005ac7d5: vmovss dword ptr [rdx], xmm0
0x1005ac7d9: vminss xmm1, xmm1, dword ptr [rcx - 0xf]
0x1005ac7de: vmovss dword ptr [rsi], xmm1
0x1005ac7e2: vminss xmm2, xmm2, dword ptr [rcx - 0xb]
0x1005ac7e7: vmovss dword ptr [rsi + 4], xmm2
0x1005ac7ec: vmaxss xmm3, xmm3, dword ptr [rcx - 0x13]
0x1005ac7f1: vmovss dword ptr [rsi + 0xc], xmm3
0x1005ac7f6: vmaxss xmm4, xmm4, dword ptr [rcx - 0xf]
0x1005ac7fb: vmovss dword ptr [rsi + 0x10], xmm4
0x1005ac800: vmaxss xmm5, xmm5, dword ptr [rcx - 0xb]
0x1005ac805: vmovss dword ptr [rsi + 0x14], xmm5
0x1005ac80a: movzx ebx, byte ptr [rcx - 3]
0x1005ac80e: test rbx, rbx
0x1005ac811: je 0x1005ac81b
0x1005ac813: mov byte ptr [rsp + rbx + 0x80], 1
0x1005ac81b: movzx ebx, byte ptr [rcx - 2]
0x1005ac81f: test rbx, rbx
0x1005ac822: je 0x1005ac82c
0x1005ac824: mov byte ptr [rsp + rbx + 0x80], 1
0x1005ac82c: movzx ebx, byte ptr [rcx - 1]
0x1005ac830: test rbx, rbx
0x1005ac833: je 0x1005ac83d
0x1005ac835: mov byte ptr [rsp + rbx + 0x80], 1
0x1005ac83d: movzx ebx, byte ptr [rcx]
0x1005ac840: test rbx, rbx
0x1005ac843: je 0x1005ac84d
0x1005ac845: mov byte ptr [rsp + rbx + 0x80], 1
0x1005ac84d: inc edi
0x1005ac84f: add rcx, 0x28
0x1005ac853: cmp edi, eax
0x1005ac855: jb 0x1005ac7d0
0x1005ac85b: xor r14d, r14d
0x1005ac85e: mov rbx, r8
0x1005ac861: nop word ptr cs:[rax + rax]
0x1005ac870: mov rdi, qword ptr [rsp + 0x30]
0x1005ac875: mov esi, r14d
0x1005ac878: vzeroupper 
0x1005ac87b: call 0x100443560 ; 0x100443560
0x1005ac880: movzx eax, byte ptr [rax]
0x1005ac883: cmp byte ptr [rsp + rax + 0x80], 0
0x1005ac88b: mov rdi, qword ptr [rsp + 0x10]
0x1005ac890: je 0x1005ac8af
0x1005ac892: mov eax, 1
0x1005ac897: mov ecx, r14d
0x1005ac89a: shl eax, cl
0x1005ac89c: mov rcx, qword ptr [rdi + 0x641f0]
0x1005ac8a3: lea rdx, [rbx + rbx*2]
0x1005ac8a7: shl rdx, 4
0x1005ac8ab: or dword ptr [rcx + rdx + 0x24], eax
0x1005ac8af: inc r14d
0x1005ac8b2: cmp r14d, 0x1e
0x1005ac8b6: jb 0x1005ac870
0x1005ac8b8: inc ebx
0x1005ac8ba: cmp ebx, dword ptr [rdi + 0x18]
0x1005ac8bd: vmovaps xmm0, xmmword ptr [rip + 0x4fad7b] ; 0x100aa7640
0x1005ac8c5: vmovaps xmm1, xmmword ptr [rip + 0x4fad83] ; 0x100aa7650
0x1005ac8cd: vxorps ymm2, ymm2, ymm2
0x1005ac8d1: vmovaps xmm3, xmmword ptr [rsp + 0x20]
0x1005ac8d7: vmovaps xmm4, xmmword ptr [rsp + 0x40]
0x1005ac8dd: jb 0x1005ac6d8
0x1005ac8e3: vzeroupper 
0x1005ac8e6: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac8eb: mov rdi, rax
0x1005ac8ee: mov rsi, r12
0x1005ac8f1: call 0x100795a70 ; 0x100795a70
0x1005ac8f6: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac8fb: mov rdi, rax
0x1005ac8fe: mov rsi, qword ptr [rsp + 0x38]
0x1005ac903: call 0x100795a70 ; 0x100795a70
0x1005ac908: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac90d: mov rdi, rax
0x1005ac910: mov rsi, r13
0x1005ac913: call 0x100795a70 ; 0x100795a70
0x1005ac918: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac91d: mov rdi, rax
0x1005ac920: mov rsi, r15
0x1005ac923: call 0x100795a70 ; 0x100795a70
0x1005ac928: jmp 0x1005ac00c ; 0x1005ac00c
0x1005ac92d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1005ac932: lea rdi, [rip + 0x5ca3b1] ; 0x100b76cea IsInitialized()
0x1005ac939: lea rsi, [rip + 0x5b593b] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1005ac940: mov edx, 0xa8
0x1005ac945: mov ecx, 3
0x1005ac94a: call 0x1007e5f70 ; 0x1007e5f70
0x1005ac94f: jmp 0x1005ac96e ; 0x1005ac96e
0x1005ac951: lea rdi, [rip + 0x5ca392] ; 0x100b76cea IsInitialized()
0x1005ac958: lea rsi, [rip + 0x5b591c] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1005ac95f: mov edx, 0xa8
0x1005ac964: mov ecx, 3
0x1005ac969: call 0x1007e5f70 ; 0x1007e5f70
0x1005ac96e: ud2 
0x1005ac970: lea rdi, [rip + 0x5e51f9] ; 0x100b91b70 Observed()->m_loadedLod >= 0
0x1005ac977: lea rsi, [rip + 0x5e520f] ; 0x100b91b8d ./LevelData.h
0x1005ac97e: mov edx, 0xc8
0x1005ac983: mov ecx, 3
0x1005ac988: call 0x1007e5f70 ; 0x1007e5f70
0x1005ac98d: jmp 0x1005ac96e ; 0x1005ac96e
0x1005ac98f: lea rdi, [rip + 0x5e51da] ; 0x100b91b70 Observed()->m_loadedLod >= 0
0x1005ac996: lea rsi, [rip + 0x5e51f0] ; 0x100b91b8d ./LevelData.h
0x1005ac99d: mov edx, 0xc9
0x1005ac9a2: mov ecx, 3
0x1005ac9a7: call 0x1007e5f70 ; 0x1007e5f70
0x1005ac9ac: jmp 0x1005ac96e ; 0x1005ac96e
0x1005ac9ae: jmp 0x1005ac9f0 ; 0x1005ac9f0
0x1005ac9b0: mov rdi, rax
0x1005ac9b3: call 0x100011bf0 ; 0x100011bf0
0x1005ac9b8: mov rdi, rax
0x1005ac9bb: call 0x100011bf0 ; 0x100011bf0
0x1005ac9c0: mov rdi, rax
0x1005ac9c3: call 0x100011bf0 ; 0x100011bf0
0x1005ac9c8: mov rdi, rax
0x1005ac9cb: call 0x100011bf0 ; 0x100011bf0
0x1005ac9d0: jmp 0x1005ac9f0 ; 0x1005ac9f0
0x1005ac9d2: jmp 0x1005ac9e7 ; 0x1005ac9e7
0x1005ac9d4: mov r14, rax
0x1005ac9d7: jmp 0x1005aca03 ; 0x1005aca03
0x1005ac9d9: mov r14, rax
0x1005ac9dc: jmp 0x1005aca15 ; 0x1005aca15
0x1005ac9de: mov r14, rax
0x1005ac9e1: jmp 0x1005aca25 ; 0x1005aca25
0x1005ac9e3: jmp 0x1005ac9e7 ; 0x1005ac9e7
0x1005ac9e5: jmp 0x1005ac9f0 ; 0x1005ac9f0
0x1005ac9e7: mov r14, rax
0x1005ac9ea: jmp 0x1005aca35 ; 0x1005aca35
0x1005ac9ec: jmp 0x1005ac9f0 ; 0x1005ac9f0
0x1005ac9ee: jmp 0x1005ac9f0 ; 0x1005ac9f0
0x1005ac9f0: mov r14, rax
0x1005ac9f3: call 0x1007c6c20 ; 0x1007c6c20
0x1005ac9f8: mov rdi, rax
0x1005ac9fb: mov rsi, r12
0x1005ac9fe: call 0x100795a70 ; 0x100795a70
0x1005aca03: call 0x1007c6c20 ; 0x1007c6c20
0x1005aca08: mov rdi, rax
0x1005aca0b: mov rsi, qword ptr [rsp + 0x38]
0x1005aca10: call 0x100795a70 ; 0x100795a70
0x1005aca15: call 0x1007c6c20 ; 0x1007c6c20
0x1005aca1a: mov rdi, rax
0x1005aca1d: mov rsi, r13
0x1005aca20: call 0x100795a70 ; 0x100795a70
0x1005aca25: call 0x1007c6c20 ; 0x1007c6c20
0x1005aca2a: mov rdi, rax
0x1005aca2d: mov rsi, r15
0x1005aca30: call 0x100795a70 ; 0x100795a70
0x1005aca35: lea rdi, [rsp + 0x60]
0x1005aca3a: call 0x1007c2570 ; 0x1007c2570
0x1005aca3f: mov rdi, r14
0x1005aca42: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1005aca47: mov rdi, rax
0x1005aca4a: call 0x100011bf0 ; 0x100011bf0
0x1005aca4f: mov rdi, rax
0x1005aca52: call 0x100011bf0 ; 0x100011bf0
0x1005aca57: mov rdi, rax
0x1005aca5a: call 0x100011bf0 ; 0x100011bf0
0x1005aca5f: mov rdi, rax
0x1005aca62: call 0x100011bf0 ; 0x100011bf0
0x1005aca67: nop word ptr [rax + rax]
