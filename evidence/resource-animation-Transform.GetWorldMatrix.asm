0x1007f26e0: push rbp
0x1007f26e1: mov rbp, rsp
0x1007f26e4: push r14
0x1007f26e6: push rbx
0x1007f26e7: mov rbx, rsi
0x1007f26ea: mov r14, rdi
0x1007f26ed: mov rdi, rbx
0x1007f26f0: call 0x1007f2c20 ; 0x1007f2c20
0x1007f26f5: vmovaps xmm0, xmmword ptr [rbx + 0x80]
0x1007f26fd: vmovaps xmmword ptr [r14], xmm0
0x1007f2702: vmovaps xmm0, xmmword ptr [rbx + 0x90]
0x1007f270a: vmovaps xmmword ptr [r14 + 0x10], xmm0
0x1007f2710: vmovaps xmm0, xmmword ptr [rbx + 0xa0]
0x1007f2718: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x1007f271e: vmovaps xmm0, xmmword ptr [rbx + 0xb0]
0x1007f2726: vmovaps xmmword ptr [r14 + 0x30], xmm0
0x1007f272c: mov rax, r14
0x1007f272f: pop rbx
0x1007f2730: pop r14
0x1007f2732: pop rbp
0x1007f2733: ret 
0x1007f2734: nop word ptr cs:[rax + rax]
