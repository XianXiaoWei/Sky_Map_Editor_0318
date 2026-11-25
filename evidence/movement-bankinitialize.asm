0x100192520: push rbp
0x100192521: mov rbp, rsp
0x100192524: vxorps xmm0, xmm0, xmm0
0x100192528: vmovaps xmmword ptr [rdi], xmm0
0x10019252c: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100192531: vmovaps xmm0, xmmword ptr [rip + 0x9153e7] ; 0x100aa7920
0x100192539: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10019253e: mov dword ptr [rdi + 0x30], 0
0x100192545: pop rbp
0x100192546: ret 
0x100192547: nop word ptr [rax + rax]
