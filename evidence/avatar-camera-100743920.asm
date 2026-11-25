0x100743920: push rbp
0x100743921: mov rbp, rsp
0x100743924: push rbx
0x100743925: push rax
0x100743926: mov rbx, rdi
0x100743929: mov rdi, qword ptr [rsi + 0x610]
0x100743930: lea rsi, [rip + 0x42f9c0] ; 0x100b732f7 CandleSpaceEnd
0x100743937: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10074393c: test eax, eax
0x10074393e: je 0x100743954
0x100743940: lea rax, [rip + 0x18e8659] ; 0x10202bfa0
0x100743947: lea rcx, [rip + 0x5b8c52] ; 0x100cfc5a0
0x10074394e: mov cl, byte ptr [rcx]
0x100743950: or cl, byte ptr [rax]
0x100743952: je 0x100743958
0x100743954: xor eax, eax
0x100743956: jmp 0x100743977 ; 0x100743977
0x100743958: vmovss xmm0, dword ptr [rbx + 0x290]
0x100743960: vmovss xmm1, dword ptr [rip + 0x5ee504] ; 0x100d31e6c
0x100743968: vxorps xmm1, xmm1, xmmword ptr [rip + 0x363f90] ; 0x100aa7900
0x100743970: vucomiss xmm0, xmm1
0x100743974: seta al
0x100743977: add rsp, 8
0x10074397b: pop rbx
0x10074397c: pop rbp
0x10074397d: ret 
0x10074397e: nop 
