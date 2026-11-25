0x1001b2b90: push rbp
0x1001b2b91: mov rbp, rsp
0x1001b2b94: push rbx
0x1001b2b95: push rax
0x1001b2b96: mov rbx, rdi
0x1001b2b99: mov edi, 0x60
0x1001b2b9e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b2ba3: vmovups ymm0, ymmword ptr [rbx + 8]
0x1001b2ba8: vmovups ymmword ptr [rax + 8], ymm0
0x1001b2bad: mov rcx, qword ptr [rbx + 0x28]
0x1001b2bb1: mov qword ptr [rax + 0x28], rcx
0x1001b2bb5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1001b2bba: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1001b2bbf: vmovups ymmword ptr [rax + 0x40], ymm1
0x1001b2bc4: vmovups ymmword ptr [rax + 0x30], ymm0
0x1001b2bc9: mov rcx, qword ptr [rip + 0xa59aa0] ; 0x100c0c670
0x1001b2bd0: add rcx, 0x10
0x1001b2bd4: mov qword ptr [rax], rcx
0x1001b2bd7: add rsp, 8
0x1001b2bdb: pop rbx
0x1001b2bdc: pop rbp
0x1001b2bdd: vzeroupper 
0x1001b2be0: ret 
0x1001b2be1: nop word ptr cs:[rax + rax]
