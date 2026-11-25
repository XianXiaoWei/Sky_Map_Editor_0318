0x1007bc8b0: push rbp
0x1007bc8b1: mov rbp, rsp
0x1007bc8b4: push r15
0x1007bc8b6: push r14
0x1007bc8b8: push r13
0x1007bc8ba: push r12
0x1007bc8bc: push rbx
0x1007bc8bd: sub rsp, 0x18
0x1007bc8c1: mov r15, rdx
0x1007bc8c4: mov rbx, rdi
0x1007bc8c7: mov eax, dword ptr [rbx]
0x1007bc8c9: cmp rax, 0x32
0x1007bc8cd: jae 0x1007bcac7
0x1007bc8d3: mov ecx, dword ptr [rbx + 0x19830]
0x1007bc8d9: cmp ecx, 2
0x1007bc8dc: je 0x1007bcae6
0x1007bc8e2: cmp ecx, 1
0x1007bc8e5: je 0x1007bcb02
0x1007bc8eb: imul r12, rax, 0xf0
0x1007bc8f2: lea r14, [rbx + r12 + 8]
0x1007bc8f7: mov qword ptr [rbp - 0x38], rsi
0x1007bc8fb: mov rdi, rsi
0x1007bc8fe: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bc903: mov r13, rax
0x1007bc906: movzx ecx, byte ptr [rbx + r12 + 8]
0x1007bc90c: test cl, 1
0x1007bc90f: jne 0x1007bc92e
0x1007bc911: mov esi, 0x16
0x1007bc916: mov rdx, r13
0x1007bc919: sub rdx, rsi
0x1007bc91c: ja 0x1007bc940
0x1007bc91e: test cl, 1
0x1007bc921: jne 0x1007bc94a
0x1007bc923: lea rax, [r14 + 1]
0x1007bc927: test r13, r13
0x1007bc92a: jne 0x1007bc954
0x1007bc92c: jmp 0x1007bc96c ; 0x1007bc96c
0x1007bc92e: mov rsi, qword ptr [r14]
0x1007bc931: and rsi, 0xfffffffffffffffe
0x1007bc935: dec rsi
0x1007bc938: mov rdx, r13
0x1007bc93b: sub rdx, rsi
0x1007bc93e: jbe 0x1007bc91e
0x1007bc940: test cl, 1
0x1007bc943: jne 0x1007bc97f
0x1007bc945: shr rcx, 1
0x1007bc948: jmp 0x1007bc984 ; 0x1007bc984
0x1007bc94a: mov rax, qword ptr [rbx + r12 + 0x18]
0x1007bc94f: test r13, r13
0x1007bc952: je 0x1007bc96c
0x1007bc954: mov qword ptr [rbp - 0x30], rax
0x1007bc958: mov rdi, qword ptr [rbp - 0x30]
0x1007bc95c: mov rsi, qword ptr [rbp - 0x38]
0x1007bc960: mov rdx, r13
0x1007bc963: call 0x100aa28fa ; 0x100aa28fa _memmove
0x1007bc968: mov rax, qword ptr [rbp - 0x30]
0x1007bc96c: mov byte ptr [rax + r13], 0
0x1007bc971: test byte ptr [r14], 1
0x1007bc975: jne 0x1007bc99d
0x1007bc977: add r13b, r13b
0x1007bc97a: mov byte ptr [r14], r13b
0x1007bc97d: jmp 0x1007bc9a2 ; 0x1007bc9a2
0x1007bc97f: mov rcx, qword ptr [rbx + r12 + 0x10]
0x1007bc984: xor r8d, r8d
0x1007bc987: mov rdi, r14
0x1007bc98a: mov r9, rcx
0x1007bc98d: push qword ptr [rbp - 0x38]
0x1007bc990: push r13
0x1007bc992: call 0x1000198c0 ; 0x1000198c0
0x1007bc997: add rsp, 0x10
0x1007bc99b: jmp 0x1007bc9a2 ; 0x1007bc9a2
0x1007bc99d: mov qword ptr [rbx + r12 + 0x10], r13
0x1007bc9a2: vmovups ymm0, ymmword ptr [r15 + 0xb0]
0x1007bc9ab: vmovups ymmword ptr [rbx + r12 + 0xd8], ymm0
0x1007bc9b5: vmovups ymm0, ymmword ptr [r15 + 0xa0]
0x1007bc9be: vmovups ymmword ptr [rbx + r12 + 0xc8], ymm0
0x1007bc9c8: vmovups ymm0, ymmword ptr [r15 + 0x80]
0x1007bc9d1: vmovups ymmword ptr [rbx + r12 + 0xa8], ymm0
0x1007bc9db: vmovups ymm0, ymmword ptr [r15]
0x1007bc9e0: vmovups ymm1, ymmword ptr [r15 + 0x20]
0x1007bc9e6: vmovups ymm2, ymmword ptr [r15 + 0x40]
0x1007bc9ec: vmovups ymm3, ymmword ptr [r15 + 0x60]
0x1007bc9f2: vmovups ymmword ptr [rbx + r12 + 0x88], ymm3
0x1007bc9fc: vmovups ymmword ptr [rbx + r12 + 0x68], ymm2
0x1007bca03: vmovups ymmword ptr [rbx + r12 + 0x48], ymm1
0x1007bca0a: vmovups ymmword ptr [rbx + r12 + 0x28], ymm0
0x1007bca11: mov byte ptr [rbx + r12 + 0x20], 0
0x1007bca17: vmovss xmm0, dword ptr [r15 + 0x90]
0x1007bca20: vxorps xmm1, xmm1, xmm1
0x1007bca24: vucomiss xmm0, xmm1
0x1007bca28: jne 0x1007bcb1e
0x1007bca2e: jp 0x1007bcb1e
0x1007bca34: cmp byte ptr [r15 + 0xb0], 0
0x1007bca3c: jne 0x1007bcb3a
0x1007bca42: movsxd rax, dword ptr [r15 + 0x80]
0x1007bca49: lea rcx, [rax + rax*2]
0x1007bca4d: shl rcx, 4
0x1007bca51: cmp dword ptr [rbx + rcx + 0x168ac], 0x15
0x1007bca59: jne 0x1007bca68
0x1007bca5b: cmp dword ptr [r15 + 0xa0], eax
0x1007bca62: jne 0x1007bcb56
0x1007bca68: mov eax, dword ptr [rbx + 0x18724]
0x1007bca6e: lea ecx, [rax + 1]
0x1007bca71: mov dword ptr [rbx + 0x18724], ecx
0x1007bca77: shl rax, 4
0x1007bca7b: mov dword ptr [rbx + rax + 0x18728], 0
0x1007bca86: mov ecx, dword ptr [rbx]
0x1007bca88: mov dword ptr [rbx + rax + 0x1872c], ecx
0x1007bca8f: test byte ptr [r14], 1
0x1007bca93: jne 0x1007bca9a
0x1007bca95: inc r14
0x1007bca98: jmp 0x1007bca9f ; 0x1007bca9f
0x1007bca9a: mov r14, qword ptr [rbx + r12 + 0x18]
0x1007bca9f: mov qword ptr [rbx + rax + 0x18730], r14
0x1007bcaa7: mov dword ptr [rbx + 0x19830], 1
0x1007bcab1: inc ecx
0x1007bcab3: mov dword ptr [rbx], ecx
0x1007bcab5: add rsp, 0x18
0x1007bcab9: pop rbx
0x1007bcaba: pop r12
0x1007bcabc: pop r13
0x1007bcabe: pop r14
0x1007bcac0: pop r15
0x1007bcac2: pop rbp
0x1007bcac3: vzeroupper 
0x1007bcac6: ret 
0x1007bcac7: lea rdi, [rip + 0x3e700d] ; 0x100ba3adb renderPassCount < kMaxRenderPasses
0x1007bcace: lea rsi, [rip + 0x3e6e86] ; 0x100ba395b RenderOutline.cpp
0x1007bcad5: mov edx, 0xc4
0x1007bcada: mov ecx, 3
0x1007bcadf: call 0x1007e5f70 ; 0x1007e5f70
0x1007bcae4: ud2 
0x1007bcae6: lea rdi, [rip + 0x3e6fac] ; 0x100ba3a99 m_activePassType != kGpuPassType_Compute
0x1007bcaed: lea rsi, [rip + 0x3e6e67] ; 0x100ba395b RenderOutline.cpp
0x1007bcaf4: lea r8, [rip + 0x3e6fc7] ; 0x100ba3ac2 Unterminated ComputePass
0x1007bcafb: mov edx, 0xc6
0x1007bcb00: jmp 0x1007bcb70 ; 0x1007bcb70
0x1007bcb02: lea rdi, [rip + 0x3e6f50] ; 0x100ba3a59 m_activePassType != kGpuPassType_Render
0x1007bcb09: lea rsi, [rip + 0x3e6e4b] ; 0x100ba395b RenderOutline.cpp
0x1007bcb10: lea r8, [rip + 0x3e6f6a] ; 0x100ba3a81 Unterminated RenderPass
0x1007bcb17: mov edx, 0xc5
0x1007bcb1c: jmp 0x1007bcb70 ; 0x1007bcb70
0x1007bcb1e: lea rdi, [rip + 0x3e6fd9] ; 0x100ba3afe args.depth.clearDepth == 0.0f
0x1007bcb25: lea rsi, [rip + 0x3e6e2f] ; 0x100ba395b RenderOutline.cpp
0x1007bcb2c: lea r8, [rip + 0x3e6fe9] ; 0x100ba3b1c Custom depth clears are not currently supported
0x1007bcb33: mov edx, 0xcd
0x1007bcb38: jmp 0x1007bcb70 ; 0x1007bcb70
0x1007bcb3a: lea rdi, [rip + 0x3e700b] ; 0x100ba3b4c args.stencil.clearStencil == 0
0x1007bcb41: lea rsi, [rip + 0x3e6e13] ; 0x100ba395b RenderOutline.cpp
0x1007bcb48: lea r8, [rip + 0x3e701c] ; 0x100ba3b6b Custom stencil clears are not currently supported
0x1007bcb4f: mov edx, 0xce
0x1007bcb54: jmp 0x1007bcb70 ; 0x1007bcb70
0x1007bcb56: lea rdi, [rip + 0x3e7040] ; 0x100ba3b9d !requiresStencil || suppliesStencil
0x1007bcb5d: lea rsi, [rip + 0x3e6df7] ; 0x100ba395b RenderOutline.cpp
0x1007bcb64: lea r8, [rip + 0x3e7056] ; 0x100ba3bc1 When using a depth target with shared stencil, the stencil target must be explicitly set
0x1007bcb6b: mov edx, 0xd2
0x1007bcb70: mov ecx, 4
0x1007bcb75: xor eax, eax
0x1007bcb77: vzeroupper 
0x1007bcb7a: call 0x1007e6030 ; 0x1007e6030
0x1007bcb7f: ud2 
0x1007bcb81: nop word ptr cs:[rax + rax]
