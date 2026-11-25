0x10055b7e0: push rbp
0x10055b7e1: mov rbp, rsp
0x10055b7e4: mov rax, qword ptr [rdi + 0xb8]
0x10055b7eb: test rax, rax
0x10055b7ee: je 0x10055b7fe
0x10055b7f0: cmp dword ptr [rdi + 0x28], esi
0x10055b7f3: jbe 0x10055b81d
0x10055b7f5: mov ecx, esi
0x10055b7f7: vmovss dword ptr [rax + rcx*4], xmm0
0x10055b7fc: pop rbp
0x10055b7fd: ret 
0x10055b7fe: lea rdi, [rip + 0x636008] ; 0x100b9180d pRolls
0x10055b805: lea rsi, [rip + 0x635f20] ; 0x100b9172c Rail.cpp
0x10055b80c: mov edx, 0x35c
0x10055b811: mov ecx, 3
0x10055b816: call 0x1007e5f70 ; 0x1007e5f70
0x10055b81b: ud2 
0x10055b81d: lea rdi, [rip + 0x635fc0] ; 0x100b917e4 ind < numPoints
0x10055b824: lea rsi, [rip + 0x635f01] ; 0x100b9172c Rail.cpp
0x10055b82b: mov edx, 0x35d
0x10055b830: mov ecx, 3
0x10055b835: call 0x1007e5f70 ; 0x1007e5f70
0x10055b83a: ud2 
0x10055b83c: nop dword ptr [rax]
