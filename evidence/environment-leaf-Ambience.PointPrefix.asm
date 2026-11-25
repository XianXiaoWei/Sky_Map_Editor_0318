0x10005aa10: push rbp
0x10005aa11: mov rbp, rsp
0x10005aa14: push r15
0x10005aa16: push r14
0x10005aa18: push r13
0x10005aa1a: push r12
0x10005aa1c: push rbx
0x10005aa1d: sub rsp, 0x968
0x10005aa24: mov r15, rcx
0x10005aa27: mov r13, rdx
0x10005aa2a: mov qword ptr [rbp - 0x860], rsi
0x10005aa31: mov r14, rdi
0x10005aa34: mov r12, qword ptr [rbp + 0x28]
0x10005aa38: mov rax, qword ptr [rip + 0xbb2e99] ; 0x100c0d8d8
0x10005aa3f: mov rax, qword ptr [rax]
0x10005aa42: mov qword ptr [rbp - 0x30], rax
0x10005aa46: vmovss xmm0, dword ptr [rip + 0xc1e9b2] ; 0x100c79400
0x10005aa4e: vmulss xmm0, xmm0, dword ptr [r14 + 0x280]
0x10005aa57: vmovss dword ptr [r14 + 0x280], xmm0
0x10005aa60: vpermilps xmm0, xmm0, 0xc0
0x10005aa66: vmulps xmm0, xmm0, xmmword ptr [r14 + 0x270]
0x10005aa6f: vdivps xmm0, xmm0, xmmword ptr [rip + 0xa4d479] ; 0x100aa7ef0
0x10005aa77: vmovaps xmmword ptr [r14 + 0x2a0], xmm0
