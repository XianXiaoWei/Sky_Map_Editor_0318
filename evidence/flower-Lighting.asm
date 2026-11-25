0x1007766d0: mov r9, qword ptr [rdi + 0x190]
0x1007766d7: cmp dword ptr [r9 + 0x44], esi
0x1007766db: jbe 0x100776754
0x1007766dd: mov rax, qword ptr [rdi + 0x1a8]
0x1007766e4: test rax, rax
0x1007766e7: je 0x100776751
0x1007766e9: mov r10, qword ptr [r9 + 0x20]
0x1007766ed: add r10, qword ptr [r9 + 0x30]
0x1007766f1: add rax, qword ptr [rdi + 0x198]
0x1007766f8: lea edi, [rsi + rsi*2]
0x1007766fb: mov edi, dword ptr [r10 + rdi*4]
0x1007766ff: shl edi, 2
0x100776702: lea r9d, [rdi + rdi*2]
0x100776706: mov edi, dword ptr [rax + r9 + 8]
0x10077670b: mov dword ptr [rdx + 8], edi
0x10077670e: mov rdi, qword ptr [rax + r9]
0x100776712: mov qword ptr [rdx], rdi
0x100776715: lea edx, [rsi + rsi*2 + 1]
0x100776719: mov edx, dword ptr [r10 + rdx*4]
0x10077671d: shl edx, 2
0x100776720: lea edx, [rdx + rdx*2]
0x100776723: mov edi, dword ptr [rax + rdx + 8]
0x100776727: mov dword ptr [rcx + 8], edi
0x10077672a: mov rdx, qword ptr [rax + rdx]
0x10077672e: mov qword ptr [rcx], rdx
0x100776731: lea ecx, [rsi + rsi*2 + 2]
0x100776735: mov ecx, dword ptr [r10 + rcx*4]
0x100776739: shl ecx, 2
0x10077673c: lea ecx, [rcx + rcx*2]
0x10077673f: mov rdx, qword ptr [rax + rcx]
0x100776743: mov qword ptr [r8], rdx
0x100776746: mov eax, dword ptr [rax + rcx + 8]
0x10077674a: mov dword ptr [r8 + 8], eax
0x10077674e: mov al, 1
0x100776750: ret 
0x100776751: xor eax, eax
0x100776753: ret 
0x100776754: push rbp
0x100776755: mov rbp, rsp
0x100776758: lea rdi, [rip + 0x427d9e] ; 0x100b9e4fd triIdx < m_geo->m_triCount
0x10077675f: lea rsi, [rip + 0x427be9] ; 0x100b9e34f CollisionGeo.cpp
0x100776766: mov edx, 0x71d
0x10077676b: mov ecx, 3
0x100776770: call 0x1007e5f70 ; 0x1007e5f70
0x100776775: ud2 
0x100776777: nop word ptr [rax + rax]
