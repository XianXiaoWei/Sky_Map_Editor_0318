0x1004809a0: push rbp
0x1004809a1: mov rbp, rsp
0x1004809a4: push rbx
0x1004809a5: sub rsp, 0x38
0x1004809a9: mov rbx, rdi
0x1004809ac: mov qword ptr [rbx + 0x98], 0
0x1004809b7: mov dword ptr [rbx + 0x94], 0
0x1004809c1: vmovaps xmm1, xmmword ptr [rbx + 0x70]
0x1004809c6: mov rdi, qword ptr [rsi + 0x438]
0x1004809cd: vmovss xmm0, dword ptr [rbx + 0x8c]
0x1004809d5: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1004809da: mov rax, qword ptr [rip + 0x6276bf] ; 0x100aa80a0
0x1004809e1: mov qword ptr [rbp - 0x20], rax
0x1004809e5: mov dword ptr [rbp - 0x18], 0
0x1004809ec: lea rax, [rip + 0x196ed15] ; 0x101def708
0x1004809f3: mov rcx, qword ptr [rax]
0x1004809f6: lea rsi, [rbp - 0x40]
0x1004809fa: lea rdx, [rbp - 0x20]
0x1004809fe: xor r8d, r8d
0x100480a01: call 0x1002de9e0 ; 0x1002de9e0
0x100480a06: mov qword ptr [rbp - 0x30], rax
0x100480a0a: mov dword ptr [rbp - 0x28], edx
0x100480a0d: lea rdi, [rbp - 0x30]
0x100480a11: call 0x100316270 ; 0x100316270
0x100480a16: test rax, rax
0x100480a19: je 0x100480a27
0x100480a1b: mov ecx, dword ptr [rbx + 0x90]
0x100480a21: mov dword ptr [rax + 0x84], ecx
0x100480a27: add rsp, 0x38
0x100480a2b: pop rbx
0x100480a2c: pop rbp
0x100480a2d: ret 
0x100480a2e: nop 
