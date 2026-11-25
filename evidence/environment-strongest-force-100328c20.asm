0x100328c20: push rbp
0x100328c21: mov rbp, rsp
0x100328c24: push r15
0x100328c26: push r14
0x100328c28: push r13
0x100328c2a: push r12
0x100328c2c: push rbx
0x100328c2d: sub rsp, 0x18
0x100328c31: mov r15, rdx
0x100328c34: mov r13, rsi
0x100328c37: mov r14, rdi
0x100328c3a: vxorps xmm0, xmm0, xmm0
0x100328c3e: vmovlps qword ptr [r14], xmm0
0x100328c43: mov dword ptr [r14 + 8], 0
0x100328c4b: vxorps xmm0, xmm0, xmm0
0x100328c4f: vmovss dword ptr [rbp - 0x2c], xmm0
0x100328c54: mov ebx, 0xc0
0x100328c59: lea r12, [rbp - 0x40]
0x100328c5d: nop dword ptr [rax]
0x100328c60: cmp byte ptr [r13 + rbx + 0x5c], 0
0x100328c66: je 0x100328cab
0x100328c68: lea rsi, [r13 + rbx]
0x100328c6d: mov rax, qword ptr [r13 + rbx]
0x100328c72: mov rdi, r12
0x100328c75: mov rdx, r15
0x100328c78: call qword ptr [rax + 0x18]
0x100328c7b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100328c80: vmulps xmm1, xmm0, xmm0
0x100328c84: vmovshdup xmm2, xmm1
0x100328c88: vaddss xmm2, xmm1, xmm2
0x100328c8c: vpermilpd xmm1, xmm1, 1
0x100328c92: vaddss xmm1, xmm1, xmm2
0x100328c96: vsqrtss xmm1, xmm1, xmm1
0x100328c9a: vucomiss xmm1, dword ptr [rbp - 0x2c]
0x100328c9f: jbe 0x100328cab
0x100328ca1: vmovaps xmmword ptr [r14], xmm0
0x100328ca6: vmovss dword ptr [rbp - 0x2c], xmm1
0x100328cab: cmp byte ptr [r13 + rbx + 0x245c], 0
0x100328cb4: je 0x100328cff
0x100328cb6: lea rsi, [r13 + rbx + 0x2400]
0x100328cbe: mov rax, qword ptr [r13 + rbx + 0x2400]
0x100328cc6: mov rdi, r12
0x100328cc9: mov rdx, r15
0x100328ccc: call qword ptr [rax + 0x18]
0x100328ccf: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100328cd4: vmulps xmm1, xmm0, xmm0
0x100328cd8: vmovshdup xmm2, xmm1
0x100328cdc: vaddss xmm2, xmm1, xmm2
0x100328ce0: vpermilpd xmm1, xmm1, 1
0x100328ce6: vaddss xmm1, xmm1, xmm2
0x100328cea: vsqrtss xmm1, xmm1, xmm1
0x100328cee: vucomiss xmm1, dword ptr [rbp - 0x2c]
0x100328cf3: jbe 0x100328cff
0x100328cf5: vmovaps xmmword ptr [r14], xmm0
0x100328cfa: vmovss dword ptr [rbp - 0x2c], xmm1
0x100328cff: add rbx, 0x120
0x100328d06: cmp rbx, 0x24c0
0x100328d0d: jne 0x100328c60
0x100328d13: mov rax, r14
0x100328d16: add rsp, 0x18
0x100328d1a: pop rbx
0x100328d1b: pop r12
0x100328d1d: pop r13
0x100328d1f: pop r14
0x100328d21: pop r15
0x100328d23: pop rbp
0x100328d24: ret 
0x100328d25: nop word ptr cs:[rax + rax]
