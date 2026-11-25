0x100148750: push rbp
0x100148751: mov rbp, rsp
0x100148754: sub rsp, 0x10
0x100148758: vmovaps xmm0, xmmword ptr [rsi]
0x10014875c: vmovaps xmmword ptr [rbp - 0x10], xmm0
0x100148761: lea rsi, [rbp - 0x10]
0x100148765: vmovss xmm0, dword ptr [rip + 0x9637eb] ; 0x100aabf58
0x10014876d: call 0x100148780 ; 0x100148780
0x100148772: add rsp, 0x10
0x100148776: pop rbp
0x100148777: ret 
0x100148778: nop dword ptr [rax + rax]

