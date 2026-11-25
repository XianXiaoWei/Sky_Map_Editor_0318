0x10060bf20: mov eax, dword ptr [rdi + 0x1d010]
0x10060bf26: cmp rax, 0x100
0x10060bf2c: jae 0x10060bf44
0x10060bf2e: lea ecx, [rax + 1]
0x10060bf31: mov dword ptr [rdi + 0x1d010], ecx
0x10060bf37: imul rax, rax, 0x1d0
0x10060bf3e: lea rax, [rdi + rax + 0x10]
0x10060bf43: ret 
0x10060bf44: push rbp
0x10060bf45: mov rbp, rsp
0x10060bf48: lea rdi, [rip + 0x58aee3] ; 0x100b96e32 m_numEmitters < kMaxSoundEmitters
0x10060bf4f: lea rsi, [rip + 0x58ada5] ; 0x100b96cfb SoundEmitter.cpp
0x10060bf56: mov edx, 0x360
0x10060bf5b: mov ecx, 3
0x10060bf60: call 0x1007e5f70 ; 0x1007e5f70
0x10060bf65: ud2 
0x10060bf67: nop word ptr [rax + rax]
