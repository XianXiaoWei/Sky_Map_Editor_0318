0x100776640: push rbp
0x100776641: mov rbp, rsp
0x100776644: mov rax, qword ptr [rdi + 0x190]
0x10077664b: test rax, rax
0x10077664e: je 0x100776692
0x100776650: cmp dword ptr [rax + 0x44], esi
0x100776653: jbe 0x1007766b1
0x100776655: mov r8, qword ptr [rdi + 0x1b8]
0x10077665c: test r8, r8
0x10077665f: je 0x10077668e
0x100776661: add r8, qword ptr [rdi + 0x198]
0x100776668: mov r9, qword ptr [rax + 0x20]
0x10077666c: add r9, qword ptr [rax + 0x30]
0x100776670: lea eax, [rsi + rsi*2]
0x100776673: mov eax, dword ptr [r9 + rax*4]
0x100776677: imul eax, dword ptr [rdi + 0x1c4]
0x10077667e: mov al, byte ptr [rax + r8]
0x100776682: mov byte ptr [rdx], al
0x100776684: mov dword ptr [rcx], 0x3f800000
0x10077668a: mov al, 1
0x10077668c: pop rbp
0x10077668d: ret 
0x10077668e: xor eax, eax
0x100776690: pop rbp
0x100776691: ret 
0x100776692: lea rdi, [rip + 0x427e5e] ; 0x100b9e4f7 m_geo
0x100776699: lea rsi, [rip + 0x427caf] ; 0x100b9e34f CollisionGeo.cpp
0x1007766a0: mov edx, 0x70a
0x1007766a5: mov ecx, 3
0x1007766aa: call 0x1007e5f70 ; 0x1007e5f70
0x1007766af: ud2 
0x1007766b1: lea rdi, [rip + 0x427e45] ; 0x100b9e4fd triIdx < m_geo->m_triCount
0x1007766b8: lea rsi, [rip + 0x427c90] ; 0x100b9e34f CollisionGeo.cpp
0x1007766bf: mov edx, 0x70b
0x1007766c4: mov ecx, 3
0x1007766c9: call 0x1007e5f70 ; 0x1007e5f70
0x1007766ce: ud2 
