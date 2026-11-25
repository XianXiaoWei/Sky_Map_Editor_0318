0x1002216b0: push rbp
0x1002216b1: mov rbp, rsp
0x1002216b4: push r15
0x1002216b6: push r14
0x1002216b8: push rbx
0x1002216b9: push rax
0x1002216ba: mov r15, rdi
0x1002216bd: mov ebx, dword ptr [r15 + 0x10010]
0x1002216c4: cmp rbx, 0x200
0x1002216cb: jae 0x10022177b
0x1002216d1: lea eax, [rbx + 1]
0x1002216d4: mov dword ptr [r15 + 0x10010], eax
0x1002216db: shl rbx, 7
0x1002216df: lea r14, [r15 + rbx + 0x10]
0x1002216e4: vxorps ymm0, ymm0, ymm0
0x1002216e8: vmovups ymmword ptr [r15 + rbx + 0x70], ymm0
0x1002216ef: vmovups ymmword ptr [r15 + rbx + 0x50], ymm0
0x1002216f6: vmovups ymmword ptr [r15 + rbx + 0x30], ymm0
0x1002216fd: vmovups ymmword ptr [r15 + rbx + 0x10], ymm0
0x100221704: vzeroupper 
0x100221707: call 0x1007abc10 ; 0x1007abc10
0x10022170c: mov eax, dword ptr [rax + 0x38]
0x10022170f: mov dword ptr [r15 + rbx + 0x18], eax
0x100221714: call 0x10074a170 ; 0x10074a170
0x100221719: mov eax, dword ptr [rax + 0x38]
0x10022171c: mov dword ptr [r15 + rbx + 0x18], eax
0x100221721: mov rax, qword ptr [rip + 0x9ebf48] ; 0x100c0d670
0x100221728: add rax, 0x10
0x10022172c: mov qword ptr [r15 + rbx + 0x10], rax
0x100221731: call 0x100407ab0 ; 0x100407ab0
0x100221736: mov rax, qword ptr [rip + 0x1bc0b63] ; 0x101de22a0
0x10022173d: mov eax, dword ptr [rax + 0x38]
0x100221740: mov dword ptr [r15 + rbx + 0x18], eax
0x100221745: lea rax, [rip + 0x9f1d64] ; 0x100c134b0
0x10022174c: mov qword ptr [r15 + rbx + 0x10], rax
0x100221751: vxorps xmm0, xmm0, xmm0
0x100221755: vmovups xmmword ptr [r15 + rbx + 0x68], xmm0
0x10022175c: mov qword ptr [r15 + rbx + 0x78], 0
0x100221765: mov qword ptr [r15 + rbx + 0x88], r15
0x10022176d: mov rax, r14
0x100221770: add rsp, 8
0x100221774: pop rbx
0x100221775: pop r14
0x100221777: pop r15
0x100221779: pop rbp
0x10022177a: ret 
0x10022177b: lea rdi, [rip + 0x959314] ; 0x100b7aa96 m_cloudCount < kMaxCloudCards
0x100221782: lea rsi, [rip + 0x9592c4] ; 0x100b7aa4d CloudCard.cpp
0x100221789: lea r8, [rip + 0x959324] ; 0x100b7aab4 Ran out of CloudCards
0x100221790: mov edx, 0xd0
0x100221795: mov ecx, 4
0x10022179a: xor eax, eax
0x10022179c: call 0x1007e6030 ; 0x1007e6030
0x1002217a1: ud2 
0x1002217a3: nop word ptr cs:[rax + rax]
