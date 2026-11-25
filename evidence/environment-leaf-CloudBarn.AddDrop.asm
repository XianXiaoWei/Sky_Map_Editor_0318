0x100416140: push rbp
0x100416141: mov rbp, rsp
0x100416144: mov ecx, dword ptr [rdi + 0x6010]
0x10041614a: xor eax, eax
0x10041614c: cmp rcx, 0x1ff
0x100416153: ja 0x1004161fb
0x100416159: vmovss xmm3, dword ptr [rip + 0x695def] ; 0x100aabf50
0x100416161: vucomiss xmm3, xmm0
0x100416165: jae 0x1004161fb
0x10041616b: vucomiss xmm3, xmm1
0x10041616f: jae 0x1004161fb
0x100416175: vmovaps xmm4, xmmword ptr [rsi]
0x100416179: vmulps xmm4, xmm4, xmmword ptr [rip + 0x6a671f] ; 0x100abc8a0
0x100416181: vmovshdup xmm5, xmm4
0x100416185: vaddss xmm5, xmm4, xmm5
0x100416189: vpermilpd xmm4, xmm4, 1
0x10041618f: vaddss xmm4, xmm4, xmm5
0x100416193: vmaxss xmm5, xmm3, xmm4
0x100416197: vcmpunordss xmm4, xmm4, xmm4
0x10041619c: vandnps xmm5, xmm4, xmm5
0x1004161a0: vandps xmm4, xmm4, xmm3
0x1004161a4: vorps xmm4, xmm5, xmm4
0x1004161a8: vucomiss xmm3, xmm4
0x1004161ac: jae 0x1004161fd
0x1004161ae: lea eax, [rcx + 1]
0x1004161b1: mov dword ptr [rdi + 0x6010], eax
0x1004161b7: lea rax, [rcx + rcx*2]
0x1004161bb: shl rax, 4
0x1004161bf: mov dword ptr [rdi + rax + 0x38], 0
0x1004161c7: vmovaps xmm3, xmmword ptr [rdx]
0x1004161cb: vinsertps xmm0, xmm3, xmm0, 0x30
0x1004161d1: vmovaps xmmword ptr [rdi + rax + 0x10], xmm0
0x1004161d7: vmovaps xmm0, xmmword ptr [rsi]
0x1004161db: vmovaps xmmword ptr [rdi + rax + 0x20], xmm0
0x1004161e1: vmovss dword ptr [rdi + rax + 0x30], xmm2
0x1004161e7: vmovss dword ptr [rdi + rax + 0x34], xmm1
0x1004161ed: mov word ptr [rdi + rax + 0x3c], 0
0x1004161f4: mov byte ptr [rdi + rax + 0x3e], 0
0x1004161f9: mov al, 1
0x1004161fb: pop rbp
0x1004161fc: ret 
0x1004161fd: xor eax, eax
0x1004161ff: pop rbp
0x100416200: ret 
0x100416201: nop word ptr cs:[rax + rax]
