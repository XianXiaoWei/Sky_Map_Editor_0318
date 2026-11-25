0x1004d2440: push rbp
0x1004d2441: mov rbp, rsp
0x1004d2444: push r15
0x1004d2446: push r14
0x1004d2448: push r12
0x1004d244a: push rbx
0x1004d244b: sub rsp, 0x40
0x1004d244f: mov r15d, edx
0x1004d2452: mov r14, rsi
0x1004d2455: mov rax, qword ptr [rip + 0x73b47c] ; 0x100c0d8d8
0x1004d245c: mov rax, qword ptr [rax]
0x1004d245f: mov qword ptr [rbp - 0x28], rax
0x1004d2463: mov qword ptr [rbp - 0x50], rdi
0x1004d2467: test rdi, rdi
0x1004d246a: je 0x1004d2554
0x1004d2470: mov edi, dword ptr [rdi]
0x1004d2472: call 0x1007abd30 ; 0x1007abd30
0x1004d2477: mov rcx, qword ptr [rax]
0x1004d247a: mov rdi, rax
0x1004d247d: call qword ptr [rcx + 0x68]
0x1004d2480: mov rbx, rax
0x1004d2483: test rbx, rbx
0x1004d2486: jne 0x1004d2490
0x1004d2488: call 0x1007abc60 ; 0x1007abc60
0x1004d248d: mov rbx, rax
0x1004d2490: movzx edx, byte ptr [rip + 0x800c89] ; 0x100cd3120
0x1004d2497: lea rsi, [rip + 0x68dbd9] ; 0x100b60077 OnResumeEnabled
0x1004d249e: mov rdi, rbx
0x1004d24a1: call 0x1004d2330 ; 0x1004d2330
0x1004d24a6: mov r12, rax
0x1004d24a9: test r12, r12
0x1004d24ac: je 0x1004d252b
0x1004d24ae: call 0x1007abbf0 ; 0x1007abbf0
0x1004d24b3: movzx esi, byte ptr [rip + 0x800c66] ; 0x100cd3120
0x1004d24ba: lea rdi, [rip + 0x6b098e] ; 0x100b82e4f Game
0x1004d24c1: call 0x1007abc80 ; 0x1007abc80
0x1004d24c6: mov qword ptr [rbp - 0x40], r14
0x1004d24ca: mov qword ptr [rbp - 0x38], rax
0x1004d24ce: call 0x1007abc10 ; 0x1007abc10
0x1004d24d3: mov r15, rax
0x1004d24d6: call 0x1007abbf0 ; 0x1007abbf0
0x1004d24db: mov r14, rax
0x1004d24de: mov qword ptr [rbp - 0x48], 0
0x1004d24e6: call qword ptr [r12 + 0x58]
0x1004d24eb: mov rbx, qword ptr [rax]
0x1004d24ee: lea rsi, [rbp - 0x48]
0x1004d24f2: lea rdx, [rbp - 0x50]
0x1004d24f6: mov rdi, rax
0x1004d24f9: mov rcx, r15
0x1004d24fc: call qword ptr [rbx + 0x40]
0x1004d24ff: mov rdx, qword ptr [rbp - 0x48]
0x1004d2503: test rdx, rdx
0x1004d2506: je 0x1004d2573
0x1004d2508: mov rdi, qword ptr [r12 + 0x38]
0x1004d250d: mov rsi, qword ptr [r12 + 0x40]
0x1004d2512: mov dword ptr [rsp], 1
0x1004d2519: lea r9, [rbp - 0x40]
0x1004d251d: xor ecx, ecx
0x1004d251f: mov r8, r14
0x1004d2522: call qword ptr [r12 + 0x48]
0x1004d2527: mov al, 1
0x1004d2529: jmp 0x1004d2532 ; 0x1004d2532
0x1004d252b: test r15b, r15b
0x1004d252e: jne 0x1004d2592
0x1004d2530: xor eax, eax
0x1004d2532: mov rcx, qword ptr [rip + 0x73b39f] ; 0x100c0d8d8
0x1004d2539: mov rcx, qword ptr [rcx]
0x1004d253c: cmp rcx, qword ptr [rbp - 0x28]
0x1004d2540: jne 0x1004d254f
0x1004d2542: add rsp, 0x40
0x1004d2546: pop rbx
0x1004d2547: pop r12
0x1004d2549: pop r14
0x1004d254b: pop r15
0x1004d254d: pop rbp
0x1004d254e: ret 
0x1004d254f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1004d2554: lea rdi, [rip + 0x6bba53] ; 0x100b8dfae obj
0x1004d255b: lea rsi, [rip + 0x6bba3c] ; 0x100b8df9e ObjectManip.cpp
0x1004d2562: mov edx, 0x58
0x1004d2567: mov ecx, 3
0x1004d256c: call 0x1007e5f70 ; 0x1007e5f70
0x1004d2571: ud2 
0x1004d2573: lea rdi, [rip + 0x6a58fc] ; 0x100b77e76 c
0x1004d257a: lea rsi, [rip + 0x68b057] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d2581: mov edx, 0x443
0x1004d2586: mov ecx, 3
0x1004d258b: call 0x1007e5f70 ; 0x1007e5f70
0x1004d2590: ud2 
0x1004d2592: mov r9, qword ptr [rbx + 8]
0x1004d2596: lea rdi, [rip + 0x6d0a8f] ; 0x100ba302c false
0x1004d259d: lea rsi, [rip + 0x6bb9fa] ; 0x100b8df9e ObjectManip.cpp
0x1004d25a4: lea r8, [rip + 0x6bba07] ; 0x100b8dfb2 %s has no OnResumeEnabled() meta function. Can't be resumed from CheckpointState.enableOnResume
0x1004d25ab: mov edx, 0x67
0x1004d25b0: mov ecx, 4
0x1004d25b5: xor eax, eax
0x1004d25b7: call 0x1007e6030 ; 0x1007e6030
0x1004d25bc: ud2 
0x1004d25be: nop 
