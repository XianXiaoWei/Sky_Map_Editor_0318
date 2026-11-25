0x1006ad1c0: push rbp
0x1006ad1c1: mov rbp, rsp
0x1006ad1c4: push rbx
0x1006ad1c5: push rax
0x1006ad1c6: mov rbx, rdi
0x1006ad1c9: mov edi, 0x60
0x1006ad1ce: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006ad1d3: vmovups ymm0, ymmword ptr [rbx + 8]
0x1006ad1d8: vmovups ymmword ptr [rax + 8], ymm0
0x1006ad1dd: mov rcx, qword ptr [rbx + 0x28]
0x1006ad1e1: mov qword ptr [rax + 0x28], rcx
0x1006ad1e5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1006ad1ea: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1006ad1ef: vmovups ymmword ptr [rax + 0x40], ymm1
0x1006ad1f4: vmovups ymmword ptr [rax + 0x30], ymm0
0x1006ad1f9: mov rcx, qword ptr [rip + 0x55d978] ; 0x100c0ab78
0x1006ad200: add rcx, 0x10
0x1006ad204: mov qword ptr [rax], rcx
0x1006ad207: add rsp, 8
0x1006ad20b: pop rbx
0x1006ad20c: pop rbp
0x1006ad20d: vzeroupper 
0x1006ad210: ret 
0x1006ad211: nop word ptr cs:[rax + rax]
