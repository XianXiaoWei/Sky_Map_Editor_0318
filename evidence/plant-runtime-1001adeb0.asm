0x1001adeb0: push rbp
0x1001adeb1: mov rbp, rsp
0x1001adeb4: push r15
0x1001adeb6: push r14
0x1001adeb8: push rbx
0x1001adeb9: push rax
0x1001adeba: mov rbx, rsi
0x1001adebd: mov r14, rdi
0x1001adec0: test rbx, rbx
0x1001adec3: je 0x1001adf1b
0x1001adec5: cmp byte ptr [rbx + 0xa1], 0
0x1001adecc: je 0x1001adf1b
0x1001adece: mov byte ptr [rbx + 0xa1], 0
0x1001aded5: mov byte ptr [rbx + 0x56], 0
0x1001aded9: mov rdi, qword ptr [rbx + 0x100]
0x1001adee0: test rdi, rdi
0x1001adee3: je 0x1001adf0a
0x1001adee5: mov r15, qword ptr [rbx + 0x108]
0x1001adeec: test r15, r15
0x1001adeef: je 0x1001adf0a
0x1001adef1: mov rax, qword ptr [rdi]
0x1001adef4: call qword ptr [rax]
0x1001adef6: cmp r15, rax
0x1001adef9: jne 0x1001adf0a
0x1001adefb: mov rdi, qword ptr [rbx + 0x100]
0x1001adf02: mov rax, qword ptr [rdi]
0x1001adf05: xor esi, esi
0x1001adf07: call qword ptr [rax + 0x30]
0x1001adf0a: mov rax, qword ptr [r14 + 0x12010]
0x1001adf11: mov qword ptr [rbx], rax
0x1001adf14: mov qword ptr [r14 + 0x12010], rbx
0x1001adf1b: add rsp, 8
0x1001adf1f: pop rbx
0x1001adf20: pop r14
0x1001adf22: pop r15
0x1001adf24: pop rbp
0x1001adf25: ret 
0x1001adf26: nop word ptr cs:[rax + rax]
