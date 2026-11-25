0x100148780: push rbp
0x100148781: mov rbp, rsp
0x100148784: push r15
0x100148786: push r14
0x100148788: push r13
0x10014878a: push r12
0x10014878c: push rbx
0x10014878d: sub rsp, 0x1f8
0x100148794: mov rax, qword ptr [rip + 0xac513d] ; 0x100c0d8d8
0x10014879b: mov rax, qword ptr [rax]
0x10014879e: mov qword ptr [rbp - 0x30], rax
0x1001487a2: mov eax, dword ptr [rdi + 0xb40]
0x1001487a8: cmp rax, 0x20
0x1001487ac: jb 0x100148887
0x1001487b2: lea r14, [rbp - 0xc8]
0x1001487b9: mov rax, qword ptr [rip + 0xac1d60] ; 0x100c0a520
0x1001487c0: lea rcx, [rax + 0x18]
0x1001487c4: mov qword ptr [rbp - 0x218], rcx
0x1001487cb: lea r12, [rbp - 0x210]
0x1001487d2: add rax, 0x40
0x1001487d6: mov qword ptr [rbp - 0xc8], rax
0x1001487dd: mov rdi, r14
0x1001487e0: mov rsi, r12
0x1001487e3: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1001487e8: mov qword ptr [rbp - 0x40], 0
0x1001487f0: mov dword ptr [rbp - 0x38], 0xffffffff
0x1001487f7: mov rbx, qword ptr [rip + 0xac4dca] ; 0x100c0d5c8
0x1001487fe: lea r13, [rbx + 0x18]
0x100148802: mov qword ptr [rbp - 0x218], r13
0x100148809: add rbx, 0x40
0x10014880d: mov qword ptr [rbp - 0xc8], rbx
0x100148814: lea rsi, [rip + 0xa2ca57] ; 0x100b75272 AvatarLoco
0x10014881b: mov edx, 1
0x100148820: mov rdi, r12
0x100148823: call 0x1007a56a0 ; 0x1007a56a0
0x100148828: lea rsi, [rip + 0xa2ca4e] ; 0x100b7527d Trying to add too many forces - leaving out
0x10014882f: lea rdi, [rbp - 0x218]
0x100148836: mov edx, 0x2b
0x10014883b: call 0x100011930 ; 0x100011930
0x100148840: mov qword ptr [rbp - 0x218], r13
0x100148847: mov qword ptr [rbp - 0xc8], rbx
0x10014884e: mov rdi, r12
0x100148851: call 0x1007a58d0 ; 0x1007a58d0
0x100148856: mov rsi, qword ptr [rip + 0xac1d23] ; 0x100c0a580
0x10014885d: add rsi, 8
0x100148861: lea rdi, [rbp - 0x218]
0x100148868: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10014886d: mov rdi, r14
0x100148870: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100148875: mov rax, qword ptr [rip + 0xac505c] ; 0x100c0d8d8
0x10014887c: mov rax, qword ptr [rax]
0x10014887f: cmp rax, qword ptr [rbp - 0x30]
0x100148883: je 0x1001488ba
0x100148885: jmp 0x1001488cc ; 0x1001488cc
0x100148887: vmovaps xmm1, xmmword ptr [rsi]
0x10014888b: lea ecx, [rax + 1]
0x10014888e: mov dword ptr [rdi + 0xb40], ecx
0x100148894: shl rax, 5
0x100148898: vmovaps xmmword ptr [rdi + rax + 0x740], xmm1
0x1001488a1: vmovss dword ptr [rdi + rax + 0x750], xmm0
0x1001488aa: mov rax, qword ptr [rip + 0xac5027] ; 0x100c0d8d8
0x1001488b1: mov rax, qword ptr [rax]
0x1001488b4: cmp rax, qword ptr [rbp - 0x30]
0x1001488b8: jne 0x1001488cc
0x1001488ba: add rsp, 0x1f8
0x1001488c1: pop rbx
0x1001488c2: pop r12
0x1001488c4: pop r13
0x1001488c6: pop r14
0x1001488c8: pop r15
0x1001488ca: pop rbp
0x1001488cb: ret 
0x1001488cc: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001488d1: mov r15, rax
0x1001488d4: mov qword ptr [rbp - 0x218], r13
0x1001488db: mov qword ptr [rbp - 0xc8], rbx
0x1001488e2: mov rdi, r12
0x1001488e5: call 0x1007a58d0 ; 0x1007a58d0
0x1001488ea: jmp 0x1001488ef ; 0x1001488ef
0x1001488ec: mov r15, rax
0x1001488ef: mov rsi, qword ptr [rip + 0xac1c8a] ; 0x100c0a580
0x1001488f6: add rsi, 8
0x1001488fa: lea rdi, [rbp - 0x218]
0x100148901: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100148906: jmp 0x10014890b ; 0x10014890b
0x100148908: mov r15, rax
0x10014890b: mov rdi, r14
0x10014890e: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100148913: mov rdi, r15
0x100148916: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10014891b: ud2 
0x10014891d: nop dword ptr [rax]

