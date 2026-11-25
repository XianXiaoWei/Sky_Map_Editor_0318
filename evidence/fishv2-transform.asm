0x1003384a0: push rbp
0x1003384a1: mov rbp, rsp
0x1003384a4: push rbx
0x1003384a5: sub rsp, 0x88
0x1003384ac: mov rbx, rdi
0x1003384af: vmovaps xmm0, xmmword ptr [rsi + 0x120]
0x1003384b7: vxorps xmm1, xmm1, xmm1
0x1003384bb: vblendps xmm2, xmm1, xmm0, 1
0x1003384c1: vblendps xmm3, xmm1, xmm0, 2
0x1003384c7: vblendps xmm0, xmm1, xmm0, 4
0x1003384cd: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x1003384d5: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x1003384da: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1003384df: vmovaps xmm0, xmmword ptr [rip + 0x770519] ; 0x100aa8a00
0x1003384e7: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1003384ec: mov rax, qword ptr [rsi + 0x110]
0x1003384f3: vmovaps xmm0, xmmword ptr [rax + 0x120]
0x1003384fb: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100338500: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x100338508: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10033850d: vmovaps xmm0, xmmword ptr [rax + 0x140]
0x100338515: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10033851a: vmovaps xmm0, xmmword ptr [rax + 0x150]
0x100338522: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x100338527: lea rsi, [rbp - 0x90]
0x10033852e: lea rdx, [rbp - 0x50]
0x100338532: call 0x100076df0 ; 0x100076df0
0x100338537: mov rax, rbx
0x10033853a: add rsp, 0x88
0x100338541: pop rbx
0x100338542: pop rbp
0x100338543: ret 
0x100338544: nop word ptr cs:[rax + rax]
