0x10078c950: push rbp
0x10078c951: mov rbp, rsp
0x10078c954: vmovaps xmm0, xmmword ptr [rsi]
0x10078c958: vmovaps xmm1, xmmword ptr [rdi]
0x10078c95c: vsubps xmm0, xmm0, xmm1
0x10078c960: vmulps xmm0, xmm0, xmmword ptr [rip + 0x31ad08] ; 0x100aa7670
0x10078c968: vaddps xmm1, xmm1, xmm0
0x10078c96c: vxorps xmm2, xmm2, xmm2
0x10078c970: vblendps xmm3, xmm2, xmm0, 1
0x10078c976: vblendps xmm4, xmm2, xmm0, 2
0x10078c97c: vblendps xmm0, xmm2, xmm0, 4
0x10078c982: vinsertps xmm2, xmm1, dword ptr [rip + 0x318734], 0x30 ; 0x100aa50c0
0x10078c98c: vblendps xmm1, xmm2, xmm1, 6
0x10078c992: vmovaps xmmword ptr [rdx], xmm3
0x10078c996: vmovaps xmmword ptr [rdx + 0x10], xmm4
0x10078c99b: vmovaps xmmword ptr [rdx + 0x20], xmm0
0x10078c9a0: vmovaps xmmword ptr [rdx + 0x30], xmm1
0x10078c9a5: pop rbp
0x10078c9a6: ret 
0x10078c9a7: nop word ptr [rax + rax]
