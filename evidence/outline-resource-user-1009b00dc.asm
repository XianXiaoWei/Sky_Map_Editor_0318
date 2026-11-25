0x1009b00dc: push rbp
0x1009b00dd: mov rbp, rsp
0x1009b00e0: push r15
0x1009b00e2: push r14
0x1009b00e4: push r12
0x1009b00e6: push rbx
0x1009b00e7: sub rsp, 0x30
0x1009b00eb: mov r12, rdx
0x1009b00ee: mov r15, rsi
0x1009b00f1: mov r14, rdi
0x1009b00f4: mov rax, qword ptr [rip + 0x25d7dd] ; 0x100c0d8d8
0x1009b00fb: mov rax, qword ptr [rax]
0x1009b00fe: mov qword ptr [rbp - 0x28], rax
0x1009b0102: mov rdi, qword ptr [r14 + 0x10]
0x1009b0106: mov rax, qword ptr [rdi]
0x1009b0109: mov edx, 1
0x1009b010e: call qword ptr [rax + 0x168]
0x1009b0114: mov rbx, rax
0x1009b0117: test rbx, rbx
0x1009b011a: jne 0x1009b0128
0x1009b011c: lea rsi, [rbp - 0x50]
0x1009b0120: mov rdi, r15
0x1009b0123: call 0x100988c54 ; 0x100988c54
0x1009b0128: test r12, r12
0x1009b012b: je 0x1009b0131
0x1009b012d: mov qword ptr [r12], rbx
0x1009b0131: test rbx, rbx
0x1009b0134: je 0x1009b013a
0x1009b0136: xor eax, eax
0x1009b0138: jmp 0x1009b0155 ; 0x1009b0155
0x1009b013a: mov rdi, qword ptr [r14 + 0x18]
0x1009b013e: mov rax, qword ptr [rdi]
0x1009b0141: mov rax, qword ptr [rax]
0x1009b0144: movups xmm0, xmmword ptr [r15]
0x1009b0148: lea rsi, [rbp - 0x50]
0x1009b014c: movaps xmmword ptr [rsi], xmm0
0x1009b014f: call rax
0x1009b0151: test eax, eax
0x1009b0153: je 0x1009b0136
0x1009b0155: mov rcx, qword ptr [rip + 0x25d77c] ; 0x100c0d8d8
0x1009b015c: mov rcx, qword ptr [rcx]
0x1009b015f: cmp rcx, qword ptr [rbp - 0x28]
0x1009b0163: jne 0x1009b0172
0x1009b0165: add rsp, 0x30
0x1009b0169: pop rbx
0x1009b016a: pop r12
0x1009b016c: pop r14
0x1009b016e: pop r15
0x1009b0170: pop rbp
0x1009b0171: ret 
0x1009b0172: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1009b0177: nop 
