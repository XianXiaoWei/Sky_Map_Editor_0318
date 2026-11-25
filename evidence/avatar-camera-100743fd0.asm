0x100743fd0: push rbp
0x100743fd1: mov rbp, rsp
0x100743fd4: mov rax, qword ptr [rip + 0x4c65e5] ; 0x100c0a5c0
0x100743fdb: add rax, 0x10
0x100743fdf: mov qword ptr [rdi], rax
0x100743fe2: mov rax, qword ptr [rdi + 0xe8]
0x100743fe9: test rax, rax
0x100743fec: je 0x10074404d
0x100743fee: lea r9, [rdi + 0xe8]
0x100743ff5: lea r8, [rdi + 0xf0]
0x100743ffc: vxorps xmm0, xmm0, xmm0
0x100744000: cmp qword ptr [rax], r9
0x100744003: jne 0x100744080
0x100744005: mov rsi, qword ptr [rax + 8]
0x100744009: mov rdx, qword ptr [rax + 0x10]
0x10074400d: mov rcx, r9
0x100744010: test rdx, rdx
0x100744013: je 0x10074401c
0x100744015: add rdx, 8
0x100744019: mov rcx, rdx
0x10074401c: mov qword ptr [rcx], rsi
0x10074401f: mov rdx, qword ptr [rax + 8]
0x100744023: mov rsi, qword ptr [rax + 0x10]
0x100744027: mov rcx, r8
0x10074402a: test rdx, rdx
0x10074402d: je 0x100744036
0x10074402f: add rdx, 0x10
0x100744033: mov rcx, rdx
0x100744036: mov qword ptr [rcx], rsi
0x100744039: vmovups xmmword ptr [rax], xmm0
0x10074403d: mov qword ptr [rax + 0x10], 0
0x100744045: mov rax, qword ptr [r9]
0x100744048: test rax, rax
0x10074404b: jne 0x100744000
0x10074404d: mov rax, qword ptr [rdi + 0x10]
0x100744051: test rax, rax
0x100744054: je 0x10074405e
0x100744056: mov rcx, qword ptr [rdi + 0x18]
0x10074405a: mov qword ptr [rax + 0x18], rcx
0x10074405e: mov rcx, qword ptr [rdi + 0x18]
0x100744062: test rcx, rcx
0x100744065: je 0x10074406b
0x100744067: mov qword ptr [rcx + 0x10], rax
0x10074406b: pop rbp
0x10074406c: jmp 0x100aa248c ; 0x100aa248c __ZdlPv
0x100744071: nop word ptr cs:[rax + rax]
0x100744080: jmp 0x100744080 ; 0x100744080
0x100744082: nop word ptr cs:[rax + rax]
