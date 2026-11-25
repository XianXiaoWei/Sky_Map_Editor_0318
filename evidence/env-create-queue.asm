0x100319d40: mov eax, dword ptr [rdi + 0x2e260]
0x100319d46: cmp rax, 0x10
0x100319d4a: jae 0x100319d65
0x100319d4c: lea ecx, [rax + 1]
0x100319d4f: mov dword ptr [rdi + 0x2e260], ecx
0x100319d55: imul rax, rax, 0x410
0x100319d5c: lea rax, [rdi + rax + 0x2a160]
0x100319d64: ret 
0x100319d65: push rbp
0x100319d66: mov rbp, rsp
0x100319d69: lea rdi, [rip + 0x866cb8] ; 0x100b80a28 m_numEnvNodes < kMaxEnvNodes
0x100319d70: lea rsi, [rip + 0x866c55] ; 0x100b809cc Environment.cpp
0x100319d77: mov edx, 0x123
0x100319d7c: mov ecx, 3
0x100319d81: call 0x1007e5f70 ; 0x1007e5f70
0x100319d86: ud2 
0x100319d88: nop dword ptr [rax + rax]
