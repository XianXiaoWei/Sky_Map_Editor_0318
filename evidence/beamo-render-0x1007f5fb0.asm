0x1007f5fb0: push rbp
0x1007f5fb1: mov rbp, rsp
0x1007f5fb4: push r15
0x1007f5fb6: push r14
0x1007f5fb8: push r12
0x1007f5fba: push rbx
0x1007f5fbb: mov r14, r8
0x1007f5fbe: mov r15, rcx
0x1007f5fc1: mov rbx, rdi
0x1007f5fc4: cmp byte ptr [rbx + 0x538], 1
0x1007f5fcb: je 0x1007f60ca
0x1007f5fd1: cmp byte ptr [rsi + 0x3f8], 0
0x1007f5fd8: je 0x1007f60e9
0x1007f5fde: cmp qword ptr [rbx], 0
0x1007f5fe2: jne 0x1007f6105
0x1007f5fe8: cmp dword ptr [r15 + 8], 0
0x1007f5fed: je 0x1007f6121
0x1007f5ff3: mov qword ptr [rbx], rsi
0x1007f5ff6: mov qword ptr [rbx + 0x4f8], rdx
0x1007f5ffd: mov word ptr [rbx + 0x529], 1
0x1007f6006: mov dword ptr [rbx + 0x51c], r9d
0x1007f600d: mov eax, dword ptr [rdx]
0x1007f600f: lea r12, [rbx + 0x94]
0x1007f6016: mov dword ptr [rbx + 0x94], eax
0x1007f601c: lea rdi, [rbx + 0x98]
0x1007f6023: mov edx, 0x134
0x1007f6028: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007f602d: vmovups ymm0, ymmword ptr [r15]
0x1007f6032: vmovups ymmword ptr [rbx + 0x1cc], ymm0
0x1007f603a: vmovups ymm0, ymmword ptr [r14]
0x1007f603f: vmovups ymm1, ymmword ptr [r14 + 0x20]
0x1007f6045: vmovups ymm2, ymmword ptr [r14 + 0x40]
0x1007f604b: vmovups ymm3, ymmword ptr [r14 + 0x60]
0x1007f6051: vmovups ymmword ptr [rbx + 0x20c], ymm1
0x1007f6059: vmovups ymmword ptr [rbx + 0x22c], ymm2
0x1007f6061: vmovups ymmword ptr [rbx + 0x24c], ymm3
0x1007f6069: vmovups ymmword ptr [rbx + 0x1ec], ymm0
0x1007f6071: vzeroupper 
0x1007f6074: call 0x1007c1470 ; 0x1007c1470
0x1007f6079: mov rcx, qword ptr [rax]
0x1007f607c: mov rdi, rax
0x1007f607f: mov rsi, r12
0x1007f6082: call qword ptr [rcx + 0xa8]
0x1007f6088: mov dword ptr [rbx + 0x90], eax
0x1007f608e: lea r14, [rbx + 0x270]
0x1007f6095: mov rdi, r14
0x1007f6098: mov esi, eax
0x1007f609a: call 0x1007bfd80 ; 0x1007bfd80
0x1007f609f: mov esi, 0x148
0x1007f60a4: add rsi, qword ptr [rbx]
0x1007f60a7: mov ecx, dword ptr [rbx + 0x514]
0x1007f60ad: mov edx, 6
0x1007f60b2: mov rdi, r14
0x1007f60b5: call 0x1007bdfd0 ; 0x1007bdfd0
0x1007f60ba: mov byte ptr [rbx + 0x538], 1
0x1007f60c1: pop rbx
0x1007f60c2: pop r12
0x1007f60c4: pop r14
0x1007f60c6: pop r15
0x1007f60c8: pop rbp
0x1007f60c9: ret 
0x1007f60ca: lea rdi, [rip + 0x3b1b9c] ; 0x100ba7c6d !m_isInitialized
0x1007f60d1: lea rsi, [rip + 0x3b1a0c] ; 0x100ba7ae4 Vertex.cpp
0x1007f60d8: mov edx, 0xe1
0x1007f60dd: mov ecx, 3
0x1007f60e2: call 0x1007e5f70 ; 0x1007e5f70
0x1007f60e7: ud2 
0x1007f60e9: lea rdi, [rip + 0x3b1be4] ; 0x100ba7cd4 data->m_complete
0x1007f60f0: lea rsi, [rip + 0x3b19ed] ; 0x100ba7ae4 Vertex.cpp
0x1007f60f7: lea r8, [rip + 0x3b1be7] ; 0x100ba7ce5 Can't register incomplete VertexData
0x1007f60fe: mov edx, 0xe2
0x1007f6103: jmp 0x1007f613b ; 0x1007f613b
0x1007f6105: lea rdi, [rip + 0x3b1bfe] ; 0x100ba7d0a !m_vertexData
0x1007f610c: lea rsi, [rip + 0x3b19d1] ; 0x100ba7ae4 Vertex.cpp
0x1007f6113: lea r8, [rip + 0x3b1bfe] ; 0x100ba7d18 VertexRender already has a VertexData
0x1007f611a: mov edx, 0xe3
0x1007f611f: jmp 0x1007f613b ; 0x1007f613b
0x1007f6121: lea rdi, [rip + 0x3b1c16] ; 0x100ba7d3e renderFormat->color[0] != TexelFormat_Undefined
0x1007f6128: lea rsi, [rip + 0x3b19b5] ; 0x100ba7ae4 Vertex.cpp
0x1007f612f: lea r8, [rip + 0x3b1c38] ; 0x100ba7d6e VertexRender must have a valid render format
0x1007f6136: mov edx, 0xe4
0x1007f613b: mov ecx, 4
0x1007f6140: xor eax, eax
0x1007f6142: call 0x1007e6030 ; 0x1007e6030
0x1007f6147: ud2 
0x1007f6149: nop dword ptr [rax]

