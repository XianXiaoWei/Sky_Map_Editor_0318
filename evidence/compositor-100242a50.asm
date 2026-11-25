0x100242a50: push rbp
0x100242a51: mov rbp, rsp
0x100242a54: push r15
0x100242a56: push r14
0x100242a58: push r12
0x100242a5a: push rbx
0x100242a5b: mov r12, rsi
0x100242a5e: mov rbx, rdi
0x100242a61: mov r15d, dword ptr [rbx + 0x1830]
0x100242a68: imul r15d, dword ptr [rbx + 0x1834]
0x100242a70: add r15d, r15d
0x100242a73: call 0x1007c6c20 ; 0x1007c6c20
0x100242a78: shl r15, 2
0x100242a7c: lea rcx, [rip + 0x1e060cd] ; 0x102048b50
0x100242a83: mov rdx, qword ptr [rcx]
0x100242a86: mov ecx, 4
0x100242a8b: mov rdi, rax
0x100242a8e: mov rsi, r15
0x100242a91: call 0x100795530 ; 0x100795530
0x100242a96: mov r14, rax
0x100242a99: vmovss xmm1, dword ptr [r12 + 4]
0x100242aa0: vmovss xmm0, dword ptr [r12 + 8]
0x100242aa7: mov edi, dword ptr [rbx + 0x1830]
0x100242aad: mov esi, dword ptr [rbx + 0x1834]
0x100242ab3: mov rdx, r14
0x100242ab6: call 0x100242120 ; 0x100242120
0x100242abb: cmp dword ptr [rbx + 0x178], 2
0x100242ac2: jne 0x100242bc7
0x100242ac8: mov eax, dword ptr [rbx + 0x130]
0x100242ace: test eax, eax
0x100242ad0: je 0x100242b66
0x100242ad6: lea rdi, [rbx + 0x170]
0x100242add: xor ecx, ecx
0x100242adf: nop 
0x100242ae0: mov edx, ecx
0x100242ae2: shl rdx, 4
0x100242ae6: cmp dword ptr [rbx + rdx + 0xc], 1
0x100242aeb: je 0x100242af5
0x100242aed: inc ecx
0x100242aef: cmp ecx, eax
0x100242af1: jb 0x100242ae0
0x100242af3: jmp 0x100242b66 ; 0x100242b66
0x100242af5: mov eax, dword ptr [rbx + 4]
0x100242af8: add eax, -5
0x100242afb: cmp eax, 0x1b
0x100242afe: jbe 0x100242b66
0x100242b00: call 0x100795060 ; 0x100795060
0x100242b05: mov rdi, rax
0x100242b08: mov rsi, r14
0x100242b0b: mov rdx, r15
0x100242b0e: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100242b13: mov rdi, rbx
0x100242b16: call 0x1007f58d0 ; 0x1007f58d0
0x100242b1b: cmp dword ptr [rbx + 0x5b0], 2
0x100242b22: jne 0x100242bc7
0x100242b28: mov eax, dword ptr [rbx + 0x568]
0x100242b2e: test eax, eax
0x100242b30: je 0x100242b66
0x100242b32: lea r12, [rbx + 0x438]
0x100242b39: lea rdi, [rbx + 0x5a8]
0x100242b40: xor ecx, ecx
0x100242b42: nop word ptr cs:[rax + rax]
0x100242b50: mov edx, ecx
0x100242b52: shl rdx, 4
0x100242b56: cmp dword ptr [rbx + rdx + 0x444], 1
0x100242b5e: je 0x100242b85
0x100242b60: inc ecx
0x100242b62: cmp ecx, eax
0x100242b64: jb 0x100242b50
0x100242b66: lea rdi, [rip + 0x9341e0] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x100242b6d: lea rsi, [rip + 0x91f707] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100242b74: mov edx, 0x116
0x100242b79: mov ecx, 3
0x100242b7e: call 0x1007e5f70 ; 0x1007e5f70
0x100242b83: ud2 
0x100242b85: mov eax, dword ptr [rbx + 0x43c]
0x100242b8b: add eax, -5
0x100242b8e: cmp eax, 0x1c
0x100242b91: jb 0x100242b66
0x100242b93: call 0x100795060 ; 0x100795060
0x100242b98: mov rdi, rax
0x100242b9b: mov rsi, r14
0x100242b9e: mov rdx, r15
0x100242ba1: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100242ba6: mov rdi, r12
0x100242ba9: call 0x1007f58d0 ; 0x1007f58d0
0x100242bae: call 0x1007c6c20 ; 0x1007c6c20
0x100242bb3: mov rdi, rax
0x100242bb6: mov rsi, r14
0x100242bb9: call 0x100795a70 ; 0x100795a70
0x100242bbe: pop rbx
0x100242bbf: pop r12
0x100242bc1: pop r14
0x100242bc3: pop r15
0x100242bc5: pop rbp
0x100242bc6: ret 
0x100242bc7: lea rdi, [rip + 0x93414d] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x100242bce: lea rsi, [rip + 0x91f6a6] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100242bd5: mov edx, 0x115
0x100242bda: mov ecx, 3
0x100242bdf: call 0x1007e5f70 ; 0x1007e5f70
0x100242be4: jmp 0x100242b83 ; 0x100242b83
0x100242be6: jmp 0x100242bf0 ; 0x100242bf0
0x100242be8: mov rdi, rax
0x100242beb: call 0x100011bf0 ; 0x100011bf0
0x100242bf0: mov rbx, rax
0x100242bf3: call 0x1007c6c20 ; 0x1007c6c20
0x100242bf8: mov rdi, rax
0x100242bfb: mov rsi, r14
0x100242bfe: call 0x100795a70 ; 0x100795a70
0x100242c03: mov rdi, rbx
0x100242c06: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100242c0b: mov rdi, rax
0x100242c0e: call 0x100011bf0 ; 0x100011bf0
0x100242c13: nop word ptr cs:[rax + rax]
