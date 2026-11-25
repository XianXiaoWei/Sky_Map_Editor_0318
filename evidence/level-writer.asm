0x1003f1450: push rbp
0x1003f1451: mov rbp, rsp
0x1003f1454: push r15
0x1003f1456: push r14
0x1003f1458: push r13
0x1003f145a: push r12
0x1003f145c: push rbx
0x1003f145d: sub rsp, 0x638
0x1003f1464: mov qword ptr [rbp - 0x500], rdx
0x1003f146b: mov r14, rsi
0x1003f146e: mov r12, rdi
0x1003f1471: mov rax, qword ptr [rip + 0x81c460]
0x1003f1478: mov rax, qword ptr [rax]
0x1003f147b: mov qword ptr [rbp - 0x30], rax
0x1003f147f: mov edi, 0x1800000
0x1003f1484: call 0x1007e8b20
0x1003f1489: mov rbx, rax
0x1003f148c: mov edi, 0x1800000
0x1003f1491: call 0x1007e8b20
0x1003f1496: mov qword ptr [rbp - 0x5a0], rax
0x1003f149d: lea rdi, [rbp - 0x660]
0x1003f14a4: mov esi, 1
0x1003f14a9: mov ecx, 0x1800000
0x1003f14ae: mov qword ptr [rbp - 0x590], rbx
0x1003f14b5: mov rdx, rbx
0x1003f14b8: call 0x10076b710
0x1003f14bd: lea r15, [rbp - 0x118]
0x1003f14c4: lea r13, [rbp - 0x260]
0x1003f14cb: mov rax, qword ptr [rip + 0x81904e]
0x1003f14d2: lea rcx, [rax + 0x18]
0x1003f14d6: mov qword ptr [rbp - 0x4a0], rcx
0x1003f14dd: mov qword ptr [rbp - 0x268], rcx
0x1003f14e4: add rax, 0x40
0x1003f14e8: mov qword ptr [rbp - 0x4a8], rax
0x1003f14ef: mov qword ptr [rbp - 0x118], rax
0x1003f14f6: mov rdi, r15
0x1003f14f9: mov rsi, r13
0x1003f14fc: call 0x100aa2450
0x1003f1501: mov qword ptr [rbp - 0x90], 0
0x1003f150c: mov dword ptr [rbp - 0x88], 0xffffffff
0x1003f1516: mov rax, qword ptr [rip + 0x81c0ab]
0x1003f151d: lea rcx, [rax + 0x18]
0x1003f1521: mov qword ptr [rbp - 0x488], rcx
0x1003f1528: mov qword ptr [rbp - 0x268], rcx
0x1003f152f: add rax, 0x40
0x1003f1533: mov qword ptr [rbp - 0x490], rax
0x1003f153a: mov qword ptr [rbp - 0x118], rax
0x1003f1541: lea rsi, [rip + 0x7955d1]
0x1003f1548: mov edx, 2
0x1003f154d: mov rdi, r13
0x1003f1550: call 0x1007a56a0
0x1003f1555: lea rsi, [rip + 0x7955cb]
0x1003f155c: lea rdi, [rbp - 0x268]
0x1003f1563: mov edx, 0xd
0x1003f1568: call 0x100011930
0x1003f156d: mov rbx, rax
0x1003f1570: mov rdi, r14
0x1003f1573: call 0x100aa2c7e
0x1003f1578: mov rdi, rbx
0x1003f157b: mov rsi, r14
0x1003f157e: mov rdx, rax
0x1003f1581: call 0x100011930
0x1003f1586: mov rax, qword ptr [rbp - 0x488]
0x1003f158d: mov qword ptr [rbp - 0x268], rax
0x1003f1594: mov rax, qword ptr [rbp - 0x490]
0x1003f159b: mov qword ptr [rbp - 0x118], rax
0x1003f15a2: mov rdi, r13
0x1003f15a5: call 0x1007a58d0
0x1003f15aa: mov rsi, qword ptr [rip + 0x818fcf]
0x1003f15b1: add rsi, 8
0x1003f15b5: lea rdi, [rbp - 0x268]
0x1003f15bc: mov qword ptr [rbp - 0x470], rsi
0x1003f15c3: call 0x100aa23ba
0x1003f15c8: mov rdi, r15
0x1003f15cb: call 0x100aa245c
0x1003f15d0: lea r13, [rbp - 0xc8]
0x1003f15d7: lea r15, [rbp - 0x260]
0x1003f15de: mov rax, qword ptr [rip + 0x818f4b]
0x1003f15e5: lea rcx, [rax + 0x18]
0x1003f15e9: mov qword ptr [rbp - 0x268], rcx
0x1003f15f0: add rax, 0x40
0x1003f15f4: mov qword ptr [rbp - 0xc8], rax
0x1003f15fb: mov rdi, r13
0x1003f15fe: mov rsi, r15
0x1003f1601: call 0x100aa2450
0x1003f1606: mov qword ptr [rbp - 0x40], 0
0x1003f160e: mov dword ptr [rbp - 0x38], 0xffffffff
0x1003f1615: mov rax, qword ptr [rip + 0x81c264]
0x1003f161c: lea rcx, [rax + 0x18]
0x1003f1620: mov qword ptr [rbp - 0x478], rcx
0x1003f1627: mov qword ptr [rbp - 0x268], rcx
0x1003f162e: add rax, 0x40
0x1003f1632: mov qword ptr [rbp - 0x480], rax
0x1003f1639: mov qword ptr [rbp - 0xc8], rax
0x1003f1640: mov rdi, r15
0x1003f1643: call 0x1003f9340
0x1003f1648: cmp qword ptr [rbp - 0x1e8], 0
0x1003f1650: je 0x1003f1676
0x1003f1652: mov rax, qword ptr [rbp - 0x268]
0x1003f1659: mov rax, qword ptr [rax - 0x18]
0x1003f165d: lea rdi, [rbp + rax - 0x268]
0x1003f1665: mov esi, dword ptr [rbp + rax - 0x248]
0x1003f166c: or esi, 4
0x1003f166f: call 0x100aa2456
0x1003f1674: jmp 0x1003f169b
0x1003f1676: lea rsi, [rip + 0x795843]
0x1003f167d: mov rdi, r14
0x1003f1680: call 0x100aa274a
0x1003f1685: mov qword ptr [rbp - 0x1e8], rax
0x1003f168c: test rax, rax
0x1003f168f: je 0x1003f1652
0x1003f1691: mov dword ptr [rbp - 0xd8], 0x34
0x1003f169b: vxorps xmm0, xmm0, xmm0
0x1003f169f: vmovaps xmmword ptr [rbp - 0x280], xmm0
0x1003f16a7: mov dword ptr [rbp - 0x270], 0
0x1003f16b1: movabs rax, 0x34304c564c
0x1003f16bb: mov qword ptr [rbp - 0x5a8], rax
0x1003f16c2: lea rdi, [rbp - 0x660]
0x1003f16c9: lea rsi, [rbp - 0x5a8]
0x1003f16d0: mov edx, 8
0x1003f16d5: call 0x10076a0a0
0x1003f16da: lea rdi, [rbp - 0x660]
0x1003f16e1: call 0x10076b900
0x1003f16e6: lea rsi, [r12 + 0xb0]
0x1003f16ee: lea rdi, [rbp - 0x660]
0x1003f16f5: call 0x10076a360
0x1003f16fa: add r12, 0xc0
0x1003f1701: lea rdi, [rbp - 0x660]
0x1003f1708: mov rsi, r12
0x1003f170b: call 0x10076a360
0x1003f1710: mov rax, qword ptr [rbp - 0x500]
0x1003f1717: cmp dword ptr [rax + 0x38], 0
0x1003f171b: je 0x1003f220f
0x1003f1721: mov dword ptr [rbp - 0x4ac], 0
0x1003f172b: lea rdi, [rbp - 0x468]
0x1003f1732: mov ebx, 0
0x1003f1737: mov dword ptr [rbp - 0x4d8], 0
0x1003f1741: mov dword ptr [rbp - 0x4d4], 0
0x1003f174b: mov dword ptr [rbp - 0x4ec], 0
0x1003f1755: mov dword ptr [rbp - 0x4e8], 0
0x1003f175f: mov dword ptr [rbp - 0x4e4], 0
0x1003f1769: mov dword ptr [rbp - 0x4e0], 0
0x1003f1773: mov dword ptr [rbp - 0x4d0], 0
0x1003f177d: mov dword ptr [rbp - 0x4dc], 0
0x1003f1787: xor r14d, r14d
0x1003f178a: mov dword ptr [rbp - 0x4b4], 0
0x1003f1794: mov dword ptr [rbp - 0x4cc], 0
0x1003f179e: mov esi, 1
0x1003f17a3: mov ecx, 0x1800000
0x1003f17a8: mov rdx, qword ptr [rbp - 0x5a0]
0x1003f17af: call 0x100769c80
0x1003f17b4: lea r12, [rbp - 0x460]
0x1003f17bb: mov rdi, r12
0x1003f17be: call 0x100769850
0x1003f17c3: mov r15, r13
0x1003f17c6: mov dword ptr [rbp - 0x514], eax
0x1003f17cc: mov qword ptr [rbp - 0x588], rbx
0x1003f17d3: mov ebx, ebx
0x1003f17d5: mov rax, qword ptr [rbp - 0x500]
0x1003f17dc: mov r13, qword ptr [rax + 0x30]
0x1003f17e0: mov rdi, r12
0x1003f17e3: mov qword ptr [rbp - 0x598], rbx
0x1003f17ea: call 0x100769850
0x1003f17ef: mov dword ptr [rbp - 0x578], eax
0x1003f17f5: shl rbx, 6
0x1003f17f9: mov qword ptr [rbp - 0x4c0], rbx
0x1003f1800: lea r12, [r13 + rbx]
0x1003f1805: lea rdi, [rbp - 0x468]
0x1003f180c: mov rsi, r12
0x1003f180f: call 0x10076a280
0x1003f1814: mov rbx, r13
0x1003f1817: mov dword ptr [rbp - 0x4b0], r14d
0x1003f181e: cmp dword ptr [r12], 0
0x1003f1823: mov qword ptr [rbp - 0x4c8], rbx
0x1003f182a: mov r13, r15
0x1003f182d: mov rcx, r12
0x1003f1830: je 0x1003f1980
0x1003f1836: mov rax, qword ptr [rbp - 0x4c0]
0x1003f183d: lea rsi, [rbx + rax + 0x18]
0x1003f1842: xor r12d, r12d
0x1003f1845: mov qword ptr [rbp - 0x568], rcx
0x1003f184c: mov qword ptr [rbp - 0x508], rsi
0x1003f1853: mov r15, r13
0x1003f1856: mov r14, qword ptr [rsi]
0x1003f1859: mov r12d, r12d
0x1003f185c: lea rbx, [r12 + r12*2]
0x1003f1860: shl rbx, 4
0x1003f1864: lea rsi, [r14 + rbx]
0x1003f1868: lea r13, [rbp - 0x468]
0x1003f186f: mov rdi, r13
0x1003f1872: call 0x10076a5d0
0x1003f1877: lea rsi, [r14 + rbx + 0x18]
0x1003f187c: mov rdi, r13
0x1003f187f: call 0x10076a240
0x1003f1884: lea rsi, [r14 + rbx + 0x1c]
0x1003f1889: mov rdi, r13
0x1003f188c: mov qword ptr [rbp - 0x498], rsi
0x1003f1893: call 0x10076a280
0x1003f1898: lea rsi, [r14 + rbx + 0x20]
0x1003f189d: mov rdi, r13
0x1003f18a0: mov qword ptr [rbp - 0x510], rsi
0x1003f18a7: call 0x10076aae0
0x1003f18ac: mov rax, qword ptr [rbp - 0x498]
0x1003f18b3: cmp dword ptr [rax], 0
0x1003f18b6: je 0x1003f1958
0x1003f18bc: lea r13, [r14 + rbx + 0x28]
0x1003f18c1: xor r14d, r14d
0x1003f18c4: nop word ptr cs:[rax + rax]
0x1003f18d0: mov r14d, r14d
0x1003f18d3: lea r15, [r14 + r14*2]
0x1003f18d7: lea rsi, [r15*8]
0x1003f18df: add rsi, qword ptr [r13]
0x1003f18e3: lea rbx, [rbp - 0x468]
0x1003f18ea: mov rdi, rbx
0x1003f18ed: call 0x10076a280
0x1003f18f2: mov rax, qword ptr [r13]
0x1003f18f6: lea rsi, [rax + r15*8 + 4]
0x1003f18fb: mov rdi, rbx
0x1003f18fe: call 0x10076a280
0x1003f1903: mov rcx, qword ptr [r13]
0x1003f1907: mov rsi, qword ptr [rcx + r15*8 + 8]
0x1003f190c: mov eax, 1
0x1003f1911: mov rdx, qword ptr [rbp - 0x510]
0x1003f1918: cmp byte ptr [rdx], 0
0x1003f191b: jne 0x1003f1921
0x1003f191d: mov eax, dword ptr [rcx + r15*8]
0x1003f1921: shl eax, 2
0x1003f1924: lea edx, [rax + rax*2]
0x1003f1927: mov rdi, rbx
0x1003f192a: call 0x10076a0a0
0x1003f192f: mov rax, qword ptr [r13]
0x1003f1933: mov rsi, qword ptr [rax + r15*8 + 0x10]
0x1003f1938: mov edx, dword ptr [rax + r15*8 + 4]
0x1003f193d: mov rdi, rbx
0x1003f1940: call 0x10076a0a0
0x1003f1945: inc r14d
0x1003f1948: mov rax, qword ptr [rbp - 0x498]
0x1003f194f: cmp r14d, dword ptr [rax]
0x1003f1952: jb 0x1003f18d0
0x1003f1958: inc r12d
0x1003f195b: mov rcx, qword ptr [rbp - 0x568]
0x1003f1962: cmp r12d, dword ptr [rcx]
0x1003f1965: lea r13, [rbp - 0xc8]
0x1003f196c: mov rbx, qword ptr [rbp - 0x4c8]
0x1003f1973: mov rsi, qword ptr [rbp - 0x508]
0x1003f197a: jb 0x1003f1853
0x1003f1980: lea r12, [rbp - 0x460]
0x1003f1987: mov rdi, r12
0x1003f198a: call 0x100769850
0x1003f198f: mov r15d, eax
0x1003f1992: mov rdi, r12
0x1003f1995: call 0x100769850
0x1003f199a: mov dword ptr [rbp - 0x568], eax
0x1003f19a0: mov dword ptr [rbp - 0x510], r15d
0x1003f19a7: mov rax, qword ptr [rbp - 0x4c0]
0x1003f19ae: lea r15, [rbx + rax + 4]
0x1003f19b3: lea rdi, [rbp - 0x468]
0x1003f19ba: mov rsi, r15
0x1003f19bd: lea r14, [rbp - 0x260]
0x1003f19c4: call 0x10076a280
0x1003f19c9: cmp dword ptr [r15], 0
0x1003f19cd: mov rcx, r15
0x1003f19d0: je 0x1003f1d05
0x1003f19d6: mov rax, qword ptr [rbp - 0x4c0]
0x1003f19dd: lea rdx, [rbx + rax + 0x20]
0x1003f19e2: xor esi, esi
0x1003f19e4: xor r13d, r13d
0x1003f19e7: mov r15, r14
0x1003f19ea: mov qword ptr [rbp - 0x560], rcx
0x1003f19f1: mov qword ptr [rbp - 0x558], rdx
0x1003f19f8: mov r14, qword ptr [rdx]
0x1003f19fb: mov rax, qword ptr [r14 + r13 + 0xb8]
0x1003f1a03: test rax, rax
0x1003f1a06: mov qword ptr [rbp - 0x498], rsi
0x1003f1a0d: je 0x1003f1a14
0x1003f1a0f: mov eax, dword ptr [rax + 4]
0x1003f1a12: jmp 0x1003f1a19
0x1003f1a14: mov eax, 0xffffffff
0x1003f1a19: mov dword ptr [rbp - 0x550], eax
0x1003f1a1f: lea rbx, [rbp - 0x468]
0x1003f1a26: mov rdi, rbx
0x1003f1a29: lea rsi, [rbp - 0x550]
0x1003f1a30: call 0x10076a280
0x1003f1a35: lea rsi, [r14 + r13 + 0xc0]
0x1003f1a3d: mov rdi, rbx
0x1003f1a40: call 0x10076aae0
0x1003f1a45: lea rsi, [r14 + r13 + 0xc1]
0x1003f1a4d: mov rdi, rbx
0x1003f1a50: call 0x10076aae0
0x1003f1a55: lea rsi, [r14 + r13]
0x1003f1a59: mov rdi, rbx
0x1003f1a5c: call 0x10076a360
0x1003f1a61: lea rsi, [r14 + r13 + 0x10]
0x1003f1a66: mov rdi, rbx
0x1003f1a69: call 0x10076a360
0x1003f1a6e: lea rsi, [r14 + r13 + 0x20]
0x1003f1a73: mov rdi, rbx
0x1003f1a76: call 0x10076a280
0x1003f1a7b: lea rsi, [r14 + r13 + 0x24]
0x1003f1a80: mov rdi, rbx
0x1003f1a83: call 0x10076a280
0x1003f1a88: mov rdi, r12
0x1003f1a8b: call 0x100769850
0x1003f1a90: mov ebx, eax
0x1003f1a92: mov rsi, qword ptr [r14 + r13 + 0x28]
0x1003f1a97: mov eax, dword ptr [r14 + r13 + 0x20]
0x1003f1a9c: shl eax, 2
0x1003f1a9f: lea edx, [rax + rax*8]
0x1003f1aa2: lea rdi, [rbp - 0x468]
0x1003f1aa9: call 0x10076a0a0
0x1003f1aae: mov rdi, r12
0x1003f1ab1: call 0x100769850
0x1003f1ab6: mov dword ptr [rbp - 0x4f4], eax
0x1003f1abc: mov dword ptr [rbp - 0x508], ebx
0x1003f1ac2: lea rsi, [r14 + r13 + 0x38]
0x1003f1ac7: lea rbx, [rbp - 0x468]
0x1003f1ace: mov rdi, rbx
0x1003f1ad1: call 0x10076a280
0x1003f1ad6: mov rsi, qword ptr [r14 + r13 + 0x40]
0x1003f1adb: mov edx, dword ptr [r14 + r13 + 0x38]
0x1003f1ae0: mov rdi, rbx
0x1003f1ae3: call 0x10076a0a0
0x1003f1ae8: mov rdi, r12
0x1003f1aeb: call 0x100769850
0x1003f1af0: mov dword ptr [rbp - 0x4f0], eax
0x1003f1af6: lea rsi, [r14 + r13 + 0x50]
0x1003f1afb: lea rbx, [rbp - 0x468]
0x1003f1b02: mov rdi, rbx
0x1003f1b05: call 0x10076a360
0x1003f1b0a: lea rsi, [r14 + r13 + 0x60]
0x1003f1b0f: mov rdi, rbx
0x1003f1b12: call 0x10076a360
0x1003f1b17: lea rsi, [r14 + r13 + 0x70]
0x1003f1b1c: mov rdi, rbx
0x1003f1b1f: call 0x10076a2a0
0x1003f1b24: lea rsi, [r14 + r13 + 0x74]
0x1003f1b29: mov rdi, rbx
0x1003f1b2c: call 0x10076a280
0x1003f1b31: lea rsi, [r14 + r13 + 0x78]
0x1003f1b36: mov rdi, rbx
0x1003f1b39: call 0x10076a280
0x1003f1b3e: lea rsi, [r14 + r13 + 0x7c]
0x1003f1b43: mov rdi, rbx
0x1003f1b46: call 0x10076a280
0x1003f1b4b: lea rsi, [r14 + r13 + 0x80]
0x1003f1b53: mov rdi, rbx
0x1003f1b56: call 0x10076a280
0x1003f1b5b: mov rsi, qword ptr [r14 + r13 + 0x88]
0x1003f1b63: mov edx, dword ptr [r14 + r13 + 0x80]
0x1003f1b6b: shl edx, 3
0x1003f1b6e: mov rdi, rbx
0x1003f1b71: call 0x10076a0a0
0x1003f1b76: mov rdi, r12
0x1003f1b79: call 0x100769850
0x1003f1b7e: mov ebx, eax
0x1003f1b80: mov rdi, r12
0x1003f1b83: call 0x100769850
0x1003f1b88: mov dword ptr [rbp - 0x570], eax
0x1003f1b8e: mov dword ptr [rbp - 0x574], ebx
0x1003f1b94: lea rsi, [r14 + r13 + 0x90]
0x1003f1b9c: lea rbx, [rbp - 0x468]
0x1003f1ba3: mov rdi, rbx
0x1003f1ba6: call 0x10076a280
0x1003f1bab: lea rsi, [r14 + r13 + 0x94]
0x1003f1bb3: mov rdi, rbx
0x1003f1bb6: call 0x10076a280
0x1003f1bbb: lea rsi, [r14 + r13 + 0x98]
0x1003f1bc3: mov rdi, rbx
0x1003f1bc6: call 0x10076a280
0x1003f1bcb: mov rsi, qword ptr [r14 + r13 + 0xa0]
0x1003f1bd3: mov edx, dword ptr [r14 + r13 + 0x94]
0x1003f1bdb: shl edx, 2
0x1003f1bde: mov rdi, rbx
0x1003f1be1: call 0x10076a0a0
0x1003f1be6: mov rsi, qword ptr [r14 + r13 + 0xa8]
0x1003f1bee: mov edx, dword ptr [r14 + r13 + 0x98]
0x1003f1bf6: add edx, edx
0x1003f1bf8: mov rdi, rbx
0x1003f1bfb: call 0x10076a0a0
0x1003f1c00: mov rsi, qword ptr [r14 + r13 + 0xb0]
0x1003f1c08: mov edx, dword ptr [r14 + r13 + 0x90]
0x1003f1c10: shl edx, 2
0x1003f1c13: mov rdi, rbx
0x1003f1c16: call 0x10076a0a0
0x1003f1c1b: mov rdi, r12
0x1003f1c1e: mov r12, r15
0x1003f1c21: call 0x100769850
0x1003f1c26: mov r15d, eax
0x1003f1c29: cmp dword ptr [r14 + r13 + 0x94], 0
0x1003f1c32: je 0x1003f1c3d
0x1003f1c34: mov rbx, qword ptr [rbp - 0x4c8]
0x1003f1c3b: jmp 0x1003f1c8e
0x1003f1c3d: lea rdi, [rbp - 0x460]
0x1003f1c44: call 0x100769850
0x1003f1c49: mov rbx, qword ptr [rbp - 0x4c8]
0x1003f1c50: mov dword ptr [rbp - 0x56c], eax
0x1003f1c56: mov rsi, qword ptr [r14 + r13 + 0x30]
0x1003f1c5b: mov edx, dword ptr [r14 + r13 + 0x24]
0x1003f1c60: add edx, edx
0x1003f1c62: lea rdi, [rbp - 0x468]
0x1003f1c69: call 0x10076a0a0
0x1003f1c6e: lea rdi, [rbp - 0x460]
0x1003f1c75: call 0x100769850
0x1003f1c7a: mov ecx, dword ptr [rbp - 0x4e0]
0x1003f1c80: sub ecx, dword ptr [rbp - 0x56c]
0x1003f1c86: add ecx, eax
0x1003f1c88: mov dword ptr [rbp - 0x4e0], ecx
0x1003f1c8e: mov eax, dword ptr [rbp - 0x4ec]
0x1003f1c94: sub eax, dword ptr [rbp - 0x508]
0x1003f1c9a: add eax, dword ptr [rbp - 0x4f4]
0x1003f1ca0: mov dword ptr [rbp - 0x4ec], eax
0x1003f1ca6: mov eax, dword ptr [rbp - 0x4e8]
0x1003f1cac: sub eax, dword ptr [rbp - 0x4f0]
0x1003f1cb2: add eax, dword ptr [rbp - 0x574]
0x1003f1cb8: mov dword ptr [rbp - 0x4e8], eax
0x1003f1cbe: mov eax, dword ptr [rbp - 0x4e4]
0x1003f1cc4: sub eax, dword ptr [rbp - 0x570]
0x1003f1cca: add eax, r15d
0x1003f1ccd: mov dword ptr [rbp - 0x4e4], eax
0x1003f1cd3: add r13, 0xd0
0x1003f1cda: mov rsi, qword ptr [rbp - 0x498]
0x1003f1ce1: inc esi
0x1003f1ce3: mov rcx, qword ptr [rbp - 0x560]
0x1003f1cea: cmp dword ptr [rcx], esi
0x1003f1cec: mov r15, r12
0x1003f1cef: lea r12, [rbp - 0x460]
0x1003f1cf6: mov rdx, qword ptr [rbp - 0x558]
0x1003f1cfd: ja 0x1003f19f8
0x1003f1d03: jmp 0x1003f1d08
0x1003f1d05: mov r15, r14
0x1003f1d08: mov rdi, r12
0x1003f1d0b: call 0x100769850
0x1003f1d10: mov r14d, eax
0x1003f1d13: mov rdi, r12
0x1003f1d16: call 0x100769850
0x1003f1d1b: mov dword ptr [rbp - 0x4f4], eax
0x1003f1d21: mov dword ptr [rbp - 0x508], r14d
0x1003f1d28: mov rax, qword ptr [rbp - 0x4c0]
0x1003f1d2f: lea rbx, [rbx + rax + 0x10]
0x1003f1d34: lea rdi, [rbp - 0x468]
0x1003f1d3b: mov rsi, rbx
0x1003f1d3e: lea r13, [rbp - 0xc8]
0x1003f1d45: call 0x10076a280
0x1003f1d4a: cmp dword ptr [rbx], 0
0x1003f1d4d: je 0x1003f1ede
0x1003f1d53: mov rax, qword ptr [rbp - 0x4c8]
0x1003f1d5a: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f1d61: mov rbx, qword ptr [rax + rcx + 0x38]
0x1003f1d66: mov rdi, r12
0x1003f1d69: call 0x100769850
0x1003f1d6e: mov r14d, eax
0x1003f1d71: mov edx, 0xc
0x1003f1d76: lea r13, [rbp - 0x468]
0x1003f1d7d: mov rdi, r13
0x1003f1d80: mov rsi, rbx
0x1003f1d83: call 0x10076a0a0
0x1003f1d88: lea rsi, [rbx + 0xc]
0x1003f1d8c: mov edx, 0xc
0x1003f1d91: mov rdi, r13
0x1003f1d94: call 0x10076a0a0
0x1003f1d99: mov rsi, qword ptr [rbx + 0x18]
0x1003f1d9d: mov edx, dword ptr [rbx + 0x10]
0x1003f1da0: imul edx, dword ptr [rbx + 0xc]
0x1003f1da4: imul edx, dword ptr [rbx + 0x14]
0x1003f1da8: mov rdi, r13
0x1003f1dab: call 0x10076a0a0
0x1003f1db0: lea rsi, [rbx + 0x20]
0x1003f1db4: mov rdi, r13
0x1003f1db7: call 0x10076a280
0x1003f1dbc: mov rsi, qword ptr [rbx + 0x28]
0x1003f1dc0: mov eax, dword ptr [rbx + 0x20]
0x1003f1dc3: add eax, eax
0x1003f1dc5: lea edx, [rax + rax*2]
0x1003f1dc8: mov rdi, r13
0x1003f1dcb: call 0x10076a0a0
0x1003f1dd0: lea rsi, [rbx + 0x30]
0x1003f1dd4: mov rdi, r13
0x1003f1dd7: call 0x10076a280
0x1003f1ddc: lea rsi, [rbx + 0x34]
0x1003f1de0: mov rdi, r13
0x1003f1de3: call 0x10076a280
0x1003f1de8: lea rsi, [rbx + 0x38]
0x1003f1dec: mov rdi, r13
0x1003f1def: call 0x10076a280
0x1003f1df4: mov rsi, qword ptr [rbx + 0x40]
0x1003f1df8: mov edx, dword ptr [rbx + 0x30]
0x1003f1dfb: mov rdi, r13
0x1003f1dfe: call 0x10076a0a0
0x1003f1e03: mov rsi, qword ptr [rbx + 0x48]
0x1003f1e07: mov edx, dword ptr [rbx + 0x34]
0x1003f1e0a: mov rdi, r13
0x1003f1e0d: call 0x10076a0a0
0x1003f1e12: mov rsi, qword ptr [rbx + 0x50]
0x1003f1e16: mov edx, dword ptr [rbx + 0x38]
0x1003f1e19: mov rdi, r13
0x1003f1e1c: call 0x10076a0a0
0x1003f1e21: lea rsi, [rbx + 0x58]
0x1003f1e25: mov rdi, r13
0x1003f1e28: call 0x10076a2a0
0x1003f1e2d: lea rsi, [rbx + 0x5c]
0x1003f1e31: mov rdi, r13
0x1003f1e34: call 0x10076a280
0x1003f1e39: lea rsi, [rbx + 0x60]
0x1003f1e3d: mov rdi, r13
0x1003f1e40: call 0x10076a280
0x1003f1e45: mov rdi, r12
0x1003f1e48: call 0x100769850
0x1003f1e4d: mov r15d, eax
0x1003f1e50: mov dword ptr [rbp - 0x498], r14d
0x1003f1e57: mov rdi, r12
0x1003f1e5a: call 0x100769850
0x1003f1e5f: mov r14d, eax
0x1003f1e62: lea rsi, [rbx + 0x64]
0x1003f1e66: lea r13, [rbp - 0x468]
0x1003f1e6d: mov rdi, r13
0x1003f1e70: call 0x10076a280
0x1003f1e75: lea rsi, [rbx + 0x68]
0x1003f1e79: mov rdi, r13
0x1003f1e7c: call 0x10076a280
0x1003f1e81: mov rsi, qword ptr [rbx + 0x70]
0x1003f1e85: mov edx, dword ptr [rbx + 0x64]
0x1003f1e88: shl edx, 4
0x1003f1e8b: mov rdi, r13
0x1003f1e8e: call 0x10076a0a0
0x1003f1e93: mov rsi, qword ptr [rbx + 0x78]
0x1003f1e97: mov edx, dword ptr [rbx + 0x68]
0x1003f1e9a: add edx, edx
0x1003f1e9c: mov rdi, r13
0x1003f1e9f: call 0x10076a0a0
0x1003f1ea4: mov rdi, r12
0x1003f1ea7: call 0x100769850
0x1003f1eac: mov ecx, dword ptr [rbp - 0x4dc]
0x1003f1eb2: sub ecx, dword ptr [rbp - 0x498]
0x1003f1eb8: add ecx, r15d
0x1003f1ebb: mov dword ptr [rbp - 0x4dc], ecx
0x1003f1ec1: mov ecx, dword ptr [rbp - 0x4b0]
0x1003f1ec7: sub ecx, r14d
0x1003f1eca: mov ebx, ecx
0x1003f1ecc: add ebx, eax
0x1003f1ece: lea r15, [rbp - 0x260]
0x1003f1ed5: lea r13, [rbp - 0xc8]
0x1003f1edc: jmp 0x1003f1ee4
0x1003f1ede: mov ebx, dword ptr [rbp - 0x4b0]
0x1003f1ee4: mov rdi, r12
0x1003f1ee7: call 0x100769850
0x1003f1eec: mov dword ptr [rbp - 0x4f0], eax
0x1003f1ef2: mov rdi, r12
0x1003f1ef5: call 0x100769850
0x1003f1efa: mov dword ptr [rbp - 0x560], eax
0x1003f1f00: mov rax, qword ptr [rbp - 0x4c8]
0x1003f1f07: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f1f0e: mov eax, dword ptr [rax + rcx + 8]
0x1003f1f12: mov dword ptr [rbp - 0x550], eax
0x1003f1f18: lea rdi, [rbp - 0x468]
0x1003f1f1f: lea rsi, [rbp - 0x550]
0x1003f1f26: call 0x10076a280
0x1003f1f2b: mov dword ptr [rbp - 0x4b0], ebx
0x1003f1f31: cmp dword ptr [rbp - 0x550], 0
0x1003f1f38: je 0x1003f1fc9
0x1003f1f3e: mov rax, qword ptr [rbp - 0x4c8]
0x1003f1f45: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f1f4c: lea rax, [rax + rcx + 0x28]
0x1003f1f51: mov qword ptr [rbp - 0x498], rax
0x1003f1f58: xor r13d, r13d
0x1003f1f5b: mov rax, qword ptr [rbp - 0x498]
0x1003f1f62: mov r12, qword ptr [rax]
0x1003f1f65: mov r13d, r13d
0x1003f1f68: mov rbx, r13
0x1003f1f6b: shl rbx, 5
0x1003f1f6f: lea r15, [r12 + rbx]
0x1003f1f73: lea r14, [rbp - 0x468]
0x1003f1f7a: mov rdi, r14
0x1003f1f7d: mov rsi, r15
0x1003f1f80: call 0x10076a280
0x1003f1f85: mov rsi, qword ptr [r12 + rbx + 8]
0x1003f1f8a: mov eax, dword ptr [r15]
0x1003f1f8d: shl eax, 3
0x1003f1f90: lea edx, [rax + rax*4]
0x1003f1f93: mov rdi, r14
0x1003f1f96: call 0x10076a0a0
0x1003f1f9b: lea r15, [r12 + rbx + 0x10]
0x1003f1fa0: mov rdi, r14
0x1003f1fa3: mov rsi, r15
0x1003f1fa6: call 0x10076a280
0x1003f1fab: mov rsi, qword ptr [r12 + rbx + 0x18]
0x1003f1fb0: mov edx, dword ptr [r15]
0x1003f1fb3: add edx, edx
0x1003f1fb5: mov rdi, r14
0x1003f1fb8: call 0x10076a0a0
0x1003f1fbd: inc r13d
0x1003f1fc0: cmp r13d, dword ptr [rbp - 0x550]
0x1003f1fc7: jb 0x1003f1f5b
0x1003f1fc9: lea r12, [rbp - 0x460]
0x1003f1fd0: mov rdi, r12
0x1003f1fd3: call 0x100769850
0x1003f1fd8: mov ebx, eax
0x1003f1fda: mov rdi, r12
0x1003f1fdd: call 0x100769850
0x1003f1fe2: mov dword ptr [rbp - 0x558], eax
0x1003f1fe8: mov dword ptr [rbp - 0x498], ebx
0x1003f1fee: mov rax, qword ptr [rbp - 0x4c8]
0x1003f1ff5: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f1ffc: lea rbx, [rax + rcx + 0xc]
0x1003f2001: lea rdi, [rbp - 0x468]
0x1003f2008: mov rsi, rbx
0x1003f200b: lea r13, [rbp - 0xc8]
0x1003f2012: lea r15, [rbp - 0x260]
0x1003f2019: call 0x10076a280
0x1003f201e: cmp dword ptr [rbx], 0
0x1003f2021: je 0x1003f2098
0x1003f2023: mov rax, qword ptr [rbp - 0x4c8]
0x1003f202a: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f2031: mov rsi, qword ptr [rax + rcx + 0x30]
0x1003f2036: lea rdi, [rbp - 0x468]
0x1003f203d: call 0x10076a280
0x1003f2042: mov rax, qword ptr [rbp - 0x4c8]
0x1003f2049: mov rcx, qword ptr [rbp - 0x4c0]
0x1003f2050: lea rbx, [rax + rcx + 0x30]
0x1003f2055: mov rsi, qword ptr [rbx]
0x1003f2058: add rsi, 4
0x1003f205c: lea rdi, [rbp - 0x468]
0x1003f2063: call 0x10076a280
0x1003f2068: mov rax, qword ptr [rbx]
0x1003f206b: mov rsi, qword ptr [rax + 8]
0x1003f206f: mov edx, dword ptr [rax]
0x1003f2071: shl edx, 4
0x1003f2074: lea rdi, [rbp - 0x468]
0x1003f207b: call 0x10076a0a0
0x1003f2080: mov rax, qword ptr [rbx]
0x1003f2083: mov rsi, qword ptr [rax + 0x10]
0x1003f2087: mov edx, dword ptr [rax + 4]
0x1003f208a: add edx, edx
0x1003f208c: lea rdi, [rbp - 0x468]
0x1003f2093: call 0x10076a0a0
0x1003f2098: mov rdi, r12
0x1003f209b: call 0x100769850
0x1003f20a0: mov ebx, eax
0x1003f20a2: mov word ptr [rbp - 0x550], 0x4f4c
0x1003f20ab: mov byte ptr [rbp - 0x54e], 0x44
0x1003f20b2: mov rax, qword ptr [rbp - 0x588]
0x1003f20b9: lea eax, [rax + 0x30]
0x1003f20bc: mov byte ptr [rbp - 0x54d], al
0x1003f20c2: lea rdi, [rbp - 0x660]
0x1003f20c9: lea rsi, [rbp - 0x550]
0x1003f20d0: call 0x10076b860
0x1003f20d5: mov dword ptr [rbp - 0x4c0], ebx
0x1003f20db: mov r15, qword ptr [rbp - 0x458]
0x1003f20e2: mov rbx, qword ptr [rbp - 0x650]
0x1003f20e9: lea rdi, [rbp - 0x658]
0x1003f20f0: call 0x100769850
0x1003f20f5: mov r14d, eax
0x1003f20f8: mov rdi, r12
0x1003f20fb: call 0x100769850
0x1003f2100: mov r12d, eax
0x1003f2103: movsxd rax, r14d
0x1003f2106: add rbx, rax
0x1003f2109: mov edi, 1
0x1003f210e: mov rsi, r15
0x1003f2111: mov rdx, rbx
0x1003f2114: mov ecx, r12d
0x1003f2117: call 0x100780800
0x1003f211c: mov r15d, eax
0x1003f211f: lea rdi, [rbp - 0x660]
0x1003f2126: mov esi, r15d
0x1003f2129: mov rbx, qword ptr [rbp - 0x598]
0x1003f2130: call 0x100769ec0
0x1003f2135: lea rdi, [rbp - 0x460]
0x1003f213c: call 0x100769850
0x1003f2141: sub eax, dword ptr [rbp - 0x514]
0x1003f2147: add dword ptr [rbp + rbx*4 - 0x280], eax
0x1003f214e: mov eax, dword ptr [rbp - 0x4d8]
0x1003f2154: sub eax, dword ptr [rbp - 0x578]
0x1003f215a: add eax, dword ptr [rbp - 0x510]
0x1003f2160: mov dword ptr [rbp - 0x4d8], eax
0x1003f2166: mov eax, dword ptr [rbp - 0x4d4]
0x1003f216c: sub eax, dword ptr [rbp - 0x568]
0x1003f2172: add eax, dword ptr [rbp - 0x508]
0x1003f2178: mov dword ptr [rbp - 0x4d4], eax
0x1003f217e: mov eax, dword ptr [rbp - 0x4d0]
0x1003f2184: sub eax, dword ptr [rbp - 0x4f4]
0x1003f218a: add eax, dword ptr [rbp - 0x4f0]
0x1003f2190: mov dword ptr [rbp - 0x4d0], eax
0x1003f2196: mov eax, dword ptr [rbp - 0x4b4]
0x1003f219c: sub eax, dword ptr [rbp - 0x560]
0x1003f21a2: add eax, dword ptr [rbp - 0x498]
0x1003f21a8: mov dword ptr [rbp - 0x4b4], eax
0x1003f21ae: mov eax, dword ptr [rbp - 0x4cc]
0x1003f21b4: sub eax, dword ptr [rbp - 0x558]
0x1003f21ba: add eax, dword ptr [rbp - 0x4c0]
0x1003f21c0: mov dword ptr [rbp - 0x4cc], eax
0x1003f21c6: mov eax, dword ptr [rbp - 0x4ac]
0x1003f21cc: add eax, r12d
0x1003f21cf: sub eax, r15d
0x1003f21d2: mov dword ptr [rbp - 0x4ac], eax
0x1003f21d8: mov rbx, qword ptr [rbp - 0x588]
0x1003f21df: inc ebx
0x1003f21e1: mov rax, qword ptr [rbp - 0x500]
0x1003f21e8: cmp ebx, dword ptr [rax + 0x38]
0x1003f21eb: lea r15, [rbp - 0x260]
0x1003f21f2: mov r12, qword ptr [rbp - 0x490]
0x1003f21f9: mov r14d, dword ptr [rbp - 0x4b0]
0x1003f2200: lea rdi, [rbp - 0x468]
0x1003f2207: jb 0x1003f179e
0x1003f220d: jmp 0x1003f2287
0x1003f220f: mov dword ptr [rbp - 0x4cc], 0
0x1003f2219: mov dword ptr [rbp - 0x4b4], 0
0x1003f2223: xor r14d, r14d
0x1003f2226: mov dword ptr [rbp - 0x4dc], 0
0x1003f2230: mov dword ptr [rbp - 0x4d0], 0
0x1003f223a: mov dword ptr [rbp - 0x4e0], 0
0x1003f2244: mov dword ptr [rbp - 0x4e4], 0
0x1003f224e: mov dword ptr [rbp - 0x4e8], 0
0x1003f2258: mov dword ptr [rbp - 0x4ec], 0
0x1003f2262: mov dword ptr [rbp - 0x4d4], 0
0x1003f226c: mov dword ptr [rbp - 0x4d8], 0
0x1003f2276: mov dword ptr [rbp - 0x4ac], 0
0x1003f2280: mov r12, qword ptr [rbp - 0x490]
0x1003f2287: mov rax, qword ptr [rbp - 0x500]
0x1003f228e: vmovups ymm0, ymmword ptr [rax]
0x1003f2292: vmovups ymm1, ymmword ptr [rax + 0x10]
0x1003f2297: vmovups ymmword ptr [rbp - 0x540], ymm1
0x1003f229f: vmovups ymmword ptr [rbp - 0x550], ymm0
0x1003f22a7: cmp dword ptr [rbp - 0x534], 0
0x1003f22ae: je 0x1003f24a6
0x1003f22b4: lea rdi, [rbp - 0x468]
0x1003f22bb: mov esi, 1
0x1003f22c0: mov ecx, 0x1800000
0x1003f22c5: mov rdx, qword ptr [rbp - 0x5a0]
0x1003f22cc: vzeroupper 
0x1003f22cf: call 0x100769c80
0x1003f22d4: lea rdi, [rbp - 0x460]
0x1003f22db: call 0x100769850
0x1003f22e0: lea rdi, [rbp - 0x468]
0x1003f22e7: lea rsi, [rbp - 0x550]
0x1003f22ee: call 0x10076a2a0
0x1003f22f3: lea rsi, [rbp - 0x54c]
0x1003f22fa: lea rdi, [rbp - 0x468]
0x1003f2301: call 0x10076a2a0
0x1003f2306: lea rsi, [rbp - 0x548]
0x1003f230d: lea rdi, [rbp - 0x468]
0x1003f2314: call 0x10076a2a0
0x1003f2319: lea rsi, [rbp - 0x544]
0x1003f2320: lea rdi, [rbp - 0x468]
0x1003f2327: call 0x10076a2a0
0x1003f232c: lea rsi, [rbp - 0x540]
0x1003f2333: lea rdi, [rbp - 0x468]
0x1003f233a: call 0x10076a280
0x1003f233f: lea rsi, [rbp - 0x53c]
0x1003f2346: lea rdi, [rbp - 0x468]
0x1003f234d: call 0x10076a280
0x1003f2352: lea rsi, [rbp - 0x538]
0x1003f2359: lea rdi, [rbp - 0x468]
0x1003f2360: call 0x10076a280
0x1003f2365: lea rsi, [rbp - 0x534]
0x1003f236c: lea rdi, [rbp - 0x468]
0x1003f2373: call 0x10076a280
0x1003f2378: mov eax, dword ptr [rbp - 0x538]
0x1003f237e: imul eax, dword ptr [rbp - 0x540]
0x1003f2385: test eax, eax
0x1003f2387: je 0x1003f23cb
0x1003f2389: xor r12d, r12d
0x1003f238c: lea r15, [rbp - 0x468]
0x1003f2393: xor ebx, ebx
0x1003f2395: nop word ptr cs:[rax + rax]
0x1003f23a0: mov rsi, qword ptr [rbp - 0x530]
0x1003f23a7: add rsi, r12
0x1003f23aa: mov rdi, r15
0x1003f23ad: call 0x10076a280
0x1003f23b2: inc rbx
0x1003f23b5: mov eax, dword ptr [rbp - 0x538]
0x1003f23bb: imul eax, dword ptr [rbp - 0x540]
0x1003f23c2: add r12, 4
0x1003f23c6: cmp rbx, rax
0x1003f23c9: jb 0x1003f23a0
0x1003f23cb: cmp dword ptr [rbp - 0x534], 0
0x1003f23d2: je 0x1003f2404
0x1003f23d4: xor r12d, r12d
0x1003f23d7: lea r15, [rbp - 0x468]
0x1003f23de: xor ebx, ebx
0x1003f23e0: mov rsi, qword ptr [rbp - 0x528]
0x1003f23e7: add rsi, r12
0x1003f23ea: mov rdi, r15
0x1003f23ed: call 0x10076a280
0x1003f23f2: inc rbx
0x1003f23f5: mov eax, dword ptr [rbp - 0x534]
0x1003f23fb: add r12, 4
0x1003f23ff: cmp rbx, rax
0x1003f2402: jb 0x1003f23e0
0x1003f2404: mov dword ptr [rbp - 0x57c], 0x304c4f56
0x1003f240e: lea rdi, [rbp - 0x660]
0x1003f2415: lea rsi, [rbp - 0x57c]
0x1003f241c: call 0x10076b860
0x1003f2421: mov r15, qword ptr [rbp - 0x458]
0x1003f2428: lea rdi, [rbp - 0x658]
0x1003f242f: mov r12, qword ptr [rbp - 0x650]
0x1003f2436: call 0x100769850
0x1003f243b: mov r13d, eax
0x1003f243e: lea rdi, [rbp - 0x460]
0x1003f2445: call 0x100769850
0x1003f244a: mov ebx, eax
0x1003f244c: movsxd rax, r13d
0x1003f244f: add r12, rax
0x1003f2452: mov edi, 1
0x1003f2457: mov rsi, r15
0x1003f245a: mov rdx, r12
0x1003f245d: mov ecx, ebx
0x1003f245f: call 0x100780800
0x1003f2464: mov r15d, eax
0x1003f2467: lea rdi, [rbp - 0x660]
0x1003f246e: mov esi, r15d
0x1003f2471: lea r13, [rbp - 0xc8]
0x1003f2478: call 0x100769ec0
0x1003f247d: mov r12, qword ptr [rbp - 0x490]
0x1003f2484: lea rdi, [rbp - 0x460]
0x1003f248b: call 0x100769850
0x1003f2490: add ebx, dword ptr [rbp - 0x4ac]
0x1003f2496: sub ebx, r15d
0x1003f2499: mov dword ptr [rbp - 0x4ac], ebx
0x1003f249f: lea r15, [rbp - 0x260]
0x1003f24a6: lea rdi, [rbp - 0x660]
0x1003f24ad: vzeroupper 
0x1003f24b0: call 0x10076b940
0x1003f24b5: mov dword ptr [rbp - 0x4b0], r14d
0x1003f24bc: lea rdi, [rbp - 0x658]
0x1003f24c3: call 0x100769850
0x1003f24c8: mov r14d, eax
0x1003f24cb: lea rbx, [rbp - 0x318]
0x1003f24d2: lea r15, [rbp - 0x460]
0x1003f24d9: mov rax, qword ptr [rbp - 0x4a0]
0x1003f24e0: mov qword ptr [rbp - 0x468], rax
0x1003f24e7: mov rax, qword ptr [rbp - 0x4a8]
0x1003f24ee: mov qword ptr [rbp - 0x318], rax
0x1003f24f5: mov rdi, rbx
0x1003f24f8: mov rsi, r15
0x1003f24fb: call 0x100aa2450
0x1003f2500: mov qword ptr [rbp - 0x290], 0
0x1003f250b: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2515: mov rax, qword ptr [rbp - 0x488]
0x1003f251c: mov qword ptr [rbp - 0x468], rax
0x1003f2523: mov qword ptr [rbp - 0x318], r12
0x1003f252a: lea rsi, [rip + 0x7945e8]
0x1003f2531: mov edx, 2
0x1003f2536: mov rdi, r15
0x1003f2539: call 0x1007a56a0
0x1003f253e: lea rsi, [rip + 0x7945f0]
0x1003f2545: lea rdi, [rbp - 0x468]
0x1003f254c: mov edx, 0x18
0x1003f2551: call 0x100011930
0x1003f2556: add r14d, dword ptr [rbp - 0x4ac]
0x1003f255d: mov esi, r14d
0x1003f2560: shr esi, 0xa
0x1003f2563: mov rdi, rax
0x1003f2566: mov dword ptr [rbp - 0x510], esi
0x1003f256c: call 0x100aa23de
0x1003f2571: lea rsi, [rip + 0x7945d6]
0x1003f2578: mov edx, 3
0x1003f257d: mov rdi, rax
0x1003f2580: call 0x100011930
0x1003f2585: mov r13, qword ptr [rbp - 0x488]
0x1003f258c: mov qword ptr [rbp - 0x468], r13
0x1003f2593: mov qword ptr [rbp - 0x318], r12
0x1003f259a: mov rdi, r15
0x1003f259d: call 0x1007a58d0
0x1003f25a2: lea rdi, [rbp - 0x468]
0x1003f25a9: mov rsi, qword ptr [rbp - 0x470]
0x1003f25b0: call 0x100aa23ba
0x1003f25b5: mov rdi, rbx
0x1003f25b8: call 0x100aa245c
0x1003f25bd: lea rdi, [rbp - 0x318]
0x1003f25c4: lea r15, [rbp - 0x460]
0x1003f25cb: mov rax, qword ptr [rbp - 0x4a0]
0x1003f25d2: mov qword ptr [rbp - 0x468], rax
0x1003f25d9: mov rax, qword ptr [rbp - 0x4a8]
0x1003f25e0: mov qword ptr [rbp - 0x318], rax
0x1003f25e7: mov rsi, r15
0x1003f25ea: call 0x100aa2450
0x1003f25ef: mov qword ptr [rbp - 0x290], 0
0x1003f25fa: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2604: mov qword ptr [rbp - 0x468], r13
0x1003f260b: mov qword ptr [rbp - 0x318], r12
0x1003f2612: lea rsi, [rip + 0x794500]
0x1003f2619: mov edx, 2
0x1003f261e: mov rdi, r15
0x1003f2621: call 0x1007a56a0
0x1003f2626: lea rsi, [rip + 0x794525]
0x1003f262d: lea rdi, [rbp - 0x468]
0x1003f2634: mov edx, 0xe
0x1003f2639: call 0x100011930
0x1003f263e: mov ebx, dword ptr [rbp - 0x4d8]
0x1003f2644: mov esi, ebx
0x1003f2646: shr esi, 0xa
0x1003f2649: mov rdi, rax
0x1003f264c: call 0x100aa23de
0x1003f2651: lea rsi, [rip + 0x7883ac]
0x1003f2658: mov edx, 5
0x1003f265d: mov rdi, rax
0x1003f2660: call 0x100011930
0x1003f2665: mov rcx, qword ptr [rax]
0x1003f2668: mov rcx, qword ptr [rcx - 0x18]
0x1003f266c: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2675: mov ecx, ebx
0x1003f2677: vcvtsi2ss xmm0, xmm2, rcx
0x1003f267c: mov ecx, r14d
0x1003f267f: vcvtsi2ss xmm1, xmm2, rcx
0x1003f2684: vmovss dword ptr [rbp - 0x498], xmm1
0x1003f268c: vdivss xmm0, xmm0, xmm1
0x1003f2690: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5fd8]
0x1003f2698: mov rdi, rax
0x1003f269b: call 0x100aa23d2
0x1003f26a0: lea rsi, [rip + 0x788363]
0x1003f26a7: mov edx, 2
0x1003f26ac: mov rdi, rax
0x1003f26af: call 0x100011930
0x1003f26b4: mov rbx, qword ptr [rbp - 0x488]
0x1003f26bb: mov qword ptr [rbp - 0x468], rbx
0x1003f26c2: mov qword ptr [rbp - 0x318], r12
0x1003f26c9: mov rdi, r15
0x1003f26cc: call 0x1007a58d0
0x1003f26d1: lea rdi, [rbp - 0x468]
0x1003f26d8: mov rsi, qword ptr [rbp - 0x470]
0x1003f26df: call 0x100aa23ba
0x1003f26e4: lea rdi, [rbp - 0x318]
0x1003f26eb: call 0x100aa245c
0x1003f26f0: lea rdi, [rbp - 0x318]
0x1003f26f7: lea r13, [rbp - 0x460]
0x1003f26fe: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2705: mov qword ptr [rbp - 0x468], rax
0x1003f270c: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2713: mov qword ptr [rbp - 0x318], rax
0x1003f271a: mov rsi, r13
0x1003f271d: call 0x100aa2450
0x1003f2722: mov qword ptr [rbp - 0x290], 0
0x1003f272d: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2737: mov qword ptr [rbp - 0x468], rbx
0x1003f273e: mov qword ptr [rbp - 0x318], r12
0x1003f2745: lea rsi, [rip + 0x7943cd]
0x1003f274c: mov edx, 2
0x1003f2751: mov rdi, r13
0x1003f2754: call 0x1007a56a0
0x1003f2759: mov r14d, dword ptr [rbp - 0x4b4]
0x1003f2760: mov r15d, dword ptr [rbp - 0x4ec]
0x1003f2767: mov ebx, dword ptr [rbp - 0x4d4]
0x1003f276d: lea rsi, [rip + 0x7943ed]
0x1003f2774: lea rdi, [rbp - 0x468]
0x1003f277b: mov edx, 0x12
0x1003f2780: call 0x100011930
0x1003f2785: mov esi, ebx
0x1003f2787: shr esi, 0xa
0x1003f278a: mov rdi, rax
0x1003f278d: call 0x100aa23de
0x1003f2792: lea rsi, [rip + 0x78826b]
0x1003f2799: mov edx, 5
0x1003f279e: mov rdi, rax
0x1003f27a1: call 0x100011930
0x1003f27a6: mov dword ptr [rbp - 0x4b4], r14d
0x1003f27ad: mov rcx, qword ptr [rax]
0x1003f27b0: mov rcx, qword ptr [rcx - 0x18]
0x1003f27b4: mov qword ptr [rax + rcx + 0x10], 2
0x1003f27bd: mov ecx, ebx
0x1003f27bf: vcvtsi2ss xmm0, xmm2, rcx
0x1003f27c4: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f27cc: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5e9c]
0x1003f27d4: mov rdi, rax
0x1003f27d7: call 0x100aa23d2
0x1003f27dc: lea rsi, [rip + 0x788227]
0x1003f27e3: mov edx, 2
0x1003f27e8: mov rdi, rax
0x1003f27eb: call 0x100011930
0x1003f27f0: mov r14, qword ptr [rbp - 0x488]
0x1003f27f7: mov qword ptr [rbp - 0x468], r14
0x1003f27fe: mov qword ptr [rbp - 0x318], r12
0x1003f2805: mov rdi, r13
0x1003f2808: call 0x1007a58d0
0x1003f280d: lea rdi, [rbp - 0x468]
0x1003f2814: mov rsi, qword ptr [rbp - 0x470]
0x1003f281b: call 0x100aa23ba
0x1003f2820: lea rdi, [rbp - 0x318]
0x1003f2827: call 0x100aa245c
0x1003f282c: lea rdi, [rbp - 0x318]
0x1003f2833: lea r13, [rbp - 0x460]
0x1003f283a: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2841: mov qword ptr [rbp - 0x468], rax
0x1003f2848: mov rax, qword ptr [rbp - 0x4a8]
0x1003f284f: mov qword ptr [rbp - 0x318], rax
0x1003f2856: mov rsi, r13
0x1003f2859: call 0x100aa2450
0x1003f285e: mov qword ptr [rbp - 0x290], 0
0x1003f2869: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2873: mov qword ptr [rbp - 0x468], r14
0x1003f287a: mov qword ptr [rbp - 0x318], r12
0x1003f2881: lea rsi, [rip + 0x794291]
0x1003f2888: mov edx, 2
0x1003f288d: mov rdi, r13
0x1003f2890: call 0x1007a56a0
0x1003f2895: lea rsi, [rip + 0x7942d8]
0x1003f289c: lea rdi, [rbp - 0x468]
0x1003f28a3: mov edx, 0xd
0x1003f28a8: call 0x100011930
0x1003f28ad: mov ebx, dword ptr [rbp - 0x4e0]
0x1003f28b3: mov esi, ebx
0x1003f28b5: shr esi, 0xa
0x1003f28b8: mov rdi, rax
0x1003f28bb: call 0x100aa23de
0x1003f28c0: lea rsi, [rip + 0x78813d]
0x1003f28c7: mov edx, 5
0x1003f28cc: mov rdi, rax
0x1003f28cf: call 0x100011930
0x1003f28d4: mov rcx, qword ptr [rax]
0x1003f28d7: mov rcx, qword ptr [rcx - 0x18]
0x1003f28db: mov qword ptr [rax + rcx + 0x10], 2
0x1003f28e4: mov ecx, ebx
0x1003f28e6: vcvtsi2ss xmm0, xmm1, rcx
0x1003f28eb: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f28f3: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5d75]
0x1003f28fb: mov rdi, rax
0x1003f28fe: call 0x100aa23d2
0x1003f2903: lea rsi, [rip + 0x788100]
0x1003f290a: mov edx, 2
0x1003f290f: mov rdi, rax
0x1003f2912: call 0x100011930
0x1003f2917: mov r14, qword ptr [rbp - 0x488]
0x1003f291e: mov qword ptr [rbp - 0x468], r14
0x1003f2925: mov qword ptr [rbp - 0x318], r12
0x1003f292c: mov rdi, r13
0x1003f292f: call 0x1007a58d0
0x1003f2934: lea rdi, [rbp - 0x468]
0x1003f293b: mov rsi, qword ptr [rbp - 0x470]
0x1003f2942: call 0x100aa23ba
0x1003f2947: lea rdi, [rbp - 0x318]
0x1003f294e: call 0x100aa245c
0x1003f2953: lea r13, [rbp - 0x318]
0x1003f295a: lea rbx, [rbp - 0x460]
0x1003f2961: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2968: mov qword ptr [rbp - 0x468], rax
0x1003f296f: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2976: mov qword ptr [rbp - 0x318], rax
0x1003f297d: mov rdi, r13
0x1003f2980: mov rsi, rbx
0x1003f2983: call 0x100aa2450
0x1003f2988: mov qword ptr [rbp - 0x290], 0
0x1003f2993: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f299d: mov qword ptr [rbp - 0x468], r14
0x1003f29a4: mov qword ptr [rbp - 0x318], r12
0x1003f29ab: lea rsi, [rip + 0x794167]
0x1003f29b2: mov edx, 2
0x1003f29b7: mov rdi, rbx
0x1003f29ba: call 0x1007a56a0
0x1003f29bf: lea rsi, [rip + 0x7941bc]
0x1003f29c6: lea rdi, [rbp - 0x468]
0x1003f29cd: mov edx, 0xb
0x1003f29d2: call 0x100011930
0x1003f29d7: mov esi, r15d
0x1003f29da: shr esi, 0xa
0x1003f29dd: mov rdi, rax
0x1003f29e0: call 0x100aa23de
0x1003f29e5: lea rsi, [rip + 0x788018]
0x1003f29ec: mov edx, 5
0x1003f29f1: mov rdi, rax
0x1003f29f4: call 0x100011930
0x1003f29f9: mov rcx, qword ptr [rax]
0x1003f29fc: mov rcx, qword ptr [rcx - 0x18]
0x1003f2a00: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2a09: mov ecx, r15d
0x1003f2a0c: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2a11: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2a19: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5c4f]
0x1003f2a21: mov rdi, rax
0x1003f2a24: call 0x100aa23d2
0x1003f2a29: lea rsi, [rip + 0x787fda]
0x1003f2a30: mov edx, 2
0x1003f2a35: mov rdi, rax
0x1003f2a38: call 0x100011930
0x1003f2a3d: mov r14, qword ptr [rbp - 0x488]
0x1003f2a44: mov qword ptr [rbp - 0x468], r14
0x1003f2a4b: mov qword ptr [rbp - 0x318], r12
0x1003f2a52: mov rdi, rbx
0x1003f2a55: call 0x1007a58d0
0x1003f2a5a: lea rdi, [rbp - 0x468]
0x1003f2a61: mov rsi, qword ptr [rbp - 0x470]
0x1003f2a68: call 0x100aa23ba
0x1003f2a6d: mov rdi, r13
0x1003f2a70: call 0x100aa245c
0x1003f2a75: lea r13, [rbp - 0x318]
0x1003f2a7c: lea r15, [rbp - 0x460]
0x1003f2a83: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2a8a: mov qword ptr [rbp - 0x468], rax
0x1003f2a91: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2a98: mov qword ptr [rbp - 0x318], rax
0x1003f2a9f: mov rdi, r13
0x1003f2aa2: mov rsi, r15
0x1003f2aa5: call 0x100aa2450
0x1003f2aaa: mov qword ptr [rbp - 0x290], 0
0x1003f2ab5: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2abf: mov qword ptr [rbp - 0x468], r14
0x1003f2ac6: mov qword ptr [rbp - 0x318], r12
0x1003f2acd: lea rsi, [rip + 0x794045]
0x1003f2ad4: mov edx, 2
0x1003f2ad9: mov rdi, r15
0x1003f2adc: call 0x1007a56a0
0x1003f2ae1: lea rsi, [rip + 0x7940a6]
0x1003f2ae8: lea rdi, [rbp - 0x468]
0x1003f2aef: mov edx, 0xc
0x1003f2af4: call 0x100011930
0x1003f2af9: mov ebx, dword ptr [rbp - 0x4e8]
0x1003f2aff: mov esi, ebx
0x1003f2b01: shr esi, 0xa
0x1003f2b04: mov rdi, rax
0x1003f2b07: call 0x100aa23de
0x1003f2b0c: lea rsi, [rip + 0x787ef1]
0x1003f2b13: mov edx, 5
0x1003f2b18: mov rdi, rax
0x1003f2b1b: call 0x100011930
0x1003f2b20: mov rcx, qword ptr [rax]
0x1003f2b23: mov rcx, qword ptr [rcx - 0x18]
0x1003f2b27: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2b30: mov ecx, ebx
0x1003f2b32: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2b37: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2b3f: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5b29]
0x1003f2b47: mov rdi, rax
0x1003f2b4a: call 0x100aa23d2
0x1003f2b4f: lea rsi, [rip + 0x787eb4]
0x1003f2b56: mov edx, 2
0x1003f2b5b: mov rdi, rax
0x1003f2b5e: call 0x100011930
0x1003f2b63: mov r14, qword ptr [rbp - 0x488]
0x1003f2b6a: mov qword ptr [rbp - 0x468], r14
0x1003f2b71: mov qword ptr [rbp - 0x318], r12
0x1003f2b78: mov rdi, r15
0x1003f2b7b: call 0x1007a58d0
0x1003f2b80: lea rdi, [rbp - 0x468]
0x1003f2b87: mov rsi, qword ptr [rbp - 0x470]
0x1003f2b8e: call 0x100aa23ba
0x1003f2b93: mov rdi, r13
0x1003f2b96: call 0x100aa245c
0x1003f2b9b: lea r13, [rbp - 0x318]
0x1003f2ba2: lea r15, [rbp - 0x460]
0x1003f2ba9: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2bb0: mov qword ptr [rbp - 0x468], rax
0x1003f2bb7: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2bbe: mov qword ptr [rbp - 0x318], rax
0x1003f2bc5: mov rdi, r13
0x1003f2bc8: mov rsi, r15
0x1003f2bcb: call 0x100aa2450
0x1003f2bd0: mov qword ptr [rbp - 0x290], 0
0x1003f2bdb: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2be5: mov qword ptr [rbp - 0x468], r14
0x1003f2bec: mov qword ptr [rbp - 0x318], r12
0x1003f2bf3: lea rsi, [rip + 0x793f1f]
0x1003f2bfa: mov edx, 2
0x1003f2bff: mov rdi, r15
0x1003f2c02: call 0x1007a56a0
0x1003f2c07: lea rsi, [rip + 0x793f8d]
0x1003f2c0e: lea rdi, [rbp - 0x468]
0x1003f2c15: mov edx, 0xe
0x1003f2c1a: call 0x100011930
0x1003f2c1f: mov ebx, dword ptr [rbp - 0x4e4]
0x1003f2c25: mov esi, ebx
0x1003f2c27: shr esi, 0xa
0x1003f2c2a: mov rdi, rax
0x1003f2c2d: call 0x100aa23de
0x1003f2c32: lea rsi, [rip + 0x787dcb]
0x1003f2c39: mov edx, 5
0x1003f2c3e: mov rdi, rax
0x1003f2c41: call 0x100011930
0x1003f2c46: mov rcx, qword ptr [rax]
0x1003f2c49: mov rcx, qword ptr [rcx - 0x18]
0x1003f2c4d: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2c56: mov ecx, ebx
0x1003f2c58: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2c5d: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2c65: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5a03]
0x1003f2c6d: mov rdi, rax
0x1003f2c70: call 0x100aa23d2
0x1003f2c75: lea rsi, [rip + 0x787d8e]
0x1003f2c7c: mov edx, 2
0x1003f2c81: mov rdi, rax
0x1003f2c84: call 0x100011930
0x1003f2c89: mov r14, qword ptr [rbp - 0x488]
0x1003f2c90: mov qword ptr [rbp - 0x468], r14
0x1003f2c97: mov qword ptr [rbp - 0x318], r12
0x1003f2c9e: mov rdi, r15
0x1003f2ca1: call 0x1007a58d0
0x1003f2ca6: lea rdi, [rbp - 0x468]
0x1003f2cad: mov rsi, qword ptr [rbp - 0x470]
0x1003f2cb4: call 0x100aa23ba
0x1003f2cb9: mov rdi, r13
0x1003f2cbc: call 0x100aa245c
0x1003f2cc1: lea r13, [rbp - 0x318]
0x1003f2cc8: lea r15, [rbp - 0x460]
0x1003f2ccf: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2cd6: mov qword ptr [rbp - 0x468], rax
0x1003f2cdd: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2ce4: mov qword ptr [rbp - 0x318], rax
0x1003f2ceb: mov rdi, r13
0x1003f2cee: mov rsi, r15
0x1003f2cf1: call 0x100aa2450
0x1003f2cf6: mov qword ptr [rbp - 0x290], 0
0x1003f2d01: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2d0b: mov qword ptr [rbp - 0x468], r14
0x1003f2d12: mov qword ptr [rbp - 0x318], r12
0x1003f2d19: lea rsi, [rip + 0x793df9]
0x1003f2d20: mov edx, 2
0x1003f2d25: mov rdi, r15
0x1003f2d28: call 0x1007a56a0
0x1003f2d2d: lea rsi, [rip + 0x793e76]
0x1003f2d34: lea rdi, [rbp - 0x468]
0x1003f2d3b: mov edx, 0xa
0x1003f2d40: call 0x100011930
0x1003f2d45: mov ebx, dword ptr [rbp - 0x4d0]
0x1003f2d4b: mov esi, ebx
0x1003f2d4d: shr esi, 0xa
0x1003f2d50: mov rdi, rax
0x1003f2d53: call 0x100aa23de
0x1003f2d58: lea rsi, [rip + 0x787ca5]
0x1003f2d5f: mov edx, 5
0x1003f2d64: mov rdi, rax
0x1003f2d67: call 0x100011930
0x1003f2d6c: mov rcx, qword ptr [rax]
0x1003f2d6f: mov rcx, qword ptr [rcx - 0x18]
0x1003f2d73: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2d7c: mov ecx, ebx
0x1003f2d7e: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2d83: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2d8b: vmulss xmm0, xmm0, dword ptr [rip + 0x6b58dd]
0x1003f2d93: mov rdi, rax
0x1003f2d96: call 0x100aa23d2
0x1003f2d9b: lea rsi, [rip + 0x787c68]
0x1003f2da2: mov edx, 2
0x1003f2da7: mov rdi, rax
0x1003f2daa: call 0x100011930
0x1003f2daf: mov r14, qword ptr [rbp - 0x488]
0x1003f2db6: mov qword ptr [rbp - 0x468], r14
0x1003f2dbd: mov qword ptr [rbp - 0x318], r12
0x1003f2dc4: mov rdi, r15
0x1003f2dc7: call 0x1007a58d0
0x1003f2dcc: lea rdi, [rbp - 0x468]
0x1003f2dd3: mov rsi, qword ptr [rbp - 0x470]
0x1003f2dda: call 0x100aa23ba
0x1003f2ddf: mov rdi, r13
0x1003f2de2: call 0x100aa245c
0x1003f2de7: lea r13, [rbp - 0x318]
0x1003f2dee: lea r15, [rbp - 0x460]
0x1003f2df5: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2dfc: mov qword ptr [rbp - 0x468], rax
0x1003f2e03: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2e0a: mov qword ptr [rbp - 0x318], rax
0x1003f2e11: mov rdi, r13
0x1003f2e14: mov rsi, r15
0x1003f2e17: call 0x100aa2450
0x1003f2e1c: mov qword ptr [rbp - 0x290], 0
0x1003f2e27: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2e31: mov qword ptr [rbp - 0x468], r14
0x1003f2e38: mov qword ptr [rbp - 0x318], r12
0x1003f2e3f: lea rsi, [rip + 0x793cd3]
0x1003f2e46: mov edx, 2
0x1003f2e4b: mov rdi, r15
0x1003f2e4e: call 0x1007a56a0
0x1003f2e53: lea rsi, [rip + 0x793d5b]
0x1003f2e5a: lea rdi, [rbp - 0x468]
0x1003f2e61: mov edx, 0xc
0x1003f2e66: call 0x100011930
0x1003f2e6b: mov ebx, dword ptr [rbp - 0x4dc]
0x1003f2e71: mov esi, ebx
0x1003f2e73: shr esi, 0xa
0x1003f2e76: mov rdi, rax
0x1003f2e79: call 0x100aa23de
0x1003f2e7e: lea rsi, [rip + 0x787b7f]
0x1003f2e85: mov edx, 5
0x1003f2e8a: mov rdi, rax
0x1003f2e8d: call 0x100011930
0x1003f2e92: mov rcx, qword ptr [rax]
0x1003f2e95: mov rcx, qword ptr [rcx - 0x18]
0x1003f2e99: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2ea2: mov ecx, ebx
0x1003f2ea4: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2ea9: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2eb1: vmulss xmm0, xmm0, dword ptr [rip + 0x6b57b7]
0x1003f2eb9: mov rdi, rax
0x1003f2ebc: call 0x100aa23d2
0x1003f2ec1: lea rsi, [rip + 0x787b42]
0x1003f2ec8: mov edx, 2
0x1003f2ecd: mov rdi, rax
0x1003f2ed0: call 0x100011930
0x1003f2ed5: mov r14, qword ptr [rbp - 0x488]
0x1003f2edc: mov qword ptr [rbp - 0x468], r14
0x1003f2ee3: mov qword ptr [rbp - 0x318], r12
0x1003f2eea: mov rdi, r15
0x1003f2eed: call 0x1007a58d0
0x1003f2ef2: lea rdi, [rbp - 0x468]
0x1003f2ef9: mov rsi, qword ptr [rbp - 0x470]
0x1003f2f00: call 0x100aa23ba
0x1003f2f05: mov rdi, r13
0x1003f2f08: call 0x100aa245c
0x1003f2f0d: lea r13, [rbp - 0x318]
0x1003f2f14: lea r15, [rbp - 0x460]
0x1003f2f1b: mov rax, qword ptr [rbp - 0x4a0]
0x1003f2f22: mov qword ptr [rbp - 0x468], rax
0x1003f2f29: mov rax, qword ptr [rbp - 0x4a8]
0x1003f2f30: mov qword ptr [rbp - 0x318], rax
0x1003f2f37: mov rdi, r13
0x1003f2f3a: mov rsi, r15
0x1003f2f3d: call 0x100aa2450
0x1003f2f42: mov qword ptr [rbp - 0x290], 0
0x1003f2f4d: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f2f57: mov qword ptr [rbp - 0x468], r14
0x1003f2f5e: mov qword ptr [rbp - 0x318], r12
0x1003f2f65: lea rsi, [rip + 0x793bad]
0x1003f2f6c: mov edx, 2
0x1003f2f71: mov rdi, r15
0x1003f2f74: call 0x1007a56a0
0x1003f2f79: lea rsi, [rip + 0x793c42]
0x1003f2f80: lea rdi, [rbp - 0x468]
0x1003f2f87: mov edx, 0xa
0x1003f2f8c: call 0x100011930
0x1003f2f91: mov ebx, dword ptr [rbp - 0x4b0]
0x1003f2f97: mov esi, ebx
0x1003f2f99: shr esi, 0xa
0x1003f2f9c: mov rdi, rax
0x1003f2f9f: call 0x100aa23de
0x1003f2fa4: lea rsi, [rip + 0x787a59]
0x1003f2fab: mov edx, 5
0x1003f2fb0: mov rdi, rax
0x1003f2fb3: call 0x100011930
0x1003f2fb8: mov rcx, qword ptr [rax]
0x1003f2fbb: mov rcx, qword ptr [rcx - 0x18]
0x1003f2fbf: mov qword ptr [rax + rcx + 0x10], 2
0x1003f2fc8: mov ecx, ebx
0x1003f2fca: vcvtsi2ss xmm0, xmm1, rcx
0x1003f2fcf: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f2fd7: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5691]
0x1003f2fdf: mov rdi, rax
0x1003f2fe2: call 0x100aa23d2
0x1003f2fe7: lea rsi, [rip + 0x787a1c]
0x1003f2fee: mov edx, 2
0x1003f2ff3: mov rdi, rax
0x1003f2ff6: call 0x100011930
0x1003f2ffb: mov r14, qword ptr [rbp - 0x488]
0x1003f3002: mov qword ptr [rbp - 0x468], r14
0x1003f3009: mov qword ptr [rbp - 0x318], r12
0x1003f3010: mov rdi, r15
0x1003f3013: call 0x1007a58d0
0x1003f3018: lea rdi, [rbp - 0x468]
0x1003f301f: mov rsi, qword ptr [rbp - 0x470]
0x1003f3026: call 0x100aa23ba
0x1003f302b: mov rdi, r13
0x1003f302e: call 0x100aa245c
0x1003f3033: lea r13, [rbp - 0x318]
0x1003f303a: lea r15, [rbp - 0x460]
0x1003f3041: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3048: mov qword ptr [rbp - 0x468], rax
0x1003f304f: mov rax, qword ptr [rbp - 0x4a8]
0x1003f3056: mov qword ptr [rbp - 0x318], rax
0x1003f305d: mov rdi, r13
0x1003f3060: mov rsi, r15
0x1003f3063: call 0x100aa2450
0x1003f3068: mov qword ptr [rbp - 0x290], 0
0x1003f3073: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f307d: mov qword ptr [rbp - 0x468], r14
0x1003f3084: mov qword ptr [rbp - 0x318], r12
0x1003f308b: lea rsi, [rip + 0x793a87]
0x1003f3092: mov edx, 2
0x1003f3097: mov rdi, r15
0x1003f309a: call 0x1007a56a0
0x1003f309f: lea rsi, [rip + 0x793b27]
0x1003f30a6: lea rdi, [rbp - 0x468]
0x1003f30ad: mov edx, 0xa
0x1003f30b2: call 0x100011930
0x1003f30b7: mov ebx, dword ptr [rbp - 0x4b4]
0x1003f30bd: mov esi, ebx
0x1003f30bf: shr esi, 0xa
0x1003f30c2: mov rdi, rax
0x1003f30c5: call 0x100aa23de
0x1003f30ca: lea rsi, [rip + 0x787933]
0x1003f30d1: mov edx, 5
0x1003f30d6: mov rdi, rax
0x1003f30d9: call 0x100011930
0x1003f30de: mov rcx, qword ptr [rax]
0x1003f30e1: mov rcx, qword ptr [rcx - 0x18]
0x1003f30e5: mov qword ptr [rax + rcx + 0x10], 2
0x1003f30ee: mov ecx, ebx
0x1003f30f0: vcvtsi2ss xmm0, xmm1, rcx
0x1003f30f5: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f30fd: vmulss xmm0, xmm0, dword ptr [rip + 0x6b556b]
0x1003f3105: mov rdi, rax
0x1003f3108: call 0x100aa23d2
0x1003f310d: lea rsi, [rip + 0x7878f6]
0x1003f3114: mov edx, 2
0x1003f3119: mov rdi, rax
0x1003f311c: call 0x100011930
0x1003f3121: mov r14, qword ptr [rbp - 0x488]
0x1003f3128: mov qword ptr [rbp - 0x468], r14
0x1003f312f: mov qword ptr [rbp - 0x318], r12
0x1003f3136: mov rdi, r15
0x1003f3139: call 0x1007a58d0
0x1003f313e: lea rdi, [rbp - 0x468]
0x1003f3145: mov rsi, qword ptr [rbp - 0x470]
0x1003f314c: call 0x100aa23ba
0x1003f3151: mov rdi, r13
0x1003f3154: call 0x100aa245c
0x1003f3159: lea r15, [rbp - 0x318]
0x1003f3160: lea rbx, [rbp - 0x460]
0x1003f3167: mov rax, qword ptr [rbp - 0x4a0]
0x1003f316e: mov qword ptr [rbp - 0x468], rax
0x1003f3175: mov rax, qword ptr [rbp - 0x4a8]
0x1003f317c: mov qword ptr [rbp - 0x318], rax
0x1003f3183: mov rdi, r15
0x1003f3186: mov rsi, rbx
0x1003f3189: call 0x100aa2450
0x1003f318e: mov qword ptr [rbp - 0x290], 0
0x1003f3199: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f31a3: mov qword ptr [rbp - 0x468], r14
0x1003f31aa: mov qword ptr [rbp - 0x318], r12
0x1003f31b1: lea rsi, [rip + 0x793961]
0x1003f31b8: mov edx, 2
0x1003f31bd: mov rdi, rbx
0x1003f31c0: call 0x1007a56a0
0x1003f31c5: mov ebx, dword ptr [rbp - 0x4cc]
0x1003f31cb: lea rsi, [rip + 0x793a06]
0x1003f31d2: lea rdi, [rbp - 0x468]
0x1003f31d9: mov edx, 0x11
0x1003f31de: call 0x100011930
0x1003f31e3: mov esi, ebx
0x1003f31e5: shr esi, 0xa
0x1003f31e8: mov rdi, rax
0x1003f31eb: call 0x100aa23de
0x1003f31f0: lea rsi, [rip + 0x78780d]
0x1003f31f7: mov edx, 5
0x1003f31fc: mov rdi, rax
0x1003f31ff: call 0x100011930
0x1003f3204: mov rcx, qword ptr [rax]
0x1003f3207: mov rcx, qword ptr [rcx - 0x18]
0x1003f320b: mov qword ptr [rax + rcx + 0x10], 2
0x1003f3214: mov ecx, ebx
0x1003f3216: vcvtsi2ss xmm0, xmm1, rcx
0x1003f321b: vdivss xmm0, xmm0, dword ptr [rbp - 0x498]
0x1003f3223: vmulss xmm0, xmm0, dword ptr [rip + 0x6b5445]
0x1003f322b: mov rdi, rax
0x1003f322e: call 0x100aa23d2
0x1003f3233: lea rsi, [rip + 0x7877d0]
0x1003f323a: mov edx, 2
0x1003f323f: mov rdi, rax
0x1003f3242: call 0x100011930
0x1003f3247: mov r13, qword ptr [rbp - 0x488]
0x1003f324e: mov qword ptr [rbp - 0x468], r13
0x1003f3255: mov qword ptr [rbp - 0x318], r12
0x1003f325c: lea rdi, [rbp - 0x460]
0x1003f3263: call 0x1007a58d0
0x1003f3268: lea rdi, [rbp - 0x468]
0x1003f326f: mov rsi, qword ptr [rbp - 0x470]
0x1003f3276: call 0x100aa23ba
0x1003f327b: mov rdi, r15
0x1003f327e: call 0x100aa245c
0x1003f3283: lea r14, [rbp - 0x318]
0x1003f328a: lea rbx, [rbp - 0x460]
0x1003f3291: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3298: mov qword ptr [rbp - 0x468], rax
0x1003f329f: mov rax, qword ptr [rbp - 0x4a8]
0x1003f32a6: mov qword ptr [rbp - 0x318], rax
0x1003f32ad: mov rdi, r14
0x1003f32b0: mov rsi, rbx
0x1003f32b3: call 0x100aa2450
0x1003f32b8: mov qword ptr [rbp - 0x290], 0
0x1003f32c3: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f32cd: mov qword ptr [rbp - 0x468], r13
0x1003f32d4: mov qword ptr [rbp - 0x318], r12
0x1003f32db: lea rsi, [rip + 0x793837]
0x1003f32e2: mov edx, 2
0x1003f32e7: mov rdi, rbx
0x1003f32ea: call 0x1007a56a0
0x1003f32ef: lea rsi, [rip + 0x7938f4]
0x1003f32f6: lea rdi, [rbp - 0x468]
0x1003f32fd: mov edx, 0x18
0x1003f3302: call 0x100011930
0x1003f3307: mov rax, qword ptr [rbp - 0x488]
0x1003f330e: mov qword ptr [rbp - 0x468], rax
0x1003f3315: mov qword ptr [rbp - 0x318], r12
0x1003f331c: mov rdi, rbx
0x1003f331f: call 0x1007a58d0
0x1003f3324: lea rdi, [rbp - 0x468]
0x1003f332b: mov rsi, qword ptr [rbp - 0x470]
0x1003f3332: call 0x100aa23ba
0x1003f3337: mov rdi, r14
0x1003f333a: call 0x100aa245c
0x1003f333f: mov rax, qword ptr [rbp - 0x500]
0x1003f3346: cmp dword ptr [rax + 0x38], 0
0x1003f334a: je 0x1003f3534
0x1003f3350: lea rbx, [rbp - 0x318]
0x1003f3357: lea r13, [rbp - 0x460]
0x1003f335e: xor r14d, r14d
0x1003f3361: mov eax, r14d
0x1003f3364: mov r12d, dword ptr [rbp + rax*4 - 0x280]
0x1003f336c: cmp r12d, 0xc00000
0x1003f3373: lea r15, [rip + 0x7b1a5e]
0x1003f337a: lea rax, [rip + 0x793888]
0x1003f3381: cmova r15, rax
0x1003f3385: mov rax, qword ptr [rbp - 0x4a0]
0x1003f338c: mov qword ptr [rbp - 0x468], rax
0x1003f3393: mov rax, qword ptr [rbp - 0x4a8]
0x1003f339a: mov qword ptr [rbp - 0x318], rax
0x1003f33a1: mov rdi, rbx
0x1003f33a4: mov rsi, r13
0x1003f33a7: call 0x100aa2450
0x1003f33ac: mov qword ptr [rbp - 0x290], 0
0x1003f33b7: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f33c1: mov rax, qword ptr [rbp - 0x488]
0x1003f33c8: mov qword ptr [rbp - 0x468], rax
0x1003f33cf: mov rax, qword ptr [rbp - 0x490]
0x1003f33d6: mov qword ptr [rbp - 0x318], rax
0x1003f33dd: mov edx, 2
0x1003f33e2: mov rdi, r13
0x1003f33e5: lea rsi, [rip + 0x79372d]
0x1003f33ec: call 0x1007a56a0
0x1003f33f1: xor eax, eax
0x1003f33f3: cmp r12d, 0xc00000
0x1003f33fa: seta al
0x1003f33fd: lea rsi, [rip + 0x7b19d4]
0x1003f3404: lea rcx, [rip + 0x7937f8]
0x1003f340b: cmova rsi, rcx
0x1003f340f: lea rdx, [rax + rax*4]
0x1003f3413: lea rdi, [rbp - 0x468]
0x1003f341a: call 0x100011930
0x1003f341f: mov edx, 7
0x1003f3424: mov rdi, rax
0x1003f3427: lea rsi, [rip + 0x7937e0]
0x1003f342e: call 0x100011930
0x1003f3433: mov rdi, rax
0x1003f3436: mov esi, r14d
0x1003f3439: call 0x100aa23de
0x1003f343e: mov edx, 2
0x1003f3443: mov rdi, rax
0x1003f3446: lea rsi, [rip + 0x76d5bf]
0x1003f344d: call 0x100011930
0x1003f3452: mov ecx, r12d
0x1003f3455: vcvtsi2ss xmm0, xmm1, rcx
0x1003f345a: vmulss xmm0, xmm0, dword ptr [rip + 0x6be20a]
0x1003f3462: mov rdi, rax
0x1003f3465: call 0x100aa23d2
0x1003f346a: mov edx, 5
0x1003f346f: mov rdi, rax
0x1003f3472: lea rsi, [rip + 0x78758b]
0x1003f3479: call 0x100011930
0x1003f347e: imul ecx, r12d, 0x64
0x1003f3482: mov edx, 0xaaaaaaab
0x1003f3487: imul rcx, rdx
0x1003f348b: shr rcx, 0x37
0x1003f348f: vcvtsi2ss xmm0, xmm1, ecx
0x1003f3493: mov rcx, qword ptr [rax]
0x1003f3496: mov rcx, qword ptr [rcx - 0x18]
0x1003f349a: mov qword ptr [rax + rcx + 0x10], 3
0x1003f34a3: mov rdi, rax
0x1003f34a6: call 0x100aa23d2
0x1003f34ab: mov edx, 2
0x1003f34b0: mov rdi, rax
0x1003f34b3: lea rsi, [rip + 0x787550]
0x1003f34ba: call 0x100011930
0x1003f34bf: xor edx, edx
0x1003f34c1: cmp r12d, 0xc00000
0x1003f34c8: seta dl
0x1003f34cb: shl rdx, 2
0x1003f34cf: mov rdi, rax
0x1003f34d2: mov rsi, r15
0x1003f34d5: call 0x100011930
0x1003f34da: mov rax, qword ptr [rbp - 0x488]
0x1003f34e1: mov qword ptr [rbp - 0x468], rax
0x1003f34e8: mov r12, qword ptr [rbp - 0x490]
0x1003f34ef: mov qword ptr [rbp - 0x318], r12
0x1003f34f6: mov rdi, r13
0x1003f34f9: call 0x1007a58d0
0x1003f34fe: lea rdi, [rbp - 0x468]
0x1003f3505: mov rsi, qword ptr [rbp - 0x470]
0x1003f350c: call 0x100aa23ba
0x1003f3511: lea rbx, [rbp - 0x318]
0x1003f3518: mov rdi, rbx
0x1003f351b: call 0x100aa245c
0x1003f3520: inc r14d
0x1003f3523: mov rax, qword ptr [rbp - 0x500]
0x1003f352a: cmp r14d, dword ptr [rax + 0x38]
0x1003f352e: jb 0x1003f3361
0x1003f3534: cmp dword ptr [rbp - 0x280], 0xc00000
0x1003f353e: jbe 0x1003f35e2
0x1003f3544: lea r14, [rbp - 0x318]
0x1003f354b: lea rbx, [rbp - 0x460]
0x1003f3552: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3559: mov qword ptr [rbp - 0x468], rax
0x1003f3560: mov rax, qword ptr [rbp - 0x4a8]
0x1003f3567: mov qword ptr [rbp - 0x318], rax
0x1003f356e: mov rdi, r14
0x1003f3571: mov rsi, rbx
0x1003f3574: lea r13, [rbp - 0xc8]
0x1003f357b: call 0x100aa2450
0x1003f3580: mov qword ptr [rbp - 0x290], 0
0x1003f358b: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f3595: mov rax, qword ptr [rbp - 0x488]
0x1003f359c: mov qword ptr [rbp - 0x468], rax
0x1003f35a3: mov qword ptr [rbp - 0x318], r12
0x1003f35aa: lea rsi, [rip + 0x793568]
0x1003f35b1: mov edx, 1
0x1003f35b6: mov rdi, rbx
0x1003f35b9: lea r15, [rbp - 0x260]
0x1003f35c0: call 0x1007a56a0
0x1003f35c5: lea rsi, [rip + 0x79364a]
0x1003f35cc: lea rdi, [rbp - 0x468]
0x1003f35d3: mov edx, 0x3b
0x1003f35d8: call 0x100011930
0x1003f35dd: jmp 0x1003f3872
0x1003f35e2: cmp qword ptr [rbp - 0x1e8], 0
0x1003f35ea: lea r13, [rbp - 0xc8]
0x1003f35f1: je 0x1003f37e0
0x1003f35f7: lea rdi, [rbp - 0x658]
0x1003f35fe: call 0x100769850
0x1003f3603: mov r12d, eax
0x1003f3606: mov r15d, r12d
0x1003f3609: lea rdi, [rbp - 0x268]
0x1003f3610: mov rsi, qword ptr [rbp - 0x590]
0x1003f3617: mov rdx, r15
0x1003f361a: call 0x100aa23a8
0x1003f361f: mov rbx, qword ptr [rbp - 0x1e8]
0x1003f3626: test rbx, rbx
0x1003f3629: je 0x1003f365b
0x1003f362b: mov rax, qword ptr [rbp - 0x260]
0x1003f3632: lea rdi, [rbp - 0x260]
0x1003f3639: call qword ptr [rax + 0x30]
0x1003f363c: mov r14d, eax
0x1003f363f: mov rdi, rbx
0x1003f3642: call 0x100aa270e
0x1003f3647: test eax, eax
0x1003f3649: jne 0x1003f365b
0x1003f364b: mov qword ptr [rbp - 0x1e8], 0
0x1003f3656: test r14d, r14d
0x1003f3659: je 0x1003f367d
0x1003f365b: mov rax, qword ptr [rbp - 0x268]
0x1003f3662: mov rax, qword ptr [rax - 0x18]
0x1003f3666: lea rdi, [rbp + rax - 0x268]
0x1003f366e: mov esi, dword ptr [rbp + rax - 0x248]
0x1003f3675: or esi, 4
0x1003f3678: call 0x100aa2456
0x1003f367d: lea r14, [rbp - 0x318]
0x1003f3684: lea r13, [rbp - 0x460]
0x1003f368b: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3692: mov qword ptr [rbp - 0x468], rax
0x1003f3699: mov rax, qword ptr [rbp - 0x4a8]
0x1003f36a0: mov qword ptr [rbp - 0x318], rax
0x1003f36a7: mov rdi, r14
0x1003f36aa: mov rsi, r13
0x1003f36ad: call 0x100aa2450
0x1003f36b2: mov qword ptr [rbp - 0x290], 0
0x1003f36bd: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f36c7: mov rax, qword ptr [rbp - 0x488]
0x1003f36ce: mov qword ptr [rbp - 0x468], rax
0x1003f36d5: mov rax, qword ptr [rbp - 0x490]
0x1003f36dc: mov qword ptr [rbp - 0x318], rax
0x1003f36e3: lea rsi, [rip + 0x79342f]
0x1003f36ea: mov edx, 2
0x1003f36ef: mov rdi, r13
0x1003f36f2: call 0x1007a56a0
0x1003f36f7: lea rsi, [rip + 0x793554]
0x1003f36fe: lea rdi, [rbp - 0x468]
0x1003f3705: mov edx, 0x23
0x1003f370a: call 0x100011930
0x1003f370f: mov rdi, rax
0x1003f3712: mov esi, dword ptr [rbp - 0x510]
0x1003f3718: call 0x100aa23de
0x1003f371d: lea rsi, [rip + 0x7872d8]
0x1003f3724: mov edx, 7
0x1003f3729: mov rdi, rax
0x1003f372c: call 0x100011930
0x1003f3731: mov esi, r12d
0x1003f3734: shr esi, 0xa
0x1003f3737: mov rdi, rax
0x1003f373a: call 0x100aa23de
0x1003f373f: lea rsi, [rip + 0x7872be]
0x1003f3746: mov edx, 5
0x1003f374b: mov rdi, rax
0x1003f374e: call 0x100011930
0x1003f3753: vcvtsi2ss xmm0, xmm1, r15
0x1003f3758: add r12d, dword ptr [rbp - 0x4ac]
0x1003f375f: vcvtsi2ss xmm1, xmm1, r12
0x1003f3764: vdivss xmm0, xmm0, xmm1
0x1003f3768: vmulss xmm0, xmm0, dword ptr [rip + 0x6b4f00]
0x1003f3770: mov rdi, rax
0x1003f3773: call 0x100aa23d2
0x1003f3778: lea rsi, [rip + 0x78728b]
0x1003f377f: mov edx, 2
0x1003f3784: mov rdi, rax
0x1003f3787: call 0x100011930
0x1003f378c: mov rax, qword ptr [rbp - 0x488]
0x1003f3793: mov qword ptr [rbp - 0x468], rax
0x1003f379a: mov rax, qword ptr [rbp - 0x490]
0x1003f37a1: mov qword ptr [rbp - 0x318], rax
0x1003f37a8: mov rdi, r13
0x1003f37ab: call 0x1007a58d0
0x1003f37b0: lea rdi, [rbp - 0x468]
0x1003f37b7: mov rsi, qword ptr [rbp - 0x470]
0x1003f37be: call 0x100aa23ba
0x1003f37c3: mov rdi, r14
0x1003f37c6: call 0x100aa245c
0x1003f37cb: mov bl, 1
0x1003f37cd: lea r13, [rbp - 0xc8]
0x1003f37d4: lea r15, [rbp - 0x260]
0x1003f37db: jmp 0x1003f38ac
0x1003f37e0: lea r14, [rbp - 0x318]
0x1003f37e7: lea rbx, [rbp - 0x460]
0x1003f37ee: mov rax, qword ptr [rbp - 0x4a0]
0x1003f37f5: mov qword ptr [rbp - 0x468], rax
0x1003f37fc: mov rax, qword ptr [rbp - 0x4a8]
0x1003f3803: mov qword ptr [rbp - 0x318], rax
0x1003f380a: mov rdi, r14
0x1003f380d: mov rsi, rbx
0x1003f3810: call 0x100aa2450
0x1003f3815: mov rax, qword ptr [rbp - 0x488]
0x1003f381c: mov qword ptr [rbp - 0x290], 0
0x1003f3827: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f3831: mov qword ptr [rbp - 0x468], rax
0x1003f3838: mov qword ptr [rbp - 0x318], r12
0x1003f383f: lea rsi, [rip + 0x7932d3]
0x1003f3846: mov edx, 1
0x1003f384b: mov rdi, rbx
0x1003f384e: lea r15, [rbp - 0x260]
0x1003f3855: call 0x1007a56a0
0x1003f385a: lea rsi, [rip + 0x793415]
0x1003f3861: lea rdi, [rbp - 0x468]
0x1003f3868: mov edx, 0x22
0x1003f386d: call 0x100011930
0x1003f3872: mov rax, qword ptr [rbp - 0x488]
0x1003f3879: mov qword ptr [rbp - 0x468], rax
0x1003f3880: mov qword ptr [rbp - 0x318], r12
0x1003f3887: mov rdi, rbx
0x1003f388a: call 0x1007a58d0
0x1003f388f: lea rdi, [rbp - 0x468]
0x1003f3896: mov rsi, qword ptr [rbp - 0x470]
0x1003f389d: call 0x100aa23ba
0x1003f38a2: mov rdi, r14
0x1003f38a5: call 0x100aa245c
0x1003f38aa: xor ebx, ebx
0x1003f38ac: mov rdi, qword ptr [rbp - 0x590]
0x1003f38b3: call 0x1007e8b90
0x1003f38b8: mov rax, qword ptr [rbp - 0x478]
0x1003f38bf: mov qword ptr [rbp - 0x268], rax
0x1003f38c6: mov rax, qword ptr [rbp - 0x480]
0x1003f38cd: mov qword ptr [rbp - 0xc8], rax
0x1003f38d4: mov rdi, r15
0x1003f38d7: call 0x1003f6ae0
0x1003f38dc: mov rsi, qword ptr [rip + 0x816cad]
0x1003f38e3: add rsi, 8
0x1003f38e7: lea rdi, [rbp - 0x268]
0x1003f38ee: call 0x100aa23ba
0x1003f38f3: mov rdi, r13
0x1003f38f6: call 0x100aa245c
0x1003f38fb: lea rdi, [rbp - 0x660]
0x1003f3902: call 0x10076b810
0x1003f3907: mov rax, qword ptr [rip + 0x819fca]
0x1003f390e: mov rax, qword ptr [rax]
0x1003f3911: cmp rax, qword ptr [rbp - 0x30]
0x1003f3915: jne 0x1003f392b
0x1003f3917: mov eax, ebx
0x1003f3919: add rsp, 0x638
0x1003f3920: pop rbx
0x1003f3921: pop r12
0x1003f3923: pop r13
0x1003f3925: pop r14
0x1003f3927: pop r15
0x1003f3929: pop rbp
0x1003f392a: ret 
0x1003f392b: call 0x100aa251c
0x1003f3930: jmp 0x1003f3947
0x1003f3932: jmp 0x1003f398a
0x1003f3934: jmp 0x1003f3992
0x1003f3936: mov r14, rax
0x1003f3939: mov rdi, rbx
0x1003f393c: call 0x100aa270e
0x1003f3941: jmp 0x1003f39a0
0x1003f3943: jmp 0x1003f398a
0x1003f3945: jmp 0x1003f3992
0x1003f3947: mov rcx, rax
0x1003f394a: mov rax, qword ptr [rbp - 0x488]
0x1003f3951: mov qword ptr [rbp - 0x468], rax
0x1003f3958: mov qword ptr [rbp - 0x318], r12
0x1003f395f: mov rdi, rbx
0x1003f3962: mov rbx, rcx
0x1003f3965: call 0x1007a58d0
0x1003f396a: lea rdi, [rbp - 0x468]
0x1003f3971: mov rsi, qword ptr [rbp - 0x470]
0x1003f3978: call 0x100aa23ba
0x1003f397d: mov rdi, r14
0x1003f3980: call 0x100aa245c
0x1003f3985: jmp 0x1003f4186
0x1003f398a: mov rbx, rax
0x1003f398d: jmp 0x1003f3a1c
0x1003f3992: mov rbx, rax
0x1003f3995: mov rdi, r14
0x1003f3998: jmp 0x1003f4135
0x1003f399d: mov r14, rax
0x1003f39a0: lea r13, [rbp - 0xc8]
0x1003f39a7: jmp 0x1003f3b14
0x1003f39ac: mov rdi, rax
0x1003f39af: call 0x100011bf0
0x1003f39b4: jmp 0x1003f39bc
0x1003f39b6: jmp 0x1003f39bc
0x1003f39b8: jmp 0x1003f39bc
0x1003f39ba: jmp 0x1003f39bc
0x1003f39bc: mov rbx, rax
0x1003f39bf: lea r13, [rbp - 0xc8]
0x1003f39c6: jmp 0x1003f40d4
0x1003f39cb: mov rbx, rax
0x1003f39ce: mov rax, qword ptr [rbp - 0x488]
0x1003f39d5: mov qword ptr [rbp - 0x468], rax
0x1003f39dc: mov rax, qword ptr [rbp - 0x490]
0x1003f39e3: mov qword ptr [rbp - 0x318], rax
0x1003f39ea: mov rdi, r13
0x1003f39ed: jmp 0x1003f3a17
0x1003f39ef: jmp 0x1003f4044
0x1003f39f4: jmp 0x1003f4044
0x1003f39f9: mov rcx, rax
0x1003f39fc: mov rax, qword ptr [rbp - 0x488]
0x1003f3a03: mov qword ptr [rbp - 0x468], rax
0x1003f3a0a: mov qword ptr [rbp - 0x318], r12
0x1003f3a11: mov rdi, rbx
0x1003f3a14: mov rbx, rcx
0x1003f3a17: call 0x1007a58d0
0x1003f3a1c: lea rdi, [rbp - 0x468]
0x1003f3a23: mov rsi, qword ptr [rbp - 0x470]
0x1003f3a2a: call 0x100aa23ba
0x1003f3a2f: mov rdi, r14
0x1003f3a32: jmp 0x1003f4135
0x1003f3a37: lea r13, [rbp - 0xc8]
0x1003f3a3e: mov rbx, rax
0x1003f3a41: lea rdi, [rbp - 0x468]
0x1003f3a48: mov rsi, qword ptr [rbp - 0x470]
0x1003f3a4f: call 0x100aa23ba
0x1003f3a54: mov rdi, r14
0x1003f3a57: jmp 0x1003f3d1d
0x1003f3a5c: lea r13, [rbp - 0xc8]
0x1003f3a63: mov rbx, rax
0x1003f3a66: mov rdi, r14
0x1003f3a69: jmp 0x1003f3d1d
0x1003f3a6e: lea r13, [rbp - 0xc8]
0x1003f3a75: mov rbx, rax
0x1003f3a78: jmp 0x1003f3b96
0x1003f3a7d: lea r13, [rbp - 0xc8]
0x1003f3a84: mov rbx, rax
0x1003f3a87: mov rdi, r15
0x1003f3a8a: jmp 0x1003f3d1d
0x1003f3a8f: jmp 0x1003f3aa7
0x1003f3a91: jmp 0x1003f3ab9
0x1003f3a93: jmp 0x1003f3aa7
0x1003f3a95: jmp 0x1003f3ab9
0x1003f3a97: jmp 0x1003f3aa7
0x1003f3a99: jmp 0x1003f3ab9
0x1003f3a9b: jmp 0x1003f3aa7
0x1003f3a9d: jmp 0x1003f3ab9
0x1003f3a9f: jmp 0x1003f3aa7
0x1003f3aa1: jmp 0x1003f3ab9
0x1003f3aa3: jmp 0x1003f3aa7
0x1003f3aa5: jmp 0x1003f3ab9
0x1003f3aa7: lea rbx, [rbp - 0xc8]
0x1003f3aae: mov r14, rbx
0x1003f3ab1: mov rbx, rax
0x1003f3ab4: jmp 0x1003f3be9
0x1003f3ab9: lea rbx, [rbp - 0xc8]
0x1003f3ac0: mov r14, rbx
0x1003f3ac3: mov rbx, rax
0x1003f3ac6: jmp 0x1003f3bfc
0x1003f3acb: jmp 0x1003f3ad3
0x1003f3acd: jmp 0x1003f3ae2
0x1003f3acf: jmp 0x1003f3ad3
0x1003f3ad1: jmp 0x1003f3ae2
0x1003f3ad3: lea r13, [rbp - 0xc8]
0x1003f3ada: mov rbx, rax
0x1003f3add: jmp 0x1003f3d03
0x1003f3ae2: lea r13, [rbp - 0xc8]
0x1003f3ae9: mov rbx, rax
0x1003f3aec: jmp 0x1003f3d16
0x1003f3af1: mov r14, rax
0x1003f3af4: lea rdi, [rbp - 0x468]
0x1003f3afb: mov rsi, qword ptr [rbp - 0x470]
0x1003f3b02: call 0x100aa23ba
0x1003f3b07: jmp 0x1003f3b0c
0x1003f3b09: mov r14, rax
0x1003f3b0c: mov rdi, rbx
0x1003f3b0f: call 0x100aa245c
0x1003f3b14: lea r15, [rbp - 0x260]
0x1003f3b1b: mov rcx, qword ptr [rbp - 0x480]
0x1003f3b22: mov rsi, qword ptr [rbp - 0x478]
0x1003f3b29: mov rbx, r14
0x1003f3b2c: jmp 0x1003f4194
0x1003f3b31: jmp 0x1003f4044
0x1003f3b36: jmp 0x1003f4044
0x1003f3b3b: jmp 0x1003f3b64
0x1003f3b3d: jmp 0x1003f3bbb
0x1003f3b3f: jmp 0x1003f3bbb
0x1003f3b41: jmp 0x1003f3bbb
0x1003f3b43: jmp 0x1003f3bbb
0x1003f3b45: jmp 0x1003f3bbb
0x1003f3b47: jmp 0x1003f3bbb
0x1003f3b49: jmp 0x1003f3c13
0x1003f3b4e: lea r14, [rbp - 0xc8]
0x1003f3b55: jmp 0x1003f3c8f
0x1003f3b5a: jmp 0x1003f3c85
0x1003f3b5f: jmp 0x1003f3cd5
0x1003f3b64: lea r13, [rbp - 0xc8]
0x1003f3b6b: mov rbx, rax
0x1003f3b6e: mov rax, qword ptr [rbp - 0x488]
0x1003f3b75: mov qword ptr [rbp - 0x468], rax
0x1003f3b7c: mov rax, qword ptr [rbp - 0x490]
0x1003f3b83: mov qword ptr [rbp - 0x318], rax
0x1003f3b8a: lea rdi, [rbp - 0x460]
0x1003f3b91: call 0x1007a58d0
0x1003f3b96: lea rdi, [rbp - 0x468]
0x1003f3b9d: mov rsi, qword ptr [rbp - 0x470]
0x1003f3ba4: call 0x100aa23ba
0x1003f3ba9: mov rdi, r15
0x1003f3bac: jmp 0x1003f3d1d
0x1003f3bb1: jmp 0x1003f3bbb
0x1003f3bb3: jmp 0x1003f3bbb
0x1003f3bb5: jmp 0x1003f3bbb
0x1003f3bb7: jmp 0x1003f3bbb
0x1003f3bb9: jmp 0x1003f3bbb
0x1003f3bbb: lea r14, [rbp - 0xc8]
0x1003f3bc2: mov rbx, rax
0x1003f3bc5: mov rax, qword ptr [rbp - 0x488]
0x1003f3bcc: mov qword ptr [rbp - 0x468], rax
0x1003f3bd3: mov rax, qword ptr [rbp - 0x490]
0x1003f3bda: mov qword ptr [rbp - 0x318], rax
0x1003f3be1: mov rdi, r15
0x1003f3be4: call 0x1007a58d0
0x1003f3be9: lea rdi, [rbp - 0x468]
0x1003f3bf0: mov rsi, qword ptr [rbp - 0x470]
0x1003f3bf7: call 0x100aa23ba
0x1003f3bfc: mov rdi, r13
0x1003f3bff: call 0x100aa245c
0x1003f3c04: mov r13, r14
0x1003f3c07: lea r15, [rbp - 0x260]
0x1003f3c0e: jmp 0x1003f4186
0x1003f3c13: lea r14, [rbp - 0xc8]
0x1003f3c1a: mov r12, rax
0x1003f3c1d: mov rax, qword ptr [rbp - 0x488]
0x1003f3c24: mov qword ptr [rbp - 0x468], rax
0x1003f3c2b: mov rax, qword ptr [rbp - 0x490]
0x1003f3c32: mov qword ptr [rbp - 0x318], rax
0x1003f3c39: mov rdi, rbx
0x1003f3c3c: call 0x1007a58d0
0x1003f3c41: lea rdi, [rbp - 0x468]
0x1003f3c48: mov rsi, qword ptr [rbp - 0x470]
0x1003f3c4f: call 0x100aa23ba
0x1003f3c54: mov rdi, r13
0x1003f3c57: call 0x100aa245c
0x1003f3c5c: mov r13, r14
0x1003f3c5f: lea r15, [rbp - 0x260]
0x1003f3c66: mov rcx, qword ptr [rbp - 0x480]
0x1003f3c6d: mov rsi, qword ptr [rbp - 0x478]
0x1003f3c74: mov rbx, r12
0x1003f3c77: jmp 0x1003f4194
0x1003f3c7c: lea r14, [rbp - 0xc8]
0x1003f3c83: jmp 0x1003f3c8f
0x1003f3c85: lea rbx, [rbp - 0xc8]
0x1003f3c8c: mov r14, rbx
0x1003f3c8f: mov rbx, rax
0x1003f3c92: mov rax, qword ptr [rbp - 0x488]
0x1003f3c99: mov qword ptr [rbp - 0x468], rax
0x1003f3ca0: mov rax, qword ptr [rbp - 0x490]
0x1003f3ca7: mov qword ptr [rbp - 0x318], rax
0x1003f3cae: mov rdi, r13
0x1003f3cb1: call 0x1007a58d0
0x1003f3cb6: lea rdi, [rbp - 0x468]
0x1003f3cbd: mov rsi, qword ptr [rbp - 0x470]
0x1003f3cc4: call 0x100aa23ba
0x1003f3cc9: lea rdi, [rbp - 0x318]
0x1003f3cd0: jmp 0x1003f3bff
0x1003f3cd5: lea r13, [rbp - 0xc8]
0x1003f3cdc: mov rbx, rax
0x1003f3cdf: mov rax, qword ptr [rbp - 0x488]
0x1003f3ce6: mov qword ptr [rbp - 0x468], rax
0x1003f3ced: mov rax, qword ptr [rbp - 0x490]
0x1003f3cf4: mov qword ptr [rbp - 0x318], rax
0x1003f3cfb: mov rdi, r15