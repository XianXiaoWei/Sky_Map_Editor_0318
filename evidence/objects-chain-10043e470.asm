0x10043e470: push rbp
0x10043e471: mov rbp, rsp
0x10043e474: vmovss xmm0, dword ptr [rip + 0x66613c] ; 0x100aa45b8
0x10043e47c: vmovaps xmmword ptr [rdi], xmm0
0x10043e480: vmovaps xmm0, xmmword ptr [rip + 0x669468] ; 0x100aa78f0
0x10043e488: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x10043e48d: vmovaps xmm0, xmmword ptr [rip + 0x67414b] ; 0x100ab25e0
0x10043e495: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10043e49a: vmovaps xmm0, xmmword ptr [rip + 0x66a55e] ; 0x100aa8a00
0x10043e4a2: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10043e4a7: mov rax, rdi
0x10043e4aa: pop rbp
0x10043e4ab: ret 
0x10043e4ac: nop dword ptr [rax]
