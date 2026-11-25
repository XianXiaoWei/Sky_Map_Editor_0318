0x10032f170: push rbp
0x10032f171: mov rbp, rsp
0x10032f174: cmp dword ptr [rdi + 0x28], 1
0x10032f178: jne 0x10032f186
0x10032f17a: mov al, byte ptr [rdi + 0x2e]
0x10032f17d: cmp al, 0xff
0x10032f17f: je 0x10032f1a5
0x10032f181: movzx eax, al
0x10032f184: pop rbp
0x10032f185: ret 
0x10032f186: lea rdi, [rip + 0x851fc8] ; 0x100b81155 m_persistence == Event::kTrigger
0x10032f18d: lea rsi, [rip + 0x851fb7] ; 0x100b8114b Event.cpp
0x10032f194: mov edx, 0x5f
0x10032f199: mov ecx, 3
0x10032f19e: call 0x1007e5f70 ; 0x1007e5f70
0x10032f1a3: ud2 
0x10032f1a5: lea rdi, [rip + 0x851fca] ; 0x100b81176 m_typeIdx != (EventTypeIdx)~0
0x10032f1ac: lea rsi, [rip + 0x851f98] ; 0x100b8114b Event.cpp
0x10032f1b3: mov edx, 0x60
0x10032f1b8: mov ecx, 3
0x10032f1bd: call 0x1007e5f70 ; 0x1007e5f70
0x10032f1c2: ud2 
0x10032f1c4: nop word ptr cs:[rax + rax]
