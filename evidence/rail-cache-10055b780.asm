0x10055b780: push rbp
0x10055b781: mov rbp, rsp
0x10055b784: mov rax, qword ptr [rdi + 0xa8]
0x10055b78b: test rax, rax
0x10055b78e: je 0x10055b79e
0x10055b790: cmp dword ptr [rdi + 0x28], esi
0x10055b793: jbe 0x10055b7bd
0x10055b795: mov ecx, esi
0x10055b797: vmovss dword ptr [rax + rcx*4], xmm0
0x10055b79c: pop rbp
0x10055b79d: ret 
0x10055b79e: lea rdi, [rip + 0x636057] ; 0x100b917fc pHeights
0x10055b7a5: lea rsi, [rip + 0x635f80] ; 0x100b9172c Rail.cpp
0x10055b7ac: mov edx, 0x34c
0x10055b7b1: mov ecx, 3
0x10055b7b6: call 0x1007e5f70 ; 0x1007e5f70
0x10055b7bb: ud2 
0x10055b7bd: lea rdi, [rip + 0x636020] ; 0x100b917e4 ind < numPoints
0x10055b7c4: lea rsi, [rip + 0x635f61] ; 0x100b9172c Rail.cpp
0x10055b7cb: mov edx, 0x34d
0x10055b7d0: mov ecx, 3
0x10055b7d5: call 0x1007e5f70 ; 0x1007e5f70
0x10055b7da: ud2 
0x10055b7dc: nop dword ptr [rax]
