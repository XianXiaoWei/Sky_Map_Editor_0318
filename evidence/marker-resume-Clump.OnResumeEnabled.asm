0x10022bba0: push rbp
0x10022bba1: mov rbp, rsp
0x10022bba4: push r15
0x10022bba6: push r14
0x10022bba8: push r13
0x10022bbaa: push r12
0x10022bbac: push rbx
0x10022bbad: sub rsp, 0x1f8
0x10022bbb4: mov r14, rsi
0x10022bbb7: mov r12, rdi
0x10022bbba: mov rax, qword ptr [rip + 0x9e1d17] ; 0x100c0d8d8
0x10022bbc1: mov rax, qword ptr [rax]
0x10022bbc4: mov qword ptr [rbp - 0x30], rax
0x10022bbc8: lea rdi, [rbp - 0xc8]
0x10022bbcf: lea rbx, [rbp - 0x210]
0x10022bbd6: mov rax, qword ptr [rip + 0x9de943] ; 0x100c0a520
0x10022bbdd: lea rcx, [rax + 0x18]
0x10022bbe1: mov qword ptr [rbp - 0x218], rcx
0x10022bbe8: add rax, 0x40
0x10022bbec: mov qword ptr [rbp - 0xc8], rax
0x10022bbf3: mov rsi, rbx
0x10022bbf6: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10022bbfb: mov qword ptr [rbp - 0x40], 0
0x10022bc03: mov dword ptr [rbp - 0x38], 0xffffffff
0x10022bc0a: mov r13, qword ptr [rip + 0x9e19b7] ; 0x100c0d5c8
0x10022bc11: lea r15, [r13 + 0x18]
0x10022bc15: mov qword ptr [rbp - 0x218], r15
0x10022bc1c: add r13, 0x40
0x10022bc20: mov qword ptr [rbp - 0xc8], r13
0x10022bc27: lea rsi, [rip + 0x94f07a] ; 0x100b7aca8 CheckpointResume
0x10022bc2e: mov edx, 2
0x10022bc33: mov rdi, rbx
0x10022bc36: call 0x1007a56a0 ; 0x1007a56a0
0x10022bc3b: lea rsi, [rip + 0x94f077] ; 0x100b7acb9 Resuming Clump 
0x10022bc42: lea rdi, [rbp - 0x218]
0x10022bc49: mov edx, 0xf
0x10022bc4e: call 0x100011930 ; 0x100011930
0x10022bc53: mov rdi, rax
0x10022bc56: mov rsi, r12
0x10022bc59: call 0x100aa23c0 ; 0x100aa23c0 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPKv
0x10022bc5e: mov qword ptr [rbp - 0x218], r15
0x10022bc65: mov qword ptr [rbp - 0xc8], r13
0x10022bc6c: mov rdi, rbx
0x10022bc6f: call 0x1007a58d0 ; 0x1007a58d0
0x10022bc74: mov rsi, qword ptr [rip + 0x9de905] ; 0x100c0a580
0x10022bc7b: add rsi, 8
0x10022bc7f: lea rdi, [rbp - 0x218]
0x10022bc86: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10022bc8b: lea rdi, [rbp - 0xc8]
0x10022bc92: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10022bc97: cmp dword ptr [r12 + 0x10], 0
0x10022bc9d: je 0x10022bce5
0x10022bc9f: xor ebx, ebx
0x10022bca1: nop word ptr cs:[rax + rax]
0x10022bcb0: mov rax, qword ptr [r12 + 8]
0x10022bcb5: mov ebx, ebx
0x10022bcb7: mov rdi, qword ptr [rax + rbx*8]
0x10022bcbb: xor edx, edx
0x10022bcbd: mov rsi, r14
0x10022bcc0: call 0x1004d2440 ; 0x1004d2440
0x10022bcc5: test al, al
0x10022bcc7: jne 0x10022bcdc
0x10022bcc9: mov rax, qword ptr [r12 + 8]
0x10022bcce: mov rdi, qword ptr [rax + rbx*8]
0x10022bcd2: mov esi, 1
0x10022bcd7: call 0x1004d1f60 ; 0x1004d1f60
0x10022bcdc: inc ebx
0x10022bcde: cmp ebx, dword ptr [r12 + 0x10]
0x10022bce3: jb 0x10022bcb0
0x10022bce5: mov rax, qword ptr [rip + 0x9e1bec] ; 0x100c0d8d8
0x10022bcec: mov rax, qword ptr [rax]
0x10022bcef: cmp rax, qword ptr [rbp - 0x30]
0x10022bcf3: jne 0x10022bd07
0x10022bcf5: add rsp, 0x1f8
0x10022bcfc: pop rbx
0x10022bcfd: pop r12
0x10022bcff: pop r13
0x10022bd01: pop r14
0x10022bd03: pop r15
0x10022bd05: pop rbp
0x10022bd06: ret 
0x10022bd07: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10022bd0c: mov r14, rax
0x10022bd0f: jmp 0x10022bd2f ; 0x10022bd2f
0x10022bd11: mov r14, rax
0x10022bd14: jmp 0x10022bd46 ; 0x10022bd46
0x10022bd16: mov r14, rax
0x10022bd19: mov qword ptr [rbp - 0x218], r15
0x10022bd20: mov qword ptr [rbp - 0xc8], r13
0x10022bd27: mov rdi, rbx
0x10022bd2a: call 0x1007a58d0 ; 0x1007a58d0
0x10022bd2f: mov rsi, qword ptr [rip + 0x9de84a] ; 0x100c0a580
0x10022bd36: add rsi, 8
0x10022bd3a: lea rdi, [rbp - 0x218]
0x10022bd41: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10022bd46: lea rdi, [rbp - 0xc8]
0x10022bd4d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10022bd52: mov rdi, r14
0x10022bd55: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10022bd5a: nop word ptr [rax + rax]
