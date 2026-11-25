0x1001d37a0: push rbp
0x1001d37a1: mov rbp, rsp
0x1001d37a4: push rbx
0x1001d37a5: sub rsp, 0x48
0x1001d37a9: mov rbx, rdi
0x1001d37ac: mov rax, qword ptr [rsi]
0x1001d37af: lea rdi, [rbp - 0x50]
0x1001d37b3: call qword ptr [rax + 0x18]
0x1001d37b6: vmovaps xmm0, xmmword ptr [rbp - 0x20]
0x1001d37bb: vmovaps xmmword ptr [rbx], xmm0
0x1001d37bf: mov rax, rbx
0x1001d37c2: add rsp, 0x48
0x1001d37c6: pop rbx
0x1001d37c7: pop rbp
0x1001d37c8: ret 
0x1001d37c9: nop dword ptr [rax]
