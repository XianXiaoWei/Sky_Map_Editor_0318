0x1003781b0: push rbp
0x1003781b1: mov rbp, rsp
0x1003781b4: push r15
0x1003781b6: push r14
0x1003781b8: push r13
0x1003781ba: push r12
0x1003781bc: push rbx
0x1003781bd: sub rsp, 0x108
0x1003781c4: mov rbx, rdi
0x1003781c7: mov rax, qword ptr [rip + 0x89570a] ; 0x100c0d8d8
0x1003781ce: mov rax, qword ptr [rax]
0x1003781d1: mov qword ptr [rbp - 0x30], rax
0x1003781d5: lea r14, [rbx + 0x14e0]
0x1003781dc: mov rdi, r14
0x1003781df: call 0x1007e9d20 ; 0x1007e9d20
0x1003781e4: cmp byte ptr [rbx + 0x1398], 0
0x1003781eb: je 0x1003782d5
0x1003781f1: lea r15, [rbx + 0x1398]
0x1003781f8: cmp dword ptr [rbx + 0x1374], 2
0x1003781ff: jl 0x1003782d5
0x100378205: jne 0x10037822a
0x100378207: call 0x1007abc10 ; 0x1007abc10
0x10037820c: mov rax, qword ptr [rip + 0x1c8273d] ; 0x101ffa950
0x100378213: mov eax, dword ptr [rax + 0x38]
0x100378216: movabs rcx, 0x300000000
0x100378220: or rcx, rax
0x100378223: mov qword ptr [rbx + 0x1370], rcx
0x10037822a: cmp byte ptr [rbx + 0x1378], 0
0x100378231: je 0x1003782c7
0x100378237: lea r13, [rbx + 0x1378]
0x10037823e: mov rdi, qword ptr [rbx + 0x1068]
0x100378245: mov edx, dword ptr [rbx + 0x1560]
0x10037824b: lea rsi, [rip + 0x7e8809] ; 0x100b60a5b OnLevelUnload
0x100378252: mov ecx, 1
0x100378257: call 0x1007b1b40 ; 0x1007b1b40
0x10037825c: mov rdi, qword ptr [rbx + 0x1068]
0x100378263: mov edx, dword ptr [rbx + 0x1560]
0x100378269: lea rsi, [rip + 0x80b5e6] ; 0x100b83856 OnLevelUnloadLate
0x100378270: mov ecx, 1
0x100378275: call 0x1007b1b40 ; 0x1007b1b40
0x10037827a: mov rcx, qword ptr [rbx + 0x610]
0x100378281: lea rdx, [rip + 0x80b937] ; 0x100b83bbf Data/Levels/%s/Resources.lua
0x100378288: lea r12, [rbp - 0x130]
0x10037828f: mov esi, 0x100
0x100378294: xor eax, eax
0x100378296: mov rdi, r12
0x100378299: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10037829e: mov rsi, qword ptr [rbx + 0x18]
0x1003782a2: mov rdi, qword ptr [rbx + 0x140]
0x1003782a9: mov rdx, r12
0x1003782ac: call 0x1007c2bd0 ; 0x1007c2bd0
0x1003782b1: mov rdi, qword ptr [rbx + 0x140]
0x1003782b8: call 0x1007c3010 ; 0x1007c3010
0x1003782bd: vxorps ymm0, ymm0, ymm0
0x1003782c1: vmovups ymmword ptr [r13], ymm0
0x1003782c7: mov rdi, rbx
0x1003782ca: mov rsi, r15
0x1003782cd: vzeroupper 
0x1003782d0: call 0x1003784a0 ; 0x1003784a0
0x1003782d5: mov rdi, rbx
0x1003782d8: call 0x100378b60 ; 0x100378b60
0x1003782dd: mov rdi, qword ptr [rbx + 0x1068]
0x1003782e4: lea r15, [rip + 0x7e9b16] ; 0x100b61e01 RenderFlush
0x1003782eb: lea rdx, [rip - 0x1fb2] ; 0x100376340
0x1003782f2: mov rsi, r15
0x1003782f5: call 0x1007b1970 ; 0x1007b1970
0x1003782fa: mov rdi, qword ptr [rbx + 0x1068]
0x100378301: mov edx, dword ptr [rbx + 0x1560]
0x100378307: mov ecx, 1
0x10037830c: mov rsi, r15
0x10037830f: call 0x1007b1b40 ; 0x1007b1b40
0x100378314: mov rdi, qword ptr [rbx + 0x158]
0x10037831b: mov rsi, qword ptr [rbx + 0x148]
0x100378322: mov rdx, qword ptr [rbx + 0x70]
0x100378326: mov rcx, qword ptr [rbx + 0x2b0]
0x10037832d: mov r8, qword ptr [rbx + 0x3d8]
0x100378334: mov r9, qword ptr [rbx + 0x118]
0x10037833b: sub rsp, 8
0x10037833f: push qword ptr [rbx + 0x58]
0x100378342: push qword ptr [rbx + 0x298]
0x100378348: push qword ptr [rbx + 0x150]
0x10037834e: call 0x100247060 ; 0x100247060
0x100378353: add rsp, 0x20
0x100378357: mov rdi, qword ptr [rbx + 0x148]
0x10037835e: call 0x10058fce0 ; 0x10058fce0
0x100378363: mov rdi, qword ptr [rbx + 0x1068]
0x10037836a: mov edx, dword ptr [rbx + 0x1560]
0x100378370: lea rsi, [rip + 0x7e9a7f] ; 0x100b61df6 PostRender
0x100378377: xor ecx, ecx
0x100378379: call 0x1007b1b40 ; 0x1007b1b40
0x10037837e: inc dword ptr [rbx + 0x14d8]
0x100378384: mov rdi, r14
0x100378387: call 0x1007ea170 ; 0x1007ea170
0x10037838c: mov rax, qword ptr [rip + 0x895545] ; 0x100c0d8d8
0x100378393: mov rax, qword ptr [rax]
0x100378396: cmp rax, qword ptr [rbp - 0x30]
0x10037839a: jne 0x1003783ae
0x10037839c: add rsp, 0x108
0x1003783a3: pop rbx
0x1003783a4: pop r12
0x1003783a6: pop r13
0x1003783a8: pop r14
0x1003783aa: pop r15
0x1003783ac: pop rbp
0x1003783ad: ret 
0x1003783ae: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1003783b3: nop word ptr cs:[rax + rax]
