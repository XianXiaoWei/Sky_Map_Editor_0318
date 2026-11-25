0x10073aa90: push rbp
0x10073aa91: mov rbp, rsp
0x10073aa94: push r14
0x10073aa96: push rbx
0x10073aa97: mov r14, rsi
0x10073aa9a: mov rbx, rdi
0x10073aa9d: mov byte ptr [rbx + 0x350], 0
0x10073aaa4: lea rax, [rip + 0x386d91] ; 0x100ac183c
0x10073aaab: vbroadcastss xmm0, dword ptr [rax]
0x10073aab0: vmovddup xmm1, qword ptr [rip + 0x36ce20] ; 0x100aa78d8
0x10073aab8: vmulps xmm0, xmm0, xmm1
0x10073aabc: vmovaps xmmword ptr [rbx + 0x270], xmm0
0x10073aac4: vxorps xmm0, xmm0, xmm0
0x10073aac8: vmovaps xmmword ptr [rbx + 0x280], xmm0
0x10073aad0: mov dword ptr [rbx + 0x184], 0x41700000
0x10073aada: vmovapd xmmword ptr [rbx + 0x3d0], xmm1
0x10073aae2: mov dword ptr [rbx + 0x2bc], 0
0x10073aaec: vmovaps xmm1, xmmword ptr [rip + 0x39f7ec] ; 0x100ada2e0
0x10073aaf4: vmovups xmmword ptr [rbx + 0x2ac], xmm1
0x10073aafc: mov qword ptr [rbx + 0x2a0], 0x3e99999a
0x10073ab07: mov qword ptr [rbx + 0x190], 0
0x10073ab12: vmovaps xmm1, xmmword ptr [rip + 0x39f7d6] ; 0x100ada2f0
0x10073ab1a: vmovups xmmword ptr [rbx + 0x2c4], xmm1
0x10073ab22: vmovaps xmmword ptr [rbx + 0x360], xmm0
0x10073ab2a: mov qword ptr [rbx + 0x370], 0
0x10073ab35: mov dword ptr [rbx + 0x384], 0
0x10073ab3f: vmovaps xmmword ptr [rbx + 0x1b0], xmm0
0x10073ab47: mov dword ptr [rbx + 0x1c0], 0
0x10073ab51: mov dword ptr [rbx + 0x1d0], 0x3f800000
0x10073ab5b: mov rdi, qword ptr [r14 + 0x280]
0x10073ab62: call 0x1000fe060 ; 0x1000fe060
0x10073ab67: test al, al
0x10073ab69: je 0x10073ab7a
0x10073ab6b: mov rdi, rbx
0x10073ab6e: mov rsi, r14
0x10073ab71: pop rbx
0x10073ab72: pop r14
0x10073ab74: pop rbp
0x10073ab75: jmp 0x10073ab80 ; 0x10073ab80
0x10073ab7a: pop rbx
0x10073ab7b: pop r14
0x10073ab7d: pop rbp
0x10073ab7e: ret 
0x10073ab7f: nop 
