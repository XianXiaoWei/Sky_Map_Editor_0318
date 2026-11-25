0x10052e2c0: push rbp
0x10052e2c1: mov rbp, rsp
0x10052e2c4: mov rax, qword ptr [rip + 0x6dedf5] ; 0x100c0d0c0
0x10052e2cb: add rax, 0x10
0x10052e2cf: mov qword ptr [rdi], rax
0x10052e2d2: mov rax, qword ptr [rdi + 0xe8]
0x10052e2d9: test rax, rax
0x10052e2dc: je 0x10052e31a
0x10052e2de: mov rcx, qword ptr [rdi + 0xf0]
0x10052e2e5: mov rdx, qword ptr [rdi + 0xf8]
0x10052e2ec: test rdx, rdx
0x10052e2ef: lea rdx, [rdx + 8]
0x10052e2f3: cmove rdx, rax
0x10052e2f7: mov qword ptr [rdx], rcx
0x10052e2fa: mov rcx, qword ptr [rdi + 0xf0]
0x10052e301: mov rdx, qword ptr [rdi + 0xf8]
0x10052e308: add rax, 8
0x10052e30c: test rcx, rcx
0x10052e30f: lea rcx, [rcx + 0x10]
0x10052e313: cmove rcx, rax
0x10052e317: mov qword ptr [rcx], rdx
0x10052e31a: pop rbp
0x10052e31b: jmp 0x100aa248c ; 0x100aa248c __ZdlPv
