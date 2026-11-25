0x10076b4e0: push rbp
0x10076b4e1: mov rbp, rsp
0x10076b4e4: push r15
0x10076b4e6: push r14
0x10076b4e8: push r13
0x10076b4ea: push r12
0x10076b4ec: push rbx
0x10076b4ed: sub rsp, 0x18
0x10076b4f1: mov r15d, r9d
0x10076b4f4: mov r12, r8
0x10076b4f7: mov r14, rcx
0x10076b4fa: mov r13, rdx
0x10076b4fd: mov rbx, rsi
0x10076b500: mov qword ptr [rbp - 0x30], rdi
0x10076b504: vmovss xmm0, dword ptr [r13]
0x10076b50a: mov qword ptr [rbp - 0x38], r13
0x10076b50e: vmovss xmm1, dword ptr [r14]
0x10076b513: vmovss xmm2, dword ptr [r12]
0x10076b519: mov edx, r15d
0x10076b51c: call 0x10076af70 ; 0x10076af70
0x10076b521: lea rsi, [rbx + 4]
0x10076b525: vmovss xmm0, dword ptr [r13 + 4]
0x10076b52b: vmovss xmm1, dword ptr [r14 + 4]
0x10076b531: vmovss xmm2, dword ptr [r12 + 4]
0x10076b538: mov r13, qword ptr [rbp - 0x30]
0x10076b53c: mov rdi, r13
0x10076b53f: mov edx, r15d
0x10076b542: call 0x10076af70 ; 0x10076af70
0x10076b547: add rbx, 8
0x10076b54b: mov rax, qword ptr [rbp - 0x38]
0x10076b54f: vmovss xmm0, dword ptr [rax + 8]
0x10076b554: vmovss xmm1, dword ptr [r14 + 8]
0x10076b55a: vmovss xmm2, dword ptr [r12 + 8]
0x10076b561: mov rdi, r13
0x10076b564: mov rsi, rbx
0x10076b567: mov edx, r15d
0x10076b56a: add rsp, 0x18
0x10076b56e: pop rbx
0x10076b56f: pop r12
0x10076b571: pop r13
0x10076b573: pop r14
0x10076b575: pop r15
0x10076b577: pop rbp
0x10076b578: jmp 0x10076af70 ; 0x10076af70
0x10076b57d: nop dword ptr [rax]
