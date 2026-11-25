0x1002da1e0: push rbp
0x1002da1e1: mov rbp, rsp
0x1002da1e4: vxorps xmm0, xmm0, xmm0
0x1002da1e8: vmovaps xmmword ptr [rdi + 0xd0], xmm0
0x1002da1f0: movabs rax, 0x3f8000003f800000
0x1002da1fa: mov qword ptr [rdi + 0x170], rax
0x1002da201: vmovaps ymm1, ymmword ptr [rip + 0x7df397] ; 0x100ab95a0
0x1002da209: vmovups ymmword ptr [rdi + 0x80], ymm1
0x1002da211: mov word ptr [rdi + 0x188], 0
0x1002da21a: vmovaps xmmword ptr [rdi + 0x160], xmm0
0x1002da222: mov qword ptr [rdi + 0x78], 0
0x1002da22a: mov qword ptr [rdi + 0x190], 0
0x1002da235: mov byte ptr [rdi + 0xae], 0
0x1002da23c: mov qword ptr [rdi + 0x178], rax
0x1002da243: vmovaps xmmword ptr [rdi + 0xe0], xmm0
0x1002da24b: vmovaps xmm1, xmmword ptr [rip + 0x7cde4d] ; 0x100aa80a0
0x1002da253: vmovaps xmmword ptr [rdi + 0xf0], xmm1
0x1002da25b: mov byte ptr [rdi + 0x100], 0
0x1002da262: lea rcx, [rip + 0x1d65447] ; 0x10203f6b0
0x1002da269: vmovaps xmm1, xmmword ptr [rcx]
0x1002da26d: vmovaps xmmword ptr [rdi + 0x110], xmm1
0x1002da275: vmovaps xmmword ptr [rdi + 0x120], xmm1
0x1002da27d: mov qword ptr [rdi + 0x180], rax
0x1002da284: mov qword ptr [rdi + 0xa4], 0x3f800000
0x1002da28f: vmovaps xmmword ptr [rdi + 0x50], xmm0
0x1002da294: mov qword ptr [rdi + 0x1d4], 0
0x1002da29f: mov dword ptr [rdi + 0x1dc], 0
0x1002da2a9: mov byte ptr [rdi + 0xb1], 0
0x1002da2b0: mov byte ptr [rdi + 0xad], 0
0x1002da2b7: vxorps ymm1, ymm1, ymm1
0x1002da2bb: vmovups ymmword ptr [rdi + 0x198], ymm1
0x1002da2c3: vmovaps xmmword ptr [rdi + 0xc0], xmm0
0x1002da2cb: vmovaps xmm1, xmmword ptr [rip + 0x7d05ed] ; 0x100aaa8c0
0x1002da2d3: vmovaps xmmword ptr [rdi + 0x40], xmm1
0x1002da2d8: mov word ptr [rdi + 0xaf], 0
0x1002da2e1: vmovups xmmword ptr [rdi + 0x1e4], xmm0
0x1002da2e9: pop rbp
0x1002da2ea: vzeroupper 
0x1002da2ed: ret 
0x1002da2ee: nop 
