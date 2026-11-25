0x10031b220: push rbp
0x10031b221: mov rbp, rsp
0x10031b224: sub rsp, 0x10
0x10031b228: mov qword ptr [rbp - 8], rsi
0x10031b22c: cmp byte ptr [rdi + 0x2e264], 0
0x10031b233: je 0x10031b25e
0x10031b235: mov eax, dword ptr [rdi + 0x90]
0x10031b23b: cmp rax, 8
0x10031b23f: jae 0x10031b293
0x10031b241: mov qword ptr [rdi + rax*8 + 0x10], rsi
0x10031b246: mov qword ptr [rdi + rax*8 + 0x50], 0
0x10031b24f: lea eax, [rax + 1]
0x10031b252: mov dword ptr [rdi + 0x90], eax
0x10031b258: add rsp, 0x10
0x10031b25c: pop rbp
0x10031b25d: ret 
0x10031b25e: lea rdi, [rbp - 8]
0x10031b262: call 0x10031b2c0 ; 0x10031b2c0
0x10031b267: mov r9, qword ptr [rax + 8]
0x10031b26b: lea rdi, [rip + 0x8657d3] ; 0x100b80a45 m_registrationOpen
0x10031b272: lea rsi, [rip + 0x865753] ; 0x100b809cc Environment.cpp
0x10031b279: lea r8, [rip + 0x8657d8] ; 0x100b80a58 Trying to register %s at an illegal time. Registration can only happen between Initialize and the first call to OnLevelLoad
0x10031b280: mov edx, 0x158
0x10031b285: mov ecx, 4
0x10031b28a: xor eax, eax
0x10031b28c: call 0x1007e6030 ; 0x1007e6030
0x10031b291: ud2 
0x10031b293: lea rdi, [rip + 0x86583a] ; 0x100b80ad4 m_varCount < kMaxVars
0x10031b29a: lea rsi, [rip + 0x86572b] ; 0x100b809cc Environment.cpp
0x10031b2a1: mov edx, 0x159
0x10031b2a6: mov ecx, 3
0x10031b2ab: call 0x1007e5f70 ; 0x1007e5f70
0x10031b2b0: ud2 
0x10031b2b2: nop word ptr cs:[rax + rax]
