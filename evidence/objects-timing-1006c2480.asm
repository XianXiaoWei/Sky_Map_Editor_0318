0x1006c2480: push rbp
0x1006c2481: mov rbp, rsp
0x1006c2484: sub rsp, 0x10
0x1006c2488: vmulss xmm0, xmm0, dword ptr [rdi + 0x20]
0x1006c248d: vmovss xmm1, dword ptr [rip + 0x3f6003] ; 0x100ab8498
0x1006c2495: vmaxss xmm0, xmm1, xmm0
0x1006c2499: vmovss dword ptr [rbp - 4], xmm0
0x1006c249e: mov rax, qword ptr [rdi]
0x1006c24a1: test rax, rax
0x1006c24a4: je 0x1006c24ac
0x1006c24a6: mov rdi, qword ptr [rax + 0x10]
0x1006c24aa: jmp 0x1006c24ae ; 0x1006c24ae
0x1006c24ac: xor edi, edi
0x1006c24ae: call 0x100362740 ; 0x100362740
0x1006c24b3: vmulss xmm0, xmm0, dword ptr [rbp - 4]
0x1006c24b8: add rsp, 0x10
0x1006c24bc: pop rbp
0x1006c24bd: ret 
0x1006c24be: nop 
