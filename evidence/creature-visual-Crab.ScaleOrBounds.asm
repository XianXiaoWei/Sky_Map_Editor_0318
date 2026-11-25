0x10025e740: push rbp
0x10025e741: mov rbp, rsp
0x10025e744: push rbx
0x10025e745: sub rsp, 0x88
0x10025e74c: mov rbx, rdi
0x10025e74f: vmovaps xmm0, xmmword ptr [rsi + 0x4f0]
0x10025e757: vxorps xmm1, xmm1, xmm1
0x10025e75b: vblendps xmm2, xmm1, xmm0, 1
0x10025e761: vblendps xmm3, xmm1, xmm0, 2
0x10025e767: vblendps xmm0, xmm1, xmm0, 4
0x10025e76d: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x10025e775: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x10025e77a: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10025e77f: vmovaps xmm0, xmmword ptr [rip + 0x84a279] ; 0x100aa8a00
0x10025e787: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10025e78c: mov rax, qword ptr [rsi + 0x4e0]
0x10025e793: vmovaps xmm0, xmmword ptr [rax + 0x120]
0x10025e79b: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10025e7a0: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x10025e7a8: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025e7ad: vmovaps xmm0, xmmword ptr [rax + 0x140]
0x10025e7b5: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10025e7ba: vmovaps xmm0, xmmword ptr [rax + 0x150]
0x10025e7c2: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x10025e7c7: lea rsi, [rbp - 0x90]
0x10025e7ce: lea rdx, [rbp - 0x50]
0x10025e7d2: call 0x100076df0 ; 0x100076df0
0x10025e7d7: mov rax, rbx
0x10025e7da: add rsp, 0x88
0x10025e7e1: pop rbx
0x10025e7e2: pop rbp
0x10025e7e3: ret 
0x10025e7e4: nop word ptr cs:[rax + rax]
