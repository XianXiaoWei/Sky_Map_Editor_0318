0x1003fff20: push rbp
0x1003fff21: mov rbp, rsp
0x1003fff24: push r14
0x1003fff26: push rbx
0x1003fff27: sub rsp, 0x10
0x1003fff2b: vmovss dword ptr [rbp - 0x14], xmm0
0x1003fff30: mov r14, rcx
0x1003fff33: mov rbx, rdi
0x1003fff36: mov ecx, 1
0x1003fff3b: call 0x100400c80 ; 0x100400c80
0x1003fff40: vmovss xmm2, dword ptr [rax + 0x74]
0x1003fff45: vmovss xmm0, dword ptr [rip + 0x6a5173] ; 0x100aa50c0
0x1003fff4d: vxorps xmm1, xmm1, xmm1
0x1003fff51: vucomiss xmm2, xmm1
0x1003fff55: vmovaps xmm1, xmm0
0x1003fff59: jbe 0x1003fff64
0x1003fff5b: vmovss xmm1, dword ptr [rax + 0x70]
0x1003fff60: vdivss xmm1, xmm1, xmm2
0x1003fff64: vsubss xmm0, xmm0, xmm1
0x1003fff68: vpermilps xmm0, xmm0, 0
0x1003fff6e: vmulps xmm0, xmm0, xmmword ptr [rax + 0x60]
0x1003fff73: vpermilps xmm1, xmm1, 0
0x1003fff79: vmulps xmm1, xmm1, xmmword ptr [rax + 0x30]
0x1003fff7e: vaddps xmm0, xmm1, xmm0
0x1003fff82: vmovaps xmmword ptr [rax + 0x60], xmm0
0x1003fff87: vmovaps xmm0, xmmword ptr [r14]
0x1003fff8c: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1003fff91: mov dword ptr [rax + 0x70], 0
0x1003fff98: vmovss xmm0, dword ptr [rbp - 0x14]
0x1003fff9d: vmovss dword ptr [rax + 0x74], xmm0
0x1003fffa2: mov byte ptr [rax + 0x78], 1
0x1003fffa6: mov byte ptr [rbx + 0xa32], 1
0x1003fffad: add rsp, 0x10
0x1003fffb1: pop rbx
0x1003fffb2: pop r14
0x1003fffb4: pop rbp
0x1003fffb5: ret 
0x1003fffb6: nop word ptr cs:[rax + rax]
