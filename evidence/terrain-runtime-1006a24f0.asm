0x1006a24f0: push rbp
0x1006a24f1: mov rbp, rsp
0x1006a24f4: push r15
0x1006a24f6: push r14
0x1006a24f8: push r12
0x1006a24fa: push rbx
0x1006a24fb: mov r12, rdi
0x1006a24fe: lea rdi, [r12 + 0x9d0]
0x1006a2506: call 0x1007f5250 ; 0x1007f5250
0x1006a250b: lea rdi, [r12 + 0x598]
0x1006a2513: call 0x1007f5250 ; 0x1007f5250
0x1006a2518: cmp dword ptr [r12 + 0xe0c], 0
0x1006a2521: je 0x1006a2573
0x1006a2523: xor ebx, ebx
0x1006a2525: nop word ptr cs:[rax + rax]
0x1006a2530: mov r14d, ebx
0x1006a2533: imul r15, r14, 0x550
0x1006a253a: lea rdi, [r12 + r15 + 0xc54d0]
0x1006a2542: call 0x1007f6150 ; 0x1007f6150
0x1006a2547: imul rax, r14, 0x3540
0x1006a254e: lea rdi, [r12 + rax + 0xf00]
0x1006a2556: call 0x1007f6b80 ; 0x1007f6b80
0x1006a255b: mov dword ptr [r12 + r15 + 0xc54c8], 0
0x1006a2567: inc ebx
0x1006a2569: cmp ebx, dword ptr [r12 + 0xe0c]
0x1006a2571: jb 0x1006a2530
0x1006a2573: mov r14d, dword ptr [r12 + 0xe6c78]
0x1006a257b: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2580: shl r14, 3
0x1006a2584: lea rcx, [rip + 0x19a65c5] ; 0x102048b50
0x1006a258b: mov rdx, qword ptr [rcx]
0x1006a258e: mov ecx, 8
0x1006a2593: mov rdi, rax
0x1006a2596: mov rsi, r14
0x1006a2599: call 0x100795530 ; 0x100795530
0x1006a259e: mov r14, rax
0x1006a25a1: lea rsi, [r12 + 0xe6c80]
0x1006a25a9: mov edx, dword ptr [r12 + 0xe6c78]
0x1006a25b1: shl rdx, 3
0x1006a25b5: mov rdi, r14
0x1006a25b8: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a25bd: mov r15d, dword ptr [r12 + 0xe6c78]
0x1006a25c5: test r15, r15
0x1006a25c8: je 0x1006a25e4
0x1006a25ca: xor ebx, ebx
0x1006a25cc: nop dword ptr [rax]
0x1006a25d0: mov rsi, qword ptr [r14 + rbx*8]
0x1006a25d4: mov rdi, r12
0x1006a25d7: call 0x1006a9cb0 ; 0x1006a9cb0
0x1006a25dc: inc rbx
0x1006a25df: cmp rbx, r15
0x1006a25e2: jb 0x1006a25d0
0x1006a25e4: call 0x1007c6c20 ; 0x1007c6c20
0x1006a25e9: mov rdi, rax
0x1006a25ec: mov rsi, r14
0x1006a25ef: call 0x100795a70 ; 0x100795a70
0x1006a25f4: pop rbx
0x1006a25f5: pop r12
0x1006a25f7: pop r14
0x1006a25f9: pop r15
0x1006a25fb: pop rbp
0x1006a25fc: ret 
0x1006a25fd: mov rdi, rax
0x1006a2600: call 0x100011bf0 ; 0x100011bf0
0x1006a2605: mov rbx, rax
0x1006a2608: call 0x1007c6c20 ; 0x1007c6c20
0x1006a260d: mov rdi, rax
0x1006a2610: mov rsi, r14
0x1006a2613: call 0x100795a70 ; 0x100795a70
0x1006a2618: mov rdi, rbx
0x1006a261b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a2620: mov rdi, rax
0x1006a2623: call 0x100011bf0 ; 0x100011bf0
0x1006a2628: nop dword ptr [rax + rax]
