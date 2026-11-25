0x100a6d530: push rbp
0x100a6d531: mov rbp, rsp
0x100a6d534: push r15
0x100a6d536: push r14
0x100a6d538: push r13
0x100a6d53a: push r12
0x100a6d53c: push rbx
0x100a6d53d: sub rsp, 0x38
0x100a6d541: mov r12d, esi
0x100a6d544: mov r15, rdi
0x100a6d547: call 0x100aa295a ; 0x100aa295a _objc_autoreleasePoolPush
0x100a6d54c: mov r13, rax
0x100a6d54f: mov rbx, qword ptr [r15 + 8]
0x100a6d553: cmp dword ptr [rbx + 0x98], r12d
0x100a6d55a: jbe 0x100a6d6fe
0x100a6d560: mov rax, qword ptr [rbx + 0xa8]
0x100a6d567: mov ecx, r12d
0x100a6d56a: shr ecx, 5
0x100a6d56d: mov eax, dword ptr [rax + rcx*4]
0x100a6d570: bt eax, r12d
0x100a6d574: jae 0x100a6d728
0x100a6d57a: mov r14, qword ptr [rbx + 0xa0]
0x100a6d581: mov rdi, qword ptr [r15 + 0x48]
0x100a6d585: call qword ptr [rip + 0x1a0595] ; 0x100c0db20
0x100a6d58b: mov qword ptr [rbp - 0x30], rax
0x100a6d58f: cmp qword ptr [rbx + 0x30], 0
0x100a6d594: je 0x100a6d6bb
0x100a6d59a: mov rbx, r13
0x100a6d59d: mov r13d, r12d
0x100a6d5a0: shl r13, 5
0x100a6d5a4: lea rax, [r14 + r13]
0x100a6d5a8: mov qword ptr [rbp - 0x38], rax
0x100a6d5ac: cmp qword ptr [r14 + r13 + 0x10], 0
0x100a6d5b2: je 0x100a6d5fb
0x100a6d5b4: mov rax, qword ptr [rip + 0x197c55] ; 0x100c05210
0x100a6d5bb: mov qword ptr [rbp - 0x60], rax
0x100a6d5bf: mov eax, 0xc0000000
0x100a6d5c4: mov qword ptr [rbp - 0x58], rax
0x100a6d5c8: lea rax, [rip + 0x1a1] ; 0x100a6d770
0x100a6d5cf: mov qword ptr [rbp - 0x50], rax
0x100a6d5d3: lea rax, [rip + 0x1cc496] ; 0x100c39a70
0x100a6d5da: mov qword ptr [rbp - 0x48], rax
0x100a6d5de: mov rax, qword ptr [rbp - 0x38]
0x100a6d5e2: mov qword ptr [rbp - 0x40], rax
0x100a6d5e6: mov rsi, qword ptr [rip + 0x1fcacb] ; 0x100c6a0b8
0x100a6d5ed: lea rdx, [rbp - 0x60]
0x100a6d5f1: mov rdi, qword ptr [rbp - 0x30]
0x100a6d5f5: call qword ptr [rip + 0x1a0515] ; 0x100c0db10
0x100a6d5fb: mov rdx, qword ptr [r14 + r13 + 8]
0x100a6d600: mov rsi, qword ptr [rip + 0x1fcab9] ; 0x100c6a0c0
0x100a6d607: mov rdi, qword ptr [rbp - 0x30]
0x100a6d60b: call qword ptr [rip + 0x1a04ff] ; 0x100c0db10
0x100a6d611: mov rdi, rax
0x100a6d614: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6d619: mov rdi, qword ptr [r15 + 0x38]
0x100a6d61d: mov qword ptr [r15 + 0x38], rax
0x100a6d621: call qword ptr [rip + 0x1a04f1] ; 0x100c0db18
0x100a6d627: mov rax, qword ptr [rbp - 0x38]
0x100a6d62b: mov rdx, qword ptr [rax]
0x100a6d62e: mov rdi, qword ptr [r15 + 0x38]
0x100a6d632: mov rsi, qword ptr [rip + 0x1fc75f] ; 0x100c69d98
0x100a6d639: call qword ptr [rip + 0x1a04d1] ; 0x100c0db10
0x100a6d63f: mov word ptr [r15 + 0x34], 0
0x100a6d646: mov eax, 0xffffffff
0x100a6d64b: mov qword ptr [r15 + 0x20], rax
0x100a6d64f: mov rdi, qword ptr [r15 + 0x38]
0x100a6d653: mov rsi, qword ptr [rip + 0x1fca6e] ; 0x100c6a0c8
0x100a6d65a: test r12d, r12d
0x100a6d65d: je 0x100a6d6ee
0x100a6d663: xor edx, edx
0x100a6d665: call qword ptr [rip + 0x1a04a5] ; 0x100c0db10
0x100a6d66b: mov rax, qword ptr [r15 + 8]
0x100a6d66f: cmp byte ptr [rax + 0x21e8], 0
0x100a6d676: mov r13, rbx
0x100a6d679: je 0x100a6d6cd
0x100a6d67b: mov r14, qword ptr [r15 + 0x18]
0x100a6d67f: mov ebx, dword ptr [r15 + 0x10]
0x100a6d683: lea eax, [rbx + 1]
0x100a6d686: mov dword ptr [r15 + 0x10], eax
0x100a6d68a: mov rax, qword ptr [rbp - 0x38]
0x100a6d68e: mov rdi, qword ptr [rax]
0x100a6d691: mov rsi, qword ptr [rip + 0x1f9f88] ; 0x100c67620
0x100a6d698: call qword ptr [rip + 0x1a0472] ; 0x100c0db10
0x100a6d69e: imul rbx, rbx, 0x38
0x100a6d6a2: lea rdi, [r14 + rbx]
0x100a6d6a6: mov edx, 0x20
0x100a6d6ab: mov rsi, rax
0x100a6d6ae: call 0x100aa2c78 ; 0x100aa2c78 _strlcpy
0x100a6d6b3: mov byte ptr [r14 + rbx + 0x30], 0
0x100a6d6b9: jmp 0x100a6d6cd ; 0x100a6d6cd
0x100a6d6bb: mov rdi, qword ptr [r15 + 0x38]
0x100a6d6bf: mov qword ptr [r15 + 0x38], 0
0x100a6d6c7: call qword ptr [rip + 0x1a044b] ; 0x100c0db18
0x100a6d6cd: mov rdi, qword ptr [rbp - 0x30]
0x100a6d6d1: call qword ptr [rip + 0x1a0441] ; 0x100c0db18
0x100a6d6d7: mov rdi, r13
0x100a6d6da: call 0x100aa2954 ; 0x100aa2954 _objc_autoreleasePoolPop
0x100a6d6df: add rsp, 0x38
0x100a6d6e3: pop rbx
0x100a6d6e4: pop r12
0x100a6d6e6: pop r13
0x100a6d6e8: pop r14
0x100a6d6ea: pop r15
0x100a6d6ec: pop rbp
0x100a6d6ed: ret 
0x100a6d6ee: mov edx, 1
0x100a6d6f3: call qword ptr [rip + 0x1a0417] ; 0x100c0db10
0x100a6d6f9: jmp 0x100a6d66b ; 0x100a6d66b
0x100a6d6fe: mov rcx, qword ptr [rbx + 0x90]
0x100a6d705: lea rdi, [rip + 0x154294] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6d70c: lea rdx, [rip + 0x1542d2] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6d713: mov esi, 0x64
0x100a6d718: xor eax, eax
0x100a6d71a: mov r8d, r12d
0x100a6d71d: call qword ptr [rip + 0x12fabe5] ; 0x101d68308
0x100a6d723: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6d728: mov rcx, qword ptr [rbx + 0x90]
0x100a6d72f: lea rdi, [rip + 0x15426a] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6d736: lea rdx, [rip + 0x1542d3] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6d73d: mov esi, 0x65
0x100a6d742: xor eax, eax
0x100a6d744: mov r8d, r12d
0x100a6d747: call qword ptr [rip + 0x12fabbb] ; 0x101d68308
0x100a6d74d: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6d752: jmp 0x100a6d754 ; 0x100a6d754
0x100a6d754: mov rbx, rax
0x100a6d757: mov rdi, qword ptr [rbp - 0x30]
0x100a6d75b: call qword ptr [rip + 0x1a03b7] ; 0x100c0db18
0x100a6d761: mov rdi, rbx
0x100a6d764: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6d769: ud2 
0x100a6d76b: nop dword ptr [rax + rax]
