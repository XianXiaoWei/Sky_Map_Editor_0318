0x1001e99c0: push rbp
0x1001e99c1: mov rbp, rsp
0x1001e99c4: push r15
0x1001e99c6: push r14
0x1001e99c8: push r13
0x1001e99ca: push r12
0x1001e99cc: push rbx
0x1001e99cd: push rax
0x1001e99ce: mov r15, rdi
0x1001e99d1: mov r14d, dword ptr [r15 + 0xf980]
0x1001e99d8: test r14, r14
0x1001e99db: je 0x1001e9b01
0x1001e99e1: mov rax, qword ptr [r15 + 0xf990]
0x1001e99e8: xor r12d, r12d
0x1001e99eb: nop dword ptr [rax + rax]
0x1001e99f0: mov ecx, r12d
0x1001e99f3: shr ecx, 5
0x1001e99f6: mov ecx, dword ptr [rax + rcx*4]
0x1001e99f9: bt ecx, r12d
0x1001e99fd: jb 0x1001e9a07
0x1001e99ff: inc r12d
0x1001e9a02: cmp r12d, r14d
0x1001e9a05: jb 0x1001e99f0
0x1001e9a07: cmp r14d, r12d
0x1001e9a0a: je 0x1001e9b0d
0x1001e9a10: cmp r14d, r12d
0x1001e9a13: jbe 0x1001e9ae5
0x1001e9a19: mov rax, r14
0x1001e9a1c: shl rax, 0x20
0x1001e9a20: mov ebx, r12d
0x1001e9a23: or rbx, rax
0x1001e9a26: neg r14d
0x1001e9a29: movabs r13, 0xffffffff00000000
0x1001e9a33: nop word ptr cs:[rax + rax]
0x1001e9a40: mov rax, qword ptr [r15 + 0xf990]
0x1001e9a47: mov rcx, rbx
0x1001e9a4a: shr rcx, 3
0x1001e9a4e: and ecx, 0x1ffffffc
0x1001e9a54: mov eax, dword ptr [rax + rcx]
0x1001e9a57: bt eax, r12d
0x1001e9a5b: jae 0x1001e9b7b
0x1001e9a61: mov rax, qword ptr [r15 + 0xf998]
0x1001e9a68: mov ecx, ebx
0x1001e9a6a: imul rcx, rcx, 0x570
0x1001e9a71: lea rdi, [rax + rcx + 0x20]
0x1001e9a76: call 0x1007f6150 ; 0x1007f6150
0x1001e9a7b: mov rax, rbx
0x1001e9a7e: shr rax, 0x20
0x1001e9a82: mov ecx, r12d
0x1001e9a85: inc rcx
0x1001e9a88: nop dword ptr [rax + rax]
0x1001e9a90: mov r12, rcx
0x1001e9a93: and rbx, r13
0x1001e9a96: or rbx, r12
0x1001e9a99: cmp r12, rax
0x1001e9a9c: jae 0x1001e9ad0
0x1001e9a9e: mov ecx, dword ptr [r15 + 0xf980]
0x1001e9aa5: cmp r12, rcx
0x1001e9aa8: jae 0x1001e9b53
0x1001e9aae: mov rcx, qword ptr [r15 + 0xf990]
0x1001e9ab5: mov rdx, r12
0x1001e9ab8: shr rdx, 3
0x1001e9abc: and edx, 0x1ffffffc
0x1001e9ac2: mov edx, dword ptr [rcx + rdx]
0x1001e9ac5: lea rcx, [r12 + 1]
0x1001e9aca: bt edx, r12d
0x1001e9ace: jae 0x1001e9a90
0x1001e9ad0: mov eax, r14d
0x1001e9ad3: add eax, r12d
0x1001e9ad6: je 0x1001e9b0d
0x1001e9ad8: cmp dword ptr [r15 + 0xf980], r12d
0x1001e9adf: ja 0x1001e9a40
0x1001e9ae5: lea rdi, [rip + 0x98a47d] ; 0x100b73f69 idx < kCapacity
0x1001e9aec: lea rsi, [rip + 0x98a486] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001e9af3: lea r8, [rip + 0x98a49f] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001e9afa: mov edx, 0x6b
0x1001e9aff: jmp 0x1001e9b6d ; 0x1001e9b6d
0x1001e9b01: xor r12d, r12d
0x1001e9b04: cmp r14d, r12d
0x1001e9b07: jne 0x1001e9a10
0x1001e9b0d: lea rdi, [r15 + 0x10]
0x1001e9b11: mov esi, 0x7000
0x1001e9b16: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1001e9b1b: mov dword ptr [r15 + 0xf6d0], 0
0x1001e9b26: mov dword ptr [r15 + 0xf988], 0
0x1001e9b31: mov rdi, qword ptr [r15 + 0xf990]
0x1001e9b38: mov esi, dword ptr [r15 + 0xf984]
0x1001e9b3f: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1001e9b44: add rsp, 8
0x1001e9b48: pop rbx
0x1001e9b49: pop r12
0x1001e9b4b: pop r13
0x1001e9b4d: pop r14
0x1001e9b4f: pop r15
0x1001e9b51: pop rbp
0x1001e9b52: ret 
0x1001e9b53: lea rdi, [rip + 0x98a40f] ; 0x100b73f69 idx < kCapacity
0x1001e9b5a: lea rsi, [rip + 0x98a418] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001e9b61: lea r8, [rip + 0x98a431] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001e9b68: mov edx, 0x39
0x1001e9b6d: mov ecx, 4
0x1001e9b72: xor eax, eax
0x1001e9b74: call 0x1007e6030 ; 0x1007e6030
0x1001e9b79: ud2 
0x1001e9b7b: lea rdi, [rip + 0x98a444] ; 0x100b73fc6 Allocated( idx )
0x1001e9b82: lea rsi, [rip + 0x98a3f0] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001e9b89: lea r8, [rip + 0x98a447] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x1001e9b90: mov edx, 0x6c
0x1001e9b95: jmp 0x1001e9b6d ; 0x1001e9b6d
0x1001e9b97: nop word ptr [rax + rax]
