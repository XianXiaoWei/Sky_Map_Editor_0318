0x1008d9792: push rbp
0x1008d9793: mov rbp, rsp
0x1008d9796: push r15
0x1008d9798: push r14
0x1008d979a: push r13
0x1008d979c: push r12
0x1008d979e: push rbx
0x1008d979f: sub rsp, 0xd8
0x1008d97a6: xor eax, eax
0x1008d97a8: mov dword ptr [rbp - 0x30], eax
0x1008d97ab: mov dword ptr [rbp - 0x3c], eax
0x1008d97ae: mov qword ptr [rbp - 0x70], 0
0x1008d97b6: mov dword ptr [rbp - 0x68], eax
0x1008d97b9: mov ebx, ecx
0x1008d97bb: mov r13, rdx
0x1008d97be: mov r12, rdi
0x1008d97c1: mov byte ptr [rbp - 0x64], 1
0x1008d97c5: mov dword ptr [rbp - 0x38], eax
0x1008d97c8: mov r15d, 0x1f
0x1008d97ce: cmp ebx, 0x100
0x1008d97d4: jg 0x1008d9c76
0x1008d97da: cmp qword ptr [r13 + 0xc0], 0
0x1008d97e2: je 0x1008d9805
0x1008d97e4: mov r14, qword ptr [r12]
0x1008d97e8: test r14, r14
0x1008d97eb: mov dword ptr [rbp - 0x34], r8d
0x1008d97ef: mov dword ptr [rbp - 0x74], esi
0x1008d97f2: je 0x1008d9810
0x1008d97f4: mov esi, 4
0x1008d97f9: mov rdi, r14
0x1008d97fc: call 0x10089770e ; 0x10089770e
0x1008d9801: mov dl, 1
0x1008d9803: jmp 0x1008d9812 ; 0x1008d9812
0x1008d9805: mov r15d, 0x35
0x1008d980b: jmp 0x1008d9c70 ; 0x1008d9c70
0x1008d9810: xor edx, edx
0x1008d9812: mov eax, dword ptr [r12 + 0xc]
0x1008d9817: test eax, eax
0x1008d9819: jle 0x1008d982e
0x1008d981b: xor ecx, ecx
0x1008d981d: cmp eax, ebx
0x1008d981f: mov r15d, 0x1c
0x1008d9825: cmove r15d, ecx
0x1008d9829: jmp 0x1008d9c5a ; 0x1008d9c5a
0x1008d982e: mov qword ptr [r12 + 0x4b8], 0
0x1008d983a: mov dword ptr [r12 + 0x10], 0
0x1008d9843: mov dword ptr [rbp - 0x2c], edx
0x1008d9846: call 0x1008d8f3a ; 0x1008d8f3a
0x1008d984b: mov rcx, qword ptr [rax + 0x38]
0x1008d984f: mov qword ptr [rbp - 0xc8], rcx
0x1008d9856: mov rcx, qword ptr [rax + 0x30]
0x1008d985a: mov qword ptr [rbp - 0xd0], rcx
0x1008d9861: mov rcx, qword ptr [rax + 0x28]
0x1008d9865: mov qword ptr [rbp - 0xd8], rcx
0x1008d986c: mov rcx, qword ptr [rax + 0x20]
0x1008d9870: mov qword ptr [rbp - 0xe0], rcx
0x1008d9877: mov rcx, qword ptr [rax + 0x18]
0x1008d987b: mov qword ptr [rbp - 0xe8], rcx
0x1008d9882: mov rcx, qword ptr [rax + 0x10]
0x1008d9886: mov qword ptr [rbp - 0xf0], rcx
0x1008d988d: mov rcx, qword ptr [rax]
0x1008d9890: mov rax, qword ptr [rax + 8]
0x1008d9894: mov qword ptr [rbp - 0xf8], rax
0x1008d989b: mov qword ptr [rbp - 0x100], rcx
0x1008d98a2: mov r9, qword ptr [r12 + 0x4b8]
0x1008d98aa: lea rdx, [rbp - 0x3c]
0x1008d98ae: lea rcx, [rbp - 0x30]
0x1008d98b2: lea r8, [rbp - 0x38]
0x1008d98b6: mov edi, 0
0x1008d98bb: mov esi, dword ptr [rbp - 0x34]
0x1008d98be: call qword ptr [r13 + 0xc0]
0x1008d98c5: mov edx, dword ptr [rbp - 0x2c]
0x1008d98c8: mov r15d, eax
0x1008d98cb: test r15d, r15d
0x1008d98ce: jne 0x1008d9c5a
0x1008d98d4: mov eax, dword ptr [rbp - 0x30]
0x1008d98d7: cmp eax, 1
0x1008d98da: ja 0x1008d9902
0x1008d98dc: mov rdi, qword ptr [r12]
0x1008d98e0: lea rsi, [rbp - 0x30]
0x1008d98e4: xor edx, edx
0x1008d98e6: call 0x100921702 ; 0x100921702
0x1008d98eb: mov r15d, eax
0x1008d98ee: test r15d, r15d
0x1008d98f1: mov edx, dword ptr [rbp - 0x2c]
0x1008d98f4: jne 0x1008d9c5a
0x1008d98fa: mov eax, dword ptr [rbp - 0x30]
0x1008d98fd: mov ecx, dword ptr [rbp - 0x34]
0x1008d9900: jmp 0x1008d9913 ; 0x1008d9913
0x1008d9902: cmp eax, -1
0x1008d9905: mov ecx, dword ptr [rbp - 0x34]
0x1008d9908: jne 0x1008d9913
0x1008d990a: mov dword ptr [rbp - 0x30], 0
0x1008d9911: xor eax, eax
0x1008d9913: mov esi, dword ptr [r13 + 0x5c]
0x1008d9917: mov edi, dword ptr [rbp - 0xf0]
0x1008d991d: lea edx, [rax + rax + 0x10]
0x1008d9921: imul edx, ecx
0x1008d9924: mov qword ptr [rbp - 0x58], rdi
0x1008d9928: lea eax, [rdi + 0x2f]
0x1008d992b: and eax, 0xfffffff0
0x1008d992e: mov qword ptr [rbp - 0x50], rsi
0x1008d9932: lea ecx, [rsi + 0x2f]
0x1008d9935: and ecx, 0xfffffff0
0x1008d9938: add ecx, eax
0x1008d993a: mov eax, dword ptr [rbp - 0x3c]
0x1008d993d: add eax, 0x1f
0x1008d9940: and eax, 0xfffffff0
0x1008d9943: add eax, ecx
0x1008d9945: add edx, 0x2f
0x1008d9948: and edx, 0xfffffff0
0x1008d994b: add edx, eax
0x1008d994d: lea eax, [rbx*8 + 0x44f]
0x1008d9954: and eax, 0xfffffff0
0x1008d9957: imul edx, ebx
0x1008d995a: add edx, eax
0x1008d995c: lea rdi, [r12 + 0x128]
0x1008d9964: mov r8d, dword ptr [rbp - 0x38]
0x1008d9968: xor esi, esi
0x1008d996a: mov ecx, 1
0x1008d996f: mov qword ptr [rbp - 0x60], rdi
0x1008d9973: call 0x1009029a0 ; 0x1009029a0
0x1008d9978: mov r15d, eax
0x1008d997b: test r15d, r15d
0x1008d997e: mov edx, dword ptr [rbp - 0x2c]
0x1008d9981: jne 0x1008d9c5a
0x1008d9987: lea esi, [rbx*8]
0x1008d998e: lea rdx, [rip + 0x2cb443] ; 0x100ba4dd8
0x1008d9995: xor ecx, ecx
0x1008d9997: xor r8d, r8d
0x1008d999a: mov rdi, qword ptr [rbp - 0x60]
0x1008d999e: call 0x1009020fc ; 0x1009020fc
0x1008d99a3: mov qword ptr [r12 + 0x18], rax
0x1008d99a8: mov r15d, 0x26
0x1008d99ae: test rax, rax
0x1008d99b1: je 0x1008d9c57
0x1008d99b7: mov qword ptr [rbp - 0x48], r14
0x1008d99bb: mov qword ptr [rbp - 0x70], rax
0x1008d99bf: mov dword ptr [rbp - 0x68], ebx
0x1008d99c2: test ebx, ebx
0x1008d99c4: mov rdx, qword ptr [rbp - 0x58]
0x1008d99c8: jle 0x1008d9c42
0x1008d99ce: mov rax, qword ptr [rbp - 0x50]
0x1008d99d2: add eax, 0x10
0x1008d99d5: mov qword ptr [rbp - 0x50], rax
0x1008d99d9: add edx, 0x10
0x1008d99dc: movsxd rax, ebx
0x1008d99df: mov qword ptr [rbp - 0xa0], rax
0x1008d99e6: lea rax, [rip + 0x3557f3] ; 0x100c2f1e0
0x1008d99ed: add rax, 0x10
0x1008d99f1: mov qword ptr [rbp - 0xb0], rax
0x1008d99f8: lea rax, [rip + 0x3559c1] ; 0x100c2f3c0
0x1008d99ff: add rax, 0x10
0x1008d9a03: mov qword ptr [rbp - 0xa8], rax
0x1008d9a0a: xor eax, eax
0x1008d9a0c: mov qword ptr [rbp - 0x80], rax
0x1008d9a10: mov qword ptr [rbp - 0x58], rdx
0x1008d9a14: mov qword ptr [rbp - 0x98], r13
0x1008d9a1b: lea rax, [rbp - 0x90]
0x1008d9a22: mov qword ptr [rbp - 0xe0], rax
0x1008d9a29: mov eax, dword ptr [rbp - 0x30]
0x1008d9a2c: mov dword ptr [rbp - 0x90], eax
0x1008d9a32: mov eax, dword ptr [rbp - 0x34]
0x1008d9a35: mov dword ptr [rbp - 0x8c], eax
0x1008d9a3b: mov dword ptr [rbp - 0x88], 2
0x1008d9a45: mov byte ptr [rbp - 0x84], 0
0x1008d9a4c: xor ecx, ecx
0x1008d9a4e: xor r8d, r8d
0x1008d9a51: mov rdi, qword ptr [rbp - 0x60]
0x1008d9a55: mov rsi, rdx
0x1008d9a58: lea rdx, [rip + 0x2cb379] ; 0x100ba4dd8
0x1008d9a5f: call 0x1009020fc ; 0x1009020fc
0x1008d9a64: mov r14, rax
0x1008d9a67: test r14, r14
0x1008d9a6a: je 0x1008d9c53
0x1008d9a70: add r14, 0xf
0x1008d9a74: and r14, 0xfffffffffffffff0
0x1008d9a78: mov rdi, r14
0x1008d9a7b: call 0x1008eadc8 ; 0x1008eadc8
0x1008d9a80: mov rax, qword ptr [rbp - 0xb0]
0x1008d9a87: mov qword ptr [r14], rax
0x1008d9a8a: lea rdi, [r14 + 0x2f8]
0x1008d9a91: mov qword ptr [rbp - 0xb8], rdi
0x1008d9a98: call 0x1008fafb4 ; 0x1008fafb4
0x1008d9a9d: mov rax, qword ptr [rbp - 0xa8]
0x1008d9aa4: mov qword ptr [r14 + 0x2f8], rax
0x1008d9aab: mov dword ptr [r14 + 0x330], 1
0x1008d9ab6: mov qword ptr [rbp - 0xc0], r14
0x1008d9abd: mov rdi, qword ptr [r12]
0x1008d9ac1: xor edx, edx
0x1008d9ac3: xor r8d, r8d
0x1008d9ac6: lea rsi, [rbp - 0x100]
0x1008d9acd: lea rcx, [rbp - 0xc0]
0x1008d9ad4: call 0x100891f08 ; 0x100891f08
0x1008d9ad9: test eax, eax
0x1008d9adb: jne 0x1008d9c50
0x1008d9ae1: xor ecx, ecx
0x1008d9ae3: xor r8d, r8d
0x1008d9ae6: mov rdi, qword ptr [rbp - 0x60]
0x1008d9aea: mov rsi, qword ptr [rbp - 0x50]
0x1008d9aee: lea rdx, [rip + 0x2cb2e3] ; 0x100ba4dd8
0x1008d9af5: call 0x1009020fc ; 0x1009020fc
0x1008d9afa: mov qword ptr [r14 + 0x2e0], rax
0x1008d9b01: test rax, rax
0x1008d9b04: je 0x1008d9c53
0x1008d9b0a: mov ecx, dword ptr [rax + 0xb0]
0x1008d9b10: mov dword ptr [rax + 0x50], ecx
0x1008d9b13: xor edx, edx
0x1008d9b15: mov qword ptr [rax + 0x168], rdx
0x1008d9b1c: mov qword ptr [rax + 0x188], rdx
0x1008d9b23: mov dword ptr [rax], edx
0x1008d9b25: mov qword ptr [rax + 8], rdx
0x1008d9b29: mov qword ptr [rax + 0x158], rdx
0x1008d9b30: mov qword ptr [rax + 0x150], rdx
0x1008d9b37: mov qword ptr [rax + 0x148], rdx
0x1008d9b3e: mov qword ptr [rax + 0x140], rdx
0x1008d9b45: mov dword ptr [rax + 0x40], 3
0x1008d9b4c: lea rcx, [rip - 0x2032f] ; 0x1008b9824
0x1008d9b53: mov qword ptr [rax + 0x28], rcx
0x1008d9b57: lea rcx, [rip - 0x20322] ; 0x1008b983c
0x1008d9b5e: mov qword ptr [rax + 0x30], rcx
0x1008d9b62: lea rcx, [rip - 0x20321] ; 0x1008b9848
0x1008d9b69: mov qword ptr [rax + 0x38], rcx
0x1008d9b6d: mov qword ptr [r14 + 0x230], rdx
0x1008d9b74: mov qword ptr [r14 + 0x2e8], rdx
0x1008d9b7b: mov rdi, qword ptr [r14 + 0x2e0]
0x1008d9b82: add rdi, 0x58
0x1008d9b86: mov edx, 0xd8
0x1008d9b8b: mov rsi, r13
0x1008d9b8e: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1008d9b93: mov rax, qword ptr [r14 + 0x2e0]
0x1008d9b9a: mov edx, dword ptr [rbp - 0x74]
0x1008d9b9d: mov dword ptr [rax + 0xc4], edx
0x1008d9ba3: lea rcx, [rip + 0xf0] ; 0x1008d9c9a
0x1008d9baa: mov qword ptr [rax + 0xa8], rcx
0x1008d9bb1: lea rcx, [r14 + 0x2a8]
0x1008d9bb8: mov qword ptr [rax + 8], rcx
0x1008d9bbc: mov rcx, qword ptr [rbp - 0xb8]
0x1008d9bc3: mov qword ptr [rax + 0x190], rcx
0x1008d9bca: mov qword ptr [rax + 0x18], rcx
0x1008d9bce: mov ecx, 0
0x1008d9bd3: mov dword ptr [rax + 0x130], ecx
0x1008d9bd9: mov rcx, qword ptr [r12]
0x1008d9bdd: mov qword ptr [rax + 0x48], rcx
0x1008d9be1: mov qword ptr [r14 + 0x290], r12
0x1008d9be8: mov r13, qword ptr [rbp - 0x80]
0x1008d9bec: mov dword ptr [r14 + 0x2a0], r13d
0x1008d9bf3: mov dword ptr [r14 + 0x2a4], edx
0x1008d9bfa: mov rax, qword ptr [r14]
0x1008d9bfd: mov esi, 1
0x1008d9c02: mov edx, 1
0x1008d9c07: xor ecx, ecx
0x1008d9c09: mov rdi, r14
0x1008d9c0c: call qword ptr [rax + 0x18]
0x1008d9c0f: or byte ptr [r14 + 0x5d], 8
0x1008d9c14: mov byte ptr [r12 + r13 + 0x20], 0
0x1008d9c1a: mov rax, qword ptr [r12 + 0x18]
0x1008d9c1f: mov qword ptr [rax + r13*8], r14
0x1008d9c23: inc r13
0x1008d9c26: mov qword ptr [rbp - 0x80], r13
0x1008d9c2a: cmp r13, qword ptr [rbp - 0xa0]
0x1008d9c31: mov r13, qword ptr [rbp - 0x98]
0x1008d9c38: mov rdx, qword ptr [rbp - 0x58]
0x1008d9c3c: jl 0x1008d9a1b
0x1008d9c42: mov dword ptr [r12 + 0xc], ebx
0x1008d9c47: mov byte ptr [rbp - 0x64], 0
0x1008d9c4b: xor r15d, r15d
0x1008d9c4e: jmp 0x1008d9c53 ; 0x1008d9c53
0x1008d9c50: mov r15d, eax
0x1008d9c53: mov r14, qword ptr [rbp - 0x48]
0x1008d9c57: mov edx, dword ptr [rbp - 0x2c]
0x1008d9c5a: test r14, r14
0x1008d9c5d: je 0x1008d9c70
0x1008d9c5f: test dl, dl
0x1008d9c61: je 0x1008d9c70
0x1008d9c63: mov esi, 4
0x1008d9c68: mov rdi, r14
0x1008d9c6b: call 0x10089772e ; 0x10089772e
0x1008d9c70: cmp byte ptr [rbp - 0x64], 0
0x1008d9c74: je 0x1008d9c84
0x1008d9c76: lea rdi, [rbp - 0x70]
0x1008d9c7a: mov esi, 1
0x1008d9c7f: call 0x1008d9fc2 ; 0x1008d9fc2
0x1008d9c84: mov eax, r15d
0x1008d9c87: add rsp, 0xd8
0x1008d9c8e: pop rbx
0x1008d9c8f: pop r12
0x1008d9c91: pop r13
0x1008d9c93: pop r14
0x1008d9c95: pop r15
0x1008d9c97: pop rbp
0x1008d9c98: ret 
0x1008d9c99: nop 
