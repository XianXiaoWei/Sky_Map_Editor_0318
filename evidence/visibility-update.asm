0x10071e020: push rbp
0x10071e021: mov rbp, rsp
0x10071e024: push r15
0x10071e026: push r14
0x10071e028: push r13
0x10071e02a: push r12
0x10071e02c: push rbx
0x10071e02d: and rsp, 0xffffffffffffffe0
0x10071e031: sub rsp, 0x1a0
0x10071e038: mov r14, r8
0x10071e03b: mov r15, rcx
0x10071e03e: mov rbx, rdi
0x10071e041: mov rax, qword ptr [rip + 0x4ef890] ; 0x100c0d8d8
0x10071e048: mov rax, qword ptr [rax]
0x10071e04b: mov qword ptr [rsp + 0x180], rax
0x10071e053: cmp byte ptr [rip + 0x191de36], 0 ; 0x10203be90
0x10071e05a: jne 0x10071e73d
0x10071e060: vstmxcsr dword ptr [rsp + 0x80]
0x10071e069: mov r13d, dword ptr [rsp + 0x80]
0x10071e071: mov eax, r13d
0x10071e074: or eax, 0xe040
0x10071e079: mov dword ptr [rsp + 0x30], eax
0x10071e07d: vldmxcsr dword ptr [rsp + 0x30]
0x10071e083: cmp byte ptr [rip + 0x5ef436], 0 ; 0x100d0d4c0
0x10071e08a: je 0x10071e373
0x10071e090: mov rax, qword ptr [rbx + 0x10]
0x10071e094: mov ecx, dword ptr [rdx]
0x10071e096: mov dword ptr [rax], ecx
0x10071e098: mov ecx, dword ptr [rdx + 0x14]
0x10071e09b: mov dword ptr [rax + 0x14], ecx
0x10071e09e: vmovups xmm0, xmmword ptr [rdx + 4]
0x10071e0a3: vmovups xmmword ptr [rax + 4], xmm0
0x10071e0a8: vmovaps xmm0, xmmword ptr [rdx + 0x20]
0x10071e0ad: vmovaps xmmword ptr [rax + 0x20], xmm0
0x10071e0b2: vmovaps xmm0, xmmword ptr [rdx + 0x30]
0x10071e0b7: vmovaps xmmword ptr [rax + 0x30], xmm0
0x10071e0bc: vmovaps xmm0, xmmword ptr [rdx + 0x40]
0x10071e0c1: vmovaps xmmword ptr [rax + 0x40], xmm0
0x10071e0c6: vmovaps xmm0, xmmword ptr [rdx + 0x50]
0x10071e0cb: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10071e0d0: vmovaps xmm0, xmmword ptr [rdx + 0x60]
0x10071e0d5: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10071e0da: vmovaps xmm0, xmmword ptr [rdx + 0x70]
0x10071e0df: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10071e0e4: vmovaps xmm0, xmmword ptr [rdx + 0x80]
0x10071e0ec: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10071e0f4: vmovaps xmm0, xmmword ptr [rdx + 0x90]
0x10071e0fc: vmovaps xmmword ptr [rax + 0x90], xmm0
0x10071e104: vmovaps xmm0, xmmword ptr [rdx + 0xa0]
0x10071e10c: vmovaps xmmword ptr [rax + 0xa0], xmm0
0x10071e114: vmovaps xmm0, xmmword ptr [rdx + 0xb0]
0x10071e11c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x10071e124: vmovaps xmm0, xmmword ptr [rdx + 0xc0]
0x10071e12c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x10071e134: vmovaps xmm0, xmmword ptr [rdx + 0xd0]
0x10071e13c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x10071e144: vmovaps xmm0, xmmword ptr [rdx + 0xe0]
0x10071e14c: vmovaps xmmword ptr [rax + 0xe0], xmm0
0x10071e154: vmovaps xmm0, xmmword ptr [rdx + 0xf0]
0x10071e15c: vmovaps xmmword ptr [rax + 0xf0], xmm0
0x10071e164: vmovaps xmm0, xmmword ptr [rdx + 0x100]
0x10071e16c: vmovaps xmmword ptr [rax + 0x100], xmm0
0x10071e174: vmovaps xmm0, xmmword ptr [rdx + 0x110]
0x10071e17c: vmovaps xmmword ptr [rax + 0x110], xmm0
0x10071e184: vmovaps xmm0, xmmword ptr [rdx + 0x120]
0x10071e18c: vmovaps xmmword ptr [rax + 0x120], xmm0
0x10071e194: vmovaps xmm0, xmmword ptr [rdx + 0x130]
0x10071e19c: vmovaps xmmword ptr [rax + 0x130], xmm0
0x10071e1a4: vmovaps xmm0, xmmword ptr [rdx + 0x140]
0x10071e1ac: vmovaps xmmword ptr [rax + 0x140], xmm0
0x10071e1b4: vmovaps xmm0, xmmword ptr [rdx + 0x150]
0x10071e1bc: vmovaps xmmword ptr [rax + 0x150], xmm0
0x10071e1c4: vmovaps xmm0, xmmword ptr [rdx + 0x160]
0x10071e1cc: vmovaps xmmword ptr [rax + 0x160], xmm0
0x10071e1d4: vmovaps xmm0, xmmword ptr [rdx + 0x170]
0x10071e1dc: vmovaps xmmword ptr [rax + 0x170], xmm0
0x10071e1e4: vmovaps xmm0, xmmword ptr [rdx + 0x180]
0x10071e1ec: vmovaps xmmword ptr [rax + 0x180], xmm0
0x10071e1f4: vmovaps xmm0, xmmword ptr [rdx + 0x190]
0x10071e1fc: vmovaps xmmword ptr [rax + 0x190], xmm0
0x10071e204: vmovaps xmm0, xmmword ptr [rdx + 0x1a0]
0x10071e20c: vmovaps xmmword ptr [rax + 0x1a0], xmm0
0x10071e214: vmovaps xmm0, xmmword ptr [rdx + 0x1b0]
0x10071e21c: vmovaps xmmword ptr [rax + 0x1b0], xmm0
0x10071e224: vmovaps xmm0, xmmword ptr [rdx + 0x1c0]
0x10071e22c: vmovaps xmmword ptr [rax + 0x1c0], xmm0
0x10071e234: vmovaps xmm0, xmmword ptr [rdx + 0x1d0]
0x10071e23c: vmovaps xmmword ptr [rax + 0x1d0], xmm0
0x10071e244: vmovaps xmm0, xmmword ptr [rdx + 0x1e0]
0x10071e24c: vmovaps xmmword ptr [rax + 0x1e0], xmm0
0x10071e254: vmovaps xmm0, xmmword ptr [rdx + 0x1f0]
0x10071e25c: vmovaps xmmword ptr [rax + 0x1f0], xmm0
0x10071e264: vmovaps xmm0, xmmword ptr [rdx + 0x200]
0x10071e26c: vmovaps xmmword ptr [rax + 0x200], xmm0
0x10071e274: vmovaps xmm0, xmmword ptr [rdx + 0x210]
0x10071e27c: vmovaps xmmword ptr [rax + 0x210], xmm0
0x10071e284: vmovaps xmm0, xmmword ptr [rdx + 0x220]
0x10071e28c: vmovaps xmmword ptr [rax + 0x220], xmm0
0x10071e294: vmovaps xmm0, xmmword ptr [rdx + 0x230]
0x10071e29c: vmovaps xmmword ptr [rax + 0x230], xmm0
0x10071e2a4: vmovaps xmm0, xmmword ptr [rdx + 0x240]
0x10071e2ac: vmovaps xmmword ptr [rax + 0x240], xmm0
0x10071e2b4: vmovaps xmm0, xmmword ptr [rdx + 0x250]
0x10071e2bc: vmovaps xmmword ptr [rax + 0x250], xmm0
0x10071e2c4: vmovaps xmm0, xmmword ptr [rdx + 0x260]
0x10071e2cc: vmovaps xmmword ptr [rax + 0x260], xmm0
0x10071e2d4: vmovaps xmm0, xmmword ptr [rdx + 0x270]
0x10071e2dc: vmovaps xmmword ptr [rax + 0x270], xmm0
0x10071e2e4: vmovaps xmm0, xmmword ptr [rdx + 0x280]
0x10071e2ec: vmovaps xmmword ptr [rax + 0x280], xmm0
0x10071e2f4: vmovaps xmm0, xmmword ptr [rdx + 0x290]
0x10071e2fc: vmovaps xmmword ptr [rax + 0x290], xmm0
0x10071e304: vmovaps xmm0, xmmword ptr [rdx + 0x2a0]
0x10071e30c: vmovaps xmmword ptr [rax + 0x2a0], xmm0
0x10071e314: vmovaps xmm0, xmmword ptr [rdx + 0x2b0]
0x10071e31c: vmovaps xmmword ptr [rax + 0x2b0], xmm0
0x10071e324: vmovaps xmm0, xmmword ptr [rdx + 0x2c0]
0x10071e32c: vmovaps xmmword ptr [rax + 0x2c0], xmm0
0x10071e334: vmovaps xmm0, xmmword ptr [rdx + 0x2d0]
0x10071e33c: vmovaps xmmword ptr [rax + 0x2d0], xmm0
0x10071e344: vmovaps xmm0, xmmword ptr [rdx + 0x2e0]
0x10071e34c: vmovaps xmmword ptr [rax + 0x2e0], xmm0
0x10071e354: vmovaps xmm0, xmmword ptr [rdx + 0x2f0]
0x10071e35c: vmovaps xmmword ptr [rax + 0x2f0], xmm0
0x10071e364: cmp byte ptr [rip + 0x191db9d], 0 ; 0x10203bf08
0x10071e36b: jne 0x10071e72c
0x10071e371: jmp 0x10071e39a ; 0x10071e39a
0x10071e373: call 0x1002b9810 ; 0x1002b9810
0x10071e378: mov rsi, qword ptr [rbx + 0x10]
0x10071e37c: lea rdx, [rip + 0x192130d] ; 0x10203f690
0x10071e383: xor ecx, ecx
0x10071e385: mov rdi, rax
0x10071e388: call 0x1002bcda0 ; 0x1002bcda0
0x10071e38d: cmp byte ptr [rip + 0x191db74], 0 ; 0x10203bf08
0x10071e394: jne 0x10071e72c
0x10071e39a: mov eax, dword ptr [rbx + 0x2c]
0x10071e39d: imul eax, dword ptr [rbx + 0x28]
0x10071e3a1: test eax, eax
0x10071e3a3: je 0x10071e3bf
0x10071e3a5: mov rdi, qword ptr [rbx + 0x20]
0x10071e3a9: dec eax
0x10071e3ab: lea rdx, [rax*4 + 4]
0x10071e3b3: lea rsi, [rip + 0x3892a6] ; 0x100aa7660
0x10071e3ba: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10071e3bf: lea rdi, [rsp + 0x30]
0x10071e3c4: call 0x1007c2530 ; 0x1007c2530
0x10071e3c9: mov r12, qword ptr [r15 + 0x10]
0x10071e3cd: mov r15, qword ptr [r15 + 0xa0]
0x10071e3d4: call 0x1003f10c0 ; 0x1003f10c0
0x10071e3d9: mov rdi, r15
0x10071e3dc: mov rsi, rax
0x10071e3df: mov rdx, r12
0x10071e3e2: call 0x1007c4360 ; 0x1007c4360
0x10071e3e7: test rax, rax
0x10071e3ea: je 0x10071e3fb
0x10071e3ec: lea rsi, [rsp + 0x30]
0x10071e3f1: mov rdi, rax
0x10071e3f4: call 0x1007c2310 ; 0x1007c2310
0x10071e3f9: jmp 0x10071e40f ; 0x10071e40f
0x10071e3fb: call 0x1003f10c0 ; 0x1003f10c0
0x10071e400: mov rsi, qword ptr [rax + 8]
0x10071e404: mov rdi, r15
0x10071e407: mov rdx, r12
0x10071e40a: call 0x1007c4640 ; 0x1007c4640
0x10071e40f: mov rax, qword ptr [rsp + 0x30]
0x10071e414: mov rax, qword ptr [rax + 0x10]
0x10071e418: cmp dword ptr [rax + 0xdc], 0
0x10071e41f: je 0x10071e458
0x10071e421: mov rax, qword ptr [rax + 0x100]
0x10071e428: mov rdi, qword ptr [rbx + 0x20]
0x10071e42c: mov esi, dword ptr [rbx + 0x28]
0x10071e42f: mov edx, dword ptr [rbx + 0x2c]
0x10071e432: mov rcx, qword ptr [rax + 8]
0x10071e436: mov r9, qword ptr [rax + 0x10]
0x10071e43a: mov r8d, dword ptr [rax]
0x10071e43d: mov r10d, dword ptr [rax + 4]
0x10071e441: mov eax, 0x1c0
0x10071e446: add rax, qword ptr [rbx + 0x10]
0x10071e44a: mov qword ptr [rsp + 8], rax
0x10071e44f: mov dword ptr [rsp], r10d
0x10071e453: call 0x100720250 ; 0x100720250
0x10071e458: lea rdi, [rbx + 0x38]
0x10071e45c: lea rsi, [rbx + 0xd8]
0x10071e463: lea rdx, [rbx + 0x128]
0x10071e46a: mov ecx, dword ptr [rbx + 0x218]
0x10071e470: call 0x100720560 ; 0x100720560
0x10071e475: cmp byte ptr [rip + 0x191db6c], 0 ; 0x10203bfe8
0x10071e47c: je 0x10071e636
0x10071e482: mov rax, qword ptr [rbx + 0x220]
0x10071e489: test rax, rax
0x10071e48c: je 0x10071e636
0x10071e492: mov ecx, dword ptr [rbx + 0x230]
0x10071e498: mov edx, dword ptr [rbx + rcx*4 + 0xd8]
0x10071e49f: mov esi, dword ptr [rbx + rcx*4 + 0x128]
0x10071e4a6: vcvtsi2ss xmm0, xmm1, rdx
0x10071e4ab: vdivss xmm0, xmm0, dword ptr [rbx + rcx*4 + 0x178]
0x10071e4b4: vcvtsi2ss xmm1, xmm1, rsi
0x10071e4b9: vdivss xmm1, xmm1, dword ptr [rbx + rcx*4 + 0x1c8]
0x10071e4c2: vxorps ymm2, ymm2, ymm2
0x10071e4c6: vmovaps ymmword ptr [rsp + 0x80], ymm2
0x10071e4cf: mov qword ptr [rsp + 0xa0], 0
0x10071e4db: vxorps xmm2, xmm2, xmm2
0x10071e4df: vmovaps xmmword ptr [rsp + 0xd0], xmm2
0x10071e4e8: vmovaps xmm3, xmmword ptr [rip + 0x38c060] ; 0x100aaa550
0x10071e4f0: vmovaps xmmword ptr [rsp + 0xe0], xmm3
0x10071e4f9: mov dword ptr [rsp + 0xf0], 0x43b40000
0x10071e504: vmovaps xmm3, xmmword ptr [rip + 0x38a4f4] ; 0x100aa8a00
0x10071e50c: vmovaps xmmword ptr [rsp + 0x100], xmm3
0x10071e515: mov word ptr [rsp + 0x110], 0
0x10071e51f: lea rcx, [rip + 0x192118a] ; 0x10203f6b0
0x10071e526: vmovaps xmm3, xmmword ptr [rcx]
0x10071e52a: vmovaps xmmword ptr [rsp + 0x120], xmm3
0x10071e533: mov dword ptr [rsp + 0x131], 1
0x10071e53e: mov dword ptr [rsp + 0x138], 0
0x10071e549: mov byte ptr [rsp + 0x13c], 0
0x10071e551: mov qword ptr [rsp + 0x164], 0
0x10071e55d: mov dword ptr [rsp + 0x16c], 0
0x10071e568: vmovaps xmmword ptr [rsp + 0x140], xmm2
0x10071e571: mov byte ptr [rsp + 0x150], 0
0x10071e579: mov qword ptr [rsp + 0x154], 0
0x10071e585: mov qword ptr [rsp + 0x159], 0
0x10071e591: mov dword ptr [rsp + 0x170], 0xa
0x10071e59c: mov qword ptr [rsp + 0x98], rax
0x10071e5a4: vmovaps xmm2, xmmword ptr [rip + 0x38e8b4] ; 0x100aace60
0x10071e5ac: vmovaps xmmword ptr [rsp + 0xa0], xmm2
0x10071e5b5: vmovss xmm2, dword ptr [rip + 0x386b07] ; 0x100aa50c4
0x10071e5bd: vaddss xmm3, xmm0, xmm2
0x10071e5c1: vaddss xmm2, xmm1, xmm2
0x10071e5c5: vinsertps xmm2, xmm3, xmm2, 0x1c
0x10071e5cb: vmovaps xmmword ptr [rsp + 0xb0], xmm2
0x10071e5d4: mov dword ptr [rsp + 0xd0], 3
0x10071e5df: vinsertps xmm0, xmm0, xmm1, 0x1c
0x10071e5e5: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x10071e5ee: mov dword ptr [rsp + 0xd4], 3
0x10071e5f9: mov byte ptr [rsp + 0x130], 0
0x10071e601: lea rsi, [rsp + 0x80]
0x10071e609: mov rdi, r14
0x10071e60c: vzeroupper 
0x10071e60f: call 0x1003a7cf0 ; 0x1003a7cf0
0x10071e614: test byte ptr [rsp + 0x80], 1
0x10071e61c: je 0x10071e636
0x10071e61e: mov rbx, qword ptr [rsp + 0x90]
0x10071e626: call 0x1007e50d0 ; 0x1007e50d0
0x10071e62b: mov rdi, rax
0x10071e62e: mov rsi, rbx
0x10071e631: call 0x1007e5db0 ; 0x1007e5db0
0x10071e636: cmp byte ptr [rip + 0x191da1b], 0 ; 0x10203c058
0x10071e63d: je 0x10071e722
0x10071e643: mov rax, qword ptr [rsp + 0x30]
0x10071e648: mov rax, qword ptr [rax + 0x10]
0x10071e64c: cmp dword ptr [rax + 0xdc], 0
0x10071e653: je 0x10071e722
0x10071e659: mov rbx, qword ptr [rax + 0x100]
0x10071e660: call 0x1002b9810 ; 0x1002b9810
0x10071e665: mov r14, rax
0x10071e668: mov r15, qword ptr [rbx + 8]
0x10071e66c: mov r12, qword ptr [rbx + 0x10]
0x10071e670: mov ebx, dword ptr [rbx + 4]
0x10071e673: vmovss xmm0, dword ptr [rip + 0x386a45] ; 0x100aa50c0
0x10071e67b: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10071e684: vmovaps xmm0, xmmword ptr [rip + 0x389a14] ; 0x100aa80a0
0x10071e68c: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10071e695: vmovaps xmm0, xmmword ptr [rip + 0x38a393] ; 0x100aa8a30
0x10071e69d: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10071e6a6: vmovaps xmm0, xmmword ptr [rip + 0x38a352] ; 0x100aa8a00
0x10071e6ae: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x10071e6b7: vmovaps xmm0, xmmword ptr [rip + 0x3bb191] ; 0x100ad9850
0x10071e6bf: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x10071e6c5: lea rdi, [rsp + 0x70]
0x10071e6ca: lea rsi, [rsp + 0x60]
0x10071e6cf: vmovss xmm0, dword ptr [rip + 0x389ee1] ; 0x100aa85b8
0x10071e6d7: call 0x10077d310 ; 0x10077d310
0x10071e6dc: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x10071e6e2: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x10071e6e8: lea rax, [rsp + 0x50]
0x10071e6ed: mov qword ptr [rsp + 8], rax
0x10071e6f2: lea rax, [rsp + 0x80]
0x10071e6fa: mov qword ptr [rsp], rax
0x10071e6fe: mov dword ptr [rsp + 0x10], 0
0x10071e706: mov edx, 0x10
0x10071e70b: mov r8d, 2
0x10071e711: mov rdi, r14
0x10071e714: mov rsi, r15
0x10071e717: mov rcx, r12
0x10071e71a: mov r9d, ebx
0x10071e71d: call 0x1002bd580 ; 0x1002bd580
0x10071e722: lea rdi, [rsp + 0x30]
0x10071e727: call 0x1007c2570 ; 0x1007c2570
0x10071e72c: mov dword ptr [rsp + 0x80], r13d
0x10071e734: vldmxcsr dword ptr [rsp + 0x80]
0x10071e73d: mov rax, qword ptr [rip + 0x4ef194] ; 0x100c0d8d8
0x10071e744: mov rax, qword ptr [rax]
0x10071e747: cmp rax, qword ptr [rsp + 0x180]
0x10071e74f: jne 0x10071e760
0x10071e751: lea rsp, [rbp - 0x28]
0x10071e755: pop rbx
0x10071e756: pop r12
0x10071e758: pop r13
0x10071e75a: pop r14
0x10071e75c: pop r15
0x10071e75e: pop rbp
0x10071e75f: ret 
0x10071e760: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10071e765: mov rdi, rax
0x10071e768: call 0x100011bf0 ; 0x100011bf0
0x10071e76d: jmp 0x10071e7ae ; 0x10071e7ae
0x10071e76f: mov rbx, rax
0x10071e772: test byte ptr [rsp + 0x80], 1
0x10071e77a: je 0x10071e7b1
0x10071e77c: mov r14, qword ptr [rsp + 0x90]
0x10071e784: call 0x1007e50d0 ; 0x1007e50d0
0x10071e789: mov rdi, rax
0x10071e78c: mov rsi, r14
0x10071e78f: call 0x1007e5db0 ; 0x1007e5db0
0x10071e794: jmp 0x10071e7b1 ; 0x10071e7b1
0x10071e796: mov rdi, rax
0x10071e799: call 0x100011bf0 ; 0x100011bf0
0x10071e79e: jmp 0x10071e7ae ; 0x10071e7ae
0x10071e7a0: jmp 0x10071e7ae ; 0x10071e7ae
0x10071e7a2: jmp 0x10071e7ae ; 0x10071e7ae
0x10071e7a4: mov rbx, rax
0x10071e7a7: jmp 0x10071e7bb ; 0x10071e7bb
0x10071e7a9: mov rbx, rax
0x10071e7ac: jmp 0x10071e7bb ; 0x10071e7bb
0x10071e7ae: mov rbx, rax
0x10071e7b1: lea rdi, [rsp + 0x30]
0x10071e7b6: call 0x1007c2570 ; 0x1007c2570
0x10071e7bb: mov dword ptr [rsp + 0x80], r13d
0x10071e7c3: vldmxcsr dword ptr [rsp + 0x80]
0x10071e7cc: mov rdi, rbx
0x10071e7cf: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10071e7d4: nop word ptr cs:[rax + rax]
