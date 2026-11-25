0x10055bcb0: push rbp
0x10055bcb1: mov rbp, rsp
0x10055bcb4: push r15
0x10055bcb6: push r14
0x10055bcb8: push r12
0x10055bcba: push rbx
0x10055bcbb: mov r12, rdi
0x10055bcbe: lea r15, [r12 + 0x10]
0x10055bcc3: xor ebx, ebx
0x10055bcc5: nop word ptr cs:[rax + rax]
0x10055bcd0: cmp byte ptr [r15 + rbx + 0xe8], 0
0x10055bcd9: je 0x10055bd11
0x10055bcdb: lea r14, [r15 + rbx]
0x10055bcdf: mov rdi, r14
0x10055bce2: call 0x10055d200 ; 0x10055d200
0x10055bce7: mov byte ptr [r12 + rbx + 0xf8], 0
0x10055bcf0: mov dword ptr [r12 + rbx + 0xfc], 0
0x10055bcfc: mov rax, qword ptr [r12 + 0xa010]
0x10055bd04: mov qword ptr [r12 + rbx + 0x10], rax
0x10055bd09: mov qword ptr [r12 + 0xa010], r14
0x10055bd11: add rbx, 0x100
0x10055bd18: cmp rbx, 0xa000
0x10055bd1f: jne 0x10055bcd0
0x10055bd21: add r12, 0xa020
0x10055bd28: mov rdi, r12
0x10055bd2b: pop rbx
0x10055bd2c: pop r12
0x10055bd2e: pop r14
0x10055bd30: pop r15
0x10055bd32: pop rbp
0x10055bd33: jmp 0x100795650 ; 0x100795650
0x10055bd38: nop dword ptr [rax + rax]
