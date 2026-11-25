0x100337500: push rbp
0x100337501: mov rbp, rsp
0x100337504: push rbx
0x100337505: push rax
0x100337506: mov rbx, rdi
0x100337509: mov rsi, qword ptr [rbx + 0x158]
0x100337510: test rsi, rsi
0x100337513: je 0x100337530
0x100337515: mov byte ptr [rsi + 0x50], 0
0x100337519: mov rdi, qword ptr [rdx + 0x3f0]
0x100337520: call 0x10039a780 ; 0x10039a780
0x100337525: mov qword ptr [rbx + 0x158], 0
0x100337530: add rsp, 8
0x100337534: pop rbx
0x100337535: pop rbp
0x100337536: ret 
0x100337537: nop word ptr [rax + rax]
