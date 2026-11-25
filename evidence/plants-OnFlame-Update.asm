0x100342910: push rbp
0x100342911: mov rbp, rsp
0x100342914: push r15
0x100342916: push r14
0x100342918: push r13
0x10034291a: push r12
0x10034291c: push rbx
0x10034291d: sub rsp, 0x28
0x100342921: mov rbx, rdi
0x100342924: mov cl, byte ptr [rbx + 0x49]
0x100342927: mov rax, qword ptr [rbx + 0x38]
0x10034292b: mov edx, dword ptr [rax + 0x10]
0x10034292e: vxorps xmm0, xmm0, xmm0
0x100342932: vmovss dword ptr [rbp - 0x2c], xmm0
0x100342937: test cl, cl
0x100342939: je 0x100342945
0x10034293b: vcvtsi2ss xmm0, xmm1, rdx
0x100342940: vmovss dword ptr [rbp - 0x2c], xmm0
0x100342945: test edx, edx
0x100342947: mov qword ptr [rbp - 0x48], rbx
0x10034294b: je 0x100342b37
0x100342951: xor r14d, r14d
0x100342954: lea r15, [rbp - 0x38]
0x100342958: lea r12, [rbp - 0x40]
0x10034295c: nop dword ptr [rax]
0x100342960: mov rax, qword ptr [rax + 8]
0x100342964: mov r14d, r14d
0x100342967: mov rax, qword ptr [rax + r14*8]
0x10034296b: mov qword ptr [rbp - 0x40], rax
0x10034296f: call 0x1007abc10 ; 0x1007abc10
0x100342974: mov r13, rax
0x100342977: mov qword ptr [rbp - 0x38], 0
0x10034297f: call 0x1007abc10 ; 0x1007abc10
0x100342984: mov rbx, qword ptr [rax]
0x100342987: mov rdi, rax
0x10034298a: mov rsi, r15
0x10034298d: mov rdx, r12
0x100342990: mov rcx, r13
0x100342993: call qword ptr [rbx + 0x40]
0x100342996: mov rax, qword ptr [rbp - 0x38]
0x10034299a: test rax, rax
0x10034299d: je 0x100342d69
0x1003429a3: mov qword ptr [rbp - 0x40], rax
0x1003429a7: call 0x1007abc10 ; 0x1007abc10
0x1003429ac: mov qword ptr [rbp - 0x38], 0
0x1003429b4: mov rdi, qword ptr [rip + 0x1ab2ad5] ; 0x101df5490
0x1003429bb: mov rbx, qword ptr [rdi]
0x1003429be: mov rsi, r15
0x1003429c1: mov rdx, r12
0x1003429c4: mov rcx, rax
0x1003429c7: call qword ptr [rbx + 0x40]
0x1003429ca: mov rax, qword ptr [rbp - 0x48]
0x1003429ce: mov rax, qword ptr [rax + 0x38]
0x1003429d2: cmp dword ptr [rax + 0x10], r14d
0x1003429d6: mov rbx, r15
0x1003429d9: jbe 0x100342d88
0x1003429df: mov r13, qword ptr [rbp - 0x38]
0x1003429e3: mov rax, qword ptr [rax + 8]
0x1003429e7: mov rax, qword ptr [rax + r14*8]
0x1003429eb: mov qword ptr [rbp - 0x40], rax
0x1003429ef: call 0x1007abc10 ; 0x1007abc10
0x1003429f4: mov r15, rax
0x1003429f7: mov qword ptr [rbp - 0x38], 0
0x1003429ff: call 0x1007abc10 ; 0x1007abc10
0x100342a04: mov r8, qword ptr [rax]
0x100342a07: mov rdi, rax
0x100342a0a: mov rsi, rbx
0x100342a0d: mov rdx, r12
0x100342a10: mov rcx, r15
0x100342a13: call qword ptr [r8 + 0x40]
0x100342a17: mov rax, qword ptr [rbp - 0x38]
0x100342a1b: test rax, rax
0x100342a1e: je 0x100342d69
0x100342a24: mov qword ptr [rbp - 0x40], rax
0x100342a28: call 0x1007abc10 ; 0x1007abc10
0x100342a2d: mov r15, rax
0x100342a30: mov qword ptr [rbp - 0x38], 0
0x100342a38: call 0x1001e8c00 ; 0x1001e8c00
0x100342a3d: mov r8, qword ptr [rax]
0x100342a40: mov rdi, rax
0x100342a43: mov rsi, rbx
0x100342a46: mov rdx, r12
0x100342a49: mov rcx, r15
0x100342a4c: call qword ptr [r8 + 0x40]
0x100342a50: mov rax, qword ptr [rbp - 0x38]
0x100342a54: test rax, rax
0x100342a57: je 0x100342a68
0x100342a59: mov rax, qword ptr [rax + 0x90]
0x100342a60: mov rax, qword ptr [rax + 0x40]
0x100342a64: mov r13, qword ptr [rax + 0x10]
0x100342a68: test r13, r13
0x100342a6b: mov rbx, qword ptr [rbp - 0x48]
0x100342a6f: je 0x100342da7
0x100342a75: cmp byte ptr [rbx + 0x49], 0
0x100342a79: lea r15, [rbp - 0x38]
0x100342a7d: je 0x100342aa0
0x100342a7f: cmp byte ptr [rbx + 0x4b], 0
0x100342a83: je 0x100342ac0
0x100342a85: cmp byte ptr [r13 + 0xb6], 0
0x100342a8d: jne 0x100342aea
0x100342a8f: jmp 0x100342afc ; 0x100342afc
0x100342a91: nop word ptr cs:[rax + rax]
0x100342aa0: mov rax, qword ptr [r13]
0x100342aa4: mov rdi, r13
0x100342aa7: call qword ptr [rax + 0x10]
0x100342aaa: test al, al
0x100342aac: je 0x100342afc
0x100342aae: cmp byte ptr [rbx + 0x48], 0
0x100342ab2: je 0x100342b0f
0x100342ab4: cmp byte ptr [r13 + 0x138], 0
0x100342abc: je 0x100342afc
0x100342abe: jmp 0x100342b27 ; 0x100342b27
0x100342ac0: cmp byte ptr [rbx + 0x48], 0
0x100342ac4: je 0x100342ad2
0x100342ac6: cmp byte ptr [r13 + 0x138], 0
0x100342ace: jne 0x100342adc
0x100342ad0: jmp 0x100342aea ; 0x100342aea
0x100342ad2: cmp byte ptr [r13 + 0xb6], 0
0x100342ada: je 0x100342aea
0x100342adc: mov rax, qword ptr [r13]
0x100342ae0: mov rdi, r13
0x100342ae3: call qword ptr [rax + 0x10]
0x100342ae6: test al, al
0x100342ae8: jne 0x100342afc
0x100342aea: vmovss xmm0, dword ptr [rbp - 0x2c]
0x100342aef: vaddss xmm0, xmm0, dword ptr [rip + 0x7625cd] ; 0x100aa50c4
0x100342af7: vmovss dword ptr [rbp - 0x2c], xmm0
0x100342afc: inc r14d
0x100342aff: mov rax, qword ptr [rbx + 0x38]
0x100342b03: cmp r14d, dword ptr [rax + 0x10]
0x100342b07: jb 0x100342960
0x100342b0d: jmp 0x100342b34 ; 0x100342b34
0x100342b0f: cmp byte ptr [rbx + 0x4b], 0
0x100342b13: movzx eax, byte ptr [r13 + 0xb6]
0x100342b1b: je 0x100342b23
0x100342b1d: test al, al
0x100342b1f: jne 0x100342afc
0x100342b21: jmp 0x100342b27 ; 0x100342b27
0x100342b23: test al, al
0x100342b25: je 0x100342afc
0x100342b27: vmovss xmm0, dword ptr [rip + 0x762591] ; 0x100aa50c0
0x100342b2f: vmovss dword ptr [rbp - 0x2c], xmm0
0x100342b34: mov cl, byte ptr [rbx + 0x49]
0x100342b37: test cl, cl
0x100342b39: je 0x100342b62
0x100342b3b: mov rax, qword ptr [rbx + 0x38]
0x100342b3f: mov eax, dword ptr [rax + 0x10]
0x100342b42: vcvtsi2ss xmm0, xmm1, rax
0x100342b47: vmulss xmm0, xmm0, dword ptr [rbx + 0x50]
0x100342b4c: vroundss xmm0, xmm0, xmm0, 0xa
0x100342b52: vmovss xmm1, dword ptr [rbp - 0x2c]
0x100342b57: vucomiss xmm1, xmm0
0x100342b5b: jae 0x100342b7b
0x100342b5d: jmp 0x100342d5a ; 0x100342d5a
0x100342b62: vmovss xmm0, dword ptr [rbp - 0x2c]
0x100342b67: vucomiss xmm0, dword ptr [rip + 0x762551] ; 0x100aa50c0
0x100342b6f: jne 0x100342d5a
0x100342b75: jp 0x100342d5a
0x100342b7b: mov rdi, qword ptr [rbx + 0x40]
0x100342b7f: mov esi, 1
0x100342b84: call 0x1004d1f60 ; 0x1004d1f60
0x100342b89: cmp byte ptr [rbx + 0x4b], 0
0x100342b8d: jne 0x100342d47
0x100342b93: mov rax, qword ptr [rbp - 0x48]
0x100342b97: mov rax, qword ptr [rax + 0x38]
0x100342b9b: cmp dword ptr [rax + 0x10], 0
0x100342b9f: je 0x100342d47
0x100342ba5: xor ebx, ebx
0x100342ba7: lea r12, [rbp - 0x38]
0x100342bab: lea r15, [rbp - 0x40]
0x100342baf: nop 
0x100342bb0: mov rax, qword ptr [rax + 8]
0x100342bb4: mov ebx, ebx
0x100342bb6: mov rax, qword ptr [rax + rbx*8]
0x100342bba: mov qword ptr [rbp - 0x40], rax
0x100342bbe: call 0x1007abc10 ; 0x1007abc10
0x100342bc3: mov r13, rax
0x100342bc6: mov qword ptr [rbp - 0x38], 0
0x100342bce: call 0x1007abc10 ; 0x1007abc10
0x100342bd3: mov r8, qword ptr [rax]
0x100342bd6: mov rdi, rax
0x100342bd9: mov rsi, r12
0x100342bdc: mov rdx, r15
0x100342bdf: mov rcx, r13
0x100342be2: call qword ptr [r8 + 0x40]
0x100342be6: mov rax, qword ptr [rbp - 0x38]
0x100342bea: test rax, rax
0x100342bed: je 0x100342d69
0x100342bf3: mov qword ptr [rbp - 0x40], rax
0x100342bf7: call 0x1007abc10 ; 0x1007abc10
0x100342bfc: mov qword ptr [rbp - 0x38], 0
0x100342c04: mov rdi, qword ptr [rip + 0x1ab2885] ; 0x101df5490
0x100342c0b: mov r8, qword ptr [rdi]
0x100342c0e: mov rsi, r12
0x100342c11: mov rdx, r15
0x100342c14: mov rcx, rax
0x100342c17: call qword ptr [r8 + 0x40]
0x100342c1b: mov rax, qword ptr [rbp - 0x48]
0x100342c1f: mov rax, qword ptr [rax + 0x38]
0x100342c23: cmp dword ptr [rax + 0x10], ebx
0x100342c26: jbe 0x100342d88
0x100342c2c: mov r14, qword ptr [rbp - 0x38]
0x100342c30: mov rax, qword ptr [rax + 8]
0x100342c34: mov rax, qword ptr [rax + rbx*8]
0x100342c38: mov qword ptr [rbp - 0x40], rax
0x100342c3c: call 0x1007abc10 ; 0x1007abc10
0x100342c41: mov r13, rax
0x100342c44: mov qword ptr [rbp - 0x38], 0
0x100342c4c: call 0x1007abc10 ; 0x1007abc10
0x100342c51: mov r8, qword ptr [rax]
0x100342c54: mov rdi, rax
0x100342c57: mov rsi, r12
0x100342c5a: mov rdx, r15
0x100342c5d: mov rcx, r13
0x100342c60: call qword ptr [r8 + 0x40]
0x100342c64: mov rax, qword ptr [rbp - 0x38]
0x100342c68: test rax, rax
0x100342c6b: je 0x100342d69
0x100342c71: mov qword ptr [rbp - 0x40], rax
0x100342c75: call 0x1007abc10 ; 0x1007abc10
0x100342c7a: mov r13, rax
0x100342c7d: mov qword ptr [rbp - 0x38], 0
0x100342c85: call 0x1001e8c00 ; 0x1001e8c00
0x100342c8a: mov r8, qword ptr [rax]
0x100342c8d: mov rdi, rax
0x100342c90: mov rsi, r12
0x100342c93: mov rdx, r15
0x100342c96: mov rcx, r13
0x100342c99: call qword ptr [r8 + 0x40]
0x100342c9d: mov rax, qword ptr [rbp - 0x38]
0x100342ca1: test rax, rax
0x100342ca4: je 0x100342cf0
0x100342ca6: mov rax, qword ptr [rax + 0x90]
0x100342cad: mov rcx, qword ptr [rax + 0x40]
0x100342cb1: mov rcx, qword ptr [rcx + 0x10]
0x100342cb5: mov byte ptr [rcx + 0xb6], 1
0x100342cbc: mov rdx, qword ptr [rbp - 0x48]
0x100342cc0: vmovss xmm0, dword ptr [rdx + 0x4c]
0x100342cc5: vucomiss xmm0, dword ptr [rip + 0x764417] ; 0x100aa70e4
0x100342ccd: jbe 0x100342cf0
0x100342ccf: mov byte ptr [rax + 0x60], 1
0x100342cd3: vmovss dword ptr [rax + 0x54], xmm0
0x100342cd8: mov dword ptr [rax + 0x58], 0
0x100342cdf: mov dword ptr [rcx + 0x10c], 0x3f000000
0x100342ce9: mov byte ptr [rcx + 0x138], 1
0x100342cf0: test r14, r14
0x100342cf3: je 0x100342d34
0x100342cf5: mov byte ptr [r14 + 0xb6], 1
0x100342cfd: mov rax, qword ptr [rbp - 0x48]
0x100342d01: vmovss xmm0, dword ptr [rax + 0x4c]
0x100342d06: vucomiss xmm0, dword ptr [rip + 0x7643d6] ; 0x100aa70e4
0x100342d0e: jbe 0x100342d34
0x100342d10: mov byte ptr [r14 + 0xb8], 1
0x100342d18: vmovss dword ptr [r14 + 0xa0], xmm0
0x100342d21: mov dword ptr [r14 + 0x10c], 0x3f000000
0x100342d2c: mov byte ptr [r14 + 0x138], 1
0x100342d34: inc ebx
0x100342d36: mov rax, qword ptr [rbp - 0x48]
0x100342d3a: mov rax, qword ptr [rax + 0x38]
0x100342d3e: cmp ebx, dword ptr [rax + 0x10]
0x100342d41: jb 0x100342bb0
0x100342d47: mov rdi, qword ptr [rbp - 0x48]
0x100342d4b: cmp byte ptr [rdi + 0x4a], 0
0x100342d4f: je 0x100342d5a
0x100342d51: mov byte ptr [rdi + 0x54], 1
0x100342d55: call 0x10032ef60 ; 0x10032ef60
0x100342d5a: add rsp, 0x28
0x100342d5e: pop rbx
0x100342d5f: pop r12
0x100342d61: pop r13
0x100342d63: pop r14
0x100342d65: pop r15
0x100342d67: pop rbp
0x100342d68: ret 
0x100342d69: lea rdi, [rip + 0x81ed88] ; 0x100b61af8 ret
0x100342d70: lea rsi, [rip + 0x81ebec] ; 0x100b61963 ./Clump.h
0x100342d77: mov edx, 0x47
0x100342d7c: mov ecx, 3
0x100342d81: call 0x1007e5f70 ; 0x1007e5f70
0x100342d86: ud2 
0x100342d88: lea rdi, [rip + 0x81ebc9] ; 0x100b61958 idx < size
0x100342d8f: lea rsi, [rip + 0x81ebcd] ; 0x100b61963 ./Clump.h
0x100342d96: mov edx, 0x36
0x100342d9b: mov ecx, 3
0x100342da0: call 0x1007e5f70 ; 0x1007e5f70
0x100342da5: ud2 
0x100342da7: lea rdi, [rip + 0x81d591] ; 0x100b6033f flame
0x100342dae: lea rsi, [rip + 0x83e8d8] ; 0x100b8168d FlameBarn.cpp
0x100342db5: mov edx, 0x510
0x100342dba: mov ecx, 3
0x100342dbf: call 0x1007e5f70 ; 0x1007e5f70
0x100342dc4: ud2 
0x100342dc6: nop word ptr cs:[rax + rax]
