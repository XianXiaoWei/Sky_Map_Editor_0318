0x1007b9990: cmp byte ptr [rsi + 0x538], 0
0x1007b9997: je 0x1007b99ab
0x1007b9999: mov rax, qword ptr [rdi + 0x10]
0x1007b999d: mov ecx, dword ptr [rdi + 8]
0x1007b99a0: lea edx, [rcx + 1]
0x1007b99a3: mov dword ptr [rdi + 8], edx
0x1007b99a6: mov qword ptr [rax + rcx*8], rsi
0x1007b99aa: ret 
0x1007b99ab: push rbp
0x1007b99ac: mov rbp, rsp
0x1007b99af: lea rdi, [rip + 0x3e9f4b] ; 0x100ba3901 vertexRender->IsInitialized()
0x1007b99b6: lea rsi, [rip + 0x3e9ee1] ; 0x100ba389e RenderList.cpp
0x1007b99bd: mov edx, 0x6d
0x1007b99c2: mov ecx, 3
0x1007b99c7: call 0x1007e5f70 ; 0x1007e5f70
0x1007b99cc: ud2 
0x1007b99ce: nop 

