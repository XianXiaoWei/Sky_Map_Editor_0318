0x1007f0b50: push rbp
0x1007f0b51: mov rbp, rsp
0x1007f0b54: push r15
0x1007f0b56: push r14
0x1007f0b58: push r13
0x1007f0b5a: push r12
0x1007f0b5c: push rbx
0x1007f0b5d: sub rsp, 0x28
0x1007f0b61: mov r13d, r9d
0x1007f0b64: mov r14d, r8d
0x1007f0b67: mov r15d, ecx
0x1007f0b6a: mov dword ptr [rbp - 0x2c], edx
0x1007f0b6d: mov rbx, rdi
0x1007f0b70: cmp dword ptr [rbx], -1
0x1007f0b73: jne 0x1007f0c52
0x1007f0b79: mov r12b, byte ptr [rbp + 0x10]
0x1007f0b7d: xor r8d, r8d
0x1007f0b80: mov r9d, 1
0x1007f0b86: mov rdi, rbx
0x1007f0b89: mov edx, r15d
0x1007f0b8c: mov ecx, r14d
0x1007f0b8f: call 0x1007f06f0 ; 0x1007f06f0
0x1007f0b94: mov dword ptr [rbx + 0x6c], 3
0x1007f0b9b: mov dword ptr [rbx + 0x24], r13d
0x1007f0b9f: mov dword ptr [rbx + 0x28], 1
0x1007f0ba6: mov dword ptr [rbx + 0x20], 1
0x1007f0bad: mov byte ptr [rbx + 0x2c], r12b
0x1007f0bb1: mov eax, dword ptr [rbx + 0x1c]
0x1007f0bb4: cmp eax, 1
0x1007f0bb7: je 0x1007f0bd5
0x1007f0bb9: mov ecx, dword ptr [rbx + 0x10]
0x1007f0bbc: test ecx, ecx
0x1007f0bbe: je 0x1007f0c33
0x1007f0bc0: lea edx, [rcx - 1]
0x1007f0bc3: test edx, ecx
0x1007f0bc5: jne 0x1007f0c33
0x1007f0bc7: mov ecx, dword ptr [rbx + 0x14]
0x1007f0bca: test ecx, ecx
0x1007f0bcc: je 0x1007f0c33
0x1007f0bce: lea edx, [rcx - 1]
0x1007f0bd1: test edx, ecx
0x1007f0bd3: jne 0x1007f0c33
0x1007f0bd5: mov cl, byte ptr [rbp + 0x18]
0x1007f0bd8: mov dword ptr [rbp - 0x44], r13d
0x1007f0bdc: movabs rdx, 0x100000001
0x1007f0be6: mov qword ptr [rbp - 0x50], rdx
0x1007f0bea: mov edx, dword ptr [rbp - 0x2c]
0x1007f0bed: mov dword ptr [rbp - 0x48], edx
0x1007f0bf0: mov dword ptr [rbp - 0x40], r15d
0x1007f0bf4: mov dword ptr [rbp - 0x3c], r14d
0x1007f0bf8: mov dword ptr [rbp - 0x38], 1
0x1007f0bff: mov dword ptr [rbp - 0x34], eax
0x1007f0c02: mov byte ptr [rbp - 0x30], r12b
0x1007f0c06: mov byte ptr [rbp - 0x2f], cl
0x1007f0c09: call 0x1007c1470 ; 0x1007c1470
0x1007f0c0e: mov rcx, qword ptr [rax]
0x1007f0c11: lea rsi, [rbx + 0x50]
0x1007f0c15: lea rdx, [rbp - 0x50]
0x1007f0c19: mov rdi, rax
0x1007f0c1c: call qword ptr [rcx + 0x118]
0x1007f0c22: mov dword ptr [rbx], eax
0x1007f0c24: add rsp, 0x28
0x1007f0c28: pop rbx
0x1007f0c29: pop r12
0x1007f0c2b: pop r13
0x1007f0c2d: pop r14
0x1007f0c2f: pop r15
0x1007f0c31: pop rbp
0x1007f0c32: ret 
0x1007f0c33: lea rdi, [rip + 0x3b69ac] ; 0x100ba75e6 m_mipCount == 1 || (Math::IsPowOfTwo( m_width ) && Math::IsPowOfTwo( m_height ))
0x1007f0c3a: lea rsi, [rip + 0x3b6999] ; 0x100ba75da Texture.cpp
0x1007f0c41: mov edx, 0xb0
0x1007f0c46: mov ecx, 3
0x1007f0c4b: call 0x1007e5f70 ; 0x1007e5f70
0x1007f0c50: ud2 
0x1007f0c52: lea rdi, [rip + 0x3b050b] ; 0x100ba1164 !IsInitialized()
0x1007f0c59: lea rsi, [rip + 0x3b697a] ; 0x100ba75da Texture.cpp
0x1007f0c60: mov edx, 0xa6
0x1007f0c65: mov ecx, 3
0x1007f0c6a: call 0x1007e5f70 ; 0x1007e5f70
0x1007f0c6f: ud2 
0x1007f0c71: nop word ptr cs:[rax + rax]
