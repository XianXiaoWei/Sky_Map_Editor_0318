0x100947bb8: push rbp
0x100947bb9: mov rbp, rsp
0x100947bbc: push r15
0x100947bbe: push r14
0x100947bc0: push r13
0x100947bc2: push r12
0x100947bc4: push rbx
0x100947bc5: sub rsp, 0x118
0x100947bcc: mov rbx, rcx
0x100947bcf: mov r12, rdx
0x100947bd2: mov r15, rsi
0x100947bd5: mov r14, rdi
0x100947bd8: mov rax, qword ptr [rip + 0x2c5cf9] ; 0x100c0d8d8
0x100947bdf: mov rax, qword ptr [rax]
0x100947be2: mov qword ptr [rbp - 0x30], rax
0x100947be6: lea rdx, [rbp - 0x138]
0x100947bed: mov qword ptr [rdx], 0
0x100947bf4: lea rsi, [rbp - 0x140]
0x100947bfb: call 0x10094abae ; 0x10094abae
0x100947c00: mov r13d, eax
0x100947c03: test r13d, r13d
0x100947c06: jne 0x100947c2d
0x100947c08: mov rdi, qword ptr [rbp - 0x140]
0x100947c0f: mov rax, qword ptr [rdi]
0x100947c12: mov rsi, r15
0x100947c15: mov rdx, r12
0x100947c18: mov rcx, rbx
0x100947c1b: call qword ptr [rax + 0x168]
0x100947c21: mov r13d, eax
0x100947c24: test r13d, r13d
0x100947c27: je 0x100947cef
0x100947c2d: lea rax, [rip + 0x3d3c0c] ; 0x100d1b840
0x100947c34: mov rax, qword ptr [rax]
0x100947c37: cmp byte ptr [rax + 0x10], 0
0x100947c3b: jns 0x100947cf2
0x100947c41: lea rdi, [rbp - 0x130]
0x100947c48: mov esi, 0x100
0x100947c4d: mov rdx, r15
0x100947c50: call 0x100889a1d ; 0x100889a1d
0x100947c55: movsxd r15, eax
0x100947c58: lea rdi, [rbp + r15 - 0x130]
0x100947c60: mov esi, 0x100
0x100947c65: sub esi, r15d
0x100947c68: lea rdx, [rip + 0x218c3b] ; 0x100b608aa , 
0x100947c6f: call 0x10088977d ; 0x10088977d
0x100947c74: add eax, r15d
0x100947c77: mov r15, rbx
0x100947c7a: movsxd rbx, eax
0x100947c7d: lea rdi, [rbp + rbx - 0x130]
0x100947c85: mov esi, 0x100
0x100947c8a: sub esi, ebx
0x100947c8c: mov rdx, r12
0x100947c8f: call 0x100889a1d ; 0x100889a1d
0x100947c94: add eax, ebx
0x100947c96: movsxd rbx, eax
0x100947c99: lea rdi, [rbp + rbx - 0x130]
0x100947ca1: mov esi, 0x100
0x100947ca6: sub esi, ebx
0x100947ca8: lea rdx, [rip + 0x218bfb] ; 0x100b608aa , 
0x100947caf: call 0x10088977d ; 0x10088977d
0x100947cb4: add eax, ebx
0x100947cb6: cdqe 
0x100947cb8: lea rdi, [rbp + rax - 0x130]
0x100947cc0: mov esi, 0x100
0x100947cc5: sub esi, eax
0x100947cc7: mov rdx, r15
0x100947cca: call 0x100889a1d ; 0x100889a1d
0x100947ccf: lea rcx, [rip + 0x2743fc] ; 0x100bbc0d2 ChannelControl::get3DConeSettings
0x100947cd6: mov esi, 4
0x100947cdb: mov edi, r13d
0x100947cde: mov rdx, r14
0x100947ce1: lea r8, [rbp - 0x130]
0x100947ce8: call 0x1008d5195 ; 0x1008d5195
0x100947ced: jmp 0x100947cf2 ; 0x100947cf2
0x100947cef: xor r13d, r13d
0x100947cf2: mov rdi, qword ptr [rbp - 0x138]
0x100947cf9: test rdi, rdi
0x100947cfc: je 0x100947d07
0x100947cfe: call 0x10089790a ; 0x10089790a
0x100947d03: test eax, eax
0x100947d05: jne 0x100947d12
0x100947d07: mov qword ptr [rbp - 0x138], 0
0x100947d12: mov rax, qword ptr [rip + 0x2c5bbf] ; 0x100c0d8d8
0x100947d19: mov rax, qword ptr [rax]
0x100947d1c: cmp rax, qword ptr [rbp - 0x30]
0x100947d20: jne 0x100947d37
0x100947d22: mov eax, r13d
0x100947d25: add rsp, 0x118
0x100947d2c: pop rbx
0x100947d2d: pop r12
0x100947d2f: pop r13
0x100947d31: pop r14
0x100947d33: pop r15
0x100947d35: pop rbp
0x100947d36: ret 
0x100947d37: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
