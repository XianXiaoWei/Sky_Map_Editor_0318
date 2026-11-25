0x1007f53c0: push rbp
0x1007f53c1: mov rbp, rsp
0x1007f53c4: push r14
0x1007f53c6: push rbx
0x1007f53c7: mov r14d, edx
0x1007f53ca: mov rbx, rdi
0x1007f53cd: cmp byte ptr [rbx + 0x3f8], 1
0x1007f53d4: je 0x1007f53fc
0x1007f53d6: lea rdi, [rbx + 0x418]
0x1007f53dd: mov edx, 0x1b
0x1007f53e2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007f53e7: mov word ptr [rbx + 0x432], 0x100
0x1007f53f0: mov dword ptr [rbx + 0x13c], r14d
0x1007f53f7: pop rbx
0x1007f53f8: pop r14
0x1007f53fa: pop rbp
0x1007f53fb: ret 
0x1007f53fc: lea rdi, [rip + 0x3b26cd] ; 0x100ba7ad0 m_complete == false
0x1007f5403: lea rsi, [rip + 0x3b26da] ; 0x100ba7ae4 Vertex.cpp
0x1007f540a: lea r8, [rip + 0x3b26de] ; 0x100ba7aef VertexData must be Release()'d before it can be redefined
0x1007f5411: mov edx, 0x31
0x1007f5416: mov ecx, 4
0x1007f541b: xor eax, eax
0x1007f541d: call 0x1007e6030 ; 0x1007e6030
0x1007f5422: ud2 
0x1007f5424: nop word ptr cs:[rax + rax]
