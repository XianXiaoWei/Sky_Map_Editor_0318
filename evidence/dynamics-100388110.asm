0x100388110: push rbp
0x100388111: mov rbp, rsp
0x100388114: push rbx
0x100388115: push rax
0x100388116: mov rbx, rdi
0x100388119: mov edi, 0x60
0x10038811e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100388123: vmovups ymm0, ymmword ptr [rbx + 8]
0x100388128: vmovups ymmword ptr [rax + 8], ymm0
0x10038812d: mov rcx, qword ptr [rbx + 0x28]
0x100388131: mov qword ptr [rax + 0x28], rcx
0x100388135: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x10038813a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x10038813f: vmovups ymmword ptr [rax + 0x40], ymm1
0x100388144: vmovups ymmword ptr [rax + 0x30], ymm0
0x100388149: mov rcx, qword ptr [rip + 0x884590] ; 0x100c0c6e0
0x100388150: add rcx, 0x10
0x100388154: mov qword ptr [rax], rcx
0x100388157: add rsp, 8
0x10038815b: pop rbx
0x10038815c: pop rbp
0x10038815d: vzeroupper 
0x100388160: ret 
0x100388161: nop word ptr cs:[rax + rax]
