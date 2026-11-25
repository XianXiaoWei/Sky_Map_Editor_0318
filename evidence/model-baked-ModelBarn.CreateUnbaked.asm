0x10046c700: push rbp
0x10046c701: mov rbp, rsp
0x10046c704: push r15
0x10046c706: push r14
0x10046c708: push r13
0x10046c70a: push r12
0x10046c70c: push rbx
0x10046c70d: and rsp, 0xffffffffffffffe0
0x10046c711: sub rsp, 0x240
0x10046c718: mov r14, r8
0x10046c71b: mov r15, rcx
0x10046c71e: mov r12, rdx
0x10046c721: mov r13, rsi
0x10046c724: mov rbx, rdi
0x10046c727: mov rax, qword ptr [rip + 0x7a11aa] ; 0x100c0d8d8
0x10046c72e: mov rax, qword ptr [rax]
0x10046c731: mov qword ptr [rsp + 0x220], rax
0x10046c739: test r14, r14
0x10046c73c: je 0x10046c8e6
0x10046c742: vxorps ymm0, ymm0, ymm0
0x10046c746: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10046c74f: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10046c758: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10046c761: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10046c76a: mov rdi, r13
0x10046c76d: vzeroupper 
0x10046c770: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10046c775: inc eax
0x10046c777: cmp eax, 0x41
0x10046c77a: jae 0x10046c905
0x10046c780: lea rdi, [rsp + 0x120]
0x10046c788: mov rsi, r13
0x10046c78b: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10046c790: mov dword ptr [rsp + 0x164], 0
0x10046c79b: mov qword ptr [rsp + 0x168], r12
0x10046c7a3: mov qword ptr [rsp + 0x170], r15
0x10046c7ab: vmovups ymm0, ymmword ptr [rsp + 0x158]
0x10046c7b4: vmovups ymmword ptr [rsp + 0x1f8], ymm0
0x10046c7bd: vmovaps ymm0, ymmword ptr [rsp + 0xe0]
0x10046c7c6: vmovaps ymm1, ymmword ptr [rsp + 0x100]
0x10046c7cf: vmovaps ymm2, ymmword ptr [rsp + 0x120]
0x10046c7d8: vmovaps ymm3, ymmword ptr [rsp + 0x140]
0x10046c7e1: vmovaps ymmword ptr [rsp + 0x1e0], ymm3
0x10046c7ea: vmovaps ymmword ptr [rsp + 0x1c0], ymm2
0x10046c7f3: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10046c7fc: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10046c805: mov eax, dword ptr [rbx + 0xf8010]
0x10046c80b: cmp rax, 0x400
0x10046c811: jae 0x10046c924
0x10046c817: lea ecx, [rax + 1]
0x10046c81a: mov dword ptr [rbx + 0xf8010], ecx
0x10046c820: imul rax, rax, 0x3e0
0x10046c827: lea r15, [rbx + rax + 0x10]
0x10046c82c: mov rcx, qword ptr [rbx + 0xfd260]
0x10046c833: mov rdx, qword ptr [rbx + 0xfd250]
0x10046c83a: mov r8, qword ptr [rbx + 0xfd258]
0x10046c841: vmovaps xmm0, xmmword ptr [rbx + 0xfd270]
0x10046c849: vmovaps xmm1, xmmword ptr [rbx + 0xfd290]
0x10046c851: vmovups ymm2, ymmword ptr [rsp + 0x1f8]
0x10046c85a: vmovups ymmword ptr [rsp + 0x78], ymm2
0x10046c860: vmovaps ymm2, ymmword ptr [rsp + 0x180]
0x10046c869: vmovaps ymm3, ymmword ptr [rsp + 0x1a0]
0x10046c872: vmovaps ymm4, ymmword ptr [rsp + 0x1c0]
0x10046c87b: vmovaps ymm5, ymmword ptr [rsp + 0x1e0]
0x10046c884: vmovups ymmword ptr [rsp + 0x60], ymm5
0x10046c88a: vmovups ymmword ptr [rsp + 0x40], ymm4
0x10046c890: vmovups ymmword ptr [rsp + 0x20], ymm3
0x10046c896: vmovups ymmword ptr [rsp], ymm2
0x10046c89b: vmovups xmmword ptr [rsp + 0xb8], xmm1
0x10046c8a4: vmovups xmmword ptr [rsp + 0x98], xmm0
0x10046c8ad: mov rdi, r15
0x10046c8b0: mov rsi, r14
0x10046c8b3: vzeroupper 
0x10046c8b6: call 0x100467330 ; 0x100467330
0x10046c8bb: mov rax, qword ptr [rip + 0x7a1016] ; 0x100c0d8d8
0x10046c8c2: mov rax, qword ptr [rax]
0x10046c8c5: cmp rax, qword ptr [rsp + 0x220]
0x10046c8cd: jne 0x10046c8e1
0x10046c8cf: mov rax, r15
0x10046c8d2: lea rsp, [rbp - 0x28]
0x10046c8d6: pop rbx
0x10046c8d7: pop r12
0x10046c8d9: pop r13
0x10046c8db: pop r14
0x10046c8dd: pop r15
0x10046c8df: pop rbp
0x10046c8e0: ret 
0x10046c8e1: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10046c8e6: lea rdi, [rip + 0x71d7d4] ; 0x100b8a0c1 options
0x10046c8ed: lea rsi, [rip + 0x71d09d] ; 0x100b89991 Model.cpp
0x10046c8f4: mov edx, 0x847
0x10046c8f9: mov ecx, 3
0x10046c8fe: call 0x1007e5f70 ; 0x1007e5f70
0x10046c903: ud2 
0x10046c905: lea rdi, [rip + 0x6f8550] ; 0x100b64e5c len + 1 <= N
0x10046c90c: lea rsi, [rip + 0x6f8556] ; 0x100b64e69 ../../../Code/Base/FixedString.h
0x10046c913: mov edx, 0x30
0x10046c918: mov ecx, 3
0x10046c91d: call 0x1007e5f70 ; 0x1007e5f70
0x10046c922: ud2 
0x10046c924: lea rdi, [rip + 0x71d79e] ; 0x100b8a0c9 m_numModels < kMaxModels
0x10046c92b: lea rsi, [rip + 0x71d05f] ; 0x100b89991 Model.cpp
0x10046c932: mov edx, 0x886
0x10046c937: mov ecx, 3
0x10046c93c: vzeroupper 
0x10046c93f: call 0x1007e5f70 ; 0x1007e5f70
0x10046c944: ud2 
0x10046c946: nop word ptr cs:[rax + rax]
