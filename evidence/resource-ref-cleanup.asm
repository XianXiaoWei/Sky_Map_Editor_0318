0x1007c2600: push rbp
0x1007c2601: mov rbp, rsp
0x1007c2604: mov rax, qword ptr [rdi]
0x1007c2607: test rax, rax
0x1007c260a: je 0x1007c264c
0x1007c260c: mov rcx, qword ptr [rdi + 8]
0x1007c2610: mov rdx, qword ptr [rdi + 0x10]
0x1007c2614: test rdx, rdx
0x1007c2617: lea rdx, [rdx + 8]
0x1007c261b: cmove rdx, rax
0x1007c261f: mov qword ptr [rdx], rcx
0x1007c2622: mov rcx, qword ptr [rdi + 8]
0x1007c2626: mov rdx, qword ptr [rdi + 0x10]
0x1007c262a: add rax, 8
0x1007c262e: test rcx, rcx
0x1007c2631: lea rcx, [rcx + 0x10]
0x1007c2635: cmove rcx, rax
0x1007c2639: mov qword ptr [rcx], rdx
0x1007c263c: vxorps xmm0, xmm0, xmm0
0x1007c2640: vmovups xmmword ptr [rdi], xmm0
0x1007c2644: mov qword ptr [rdi + 0x10], 0
0x1007c264c: pop rbp
0x1007c264d: ret 
0x1007c264e: nop 
