0x100a6aa30: push rbp
0x100a6aa31: mov rbp, rsp
0x100a6aa34: push r15
0x100a6aa36: push r14
0x100a6aa38: push r13
0x100a6aa3a: push r12
0x100a6aa3c: push rbx
0x100a6aa3d: push rax
0x100a6aa3e: mov r12, rsi
0x100a6aa41: mov r14, rdi
0x100a6aa44: mov eax, dword ptr [r14 + 0xfc]
0x100a6aa4b: cmp eax, dword ptr [r14 + 0xf8]
0x100a6aa52: jae 0x100a6ac8c
0x100a6aa58: inc eax
0x100a6aa5a: mov dword ptr [r14 + 0xfc], eax
0x100a6aa61: mov rax, qword ptr [r14 + 0x108]
0x100a6aa68: mov ebx, 0xffffffff
0x100a6aa6d: mov r13d, 0xffffffe0
0x100a6aa73: nop word ptr cs:[rax + rax]
0x100a6aa80: inc ebx
0x100a6aa82: mov edx, dword ptr [rax + rbx*4]
0x100a6aa85: add r13d, 0x20
0x100a6aa89: cmp edx, -1
0x100a6aa8c: je 0x100a6aa80
0x100a6aa8e: mov esi, ebx
0x100a6aa90: mov ecx, edx
0x100a6aa92: not ecx
0x100a6aa94: bsf ecx, ecx
0x100a6aa97: mov edi, 1
0x100a6aa9c: shl edi, cl
0x100a6aa9e: mov dword ptr [rbp - 0x2c], edi
0x100a6aaa1: or edx, edi
0x100a6aaa3: mov dword ptr [rax + rsi*4], edx
0x100a6aaa6: or r13d, ecx
0x100a6aaa9: mov rax, qword ptr [r14 + 0x100]
0x100a6aab0: mov qword ptr [rax + r13*8], 0
0x100a6aab8: mov rdi, qword ptr [rip + 0x200af9] ; 0x100c6b5b8
0x100a6aabf: mov rsi, qword ptr [rip + 0x1fcb02] ; 0x100c675c8
0x100a6aac6: mov r15, qword ptr [rip + 0x1a3043] ; 0x100c0db10
0x100a6aacd: call r15
0x100a6aad0: mov rsi, qword ptr [rip + 0x1fcb41] ; 0x100c67618
0x100a6aad7: mov rdi, rax
0x100a6aada: call r15
0x100a6aadd: mov r15, rax
0x100a6aae0: movsxd rax, dword ptr [r12 + 0x14]
0x100a6aae5: cmp rax, 3
0x100a6aae9: ja 0x100a6aaf8
0x100a6aaeb: lea rcx, [rip + 0x9bbae] ; 0x100b066a0
0x100a6aaf2: mov rdx, qword ptr [rcx + rax*8]
0x100a6aaf6: jmp 0x100a6aafd ; 0x100a6aafd
0x100a6aaf8: mov edx, 4
0x100a6aafd: mov rsi, qword ptr [rip + 0x1ff4a4] ; 0x100c69fa8
0x100a6ab04: mov rdi, r15
0x100a6ab07: call qword ptr [rip + 0x1a3003] ; 0x100c0db10
0x100a6ab0d: movsxd rax, dword ptr [r12 + 0xc]
0x100a6ab12: cmp rax, 3
0x100a6ab16: ja 0x100a6ab25
0x100a6ab18: lea rcx, [rip + 0x9bb81] ; 0x100b066a0
0x100a6ab1f: mov rdx, qword ptr [rcx + rax*8]
0x100a6ab23: jmp 0x100a6ab2a ; 0x100a6ab2a
0x100a6ab25: mov edx, 4
0x100a6ab2a: mov rsi, qword ptr [rip + 0x1ff47f] ; 0x100c69fb0
0x100a6ab31: mov rdi, r15
0x100a6ab34: call qword ptr [rip + 0x1a2fd6] ; 0x100c0db10
0x100a6ab3a: movsxd rax, dword ptr [r12 + 0x10]
0x100a6ab3f: cmp rax, 3
0x100a6ab43: ja 0x100a6ab52
0x100a6ab45: lea rcx, [rip + 0x9bb54] ; 0x100b066a0
0x100a6ab4c: mov rdx, qword ptr [rcx + rax*8]
0x100a6ab50: jmp 0x100a6ab57 ; 0x100a6ab57
0x100a6ab52: mov edx, 4
0x100a6ab57: mov rsi, qword ptr [rip + 0x1ff45a] ; 0x100c69fb8
0x100a6ab5e: mov rdi, r15
0x100a6ab61: call qword ptr [rip + 0x1a2fa9] ; 0x100c0db10
0x100a6ab67: mov eax, dword ptr [r12]
0x100a6ab6b: test eax, eax
0x100a6ab6d: je 0x100a6ab74
0x100a6ab6f: cmp eax, 1
0x100a6ab72: jne 0x100a6ab78
0x100a6ab74: xor edx, edx
0x100a6ab76: jmp 0x100a6ab7d ; 0x100a6ab7d
0x100a6ab78: mov edx, 1
0x100a6ab7d: mov rsi, qword ptr [rip + 0x1ff43c] ; 0x100c69fc0
0x100a6ab84: mov rdi, r15
0x100a6ab87: call qword ptr [rip + 0x1a2f83] ; 0x100c0db10
0x100a6ab8d: mov eax, dword ptr [r12 + 4]
0x100a6ab92: test eax, eax
0x100a6ab94: je 0x100a6ab9b
0x100a6ab96: cmp eax, 1
0x100a6ab99: jne 0x100a6ab9f
0x100a6ab9b: xor edx, edx
0x100a6ab9d: jmp 0x100a6aba4 ; 0x100a6aba4
0x100a6ab9f: mov edx, 1
0x100a6aba4: mov rsi, qword ptr [rip + 0x1ff41d] ; 0x100c69fc8
0x100a6abab: mov rdi, r15
0x100a6abae: call qword ptr [rip + 0x1a2f5c] ; 0x100c0db10
0x100a6abb4: mov eax, dword ptr [r12 + 8]
0x100a6abb9: xor ecx, ecx
0x100a6abbb: cmp eax, 1
0x100a6abbe: sete cl
0x100a6abc1: mov esi, 2
0x100a6abc6: sub rsi, rcx
0x100a6abc9: xor edx, edx
0x100a6abcb: test eax, eax
0x100a6abcd: cmovne rdx, rsi
0x100a6abd1: mov rsi, qword ptr [rip + 0x1ff3f8] ; 0x100c69fd0
0x100a6abd8: mov rdi, r15
0x100a6abdb: call qword ptr [rip + 0x1a2f2f] ; 0x100c0db10
0x100a6abe1: cvtsi2ss xmm0, dword ptr [r12 + 0x18]
0x100a6abe8: mov rsi, qword ptr [rip + 0x1ff3e9] ; 0x100c69fd8
0x100a6abef: mov rdi, r15
0x100a6abf2: call qword ptr [rip + 0x1a2f18] ; 0x100c0db10
0x100a6abf8: xorps xmm0, xmm0
0x100a6abfb: cvtsi2ss xmm0, dword ptr [r12 + 0x1c]
0x100a6ac02: mov rsi, qword ptr [rip + 0x1ff3d7] ; 0x100c69fe0
0x100a6ac09: mov rdi, r15
0x100a6ac0c: call qword ptr [rip + 0x1a2efe] ; 0x100c0db10
0x100a6ac12: mov edx, dword ptr [r12 + 0x20]
0x100a6ac17: mov rsi, qword ptr [rip + 0x1ff3ca] ; 0x100c69fe8
0x100a6ac1e: mov rdi, r15
0x100a6ac21: call qword ptr [rip + 0x1a2ee9] ; 0x100c0db10
0x100a6ac27: mov rdi, qword ptr [r14 + 8]
0x100a6ac2b: mov rsi, qword ptr [rip + 0x1ff3be] ; 0x100c69ff0
0x100a6ac32: mov rdx, r15
0x100a6ac35: call qword ptr [rip + 0x1a2ed5] ; 0x100c0db10
0x100a6ac3b: cmp dword ptr [r14 + 0xf8], r13d
0x100a6ac42: jbe 0x100a6acb3
0x100a6ac44: mov rcx, qword ptr [r14 + 0x108]
0x100a6ac4b: and ebx, 0x7ffffff
0x100a6ac51: mov edx, dword ptr [rbp - 0x2c]
0x100a6ac54: test dword ptr [rcx + rbx*4], edx
0x100a6ac57: je 0x100a6acdf
0x100a6ac5d: mov rcx, qword ptr [r14 + 0x100]
0x100a6ac64: mov rdi, qword ptr [rcx + r13*8]
0x100a6ac68: mov qword ptr [rcx + r13*8], rax
0x100a6ac6c: mov rbx, qword ptr [rip + 0x1a2ea5] ; 0x100c0db18
0x100a6ac73: call rbx
0x100a6ac75: mov rdi, r15
0x100a6ac78: call rbx
0x100a6ac7a: mov eax, r13d
0x100a6ac7d: add rsp, 8
0x100a6ac81: pop rbx
0x100a6ac82: pop r12
0x100a6ac84: pop r13
0x100a6ac86: pop r14
0x100a6ac88: pop r15
0x100a6ac8a: pop rbp
0x100a6ac8b: ret 
0x100a6ac8c: mov rcx, qword ptr [r14 + 0xf0]
0x100a6ac93: lea rdi, [rip + 0x156d06] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6ac9a: lea rdx, [rip + 0x156d26] ; 0x100bc19c7 %s: Exceeded maximum capacity
0x100a6aca1: mov esi, 0x6c
0x100a6aca6: xor eax, eax
0x100a6aca8: call qword ptr [rip + 0x12fd65a] ; 0x101d68308
0x100a6acae: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6acb3: mov rcx, qword ptr [r14 + 0xf0]
0x100a6acba: lea rdi, [rip + 0x156cdf] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6acc1: lea rdx, [rip + 0x156d1d] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6acc8: mov esi, 0x64
0x100a6accd: xor eax, eax
0x100a6accf: mov r8d, r13d
0x100a6acd2: call qword ptr [rip + 0x12fd630] ; 0x101d68308
0x100a6acd8: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6acdd: jmp 0x100a6ad09 ; 0x100a6ad09
0x100a6acdf: mov rcx, qword ptr [r14 + 0xf0]
0x100a6ace6: lea rdi, [rip + 0x156cb3] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6aced: lea rdx, [rip + 0x156d1c] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6acf4: mov esi, 0x65
0x100a6acf9: xor eax, eax
0x100a6acfb: mov r8d, r13d
0x100a6acfe: call qword ptr [rip + 0x12fd604] ; 0x101d68308
0x100a6ad04: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6ad09: ud2 
0x100a6ad0b: mov rbx, rax
0x100a6ad0e: mov rdi, r15
0x100a6ad11: call qword ptr [rip + 0x1a2e01] ; 0x100c0db18
0x100a6ad17: mov rdi, rbx
0x100a6ad1a: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6ad1f: ud2 
0x100a6ad21: nop word ptr cs:[rax + rax]
