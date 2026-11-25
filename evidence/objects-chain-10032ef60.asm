0x10032ef60: push rbp
0x10032ef61: mov rbp, rsp
0x10032ef64: push r15
0x10032ef66: push r14
0x10032ef68: push r13
0x10032ef6a: push r12
0x10032ef6c: push rbx
0x10032ef6d: sub rsp, 0x1f8
0x10032ef74: mov rbx, rdi
0x10032ef77: mov rax, qword ptr [rip + 0x8de95a] ; 0x100c0d8d8
0x10032ef7e: mov rax, qword ptr [rax]
0x10032ef81: mov qword ptr [rbp - 0x30], rax
0x10032ef85: cmp byte ptr [rbx + 0x22], 0
0x10032ef89: jne 0x10032f074
0x10032ef8f: mov rax, qword ptr [rbx + 0x18]
0x10032ef93: test rax, rax
0x10032ef96: je 0x10032efa9
0x10032ef98: mov ecx, dword ptr [rax + 0x10]
0x10032ef9b: lea edx, [rcx + 1]
0x10032ef9e: mov dword ptr [rax + 0x10], edx
0x10032efa1: mov dword ptr [rbx + 0x10], ecx
0x10032efa4: jmp 0x10032f074 ; 0x10032f074
0x10032efa9: mov dword ptr [rbx + 0x10], 0
0x10032efb0: lea r14, [rbp - 0xc8]
0x10032efb7: lea r15, [rbp - 0x210]
0x10032efbe: mov rax, qword ptr [rip + 0x8db55b] ; 0x100c0a520
0x10032efc5: lea rcx, [rax + 0x18]
0x10032efc9: mov qword ptr [rbp - 0x218], rcx
0x10032efd0: add rax, 0x40
0x10032efd4: mov qword ptr [rbp - 0xc8], rax
0x10032efdb: mov rdi, r14
0x10032efde: mov rsi, r15
0x10032efe1: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10032efe6: mov qword ptr [rbp - 0x40], 0
0x10032efee: mov dword ptr [rbp - 0x38], 0xffffffff
0x10032eff5: mov r12, qword ptr [rip + 0x8de5cc] ; 0x100c0d5c8
0x10032effc: lea r13, [r12 + 0x18]
0x10032f001: mov qword ptr [rbp - 0x218], r13
0x10032f008: add r12, 0x40
0x10032f00c: mov qword ptr [rbp - 0xc8], r12
0x10032f013: lea rsi, [rip + 0x84ebf7] ; 0x100b7dc11 Event
0x10032f01a: mov edx, 1
0x10032f01f: mov rdi, r15
0x10032f022: call 0x1007a56a0 ; 0x1007a56a0
0x10032f027: lea rsi, [rip + 0x8520b8] ; 0x100b810e6 Called Start() on an Event with a null m_eventBarn, will have 0 seq (undefined order).
0x10032f02e: lea rdi, [rbp - 0x218]
0x10032f035: mov edx, 0x56
0x10032f03a: call 0x100011930 ; 0x100011930
0x10032f03f: mov qword ptr [rbp - 0x218], r13
0x10032f046: mov qword ptr [rbp - 0xc8], r12
0x10032f04d: mov rdi, r15
0x10032f050: call 0x1007a58d0 ; 0x1007a58d0
0x10032f055: mov rsi, qword ptr [rip + 0x8db524] ; 0x100c0a580
0x10032f05c: add rsi, 8
0x10032f060: lea rdi, [rbp - 0x218]
0x10032f067: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032f06c: mov rdi, r14
0x10032f06f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032f074: mov word ptr [rbx + 0x21], 0x100
0x10032f07a: mov rax, qword ptr [rip + 0x8de857] ; 0x100c0d8d8
0x10032f081: mov rax, qword ptr [rax]
0x10032f084: cmp rax, qword ptr [rbp - 0x30]
0x10032f088: jne 0x10032f09c
0x10032f08a: add rsp, 0x1f8
0x10032f091: pop rbx
0x10032f092: pop r12
0x10032f094: pop r13
0x10032f096: pop r14
0x10032f098: pop r15
0x10032f09a: pop rbp
0x10032f09b: ret 
0x10032f09c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032f0a1: mov rbx, rax
0x10032f0a4: mov qword ptr [rbp - 0x218], r13
0x10032f0ab: mov qword ptr [rbp - 0xc8], r12
0x10032f0b2: mov rdi, r15
0x10032f0b5: call 0x1007a58d0 ; 0x1007a58d0
0x10032f0ba: jmp 0x10032f0bf ; 0x10032f0bf
0x10032f0bc: mov rbx, rax
0x10032f0bf: mov rsi, qword ptr [rip + 0x8db4ba] ; 0x100c0a580
0x10032f0c6: add rsi, 8
0x10032f0ca: lea rdi, [rbp - 0x218]
0x10032f0d1: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032f0d6: jmp 0x10032f0db ; 0x10032f0db
0x10032f0d8: mov rbx, rax
0x10032f0db: mov rdi, r14
0x10032f0de: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032f0e3: mov rdi, rbx
0x10032f0e6: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10032f0eb: nop dword ptr [rax + rax]
