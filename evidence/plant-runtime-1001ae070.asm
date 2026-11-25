0x1001ae070: push rbp
0x1001ae071: mov rbp, rsp
0x1001ae074: push r15
0x1001ae076: push r14
0x1001ae078: push r13
0x1001ae07a: push r12
0x1001ae07c: push rbx
0x1001ae07d: and rsp, 0xffffffffffffffe0
0x1001ae081: sub rsp, 0x2a0
0x1001ae088: mov r13d, r8d
0x1001ae08b: mov r15, rdx
0x1001ae08e: mov rbx, rdi
0x1001ae091: mov rax, qword ptr [rip + 0xa5f840] ; 0x100c0d8d8
0x1001ae098: mov rax, qword ptr [rax]
0x1001ae09b: mov qword ptr [rsp + 0x280], rax
0x1001ae0a3: mov al, byte ptr [rbx + 0x56]
0x1001ae0a6: test r9b, r9b
0x1001ae0a9: je 0x1001ae498
0x1001ae0af: test al, al
0x1001ae0b1: jne 0x1001ae5d9
0x1001ae0b7: vxorps ymm0, ymm0, ymm0
0x1001ae0bb: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x1001ae0c4: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x1001ae0cd: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1001ae0d6: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1001ae0df: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x1001ae0e4: mov byte ptr [rsp + 0x20d], 1
0x1001ae0ec: mov dword ptr [rsp + 0x200], 0x3f800000
0x1001ae0f7: vmovaps xmmword ptr [rsp + 0x210], xmm1
0x1001ae100: movabs rax, 0x412000003f800000
0x1001ae10a: mov qword ptr [rsp + 0x248], rax
0x1001ae112: mov dword ptr [rsp + 0x270], 0xc31
0x1001ae11d: vmovups ymmword ptr [rsp + 0x1d0], ymm0
0x1001ae126: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1001ae12f: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1001ae138: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1001ae141: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1001ae14a: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1001ae153: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1001ae15c: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1001ae165: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1001ae16e: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1001ae177: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x1001ae180: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x1001ae189: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x1001ae18f: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x1001ae195: mov qword ptr [rsp + 0x28], rsi
0x1001ae19a: lea rsi, [rip + 0x9c9e0b] ; 0x100b77fac blazearrive
0x1001ae1a1: lea rdx, [rsp + 0x200]
0x1001ae1a9: lea rax, [rsp + 0x40]
0x1001ae1ae: mov rdi, rcx
0x1001ae1b1: mov rcx, rax
0x1001ae1b4: mov dword ptr [rsp + 0x14], r9d
0x1001ae1b9: vzeroupper 
0x1001ae1bc: call 0x1006018a0 ; 0x1006018a0
0x1001ae1c1: mov rsi, qword ptr [rsp + 0x28]
0x1001ae1c6: mov r9d, dword ptr [rsp + 0x14]
0x1001ae1cb: mov eax, dword ptr [rbx + 0x78]
0x1001ae1ce: mov dword ptr [rbx + 0xb4], eax
0x1001ae1d4: mov qword ptr [rbx + 0xc0], 0
0x1001ae1df: cmp byte ptr [rbx + 0x7c], 0
0x1001ae1e3: je 0x1001ae5d9
0x1001ae1e9: mov rax, qword ptr [rbx + 0x70]
0x1001ae1ed: test rax, rax
0x1001ae1f0: je 0x1001ae5d9
0x1001ae1f6: mov r12d, dword ptr [rax + 0x10]
0x1001ae1fa: test r12, r12
0x1001ae1fd: je 0x1001ae5d9
0x1001ae203: mov dword ptr [rsp + 0x24], r13d
0x1001ae208: mov qword ptr [rsp + 0x18], rbx
0x1001ae20d: mov qword ptr [rsp + 0x38], r15
0x1001ae212: call 0x1007e8470 ; 0x1007e8470
0x1001ae217: mov eax, eax
0x1001ae219: mov r15d, 0x91a2b3c5
0x1001ae21f: imul r15, rax
0x1001ae223: shr r15, 0x2b
0x1001ae227: imul r15d, r15d
0x1001ae22b: xor r15d, 0x5bf03635
0x1001ae232: imul r15, r15
0x1001ae236: movabs rcx, 0x800000028000000d
0x1001ae240: mov rax, r15
0x1001ae243: mul rcx
0x1001ae246: shr rdx, 0x1f
0x1001ae24a: lea eax, [rdx + rdx*4]
0x1001ae24d: neg eax
0x1001ae24f: sub r15d, eax
0x1001ae252: xor r14d, r14d
0x1001ae255: lea r13, [rsp + 0x200]
0x1001ae25d: nop dword ptr [rax]
0x1001ae260: mov rax, qword ptr [rsp + 0x18]
0x1001ae265: mov rax, qword ptr [rax + 0x70]
0x1001ae269: mov ecx, dword ptr [rax + 0x10]
0x1001ae26c: cmp r14, rcx
0x1001ae26f: jae 0x1001ae656
0x1001ae275: mov rax, qword ptr [rax + 8]
0x1001ae279: mov rax, qword ptr [rax + r14*8]
0x1001ae27d: mov qword ptr [rsp + 0x200], rax
0x1001ae285: call 0x1007abc10 ; 0x1007abc10
0x1001ae28a: mov qword ptr [rsp + 0x40], 0
0x1001ae293: mov rdi, qword ptr [rip + 0x1c2cb66] ; 0x101ddae00
0x1001ae29a: mov rbx, qword ptr [rdi]
0x1001ae29d: lea rsi, [rsp + 0x40]
0x1001ae2a2: mov rdx, r13
0x1001ae2a5: mov rcx, rax
0x1001ae2a8: call qword ptr [rbx + 0x40]
0x1001ae2ab: mov rax, qword ptr [rsp + 0x40]
0x1001ae2b0: test rax, rax
0x1001ae2b3: je 0x1001ae675
0x1001ae2b9: mov eax, dword ptr [rax + 0x68]
0x1001ae2bc: imul eax, eax
0x1001ae2bf: xor eax, 0x5bf03635
0x1001ae2c4: imul rax, rax
0x1001ae2c8: xor edx, edx
0x1001ae2ca: mov ecx, 0xfffffffb
0x1001ae2cf: div rcx
0x1001ae2d2: add r15d, edx
0x1001ae2d5: inc r14
0x1001ae2d8: cmp r14, r12
0x1001ae2db: jb 0x1001ae260
0x1001ae2dd: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae2e2: lea r13, [r12*8]
0x1001ae2ea: lea rbx, [rip + 0x1e9a85f] ; 0x102048b50
0x1001ae2f1: mov rdx, qword ptr [rbx]
0x1001ae2f4: mov ecx, 8
0x1001ae2f9: mov rdi, rax
0x1001ae2fc: mov rsi, r13
0x1001ae2ff: call 0x100795530 ; 0x100795530
0x1001ae304: mov r14, rax
0x1001ae307: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae30c: mov rdx, qword ptr [rbx]
0x1001ae30f: mov ecx, 8
0x1001ae314: mov rdi, rax
0x1001ae317: mov rsi, r13
0x1001ae31a: call 0x100795530 ; 0x100795530
0x1001ae31f: mov rdi, rax
0x1001ae322: xor r13d, r13d
0x1001ae325: mov qword ptr [rsp + 0x30], rdi
0x1001ae32a: nop word ptr [rax + rax]
0x1001ae330: mov rax, qword ptr [rsp + 0x18]
0x1001ae335: mov rax, qword ptr [rax + 0x70]
0x1001ae339: mov ecx, dword ptr [rax + 0x10]
0x1001ae33c: cmp r13, rcx
0x1001ae33f: jae 0x1001ae694
0x1001ae345: mov rax, qword ptr [rax + 8]
0x1001ae349: mov rax, qword ptr [rax + r13*8]
0x1001ae34d: mov qword ptr [rsp + 0x200], rax
0x1001ae355: call 0x1007abc10 ; 0x1007abc10
0x1001ae35a: mov qword ptr [rsp + 0x40], 0
0x1001ae363: mov rdi, qword ptr [rip + 0x1c2ca96] ; 0x101ddae00
0x1001ae36a: mov rbx, qword ptr [rdi]
0x1001ae36d: lea rsi, [rsp + 0x40]
0x1001ae372: lea rdx, [rsp + 0x200]
0x1001ae37a: mov rcx, rax
0x1001ae37d: call qword ptr [rbx + 0x40]
0x1001ae380: mov rax, qword ptr [rsp + 0x40]
0x1001ae385: test rax, rax
0x1001ae388: je 0x1001ae6b3
0x1001ae38e: mov qword ptr [r14 + r13*8], rax
0x1001ae392: inc r13
0x1001ae395: cmp r13, r12
0x1001ae398: mov rdi, qword ptr [rsp + 0x30]
0x1001ae39d: jb 0x1001ae330
0x1001ae39f: xor ecx, ecx
0x1001ae3a1: mov r13d, dword ptr [rsp + 0x24]
0x1001ae3a6: nop word ptr cs:[rax + rax]
0x1001ae3b0: mov eax, ecx
0x1001ae3b2: imul eax, eax
0x1001ae3b5: xor rax, 0x5bf03635
0x1001ae3bb: imul rax, rax
0x1001ae3bf: xor edx, edx
0x1001ae3c1: mov esi, 0xfffffffb
0x1001ae3c6: div rsi
0x1001ae3c9: mov rax, rdx
0x1001ae3cc: add eax, r15d
0x1001ae3cf: imul eax, eax
0x1001ae3d2: xor eax, 0x5bf03635
0x1001ae3d7: imul rax, rax
0x1001ae3db: xor edx, edx
0x1001ae3dd: div rsi
0x1001ae3e0: mov esi, edx
0x1001ae3e2: shl esi, 0xd
0x1001ae3e5: xor esi, edx
0x1001ae3e7: mov eax, esi
0x1001ae3e9: imul eax, eax
0x1001ae3ec: imul eax, eax, 0x3d73
0x1001ae3f2: add eax, 0xc0ae5
0x1001ae3f7: imul eax, esi
0x1001ae3fa: add eax, 0x5208dd0d
0x1001ae3ff: nop 
0x1001ae400: xor edx, edx
0x1001ae402: div r12d
0x1001ae405: mov rsi, qword ptr [r14 + rdx*8]
0x1001ae409: mov eax, edx
0x1001ae40b: inc eax
0x1001ae40d: test rsi, rsi
0x1001ae410: je 0x1001ae400
0x1001ae412: mov qword ptr [rdi + rcx*8], rsi
0x1001ae416: mov qword ptr [r14 + rdx*8], 0
0x1001ae41e: inc rcx
0x1001ae421: cmp rcx, r12
0x1001ae424: jne 0x1001ae3b0
0x1001ae426: xor eax, eax
0x1001ae428: mov r15, qword ptr [rsp + 0x38]
0x1001ae42d: mov rbx, qword ptr [rsp + 0x18]
0x1001ae432: nop word ptr cs:[rax + rax]
0x1001ae440: mov ecx, eax
0x1001ae442: cmp qword ptr [rdi + rcx*8], rbx
0x1001ae446: je 0x1001ae454
0x1001ae448: inc eax
0x1001ae44a: cmp eax, r12d
0x1001ae44d: jb 0x1001ae440
0x1001ae44f: mov eax, 0xffffffff
0x1001ae454: inc eax
0x1001ae456: xor edx, edx
0x1001ae458: div r12d
0x1001ae45b: mov rax, qword ptr [rdi + rdx*8]
0x1001ae45f: mov qword ptr [rbx + 0xc0], rax
0x1001ae466: mov r12, rdi
0x1001ae469: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae46e: mov rdi, rax
0x1001ae471: mov rsi, r12
0x1001ae474: call 0x100795a70 ; 0x100795a70
0x1001ae479: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae47e: mov rdi, rax
0x1001ae481: mov rsi, r14
0x1001ae484: call 0x100795a70 ; 0x100795a70
0x1001ae489: mov rsi, qword ptr [rsp + 0x28]
0x1001ae48e: mov r9d, dword ptr [rsp + 0x14]
0x1001ae493: jmp 0x1001ae5d9 ; 0x1001ae5d9
0x1001ae498: test al, al
0x1001ae49a: je 0x1001ae5d9
0x1001ae4a0: cmp byte ptr [rbx + 0xa0], 0
0x1001ae4a7: je 0x1001ae5d9
0x1001ae4ad: vxorps ymm0, ymm0, ymm0
0x1001ae4b1: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x1001ae4ba: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x1001ae4c3: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1001ae4cc: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1001ae4d5: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x1001ae4da: mov byte ptr [rsp + 0x20d], 1
0x1001ae4e2: mov dword ptr [rsp + 0x200], 0x3f800000
0x1001ae4ed: vmovaps xmmword ptr [rsp + 0x210], xmm1
0x1001ae4f6: movabs rax, 0x412000003f800000
0x1001ae500: mov qword ptr [rsp + 0x248], rax
0x1001ae508: mov dword ptr [rsp + 0x270], 0xc31
0x1001ae513: vmovups ymmword ptr [rsp + 0x1d0], ymm0
0x1001ae51c: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1001ae525: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1001ae52e: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1001ae537: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1001ae540: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1001ae549: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1001ae552: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1001ae55b: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1001ae564: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1001ae56d: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x1001ae576: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x1001ae57f: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x1001ae585: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x1001ae58b: mov r12, rsi
0x1001ae58e: lea rsi, [rip + 0x9c9a23] ; 0x100b77fb8 blazedepart
0x1001ae595: lea rdx, [rsp + 0x200]
0x1001ae59d: lea rax, [rsp + 0x40]
0x1001ae5a2: mov rdi, rcx
0x1001ae5a5: mov rcx, rax
0x1001ae5a8: mov r14d, r9d
0x1001ae5ab: vzeroupper 
0x1001ae5ae: call 0x1006018a0 ; 0x1006018a0
0x1001ae5b3: mov rsi, r12
0x1001ae5b6: mov r9d, r14d
0x1001ae5b9: cmp byte ptr [rbx + 0xa4], 0
0x1001ae5c0: jne 0x1001ae5d9
0x1001ae5c2: mov rdi, qword ptr [rbx + 0x88]
0x1001ae5c9: mov esi, 1
0x1001ae5ce: call 0x1004d1f60 ; 0x1004d1f60
0x1001ae5d3: mov rsi, r12
0x1001ae5d6: mov r9d, r14d
0x1001ae5d9: mov byte ptr [rbx + 0x56], r9b
0x1001ae5dd: mov eax, dword ptr [rsi]
0x1001ae5df: mov dword ptr [rbx + 0x50], eax
0x1001ae5e2: test r13b, r13b
0x1001ae5e5: je 0x1001ae62e
0x1001ae5e7: call 0x1007abc10 ; 0x1007abc10
0x1001ae5ec: call 0x1004b1530 ; 0x1004b1530
0x1001ae5f1: mov rax, qword ptr [rip + 0x1c2cfa8] ; 0x101ddb5a0
0x1001ae5f8: mov eax, dword ptr [rax + 0x38]
0x1001ae5fb: mov dword ptr [rsp + 0x48], eax
0x1001ae5ff: lea rax, [rip + 0xa6428a] ; 0x100c12890
0x1001ae606: mov qword ptr [rsp + 0x40], rax
0x1001ae60b: mov eax, dword ptr [rbx + 0x68]
0x1001ae60e: mov dword ptr [rsp + 0x54], eax
0x1001ae612: mov al, byte ptr [rbx + 0x56]
0x1001ae615: mov byte ptr [rsp + 0x58], al
0x1001ae619: mov eax, dword ptr [rbx + 0x50]
0x1001ae61c: mov dword ptr [rsp + 0x5c], eax
0x1001ae620: mov rdi, qword ptr [r15 + 0x38]
0x1001ae624: lea rsi, [rsp + 0x40]
0x1001ae629: call 0x1004b1f90 ; 0x1004b1f90
0x1001ae62e: mov rax, qword ptr [rip + 0xa5f2a3] ; 0x100c0d8d8
0x1001ae635: mov rax, qword ptr [rax]
0x1001ae638: cmp rax, qword ptr [rsp + 0x280]
0x1001ae640: jne 0x1001ae651
0x1001ae642: lea rsp, [rbp - 0x28]
0x1001ae646: pop rbx
0x1001ae647: pop r12
0x1001ae649: pop r13
0x1001ae64b: pop r14
0x1001ae64d: pop r15
0x1001ae64f: pop rbp
0x1001ae650: ret 
0x1001ae651: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001ae656: lea rdi, [rip + 0x9b32fb] ; 0x100b61958 idx < size
0x1001ae65d: lea rsi, [rip + 0x9b32ff] ; 0x100b61963 ./Clump.h
0x1001ae664: mov edx, 0x36
0x1001ae669: mov ecx, 3
0x1001ae66e: call 0x1007e5f70 ; 0x1007e5f70
0x1001ae673: ud2 
0x1001ae675: lea rdi, [rip + 0x9b347c] ; 0x100b61af8 ret
0x1001ae67c: lea rsi, [rip + 0x9b32e0] ; 0x100b61963 ./Clump.h
0x1001ae683: mov edx, 0x47
0x1001ae688: mov ecx, 3
0x1001ae68d: call 0x1007e5f70 ; 0x1007e5f70
0x1001ae692: ud2 
0x1001ae694: lea rdi, [rip + 0x9b32bd] ; 0x100b61958 idx < size
0x1001ae69b: lea rsi, [rip + 0x9b32c1] ; 0x100b61963 ./Clump.h
0x1001ae6a2: mov edx, 0x36
0x1001ae6a7: mov ecx, 3
0x1001ae6ac: call 0x1007e5f70 ; 0x1007e5f70
0x1001ae6b1: jmp 0x1001ae6d0 ; 0x1001ae6d0
0x1001ae6b3: lea rdi, [rip + 0x9b343e] ; 0x100b61af8 ret
0x1001ae6ba: lea rsi, [rip + 0x9b32a2] ; 0x100b61963 ./Clump.h
0x1001ae6c1: mov edx, 0x47
0x1001ae6c6: mov ecx, 3
0x1001ae6cb: call 0x1007e5f70 ; 0x1007e5f70
0x1001ae6d0: ud2 
0x1001ae6d2: jmp 0x1001ae6f4 ; 0x1001ae6f4
0x1001ae6d4: mov rdi, rax
0x1001ae6d7: call 0x100011bf0 ; 0x100011bf0
0x1001ae6dc: mov rdi, rax
0x1001ae6df: call 0x100011bf0 ; 0x100011bf0
0x1001ae6e4: mov rbx, rax
0x1001ae6e7: jmp 0x1001ae709 ; 0x1001ae709
0x1001ae6e9: mov rbx, rax
0x1001ae6ec: mov rdi, rbx
0x1001ae6ef: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001ae6f4: mov rbx, rax
0x1001ae6f7: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae6fc: mov rdi, rax
0x1001ae6ff: mov rsi, qword ptr [rsp + 0x30]
0x1001ae704: call 0x100795a70 ; 0x100795a70
0x1001ae709: call 0x1007c6c20 ; 0x1007c6c20
0x1001ae70e: mov rdi, rax
0x1001ae711: mov rsi, r14
0x1001ae714: call 0x100795a70 ; 0x100795a70
0x1001ae719: mov rdi, rbx
0x1001ae71c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001ae721: mov rdi, rax
0x1001ae724: call 0x100011bf0 ; 0x100011bf0
0x1001ae729: mov rdi, rax
0x1001ae72c: call 0x100011bf0 ; 0x100011bf0
0x1001ae731: nop word ptr cs:[rax + rax]
