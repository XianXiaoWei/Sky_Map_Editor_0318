0x10026d0f0: push rbp
0x10026d0f1: mov rbp, rsp
0x10026d0f4: push r14
0x10026d0f6: push rbx
0x10026d0f7: sub rsp, 0x40
0x10026d0fb: mov rbx, rdi
0x10026d0fe: mov byte ptr [rbx + 0x2c5], sil
0x10026d105: mov rax, qword ptr [rbx + 0x50]
0x10026d109: test sil, sil
0x10026d10c: je 0x10026d11e
0x10026d10e: mov r14, qword ptr [rax + 0x18]
0x10026d112: mov dword ptr [rbx + 0x17c], 0
0x10026d11c: jmp 0x10026d12c ; 0x10026d12c
0x10026d11e: mov r14, qword ptr [rax + 0x10]
0x10026d122: mov dword ptr [rbx + 0x1a0], 0
0x10026d12c: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x10026d131: vaddps xmm0, xmm0, xmmword ptr [rbx + 0xa0]
0x10026d139: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10026d13e: lea rsi, [rbp - 0x30]
0x10026d142: lea rdx, [rbp - 0x50]
0x10026d146: mov rdi, r14
0x10026d149: call 0x10055d820 ; 0x10055d820
0x10026d14e: vmovss xmm1, dword ptr [rip + 0x837f6a] ; 0x100aa50c0
0x10026d156: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10026d15b: vmovss dword ptr [rbx + 0x2d4], xmm0
0x10026d163: mov rax, qword ptr [rbx + 0x50]
0x10026d167: cmp byte ptr [rax + 5], 0
0x10026d16b: je 0x10026d289
0x10026d171: vaddss xmm1, xmm0, dword ptr [rip + 0x83a66f] ; 0x100aa77e8
0x10026d179: vaddss xmm0, xmm0, dword ptr [rip + 0x83a64f] ; 0x100aa77d0
0x10026d181: vmovss dword ptr [rbp - 0x14], xmm0
0x10026d186: lea rdi, [rbp - 0x30]
0x10026d18a: mov rsi, r14
0x10026d18d: vmovaps xmm0, xmm1
0x10026d191: call 0x10055e420 ; 0x10055e420
0x10026d196: lea rdi, [rbp - 0x40]
0x10026d19a: mov rsi, r14
0x10026d19d: vmovss xmm0, dword ptr [rbp - 0x14]
0x10026d1a2: call 0x10055e420 ; 0x10055e420
0x10026d1a7: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10026d1ac: vmovaps xmm1, xmmword ptr [rbx + 0x60]
0x10026d1b1: vsubps xmm0, xmm0, xmm1
0x10026d1b5: vmulps xmm2, xmm0, xmm0
0x10026d1b9: vmovshdup xmm3, xmm2
0x10026d1bd: vaddss xmm3, xmm2, xmm3
0x10026d1c1: vpermilpd xmm2, xmm2, 1
0x10026d1c7: vaddss xmm2, xmm2, xmm3
0x10026d1cb: vsqrtss xmm2, xmm2, xmm2
0x10026d1cf: vucomiss xmm2, dword ptr [rip + 0x83a6ed] ; 0x100aa78c4
0x10026d1d7: jbe 0x10026d1e3
0x10026d1d9: vpermilps xmm2, xmm2, 0xc0
0x10026d1df: vdivps xmm0, xmm0, xmm2
0x10026d1e3: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x10026d1e8: vsubps xmm1, xmm2, xmm1
0x10026d1ec: vmulps xmm2, xmm1, xmm1
0x10026d1f0: vmovshdup xmm3, xmm2
0x10026d1f4: vaddss xmm3, xmm2, xmm3
0x10026d1f8: vpermilpd xmm2, xmm2, 1
0x10026d1fe: vaddss xmm2, xmm2, xmm3
0x10026d202: vsqrtss xmm2, xmm2, xmm2
0x10026d206: vucomiss xmm2, dword ptr [rip + 0x83a6b6] ; 0x100aa78c4
0x10026d20e: jbe 0x10026d21a
0x10026d210: vpermilps xmm2, xmm2, 0xc0
0x10026d216: vdivps xmm1, xmm1, xmm2
0x10026d21a: vmovaps xmm2, xmmword ptr [rbx + 0xa0]
0x10026d222: vmulps xmm3, xmm2, xmm2
0x10026d226: vmovshdup xmm4, xmm3
0x10026d22a: vaddss xmm4, xmm3, xmm4
0x10026d22e: vpermilpd xmm3, xmm3, 1
0x10026d234: vaddss xmm3, xmm3, xmm4
0x10026d238: vsqrtss xmm3, xmm3, xmm3
0x10026d23c: vucomiss xmm3, dword ptr [rip + 0x83a680] ; 0x100aa78c4
0x10026d244: jbe 0x10026d250
0x10026d246: vpermilps xmm3, xmm3, 0xc0
0x10026d24c: vdivps xmm2, xmm2, xmm3
0x10026d250: vmulps xmm0, xmm0, xmm2
0x10026d254: vmovshdup xmm3, xmm0
0x10026d258: vaddss xmm3, xmm0, xmm3
0x10026d25c: vpermilpd xmm0, xmm0, 1
0x10026d262: vaddss xmm0, xmm0, xmm3
0x10026d266: vmulps xmm1, xmm1, xmm2
0x10026d26a: vmovshdup xmm2, xmm1
0x10026d26e: vaddss xmm2, xmm1, xmm2
0x10026d272: vpermilpd xmm1, xmm1, 1
0x10026d278: vaddss xmm1, xmm1, xmm2
0x10026d27c: vucomiss xmm0, xmm1
0x10026d280: seta byte ptr [rbx + 0x2c6]
0x10026d287: jmp 0x10026d290 ; 0x10026d290
0x10026d289: mov byte ptr [rbx + 0x2c6], 1
0x10026d290: add rsp, 0x40
0x10026d294: pop rbx
0x10026d295: pop r14
0x10026d297: pop rbp
0x10026d298: ret 
0x10026d299: nop dword ptr [rax]
