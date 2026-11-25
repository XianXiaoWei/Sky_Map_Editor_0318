0x10062e430: push rbp
0x10062e431: mov rbp, rsp
0x10062e434: push r15
0x10062e436: push r14
0x10062e438: push rbx
0x10062e439: sub rsp, 0xc8
0x10062e440: mov r14, rdi
0x10062e443: mov qword ptr [rbp - 0x20], rsi
0x10062e447: call 0x1007abc10 ; 0x1007abc10
0x10062e44c: mov r15, rax
0x10062e44f: mov qword ptr [rbp - 0x60], 0
0x10062e457: call 0x100262d70 ; 0x100262d70
0x10062e45c: mov rbx, qword ptr [rax]
0x10062e45f: lea rsi, [rbp - 0x60]
0x10062e463: lea rdx, [rbp - 0x20]
0x10062e467: mov rdi, rax
0x10062e46a: mov rcx, r15
0x10062e46d: call qword ptr [rbx + 0x40]
0x10062e470: cmp qword ptr [rbp - 0x60], 0
0x10062e475: je 0x10062e4c5
0x10062e477: mov rax, qword ptr [rbp - 0x20]
0x10062e47b: lea rcx, [rax - 8]
0x10062e47f: test rax, rax
0x10062e482: cmove rcx, rax
0x10062e486: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x10062e48b: vmovaps xmmword ptr [r14], xmm0
0x10062e490: vmovups ymm0, ymmword ptr [rcx + 0x20]
0x10062e495: vmovups ymm1, ymmword ptr [rcx + 0x30]
0x10062e49a: vmovups ymmword ptr [r14 + 0x20], ymm1
0x10062e4a0: vmovups ymmword ptr [r14 + 0x10], ymm0
0x10062e4a6: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x10062e4ab: vmovaps xmmword ptr [r14 + 0x40], xmm0
0x10062e4b1: mov eax, dword ptr [rcx + 0x68]
0x10062e4b4: mov dword ptr [r14 + 0x58], eax
0x10062e4b8: mov rax, qword ptr [rcx + 0x60]
0x10062e4bc: mov qword ptr [r14 + 0x50], rax
0x10062e4c0: jmp 0x10062e591 ; 0x10062e591
0x10062e4c5: call 0x1007abc10 ; 0x1007abc10
0x10062e4ca: mov r15, rax
0x10062e4cd: mov qword ptr [rbp - 0x60], 0
0x10062e4d5: call 0x1000f8400 ; 0x1000f8400
0x10062e4da: mov rbx, qword ptr [rax]
0x10062e4dd: lea rsi, [rbp - 0x60]
0x10062e4e1: lea rdx, [rbp - 0x20]
0x10062e4e5: mov rdi, rax
0x10062e4e8: mov rcx, r15
0x10062e4eb: call qword ptr [rbx + 0x40]
0x10062e4ee: cmp qword ptr [rbp - 0x60], 0
0x10062e4f3: je 0x10062e511
0x10062e4f5: mov rax, qword ptr [rbp - 0x20]
0x10062e4f9: lea rsi, [rax - 8]
0x10062e4fd: test rax, rax
0x10062e500: cmove rsi, rax
0x10062e504: mov rdi, r14
0x10062e507: call 0x100101450 ; 0x100101450
0x10062e50c: jmp 0x10062e591 ; 0x10062e591
0x10062e511: mov rsi, qword ptr [rbp - 0x20]
0x10062e515: lea r15, [rbp - 0xe0]
0x10062e51c: mov rdi, r15
0x10062e51f: call 0x1004d1e40 ; 0x1004d1e40
0x10062e524: mov rsi, qword ptr [rbp - 0x20]
0x10062e528: lea rbx, [rbp - 0xa0]
0x10062e52f: mov rdi, rbx
0x10062e532: call 0x1004d2140 ; 0x1004d2140
0x10062e537: lea rdi, [rbp - 0x60]
0x10062e53b: mov rsi, r15
0x10062e53e: mov rdx, rbx
0x10062e541: call 0x100076df0 ; 0x100076df0
0x10062e546: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10062e54b: vmovaps xmmword ptr [r14], xmm0
0x10062e550: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10062e555: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x10062e55a: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10062e55f: vmulps xmm0, xmm0, xmm0
0x10062e563: vmovshdup xmm1, xmm0
0x10062e567: vaddss xmm1, xmm0, xmm1
0x10062e56b: vpermilpd xmm0, xmm0, 1
0x10062e571: vaddss xmm0, xmm0, xmm1
0x10062e575: vsqrtss xmm0, xmm0, xmm0
0x10062e579: vmovss dword ptr [r14 + 0x50], xmm0
0x10062e57f: vxorps xmm0, xmm0, xmm0
0x10062e583: vmovaps xmmword ptr [r14 + 0x40], xmm0
0x10062e589: mov dword ptr [r14 + 0x54], 0
0x10062e591: mov rax, r14
0x10062e594: add rsp, 0xc8
0x10062e59b: pop rbx
0x10062e59c: pop r14
0x10062e59e: pop r15
0x10062e5a0: pop rbp
0x10062e5a1: vzeroupper 
0x10062e5a4: ret 
0x10062e5a5: nop word ptr cs:[rax + rax]
