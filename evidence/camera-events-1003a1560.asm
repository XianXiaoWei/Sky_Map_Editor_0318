0x1003a1560: push rbp
0x1003a1561: mov rbp, rsp
0x1003a1564: push rbx
0x1003a1565: push rax
0x1003a1566: mov rbx, rdi
0x1003a1569: mov edi, 0x60
0x1003a156e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1003a1573: vmovups ymm0, ymmword ptr [rbx + 8]
0x1003a1578: vmovups ymmword ptr [rax + 8], ymm0
0x1003a157d: mov rcx, qword ptr [rbx + 0x28]
0x1003a1581: mov qword ptr [rax + 0x28], rcx
0x1003a1585: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1003a158a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1003a158f: vmovups ymmword ptr [rax + 0x40], ymm1
0x1003a1594: vmovups ymmword ptr [rax + 0x30], ymm0
0x1003a1599: mov rcx, qword ptr [rip + 0x869f28] ; 0x100c0b4c8
0x1003a15a0: add rcx, 0x10
0x1003a15a4: mov qword ptr [rax], rcx
0x1003a15a7: add rsp, 8
0x1003a15ab: pop rbx
0x1003a15ac: pop rbp
0x1003a15ad: vzeroupper 
0x1003a15b0: ret 
0x1003a15b1: nop word ptr cs:[rax + rax]
