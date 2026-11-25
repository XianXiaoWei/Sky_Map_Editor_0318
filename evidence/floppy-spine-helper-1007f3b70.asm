0x1007f3b70: push rbp
0x1007f3b71: mov rbp, rsp
0x1007f3b74: push r14
0x1007f3b76: push rbx
0x1007f3b77: mov rbx, rsi
0x1007f3b7a: mov r14, rdi
0x1007f3b7d: mov rdi, rbx
0x1007f3b80: call 0x1007f2c20 ; 0x1007f2c20
0x1007f3b85: vmovaps xmm0, xmmword ptr [rbx + 0x90]
0x1007f3b8d: vmulps xmm1, xmm0, xmm0
0x1007f3b91: vmovshdup xmm2, xmm1
0x1007f3b95: vaddss xmm2, xmm1, xmm2
0x1007f3b99: vpermilpd xmm1, xmm1, 1
0x1007f3b9f: vaddss xmm1, xmm1, xmm2
0x1007f3ba3: vsqrtss xmm1, xmm1, xmm1
0x1007f3ba7: vucomiss xmm1, dword ptr [rip + 0x2b3d15] ; 0x100aa78c4
0x1007f3baf: jbe 0x1007f3bbb
0x1007f3bb1: vpermilps xmm1, xmm1, 0xc0
0x1007f3bb7: vdivps xmm0, xmm0, xmm1
0x1007f3bbb: vmovaps xmmword ptr [r14], xmm0
0x1007f3bc0: mov rax, r14
0x1007f3bc3: pop rbx
0x1007f3bc4: pop r14
0x1007f3bc6: pop rbp
0x1007f3bc7: ret 
0x1007f3bc8: nop dword ptr [rax + rax]
