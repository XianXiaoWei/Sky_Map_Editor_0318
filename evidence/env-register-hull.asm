0x10031b6e0: push rbp
0x10031b6e1: mov rbp, rsp
0x10031b6e4: push r15
0x10031b6e6: push r14
0x10031b6e8: push r13
0x10031b6ea: push r12
0x10031b6ec: push rbx
0x10031b6ed: sub rsp, 0x18
0x10031b6f1: mov r12d, ecx
0x10031b6f4: vmovss dword ptr [rbp - 0x38], xmm2
0x10031b6f9: vmovss dword ptr [rbp - 0x30], xmm0
0x10031b6fe: mov r15, rsi
0x10031b701: mov rbx, rdi
0x10031b704: cmp r12d, 4
0x10031b708: jae 0x10031b8e3
0x10031b70e: vmovss dword ptr [rbp - 0x34], xmm1
0x10031b713: vmovss dword ptr [rbp - 0x2c], xmm3
0x10031b718: test r15, r15
0x10031b71b: mov qword ptr [rbp - 0x40], rdx
0x10031b71f: je 0x10031b72b
0x10031b721: mov edi, dword ptr [r15]
0x10031b724: call 0x1007abd30 ; 0x1007abd30
0x10031b729: jmp 0x10031b730 ; 0x10031b730
0x10031b72b: call 0x1007abbf0 ; 0x1007abbf0
0x10031b730: mov rcx, qword ptr [rax]
0x10031b733: mov rdi, rax
0x10031b736: call qword ptr [rcx + 0x68]
0x10031b739: mov r13, rax
0x10031b73c: test r13, r13
0x10031b73f: jne 0x10031b749
0x10031b741: call 0x1007abc60 ; 0x1007abc60
0x10031b746: mov r13, rax
0x10031b749: cmp dword ptr [rbx + 0x90], 0
0x10031b750: je 0x10031b8b7
0x10031b756: xor r14d, r14d
0x10031b759: nop dword ptr [rax]
0x10031b760: mov eax, r14d
0x10031b763: mov rax, qword ptr [rbx + rax*8 + 0x10]
0x10031b768: test rax, rax
0x10031b76b: je 0x10031b780
0x10031b76d: mov edi, dword ptr [rax]
0x10031b76f: call 0x1007abd30 ; 0x1007abd30
0x10031b774: jmp 0x10031b785 ; 0x10031b785
0x10031b776: nop word ptr cs:[rax + rax]
0x10031b780: call 0x1007abbf0 ; 0x1007abbf0
0x10031b785: mov rcx, qword ptr [rax]
0x10031b788: mov rdi, rax
0x10031b78b: call qword ptr [rcx + 0x68]
0x10031b78e: test rax, rax
0x10031b791: jne 0x10031b798
0x10031b793: call 0x1007abc60 ; 0x1007abc60
0x10031b798: cmp rax, r13
0x10031b79b: je 0x10031b7b2
0x10031b79d: inc r14d
0x10031b7a0: mov eax, dword ptr [rbx + 0x90]
0x10031b7a6: cmp r14d, eax
0x10031b7a9: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10031b7ae: jb 0x10031b760
0x10031b7b0: jmp 0x10031b7bd ; 0x10031b7bd
0x10031b7b2: mov eax, dword ptr [rbx + 0x90]
0x10031b7b8: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10031b7bd: cmp r14d, eax
0x10031b7c0: jae 0x10031b8b7
0x10031b7c6: mov ecx, r14d
0x10031b7c9: mov eax, r12d
0x10031b7cc: mov rsi, rcx
0x10031b7cf: shl rsi, 4
0x10031b7d3: add rsi, rbx
0x10031b7d6: mov edx, dword ptr [rsi + rax*4 + 0x2a0d8]
0x10031b7dd: cmp rdx, 0x60
0x10031b7e1: jae 0x10031b902
0x10031b7e7: lea rsi, [rsi + rax*4 + 0x2a0d8]
0x10031b7ef: lea edi, [rdx + 1]
0x10031b7f2: mov dword ptr [rsi], edi
0x10031b7f4: imul rcx, rcx, 0x5400
0x10031b7fb: add rbx, rcx
0x10031b7fe: imul rcx, rax, 0x1500
0x10031b805: add rcx, rbx
0x10031b808: imul rdx, rdx, 0x38
0x10031b80c: lea rax, [rdx + rcx + 0xd8]
0x10031b814: mov qword ptr [rdx + rcx + 0xd8], r15
0x10031b81c: mov qword ptr [rdx + rcx + 0xe0], 0
0x10031b828: mov rsi, qword ptr [rbp - 0x40]
0x10031b82c: mov qword ptr [rdx + rcx + 0xe8], rsi
0x10031b834: vmovss xmm0, dword ptr [rbp - 0x30]
0x10031b839: vmovss dword ptr [rdx + rcx + 0xf0], xmm0
0x10031b842: vmovss xmm0, dword ptr [rbp - 0x34]
0x10031b847: vmovss dword ptr [rdx + rcx + 0xf4], xmm0
0x10031b850: vmovss xmm0, dword ptr [rbp - 0x38]
0x10031b855: vmovss dword ptr [rdx + rcx + 0xf8], xmm0
0x10031b85e: vmovss dword ptr [rdx + rcx + 0xfc], xmm1
0x10031b867: mov bl, byte ptr [rsi + 0x50]
0x10031b86a: mov byte ptr [rdx + rcx + 0x108], bl
0x10031b871: vmovss xmm0, dword ptr [rip + 0x78b223] ; 0x100aa6a9c
0x10031b879: test bl, bl
0x10031b87b: je 0x10031b881
0x10031b87d: vaddss xmm0, xmm1, xmm0
0x10031b881: vmovss dword ptr [rdx + rcx + 0x100], xmm0
0x10031b88a: vxorps xmm0, xmm0, xmm0
0x10031b88e: vcmpeqss xmm0, xmm1, xmm0
0x10031b893: vmovss xmm1, dword ptr [rip + 0x789825] ; 0x100aa50c0
0x10031b89b: vandps xmm0, xmm0, xmm1
0x10031b89f: vmovss dword ptr [rdx + rcx + 0x104], xmm0
0x10031b8a8: add rsp, 0x18
0x10031b8ac: pop rbx
0x10031b8ad: pop r12
0x10031b8af: pop r13
0x10031b8b1: pop r14
0x10031b8b3: pop r15
0x10031b8b5: pop rbp
0x10031b8b6: ret 
0x10031b8b7: mov r9, qword ptr [r13 + 8]
0x10031b8bb: lea rdi, [rip + 0x8652fc] ; 0x100b80bbe varIdx < m_varCount
0x10031b8c2: lea rsi, [rip + 0x865103] ; 0x100b809cc Environment.cpp
0x10031b8c9: lea r8, [rip + 0x86526c] ; 0x100b80b3c No EnvVars of type %s registered with Environment system
0x10031b8d0: mov edx, 0x1ce
0x10031b8d5: mov ecx, 4
0x10031b8da: xor eax, eax
0x10031b8dc: call 0x1007e6030 ; 0x1007e6030
0x10031b8e1: ud2 
0x10031b8e3: lea rdi, [rip + 0x86528b] ; 0x100b80b75 layer < kMaxLayers
0x10031b8ea: lea rsi, [rip + 0x8650db] ; 0x100b809cc Environment.cpp
0x10031b8f1: mov edx, 0x1c6
0x10031b8f6: mov ecx, 3
0x10031b8fb: call 0x1007e5f70 ; 0x1007e5f70
0x10031b900: ud2 
0x10031b902: lea rdi, [rip + 0x8652c9] ; 0x100b80bd2 count < kMaxHulls
0x10031b909: lea rsi, [rip + 0x8650bc] ; 0x100b809cc Environment.cpp
0x10031b910: mov edx, 0x1d1
0x10031b915: mov ecx, 3
0x10031b91a: call 0x1007e5f70 ; 0x1007e5f70
0x10031b91f: ud2 
0x10031b921: nop word ptr cs:[rax + rax]
