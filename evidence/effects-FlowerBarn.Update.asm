0x10034e530: push rbp
0x10034e531: mov rbp, rsp
0x10034e534: push r15
0x10034e536: push r14
0x10034e538: push r13
0x10034e53a: push r12
0x10034e53c: push rbx
0x10034e53d: sub rsp, 0x2a8
0x10034e544: mov r14, rcx
0x10034e547: mov r13, rdx
0x10034e54a: mov r12, rdi
0x10034e54d: mov rax, qword ptr [rip + 0x8bf384] ; 0x100c0d8d8
0x10034e554: mov rax, qword ptr [rax]
0x10034e557: mov qword ptr [rbp - 0x30], rax
0x10034e55b: cmp byte ptr [rip + 0x961bbe], 0 ; 0x100cb0120
0x10034e562: je 0x10034eeca
0x10034e568: cmp dword ptr [r12 + 0x35dd0], 0
0x10034e571: je 0x10034eeca
0x10034e577: mov qword ptr [rbp - 0x278], rsi
0x10034e57e: mov qword ptr [rbp - 0x250], r8
0x10034e585: cmp byte ptr [r12 + 0x988], 0
0x10034e58e: je 0x10034eef7
0x10034e594: lea r15, [r12 + 0x6c0]
0x10034e59c: vmovss xmm0, dword ptr [rip + 0x961b84] ; 0x100cb0128
0x10034e5a4: lea rsi, [rip + 0x833779] ; 0x100b81d24 u_flowerHeight
0x10034e5ab: mov rdi, r15
0x10034e5ae: call 0x1007be530 ; 0x1007be530
0x10034e5b3: cmp byte ptr [r12 + 0x988], 0
0x10034e5bc: je 0x10034eef7
0x10034e5c2: vmovss xmm0, dword ptr [rip + 0x961b62] ; 0x100cb012c
0x10034e5ca: lea rsi, [rip + 0x833762] ; 0x100b81d33 u_flowerSize
0x10034e5d1: mov rdi, r15
0x10034e5d4: call 0x1007be530 ; 0x1007be530
0x10034e5d9: cmp byte ptr [r12 + 0xec8], 0
0x10034e5e2: je 0x10034eef7
0x10034e5e8: lea rdi, [r12 + 0xc00]
0x10034e5f0: vmovss xmm0, dword ptr [rip + 0x961b34] ; 0x100cb012c
0x10034e5f8: lea rsi, [rip + 0x833734] ; 0x100b81d33 u_flowerSize
0x10034e5ff: call 0x1007be530 ; 0x1007be530
0x10034e604: lea rdi, [rbp - 0x2b0]
0x10034e60b: mov rsi, r13
0x10034e60e: call 0x10076be90 ; 0x10076be90
0x10034e613: lea rdi, [rbp - 0x2a0]
0x10034e61a: mov rsi, r13
0x10034e61d: call 0x10076bef0 ; 0x10076bef0
0x10034e622: cmp dword ptr [r12 + 0x160], 2
0x10034e62b: jne 0x10034ef41
0x10034e631: cmp dword ptr [r12 + 0x110], 0x20
0x10034e63a: jne 0x10034ef60
0x10034e640: vmovaps xmm0, xmmword ptr [rbp - 0x2a0]
0x10034e648: vmulps xmm0, xmm0, xmmword ptr [rip + 0x759910] ; 0x100aa7f60
0x10034e650: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x2b0]
0x10034e658: vmovaps xmmword ptr [rbp - 0x290], xmm0
0x10034e660: lea rdi, [r12 + 0x158]
0x10034e668: call 0x100795060 ; 0x100795060
0x10034e66d: mov qword ptr [rbp - 0x248], rax
0x10034e674: lea rsi, [r12 + 0x11dd0]
0x10034e67c: mov edx, dword ptr [r12 + 0x35dd0]
0x10034e684: lea rcx, [r12 + 0x31dd0]
0x10034e68c: mov r8d, 1
0x10034e692: mov rdi, r14
0x10034e695: call 0x100720dd0 ; 0x100720dd0
0x10034e69a: cmp dword ptr [r12 + 0x35dd0], 0
0x10034e6a3: mov qword ptr [rbp - 0x258], r13
0x10034e6aa: je 0x10034e6d7
0x10034e6ac: lea rax, [r12 + 0x335dd8]
0x10034e6b4: mov qword ptr [rbp - 0x270], rax
0x10034e6bb: xor r15d, r15d
0x10034e6be: mov dword ptr [rbp - 0x21c], 0
0x10034e6c8: xor r14d, r14d
0x10034e6cb: xor r11d, r11d
0x10034e6ce: mov r10, qword ptr [rbp - 0x248]
0x10034e6d5: jmp 0x10034e710 ; 0x10034e710
0x10034e6d7: mov dword ptr [rbp - 0x21c], 0
0x10034e6e1: xor r15d, r15d
0x10034e6e4: mov r10, qword ptr [rbp - 0x248]
0x10034e6eb: cmp byte ptr [r12 + 0x455de0], 0
0x10034e6f4: mov r14d, r15d
0x10034e6f7: jne 0x10034ec38
0x10034e6fd: jmp 0x10034ed79 ; 0x10034ed79
0x10034e702: mov r15, qword ptr [rbp - 0x230]
0x10034e709: jmp 0x10034ea20 ; 0x10034ea20
0x10034e70e: nop 
0x10034e710: mov r11d, r11d
0x10034e713: mov rdx, r11
0x10034e716: shl rdx, 4
0x10034e71a: cmp dword ptr [r12 + r11*4 + 0x31dd0], 0
0x10034e723: je 0x10034e8b0
0x10034e729: mov qword ptr [rbp - 0x240], r14
0x10034e730: lea rdi, [r12 + rdx + 0x21dd0]
0x10034e738: movzx eax, word ptr [r12 + rdx + 0x21dd4]
0x10034e741: movzx esi, word ptr [r12 + rdx + 0x21dd8]
0x10034e74a: cmp eax, esi
0x10034e74c: mov dword ptr [rbp - 0x224], eax
0x10034e752: cmova esi, eax
0x10034e755: mov eax, 0x12c
0x10034e75a: sub eax, dword ptr [rbp - 0x21c]
0x10034e760: add eax, esi
0x10034e762: vmovaps xmm0, xmmword ptr [r12 + rdx + 0x11dd0]
0x10034e76c: vsubps xmm1, xmm0, xmmword ptr [rbp - 0x290]
0x10034e774: vmulps xmm1, xmm1, xmm1
0x10034e778: vmovshdup xmm2, xmm1
0x10034e77c: vaddss xmm2, xmm1, xmm2
0x10034e780: vpermilpd xmm1, xmm1, 1
0x10034e786: vaddss xmm1, xmm1, xmm2
0x10034e78a: vsqrtss xmm1, xmm1, xmm1
0x10034e78e: vpermilps xmm0, xmm0, 0xe7
0x10034e794: vaddss xmm0, xmm0, xmm0
0x10034e798: vmovss xmm2, dword ptr [rip + 0x75903c] ; 0x100aa77dc
0x10034e7a0: vmaxss xmm0, xmm2, xmm0
0x10034e7a4: vsubss xmm0, xmm1, xmm0
0x10034e7a8: vmovss xmm1, dword ptr [rip + 0x756910] ; 0x100aa50c0
0x10034e7b0: vmaxss xmm0, xmm1, xmm0
0x10034e7b4: vsqrtss xmm0, xmm0, xmm0
0x10034e7b8: vdivss xmm0, xmm1, xmm0
0x10034e7bc: vmulss xmm0, xmm0, dword ptr [rdi]
0x10034e7c0: vmulss xmm0, xmm0, dword ptr [r12 + 0x35dd4]
0x10034e7ca: vmulss xmm0, xmm0, dword ptr [rip + 0x961952] ; 0x100cb0124
0x10034e7d2: vaddss xmm0, xmm0, xmm1
0x10034e7d6: vcvttss2si rcx, xmm0
0x10034e7db: cmp eax, ecx
0x10034e7dd: cmovae eax, ecx
0x10034e7e0: mov word ptr [r12 + rdx + 0x21dd4], ax
0x10034e7e9: movzx r14d, ax
0x10034e7ed: mov ebx, r14d
0x10034e7f0: sub ebx, esi
0x10034e7f2: jbe 0x10034e8d0
0x10034e7f8: mov qword ptr [rbp - 0x280], rdi
0x10034e7ff: mov qword ptr [rbp - 0x268], rdx
0x10034e806: mov qword ptr [rbp - 0x260], r11
0x10034e80d: mov dword ptr [rbp - 0x220], esi
0x10034e813: vzeroupper 
0x10034e816: call 0x1007c6c20 ; 0x1007c6c20
0x10034e81b: lea rsi, [rbx*8]
0x10034e823: lea rcx, [rip + 0x1cfa326] ; 0x102048b50
0x10034e82a: mov rdx, qword ptr [rcx]
0x10034e82d: mov ecx, 8
0x10034e832: mov rdi, rax
0x10034e835: call 0x100795530 ; 0x100795530
0x10034e83a: mov rdx, rax
0x10034e83d: cmp r14d, dword ptr [rbp - 0x220]
0x10034e844: mov qword ptr [rbp - 0x238], rdx
0x10034e84b: je 0x10034ea19
0x10034e851: mov qword ptr [rbp - 0x230], r15
0x10034e858: mov rax, qword ptr [rbp - 0x268]
0x10034e85f: lea rsi, [r12 + rax + 0x11dd0]
0x10034e867: xor r15d, r15d
0x10034e86a: vxorps ymm0, ymm0, ymm0
0x10034e86e: mov r14, qword ptr [rbp - 0x240]
0x10034e875: nop word ptr cs:[rax + rax]
0x10034e880: mov rax, qword ptr [r12 + 0x455dd8]
0x10034e888: test rax, rax
0x10034e88b: je 0x10034e8ed
0x10034e88d: mov rcx, qword ptr [rax]
0x10034e890: mov qword ptr [r12 + 0x455dd8], rcx
0x10034e898: vmovups ymmword ptr [rax], ymm0
0x10034e89c: mov qword ptr [rdx + r15*8], rax
0x10034e8a0: inc r15
0x10034e8a3: cmp r15, rbx
0x10034e8a6: jb 0x10034e880
0x10034e8a8: jmp 0x10034e8f6 ; 0x10034e8f6
0x10034e8aa: nop word ptr [rax + rax]
0x10034e8b0: movzx eax, word ptr [r12 + rdx + 0x21dd6]
0x10034e8b9: mov word ptr [r12 + rdx + 0x21dd4], 0
0x10034e8c4: jmp 0x10034ec0f ; 0x10034ec0f
0x10034e8c9: nop dword ptr [rax]
0x10034e8d0: mov r14, qword ptr [rbp - 0x240]
0x10034e8d7: movzx eax, word ptr [r12 + rdx + 0x21dd6]
0x10034e8e0: test eax, eax
0x10034e8e2: jne 0x10034ea5d
0x10034e8e8: jmp 0x10034ec0f ; 0x10034ec0f
0x10034e8ed: test r15d, r15d
0x10034e8f0: je 0x10034e702
0x10034e8f6: mov rbx, rsi
0x10034e8f9: vzeroupper 
0x10034e8fc: call 0x1007c6c20 ; 0x1007c6c20
0x10034e901: mov r14d, r15d
0x10034e904: lea rcx, [rip + 0x1cfa245] ; 0x102048b50
0x10034e90b: mov rdx, qword ptr [rcx]
0x10034e90e: mov ecx, 1
0x10034e913: mov rdi, rax
0x10034e916: mov rsi, r14
0x10034e919: call 0x100795530 ; 0x100795530
0x10034e91e: mov r13, rax
0x10034e921: mov rax, qword ptr [rbp - 0x260]
0x10034e928: shl eax, 0xc
0x10034e92b: mov ecx, dword ptr [rbp - 0x220]
0x10034e931: add ecx, eax
0x10034e933: xor eax, eax
0x10034e935: cmp word ptr [rbp - 0x224], 0
0x10034e93d: sete al
0x10034e940: mov dword ptr [rbp - 0x220], ecx
0x10034e946: mov dword ptr [rsp + 8], ecx
0x10034e94a: mov dword ptr [rsp], r15d
0x10034e94e: mov dword ptr [rsp + 0x10], eax
0x10034e952: mov rdi, r12
0x10034e955: mov rsi, qword ptr [rbp - 0x278]
0x10034e95c: mov rdx, qword ptr [rbp - 0x280]
0x10034e963: mov rcx, rbx
0x10034e966: mov r8, qword ptr [rbp - 0x238]
0x10034e96d: mov r9, r13
0x10034e970: call 0x100350c40 ; 0x100350c40
0x10034e975: xor eax, eax
0x10034e977: xor ebx, ebx
0x10034e979: mov r15, qword ptr [rbp - 0x230]
0x10034e980: mov r8, qword ptr [rbp - 0x270]
0x10034e987: mov rdi, qword ptr [rbp - 0x238]
0x10034e98e: mov esi, dword ptr [rbp - 0x220]
0x10034e994: nop word ptr cs:[rax + rax]
0x10034e9a0: cmp byte ptr [r13 + rax], 0
0x10034e9a6: je 0x10034e9d0
0x10034e9a8: lea ecx, [rbx + 1]
0x10034e9ab: add ebx, esi
0x10034e9ad: mov rdx, qword ptr [rdi + rax*8]
0x10034e9b1: sub rdx, r8
0x10034e9b4: sar rdx, 3
0x10034e9b8: mov dword ptr [r12 + rdx + 0x435dd8], ebx
0x10034e9c0: mov ebx, ecx
0x10034e9c2: inc rax
0x10034e9c5: cmp r14, rax
0x10034e9c8: jne 0x10034e9a0
0x10034e9ca: jmp 0x10034e9f4 ; 0x10034e9f4
0x10034e9cc: nop dword ptr [rax]
0x10034e9d0: mov rcx, qword ptr [rdi + rax*8]
0x10034e9d4: test rcx, rcx
0x10034e9d7: je 0x10034e9ec
0x10034e9d9: mov rdx, qword ptr [r12 + 0x455dd8]
0x10034e9e1: mov qword ptr [rcx], rdx
0x10034e9e4: mov qword ptr [r12 + 0x455dd8], rcx
0x10034e9ec: inc rax
0x10034e9ef: cmp r14, rax
0x10034e9f2: jne 0x10034e9a0
0x10034e9f4: call 0x1007c6c20 ; 0x1007c6c20
0x10034e9f9: mov rdi, rax
0x10034e9fc: mov rsi, r13
0x10034e9ff: call 0x100795a70 ; 0x100795a70
0x10034ea04: add ebx, dword ptr [rbp - 0x21c]
0x10034ea0a: mov eax, ebx
0x10034ea0c: mov dword ptr [rbp - 0x21c], eax
0x10034ea12: mov r13, qword ptr [rbp - 0x258]
0x10034ea19: mov r14, qword ptr [rbp - 0x240]
0x10034ea20: vzeroupper 
0x10034ea23: call 0x1007c6c20 ; 0x1007c6c20
0x10034ea28: mov rdi, rax
0x10034ea2b: mov rsi, qword ptr [rbp - 0x238]
0x10034ea32: call 0x100795a70 ; 0x100795a70
0x10034ea37: mov rdx, qword ptr [rbp - 0x268]
0x10034ea3e: mov r11, qword ptr [rbp - 0x260]
0x10034ea45: mov r10, qword ptr [rbp - 0x248]
0x10034ea4c: movzx eax, word ptr [r12 + rdx + 0x21dd6]
0x10034ea55: test eax, eax
0x10034ea57: je 0x10034ec0f
0x10034ea5d: lea r9, [r12 + rdx + 0x21dd4]
0x10034ea65: mov r8b, byte ptr [rip + 0x9dd1fc] ; 0x100d2bc68
0x10034ea6c: cmp word ptr [rbp - 0x224], 0
0x10034ea74: je 0x10034eb51
0x10034ea7a: xor esi, esi
0x10034ea7c: jmp 0x10034ea90 ; 0x10034ea90
0x10034ea7e: mov bl, 0xff
0x10034ea80: cmp r15d, 0xfffe
0x10034ea87: jbe 0x10034eace
0x10034ea89: jmp 0x10034eb3f ; 0x10034eb3f
0x10034ea8e: nop 
0x10034ea90: lea edi, [r14 + rsi]
0x10034ea94: shl rdi, 5
0x10034ea98: lea rdx, [r12 + rdi + 0x35deb]
0x10034eaa0: movzx ecx, word ptr [r9]
0x10034eaa4: movzx ebx, byte ptr [r12 + rdi + 0x35deb]
0x10034eaad: cmp esi, ecx
0x10034eaaf: jae 0x10034eb00
0x10034eab1: cmp bl, 0xff
0x10034eab4: je 0x10034ea7e
0x10034eab6: add ebx, 0xf
0x10034eab9: cmp ebx, 0xff
0x10034eabf: jb 0x10034eac3
0x10034eac1: mov bl, 0xff
0x10034eac3: mov byte ptr [rdx], bl
0x10034eac5: cmp r15d, 0xfffe
0x10034eacc: ja 0x10034eb3f
0x10034eace: test bl, bl
0x10034ead0: je 0x10034eb3f
0x10034ead2: lea rax, [r12 + rdi + 0x35dd8]
0x10034eada: mov ecx, r15d
0x10034eadd: inc r15d
0x10034eae0: shl rcx, 5
0x10034eae4: vmovups ymm0, ymmword ptr [rax]
0x10034eae8: vmovups ymmword ptr [r10 + rcx], ymm0
0x10034eaee: mov ax, word ptr [r9 + 2]
0x10034eaf3: jmp 0x10034eb3f ; 0x10034eb3f
0x10034eaf5: nop word ptr cs:[rax + rax]
0x10034eb00: test bl, bl
0x10034eb02: je 0x10034eb3f
0x10034eb04: add ebx, -0xf
0x10034eb07: test ebx, ebx
0x10034eb09: jg 0x10034eb30
0x10034eb0b: xor ebx, ebx
0x10034eb0d: mov byte ptr [rdx], bl
0x10034eb0f: test bl, bl
0x10034eb11: jne 0x10034eb36
0x10034eb13: mov byte ptr [r12 + rdi + 0x35dec], r8b
0x10034eb1b: mov byte ptr [r12 + rdi + 0x35def], 0
0x10034eb24: cmp r15d, 0xfffe
0x10034eb2b: jbe 0x10034eace
0x10034eb2d: jmp 0x10034eb3f ; 0x10034eb3f
0x10034eb2f: nop 
0x10034eb30: mov byte ptr [rdx], bl
0x10034eb32: test bl, bl
0x10034eb34: je 0x10034eb13
0x10034eb36: cmp r15d, 0xfffe
0x10034eb3d: jbe 0x10034eace
0x10034eb3f: inc esi
0x10034eb41: movzx edx, ax
0x10034eb44: cmp esi, edx
0x10034eb46: jb 0x10034ea90
0x10034eb4c: jmp 0x10034ec0d ; 0x10034ec0d
0x10034eb51: xor esi, esi
0x10034eb53: jmp 0x10034eb80 ; 0x10034eb80
0x10034eb55: mov byte ptr [r12 + rdi + 0x35dec], r8b
0x10034eb5d: mov byte ptr [r12 + rdi + 0x35def], 0
0x10034eb66: cmp r15d, 0xfffe
0x10034eb6d: jbe 0x10034ebb6
0x10034eb6f: jmp 0x10034ec00 ; 0x10034ec00
0x10034eb74: nop word ptr cs:[rax + rax]
0x10034eb80: lea edi, [r14 + rsi]
0x10034eb84: shl rdi, 5
0x10034eb88: lea rdx, [r12 + rdi + 0x35deb]
0x10034eb90: movzx ecx, word ptr [r9]
0x10034eb94: movzx ebx, byte ptr [r12 + rdi + 0x35deb]
0x10034eb9d: cmp esi, ecx
0x10034eb9f: jae 0x10034ebe0
0x10034eba1: mov ecx, ebx
0x10034eba3: mov bl, 0xff
0x10034eba5: cmp cl, 0xff
0x10034eba8: je 0x10034ebf7
0x10034ebaa: mov byte ptr [rdx], 0xff
0x10034ebad: cmp r15d, 0xfffe
0x10034ebb4: ja 0x10034ec00
0x10034ebb6: test bl, bl
0x10034ebb8: je 0x10034ec00
0x10034ebba: lea rax, [r12 + rdi + 0x35dd8]
0x10034ebc2: mov ecx, r15d
0x10034ebc5: inc r15d
0x10034ebc8: shl rcx, 5
0x10034ebcc: vmovups ymm0, ymmword ptr [rax]
0x10034ebd0: vmovups ymmword ptr [r10 + rcx], ymm0
0x10034ebd6: mov ax, word ptr [r9 + 2]
0x10034ebdb: jmp 0x10034ec00 ; 0x10034ec00
0x10034ebdd: nop dword ptr [rax]
0x10034ebe0: test bl, bl
0x10034ebe2: je 0x10034ec00
0x10034ebe4: add ebx, -0xf
0x10034ebe7: test ebx, ebx
0x10034ebe9: jg 0x10034ebed
0x10034ebeb: xor ebx, ebx
0x10034ebed: mov byte ptr [rdx], bl
0x10034ebef: test bl, bl
0x10034ebf1: je 0x10034eb55
0x10034ebf7: cmp r15d, 0xfffe
0x10034ebfe: jbe 0x10034ebb6
0x10034ec00: inc esi
0x10034ec02: movzx edx, ax
0x10034ec05: cmp esi, edx
0x10034ec07: jb 0x10034eb80
0x10034ec0d: mov eax, edx
0x10034ec0f: add eax, r14d
0x10034ec12: inc r11d
0x10034ec15: mov r14d, eax
0x10034ec18: cmp r11d, dword ptr [r12 + 0x35dd0]
0x10034ec20: jb 0x10034e710
0x10034ec26: cmp byte ptr [r12 + 0x455de0], 0
0x10034ec2f: mov r14d, r15d
0x10034ec32: je 0x10034ed79
0x10034ec38: lea r9, [r12 + 0x435dd8]
0x10034ec40: mov rdx, 0xfffffffffff00000
0x10034ec47: mov r8b, 5
0x10034ec4a: mov rdi, r9
0x10034ec4d: mov r14d, r15d
0x10034ec50: jmp 0x10034ecf0 ; 0x10034ecf0
0x10034ec55: and ebx, 0xfff
0x10034ec5b: cmp ebx, ecx
0x10034ec5d: jae 0x10034ec87
0x10034ec5f: cmp sil, 0xff
0x10034ec63: je 0x10034ecd3
0x10034ec65: add esi, 0xf
0x10034ec68: cmp esi, 0xff
0x10034ec6e: jb 0x10034ec90
0x10034ec70: mov sil, 0xff
0x10034ec73: mov byte ptr [r9 + rdx + 0x13], sil
0x10034ec78: cmp r14d, 0xfffe
0x10034ec7f: jbe 0x10034ed4c
0x10034ec85: jmp 0x10034eca2 ; 0x10034eca2
0x10034ec87: dec sil
0x10034ec8a: nop word ptr [rax + rax]
0x10034ec90: mov byte ptr [r9 + rdx + 0x13], sil
0x10034ec95: cmp r14d, 0xfffe
0x10034ec9c: jbe 0x10034ed4c
0x10034eca2: lea rax, [r9 + rdx]
0x10034eca6: mov dword ptr [rdi], 0xffffffff
0x10034ecac: mov rcx, qword ptr [r12 + 0x455dd8]
0x10034ecb4: mov qword ptr [r12 + rdx + 0x435dd8], rcx
0x10034ecbc: mov qword ptr [r12 + 0x455dd8], rax
0x10034ecc4: add rdi, 4
0x10034ecc8: add rdx, 0x20
0x10034eccc: jne 0x10034ecf0
0x10034ecce: jmp 0x10034ed79 ; 0x10034ed79
0x10034ecd3: mov sil, 0xff
0x10034ecd6: cmp r14d, 0xfffe
0x10034ecdd: jbe 0x10034ed4c
0x10034ecdf: jmp 0x10034eca2 ; 0x10034eca2
0x10034ece1: nop word ptr cs:[rax + rax]
0x10034ecf0: mov ebx, dword ptr [rdi]
0x10034ecf2: cmp ebx, -1
0x10034ecf5: je 0x10034ed6b
0x10034ecf7: mov eax, ebx
0x10034ecf9: shr eax, 0xc
0x10034ecfc: shl rax, 4
0x10034ed00: movzx ecx, word ptr [r12 + rax + 0x21dd4]
0x10034ed09: test ecx, ecx
0x10034ed0b: je 0x10034ed38
0x10034ed0d: movzx esi, byte ptr [r9 + rdx + 0x13]
0x10034ed13: imul eax, esi, 0xcd
0x10034ed19: and eax, 0xfc00
0x10034ed1e: shr eax, 0xa
0x10034ed21: mul r8b
0x10034ed24: cmp sil, al
0x10034ed27: je 0x10034ec55
0x10034ed2d: add esi, -0xf
0x10034ed30: test esi, esi
0x10034ed32: jg 0x10034ec90
0x10034ed38: xor esi, esi
0x10034ed3a: mov byte ptr [r9 + rdx + 0x13], sil
0x10034ed3f: cmp r14d, 0xfffe
0x10034ed46: ja 0x10034eca2
0x10034ed4c: test sil, sil
0x10034ed4f: je 0x10034eca2
0x10034ed55: mov eax, r14d
0x10034ed58: inc r14d
0x10034ed5b: shl rax, 5
0x10034ed5f: vmovups ymm0, ymmword ptr [r9 + rdx]
0x10034ed65: vmovups ymmword ptr [r10 + rax], ymm0
0x10034ed6b: add rdi, 4
0x10034ed6f: add rdx, 0x20
0x10034ed73: jne 0x10034ecf0
0x10034ed79: cmp byte ptr [r12 + 0x97a], 1
0x10034ed82: je 0x10034ef16
0x10034ed88: mov dword ptr [r12 + 0x95c], r14d
0x10034ed90: cmp byte ptr [r12 + 0xeba], 1
0x10034ed99: mov rdx, qword ptr [rbp - 0x250]
0x10034eda0: je 0x10034ef16
0x10034eda6: mov dword ptr [r12 + 0xe9c], r14d
0x10034edae: cmp r14d, 0xffff
0x10034edb5: jb 0x10034ee9e
0x10034edbb: mov qword ptr [rbp - 0x230], r15
0x10034edc2: lea rdi, [rbp - 0xc8]
0x10034edc9: lea r13, [rbp - 0x210]
0x10034edd0: mov rax, qword ptr [rip + 0x8bb749] ; 0x100c0a520
0x10034edd7: lea rcx, [rax + 0x18]
0x10034eddb: mov qword ptr [rbp - 0x218], rcx
0x10034ede2: add rax, 0x40
0x10034ede6: mov qword ptr [rbp - 0xc8], rax
0x10034eded: mov rsi, r13
0x10034edf0: vzeroupper 
0x10034edf3: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10034edf8: mov qword ptr [rbp - 0x40], 0
0x10034ee00: mov dword ptr [rbp - 0x38], 0xffffffff
0x10034ee07: mov rbx, qword ptr [rip + 0x8be7ba] ; 0x100c0d5c8
0x10034ee0e: lea r15, [rbx + 0x18]
0x10034ee12: mov qword ptr [rbp - 0x218], r15
0x10034ee19: add rbx, 0x40
0x10034ee1d: mov qword ptr [rbp - 0xc8], rbx
0x10034ee24: lea rsi, [rip + 0x827e34] ; 0x100b76c5f Flowers
0x10034ee2b: mov edx, 1
0x10034ee30: mov rdi, r13
0x10034ee33: call 0x1007a56a0 ; 0x1007a56a0
0x10034ee38: lea rsi, [rip + 0x832f01] ; 0x100b81d40 Flower render limit exceeded!
0x10034ee3f: lea rdi, [rbp - 0x218]
0x10034ee46: mov edx, 0x1d
0x10034ee4b: call 0x100011930 ; 0x100011930
0x10034ee50: mov qword ptr [rbp - 0x218], r15
0x10034ee57: mov qword ptr [rbp - 0xc8], rbx
0x10034ee5e: mov rdi, r13
0x10034ee61: call 0x1007a58d0 ; 0x1007a58d0
0x10034ee66: mov rsi, qword ptr [rip + 0x8bb713] ; 0x100c0a580
0x10034ee6d: add rsi, 8
0x10034ee71: lea rdi, [rbp - 0x218]
0x10034ee78: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10034ee7d: lea rdi, [rbp - 0xc8]
0x10034ee84: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10034ee89: mov rdx, qword ptr [rbp - 0x250]
0x10034ee90: mov r13, qword ptr [rbp - 0x258]
0x10034ee97: mov r15, qword ptr [rbp - 0x230]
0x10034ee9e: cmp byte ptr [rip + 0x1aa7bc3], 0 ; 0x101df6a68
0x10034eea5: je 0x10034eeca
0x10034eea7: mov ecx, r14d
0x10034eeaa: sub ecx, r15d
0x10034eead: mov eax, dword ptr [rbp - 0x21c]
0x10034eeb3: mov dword ptr [rsp], eax
0x10034eeb6: mov rdi, r12
0x10034eeb9: mov rsi, r13
0x10034eebc: mov r8d, r15d
0x10034eebf: mov r9d, r14d
0x10034eec2: vzeroupper 
0x10034eec5: call 0x100351720 ; 0x100351720
0x10034eeca: mov rax, qword ptr [rip + 0x8bea07] ; 0x100c0d8d8
0x10034eed1: mov rax, qword ptr [rax]
0x10034eed4: cmp rax, qword ptr [rbp - 0x30]
0x10034eed8: jne 0x10034eeef
0x10034eeda: add rsp, 0x2a8
0x10034eee1: pop rbx
0x10034eee2: pop r12
0x10034eee4: pop r13
0x10034eee6: pop r14
0x10034eee8: pop r15
0x10034eeea: pop rbp
0x10034eeeb: vzeroupper 
0x10034eeee: ret 
0x10034eeef: vzeroupper 
0x10034eef2: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10034eef7: lea rdi, [rip + 0x827dec] ; 0x100b76cea IsInitialized()
0x10034eefe: lea rsi, [rip + 0x813376] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034ef05: mov edx, 0xa8
0x10034ef0a: mov ecx, 3
0x10034ef0f: call 0x1007e5f70 ; 0x1007e5f70
0x10034ef14: ud2 
0x10034ef16: lea rdi, [rip + 0x813354] ; 0x100b62271 !m_queued
0x10034ef1d: lea rsi, [rip + 0x813357] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034ef24: lea r8, [rip + 0x81336c] ; 0x100b62297 VertexRender has already been committed!
0x10034ef2b: mov edx, 0x91
0x10034ef30: mov ecx, 4
0x10034ef35: xor eax, eax
0x10034ef37: vzeroupper 
0x10034ef3a: call 0x1007e6030 ; 0x1007e6030
0x10034ef3f: ud2 
0x10034ef41: lea rdi, [rip + 0x827dd3] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x10034ef48: lea rsi, [rip + 0x81332c] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034ef4f: mov edx, 0x115
0x10034ef54: mov ecx, 3
0x10034ef59: call 0x1007e5f70 ; 0x1007e5f70
0x10034ef5e: ud2 
0x10034ef60: lea rdi, [rip + 0x827de6] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x10034ef67: lea rsi, [rip + 0x81330d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034ef6e: mov edx, 0x116
0x10034ef73: mov ecx, 3
0x10034ef78: call 0x1007e5f70 ; 0x1007e5f70
0x10034ef7d: ud2 
0x10034ef7f: mov r14, rax
0x10034ef82: mov qword ptr [rbp - 0x218], r15
0x10034ef89: mov qword ptr [rbp - 0xc8], rbx
0x10034ef90: mov rdi, r13
0x10034ef93: call 0x1007a58d0 ; 0x1007a58d0
0x10034ef98: jmp 0x10034ef9d ; 0x10034ef9d
0x10034ef9a: mov r14, rax
0x10034ef9d: mov rsi, qword ptr [rip + 0x8bb5dc] ; 0x100c0a580
0x10034efa4: add rsi, 8
0x10034efa8: lea rdi, [rbp - 0x218]
0x10034efaf: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10034efb4: jmp 0x10034efb9 ; 0x10034efb9
0x10034efb6: mov r14, rax
0x10034efb9: lea rdi, [rbp - 0xc8]
0x10034efc0: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10034efc5: mov rdi, r14
0x10034efc8: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034efcd: mov r14, rax
0x10034efd0: call 0x1007c6c20 ; 0x1007c6c20
0x10034efd5: mov rdi, rax
0x10034efd8: mov rsi, r13
0x10034efdb: call 0x100795a70 ; 0x100795a70
0x10034efe0: jmp 0x10034eff5 ; 0x10034eff5
0x10034efe2: mov rdi, rax
0x10034efe5: call 0x100011bf0 ; 0x100011bf0
0x10034efea: mov rdi, rax
0x10034efed: call 0x100011bf0 ; 0x100011bf0
0x10034eff2: mov r14, rax
0x10034eff5: call 0x1007c6c20 ; 0x1007c6c20
0x10034effa: mov rdi, rax
0x10034effd: mov rsi, qword ptr [rbp - 0x238]
0x10034f004: call 0x100795a70 ; 0x100795a70
0x10034f009: mov rdi, r14
0x10034f00c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034f011: mov rdi, rax
0x10034f014: call 0x100011bf0 ; 0x100011bf0
0x10034f019: mov rdi, rax
0x10034f01c: call 0x100011bf0 ; 0x100011bf0
0x10034f021: nop word ptr cs:[rax + rax]
