0x10052e100: push rbp
0x10052e101: mov rbp, rsp
0x10052e104: test rsi, rsi
0x10052e107: je 0x10052e113
0x10052e109: mov rax, qword ptr [rsi]
0x10052e10c: mov rdi, rsi
0x10052e10f: pop rbp
0x10052e110: jmp qword ptr [rax + 8]
0x10052e113: pop rbp
0x10052e114: ret 
0x10052e115: nop word ptr cs:[rax + rax]
