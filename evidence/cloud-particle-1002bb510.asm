0x1002bb510: push rbp
0x1002bb511: mov rbp, rsp
0x1002bb514: push r15
0x1002bb516: push r14
0x1002bb518: push r12
0x1002bb51a: push rbx
0x1002bb51b: sub rsp, 0x20
0x1002bb51f: mov r14d, ecx
0x1002bb522: mov r15, rdx
0x1002bb525: mov r12, rsi
0x1002bb528: mov rbx, rdi
0x1002bb52b: cmp byte ptr [rbx + 0x1390], 0
0x1002bb532: je 0x1002bb5be
0x1002bb538: vmovss xmm1, dword ptr [rip + 0x7e9b80] ; 0x100aa50c0
0x1002bb540: vmovlps qword ptr [rbp - 0x40], xmm1
0x1002bb545: mov dword ptr [rbp - 0x38], 0
0x1002bb54c: lea rcx, [rbp - 0x40]
0x1002bb550: mov rdi, rbx
0x1002bb553: mov rsi, r12
0x1002bb556: mov rdx, r15
0x1002bb559: mov r8d, r14d
0x1002bb55c: vmovss dword ptr [rbp - 0x24], xmm0
0x1002bb561: call 0x1002b9fc0 ; 0x1002b9fc0
0x1002bb566: mov rax, qword ptr [rip + 0x7ecb33] ; 0x100aa80a0
0x1002bb56d: mov qword ptr [rbp - 0x40], rax
0x1002bb571: mov dword ptr [rbp - 0x38], 0
0x1002bb578: lea rcx, [rbp - 0x40]
0x1002bb57c: mov rdi, rbx
0x1002bb57f: mov rsi, r12
0x1002bb582: vmovss xmm0, dword ptr [rbp - 0x24]
0x1002bb587: mov rdx, r15
0x1002bb58a: mov r8d, r14d
0x1002bb58d: call 0x1002b9fc0 ; 0x1002b9fc0
0x1002bb592: mov rax, qword ptr [rip + 0x7ed497] ; 0x100aa8a30
0x1002bb599: mov qword ptr [rbp - 0x40], rax
0x1002bb59d: mov dword ptr [rbp - 0x38], 0x3f800000
0x1002bb5a4: lea rcx, [rbp - 0x40]
0x1002bb5a8: mov rdi, rbx
0x1002bb5ab: mov rsi, r12
0x1002bb5ae: vmovss xmm0, dword ptr [rbp - 0x24]
0x1002bb5b3: mov rdx, r15
0x1002bb5b6: mov r8d, r14d
0x1002bb5b9: call 0x1002b9fc0 ; 0x1002b9fc0
0x1002bb5be: add rsp, 0x20
0x1002bb5c2: pop rbx
0x1002bb5c3: pop r12
0x1002bb5c5: pop r14
0x1002bb5c7: pop r15
0x1002bb5c9: pop rbp
0x1002bb5ca: ret 
0x1002bb5cb: nop dword ptr [rax + rax]
