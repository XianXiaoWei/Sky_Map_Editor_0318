0x10043d030: push rbp
0x10043d031: mov rbp, rsp
0x10043d034: push r15
0x10043d036: push r14
0x10043d038: push r13
0x10043d03a: push r12
0x10043d03c: push rbx
0x10043d03d: push rax
0x10043d03e: mov r14, rdi
0x10043d041: mov r15d, dword ptr [r14 + 0x10]
0x10043d045: test r15, r15
0x10043d048: je 0x10043d158
0x10043d04e: mov rax, qword ptr [r14 + 0x20]
0x10043d052: xor r12d, r12d
0x10043d055: nop word ptr cs:[rax + rax]
0x10043d060: mov ecx, r12d
0x10043d063: shr ecx, 5
0x10043d066: mov ecx, dword ptr [rax + rcx*4]
0x10043d069: bt ecx, r12d
0x10043d06d: jb 0x10043d077
0x10043d06f: inc r12d
0x10043d072: cmp r12d, r15d
0x10043d075: jb 0x10043d060
0x10043d077: cmp r15d, r12d
0x10043d07a: je 0x10043d164
0x10043d080: jbe 0x10043d13c
0x10043d086: mov rax, r15
0x10043d089: shl rax, 0x20
0x10043d08d: mov ebx, r12d
0x10043d090: or rbx, rax
0x10043d093: movabs r13, 0xffffffff00000000
0x10043d09d: mov ecx, r15d
0x10043d0a0: mov rax, qword ptr [r14 + 0x20]
0x10043d0a4: mov edx, ebx
0x10043d0a6: shr edx, 5
0x10043d0a9: mov esi, dword ptr [rax + rdx*4]
0x10043d0ac: bt esi, r12d
0x10043d0b0: jae 0x10043d1a6
0x10043d0b6: cmp ecx, ebx
0x10043d0b8: jbe 0x10043d17e
0x10043d0be: mov edi, 1
0x10043d0c3: mov ecx, ebx
0x10043d0c5: shl edi, cl
0x10043d0c7: and cl, 0x1f
0x10043d0ca: movzx ecx, cl
0x10043d0cd: bt esi, ecx
0x10043d0d0: jae 0x10043d0f5
0x10043d0d2: mov rcx, qword ptr [r14 + 0x28]
0x10043d0d6: not edi
0x10043d0d8: and esi, edi
0x10043d0da: mov dword ptr [rax + rdx*4], esi
0x10043d0dd: mov eax, ebx
0x10043d0df: lea rax, [rax + rax*4]
0x10043d0e3: shl rax, 4
0x10043d0e7: lea rdi, [rcx + rax]
0x10043d0eb: mov rax, qword ptr [rcx + rax]
0x10043d0ef: call qword ptr [rax]
0x10043d0f1: dec dword ptr [r14 + 0x18]
0x10043d0f5: mov rcx, rbx
0x10043d0f8: shr rcx, 0x20
0x10043d0fc: inc r12d
0x10043d0ff: nop 
0x10043d100: mov rax, r12
0x10043d103: and rbx, r13
0x10043d106: or rbx, rax
0x10043d109: cmp eax, ecx
0x10043d10b: jae 0x10043d128
0x10043d10d: cmp dword ptr [r14 + 0x10], eax
0x10043d111: jbe 0x10043d17e
0x10043d113: mov rdx, qword ptr [r14 + 0x20]
0x10043d117: mov esi, eax
0x10043d119: shr esi, 5
0x10043d11c: mov edx, dword ptr [rdx + rsi*4]
0x10043d11f: lea r12, [rax + 1]
0x10043d123: bt edx, eax
0x10043d126: jae 0x10043d100
0x10043d128: cmp r15d, eax
0x10043d12b: je 0x10043d164
0x10043d12d: mov ecx, dword ptr [r14 + 0x10]
0x10043d131: mov r12d, eax
0x10043d134: cmp ecx, eax
0x10043d136: ja 0x10043d0a0
0x10043d13c: lea rdi, [rip + 0x736e26] ; 0x100b73f69 idx < kCapacity
0x10043d143: lea rsi, [rip + 0x736e2f] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d14a: lea r8, [rip + 0x736e48] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d151: mov edx, 0x6b
0x10043d156: jmp 0x10043d198 ; 0x10043d198
0x10043d158: xor r12d, r12d
0x10043d15b: cmp r15d, r12d
0x10043d15e: jne 0x10043d080
0x10043d164: mov dword ptr [r14 + 0x140b0], 0
0x10043d16f: add rsp, 8
0x10043d173: pop rbx
0x10043d174: pop r12
0x10043d176: pop r13
0x10043d178: pop r14
0x10043d17a: pop r15
0x10043d17c: pop rbp
0x10043d17d: ret 
0x10043d17e: lea rdi, [rip + 0x736de4] ; 0x100b73f69 idx < kCapacity
0x10043d185: lea rsi, [rip + 0x736ded] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d18c: lea r8, [rip + 0x736e06] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d193: mov edx, 0x39
0x10043d198: mov ecx, 4
0x10043d19d: xor eax, eax
0x10043d19f: call 0x1007e6030 ; 0x1007e6030
0x10043d1a4: ud2 
0x10043d1a6: lea rdi, [rip + 0x736e19] ; 0x100b73fc6 Allocated( idx )
0x10043d1ad: lea rsi, [rip + 0x736dc5] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d1b4: lea r8, [rip + 0x736e1c] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x10043d1bb: mov edx, 0x6c
0x10043d1c0: jmp 0x10043d198 ; 0x10043d198
0x10043d1c2: nop word ptr cs:[rax + rax]
