0x10073e250: push rbp
0x10073e251: mov rbp, rsp
0x10073e254: cmp byte ptr [rdi + 0x114], 0
0x10073e25b: je 0x10073e270
0x10073e25d: vmovss xmm0, dword ptr [rip + 0x36a407] ; 0x100aa866c
0x10073e265: cmp byte ptr [rdi + 0x11c], 0
0x10073e26c: jne 0x10073e2b5
0x10073e26e: jmp 0x10073e2bd ; 0x10073e2bd
0x10073e270: vmovss xmm0, dword ptr [rdi + 0x2c4]
0x10073e278: vmulss xmm0, xmm0, dword ptr [rip + 0x36d5c0] ; 0x100aab840
0x10073e280: vxorps xmm1, xmm1, xmm1
0x10073e284: vmaxss xmm0, xmm1, xmm0
0x10073e288: vmovss xmm1, dword ptr [rip + 0x366e30] ; 0x100aa50c0
0x10073e290: vminss xmm0, xmm1, xmm0
0x10073e294: vsubss xmm1, xmm1, xmm0
0x10073e298: vmulss xmm1, xmm1, dword ptr [rip + 0x369550] ; 0x100aa77f0
0x10073e2a0: vmulss xmm0, xmm0, dword ptr [rip + 0x3687fc] ; 0x100aa6aa4
0x10073e2a8: vaddss xmm0, xmm0, xmm1
0x10073e2ac: cmp byte ptr [rdi + 0x11c], 0
0x10073e2b3: je 0x10073e2bd
0x10073e2b5: vmovss xmm0, dword ptr [rip + 0x36af0b] ; 0x100aa91c8
0x10073e2bd: pop rbp
0x10073e2be: ret 
0x10073e2bf: nop 
