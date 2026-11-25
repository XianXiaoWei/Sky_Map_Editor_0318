0x10025ed80: push rbp
0x10025ed81: mov rbp, rsp
0x10025ed84: push r14
0x10025ed86: push rbx
0x10025ed87: sub rsp, 0x10
0x10025ed8b: mov r14, rsi
0x10025ed8e: mov rbx, rdi
0x10025ed91: lea rsi, [rip + 0x91d870] ; 0x100b7c608 CrabBarn
0x10025ed98: mov rdi, rdx
0x10025ed9b: call 0x100385200 ; 0x100385200
0x10025eda0: test rax, rax
0x10025eda3: je 0x10025edef
0x10025eda5: cmp dword ptr [rax], 0
0x10025eda8: je 0x10025ede1
0x10025edaa: lea rdx, [rbx + 0x10]
0x10025edae: mov ecx, dword ptr [rbx + 0x410]
0x10025edb4: mov rsi, qword ptr [r14 + 0x178]
0x10025edbb: mov rsi, qword ptr [rsi + 0x20]
0x10025edbf: mov esi, dword ptr [rsi + 0x7d18]
0x10025edc5: mov dword ptr [rbp - 0x18], esi
0x10025edc8: lea r8, [rbp - 0x18]
0x10025edcc: vmovss xmm0, dword ptr [rip + 0x8462ec] ; 0x100aa50c0
0x10025edd4: mov rdi, rax
0x10025edd7: mov rsi, r14
0x10025edda: call 0x10025f0d0 ; 0x10025f0d0
0x10025eddf: jmp 0x10025edef ; 0x10025edef
0x10025ede1: mov rdi, rbx
0x10025ede4: mov rsi, rax
0x10025ede7: mov rdx, r14
0x10025edea: call 0x10025ee60 ; 0x10025ee60
0x10025edef: mov eax, dword ptr [rbx + 0x514]
0x10025edf5: mov dword ptr [rbx + 0x518], eax
0x10025edfb: vmovups ymm0, ymmword ptr [rbx + 0x414]
0x10025ee03: vmovups ymm1, ymmword ptr [rbx + 0x434]
0x10025ee0b: vmovups ymm2, ymmword ptr [rbx + 0x454]
0x10025ee13: vmovups ymm3, ymmword ptr [rbx + 0x474]
0x10025ee1b: vmovups ymmword ptr [rbx + 0x494], ymm0
0x10025ee23: vmovups ymmword ptr [rbx + 0x4b4], ymm1
0x10025ee2b: vmovups ymmword ptr [rbx + 0x4d4], ymm2
0x10025ee33: vmovups ymmword ptr [rbx + 0x4f4], ymm3
0x10025ee3b: mov dword ptr [rbx + 0x514], 0
0x10025ee45: add rsp, 0x10
0x10025ee49: pop rbx
0x10025ee4a: pop r14
0x10025ee4c: pop rbp
0x10025ee4d: vzeroupper 
0x10025ee50: ret 
0x10025ee51: nop word ptr cs:[rax + rax]
