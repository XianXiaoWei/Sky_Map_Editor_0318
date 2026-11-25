0x1003a1370: push rbp
0x1003a1371: mov rbp, rsp
0x1003a1374: test rsi, rsi
0x1003a1377: je 0x1003a1383
0x1003a1379: mov rax, qword ptr [rsi]
0x1003a137c: mov rdi, rsi
0x1003a137f: pop rbp
0x1003a1380: jmp qword ptr [rax + 8]
0x1003a1383: pop rbp
0x1003a1384: ret 
0x1003a1385: nop word ptr cs:[rax + rax]
