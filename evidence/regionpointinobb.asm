0x10078d450: push rbp
0x10078d451: mov rbp, rsp
0x10078d454: sub rsp, 0x20
0x10078d458: vmovaps xmm1, xmmword ptr [rdi]
0x10078d45c: vmovaps xmmword ptr [rbp - 0x10], xmm1
0x10078d461: lea rdi, [rbp - 0x10]
0x10078d465: lea rdx, [rbp - 0x20]
0x10078d469: call 0x10078d250 ; 0x10078d250
0x10078d46e: add rsp, 0x20
0x10078d472: pop rbp
0x10078d473: ret 
0x10078d474: nop word ptr cs:[rax + rax]
