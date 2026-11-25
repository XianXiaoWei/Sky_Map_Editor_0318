0x1001b2e40: push rbp
0x1001b2e41: mov rbp, rsp
0x1001b2e44: push rbx
0x1001b2e45: push rax
0x1001b2e46: mov rbx, rdi
0x1001b2e49: mov edi, 0x60
0x1001b2e4e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b2e53: vmovups ymm0, ymmword ptr [rbx + 8]
0x1001b2e58: vmovups ymmword ptr [rax + 8], ymm0
0x1001b2e5d: mov rcx, qword ptr [rbx + 0x28]
0x1001b2e61: mov qword ptr [rax + 0x28], rcx
0x1001b2e65: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1001b2e6a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1001b2e6f: vmovups ymmword ptr [rax + 0x40], ymm1
0x1001b2e74: vmovups ymmword ptr [rax + 0x30], ymm0
0x1001b2e79: mov rcx, qword ptr [rip + 0xa59790] ; 0x100c0c610
0x1001b2e80: add rcx, 0x10
0x1001b2e84: mov qword ptr [rax], rcx
0x1001b2e87: add rsp, 8
0x1001b2e8b: pop rbx
0x1001b2e8c: pop rbp
0x1001b2e8d: vzeroupper 
0x1001b2e90: ret 
0x1001b2e91: nop word ptr cs:[rax + rax]
