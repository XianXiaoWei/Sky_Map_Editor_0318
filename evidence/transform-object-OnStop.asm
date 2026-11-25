0x1006d62e0: push rbp
0x1006d62e1: mov rbp, rsp
0x1006d62e4: push r14
0x1006d62e6: push rbx
0x1006d62e7: mov rbx, rdi
0x1006d62ea: mov byte ptr [rbx + 0xd2], 1
0x1006d62f1: mov rdi, qword ptr [rbx + 0xc0]
0x1006d62f8: test rdi, rdi
0x1006d62fb: je 0x1006d635c
0x1006d62fd: mov r14, qword ptr [rbx + 0xc8]
0x1006d6304: test r14, r14
0x1006d6307: je 0x1006d635c
0x1006d6309: mov rax, qword ptr [rdi]
0x1006d630c: call qword ptr [rax]
0x1006d630e: cmp r14, rax
0x1006d6311: jne 0x1006d635c
0x1006d6313: mov rdi, qword ptr [rbx + 0xc0]
0x1006d631a: mov rax, qword ptr [rdi]
0x1006d631d: call qword ptr [rax + 0x10]
0x1006d6320: test al, al
0x1006d6322: je 0x1006d635c
0x1006d6324: mov rdi, qword ptr [rbx + 0xc0]
0x1006d632b: test rdi, rdi
0x1006d632e: je 0x1006d6355
0x1006d6330: mov r14, qword ptr [rbx + 0xc8]
0x1006d6337: test r14, r14
0x1006d633a: je 0x1006d6355
0x1006d633c: mov rax, qword ptr [rdi]
0x1006d633f: call qword ptr [rax]
0x1006d6341: cmp r14, rax
0x1006d6344: jne 0x1006d6355
0x1006d6346: mov rdi, qword ptr [rbx + 0xc0]
0x1006d634d: mov rax, qword ptr [rdi]
0x1006d6350: xor esi, esi
0x1006d6352: call qword ptr [rax + 0x30]
0x1006d6355: mov byte ptr [rbx + 0xd0], 0
0x1006d635c: pop rbx
0x1006d635d: pop r14
0x1006d635f: pop rbp
0x1006d6360: ret 
0x1006d6361: nop word ptr cs:[rax + rax]
