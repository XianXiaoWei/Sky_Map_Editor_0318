0x1001b23a0: push rbp
0x1001b23a1: mov rbp, rsp
0x1001b23a4: push rbx
0x1001b23a5: push rax
0x1001b23a6: mov rbx, rdi
0x1001b23a9: mov edi, 0x60
0x1001b23ae: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b23b3: vmovups ymm0, ymmword ptr [rbx + 8]
0x1001b23b8: vmovups ymmword ptr [rax + 8], ymm0
0x1001b23bd: mov rcx, qword ptr [rbx + 0x28]
0x1001b23c1: mov qword ptr [rax + 0x28], rcx
0x1001b23c5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1001b23ca: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1001b23cf: vmovups ymmword ptr [rax + 0x40], ymm1
0x1001b23d4: vmovups ymmword ptr [rax + 0x30], ymm0
0x1001b23d9: mov rcx, qword ptr [rip + 0xa5a458] ; 0x100c0c838
0x1001b23e0: add rcx, 0x10
0x1001b23e4: mov qword ptr [rax], rcx
0x1001b23e7: add rsp, 8
0x1001b23eb: pop rbx
0x1001b23ec: pop rbp
0x1001b23ed: vzeroupper 
0x1001b23f0: ret 
0x1001b23f1: nop word ptr cs:[rax + rax]
