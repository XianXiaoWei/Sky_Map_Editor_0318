0x1007f55d0: push rbp
0x1007f55d1: mov rbp, rsp
0x1007f55d4: mov rax, rdi
0x1007f55d7: cmp esi, 8
0x1007f55da: jae 0x1007f5646
0x1007f55dc: mov esi, esi
0x1007f55de: imul rsi, rsi, 0x38
0x1007f55e2: cmp dword ptr [rax + rsi + 0x250], 0
0x1007f55ea: jne 0x1007f5665
0x1007f55ec: lea rdi, [rax + rsi + 0x248]
0x1007f55f4: mov dword ptr [rax + rsi + 0x23c], edx
0x1007f55fb: mov byte ptr [rax + rsi + 0x238], 0
0x1007f5603: dec edx
0x1007f5605: xor r10d, r10d
0x1007f5608: cmp edx, 0x22
0x1007f560b: ja 0x1007f561b
0x1007f560d: movsxd r10, edx
0x1007f5610: lea rdx, [rip + 0x2ee439] ; 0x100ae3a50
0x1007f5617: mov r10d, dword ptr [rdx + r10*4]
0x1007f561b: mov dword ptr [rax + rsi + 0x240], r10d
0x1007f5623: mov dword ptr [rax + rsi + 0x244], r8d
0x1007f562b: add rax, 0x418
0x1007f5631: imul r10d, r8d
0x1007f5635: mov edx, 3
0x1007f563a: mov rsi, rax
0x1007f563d: mov r8d, r10d
0x1007f5640: pop rbp
0x1007f5641: jmp 0x100794e00 ; 0x100794e00
0x1007f5646: lea rdi, [rip + 0x394a95] ; 0x100b8a0e2 idx < kMaxIndexBuffers
0x1007f564d: lea rsi, [rip + 0x3b2490] ; 0x100ba7ae4 Vertex.cpp
0x1007f5654: mov edx, 0x58
0x1007f5659: mov ecx, 3
0x1007f565e: call 0x1007e5f70 ; 0x1007e5f70
0x1007f5663: ud2 
0x1007f5665: lea rdi, [rip + 0x3b2534] ; 0x100ba7ba0 m_indexBuffers[ idx ].mb.GetUsage() == Bind_None
0x1007f566c: lea rsi, [rip + 0x3b2471] ; 0x100ba7ae4 Vertex.cpp
0x1007f5673: mov edx, 0x59
0x1007f5678: mov ecx, 3
0x1007f567d: call 0x1007e5f70 ; 0x1007e5f70
0x1007f5682: ud2 
0x1007f5684: nop word ptr cs:[rax + rax]
