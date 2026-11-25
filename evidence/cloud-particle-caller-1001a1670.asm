0x1001a1670: push rbp
0x1001a1671: mov rbp, rsp
0x1001a1674: push r15
0x1001a1676: push r14
0x1001a1678: push r12
0x1001a167a: push rbx
0x1001a167b: sub rsp, 0x80
0x1001a1682: mov r14, r8
0x1001a1685: mov r15, rdx
0x1001a1688: mov rbx, rsi
0x1001a168b: mov r12, rdi
0x1001a168e: mov rax, qword ptr [rip + 0xa6c243] ; 0x100c0d8d8
0x1001a1695: mov rax, qword ptr [rax]
0x1001a1698: mov qword ptr [rbp - 0x28], rax
0x1001a169c: vmulss xmm0, xmm0, dword ptr [rip + 0x90c2a0] ; 0x100aad944
0x1001a16a4: vmovss dword ptr [rbp - 0x64], xmm0
0x1001a16a9: vmulss xmm0, xmm0, dword ptr [rip + 0x908dcb] ; 0x100aaa47c
0x1001a16b1: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001a16b9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a16be: vcvtsi2ss xmm0, xmm1, eax
0x1001a16c2: vmulss xmm0, xmm0, dword ptr [rip + 0x905a26] ; 0x100aa70f0
0x1001a16ca: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a16cf: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a16d4: vcvtsi2ss xmm0, xmm1, eax
0x1001a16d8: vmulss xmm0, xmm0, dword ptr [rip + 0x905a10] ; 0x100aa70f0
0x1001a16e0: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1001a16e8: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a16ed: vcvtsi2ss xmm0, xmm1, eax
0x1001a16f1: vmulss xmm0, xmm0, dword ptr [rip + 0x9059f7] ; 0x100aa70f0
0x1001a16f9: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1001a16fe: vinsertps xmm1, xmm1, dword ptr [rbp - 0xa0], 0x10
0x1001a1708: vinsertps xmm0, xmm1, xmm0, 0x20
0x1001a170e: vmulps xmm0, xmm0, xmmword ptr [rip + 0x90683a] ; 0x100aa7f50
0x1001a1716: vaddps xmm2, xmm0, xmmword ptr [rip + 0x9061c2] ; 0x100aa78e0
0x1001a171e: vmulps xmm0, xmm2, xmm2
0x1001a1722: vmovshdup xmm1, xmm0
0x1001a1726: vaddss xmm1, xmm0, xmm1
0x1001a172a: vpermilpd xmm0, xmm0, 1
0x1001a1730: vaddss xmm0, xmm0, xmm1
0x1001a1734: vsqrtss xmm0, xmm0, xmm0
0x1001a1738: vucomiss xmm0, dword ptr [rip + 0x906184] ; 0x100aa78c4
0x1001a1740: jbe 0x1001a174c
0x1001a1742: vpermilps xmm0, xmm0, 0xc0
0x1001a1748: vdivps xmm2, xmm2, xmm0
0x1001a174c: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x1001a1751: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a1756: vcvtsi2ss xmm0, xmm3, eax
0x1001a175a: vmulss xmm0, xmm0, dword ptr [rip + 0x90598e] ; 0x100aa70f0
0x1001a1762: vmovss xmm1, dword ptr [rip + 0x903956] ; 0x100aa50c0
0x1001a176a: vsubss xmm1, xmm1, xmm0
0x1001a176e: vmulss xmm1, xmm1, dword ptr [rip + 0x906e3e] ; 0x100aa85b4
0x1001a1776: vmulss xmm0, xmm0, dword ptr [rip + 0x90614e] ; 0x100aa78cc
0x1001a177e: vaddss xmm0, xmm0, xmm1
0x1001a1782: vpermilps xmm0, xmm0, 0xc0
0x1001a1788: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1001a178d: vpermilps xmm1, xmmword ptr [rbp - 0x90], 0xc0
0x1001a1797: vmulps xmm0, xmm1, xmm0
0x1001a179b: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x1001a179f: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a17a4: vmovaps xmm0, xmmword ptr [r15]
0x1001a17a9: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001a17ae: vmovss xmm0, dword ptr [r12]
0x1001a17b4: vmovss dword ptr [rbp - 0x90], xmm0
0x1001a17bc: vmovss xmm1, dword ptr [rip + 0x906028] ; 0x100aa77ec
0x1001a17c4: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x1001a17c9: vxorps xmm1, xmm1, xmm1
0x1001a17cd: vmovss xmm3, dword ptr [rbp - 0x90]
0x1001a17d5: vmaxss xmm1, xmm1, xmm3
0x1001a17d9: vmovss xmm2, dword ptr [rip + 0x9038df] ; 0x100aa50c0
0x1001a17e1: vminss xmm1, xmm2, xmm1
0x1001a17e5: vsubss xmm2, xmm2, xmm1
0x1001a17e9: vmulss xmm0, xmm0, xmm2
0x1001a17ed: vmulss xmm1, xmm3, xmm1
0x1001a17f1: vaddss xmm0, xmm1, xmm0
0x1001a17f5: vmulss xmm0, xmm0, dword ptr [rip + 0x902dbb] ; 0x100aa45b8
0x1001a17fd: vmovss dword ptr [rbp - 0x3c], xmm0
0x1001a1802: vmovss xmm0, dword ptr [rbp - 0x64]
0x1001a1807: vmovss dword ptr [rbp - 0x40], xmm0
0x1001a180c: lea rsi, [rbp - 0x60]
0x1001a1810: mov rdi, r14
0x1001a1813: call 0x100228a30 ; 0x100228a30
0x1001a1818: mov rax, qword ptr [rip + 0xa6c0b9] ; 0x100c0d8d8
0x1001a181f: mov rax, qword ptr [rax]
0x1001a1822: cmp rax, qword ptr [rbp - 0x28]
0x1001a1826: jne 0x1001a1838
0x1001a1828: add rsp, 0x80
0x1001a182f: pop rbx
0x1001a1830: pop r12
0x1001a1832: pop r14
0x1001a1834: pop r15
0x1001a1836: pop rbp
0x1001a1837: ret 
0x1001a1838: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001a183d: nop dword ptr [rax]
