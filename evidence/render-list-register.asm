0x1007b97b0: mov r9, rdi
0x1007b97b3: test rsi, rsi
0x1007b97b6: je 0x1007b9813
0x1007b97b8: mov eax, dword ptr [r9 + 0x18]
0x1007b97bc: test eax, eax
0x1007b97be: je 0x1007b97df
0x1007b97c0: mov rcx, qword ptr [r9]
0x1007b97c3: xor edx, edx
0x1007b97c5: nop word ptr cs:[rax + rax]
0x1007b97d0: mov edi, edx
0x1007b97d2: cmp qword ptr [rcx + rdi*8], 0
0x1007b97d7: je 0x1007b980f
0x1007b97d9: inc edx
0x1007b97db: cmp edx, eax
0x1007b97dd: jb 0x1007b97d0
0x1007b97df: push rbp
0x1007b97e0: mov rbp, rsp
0x1007b97e3: add r9, 0x20
0x1007b97e7: lea rdi, [rip + 0x3ea0df] ; 0x100ba38cd allocated
0x1007b97ee: lea rsi, [rip + 0x3ea0a9] ; 0x100ba389e RenderList.cpp
0x1007b97f5: lea r8, [rip + 0x3ea0db] ; 0x100ba38d7 RenderList "%s" exceeded maximum capacity
0x1007b97fc: mov edx, 0x5a
0x1007b9801: mov ecx, 4
0x1007b9806: xor eax, eax
0x1007b9808: call 0x1007e6030 ; 0x1007e6030
0x1007b980d: ud2 
0x1007b980f: mov qword ptr [rcx + rdi*8], rsi
0x1007b9813: ret 
0x1007b9814: nop word ptr cs:[rax + rax]

