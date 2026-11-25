0x10027e410: push rbp
0x10027e411: mov rbp, rsp
0x10027e414: mov eax, dword ptr [rdi + 0x104]
0x10027e41a: test eax, eax
0x10027e41c: je 0x10027e465
0x10027e41e: mov r8, qword ptr [rdi + 0x18]
0x10027e422: mov edx, dword ptr [r8 + 0x1b220]
0x10027e429: xor esi, esi
0x10027e42b: vmovss xmm0, dword ptr [rip + 0x83044d] ; 0x100aae880
0x10027e433: nop word ptr cs:[rax + rax]
0x10027e440: mov ecx, dword ptr [rdi + rsi*4 + 0xe4]
0x10027e447: cmp edx, ecx
0x10027e449: jbe 0x10027e45e
0x10027e44b: imul rcx, rcx, 0x1a0
0x10027e452: vucomiss xmm0, dword ptr [r8 + rcx + 0x12f0]
0x10027e45c: jb 0x10027e471
0x10027e45e: inc rsi
0x10027e461: cmp eax, esi
0x10027e463: ja 0x10027e440
0x10027e465: cmp byte ptr [rdi + 0xdc], 0
0x10027e46c: setne al
0x10027e46f: pop rbp
0x10027e470: ret 
0x10027e471: xor eax, eax
0x10027e473: pop rbp
0x10027e474: ret 
0x10027e475: nop word ptr cs:[rax + rax]

