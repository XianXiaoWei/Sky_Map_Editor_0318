0x10055b6b0: push rbp
0x10055b6b1: mov rbp, rsp
0x10055b6b4: mov rax, qword ptr [rdi + 0x90]
0x10055b6bb: test rax, rax
0x10055b6be: je 0x10055b6e1
0x10055b6c0: cmp dword ptr [rdi + 0x28], esi
0x10055b6c3: jbe 0x10055b700
0x10055b6c5: mov ecx, esi
0x10055b6c7: shl rcx, 4
0x10055b6cb: vmovaps xmm0, xmmword ptr [rdx]
0x10055b6cf: vmovaps xmmword ptr [rax + rcx], xmm0
0x10055b6d4: mov byte ptr [rdi + 0x1c], 1
0x10055b6d8: mov byte ptr [rdi + 0xe0], 1
0x10055b6df: pop rbp
0x10055b6e0: ret 
0x10055b6e1: lea rdi, [rip + 0x6360f4] ; 0x100b917dc pPoints
0x10055b6e8: lea rsi, [rip + 0x63603d] ; 0x100b9172c Rail.cpp
0x10055b6ef: mov edx, 0x33a
0x10055b6f4: mov ecx, 3
0x10055b6f9: call 0x1007e5f70 ; 0x1007e5f70
0x10055b6fe: ud2 
0x10055b700: lea rdi, [rip + 0x6360dd] ; 0x100b917e4 ind < numPoints
0x10055b707: lea rsi, [rip + 0x63601e] ; 0x100b9172c Rail.cpp
0x10055b70e: mov edx, 0x33b
0x10055b713: mov ecx, 3
0x10055b718: call 0x1007e5f70 ; 0x1007e5f70
0x10055b71d: ud2 
0x10055b71f: nop 
