0x100591b60: push rbp
0x100591b61: mov rbp, rsp
0x100591b64: push rbx
0x100591b65: push rax
0x100591b66: mov rbx, rdi
0x100591b69: mov edi, 0x60
0x100591b6e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100591b73: vmovups ymm0, ymmword ptr [rbx + 8]
0x100591b78: vmovups ymmword ptr [rax + 8], ymm0
0x100591b7d: mov rcx, qword ptr [rbx + 0x28]
0x100591b81: mov qword ptr [rax + 0x28], rcx
0x100591b85: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x100591b8a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x100591b8f: vmovups ymmword ptr [rax + 0x40], ymm1
0x100591b94: vmovups ymmword ptr [rax + 0x30], ymm0
0x100591b99: mov rcx, qword ptr [rip + 0x67a540] ; 0x100c0c0e0
0x100591ba0: add rcx, 0x10
0x100591ba4: mov qword ptr [rax], rcx
0x100591ba7: add rsp, 8
0x100591bab: pop rbx
0x100591bac: pop rbp
0x100591bad: vzeroupper 
0x100591bb0: ret 
0x100591bb1: nop word ptr cs:[rax + rax]
