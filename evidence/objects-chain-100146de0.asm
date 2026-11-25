0x100146de0: push rbp
0x100146de1: mov rbp, rsp
0x100146de4: mov byte ptr [rdi + 0xbc8], 0
0x100146deb: mov qword ptr [rdi], 0
0x100146df2: mov byte ptr [rdi + 0xc60], 0
0x100146df9: vmovaps xmm1, xmmword ptr [rsi]
0x100146dfd: vmovaps xmmword ptr [rdi + 0x130], xmm1
0x100146e05: vmovss xmm0, dword ptr [rdi + 0xe4]
0x100146e0d: lea rax, [rip + 0x97aa48] ; 0x100ac185c
0x100146e14: vmulss xmm0, xmm0, dword ptr [rax]
0x100146e18: vxorps xmm0, xmm0, xmmword ptr [rip + 0x960ae0] ; 0x100aa7900
0x100146e20: lea rax, [rip + 0x1ebd3c9] ; 0x1020041f0
0x100146e27: vpermilps xmm0, xmm0, 0xc0
0x100146e2d: vmulps xmm3, xmm0, xmmword ptr [rax]
0x100146e31: vsubps xmm0, xmm1, xmm3
0x100146e35: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100146e3a: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x100146e3f: vxorps xmm2, xmm2, xmm2
0x100146e43: vmovaps xmmword ptr [rdi + 0x50], xmm2
0x100146e48: test dl, dl
0x100146e4a: je 0x100146e91
0x100146e4c: vmovshdup xmm0, xmm1
0x100146e50: vaddss xmm0, xmm0, dword ptr [rip + 0x961758] ; 0x100aa85b0
0x100146e58: vmovss dword ptr [rdi + 0x134], xmm0
0x100146e60: vmovaps xmm0, xmmword ptr [rdi + 0x130]
0x100146e68: vsubps xmm0, xmm0, xmm3
0x100146e6c: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100146e71: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x100146e76: mov qword ptr [rdi + 0xbaa], 0
0x100146e81: mov qword ptr [rdi + 0xba4], 0
0x100146e8c: vmovaps xmmword ptr [rdi + 0x50], xmm2
0x100146e91: mov dword ptr [rdi + 0xc70], 0
0x100146e9b: mov byte ptr [rdi + 0x120], 1
0x100146ea2: vmovaps xmmword ptr [rdi + 0xc80], xmm0
0x100146eaa: pop rbp
0x100146eab: ret 
0x100146eac: nop dword ptr [rax]
