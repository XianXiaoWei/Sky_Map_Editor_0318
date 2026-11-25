0x100560300: push rbp
0x100560301: mov rbp, rsp
0x100560304: mov rax, qword ptr [rsi + 0x90]
0x10056030b: test rax, rax
0x10056030e: je 0x100560329
0x100560310: cmp dword ptr [rsi + 0x28], edx
0x100560313: jbe 0x100560348
0x100560315: mov ecx, edx
0x100560317: shl rcx, 4
0x10056031b: vmovaps xmm0, xmmword ptr [rax + rcx]
0x100560320: vmovaps xmmword ptr [rdi], xmm0
0x100560324: mov rax, rdi
0x100560327: pop rbp
0x100560328: ret 
0x100560329: lea rdi, [rip + 0x6314ac] ; 0x100b917dc pPoints
0x100560330: lea rsi, [rip + 0x6313f5] ; 0x100b9172c Rail.cpp
0x100560337: mov edx, 0x364
0x10056033c: mov ecx, 3
0x100560341: call 0x1007e5f70 ; 0x1007e5f70
0x100560346: ud2 
0x100560348: lea rdi, [rip + 0x631495] ; 0x100b917e4 ind < numPoints
0x10056034f: lea rsi, [rip + 0x6313d6] ; 0x100b9172c Rail.cpp
0x100560356: mov edx, 0x365
0x10056035b: mov ecx, 3
0x100560360: call 0x1007e5f70 ; 0x1007e5f70
0x100560365: ud2 
0x100560367: nop word ptr [rax + rax]
