0x100316400: push rbp
0x100316401: mov rbp, rsp
0x100316404: push r15
0x100316406: push r14
0x100316408: push r13
0x10031640a: push r12
0x10031640c: push rbx
0x10031640d: sub rsp, 0x1f8
0x100316414: mov r12, rdi
0x100316417: mov rax, qword ptr [rip + 0x8f74ba] ; 0x100c0d8d8
0x10031641e: mov rax, qword ptr [rax]
0x100316421: mov qword ptr [rbp - 0x30], rax
0x100316425: lea r14, [rbp - 0xc8]
0x10031642c: lea r15, [rbp - 0x210]
0x100316433: mov rax, qword ptr [rip + 0x8f40e6] ; 0x100c0a520
0x10031643a: lea rcx, [rax + 0x18]
0x10031643e: mov qword ptr [rbp - 0x218], rcx
0x100316445: add rax, 0x40
0x100316449: mov qword ptr [rbp - 0xc8], rax
0x100316450: mov rdi, r14
0x100316453: mov rsi, r15
0x100316456: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10031645b: mov qword ptr [rbp - 0x40], 0
0x100316463: mov dword ptr [rbp - 0x38], 0xffffffff
0x10031646a: mov rbx, qword ptr [rip + 0x8f7157] ; 0x100c0d5c8
0x100316471: lea r13, [rbx + 0x18]
0x100316475: mov qword ptr [rbp - 0x218], r13
0x10031647c: add rbx, 0x40
0x100316480: mov qword ptr [rbp - 0xc8], rbx
0x100316487: lea rsi, [rip + 0x86481a] ; 0x100b7aca8 CheckpointResume
0x10031648e: mov edx, 2
0x100316493: mov rdi, r15
0x100316496: call 0x1007a56a0 ; 0x1007a56a0
0x10031649b: lea rsi, [rip + 0x86a394] ; 0x100b80836 Resuming Enable 
0x1003164a2: lea rdi, [rbp - 0x218]
0x1003164a9: mov edx, 0x10
0x1003164ae: call 0x100011930 ; 0x100011930
0x1003164b3: mov rdi, rax
0x1003164b6: mov rsi, r12
0x1003164b9: call 0x100aa23c0 ; 0x100aa23c0 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPKv
0x1003164be: mov qword ptr [rbp - 0x218], r13
0x1003164c5: mov qword ptr [rbp - 0xc8], rbx
0x1003164cc: mov rdi, r15
0x1003164cf: call 0x1007a58d0 ; 0x1007a58d0
0x1003164d4: mov rsi, qword ptr [rip + 0x8f40a5] ; 0x100c0a580
0x1003164db: add rsi, 8
0x1003164df: lea rdi, [rbp - 0x218]
0x1003164e6: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1003164eb: mov rdi, r14
0x1003164ee: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1003164f3: mov rdi, r12
0x1003164f6: call 0x10032e2f0 ; 0x10032e2f0
0x1003164fb: mov rax, qword ptr [rip + 0x8f73d6] ; 0x100c0d8d8
0x100316502: mov rax, qword ptr [rax]
0x100316505: cmp rax, qword ptr [rbp - 0x30]
0x100316509: jne 0x10031651d
0x10031650b: add rsp, 0x1f8
0x100316512: pop rbx
0x100316513: pop r12
0x100316515: pop r13
0x100316517: pop r14
0x100316519: pop r15
0x10031651b: pop rbp
0x10031651c: ret 
0x10031651d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100316522: mov r12, rax
0x100316525: jmp 0x100316545 ; 0x100316545
0x100316527: mov r12, rax
0x10031652a: jmp 0x10031655c ; 0x10031655c
0x10031652c: mov r12, rax
0x10031652f: mov qword ptr [rbp - 0x218], r13
0x100316536: mov qword ptr [rbp - 0xc8], rbx
0x10031653d: mov rdi, r15
0x100316540: call 0x1007a58d0 ; 0x1007a58d0
0x100316545: mov rsi, qword ptr [rip + 0x8f4034] ; 0x100c0a580
0x10031654c: add rsi, 8
0x100316550: lea rdi, [rbp - 0x218]
0x100316557: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10031655c: mov rdi, r14
0x10031655f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100316564: mov rdi, r12
0x100316567: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10031656c: nop dword ptr [rax]
