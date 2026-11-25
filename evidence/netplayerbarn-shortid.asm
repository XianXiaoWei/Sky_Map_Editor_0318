0x1004aa260: push rbp
0x1004aa261: mov rbp, rsp
0x1004aa264: mov ecx, dword ptr [rsi]
0x1004aa266: test ecx, ecx
0x1004aa268: je 0x1004aa29c
0x1004aa26a: mov edx, dword ptr [rdi + 0x7d10]
0x1004aa270: xor eax, eax
0x1004aa272: test edx, edx
0x1004aa274: je 0x1004aa297
0x1004aa276: nop word ptr cs:[rax + rax]
0x1004aa280: mov esi, eax
0x1004aa282: imul rsi, rsi, 0xfa0
0x1004aa289: cmp dword ptr [rdi + rsi + 0x10], ecx
0x1004aa28d: je 0x1004aa2a3
0x1004aa28f: inc eax
0x1004aa291: cmp eax, edx
0x1004aa293: jb 0x1004aa280
0x1004aa295: xor eax, eax
0x1004aa297: movzx eax, al
0x1004aa29a: pop rbp
0x1004aa29b: ret 
0x1004aa29c: xor eax, eax
0x1004aa29e: movzx eax, al
0x1004aa2a1: pop rbp
0x1004aa2a2: ret 
0x1004aa2a3: mov al, byte ptr [rdi + rsi + 0x14]
0x1004aa2a7: movzx eax, al
0x1004aa2aa: pop rbp
0x1004aa2ab: ret 
0x1004aa2ac: nop dword ptr [rax]
