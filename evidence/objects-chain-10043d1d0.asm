0x10043d1d0: push rbp
0x10043d1d1: mov rbp, rsp
0x10043d1d4: push r15
0x10043d1d6: push r14
0x10043d1d8: push r13
0x10043d1da: push r12
0x10043d1dc: push rbx
0x10043d1dd: push rax
0x10043d1de: mov r14, rdi
0x10043d1e1: mov r15d, dword ptr [r14 + 0x10]
0x10043d1e5: test r15, r15
0x10043d1e8: je 0x10043d2f8
0x10043d1ee: mov rax, qword ptr [r14 + 0x20]
0x10043d1f2: xor r12d, r12d
0x10043d1f5: nop word ptr cs:[rax + rax]
0x10043d200: mov ecx, r12d
0x10043d203: shr ecx, 5
0x10043d206: mov ecx, dword ptr [rax + rcx*4]
0x10043d209: bt ecx, r12d
0x10043d20d: jb 0x10043d217
0x10043d20f: inc r12d
0x10043d212: cmp r12d, r15d
0x10043d215: jb 0x10043d200
0x10043d217: cmp r15d, r12d
0x10043d21a: je 0x10043d304
0x10043d220: jbe 0x10043d2dc
0x10043d226: mov rax, r15
0x10043d229: shl rax, 0x20
0x10043d22d: mov ebx, r12d
0x10043d230: or rbx, rax
0x10043d233: movabs r13, 0xffffffff00000000
0x10043d23d: mov ecx, r15d
0x10043d240: mov rax, qword ptr [r14 + 0x20]
0x10043d244: mov edx, ebx
0x10043d246: shr edx, 5
0x10043d249: mov esi, dword ptr [rax + rdx*4]
0x10043d24c: bt esi, r12d
0x10043d250: jae 0x10043d33b
0x10043d256: cmp ecx, ebx
0x10043d258: jbe 0x10043d313
0x10043d25e: mov edi, 1
0x10043d263: mov ecx, ebx
0x10043d265: shl edi, cl
0x10043d267: and cl, 0x1f
0x10043d26a: movzx ecx, cl
0x10043d26d: bt esi, ecx
0x10043d270: jae 0x10043d295
0x10043d272: mov rcx, qword ptr [r14 + 0x28]
0x10043d276: not edi
0x10043d278: and esi, edi
0x10043d27a: mov dword ptr [rax + rdx*4], esi
0x10043d27d: mov eax, ebx
0x10043d27f: lea rax, [rax + rax*4]
0x10043d283: shl rax, 4
0x10043d287: lea rdi, [rcx + rax]
0x10043d28b: mov rax, qword ptr [rcx + rax]
0x10043d28f: call qword ptr [rax]
0x10043d291: dec dword ptr [r14 + 0x18]
0x10043d295: mov rcx, rbx
0x10043d298: shr rcx, 0x20
0x10043d29c: inc r12d
0x10043d29f: nop 
0x10043d2a0: mov rax, r12
0x10043d2a3: and rbx, r13
0x10043d2a6: or rbx, rax
0x10043d2a9: cmp eax, ecx
0x10043d2ab: jae 0x10043d2c8
0x10043d2ad: cmp dword ptr [r14 + 0x10], eax
0x10043d2b1: jbe 0x10043d313
0x10043d2b3: mov rdx, qword ptr [r14 + 0x20]
0x10043d2b7: mov esi, eax
0x10043d2b9: shr esi, 5
0x10043d2bc: mov edx, dword ptr [rdx + rsi*4]
0x10043d2bf: lea r12, [rax + 1]
0x10043d2c3: bt edx, eax
0x10043d2c6: jae 0x10043d2a0
0x10043d2c8: cmp r15d, eax
0x10043d2cb: je 0x10043d304
0x10043d2cd: mov ecx, dword ptr [r14 + 0x10]
0x10043d2d1: mov r12d, eax
0x10043d2d4: cmp ecx, eax
0x10043d2d6: ja 0x10043d240
0x10043d2dc: lea rdi, [rip + 0x736c86] ; 0x100b73f69 idx < kCapacity
0x10043d2e3: lea rsi, [rip + 0x736c8f] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d2ea: lea r8, [rip + 0x736ca8] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d2f1: mov edx, 0x6b
0x10043d2f6: jmp 0x10043d32d ; 0x10043d32d
0x10043d2f8: xor r12d, r12d
0x10043d2fb: cmp r15d, r12d
0x10043d2fe: jne 0x10043d220
0x10043d304: add rsp, 8
0x10043d308: pop rbx
0x10043d309: pop r12
0x10043d30b: pop r13
0x10043d30d: pop r14
0x10043d30f: pop r15
0x10043d311: pop rbp
0x10043d312: ret 
0x10043d313: lea rdi, [rip + 0x736c4f] ; 0x100b73f69 idx < kCapacity
0x10043d31a: lea rsi, [rip + 0x736c58] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d321: lea r8, [rip + 0x736c71] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d328: mov edx, 0x39
0x10043d32d: mov ecx, 4
0x10043d332: xor eax, eax
0x10043d334: call 0x1007e6030 ; 0x1007e6030
0x10043d339: ud2 
0x10043d33b: lea rdi, [rip + 0x736c84] ; 0x100b73fc6 Allocated( idx )
0x10043d342: lea rsi, [rip + 0x736c30] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d349: lea r8, [rip + 0x736c87] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x10043d350: mov edx, 0x6c
0x10043d355: jmp 0x10043d32d ; 0x10043d32d
0x10043d357: nop word ptr [rax + rax]
