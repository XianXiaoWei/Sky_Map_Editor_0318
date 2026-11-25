0x10052e240: push rbp
0x10052e241: mov rbp, rsp
0x10052e244: mov rax, qword ptr [rip + 0x6dee75] ; 0x100c0d0c0
0x10052e24b: add rax, 0x10
0x10052e24f: mov qword ptr [rdi], rax
0x10052e252: mov rax, qword ptr [rdi + 0xe8]
0x10052e259: test rax, rax
0x10052e25c: je 0x10052e2b1
0x10052e25e: mov rcx, qword ptr [rdi + 0xf0]
0x10052e265: mov rdx, qword ptr [rdi + 0xf8]
0x10052e26c: test rdx, rdx
0x10052e26f: lea rdx, [rdx + 8]
0x10052e273: cmove rdx, rax
0x10052e277: mov qword ptr [rdx], rcx
0x10052e27a: mov rcx, qword ptr [rdi + 0xf0]
0x10052e281: mov rdx, qword ptr [rdi + 0xf8]
0x10052e288: lea rsi, [rdi + 0xe8]
0x10052e28f: add rax, 8
0x10052e293: test rcx, rcx
0x10052e296: lea rcx, [rcx + 0x10]
0x10052e29a: cmove rcx, rax
0x10052e29e: mov qword ptr [rcx], rdx
0x10052e2a1: vxorps xmm0, xmm0, xmm0
0x10052e2a5: vmovups xmmword ptr [rsi], xmm0
0x10052e2a9: mov qword ptr [rsi + 0x10], 0
0x10052e2b1: pop rbp
0x10052e2b2: ret 
0x10052e2b3: nop word ptr cs:[rax + rax]
