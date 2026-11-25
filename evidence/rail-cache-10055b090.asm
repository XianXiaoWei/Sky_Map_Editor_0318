0x10055b090: push rbp
0x10055b091: mov rbp, rsp
0x10055b094: push rbx
0x10055b095: push rax
0x10055b096: mov rbx, rdi
0x10055b099: mov edi, 0x60
0x10055b09e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10055b0a3: vmovups ymm0, ymmword ptr [rbx + 8]
0x10055b0a8: vmovups ymmword ptr [rax + 8], ymm0
0x10055b0ad: mov rcx, qword ptr [rbx + 0x28]
0x10055b0b1: mov qword ptr [rax + 0x28], rcx
0x10055b0b5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x10055b0ba: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x10055b0bf: vmovups ymmword ptr [rax + 0x40], ymm1
0x10055b0c4: vmovups ymmword ptr [rax + 0x30], ymm0
0x10055b0c9: mov rcx, qword ptr [rip + 0x6b18c0] ; 0x100c0c990
0x10055b0d0: add rcx, 0x10
0x10055b0d4: mov qword ptr [rax], rcx
0x10055b0d7: add rsp, 8
0x10055b0db: pop rbx
0x10055b0dc: pop rbp
0x10055b0dd: vzeroupper 
0x10055b0e0: ret 
0x10055b0e1: nop word ptr cs:[rax + rax]
