0x1007f6ae0: test edx, edx
0x1007f6ae2: je 0x1007f6b56
0x1007f6ae4: mov eax, dword ptr [rdi + 0x53c]
0x1007f6aea: lea r8d, [rax - 1]
0x1007f6aee: test rax, rax
0x1007f6af1: cmove r8, rax
0x1007f6af5: je 0x1007f6b24
0x1007f6af7: lea r9, [r8 + r8*2]
0x1007f6afb: mov ecx, dword ptr [rdi + r9*4 + 0x544]
0x1007f6b03: add ecx, dword ptr [rdi + r9*4 + 0x540]
0x1007f6b0b: cmp ecx, esi
0x1007f6b0d: jne 0x1007f6b2d
0x1007f6b0f: lea rax, [r8 + r8*2]
0x1007f6b13: lea rcx, [rdi + rax*4 + 0x544]
0x1007f6b1b: mov eax, dword ptr [rdi + rax*4 + 0x544]
0x1007f6b22: jmp 0x1007f6b52 ; 0x1007f6b52
0x1007f6b24: mov ecx, 0xffffffff
0x1007f6b29: cmp ecx, esi
0x1007f6b2b: je 0x1007f6b0f
0x1007f6b2d: cmp eax, 0x400
0x1007f6b32: jae 0x1007f6b57
0x1007f6b34: lea rcx, [rax + rax*2]
0x1007f6b38: mov dword ptr [rdi + rcx*4 + 0x540], esi
0x1007f6b3f: mov dword ptr [rdi + rcx*4 + 0x544], edx
0x1007f6b46: lea rcx, [rdi + 0x53c]
0x1007f6b4d: mov edx, 1
0x1007f6b52: add eax, edx
0x1007f6b54: mov dword ptr [rcx], eax
0x1007f6b56: ret 
0x1007f6b57: push rbp
0x1007f6b58: mov rbp, rsp
0x1007f6b5b: lea rdi, [rip + 0x3b13f1] ; 0x100ba7f53 m_chunkCount < kMaxRenderChunks
0x1007f6b62: lea rsi, [rip + 0x3b0f7b] ; 0x100ba7ae4 Vertex.cpp
0x1007f6b69: mov edx, 0x1bd
0x1007f6b6e: mov ecx, 3
0x1007f6b73: call 0x1007e5f70 ; 0x1007e5f70
0x1007f6b78: ud2 
0x1007f6b7a: nop word ptr [rax + rax]
