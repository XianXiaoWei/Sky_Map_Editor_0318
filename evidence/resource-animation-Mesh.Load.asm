0x1004559e0: push rbp
0x1004559e1: mov rbp, rsp
0x1004559e4: push r15
0x1004559e6: push r14
0x1004559e8: push r13
0x1004559ea: push r12
0x1004559ec: push rbx
0x1004559ed: sub rsp, 0x228
0x1004559f4: mov r15, r8
0x1004559f7: mov ebx, ecx
0x1004559f9: mov r13, rdx
0x1004559fc: mov r14, rsi
0x1004559ff: mov r12, rdi
0x100455a02: mov rax, qword ptr [rip + 0x7b7ecf] ; 0x100c0d8d8
0x100455a09: mov rax, qword ptr [rax]
0x100455a0c: mov qword ptr [rbp - 0x30], rax
0x100455a10: mov edx, 0x40
0x100455a15: mov rdi, r14
0x100455a18: mov rsi, r12
0x100455a1b: call 0x10076a0a0 ; 0x10076a0a0
0x100455a20: lea rsi, [r12 + 0x40]
0x100455a25: mov rdi, r14
0x100455a28: call 0x10076a240 ; 0x10076a240
0x100455a2d: cmp ebx, 0x1b
0x100455a30: ja 0x100455ba3
0x100455a36: mov qword ptr [rbp - 0x230], r12
0x100455a3d: mov qword ptr [rbp - 0x240], r15
0x100455a44: lea rdi, [rbp - 0xc8]
0x100455a4b: lea r12, [rbp - 0x210]
0x100455a52: mov rax, qword ptr [rip + 0x7b4ac7] ; 0x100c0a520
0x100455a59: lea rcx, [rax + 0x18]
0x100455a5d: mov qword ptr [rbp - 0x218], rcx
0x100455a64: add rax, 0x40
0x100455a68: mov qword ptr [rbp - 0xc8], rax
0x100455a6f: mov rsi, r12
0x100455a72: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100455a77: mov dword ptr [rbp - 0x220], ebx
0x100455a7d: mov qword ptr [rbp - 0x250], r13
0x100455a84: mov qword ptr [rbp - 0x40], 0
0x100455a8c: mov dword ptr [rbp - 0x38], 0xffffffff
0x100455a93: mov r15, qword ptr [rip + 0x7b7b2e] ; 0x100c0d5c8
0x100455a9a: lea rbx, [r15 + 0x18]
0x100455a9e: mov qword ptr [rbp - 0x218], rbx
0x100455aa5: add r15, 0x40
0x100455aa9: mov qword ptr [rbp - 0xc8], r15
0x100455ab0: lea rsi, [rip + 0x71078b] ; 0x100b66242 Mesh
0x100455ab7: mov edx, 1
0x100455abc: mov rdi, r12
0x100455abf: call 0x1007a56a0 ; 0x1007a56a0
0x100455ac4: mov qword ptr [rbp - 0x248], rbx
0x100455acb: lea rsi, [rip + 0x733a28] ; 0x100b894fa Old mesh version for 
0x100455ad2: lea rdi, [rbp - 0x218]
0x100455ad9: mov edx, 0x15
0x100455ade: call 0x100011930 ; 0x100011930
0x100455ae3: mov rbx, rax
0x100455ae6: mov r12, qword ptr [rbp - 0x230]
0x100455aed: mov rdi, r12
0x100455af0: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100455af5: mov rdi, rbx
0x100455af8: mov rsi, r12
0x100455afb: mov rdx, rax
0x100455afe: call 0x100011930 ; 0x100011930
0x100455b03: lea rsi, [rip + 0x733a06] ; 0x100b89510 ( 
0x100455b0a: mov edx, 2
0x100455b0f: mov rdi, rax
0x100455b12: call 0x100011930 ; 0x100011930
0x100455b17: mov rbx, rax
0x100455b1a: mov r13, qword ptr [rbp - 0x240]
0x100455b21: mov rdi, r13
0x100455b24: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100455b29: mov rdi, rbx
0x100455b2c: mov rsi, r13
0x100455b2f: mov rdx, rax
0x100455b32: call 0x100011930 ; 0x100011930
0x100455b37: lea rsi, [rip + 0x7339d5] ; 0x100b89513  ), please re-bake level.
0x100455b3e: mov edx, 0x19
0x100455b43: mov rdi, rax
0x100455b46: call 0x100011930 ; 0x100011930
0x100455b4b: mov rax, qword ptr [rbp - 0x248]
0x100455b52: mov qword ptr [rbp - 0x218], rax
0x100455b59: mov qword ptr [rbp - 0xc8], r15
0x100455b60: lea rdi, [rbp - 0x210]
0x100455b67: call 0x1007a58d0 ; 0x1007a58d0
0x100455b6c: mov rsi, qword ptr [rip + 0x7b4a0d] ; 0x100c0a580
0x100455b73: add rsi, 8
0x100455b77: lea rdi, [rbp - 0x218]
0x100455b7e: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100455b83: lea rdi, [rbp - 0xc8]
0x100455b8a: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100455b8f: mov r15, qword ptr [rbp - 0x240]
0x100455b96: mov r13, qword ptr [rbp - 0x250]
0x100455b9d: mov ebx, dword ptr [rbp - 0x220]
0x100455ba3: mov byte ptr [rbp - 0x219], 0
0x100455baa: lea rsi, [rbp - 0x219]
0x100455bb1: mov edx, 1
0x100455bb6: mov rdi, r14
0x100455bb9: call 0x10076a0a0 ; 0x10076a0a0
0x100455bbe: mov byte ptr [rbp - 0x21a], 0
0x100455bc5: lea rsi, [rbp - 0x21a]
0x100455bcc: mov edx, 1
0x100455bd1: mov rdi, r14
0x100455bd4: call 0x10076a0a0 ; 0x10076a0a0
0x100455bd9: mov dword ptr [rbp - 0x228], 0
0x100455be3: cmp ebx, 0x1b
0x100455be6: jl 0x100455d13
0x100455bec: lea rsi, [rbp - 0x228]
0x100455bf3: mov rdi, r14
0x100455bf6: call 0x10076a240 ; 0x10076a240
0x100455bfb: mov eax, dword ptr [rbp - 0x228]
0x100455c01: cmp eax, 1
0x100455c04: jne 0x100455d0f
0x100455c0a: mov qword ptr [rbp - 0x240], r15
0x100455c11: mov dword ptr [rbp - 0x220], ebx
0x100455c17: lea rsi, [rbp - 0x234]
0x100455c1e: mov rdi, r14
0x100455c21: call 0x10076a280 ; 0x10076a280
0x100455c26: lea rsi, [rbp - 0x224]
0x100455c2d: mov rdi, r14
0x100455c30: call 0x10076a280 ; 0x10076a280
0x100455c35: mov ebx, dword ptr [rbp - 0x224]
0x100455c3b: call 0x1007c6c20 ; 0x1007c6c20
0x100455c40: lea rcx, [rip + 0x1bf2f09] ; 0x102048b50
0x100455c47: mov rdx, qword ptr [rcx]
0x100455c4a: mov ecx, 1
0x100455c4f: mov rdi, rax
0x100455c52: mov rsi, rbx
0x100455c55: call 0x100795530 ; 0x100795530
0x100455c5a: mov r15, rax
0x100455c5d: lea rdi, [r14 + 8]
0x100455c61: mov rbx, qword ptr [r14 + 0x10]
0x100455c65: mov qword ptr [rbp - 0x230], r15
0x100455c6c: call 0x100769850 ; 0x100769850
0x100455c71: cdqe 
0x100455c73: add rbx, rax
0x100455c76: mov ecx, dword ptr [rbp - 0x234]
0x100455c7c: mov r8d, dword ptr [rbp - 0x224]
0x100455c83: mov edi, 1
0x100455c88: mov rsi, rbx
0x100455c8b: mov rdx, r15
0x100455c8e: call 0x100780880 ; 0x100780880
0x100455c93: cmp dword ptr [rbp - 0x224], eax
0x100455c99: mov ebx, dword ptr [rbp - 0x220]
0x100455c9f: jne 0x100455de0
0x100455ca5: lea rdi, [rbp - 0x218]
0x100455cac: xor esi, esi
0x100455cae: mov rdx, qword ptr [rbp - 0x230]
0x100455cb5: mov ecx, eax
0x100455cb7: call 0x100769c80 ; 0x100769c80
0x100455cbc: mov r15, qword ptr [rbp - 0x240]
0x100455cc3: mov esi, dword ptr [rbp - 0x234]
0x100455cc9: mov rdi, r14
0x100455ccc: call 0x100769ec0 ; 0x100769ec0
0x100455cd1: movzx r9d, byte ptr [rbp - 0x21a]
0x100455cd9: movzx r8d, byte ptr [rbp - 0x219]
0x100455ce1: lea rsi, [rbp - 0x218]
0x100455ce8: mov rdi, r12
0x100455ceb: mov rdx, r13
0x100455cee: mov ecx, ebx
0x100455cf0: call 0x100455e90 ; 0x100455e90
0x100455cf5: call 0x1007c6c20 ; 0x1007c6c20
0x100455cfa: mov rdi, rax
0x100455cfd: mov rsi, qword ptr [rbp - 0x230]
0x100455d04: call 0x100795a70 ; 0x100795a70
0x100455d09: mov eax, dword ptr [rbp - 0x228]
0x100455d0f: test eax, eax
0x100455d11: jne 0x100455d33
0x100455d13: movzx r9d, byte ptr [rbp - 0x21a]
0x100455d1b: movzx r8d, byte ptr [rbp - 0x219]
0x100455d23: mov rdi, r12
0x100455d26: mov rsi, r14
0x100455d29: mov rdx, r13
0x100455d2c: mov ecx, ebx
0x100455d2e: call 0x100455e90 ; 0x100455e90
0x100455d33: mov qword ptr [r12 + 0x58], 0
0x100455d3c: cmp byte ptr [rbp - 0x219], 0
0x100455d43: je 0x100455db9
0x100455d45: lea rax, [rip + 0x197ce1c] ; 0x101dd2b68
0x100455d4c: mov rdx, qword ptr [rax]
0x100455d4f: mov esi, 0xe8
0x100455d54: mov ecx, 8
0x100455d59: mov rdi, r13
0x100455d5c: call 0x100795530 ; 0x100795530
0x100455d61: vxorps ymm0, ymm0, ymm0
0x100455d65: vmovups ymmword ptr [rax + 0xc0], ymm0
0x100455d6d: vmovups ymmword ptr [rax + 0xa0], ymm0
0x100455d75: vmovups ymmword ptr [rax + 0x80], ymm0
0x100455d7d: vmovups ymmword ptr [rax + 0x60], ymm0
0x100455d82: vmovups ymmword ptr [rax + 0x40], ymm0
0x100455d87: vmovups ymmword ptr [rax + 0x20], ymm0
0x100455d8c: vmovups ymmword ptr [rax], ymm0
0x100455d90: mov qword ptr [rax + 0xe0], 0
0x100455d9b: mov qword ptr [r12 + 0x58], rax
0x100455da0: mov ecx, 1
0x100455da5: mov rdi, rax
0x100455da8: mov rsi, r14
0x100455dab: mov rdx, r13
0x100455dae: mov r8, r15
0x100455db1: vzeroupper 
0x100455db4: call 0x1000e5db0 ; 0x1000e5db0
0x100455db9: mov rax, qword ptr [rip + 0x7b7b18] ; 0x100c0d8d8
0x100455dc0: mov rax, qword ptr [rax]
0x100455dc3: cmp rax, qword ptr [rbp - 0x30]
0x100455dc7: jne 0x100455ddb
0x100455dc9: add rsp, 0x228
0x100455dd0: pop rbx
0x100455dd1: pop r12
0x100455dd3: pop r13
0x100455dd5: pop r14
0x100455dd7: pop r15
0x100455dd9: pop rbp
0x100455dda: ret 
0x100455ddb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100455de0: lea rdi, [rip + 0x733746] ; 0x100b8952d uncompressedSize == actualBytes
0x100455de7: lea rsi, [rip + 0x73375f] ; 0x100b8954d Mesh.cpp
0x100455dee: mov edx, 0x60
0x100455df3: mov ecx, 3
0x100455df8: call 0x1007e5f70 ; 0x1007e5f70
0x100455dfd: ud2 
0x100455dff: mov rdi, rax
0x100455e02: call 0x100011bf0 ; 0x100011bf0
0x100455e07: jmp 0x100455e13 ; 0x100455e13
0x100455e09: mov r14, rax
0x100455e0c: jmp 0x100455e58 ; 0x100455e58
0x100455e0e: mov r14, rax
0x100455e11: jmp 0x100455e6f ; 0x100455e6f
0x100455e13: mov r14, rax
0x100455e16: call 0x1007c6c20 ; 0x1007c6c20
0x100455e1b: mov rdi, rax
0x100455e1e: mov rsi, qword ptr [rbp - 0x230]
0x100455e25: call 0x100795a70 ; 0x100795a70
0x100455e2a: jmp 0x100455e7b ; 0x100455e7b
0x100455e2c: mov rdi, rax
0x100455e2f: call 0x100011bf0 ; 0x100011bf0
0x100455e34: mov r14, rax
0x100455e37: mov rax, qword ptr [rbp - 0x248]
0x100455e3e: mov qword ptr [rbp - 0x218], rax
0x100455e45: mov qword ptr [rbp - 0xc8], r15
0x100455e4c: lea rdi, [rbp - 0x210]
0x100455e53: call 0x1007a58d0 ; 0x1007a58d0
0x100455e58: mov rsi, qword ptr [rip + 0x7b4721] ; 0x100c0a580
0x100455e5f: add rsi, 8
0x100455e63: lea rdi, [rbp - 0x218]
0x100455e6a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100455e6f: lea rdi, [rbp - 0xc8]
0x100455e76: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100455e7b: mov rdi, r14
0x100455e7e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100455e83: nop word ptr cs:[rax + rax]
