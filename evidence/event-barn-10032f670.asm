0x10032f670: push rbp
0x10032f671: mov rbp, rsp
0x10032f674: push r15
0x10032f676: push r14
0x10032f678: push r13
0x10032f67a: push r12
0x10032f67c: push rbx
0x10032f67d: sub rsp, 0x81f8
0x10032f684: mov rbx, rdi
0x10032f687: mov rax, qword ptr [rip + 0x8de24a] ; 0x100c0d8d8
0x10032f68e: mov rax, qword ptr [rax]
0x10032f691: mov qword ptr [rbp - 0x30], rax
0x10032f695: lea rax, [rbp - 0x8030]
0x10032f69c: mov qword ptr [rbp - 0x8220], rax
0x10032f6a3: lea r14, [rbp - 0x30]
0x10032f6a7: lea rdx, [rip + 0x851b6b] ; 0x100b81219
0x10032f6ae: lea r15, [rbp - 0x8220]
0x10032f6b5: xor eax, eax
0x10032f6b7: mov rdi, r15
0x10032f6ba: mov rsi, r14
0x10032f6bd: call 0x10008d830 ; 0x10008d830
0x10032f6c2: lea rdi, [rbx + 0x5040]
0x10032f6c9: xor ecx, ecx
0x10032f6cb: mov rsi, r15
0x10032f6ce: mov rdx, r14
0x10032f6d1: call 0x100795be0 ; 0x100795be0
0x10032f6d6: lea rdx, [rip + 0x851b57] ; 0x100b81234
0x10032f6dd: xor eax, eax
0x10032f6df: mov rdi, r15
0x10032f6e2: mov rsi, r14
0x10032f6e5: call 0x10008d830 ; 0x10008d830
0x10032f6ea: add rbx, 0x85098
0x10032f6f1: xor ecx, ecx
0x10032f6f3: mov rdi, rbx
0x10032f6f6: mov rsi, r15
0x10032f6f9: mov rdx, r14
0x10032f6fc: call 0x100795be0 ; 0x100795be0
0x10032f701: lea r14, [rbp - 0x80c8]
0x10032f708: lea r12, [rbp - 0x8210]
0x10032f70f: mov rax, qword ptr [rip + 0x8dae0a] ; 0x100c0a520
0x10032f716: lea rcx, [rax + 0x18]
0x10032f71a: mov qword ptr [rbp - 0x8218], rcx
0x10032f721: add rax, 0x40
0x10032f725: mov qword ptr [rbp - 0x80c8], rax
0x10032f72c: mov rdi, r14
0x10032f72f: mov rsi, r12
0x10032f732: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10032f737: mov qword ptr [rbp - 0x8040], 0
0x10032f742: mov dword ptr [rbp - 0x8038], 0xffffffff
0x10032f74c: mov rbx, qword ptr [rip + 0x8dde75] ; 0x100c0d5c8
0x10032f753: lea r13, [rbx + 0x18]
0x10032f757: mov qword ptr [rbp - 0x8218], r13
0x10032f75e: add rbx, 0x40
0x10032f762: mov qword ptr [rbp - 0x80c8], rbx
0x10032f769: lea rsi, [rip + 0x85193a] ; 0x100b810aa EventBarn
0x10032f770: mov edx, 2
0x10032f775: mov rdi, r12
0x10032f778: call 0x1007a56a0 ; 0x1007a56a0
0x10032f77d: lea r15, [rbp - 0x8030]
0x10032f784: mov rdi, r15
0x10032f787: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10032f78c: lea rdi, [rbp - 0x8218]
0x10032f793: mov rsi, r15
0x10032f796: mov rdx, rax
0x10032f799: call 0x100011930 ; 0x100011930
0x10032f79e: mov qword ptr [rbp - 0x8218], r13
0x10032f7a5: mov qword ptr [rbp - 0x80c8], rbx
0x10032f7ac: mov rdi, r12
0x10032f7af: call 0x1007a58d0 ; 0x1007a58d0
0x10032f7b4: mov rsi, qword ptr [rip + 0x8dadc5] ; 0x100c0a580
0x10032f7bb: add rsi, 8
0x10032f7bf: lea rdi, [rbp - 0x8218]
0x10032f7c6: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032f7cb: mov rdi, r14
0x10032f7ce: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032f7d3: mov rax, qword ptr [rip + 0x8de0fe] ; 0x100c0d8d8
0x10032f7da: mov rax, qword ptr [rax]
0x10032f7dd: cmp rax, qword ptr [rbp - 0x30]
0x10032f7e1: jne 0x10032f7f5
0x10032f7e3: add rsp, 0x81f8
0x10032f7ea: pop rbx
0x10032f7eb: pop r12
0x10032f7ed: pop r13
0x10032f7ef: pop r14
0x10032f7f1: pop r15
0x10032f7f3: pop rbp
0x10032f7f4: ret 
0x10032f7f5: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032f7fa: mov r15, rax
0x10032f7fd: mov qword ptr [rbp - 0x8218], r13
0x10032f804: mov qword ptr [rbp - 0x80c8], rbx
0x10032f80b: mov rdi, r12
0x10032f80e: call 0x1007a58d0 ; 0x1007a58d0
0x10032f813: jmp 0x10032f818 ; 0x10032f818
0x10032f815: mov r15, rax
0x10032f818: mov rsi, qword ptr [rip + 0x8dad61] ; 0x100c0a580
0x10032f81f: add rsi, 8
0x10032f823: lea rdi, [rbp - 0x8218]
0x10032f82a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032f82f: jmp 0x10032f834 ; 0x10032f834
0x10032f831: mov r15, rax
0x10032f834: mov rdi, r14
0x10032f837: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032f83c: mov rdi, r15
0x10032f83f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10032f844: nop word ptr cs:[rax + rax]
