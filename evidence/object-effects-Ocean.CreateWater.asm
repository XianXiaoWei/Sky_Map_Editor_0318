0x1004d5eb0: mov eax, dword ptr [rdi + 0x13c8]
0x1004d5eb6: cmp rax, 8
0x1004d5eba: jae 0x1004d5ed5
0x1004d5ebc: lea ecx, [rax + 1]
0x1004d5ebf: mov dword ptr [rdi + 0x13c8], ecx
0x1004d5ec5: imul rax, rax, 0x5d0
0x1004d5ecc: lea rax, [rdi + rax + 0x13d0]
0x1004d5ed4: ret 
0x1004d5ed5: push rbp
0x1004d5ed6: mov rbp, rsp
0x1004d5ed9: lea rdi, [rip + 0x6b838f] ; 0x100b8e26f m_waterCount < kMaxWaters
0x1004d5ee0: lea rsi, [rip + 0x6b81ff] ; 0x100b8e0e6 Ocean.cpp
0x1004d5ee7: mov edx, 0x2e7
0x1004d5eec: mov ecx, 3
0x1004d5ef1: call 0x1007e5f70 ; 0x1007e5f70
0x1004d5ef6: ud2 
0x1004d5ef8: nop dword ptr [rax + rax]
