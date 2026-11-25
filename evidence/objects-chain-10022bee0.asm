0x10022bee0: push rbp
0x10022bee1: mov rbp, rsp
0x10022bee4: push r15
0x10022bee6: push r14
0x10022bee8: push r12
0x10022beea: push rbx
0x10022beeb: mov r15, rdi
0x10022beee: lea r14, [r15 + 0x20068]
0x10022bef5: xor ebx, ebx
0x10022bef7: nop word ptr [rax + rax]
0x10022bf00: cmp byte ptr [r14 + rbx + 0x14], 0
0x10022bf06: je 0x10022bf57
0x10022bf08: lea r12, [r14 + rbx]
0x10022bf0c: mov rdi, qword ptr [r14 + rbx + 0x18]
0x10022bf11: test rdi, rdi
0x10022bf14: je 0x10022bf20
0x10022bf16: mov rsi, qword ptr [r14 + rbx + 8]
0x10022bf1b: call 0x100795a70 ; 0x100795a70
0x10022bf20: mov qword ptr [r15 + rbx + 0x20070], 0
0x10022bf2c: mov dword ptr [r15 + rbx + 0x20078], 0
0x10022bf38: mov byte ptr [r15 + rbx + 0x2007c], 0
0x10022bf41: mov rax, qword ptr [r15 + 0x2a068]
0x10022bf48: mov qword ptr [r15 + rbx + 0x20068], rax
0x10022bf50: mov qword ptr [r15 + 0x2a068], r12
0x10022bf57: add rbx, 0x20
0x10022bf5b: cmp rbx, 0xa000
0x10022bf62: jne 0x10022bf00
0x10022bf64: add r15, 0x10
0x10022bf68: mov rdi, r15
0x10022bf6b: pop rbx
0x10022bf6c: pop r12
0x10022bf6e: pop r14
0x10022bf70: pop r15
0x10022bf72: pop rbp
0x10022bf73: jmp 0x100795650 ; 0x100795650
0x10022bf78: nop dword ptr [rax + rax]
