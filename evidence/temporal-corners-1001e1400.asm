0x1001e1400: push rbp
0x1001e1401: mov rbp, rsp
0x1001e1404: push r15
0x1001e1406: push r14
0x1001e1408: push r13
0x1001e140a: push r12
0x1001e140c: push rbx
0x1001e140d: and rsp, 0xffffffffffffffe0
0x1001e1411: sub rsp, 0x440
0x1001e1418: mov qword ptr [rsp + 0x108], rdx
0x1001e1420: mov r15, rsi
0x1001e1423: mov r12, rdi
0x1001e1426: mov rax, qword ptr [rip + 0xa2c4ab] ; 0x100c0d8d8
0x1001e142d: mov rax, qword ptr [rax]
0x1001e1430: mov qword ptr [rsp + 0x420], rax
0x1001e1438: vcvttss2si rbx, dword ptr [r15 + 0x30]
0x1001e143e: vcvttss2si r14, dword ptr [r15 + 0x34]
0x1001e1444: mov rdi, r15
0x1001e1447: call 0x100241e10 ; 0x100241e10
0x1001e144c: mov ecx, eax
0x1001e144e: and ecx, 7
0x1001e1451: mov rdx, qword ptr [rip + 0x8cdf68] ; 0x100aaf3c0
0x1001e1458: mov qword ptr [rsp + 0x3a0], rdx
0x1001e1460: mov dword ptr [rsp + 0x3a8], 0
0x1001e146b: mov rdx, qword ptr [rip + 0x8cdf5e] ; 0x100aaf3d0
0x1001e1472: mov qword ptr [rsp + 0x3b0], rdx
0x1001e147a: mov dword ptr [rsp + 0x3b8], 0
0x1001e1485: vmovss xmm0, dword ptr [rip + 0x8c5617] ; 0x100aa6aa4
0x1001e148d: vmovlps qword ptr [rsp + 0x3c0], xmm0
0x1001e1496: mov dword ptr [rsp + 0x3c8], 0
0x1001e14a1: mov rdx, qword ptr [rip + 0x8cdf38] ; 0x100aaf3e0
0x1001e14a8: mov qword ptr [rsp + 0x3d0], rdx
0x1001e14b0: mov dword ptr [rsp + 0x3d8], 0
0x1001e14bb: mov rdx, qword ptr [rip + 0x8cdf2e] ; 0x100aaf3f0
0x1001e14c2: mov qword ptr [rsp + 0x3e0], rdx
0x1001e14ca: mov dword ptr [rsp + 0x3e8], 0
0x1001e14d5: mov rdx, qword ptr [rip + 0x8cdf24] ; 0x100aaf400
0x1001e14dc: mov qword ptr [rsp + 0x3f0], rdx
0x1001e14e4: mov dword ptr [rsp + 0x3f8], 0
0x1001e14ef: mov rdx, qword ptr [rip + 0x8cdf1a] ; 0x100aaf410
0x1001e14f6: mov qword ptr [rsp + 0x400], rdx
0x1001e14fe: mov dword ptr [rsp + 0x408], 0
0x1001e1509: mov rdx, qword ptr [rip + 0x8cdf10] ; 0x100aaf420
0x1001e1510: mov qword ptr [rsp + 0x410], rdx
0x1001e1518: mov dword ptr [rsp + 0x418], 0
0x1001e1523: shl rcx, 4
0x1001e1527: vmovaps xmm1, xmmword ptr [rip + 0x8c9031] ; 0x100aaa560
0x1001e152f: vaddps xmm0, xmm1, xmmword ptr [rsp + rcx + 0x3a0]
0x1001e1538: vdivps xmm0, xmm0, xmmword ptr [rip + 0x8cdef0] ; 0x100aaf430
0x1001e1540: vsubps xmm2, xmm0, xmm1
0x1001e1544: vmovaps xmmword ptr [rsp + 0x20], xmm2
0x1001e154a: add eax, 7
0x1001e154d: and eax, 7
0x1001e1550: shl rax, 4
0x1001e1554: vaddps xmm0, xmm1, xmmword ptr [rsp + rax + 0x3a0]
0x1001e155d: vmovaps xmmword ptr [rsp + 0x150], xmm0
0x1001e1566: vxorps ymm0, ymm0, ymm0
0x1001e156a: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x1001e1573: mov dword ptr [rsp + 0x380], 0
0x1001e157e: vmovshdup xmm1, xmm2
0x1001e1582: vmovaps xmmword ptr [rsp + 0xf0], xmm1
0x1001e158b: vmovss xmm0, dword ptr [rip + 0x8c3b31] ; 0x100aa50c4
0x1001e1593: vaddss xmm2, xmm2, xmm0
0x1001e1597: vmovaps xmmword ptr [rsp + 0x50], xmm2
0x1001e159d: vxorps xmm3, xmm3, xmm3
0x1001e15a1: vblendps xmm3, xmm3, xmm2, 1
0x1001e15a7: vmovaps xmmword ptr [rsp + 0xd0], xmm3
0x1001e15b0: vaddss xmm0, xmm1, xmm0
0x1001e15b4: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001e15ba: vinsertps xmm0, xmm2, xmm0, 0x1c
0x1001e15c0: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x1001e15c6: vmulps xmm0, xmm0, xmm0
0x1001e15ca: vmovshdup xmm1, xmm0
0x1001e15ce: vaddss xmm1, xmm0, xmm1
0x1001e15d2: vpermilpd xmm0, xmm0, 1
0x1001e15d8: vaddss xmm0, xmm0, xmm1
0x1001e15dc: vmulss xmm0, xmm0, dword ptr [rip + 0x8cddbc] ; 0x100aaf3a0
0x1001e15e4: vzeroupper 
0x1001e15e7: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e15ec: vmovss dword ptr [rsp + 0xe0], xmm0
0x1001e15f5: vmovss dword ptr [rsp + 0x380], xmm0
0x1001e15fe: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001e1604: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x14
0x1001e160c: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x40], 8
0x1001e1614: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x1001e161a: vmulps xmm0, xmm0, xmm0
0x1001e161e: vmovshdup xmm1, xmm0
0x1001e1622: vaddss xmm1, xmm0, xmm1
0x1001e1626: vpermilpd xmm0, xmm0, 1
0x1001e162c: vaddss xmm0, xmm0, xmm1
0x1001e1630: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdd68] ; 0x100aaf3a0
0x1001e1638: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e163d: vmovss dword ptr [rsp + 0x37c], xmm0
0x1001e1646: vaddss xmm0, xmm0, dword ptr [rsp + 0xe0]
0x1001e164f: vmovss dword ptr [rsp + 0xc0], xmm0
0x1001e1658: vmovss xmm0, dword ptr [rip + 0x8c3a60] ; 0x100aa50c0
0x1001e1660: vaddss xmm0, xmm0, dword ptr [rsp + 0x20]
0x1001e1666: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x1001e166f: vblendps xmm1, xmm0, xmmword ptr [rip + 0x8c2f27], 0xe ; 0x100aa45a0
0x1001e1679: vmovaps xmmword ptr [rsp + 0xb0], xmm1
0x1001e1682: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x1c
0x1001e168a: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x40], 8
0x1001e1692: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1001e1698: vmulps xmm0, xmm0, xmm0
0x1001e169c: vmovshdup xmm1, xmm0
0x1001e16a0: vaddss xmm1, xmm0, xmm1
0x1001e16a4: vpermilpd xmm0, xmm0, 1
0x1001e16aa: vaddss xmm0, xmm0, xmm1
0x1001e16ae: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdcea] ; 0x100aaf3a0
0x1001e16b6: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e16bb: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x1001e16c1: vaddss xmm0, xmm0, dword ptr [rsp + 0xc0]
0x1001e16ca: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e16d0: vmovaps xmm0, xmmword ptr [rsp + 0xd0]
0x1001e16d9: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x20], 2
0x1001e16e1: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x30], 8
0x1001e16e9: vmulps xmm0, xmm0, xmm0
0x1001e16ed: vmovshdup xmm1, xmm0
0x1001e16f1: vaddss xmm1, xmm0, xmm1
0x1001e16f5: vpermilpd xmm0, xmm0, 1
0x1001e16fb: vaddss xmm0, xmm0, xmm1
0x1001e16ff: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdc99] ; 0x100aaf3a0
0x1001e1707: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e170c: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x1001e1715: vaddss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e171b: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e1721: vmovsd xmm0, qword ptr [rsp + 0x20]
0x1001e1727: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1001e172d: vmulps xmm0, xmm0, xmm0
0x1001e1731: vmovshdup xmm1, xmm0
0x1001e1735: vaddss xmm1, xmm0, xmm1
0x1001e1739: vpermilpd xmm0, xmm0, 1
0x1001e173f: vaddss xmm0, xmm0, xmm1
0x1001e1743: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdc55] ; 0x100aaf3a0
0x1001e174b: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e1750: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x1001e1759: vaddss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e175f: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e1765: vmovaps xmm0, xmmword ptr [rsp + 0xb0]
0x1001e176e: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x20], 2
0x1001e1776: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x30], 8
0x1001e177e: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x1001e1787: vmulps xmm0, xmm0, xmm0
0x1001e178b: vmovshdup xmm1, xmm0
0x1001e178f: vaddss xmm1, xmm0, xmm1
0x1001e1793: vpermilpd xmm0, xmm0, 1
0x1001e1799: vaddss xmm0, xmm0, xmm1
0x1001e179d: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdbfb] ; 0x100aaf3a0
0x1001e17a5: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e17aa: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1001e17b3: vaddss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e17b9: vmovss dword ptr [rsp + 0x30], xmm0
0x1001e17bf: vmovss xmm0, dword ptr [rip + 0x8c38f9] ; 0x100aa50c0
0x1001e17c7: vaddss xmm1, xmm0, dword ptr [rsp + 0xf0]
0x1001e17d0: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x1001e17d6: vmovaps xmm0, xmmword ptr [rsp + 0x50]
0x1001e17dc: vinsertps xmm0, xmm0, xmm1, 0x1c
0x1001e17e2: vblendps xmm0, xmm0, xmmword ptr [rsp + 0xa0], 8
0x1001e17ed: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1001e17f3: vmulps xmm0, xmm0, xmm0
0x1001e17f7: vmovshdup xmm1, xmm0
0x1001e17fb: vaddss xmm1, xmm0, xmm1
0x1001e17ff: vpermilpd xmm0, xmm0, 1
0x1001e1805: vaddss xmm0, xmm0, xmm1
0x1001e1809: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdb8f] ; 0x100aaf3a0
0x1001e1811: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e1816: vmovaps xmmword ptr [rsp + 0xf0], xmm0
0x1001e181f: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x1001e1825: vmovss dword ptr [rsp + 0x30], xmm0
0x1001e182b: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001e1831: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x14
0x1001e1839: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x50], 8
0x1001e1841: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x1001e184a: vmulps xmm0, xmm0, xmm0
0x1001e184e: vmovshdup xmm1, xmm0
0x1001e1852: vaddss xmm1, xmm0, xmm1
0x1001e1856: vpermilpd xmm0, xmm0, 1
0x1001e185c: vaddss xmm0, xmm0, xmm1
0x1001e1860: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdb38] ; 0x100aaf3a0
0x1001e1868: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e186d: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1001e1873: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x1001e1879: vmovss dword ptr [rsp + 0x30], xmm0
0x1001e187f: vmovaps xmm0, xmmword ptr [rsp + 0xe0]
0x1001e1888: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x1c
0x1001e1890: vblendps xmm0, xmm0, xmmword ptr [rsp + 0xa0], 8
0x1001e189b: vmulps xmm0, xmm0, xmm0
0x1001e189f: vmovshdup xmm1, xmm0
0x1001e18a3: vaddss xmm1, xmm0, xmm1
0x1001e18a7: vpermilpd xmm0, xmm0, 1
0x1001e18ad: vaddss xmm0, xmm0, xmm1
0x1001e18b1: vmulss xmm0, xmm0, dword ptr [rip + 0x8cdae7] ; 0x100aaf3a0
0x1001e18b9: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001e18be: vaddss xmm1, xmm0, dword ptr [rsp + 0x30]
0x1001e18c4: vinsertps xmm0, xmm0, dword ptr [rsp + 0x50], 0x10
0x1001e18cc: vinsertps xmm0, xmm0, dword ptr [rsp + 0xf0], 0x20
0x1001e18d7: vinsertps xmm0, xmm0, dword ptr [rsp + 0xb0], 0x30
0x1001e18e2: vmovaps xmm2, xmmword ptr [rsp + 0xc0]
0x1001e18eb: vinsertps xmm2, xmm2, dword ptr [rsp + 0xd0], 0x10
0x1001e18f6: vinsertps xmm2, xmm2, dword ptr [rsp + 0x40], 0x20
0x1001e18fe: vinsertps xmm2, xmm2, dword ptr [rsp + 0x37c], 0x30
0x1001e1909: vinsertf128 ymm0, ymm0, xmm2, 1
0x1001e190f: vpermilps xmm2, xmm1, 0
0x1001e1915: vinsertf128 ymm2, ymm2, xmm2, 1
0x1001e191b: vdivps ymm4, ymm0, ymm2
0x1001e191f: vmovaps ymmword ptr [rsp + 0x360], ymm4
0x1001e1928: vmovss xmm0, dword ptr [rsp + 0x380]
0x1001e1931: vdivss xmm3, xmm0, xmm1
0x1001e1935: vmovss dword ptr [rsp + 0x380], xmm3
0x1001e193e: vmovshdup xmm0, xmm4
0x1001e1942: vaddss xmm11, xmm0, xmm4
0x1001e1946: vdivss xmm0, xmm0, xmm11
0x1001e194b: vmovss xmm5, dword ptr [rip + 0x8c3771] ; 0x100aa50c4
0x1001e1953: vaddss xmm8, xmm0, xmm5
0x1001e1957: vpermilpd xmm2, xmm4, 1
0x1001e195d: vextractf128 xmm0, ymm4, 1
0x1001e1963: vmovshdup xmm6, xmm0
0x1001e1967: vaddss xmm12, xmm6, xmm2
0x1001e196b: vdivss xmm6, xmm6, xmm12
0x1001e1970: vaddss xmm10, xmm6, xmm5
0x1001e1974: vmovaps xmm9, xmm5
0x1001e1978: vpermilps xmm7, xmm0, 0xe7
0x1001e197e: vaddss xmm3, xmm7, xmm3
0x1001e1982: vdivss xmm7, xmm7, xmm3
0x1001e1986: vmovss xmm6, dword ptr [rip + 0x8c3732] ; 0x100aa50c0
0x1001e198e: vsubss xmm7, xmm6, xmm7
0x1001e1992: vpermilps xmm4, xmm4, 0xe7
0x1001e1998: vpermilpd xmm5, xmm0, 1
0x1001e199e: vaddss xmm5, xmm4, xmm5
0x1001e19a2: vdivss xmm4, xmm4, xmm5
0x1001e19a6: vsubss xmm4, xmm6, xmm4
0x1001e19aa: mov eax, ebx
0x1001e19ac: vcvtsi2ss xmm1, xmm13, rax
0x1001e19b1: mov eax, r14d
0x1001e19b4: vcvtsi2ss xmm2, xmm13, rax
0x1001e19b9: vinsertps xmm7, xmm7, xmm6, 0x10
0x1001e19bf: vinsertps xmm7, xmm7, xmm9, 0x20
0x1001e19c5: vinsertps xmm4, xmm7, xmm4, 0x30
0x1001e19cb: vinsertps xmm7, xmm8, xmm9, 0x10
0x1001e19d1: vinsertps xmm7, xmm7, xmm6, 0x20
0x1001e19d7: vinsertps xmm6, xmm7, xmm10, 0x30
0x1001e19dd: vinsertf128 ymm4, ymm6, xmm4, 1
0x1001e19e3: vinsertps xmm6, xmm1, xmm2, 0x10
0x1001e19e9: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x1001e19ef: vinsertps xmm6, xmm6, xmm1, 0x20
0x1001e19f5: vmovaps xmmword ptr [rsp + 0x40], xmm2
0x1001e19fb: vinsertps xmm6, xmm6, xmm2, 0x30
0x1001e1a01: vinsertf128 ymm6, ymm6, xmm6, 1
0x1001e1a07: vdivps ymm4, ymm4, ymm6
0x1001e1a0b: vmovups ymmword ptr [r12 + 0x220], ymm4
0x1001e1a15: vmovss dword ptr [r12 + 0x240], xmm11
0x1001e1a1f: vmovss dword ptr [r12 + 0x244], xmm12
0x1001e1a29: vmovss dword ptr [r12 + 0x248], xmm3
0x1001e1a33: vmovss dword ptr [r12 + 0x24c], xmm5
0x1001e1a3d: vmovss dword ptr [r12 + 0x250], xmm0
0x1001e1a47: mov rdi, r15
0x1001e1a4a: vzeroupper 
0x1001e1a4d: call 0x100241e20 ; 0x100241e20
0x1001e1a52: vxorps xmm6, xmm6, xmm6
0x1001e1a56: vxorps xmm0, xmm0, xmm0
0x1001e1a5a: test al, al
0x1001e1a5c: jne 0x1001e1a7d
0x1001e1a5e: vmovaps xmm0, xmmword ptr [rsp + 0x150]
0x1001e1a67: vdivps xmm0, xmm0, xmmword ptr [rip + 0x8cd9c1] ; 0x100aaf430
0x1001e1a6f: vsubps xmm6, xmm0, xmmword ptr [rip + 0x8c8ae9] ; 0x100aaa560
0x1001e1a77: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001e1a7d: vmovss xmm1, dword ptr [rip + 0x8c363b] ; 0x100aa50c0
0x1001e1a85: vmovaps xmm8, xmm1
0x1001e1a89: vmovaps xmmword ptr [rsp + 0x110], xmm8
0x1001e1a92: vmovaps xmm1, xmmword ptr [rip + 0x8c6606] ; 0x100aa80a0
0x1001e1a9a: vmovaps xmmword ptr [rsp + 0x120], xmm1
0x1001e1aa3: vmovaps xmm2, xmmword ptr [rip + 0x8c6f85] ; 0x100aa8a30
0x1001e1aab: vmovaps xmmword ptr [rsp + 0x130], xmm2
0x1001e1ab4: vmovaps xmm3, xmmword ptr [rip + 0x8c6f44] ; 0x100aa8a00
0x1001e1abc: vmovaps xmmword ptr [rsp + 0x140], xmm3
0x1001e1ac5: vaddss xmm4, xmm0, xmm0
0x1001e1ac9: vmovaps xmm7, xmmword ptr [rsp + 0x10]
0x1001e1acf: vdivss xmm4, xmm4, xmm7
0x1001e1ad3: vmovaps xmm5, xmm7
0x1001e1ad7: vmovss dword ptr [rsp + 0x140], xmm4
0x1001e1ae0: vmovshdup xmm0, xmm0
0x1001e1ae4: vaddss xmm0, xmm0, xmm0
0x1001e1ae8: vmovaps xmm7, xmmword ptr [rsp + 0x40]
0x1001e1aee: vdivss xmm0, xmm0, xmm7
0x1001e1af2: vmovss dword ptr [rsp + 0x144], xmm0
0x1001e1afb: vmovaps xmmword ptr [rsp + 0x1a0], xmm8
0x1001e1b04: vmovaps xmmword ptr [rsp + 0x1b0], xmm1
0x1001e1b0d: vmovaps xmmword ptr [rsp + 0x1c0], xmm2
0x1001e1b16: vmovaps xmmword ptr [rsp + 0x1d0], xmm3
0x1001e1b1f: vcvtss2sd xmm0, xmm6, xmm6
0x1001e1b23: vaddsd xmm0, xmm0, xmm0
0x1001e1b27: vcvtss2sd xmm1, xmm5, xmm5
0x1001e1b2b: vdivsd xmm0, xmm0, xmm1
0x1001e1b2f: vcvtsd2ss xmm0, xmm0, xmm0
0x1001e1b33: vmovss dword ptr [rsp + 0x1d0], xmm0
0x1001e1b3c: vmovshdup xmm0, xmm6
0x1001e1b40: vcvtss2sd xmm0, xmm0, xmm0
0x1001e1b44: vaddsd xmm0, xmm0, xmm0
0x1001e1b48: vcvtss2sd xmm1, xmm7, xmm7
0x1001e1b4c: vdivsd xmm0, xmm0, xmm1
0x1001e1b50: vcvtsd2ss xmm0, xmm0, xmm0
0x1001e1b54: vmovss dword ptr [rsp + 0x1d4], xmm0
0x1001e1b5d: mov rax, qword ptr [r12 + 0x140]
0x1001e1b65: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x1001e1b6a: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1001e1b6f: vmovss xmm0, dword ptr [rip + 0x8c6aa9] ; 0x100aa8620
0x1001e1b77: vmulss xmm1, xmm4, xmm0
0x1001e1b7b: mov rax, qword ptr [r12 + 0x140]
0x1001e1b83: vmovss dword ptr [rax + 0x20], xmm1
0x1001e1b88: vmulss xmm0, xmm0, dword ptr [rsp + 0x144]
0x1001e1b91: vmovss dword ptr [rax + 0x24], xmm0
0x1001e1b96: mov rdi, r15
0x1001e1b99: call 0x100241e10 ; 0x100241e10
0x1001e1b9e: and eax, 0x1f
0x1001e1ba1: lea rcx, [rip + 0x8cd8a8] ; 0x100aaf450 -> 0x100000000 __mh_execute_header
0x1001e1ba8: mov eax, dword ptr [rcx + rax*4]
0x1001e1bab: mov rcx, qword ptr [r12 + 0x140]
0x1001e1bb3: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001e1bb8: vmovaps xmmword ptr [rcx + 0x50], xmm0
0x1001e1bbd: lea ecx, [rax + rax]
0x1001e1bc0: and ecx, 2
0x1001e1bc3: vcvtsi2ss xmm0, xmm13, ecx
0x1001e1bc7: vmovss xmm1, dword ptr [rip + 0x8c34f5] ; 0x100aa50c4
0x1001e1bcf: vaddss xmm0, xmm0, xmm1
0x1001e1bd3: vmovss xmm2, dword ptr [rip + 0x8c29dd] ; 0x100aa45b8
0x1001e1bdb: vmulss xmm0, xmm0, xmm2
0x1001e1bdf: vdivss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e1be5: mov rcx, qword ptr [r12 + 0x140]
0x1001e1bed: vmovss dword ptr [rcx + 0x30], xmm0
0x1001e1bf2: and eax, 0xfffffffe
0x1001e1bf5: vcvtsi2ss xmm0, xmm13, rax
0x1001e1bfa: vaddss xmm0, xmm0, xmm1
0x1001e1bfe: vmulss xmm0, xmm0, xmm2
0x1001e1c02: vdivss xmm0, xmm0, dword ptr [rsp + 0x40]
0x1001e1c08: vmovss dword ptr [rcx + 0x34], xmm0
0x1001e1c0d: mov rdi, r15
0x1001e1c10: call 0x100241e20 ; 0x100241e20
0x1001e1c15: test al, al
0x1001e1c17: je 0x1001e1c45
0x1001e1c19: vmovss xmm0, dword ptr [rip + 0x8c2997] ; 0x100aa45b8
0x1001e1c21: vmovaps xmm1, xmm0
0x1001e1c25: vdivss xmm0, xmm1, dword ptr [rsp + 0x10]
0x1001e1c2b: mov rsi, qword ptr [r12 + 0x140]
0x1001e1c33: vmovss dword ptr [rsi + 0x30], xmm0
0x1001e1c38: vdivss xmm0, xmm1, dword ptr [rsp + 0x40]
0x1001e1c3e: vmovss dword ptr [rsi + 0x34], xmm0
0x1001e1c43: jmp 0x1001e1c4d ; 0x1001e1c4d
0x1001e1c45: mov rsi, qword ptr [r12 + 0x140]
0x1001e1c4d: lea rdi, [rsp + 0x190]
0x1001e1c55: call 0x10076be90 ; 0x10076be90
0x1001e1c5a: vmovss xmm0, dword ptr [rsp + 0x194]
0x1001e1c63: vmulss xmm0, xmm0, dword ptr [rip + 0x8c4e31] ; 0x100aa6a9c
0x1001e1c6b: vxorps xmm1, xmm1, xmm1
0x1001e1c6f: vmaxss xmm0, xmm1, xmm0
0x1001e1c73: vmovss xmm1, dword ptr [rip + 0x8c9bc1] ; 0x100aab83c
0x1001e1c7b: vminss xmm0, xmm1, xmm0
0x1001e1c7f: vaddss xmm0, xmm0, dword ptr [rip + 0x8c6981] ; 0x100aa8608
0x1001e1c87: mov rax, qword ptr [r12 + 0x140]
0x1001e1c8f: vmovss dword ptr [rax + 0xc], xmm0
0x1001e1c94: mov dword ptr [rax + 0x10], 0x466a6000
0x1001e1c9b: lea rcx, [r12 + 0x160]
0x1001e1ca3: cmp byte ptr [r12 + 0x26c], 0
0x1001e1cac: lea rdx, [rax + 0xc0]
0x1001e1cb3: cmove rcx, rdx
0x1001e1cb7: vmovaps xmm0, xmmword ptr [rcx]
0x1001e1cbb: vmovaps xmmword ptr [rax + 0x100], xmm0
0x1001e1cc3: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001e1cc8: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1001e1cd0: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1001e1cd5: vmovaps xmmword ptr [rax + 0x120], xmm0
0x1001e1cdd: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001e1ce2: vmovaps xmmword ptr [rax + 0x130], xmm0
0x1001e1cea: mov rax, qword ptr [r12 + 0x140]
0x1001e1cf2: vmovaps xmm0, xmmword ptr [r12 + 0x160]
0x1001e1cfc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1001e1d04: vmovaps xmm0, xmmword ptr [r12 + 0x170]
0x1001e1d0e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1001e1d16: vmovaps xmm0, xmmword ptr [r12 + 0x180]
0x1001e1d20: vmovaps xmmword ptr [rax + 0xe0], xmm0
0x1001e1d28: vmovaps xmm0, xmmword ptr [r12 + 0x190]
0x1001e1d32: vmovaps xmmword ptr [rax + 0xf0], xmm0
0x1001e1d3a: mov eax, dword ptr [r12 + 0x154]
0x1001e1d42: mov rcx, qword ptr [r12 + 0x140]
0x1001e1d4a: mov dword ptr [rcx + 4], eax
0x1001e1d4d: mov eax, dword ptr [r12 + 0x264]
0x1001e1d55: mov dword ptr [rcx + 0x14], eax
0x1001e1d58: vmovaps xmm0, xmmword ptr [rcx + 0x140]
0x1001e1d60: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x1001e1d66: vmovaps xmmword ptr [rsp + 0x1e0], xmm0
0x1001e1d6f: vmovaps xmm0, xmmword ptr [rcx + 0x150]
0x1001e1d77: vmovaps xmmword ptr [rsp + 0x1f0], xmm0
0x1001e1d80: vmovaps xmm0, xmmword ptr [rcx + 0x160]
0x1001e1d88: vmovaps xmmword ptr [rsp + 0x200], xmm0
0x1001e1d91: vmovaps xmm0, xmmword ptr [rcx + 0x170]
0x1001e1d99: vmovaps xmmword ptr [rsp + 0x210], xmm0
0x1001e1da2: lea r15, [rsp + 0x220]
0x1001e1daa: lea r13, [rsp + 0x1a0]
0x1001e1db2: mov rdi, r15
0x1001e1db5: mov rsi, r13
0x1001e1db8: call 0x100076940 ; 0x100076940
0x1001e1dbd: lea r14, [rsp + 0x2e0]
0x1001e1dc5: lea rbx, [rsp + 0x110]
0x1001e1dcd: mov rdi, r14
0x1001e1dd0: mov rsi, rbx
0x1001e1dd3: mov rdx, r15
0x1001e1dd6: call 0x100076df0 ; 0x100076df0
0x1001e1ddb: mov rdx, qword ptr [r12 + 0x140]
0x1001e1de3: add rdx, 0x1c0
0x1001e1dea: lea r15, [rsp + 0x320]
0x1001e1df2: mov rdi, r15
0x1001e1df5: mov rsi, r14
0x1001e1df8: call 0x100076df0 ; 0x100076df0
0x1001e1dfd: mov rsi, qword ptr [r12 + 0x140]
0x1001e1e05: add rsi, 0x200
0x1001e1e0c: lea r14, [rsp + 0x2a0]
0x1001e1e14: mov rdi, r14
0x1001e1e17: mov rdx, r13
0x1001e1e1a: call 0x100076df0 ; 0x100076df0
0x1001e1e1f: lea r13, [rsp + 0x60]
0x1001e1e24: mov rdi, r13
0x1001e1e27: mov rsi, rbx
0x1001e1e2a: call 0x100076940 ; 0x100076940
0x1001e1e2f: lea rbx, [rsp + 0x220]
0x1001e1e37: mov rdi, rbx
0x1001e1e3a: mov rsi, r14
0x1001e1e3d: mov rdx, r13
0x1001e1e40: call 0x100076df0 ; 0x100076df0
0x1001e1e45: mov rsi, qword ptr [r12 + 0x140]
0x1001e1e4d: lea rdi, [rsp + 0x60]
0x1001e1e52: call 0x10076dc80 ; 0x10076dc80
0x1001e1e57: mov rax, qword ptr [r12 + 0x140]
0x1001e1e5f: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x1001e1e65: vmovaps xmmword ptr [rax + 0x140], xmm0
0x1001e1e6d: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1001e1e73: vmovaps xmmword ptr [rax + 0x150], xmm0
0x1001e1e7b: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x1001e1e84: vmovaps xmmword ptr [rax + 0x160], xmm0
0x1001e1e8c: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x1001e1e95: vmovaps xmmword ptr [rax + 0x170], xmm0
0x1001e1e9d: cmp byte ptr [r12 + 0x26c], 0
0x1001e1ea6: mov rax, qword ptr [r12 + 0x140]
0x1001e1eae: je 0x1001e1ec1
0x1001e1eb0: lea rcx, [rax + 0x140]
0x1001e1eb7: vmovaps xmm0, xmmword ptr [rax + 0x140]
0x1001e1ebf: jmp 0x1001e1ecf ; 0x1001e1ecf
0x1001e1ec1: lea rcx, [rsp + 0x1e0]
0x1001e1ec9: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001e1ecf: vmovaps xmmword ptr [rax + 0x240], xmm0
0x1001e1ed7: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001e1edc: vmovaps xmmword ptr [rax + 0x250], xmm0
0x1001e1ee4: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1001e1ee9: vmovaps xmmword ptr [rax + 0x260], xmm0
0x1001e1ef1: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001e1ef6: vmovaps xmmword ptr [rax + 0x270], xmm0
0x1001e1efe: mov rsi, qword ptr [r12 + 0x140]
0x1001e1f06: lea r14, [rsp + 0x260]
0x1001e1f0e: mov rdi, r14
0x1001e1f11: call 0x10076ddb0 ; 0x10076ddb0
0x1001e1f16: lea rdi, [rsp + 0x60]
0x1001e1f1b: lea rsi, [rsp + 0x110]
0x1001e1f23: mov rdx, r14
0x1001e1f26: call 0x100076df0 ; 0x100076df0
0x1001e1f2b: mov rax, qword ptr [r12 + 0x140]
0x1001e1f33: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x1001e1f39: vmovaps xmmword ptr [rax + 0x180], xmm0
0x1001e1f41: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1001e1f47: vmovaps xmmword ptr [rax + 0x190], xmm0
0x1001e1f4f: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x1001e1f58: vmovaps xmmword ptr [rax + 0x1a0], xmm0
0x1001e1f60: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x1001e1f69: vmovaps xmmword ptr [rax + 0x1b0], xmm0
0x1001e1f71: mov rdx, qword ptr [r12 + 0x140]
0x1001e1f79: lea rsi, [rdx + 0x180]
0x1001e1f80: add rdx, 0x140
0x1001e1f87: lea rdi, [rsp + 0x60]
0x1001e1f8c: call 0x100076df0 ; 0x100076df0
0x1001e1f91: mov rax, qword ptr [r12 + 0x140]
0x1001e1f99: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x1001e1f9f: vmovaps xmmword ptr [rax + 0x1c0], xmm0
0x1001e1fa7: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1001e1fad: vmovaps xmmword ptr [rax + 0x1d0], xmm0
0x1001e1fb5: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x1001e1fbe: vmovaps xmmword ptr [rax + 0x1e0], xmm0
0x1001e1fc6: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x1001e1fcf: vmovaps xmmword ptr [rax + 0x1f0], xmm0
0x1001e1fd7: mov rax, qword ptr [r12 + 0x140]
0x1001e1fdf: cmp byte ptr [r12 + 0x26c], 0
0x1001e1fe8: lea rcx, [rax + 0x1c0]
0x1001e1fef: cmove rcx, r15
0x1001e1ff3: vmovaps xmm0, xmmword ptr [rcx]
0x1001e1ff7: vmovaps xmmword ptr [rax + 0x280], xmm0
0x1001e1fff: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001e2004: vmovaps xmmword ptr [rax + 0x290], xmm0
0x1001e200c: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1001e2011: vmovaps xmmword ptr [rax + 0x2a0], xmm0
0x1001e2019: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001e201e: vmovaps xmmword ptr [rax + 0x2b0], xmm0
0x1001e2026: mov rsi, qword ptr [r12 + 0x140]
0x1001e202e: add rsi, 0x1c0
0x1001e2035: lea rdi, [rsp + 0x60]
0x1001e203a: call 0x100076940 ; 0x100076940
0x1001e203f: mov rax, qword ptr [r12 + 0x140]
0x1001e2047: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x1001e204d: vmovaps xmmword ptr [rax + 0x200], xmm0
0x1001e2055: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1001e205b: vmovaps xmmword ptr [rax + 0x210], xmm0
0x1001e2063: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x1001e206c: vmovaps xmmword ptr [rax + 0x220], xmm0
0x1001e2074: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x1001e207d: vmovaps xmmword ptr [rax + 0x230], xmm0
0x1001e2085: mov rax, qword ptr [r12 + 0x140]
0x1001e208d: lea rcx, [rax + 0x200]
0x1001e2094: cmp byte ptr [r12 + 0x26c], 0
0x1001e209d: cmove rcx, rbx
0x1001e20a1: vmovaps xmm0, xmmword ptr [rcx]
0x1001e20a5: vmovaps xmmword ptr [rax + 0x2c0], xmm0
0x1001e20ad: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001e20b2: vmovaps xmmword ptr [rax + 0x2d0], xmm0
0x1001e20ba: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1001e20bf: vmovaps xmmword ptr [rax + 0x2e0], xmm0
0x1001e20c7: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001e20cc: vmovaps xmmword ptr [rax + 0x2f0], xmm0
0x1001e20d4: mov rax, qword ptr [r12 + 0x140]
0x1001e20dc: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x1001e20e1: vmovaps xmmword ptr [rax + 0x90], xmm0
0x1001e20e9: mov rax, qword ptr [r12 + 0x140]
0x1001e20f1: vmovaps xmm0, xmmword ptr [rax + 0x70]
0x1001e20f6: vmovaps xmmword ptr [rax + 0xa0], xmm0
0x1001e20fe: mov rax, qword ptr [r12 + 0x140]
0x1001e2106: vmovaps xmm0, xmmword ptr [rax + 0x80]
0x1001e210e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1001e2116: mov rbx, qword ptr [r12 + 0x140]
0x1001e211e: vmovss xmm0, dword ptr [rbx + 4]
0x1001e2123: vmulss xmm0, xmm0, dword ptr [rip + 0x8c248d] ; 0x100aa45b8
0x1001e212b: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x1001e2130: vaddss xmm0, xmm0, xmm0
0x1001e2134: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x1001e213a: lea rdi, [rsp + 0x180]
0x1001e2142: mov rsi, rbx
0x1001e2145: call 0x10076beb0 ; 0x10076beb0
0x1001e214a: vpermilps xmm0, xmmword ptr [rsp + 0x20], 0xc0
0x1001e2152: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x1001e2158: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x180]
0x1001e2161: mov rax, qword ptr [r12 + 0x140]
0x1001e2169: vbroadcastss xmm1, dword ptr [rax + 8]
0x1001e216f: vmulps xmm0, xmm0, xmm1
0x1001e2173: vxorps xmm1, xmm1, xmm1
0x1001e2177: vblendps xmm0, xmm0, xmm1, 8
0x1001e217d: vmovaps xmmword ptr [rax + 0x60], xmm0
0x1001e2182: mov rsi, qword ptr [r12 + 0x140]
0x1001e218a: lea rdi, [rsp + 0x170]
0x1001e2192: call 0x10076bed0 ; 0x10076bed0
0x1001e2197: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001e219d: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x170]
0x1001e21a6: vblendps xmm0, xmm0, xmmword ptr [rip + 0x8c23f0], 8 ; 0x100aa45a0
0x1001e21b0: mov rax, qword ptr [r12 + 0x140]
0x1001e21b8: vmovaps xmmword ptr [rax + 0x70], xmm0
0x1001e21bd: mov rsi, qword ptr [r12 + 0x140]
0x1001e21c5: lea rdi, [rsp + 0x160]
0x1001e21cd: call 0x10076bef0 ; 0x10076bef0
0x1001e21d2: mov rax, qword ptr [r12 + 0x140]
0x1001e21da: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x1001e21df: vaddps xmm0, xmm0, xmmword ptr [rax + 0x70]
0x1001e21e4: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8c5484] ; 0x100aa7670
0x1001e21ec: vmovaps xmm1, xmmword ptr [rsp + 0x160]
0x1001e21f5: vsubps xmm0, xmm1, xmm0
0x1001e21f9: vblendps xmm0, xmm0, xmmword ptr [rip + 0x8c239d], 8 ; 0x100aa45a0
0x1001e2203: vmovaps xmmword ptr [rax + 0x80], xmm0
0x1001e220b: call 0x1007945e0 ; 0x1007945e0
0x1001e2210: test rax, rax
0x1001e2213: je 0x1001e2238
0x1001e2215: call 0x1007945e0 ; 0x1007945e0
0x1001e221a: mov rdx, qword ptr [r12 + 0x140]
0x1001e2222: lea rsi, [rdx + 0x140]
0x1001e2229: add rdx, 0x180
0x1001e2230: mov rdi, rax
0x1001e2233: call 0x100794090 ; 0x100794090
0x1001e2238: cmp byte ptr [r12 + 0x26c], 0
0x1001e2241: vxorps xmm0, xmm0, xmm0
0x1001e2245: je 0x1001e224f
0x1001e2247: vmovss xmm0, dword ptr [rip + 0x8c2e71] ; 0x100aa50c0
0x1001e224f: vmovss dword ptr [r12 + 0x210], xmm0
0x1001e2259: mov rax, qword ptr [r12 + 0x140]
0x1001e2261: mov rsi, qword ptr [r12 + 0x254]
0x1001e2269: vmovss xmm0, dword ptr [rax + 0x194]
0x1001e2271: vmulss xmm0, xmm0, dword ptr [rip + 0x8c233f] ; 0x100aa45b8
0x1001e2279: vmovss dword ptr [r12 + 0x214], xmm0
0x1001e2283: mov byte ptr [r12 + 0x26c], 0
0x1001e228c: mov rdi, qword ptr [rsp + 0x108]
0x1001e2294: call 0x1005964e0 ; 0x1005964e0
0x1001e2299: mov rcx, qword ptr [r12 + 0x140]
0x1001e22a1: mov rcx, qword ptr [rcx + 0x20]
0x1001e22a5: mov qword ptr [rax], rcx
0x1001e22a8: mov rcx, qword ptr [r12 + 0x140]
0x1001e22b0: mov rcx, qword ptr [rcx + 0x30]
0x1001e22b4: mov qword ptr [rax + 8], rcx
0x1001e22b8: mov rcx, qword ptr [r12 + 0x140]
0x1001e22c0: mov rcx, qword ptr [rcx + 0x40]
0x1001e22c4: mov qword ptr [rax + 0x10], rcx
0x1001e22c8: mov rcx, qword ptr [r12 + 0x140]
0x1001e22d0: mov rcx, qword ptr [rcx + 0x50]
0x1001e22d4: mov qword ptr [rax + 0x18], rcx
0x1001e22d8: mov rax, qword ptr [rip + 0xa2b5f9] ; 0x100c0d8d8
0x1001e22df: mov rax, qword ptr [rax]
0x1001e22e2: cmp rax, qword ptr [rsp + 0x420]
0x1001e22ea: jne 0x1001e22fb
0x1001e22ec: lea rsp, [rbp - 0x28]
0x1001e22f0: pop rbx
0x1001e22f1: pop r12
0x1001e22f3: pop r13
0x1001e22f5: pop r14
0x1001e22f7: pop r15
0x1001e22f9: pop rbp
0x1001e22fa: ret 
0x1001e22fb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
