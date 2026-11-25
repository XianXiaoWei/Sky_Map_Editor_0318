0x1007950a0: mov eax, dword ptr [rdi + 0x14]
0x1007950a3: cmp eax, dword ptr [rdi + 0x18]
0x1007950a6: jae 0x1007950ad
0x1007950a8: mov eax, dword ptr [rdi + rax*4 + 0x1c]
0x1007950ac: ret 
0x1007950ad: push rbp
0x1007950ae: mov rbp, rsp
0x1007950b1: lea rdi, [rip + 0x40c035] ; 0x100ba10ed m_readIdx < m_idCount
0x1007950b8: lea rsi, [rip + 0x40bfec] ; 0x100ba10ab GpuBuffer.cpp
0x1007950bf: mov edx, 0x5a
0x1007950c4: mov ecx, 3
0x1007950c9: call 0x1007e5f70 ; 0x1007e5f70
0x1007950ce: ud2 

