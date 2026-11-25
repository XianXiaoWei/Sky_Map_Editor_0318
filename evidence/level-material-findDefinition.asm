0x1004434f0: mov eax, dword ptr [rdi + rsi*4 + 0x30d0]
0x1004434f7: imul rax, rax, 0x1a0
0x1004434fe: cmp byte ptr [rdi + rax + 0x10], sil
0x100443503: jne 0x10044350b
0x100443505: lea rax, [rdi + rax + 0x10]
0x10044350a: ret 
0x10044350b: push rbp
0x10044350c: mov rbp, rsp
0x10044350f: movzx r9d, sil
0x100443513: lea rdi, [rip + 0x74582a] ; 0x100b88d44 m_defs[ index ].material == material
0x10044351a: lea rsi, [rip + 0x745848] ; 0x100b88d69 MaterialDefs.cpp
0x100443521: lea r8, [rip + 0x745852] ; 0x100b88d7a MaterialDef for "%u" not found.
0x100443528: mov edx, 0x56
0x10044352d: mov ecx, 4
0x100443532: xor eax, eax
0x100443534: call 0x1007e6030 ; 0x1007e6030
0x100443539: ud2 
0x10044353b: nop dword ptr [rax + rax]
