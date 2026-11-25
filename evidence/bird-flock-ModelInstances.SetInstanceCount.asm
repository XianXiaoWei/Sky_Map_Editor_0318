0x100473d40: push rbp
0x100473d41: mov rbp, rsp
0x100473d44: cmp dword ptr [rdi + 0x158], esi
0x100473d4a: jb 0x100473daf
0x100473d4c: mov eax, dword ptr [rdi + 0x458]
0x100473d52: test eax, eax
0x100473d54: je 0x100473d85
0x100473d56: mov ecx, 0x52a
0x100473d5b: add rcx, qword ptr [rdi + 0x450]
0x100473d62: xor edx, edx
0x100473d64: nop word ptr cs:[rax + rax]
0x100473d70: cmp byte ptr [rcx], 1
0x100473d73: je 0x100473d87
0x100473d75: mov dword ptr [rcx - 0x1a], esi
0x100473d78: inc edx
0x100473d7a: add rcx, 0x540
0x100473d81: cmp edx, eax
0x100473d83: jb 0x100473d70
0x100473d85: pop rbp
0x100473d86: ret 
0x100473d87: lea rdi, [rip + 0x6ee4e3] ; 0x100b62271 !m_queued
0x100473d8e: lea rsi, [rip + 0x6ee4e6] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100473d95: lea r8, [rip + 0x6ee4fb] ; 0x100b62297 VertexRender has already been committed!
0x100473d9c: mov edx, 0x92
0x100473da1: mov ecx, 4
0x100473da6: xor eax, eax
0x100473da8: call 0x1007e6030 ; 0x1007e6030
0x100473dad: ud2 
0x100473daf: lea rdi, [rip + 0x7163ce] ; 0x100b8a184 count <= m_vertexData.GetInstanceCapacity()
0x100473db6: lea rsi, [rip + 0x7163f3] ; 0x100b8a1b0 ModelInstances.cpp
0x100473dbd: lea r8, [rip + 0x7163ff] ; 0x100b8a1c3 Too many instances!
0x100473dc4: mov edx, 0x11
0x100473dc9: jmp 0x100473da1 ; 0x100473da1
0x100473dcb: nop dword ptr [rax + rax]
