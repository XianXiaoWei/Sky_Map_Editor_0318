0x1000959d0: push rbp
0x1000959d1: mov rbp, rsp
0x1000959d4: push r15
0x1000959d6: push r14
0x1000959d8: push r13
0x1000959da: push r12
0x1000959dc: push rbx
0x1000959dd: sub rsp, 0x258
0x1000959e4: vmovss dword ptr [rbp - 0x21c], xmm0
0x1000959ec: mov r12, rdx
0x1000959ef: mov r14d, esi
0x1000959f2: mov r15, rdi
0x1000959f5: mov rax, qword ptr [rip + 0xb77edc] ; 0x100c0d8d8
0x1000959fc: mov rax, qword ptr [rax]
0x1000959ff: mov qword ptr [rbp - 0x30], rax
0x100095a03: cmp byte ptr [r15 + 0x14], 0
0x100095a08: je 0x100095b2f
0x100095a0e: lea rdi, [rbp - 0xc8]
0x100095a15: lea rbx, [rbp - 0x210]
0x100095a1c: mov rax, qword ptr [rip + 0xb74afd] ; 0x100c0a520
0x100095a23: lea rcx, [rax + 0x18]
0x100095a27: mov qword ptr [rbp - 0x218], rcx
0x100095a2e: add rax, 0x40
0x100095a32: mov qword ptr [rbp - 0xc8], rax
0x100095a39: mov rsi, rbx
0x100095a3c: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100095a41: mov qword ptr [rbp - 0x230], r15
0x100095a48: mov dword ptr [rbp - 0x220], r14d
0x100095a4f: mov qword ptr [rbp - 0x40], 0
0x100095a57: mov dword ptr [rbp - 0x38], 0xffffffff
0x100095a5e: mov r13, qword ptr [rip + 0xb77b63] ; 0x100c0d5c8
0x100095a65: lea r14, [r13 + 0x18]
0x100095a69: mov qword ptr [rbp - 0x218], r14
0x100095a70: add r13, 0x40
0x100095a74: mov qword ptr [rbp - 0xc8], r13
0x100095a7b: lea rsi, [rip + 0xad0409] ; 0x100b65e8b Animation
0x100095a82: mov edx, 2
0x100095a87: mov rdi, rbx
0x100095a8a: call 0x1007a56a0 ; 0x1007a56a0
0x100095a8f: lea rsi, [rip + 0xacff78] ; 0x100b65a0e PlayAnimation 
0x100095a96: lea rdi, [rbp - 0x218]
0x100095a9d: mov edx, 0xe
0x100095aa2: call 0x100011930 ; 0x100011930
0x100095aa7: mov r15, rax
0x100095aaa: mov rdi, r12
0x100095aad: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100095ab2: mov rdi, r15
0x100095ab5: mov rsi, r12
0x100095ab8: mov rdx, rax
0x100095abb: call 0x100011930 ; 0x100011930
0x100095ac0: lea rsi, [rip + 0xacff56] ; 0x100b65a1d  weight 
0x100095ac7: mov edx, 8
0x100095acc: mov rdi, rax
0x100095acf: call 0x100011930 ; 0x100011930
0x100095ad4: mov rdi, rax
0x100095ad7: vmovss xmm0, dword ptr [rbp - 0x21c]
0x100095adf: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x100095ae4: mov qword ptr [rbp - 0x218], r14
0x100095aeb: mov qword ptr [rbp - 0xc8], r13
0x100095af2: lea rdi, [rbp - 0x210]
0x100095af9: call 0x1007a58d0 ; 0x1007a58d0
0x100095afe: mov rsi, qword ptr [rip + 0xb74a7b] ; 0x100c0a580
0x100095b05: add rsi, 8
0x100095b09: lea rdi, [rbp - 0x218]
0x100095b10: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100095b15: lea rdi, [rbp - 0xc8]
0x100095b1c: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100095b21: mov r14d, dword ptr [rbp - 0x220]
0x100095b28: mov r15, qword ptr [rbp - 0x230]
0x100095b2f: lea rdx, [rbp - 0x218]
0x100095b36: lea rcx, [rbp - 0x228]
0x100095b3d: lea r8, [rbp - 0x224]
0x100095b44: mov r9d, 1
0x100095b4a: mov rsi, r12
0x100095b4d: mov rdi, r15
0x100095b50: call 0x100095690 ; 0x100095690
0x100095b55: movsxd rcx, dword ptr [rax + 0x30]
0x100095b59: lea rdx, [rip + 0xa13ba8] ; 0x100aa9708 -> 0x100000000 __mh_execute_header
0x100095b60: mov ecx, dword ptr [rdx + rcx*4]
0x100095b63: mov esi, dword ptr [rax + 4]
0x100095b66: mov edx, dword ptr [rax + 8]
0x100095b69: vmovss xmm0, dword ptr [rax + 0x34]
0x100095b6e: mov r9d, dword ptr [rax + 0x38]
0x100095b72: vmovss xmm5, dword ptr [rax + 0x3c]
0x100095b77: mov r8d, dword ptr [rbp - 0x218]
0x100095b7e: mov r11d, dword ptr [rbp - 0x228]
0x100095b85: mov edi, dword ptr [rbp - 0x224]
0x100095b8b: movzx r10d, byte ptr [rax + 0x40]
0x100095b90: movzx ebx, byte ptr [rax + 0x41]
0x100095b94: movzx eax, byte ptr [rax + 0x42]
0x100095b98: mov dword ptr [rsp + 0x40], r14d
0x100095b9d: mov dword ptr [rsp + 0x30], r9d
0x100095ba2: mov dword ptr [rsp + 0x28], edi
0x100095ba6: mov dword ptr [rsp + 0x20], r11d
0x100095bab: mov dword ptr [rsp + 0x10], eax
0x100095baf: mov dword ptr [rsp + 8], ebx
0x100095bb3: mov dword ptr [rsp], r10d
0x100095bb7: mov dword ptr [rsp + 0x38], 0
0x100095bbf: mov dword ptr [rsp + 0x18], 0
0x100095bc7: vmovss xmm2, dword ptr [rip + 0xa0f4f1] ; 0x100aa50c0
0x100095bcf: xor r9d, r9d
0x100095bd2: vxorps xmm3, xmm3, xmm3
0x100095bd6: vxorps xmm4, xmm4, xmm4
0x100095bda: mov rdi, r15
0x100095bdd: vmovss xmm1, dword ptr [rbp - 0x21c]
0x100095be5: call 0x100095c70 ; 0x100095c70
0x100095bea: mov rcx, qword ptr [rip + 0xb77ce7] ; 0x100c0d8d8
0x100095bf1: mov rcx, qword ptr [rcx]
0x100095bf4: cmp rcx, qword ptr [rbp - 0x30]
0x100095bf8: jne 0x100095c0c
0x100095bfa: add rsp, 0x258
0x100095c01: pop rbx
0x100095c02: pop r12
0x100095c04: pop r13
0x100095c06: pop r14
0x100095c08: pop r15
0x100095c0a: pop rbp
0x100095c0b: ret 
0x100095c0c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100095c11: mov rbx, rax
0x100095c14: jmp 0x100095c38 ; 0x100095c38
0x100095c16: mov rbx, rax
0x100095c19: jmp 0x100095c4f ; 0x100095c4f
0x100095c1b: mov rbx, rax
0x100095c1e: mov qword ptr [rbp - 0x218], r14
0x100095c25: mov qword ptr [rbp - 0xc8], r13
0x100095c2c: lea rdi, [rbp - 0x210]
0x100095c33: call 0x1007a58d0 ; 0x1007a58d0
0x100095c38: mov rsi, qword ptr [rip + 0xb74941] ; 0x100c0a580
0x100095c3f: add rsi, 8
0x100095c43: lea rdi, [rbp - 0x218]
0x100095c4a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100095c4f: lea rdi, [rbp - 0xc8]
0x100095c56: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100095c5b: mov rdi, rbx
0x100095c5e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100095c63: nop word ptr cs:[rax + rax]
