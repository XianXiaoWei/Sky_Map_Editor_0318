0x10045f880: mov qword ptr [rdi], rsi
0x10045f883: mov dword ptr [rdi + 0x10], ecx
0x10045f886: test ecx, ecx
0x10045f888: js 0x10045f9db
0x10045f88e: cmp dword ptr [rsi + 0x40], ecx
0x10045f891: jle 0x10045f9db
0x10045f897: mov qword ptr [rdi + 8], rdx
0x10045f89b: mov rax, qword ptr [rsi + 0x48]
0x10045f89f: movsxd rcx, ecx
0x10045f8a2: imul rcx, rcx, 0xb8
0x10045f8a9: vmovsd xmm0, qword ptr [rax + rcx + 4]
0x10045f8af: vmovsd xmm1, qword ptr [rax + rcx + 0x10]
0x10045f8b5: vinsertps xmm0, xmm0, dword ptr [rax + rcx + 0xc], 0x20
0x10045f8bd: vinsertps xmm1, xmm1, dword ptr [rax + rcx + 0x18], 0x20
0x10045f8c5: vsubps xmm2, xmm1, xmm0
0x10045f8c9: vmovaps xmm3, xmmword ptr [rip + 0x647d9f] ; 0x100aa7670
0x10045f8d1: vmulps xmm0, xmm0, xmm3
0x10045f8d5: vmulps xmm1, xmm1, xmm3
0x10045f8d9: vaddps xmm0, xmm0, xmm1
0x10045f8dd: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10045f8e2: vmulps xmm1, xmm2, xmm2
0x10045f8e6: vmovshdup xmm3, xmm1
0x10045f8ea: vaddss xmm3, xmm1, xmm3
0x10045f8ee: vpermilpd xmm1, xmm1, 1
0x10045f8f4: vaddss xmm1, xmm1, xmm3
0x10045f8f8: vsqrtss xmm1, xmm1, xmm1
0x10045f8fc: vmulss xmm1, xmm1, dword ptr [rip + 0x644cb4] ; 0x100aa45b8
0x10045f904: vmovss dword ptr [rdi + 0x18], xmm1
0x10045f909: vmovss xmm1, dword ptr [rip + 0x6457af] ; 0x100aa50c0
0x10045f911: vinsertps xmm0, xmm0, xmm1, 0x30
0x10045f917: vmovaps xmm3, xmmword ptr [rip + 0x649d81] ; 0x100aa96a0
0x10045f91f: vdivps xmm2, xmm2, xmm3
0x10045f923: vpermilps xmm4, xmm2, 0
0x10045f929: vmulps xmm4, xmm4, xmm1
0x10045f92d: vpermilps xmm5, xmm2, 0x55
0x10045f933: vmovaps xmm6, xmmword ptr [rip + 0x648765] ; 0x100aa80a0
0x10045f93b: vmulps xmm5, xmm5, xmm6
0x10045f93f: vpermilps xmm2, xmm2, 0xaa
0x10045f945: vmovaps xmm7, xmmword ptr [rip + 0x6490e3] ; 0x100aa8a30
0x10045f94d: vmulps xmm2, xmm2, xmm7
0x10045f951: vmovaps xmmword ptr [rdi + 0x30], xmm4
0x10045f956: vmovaps xmmword ptr [rdi + 0x40], xmm5
0x10045f95b: vmovaps xmmword ptr [rdi + 0x50], xmm2
0x10045f960: vmovaps xmmword ptr [rdi + 0x60], xmm0
0x10045f965: vmovss xmm0, dword ptr [rax + rcx + 0x24]
0x10045f96b: vmovsd xmm2, qword ptr [rax + rcx + 0x1c]
0x10045f971: vinsertps xmm0, xmm2, xmm0, 0x20
0x10045f977: vmovsd xmm2, qword ptr [rax + rcx + 0x28]
0x10045f97d: vinsertps xmm2, xmm2, dword ptr [rax + rcx + 0x30], 0x20
0x10045f985: vaddps xmm4, xmm0, xmm2
0x10045f989: vdivps xmm4, xmm4, xmm3
0x10045f98d: vsubps xmm0, xmm2, xmm0
0x10045f991: vdivps xmm0, xmm0, xmm3
0x10045f995: vinsertps xmm2, xmm4, xmm1, 0x30
0x10045f99b: vpermilps xmm3, xmm0, 0
0x10045f9a1: vmulps xmm1, xmm3, xmm1
0x10045f9a5: vpermilps xmm3, xmm0, 0x55
0x10045f9ab: vmulps xmm3, xmm3, xmm6
0x10045f9af: vpermilps xmm0, xmm0, 0xaa
0x10045f9b5: vmulps xmm0, xmm0, xmm7
0x10045f9b9: vmovaps xmmword ptr [rdi + 0x70], xmm1
0x10045f9be: vmovaps xmmword ptr [rdi + 0x80], xmm3
0x10045f9c6: vmovaps xmmword ptr [rdi + 0x90], xmm0
0x10045f9ce: vmovaps xmmword ptr [rdi + 0xa0], xmm2
0x10045f9d6: mov byte ptr [rdi + 0x14], 1
0x10045f9da: ret 
0x10045f9db: push rbp
0x10045f9dc: mov rbp, rsp
0x10045f9df: lea rdi, [rip + 0x729e32] ; 0x100b89818 m_lodIndex >= 0 && m_lodIndex < m_data->lodCount
0x10045f9e6: lea rsi, [rip + 0x729e5c] ; 0x100b89849 MeshInstance.cpp
0x10045f9ed: mov edx, 0x3c
0x10045f9f2: mov ecx, 3
0x10045f9f7: call 0x1007e5f70 ; 0x1007e5f70
0x10045f9fc: ud2 
0x10045f9fe: nop 
