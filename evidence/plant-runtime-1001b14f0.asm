0x1001b14f0: push rbp
0x1001b14f1: mov rbp, rsp
0x1001b14f4: push r15
0x1001b14f6: push r14
0x1001b14f8: push rbx
0x1001b14f9: sub rsp, 0x108
0x1001b1500: mov rbx, rsi
0x1001b1503: mov r14, rdi
0x1001b1506: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1001b150b: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001b1510: vmovaps xmm1, xmmword ptr [rbx + 0x20]
0x1001b1515: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x1001b151a: vmovaps xmm2, xmmword ptr [rbx + 0x30]
0x1001b151f: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x1001b1524: vmovaps xmm3, xmmword ptr [rbx + 0x40]
0x1001b1529: vmovaps xmmword ptr [rbp - 0x30], xmm3
0x1001b152e: cmp byte ptr [rbx + 0x98], 0
0x1001b1535: je 0x1001b157e
0x1001b1537: mov rax, qword ptr [rdx + 0x160]
0x1001b153e: lea rcx, [rip + 0x1e49b8b] ; 0x101ffb0d0
0x1001b1545: cmp byte ptr [rcx], 0
0x1001b1548: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001b1550: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x1001b1558: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x1001b1560: vmovaps xmmword ptr [rbp - 0xb0], xmm3
0x1001b1568: je 0x1001b1648
0x1001b156e: lea rcx, [rip + 0xb06fcb] ; 0x100cb8540
0x1001b1575: vmovss xmm0, dword ptr [rcx]
0x1001b1579: jmp 0x1001b1650 ; 0x1001b1650
0x1001b157e: cmp qword ptr [rbx + 0x58], 0
0x1001b1583: jne 0x1001b16df
0x1001b1589: mov rax, qword ptr [rbx + 0x70]
0x1001b158d: test rax, rax
0x1001b1590: je 0x1001b16df
0x1001b1596: cmp dword ptr [rax + 0x10], 0
0x1001b159a: je 0x1001b1995
0x1001b15a0: mov rax, qword ptr [rax + 8]
0x1001b15a4: mov rax, qword ptr [rax]
0x1001b15a7: mov qword ptr [rbp - 0x120], rax
0x1001b15ae: call 0x1007abc10 ; 0x1007abc10
0x1001b15b3: mov r15, rax
0x1001b15b6: mov qword ptr [rbp - 0xa0], 0
0x1001b15c1: call 0x1007abc10 ; 0x1007abc10
0x1001b15c6: mov r8, qword ptr [rax]
0x1001b15c9: lea rsi, [rbp - 0xa0]
0x1001b15d0: lea rdx, [rbp - 0x120]
0x1001b15d7: mov rdi, rax
0x1001b15da: mov rcx, r15
0x1001b15dd: call qword ptr [r8 + 0x40]
0x1001b15e1: mov rsi, qword ptr [rbp - 0xa0]
0x1001b15e8: test rsi, rsi
0x1001b15eb: je 0x1001b19b4
0x1001b15f1: lea rdi, [rbp - 0xa0]
0x1001b15f8: call 0x1004d1e40 ; 0x1004d1e40
0x1001b15fd: vmovaps xmm0, xmmword ptr [rbx + 0x40]
0x1001b1602: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x70]
0x1001b1607: vxorps xmm1, xmm1, xmm1
0x1001b160b: vblendps xmm0, xmm0, xmm1, 2
0x1001b1611: vmulps xmm1, xmm0, xmm0
0x1001b1615: vmovshdup xmm2, xmm1
0x1001b1619: vaddss xmm2, xmm1, xmm2
0x1001b161d: vpermilpd xmm1, xmm1, 1
0x1001b1623: vaddss xmm1, xmm1, xmm2
0x1001b1627: vsqrtss xmm1, xmm1, xmm1
0x1001b162b: vucomiss xmm1, dword ptr [rip + 0x8f6291] ; 0x100aa78c4
0x1001b1633: jbe 0x1001b1743
0x1001b1639: vpermilps xmm1, xmm1, 0xc0
0x1001b163f: vdivps xmm0, xmm0, xmm1
0x1001b1643: jmp 0x1001b174b ; 0x1001b174b
0x1001b1648: vmovss xmm0, dword ptr [rip + 0x8f3a70] ; 0x100aa50c0
0x1001b1650: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1001b1655: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1001b165a: vmovss xmm1, dword ptr [rip + 0x8f543a] ; 0x100aa6a9c
0x1001b1662: vmaxss xmm0, xmm1, xmm0
0x1001b1666: vmovss xmm1, dword ptr [rip + 0x8f5432] ; 0x100aa6aa0
0x1001b166e: vminss xmm0, xmm1, xmm0
0x1001b1672: vaddss xmm0, xmm0, xmm0
0x1001b1676: vaddss xmm0, xmm0, dword ptr [rbx + 0x118]
0x1001b167e: vmovss dword ptr [rbx + 0x118], xmm0
0x1001b1686: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1001b168b: vmulss xmm0, xmm0, dword ptr [rip + 0x8f6f75] ; 0x100aa8608
0x1001b1693: vaddss xmm0, xmm0, dword ptr [rip + 0x8f2f1d] ; 0x100aa45b8
0x1001b169b: vinsertps xmm0, xmm0, xmm0, 0x1d
0x1001b16a1: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x1001b16a9: vaddps xmm0, xmm1, xmm0
0x1001b16ad: vblendps xmm0, xmm0, xmm1, 8
0x1001b16b3: vmovaps xmm1, xmmword ptr [rbp - 0xe0]
0x1001b16bb: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x1001b16c0: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x1001b16c8: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x1001b16cd: vmovaps xmm1, xmmword ptr [rbp - 0xc0]
0x1001b16d5: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1001b16da: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001b16df: vmovaps xmm0, xmmword ptr [rbx + 0xf0]
0x1001b16e7: vxorps xmm1, xmm1, xmm1
0x1001b16eb: vblendps xmm2, xmm1, xmm0, 1
0x1001b16f1: vblendps xmm3, xmm1, xmm0, 2
0x1001b16f7: vblendps xmm0, xmm1, xmm0, 4
0x1001b16fd: vmovaps xmmword ptr [rbp - 0xa0], xmm2
0x1001b1705: vmovaps xmmword ptr [rbp - 0x90], xmm3
0x1001b170d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001b1712: vmovaps xmm0, xmmword ptr [rip + 0x8f72e6] ; 0x100aa8a00
0x1001b171a: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001b171f: lea rsi, [rbp - 0x60]
0x1001b1723: lea rdx, [rbp - 0xa0]
0x1001b172a: mov rdi, r14
0x1001b172d: call 0x100076df0 ; 0x100076df0
0x1001b1732: mov rax, r14
0x1001b1735: add rsp, 0x108
0x1001b173c: pop rbx
0x1001b173d: pop r14
0x1001b173f: pop r15
0x1001b1741: pop rbp
0x1001b1742: ret 
0x1001b1743: vmovss xmm0, dword ptr [rip + 0x8f3975] ; 0x100aa50c0
0x1001b174b: vpermilps xmm1, xmm0, 0xd2
0x1001b1751: vmulps xmm1, xmm1, xmmword ptr [rip + 0x8f6947] ; 0x100aa80a0
0x1001b1759: vmulps xmm2, xmm0, xmmword ptr [rip + 0x8f72cf] ; 0x100aa8a30
0x1001b1761: vsubps xmm1, xmm1, xmm2
0x1001b1765: vpermilps xmm2, xmm1, 0xd2
0x1001b176b: vmulps xmm1, xmm1, xmm1
0x1001b176f: vpermilpd xmm3, xmm1, 1
0x1001b1775: vaddss xmm3, xmm3, xmm1
0x1001b1779: vmovshdup xmm1, xmm1
0x1001b177d: vaddss xmm1, xmm1, xmm3
0x1001b1781: vsqrtss xmm1, xmm1, xmm1
0x1001b1785: vucomiss xmm1, dword ptr [rip + 0x8f6137] ; 0x100aa78c4
0x1001b178d: jbe 0x1001b1799
0x1001b178f: vpermilps xmm1, xmm1, 0xc0
0x1001b1795: vdivps xmm2, xmm2, xmm1
0x1001b1799: vxorps xmm8, xmm0, xmmword ptr [rip + 0x8f615f] ; 0x100aa7900
0x1001b17a1: vpshufd xmm3, xmm8, 0xd2
0x1001b17a7: vmulps xmm3, xmm3, xmm2
0x1001b17ab: vpermilps xmm4, xmm2, 0xd2
0x1001b17b1: vmulps xmm4, xmm4, xmm0
0x1001b17b5: vaddps xmm4, xmm3, xmm4
0x1001b17b9: vpermilps xmm3, xmm4, 0xd2
0x1001b17bf: vmulps xmm4, xmm4, xmm4
0x1001b17c3: vpermilpd xmm5, xmm4, 1
0x1001b17c9: vaddss xmm5, xmm5, xmm4
0x1001b17cd: vmovshdup xmm4, xmm4
0x1001b17d1: vaddss xmm4, xmm4, xmm5
0x1001b17d5: vsqrtss xmm4, xmm4, xmm4
0x1001b17d9: vucomiss xmm4, dword ptr [rip + 0x8f60e3] ; 0x100aa78c4
0x1001b17e1: jbe 0x1001b17ed
0x1001b17e3: vpermilps xmm4, xmm4, 0xc0
0x1001b17e9: vdivps xmm3, xmm3, xmm4
0x1001b17ed: vmovaps xmm4, xmmword ptr [rbp - 0x60]
0x1001b17f2: vmovaps xmm5, xmmword ptr [rbp - 0x50]
0x1001b17f7: vmovaps xmm6, xmmword ptr [rbp - 0x40]
0x1001b17fc: vmulps xmm4, xmm4, xmm4
0x1001b1800: vmovshdup xmm7, xmm4
0x1001b1804: vaddss xmm7, xmm4, xmm7
0x1001b1808: vpermilpd xmm4, xmm4, 1
0x1001b180e: vaddss xmm4, xmm4, xmm7
0x1001b1812: vsqrtss xmm4, xmm4, xmm4
0x1001b1816: vmulps xmm5, xmm5, xmm5
0x1001b181a: vmovshdup xmm7, xmm5
0x1001b181e: vaddss xmm7, xmm5, xmm7
0x1001b1822: vpermilpd xmm5, xmm5, 1
0x1001b1828: vaddss xmm5, xmm5, xmm7
0x1001b182c: vsqrtss xmm5, xmm5, xmm5
0x1001b1830: vmulps xmm6, xmm6, xmm6
0x1001b1834: vmovshdup xmm7, xmm6
0x1001b1838: vaddss xmm7, xmm6, xmm7
0x1001b183c: vpermilpd xmm6, xmm6, 1
0x1001b1842: vaddss xmm6, xmm6, xmm7
0x1001b1846: vmulps xmm7, xmm2, xmm2
0x1001b184a: vmovshdup xmm1, xmm7
0x1001b184e: vaddss xmm1, xmm7, xmm1
0x1001b1852: vpermilpd xmm7, xmm7, 1
0x1001b1858: vaddss xmm1, xmm7, xmm1
0x1001b185c: vsqrtss xmm7, xmm1, xmm1
0x1001b1860: vucomiss xmm7, dword ptr [rip + 0x8f605c] ; 0x100aa78c4
0x1001b1868: jbe 0x1001b1874
0x1001b186a: vpermilps xmm1, xmm7, 0xc0
0x1001b1870: vdivps xmm2, xmm2, xmm1
0x1001b1874: vsqrtss xmm6, xmm6, xmm6
0x1001b1878: vinsertps xmm4, xmm4, xmm5, 0x10
0x1001b187e: vinsertps xmm1, xmm2, dword ptr [rip + 0x8f3838], 0x30 ; 0x100aa50c0
0x1001b1888: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x1001b188d: vmulps xmm1, xmm3, xmm3
0x1001b1891: vmovshdup xmm2, xmm1
0x1001b1895: vaddss xmm2, xmm1, xmm2
0x1001b1899: vpermilpd xmm1, xmm1, 1
0x1001b189f: vaddss xmm1, xmm1, xmm2
0x1001b18a3: vsqrtss xmm2, xmm1, xmm1
0x1001b18a7: vucomiss xmm2, dword ptr [rip + 0x8f6015] ; 0x100aa78c4
0x1001b18af: jbe 0x1001b18bb
0x1001b18b1: vpermilps xmm1, xmm2, 0xc0
0x1001b18b7: vdivps xmm3, xmm3, xmm1
0x1001b18bb: vinsertps xmm2, xmm4, xmm6, 0x20
0x1001b18c1: vinsertps xmm1, xmm3, dword ptr [rip + 0x8f37f5], 0x30 ; 0x100aa50c0
0x1001b18cb: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x1001b18d0: vmulps xmm0, xmm0, xmm0
0x1001b18d4: vmovshdup xmm1, xmm0
0x1001b18d8: vaddss xmm1, xmm0, xmm1
0x1001b18dc: vpermilpd xmm0, xmm0, 1
0x1001b18e2: vaddss xmm0, xmm0, xmm1
0x1001b18e6: vsqrtss xmm0, xmm0, xmm0
0x1001b18ea: vucomiss xmm0, dword ptr [rip + 0x8f5fd2] ; 0x100aa78c4
0x1001b18f2: jbe 0x1001b18fe
0x1001b18f4: vpermilps xmm0, xmm0, 0xc0
0x1001b18fa: vdivps xmm8, xmm8, xmm0
0x1001b18fe: vinsertps xmm0, xmm8, dword ptr [rip + 0x8f37b8], 0x30 ; 0x100aa50c0
0x1001b1908: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001b190d: vxorps xmm0, xmm0, xmm0
0x1001b1911: vblendps xmm1, xmm0, xmm2, 1
0x1001b1917: vblendps xmm3, xmm0, xmm2, 2
0x1001b191d: vblendps xmm0, xmm0, xmm2, 4
0x1001b1923: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x1001b192b: vmovaps xmmword ptr [rbp - 0x110], xmm3
0x1001b1933: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001b193b: vmovaps xmm0, xmmword ptr [rip + 0x8f70bd] ; 0x100aa8a00
0x1001b1943: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1001b194b: lea rdi, [rbp - 0xa0]
0x1001b1952: lea rsi, [rbp - 0x60]
0x1001b1956: lea rdx, [rbp - 0x120]
0x1001b195d: call 0x100076df0 ; 0x100076df0
0x1001b1962: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1001b196a: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x1001b1972: vmovaps xmm2, xmmword ptr [rbp - 0x80]
0x1001b1977: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x1001b197c: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001b1981: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x1001b1986: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x1001b198b: vmovaps xmmword ptr [rbp - 0x30], xmm3
0x1001b1990: jmp 0x1001b16df ; 0x1001b16df
0x1001b1995: lea rdi, [rip + 0x9affbc] ; 0x100b61958 idx < size
0x1001b199c: lea rsi, [rip + 0x9affc0] ; 0x100b61963 ./Clump.h
0x1001b19a3: mov edx, 0x36
0x1001b19a8: mov ecx, 3
0x1001b19ad: call 0x1007e5f70 ; 0x1007e5f70
0x1001b19b2: ud2 
0x1001b19b4: lea rdi, [rip + 0x9b013d] ; 0x100b61af8 ret
0x1001b19bb: lea rsi, [rip + 0x9affa1] ; 0x100b61963 ./Clump.h
0x1001b19c2: mov edx, 0x47
0x1001b19c7: mov ecx, 3
0x1001b19cc: call 0x1007e5f70 ; 0x1007e5f70
0x1001b19d1: ud2 
0x1001b19d3: nop word ptr cs:[rax + rax]
