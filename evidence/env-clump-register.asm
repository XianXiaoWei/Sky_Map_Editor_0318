0x10031b3c0: push rbp
0x10031b3c1: mov rbp, rsp
0x10031b3c4: push r15
0x10031b3c6: push r14
0x10031b3c8: push r13
0x10031b3ca: push r12
0x10031b3cc: push rbx
0x10031b3cd: sub rsp, 0x28
0x10031b3d1: vmovss dword ptr [rbp - 0x2c], xmm3
0x10031b3d6: vmovss dword ptr [rbp - 0x3c], xmm2
0x10031b3db: vmovss dword ptr [rbp - 0x38], xmm1
0x10031b3e0: vmovss dword ptr [rbp - 0x34], xmm0
0x10031b3e5: mov r15, rdx
0x10031b3e8: mov r14, rsi
0x10031b3eb: mov rbx, rdi
0x10031b3ee: cmp ecx, 4
0x10031b3f1: jae 0x10031b638
0x10031b3f7: cmp dword ptr [r15 + 0x10], 0
0x10031b3fc: je 0x10031b657
0x10031b402: test r14, r14
0x10031b405: mov dword ptr [rbp - 0x30], ecx
0x10031b408: je 0x10031b414
0x10031b40a: mov edi, dword ptr [r14]
0x10031b40d: call 0x1007abd30 ; 0x1007abd30
0x10031b412: jmp 0x10031b419 ; 0x10031b419
0x10031b414: call 0x1007abbf0 ; 0x1007abbf0
0x10031b419: mov rcx, qword ptr [rax]
0x10031b41c: mov rdi, rax
0x10031b41f: call qword ptr [rcx + 0x68]
0x10031b422: mov r13, rax
0x10031b425: test r13, r13
0x10031b428: jne 0x10031b432
0x10031b42a: call 0x1007abc60 ; 0x1007abc60
0x10031b42f: mov r13, rax
0x10031b432: cmp dword ptr [rbx + 0x90], 0
0x10031b439: je 0x10031b60c
0x10031b43f: xor r12d, r12d
0x10031b442: nop word ptr cs:[rax + rax]
0x10031b450: mov eax, r12d
0x10031b453: mov rax, qword ptr [rbx + rax*8 + 0x10]
0x10031b458: test rax, rax
0x10031b45b: je 0x10031b470
0x10031b45d: mov edi, dword ptr [rax]
0x10031b45f: call 0x1007abd30 ; 0x1007abd30
0x10031b464: jmp 0x10031b475 ; 0x10031b475
0x10031b466: nop word ptr cs:[rax + rax]
0x10031b470: call 0x1007abbf0 ; 0x1007abbf0
0x10031b475: mov rcx, qword ptr [rax]
0x10031b478: mov rdi, rax
0x10031b47b: call qword ptr [rcx + 0x68]
0x10031b47e: test rax, rax
0x10031b481: jne 0x10031b488
0x10031b483: call 0x1007abc60 ; 0x1007abc60
0x10031b488: cmp rax, r13
0x10031b48b: je 0x10031b49d
0x10031b48d: inc r12d
0x10031b490: mov eax, dword ptr [rbx + 0x90]
0x10031b496: cmp r12d, eax
0x10031b499: jb 0x10031b450
0x10031b49b: jmp 0x10031b4a3 ; 0x10031b4a3
0x10031b49d: mov eax, dword ptr [rbx + 0x90]
0x10031b4a3: cmp r12d, eax
0x10031b4a6: jae 0x10031b60c
0x10031b4ac: mov rdi, r14
0x10031b4af: mov ecx, r12d
0x10031b4b2: mov eax, dword ptr [rbp - 0x30]
0x10031b4b5: mov rsi, rcx
0x10031b4b8: shl rsi, 4
0x10031b4bc: add rsi, rbx
0x10031b4bf: mov edx, dword ptr [rsi + rax*4 + 0x2a0d8]
0x10031b4c6: cmp rdx, 0x60
0x10031b4ca: jae 0x10031b67f
0x10031b4d0: lea r12, [rsi + rax*4 + 0x2a0d8]
0x10031b4d8: lea esi, [rdx + 1]
0x10031b4db: mov dword ptr [r12], esi
0x10031b4df: imul rcx, rcx, 0x5400
0x10031b4e6: add rbx, rcx
0x10031b4e9: imul r13, rax, 0x1500
0x10031b4f0: add r13, rbx
0x10031b4f3: imul r14, rdx, 0x38
0x10031b4f7: mov qword ptr [r14 + r13 + 0xd8], rdi
0x10031b4ff: mov qword ptr [r14 + r13 + 0xe0], r15
0x10031b507: mov qword ptr [r14 + r13 + 0xe8], 0
0x10031b513: vmovss xmm0, dword ptr [rbp - 0x34]
0x10031b518: vmovss dword ptr [r14 + r13 + 0xf0], xmm0
0x10031b522: vmovss xmm0, dword ptr [rbp - 0x38]
0x10031b527: vmovss dword ptr [r14 + r13 + 0xf4], xmm0
0x10031b531: vmovss xmm0, dword ptr [rbp - 0x3c]
0x10031b536: vmovss dword ptr [r14 + r13 + 0xf8], xmm0
0x10031b540: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10031b545: vmovss dword ptr [r14 + r13 + 0xfc], xmm0
0x10031b54f: cmp dword ptr [r15 + 0x10], 0
0x10031b554: je 0x10031b69e
0x10031b55a: mov rax, qword ptr [r15 + 8]
0x10031b55e: mov rax, qword ptr [rax]
0x10031b561: mov qword ptr [rbp - 0x50], rax
0x10031b565: call 0x1007abc10 ; 0x1007abc10
0x10031b56a: mov r15, rax
0x10031b56d: mov qword ptr [rbp - 0x48], 0
0x10031b575: call 0x10043ccc0 ; 0x10043ccc0
0x10031b57a: mov rbx, qword ptr [rax]
0x10031b57d: lea rsi, [rbp - 0x48]
0x10031b581: lea rdx, [rbp - 0x50]
0x10031b585: mov rdi, rax
0x10031b588: mov rcx, r15
0x10031b58b: call qword ptr [rbx + 0x40]
0x10031b58e: mov rdi, qword ptr [rbp - 0x48]
0x10031b592: test rdi, rdi
0x10031b595: je 0x10031b6bd
0x10031b59b: lea rbx, [r14 + r13 + 0xfc]
0x10031b5a3: mov rax, qword ptr [rdi]
0x10031b5a6: call qword ptr [rax + 0x10]
0x10031b5a9: mov byte ptr [r14 + r13 + 0x108], al
0x10031b5b1: vmovss xmm0, dword ptr [rip + 0x78b4e3] ; 0x100aa6a9c
0x10031b5b9: test al, al
0x10031b5bb: je 0x10031b5c2
0x10031b5bd: vaddss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x10031b5c2: vmovss dword ptr [r14 + r13 + 0x100], xmm0
0x10031b5cc: vxorps xmm0, xmm0, xmm0
0x10031b5d0: vcmpeqss xmm0, xmm0, dword ptr [rbx]
0x10031b5d5: vmovss xmm1, dword ptr [rip + 0x789ae3] ; 0x100aa50c0
0x10031b5dd: vandps xmm0, xmm0, xmm1
0x10031b5e1: vmovss dword ptr [r14 + r13 + 0x104], xmm0
0x10031b5eb: mov eax, dword ptr [r12]
0x10031b5ef: dec eax
0x10031b5f1: imul rax, rax, 0x38
0x10031b5f5: lea rax, [rax + r13 + 0xd8]
0x10031b5fd: add rsp, 0x28
0x10031b601: pop rbx
0x10031b602: pop r12
0x10031b604: pop r13
0x10031b606: pop r14
0x10031b608: pop r15
0x10031b60a: pop rbp
0x10031b60b: ret 
0x10031b60c: mov r9, qword ptr [r13 + 8]
0x10031b610: lea rdi, [rip + 0x8655a7] ; 0x100b80bbe varIdx < m_varCount
0x10031b617: lea rsi, [rip + 0x8653ae] ; 0x100b809cc Environment.cpp
0x10031b61e: lea r8, [rip + 0x865517] ; 0x100b80b3c No EnvVars of type %s registered with Environment system
0x10031b625: mov edx, 0x1af
0x10031b62a: mov ecx, 4
0x10031b62f: xor eax, eax
0x10031b631: call 0x1007e6030 ; 0x1007e6030
0x10031b636: ud2 
0x10031b638: lea rdi, [rip + 0x865536] ; 0x100b80b75 layer < kMaxLayers
0x10031b63f: lea rsi, [rip + 0x865386] ; 0x100b809cc Environment.cpp
0x10031b646: mov edx, 0x1a5
0x10031b64b: mov ecx, 3
0x10031b650: call 0x1007e5f70 ; 0x1007e5f70
0x10031b655: ud2 
0x10031b657: lea rdi, [rip + 0x86552a] ; 0x100b80b88 markers->Size() > 0
0x10031b65e: lea rsi, [rip + 0x865367] ; 0x100b809cc Environment.cpp
0x10031b665: lea r8, [rip + 0x865530] ; 0x100b80b9c Environment hull with no markers!
0x10031b66c: mov edx, 0x1a6
0x10031b671: mov ecx, 4
0x10031b676: xor eax, eax
0x10031b678: call 0x1007e6030 ; 0x1007e6030
0x10031b67d: ud2 
0x10031b67f: lea rdi, [rip + 0x86554c] ; 0x100b80bd2 count < kMaxHulls
0x10031b686: lea rsi, [rip + 0x86533f] ; 0x100b809cc Environment.cpp
0x10031b68d: mov edx, 0x1b2
0x10031b692: mov ecx, 3
0x10031b697: call 0x1007e5f70 ; 0x1007e5f70
0x10031b69c: ud2 
0x10031b69e: lea rdi, [rip + 0x8462b3] ; 0x100b61958 idx < size
0x10031b6a5: lea rsi, [rip + 0x8462b7] ; 0x100b61963 ./Clump.h
0x10031b6ac: mov edx, 0x36
0x10031b6b1: mov ecx, 3
0x10031b6b6: call 0x1007e5f70 ; 0x1007e5f70
0x10031b6bb: ud2 
0x10031b6bd: lea rdi, [rip + 0x846434] ; 0x100b61af8 ret
0x10031b6c4: lea rsi, [rip + 0x846298] ; 0x100b61963 ./Clump.h
0x10031b6cb: mov edx, 0x47
0x10031b6d0: mov ecx, 3
0x10031b6d5: call 0x1007e5f70 ; 0x1007e5f70
0x10031b6da: ud2 
0x10031b6dc: nop dword ptr [rax]
