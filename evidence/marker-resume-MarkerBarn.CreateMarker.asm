0x10043d6a0: push rbp
0x10043d6a1: mov rbp, rsp
0x10043d6a4: push r15
0x10043d6a6: push r14
0x10043d6a8: push rbx
0x10043d6a9: push rax
0x10043d6aa: mov r14, rdi
0x10043d6ad: mov eax, dword ptr [r14 + 0x18]
0x10043d6b1: cmp eax, dword ptr [r14 + 0x10]
0x10043d6b5: jae 0x10043d773
0x10043d6bb: inc eax
0x10043d6bd: mov dword ptr [r14 + 0x18], eax
0x10043d6c1: mov rdx, qword ptr [r14 + 0x20]
0x10043d6c5: xor ecx, ecx
0x10043d6c7: mov eax, 0xffffffe0
0x10043d6cc: nop dword ptr [rax]
0x10043d6d0: mov esi, ecx
0x10043d6d2: mov edi, dword ptr [rdx + rsi*4]
0x10043d6d5: inc ecx
0x10043d6d7: add eax, 0x20
0x10043d6da: cmp edi, -1
0x10043d6dd: je 0x10043d6d0
0x10043d6df: mov ecx, edi
0x10043d6e1: not ecx
0x10043d6e3: bsf ecx, ecx
0x10043d6e6: mov ebx, 1
0x10043d6eb: shl ebx, cl
0x10043d6ed: or ebx, edi
0x10043d6ef: mov dword ptr [rdx + rsi*4], ebx
0x10043d6f2: or eax, ecx
0x10043d6f4: mov r15, qword ptr [r14 + 0x28]
0x10043d6f8: shl rax, 4
0x10043d6fc: lea rbx, [rax + rax*4]
0x10043d700: vxorps ymm0, ymm0, ymm0
0x10043d704: vmovups ymmword ptr [r15 + rbx + 0x30], ymm0
0x10043d70b: vmovups ymmword ptr [r15 + rbx + 0x20], ymm0
0x10043d712: vmovups ymmword ptr [r15 + rbx], ymm0
0x10043d718: vzeroupper 
0x10043d71b: call 0x1007abc10 ; 0x1007abc10
0x10043d720: mov eax, dword ptr [rax + 0x38]
0x10043d723: mov dword ptr [r15 + rbx + 8], eax
0x10043d728: call 0x10074a170 ; 0x10074a170
0x10043d72d: mov rax, qword ptr [rip + 0x1bc6e84] ; 0x1020045b8
0x10043d734: mov eax, dword ptr [rax + 0x38]
0x10043d737: mov dword ptr [r15 + rbx + 8], eax
0x10043d73c: mov rax, qword ptr [rip + 0x7cfd4d] ; 0x100c0d490
0x10043d743: add rax, 0x10
0x10043d747: mov qword ptr [r15 + rbx], rax
0x10043d74b: mov rcx, qword ptr [r14 + 0x28]
0x10043d74f: lea rax, [rcx + rbx]
0x10043d753: mov edx, dword ptr [r14 + 0x140b0]
0x10043d75a: lea esi, [rdx + 1]
0x10043d75d: mov dword ptr [r14 + 0x140b0], esi
0x10043d764: mov dword ptr [rcx + rbx + 0x44], edx
0x10043d768: add rsp, 8
0x10043d76c: pop rbx
0x10043d76d: pop r14
0x10043d76f: pop r15
0x10043d771: pop rbp
0x10043d772: ret 
0x10043d773: lea rdi, [rip + 0x73a0b8] ; 0x100b77832 m_count < kCapacity
0x10043d77a: lea rsi, [rip + 0x7367f8] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d781: lea r8, [rip + 0x73a0be] ; 0x100b77846 ObjectPool exceeded maximum capacity
0x10043d788: mov edx, 0x47
0x10043d78d: mov ecx, 4
0x10043d792: xor eax, eax
0x10043d794: call 0x1007e6030 ; 0x1007e6030
0x10043d799: ud2 
0x10043d79b: nop dword ptr [rax + rax]
