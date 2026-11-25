0x100716360: push rbp
0x100716361: mov rbp, rsp
0x100716364: test rsi, rsi
0x100716367: je 0x100716390
0x100716369: mov rax, qword ptr [rsi + 8]
0x10071636d: test rax, rax
0x100716370: je 0x100716390
0x100716372: mov rcx, qword ptr [rdi + 0x290]
0x100716379: mov qword ptr [rax], rcx
0x10071637c: mov qword ptr [rdi + 0x290], rax
0x100716383: add rdi, 0x298
0x10071638a: pop rbp
0x10071638b: jmp 0x100795a70 ; 0x100795a70
0x100716390: pop rbp
0x100716391: ret 
0x100716392: nop word ptr cs:[rax + rax]
