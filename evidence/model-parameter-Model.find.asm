0x1004666a0: push rbp
0x1004666a1: mov rbp, rsp
0x1004666a4: mov eax, esi
0x1004666a6: mov rax, qword ptr [rdi + rax*8 + 0x28]
0x1004666ab: test rax, rax
0x1004666ae: je 0x1004666d1
0x1004666b0: mov rdi, qword ptr [rax]
0x1004666b3: test rdi, rdi
0x1004666b6: je 0x1004666d1
0x1004666b8: cmp byte ptr [rdi + 0x538], 0
0x1004666bf: je 0x1004666f0
0x1004666c1: add rdi, 0x270
0x1004666c8: mov rsi, rdx
0x1004666cb: pop rbp
0x1004666cc: jmp 0x1007bdb60 ; 0x1007bdb60
0x1004666d1: lea rdi, [rip + 0x723565] ; 0x100b89c3d m_renders[ pass ] && m_renders[ pass ][ 0 ]
0x1004666d8: lea rsi, [rip + 0x7232b2] ; 0x100b89991 Model.cpp
0x1004666df: mov edx, 0x13f
0x1004666e4: mov ecx, 3
0x1004666e9: call 0x1007e5f70 ; 0x1007e5f70
0x1004666ee: ud2 
0x1004666f0: lea rdi, [rip + 0x7105f3] ; 0x100b76cea IsInitialized()
0x1004666f7: lea rsi, [rip + 0x6fbb7d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004666fe: mov edx, 0xa8
0x100466703: mov ecx, 3
0x100466708: call 0x1007e5f70 ; 0x1007e5f70
0x10046670d: ud2 
0x10046670f: nop 
