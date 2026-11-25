0x1007f65d0: push rbp
0x1007f65d1: mov rbp, rsp
0x1007f65d4: mov r8, qword ptr [rdi]
0x1007f65d7: mov eax, dword ptr [rdi + 0x508]
0x1007f65dd: imul rax, rax, 0x38
0x1007f65e1: mov edx, dword ptr [r8 + rax + 0x250]
0x1007f65e9: test edx, edx
0x1007f65eb: je 0x1007f661c
0x1007f65ed: mov ecx, dword ptr [rdi + 0x518]
0x1007f65f3: cmp ecx, dword ptr [r8 + rax + 0x244]
0x1007f65fb: jbe 0x1007f662f
0x1007f65fd: lea rdi, [rip + 0x3b18cf] ; 0x100ba7ed3 m_indexOffset <= idxBuf.capacity
0x1007f6604: lea rsi, [rip + 0x3b14d9] ; 0x100ba7ae4 Vertex.cpp
0x1007f660b: mov edx, 0x18d
0x1007f6610: mov ecx, 3
0x1007f6615: call 0x1007e5f70 ; 0x1007e5f70
0x1007f661a: ud2 
0x1007f661c: mov ecx, dword ptr [rdi + 0x514]
0x1007f6622: cmp ecx, dword ptr [r8 + 0x13c]
0x1007f6629: ja 0x1007f674d
0x1007f662f: cmp byte ptr [rdi + 0x528], 0
0x1007f6636: je 0x1007f668b
0x1007f6638: mov r10d, dword ptr [rdi + 0x53c]
0x1007f663f: test r10d, r10d
0x1007f6642: je 0x1007f669f
0x1007f6644: mov r9d, dword ptr [r8 + rax + 0x244]
0x1007f664c: test edx, edx
0x1007f664e: je 0x1007f66b1
0x1007f6650: lea r8, [rdi + 0x540]
0x1007f6657: xor esi, esi
0x1007f6659: xor eax, eax
0x1007f665b: nop dword ptr [rax + rax]
0x1007f6660: mov esi, esi
0x1007f6662: lea rdx, [rsi + rsi*2]
0x1007f6666: mov ecx, r9d
0x1007f6669: sub ecx, dword ptr [r8 + rdx*4]
0x1007f666d: jb 0x1007f672e
0x1007f6673: mov edx, dword ptr [r8 + rdx*4 + 4]
0x1007f6678: cmp edx, ecx
0x1007f667a: cmovb ecx, edx
0x1007f667d: add eax, ecx
0x1007f667f: inc esi
0x1007f6681: cmp esi, r10d
0x1007f6684: jb 0x1007f6660
0x1007f6686: jmp 0x1007f6704 ; 0x1007f6704
0x1007f668b: test edx, edx
0x1007f668d: je 0x1007f66ec
0x1007f668f: mov eax, dword ptr [r8 + rax + 0x244]
0x1007f6697: sub eax, dword ptr [rdi + 0x518]
0x1007f669d: jmp 0x1007f66f9 ; 0x1007f66f9
0x1007f669f: xor eax, eax
0x1007f66a1: mov ecx, dword ptr [rdi + 0x524]
0x1007f66a7: cmp ecx, 1
0x1007f66aa: jne 0x1007f670f
0x1007f66ac: jmp 0x1007f672a ; 0x1007f672a
0x1007f66b1: lea rdx, [rdi + 0x544]
0x1007f66b8: xor esi, esi
0x1007f66ba: xor eax, eax
0x1007f66bc: nop dword ptr [rax]
0x1007f66c0: cmp r9d, dword ptr [rdx - 4]
0x1007f66c4: jb 0x1007f672e
0x1007f66c6: mov ecx, dword ptr [r8 + 0x13c]
0x1007f66cd: sub ecx, dword ptr [rdi + 0x514]
0x1007f66d3: mov r11d, dword ptr [rdx]
0x1007f66d6: cmp r11d, ecx
0x1007f66d9: cmovb ecx, r11d
0x1007f66dd: add eax, ecx
0x1007f66df: inc esi
0x1007f66e1: add rdx, 0xc
0x1007f66e5: cmp esi, r10d
0x1007f66e8: jb 0x1007f66c0
0x1007f66ea: jmp 0x1007f6704 ; 0x1007f6704
0x1007f66ec: mov eax, dword ptr [r8 + 0x13c]
0x1007f66f3: sub eax, dword ptr [rdi + 0x514]
0x1007f66f9: mov ecx, dword ptr [rdi + 0x50c]
0x1007f66ff: cmp ecx, eax
0x1007f6701: cmovb eax, ecx
0x1007f6704: mov ecx, dword ptr [rdi + 0x524]
0x1007f670a: cmp ecx, 1
0x1007f670d: je 0x1007f672a
0x1007f670f: cmp ecx, 5
0x1007f6712: je 0x1007f672a
0x1007f6714: cmp ecx, 4
0x1007f6717: jne 0x1007f6728
0x1007f6719: mov ecx, eax
0x1007f671b: mov eax, 0xaaaaaaab
0x1007f6720: imul rax, rcx
0x1007f6724: shr rax, 0x21
0x1007f6728: pop rbp
0x1007f6729: ret 
0x1007f672a: shr eax, 1
0x1007f672c: pop rbp
0x1007f672d: ret 
0x1007f672e: lea rdi, [rip + 0x3b17fb] ; 0x100ba7f30 chunk.idxOffset <= idxBuf.capacity
0x1007f6735: lea rsi, [rip + 0x3b13a8] ; 0x100ba7ae4 Vertex.cpp
0x1007f673c: mov edx, 0x196
0x1007f6741: mov ecx, 3
0x1007f6746: call 0x1007e5f70 ; 0x1007e5f70
0x1007f674b: ud2 
0x1007f674d: lea rdi, [rip + 0x3b17a0] ; 0x100ba7ef4 useIdxs || m_vertexOffset <= m_vertexData->m_vertexCapacity
0x1007f6754: lea rsi, [rip + 0x3b1389] ; 0x100ba7ae4 Vertex.cpp
0x1007f675b: mov edx, 0x18e
0x1007f6760: mov ecx, 3
0x1007f6765: call 0x1007e5f70 ; 0x1007e5f70
0x1007f676a: ud2 
0x1007f676c: nop dword ptr [rax]

