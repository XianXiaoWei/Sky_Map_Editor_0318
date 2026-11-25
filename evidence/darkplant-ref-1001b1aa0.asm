0x1001b1aa0: cmp esi, 0x100
0x1001b1aa6: jae 0x1001b1ac6
0x1001b1aa8: mov eax, esi
0x1001b1aaa: lea rcx, [rax + rax*8]
0x1001b1aae: shl rcx, 5
0x1001b1ab2: lea rdx, [rdi + rcx + 0x10]
0x1001b1ab7: xor eax, eax
0x1001b1ab9: cmp byte ptr [rdi + rcx + 0xb1], 0
0x1001b1ac1: cmovne rax, rdx
0x1001b1ac5: ret 
0x1001b1ac6: push rbp
0x1001b1ac7: mov rbp, rsp
0x1001b1aca: lea rdi, [rip + 0x9c6517] ; 0x100b77fe8 idx < kMaxBlazes
0x1001b1ad1: lea rsi, [rip + 0x9c63b3] ; 0x100b77e8b Blaze.cpp
0x1001b1ad8: mov edx, 0x403
0x1001b1add: mov ecx, 3
0x1001b1ae2: call 0x1007e5f70 ; 0x1007e5f70
0x1001b1ae7: ud2 
0x1001b1ae9: nop dword ptr [rax]
