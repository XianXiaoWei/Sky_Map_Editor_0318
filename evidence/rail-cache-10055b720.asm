0x10055b720: push rbp
0x10055b721: mov rbp, rsp
0x10055b724: mov rax, qword ptr [rdi + 0xa0]
0x10055b72b: test rax, rax
0x10055b72e: je 0x10055b73e
0x10055b730: cmp dword ptr [rdi + 0x28], esi
0x10055b733: jbe 0x10055b75d
0x10055b735: mov ecx, esi
0x10055b737: vmovss dword ptr [rax + rcx*4], xmm0
0x10055b73c: pop rbp
0x10055b73d: ret 
0x10055b73e: lea rdi, [rip + 0x6360af] ; 0x100b917f4 pWidths
0x10055b745: lea rsi, [rip + 0x635fe0] ; 0x100b9172c Rail.cpp
0x10055b74c: mov edx, 0x344
0x10055b751: mov ecx, 3
0x10055b756: call 0x1007e5f70 ; 0x1007e5f70
0x10055b75b: ud2 
0x10055b75d: lea rdi, [rip + 0x636080] ; 0x100b917e4 ind < numPoints
0x10055b764: lea rsi, [rip + 0x635fc1] ; 0x100b9172c Rail.cpp
0x10055b76b: mov edx, 0x345
0x10055b770: mov ecx, 3
0x10055b775: call 0x1007e5f70 ; 0x1007e5f70
0x10055b77a: ud2 
0x10055b77c: nop dword ptr [rax]
