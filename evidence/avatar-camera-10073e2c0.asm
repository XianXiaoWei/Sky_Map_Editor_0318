0x10073e2c0: push rbp
0x10073e2c1: mov rbp, rsp
0x10073e2c4: cmp byte ptr [rdi + 0x114], 0
0x10073e2cb: je 0x10073e2d7
0x10073e2cd: vmovss xmm0, dword ptr [rip + 0x366deb] ; 0x100aa50c0
0x10073e2d5: pop rbp
0x10073e2d6: ret 
0x10073e2d7: cmp byte ptr [rdi + 0x101], 0
0x10073e2de: je 0x10073e31a
0x10073e2e0: vmovss xmm0, dword ptr [rdi + 0x160]
0x10073e2e8: vaddss xmm0, xmm0, dword ptr [rip + 0x37a194] ; 0x100ab8484
0x10073e2f0: vdivss xmm0, xmm0, dword ptr [rip + 0x3694f4] ; 0x100aa77ec
0x10073e2f8: vxorps xmm1, xmm1, xmm1
0x10073e2fc: vmaxss xmm0, xmm1, xmm0
0x10073e300: vmovss xmm2, dword ptr [rip + 0x366db8] ; 0x100aa50c0
0x10073e308: vminss xmm0, xmm2, xmm0
0x10073e30c: vsubss xmm2, xmm2, xmm0
0x10073e310: vmulss xmm0, xmm0, xmm1
0x10073e314: vaddss xmm0, xmm0, xmm2
0x10073e318: pop rbp
0x10073e319: ret 
0x10073e31a: vxorps xmm0, xmm0, xmm0
0x10073e31e: pop rbp
0x10073e31f: ret 
