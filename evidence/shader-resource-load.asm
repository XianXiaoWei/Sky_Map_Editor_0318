0x1007d1340: push rbp
0x1007d1341: mov rbp, rsp
0x1007d1344: push r15
0x1007d1346: push r14
0x1007d1348: push r13
0x1007d134a: push r12
0x1007d134c: push rbx
0x1007d134d: sub rsp, 0x60048
0x1007d1354: mov r12, rsi
0x1007d1357: mov r14, rdi
0x1007d135a: mov rax, qword ptr [rip + 0x43c577]
0x1007d1361: mov rax, qword ptr [rax]
0x1007d1364: mov qword ptr [rbp - 0x30], rax
0x1007d1368: mov dword ptr [rbp - 0x58], 0xffffffff
0x1007d136f: vxorps ymm0, ymm0, ymm0
0x1007d1373: vmovups ymmword ptr [rbp - 0x54], ymm0
0x1007d1378: movzx eax, byte ptr [r14 + 0xb8]
0x1007d1380: test al, 1
0x1007d1382: jne 0x1007d13b5
0x1007d1384: mov rcx, rax
0x1007d1387: shr rcx, 1
0x1007d138a: test rcx, rcx
0x1007d138d: je 0x1007d13c1
0x1007d138f: mov rdi, qword ptr [r12 + 0x10]
0x1007d1394: test al, 1
0x1007d1396: jne 0x1007d13f9
0x1007d1398: lea rsi, [r14 + 0xb8]
0x1007d139f: inc rsi
0x1007d13a2: test byte ptr [r14 + 0xd0], 1
0x1007d13aa: je 0x1007d140a
0x1007d13ac: mov rdx, qword ptr [r14 + 0xe0]
0x1007d13b3: jmp 0x1007d1414
0x1007d13b5: mov rcx, qword ptr [r14 + 0xc0]
0x1007d13bc: test rcx, rcx
0x1007d13bf: jne 0x1007d138f
0x1007d13c1: mov rdi, qword ptr [r12 + 0x10]
0x1007d13c6: test byte ptr [r14 + 0x70], 1
0x1007d13cb: jne 0x1007d1597
0x1007d13d1: lea rsi, [r14 + 0x70]
0x1007d13d5: inc rsi
0x1007d13d8: lea r13, [r14 + 0xd0]
0x1007d13df: test byte ptr [r14 + 0xd0], 1
0x1007d13e7: je 0x1007d15b3
0x1007d13ed: mov rdx, qword ptr [r14 + 0xe0]
0x1007d13f4: jmp 0x1007d15b7
0x1007d13f9: mov rsi, qword ptr [r14 + 0xc8]
0x1007d1400: test byte ptr [r14 + 0xd0], 1
0x1007d1408: jne 0x1007d13ac
0x1007d140a: lea rdx, [r14 + 0xd0]
0x1007d1411: inc rdx
0x1007d1414: xor ecx, ecx
0x1007d1416: cmp byte ptr [rip + 0x1877bab], 0
0x1007d141d: sete cl
0x1007d1420: lea r8, [rbp - 0x30060]
0x1007d1427: mov r9d, 0x30000
0x1007d142d: vzeroupper 
0x1007d1430: call 0x1007d1150
0x1007d1435: mov r15d, eax
0x1007d1438: movzx eax, byte ptr [r14 + 0x70]
0x1007d143d: test al, 1
0x1007d143f: jne 0x1007d1459
0x1007d1441: mov rcx, rax
0x1007d1444: shr rcx, 1
0x1007d1447: test rcx, rcx
0x1007d144a: je 0x1007d1462
0x1007d144c: test al, 1
0x1007d144e: jne 0x1007d1466
0x1007d1450: lea rax, [r14 + 0x70]
0x1007d1454: inc rax
0x1007d1457: jmp 0x1007d146d
0x1007d1459: mov rcx, qword ptr [r14 + 0x78]
0x1007d145d: test rcx, rcx
0x1007d1460: jne 0x1007d144c
0x1007d1462: xor eax, eax
0x1007d1464: jmp 0x1007d146d
0x1007d1466: mov rax, qword ptr [r14 + 0x80]
0x1007d146d: mov qword ptr [rbp - 0x60060], rax
0x1007d1474: movzx eax, byte ptr [r14 + 0x88]
0x1007d147c: test al, 1
0x1007d147e: jne 0x1007d149b
0x1007d1480: mov rcx, rax
0x1007d1483: shr rcx, 1
0x1007d1486: test rcx, rcx
0x1007d1489: je 0x1007d14a7
0x1007d148b: test al, 1
0x1007d148d: jne 0x1007d14ab
0x1007d148f: lea rax, [r14 + 0x88]
0x1007d1496: inc rax
0x1007d1499: jmp 0x1007d14b2
0x1007d149b: mov rcx, qword ptr [r14 + 0x90]
0x1007d14a2: test rcx, rcx
0x1007d14a5: jne 0x1007d148b
0x1007d14a7: xor eax, eax
0x1007d14a9: jmp 0x1007d14b2
0x1007d14ab: mov rax, qword ptr [r14 + 0x98]
0x1007d14b2: mov qword ptr [rbp - 0x60058], rax
0x1007d14b9: movzx eax, byte ptr [r14 + 0xa0]
0x1007d14c1: test al, 1
0x1007d14c3: jne 0x1007d14ee
0x1007d14c5: mov rcx, rax
0x1007d14c8: shr rcx, 1
0x1007d14cb: test rcx, rcx
0x1007d14ce: je 0x1007d14fa
0x1007d14d0: test al, 1
0x1007d14d2: jne 0x1007d1520
0x1007d14d4: lea rax, [r14 + 0xa0]
0x1007d14db: inc rax
0x1007d14de: mov qword ptr [rbp - 0x60050], rax
0x1007d14e5: test byte ptr [r14 + 0x10], 1
0x1007d14ea: je 0x1007d150a
0x1007d14ec: jmp 0x1007d1535
0x1007d14ee: mov rcx, qword ptr [r14 + 0xa8]
0x1007d14f5: test rcx, rcx
0x1007d14f8: jne 0x1007d14d0
0x1007d14fa: xor eax, eax
0x1007d14fc: mov qword ptr [rbp - 0x60050], rax
0x1007d1503: test byte ptr [r14 + 0x10], 1
0x1007d1508: jne 0x1007d1535
0x1007d150a: lea r12, [r14 + 0x10]
0x1007d150e: inc r12
0x1007d1511: mov r13b, byte ptr [rip + 0x1877ab0]
0x1007d1518: cmp dword ptr [rbp - 0x58], -1
0x1007d151c: jne 0x1007d1546
0x1007d151e: jmp 0x1007d1561
0x1007d1520: mov rax, qword ptr [r14 + 0xb0]
0x1007d1527: mov qword ptr [rbp - 0x60050], rax
0x1007d152e: test byte ptr [r14 + 0x10], 1
0x1007d1533: je 0x1007d150a
0x1007d1535: mov r12, qword ptr [r14 + 0x20]
0x1007d1539: mov r13b, byte ptr [rip + 0x1877a88]
0x1007d1540: cmp dword ptr [rbp - 0x58], -1
0x1007d1544: je 0x1007d1561
0x1007d1546: call 0x1007c1470
0x1007d154b: mov rcx, qword ptr [rax]
0x1007d154e: mov esi, dword ptr [rbp - 0x58]
0x1007d1551: mov rdi, rax
0x1007d1554: call qword ptr [rcx + 0x90]
0x1007d155a: mov dword ptr [rbp - 0x58], 0xffffffff
0x1007d1561: xor ebx, ebx
0x1007d1563: test r13b, r13b
0x1007d1566: sete bl
0x1007d1569: call 0x1007c1470
0x1007d156e: mov r10, qword ptr [rax]
0x1007d1571: lea rdx, [rbp - 0x30060]
0x1007d1578: lea r8, [rbp - 0x60060]
0x1007d157f: mov rdi, rax
0x1007d1582: mov rsi, r12
0x1007d1585: mov ecx, r15d
0x1007d1588: mov r9d, ebx
0x1007d158b: call qword ptr [r10 + 0x80]
0x1007d1592: jmp 0x1007d16b9
0x1007d1597: mov rsi, qword ptr [r14 + 0x80]
0x1007d159e: lea r13, [r14 + 0xd0]
0x1007d15a5: test byte ptr [r14 + 0xd0], 1
0x1007d15ad: jne 0x1007d13ed
0x1007d15b3: lea rdx, [r13 + 1]
0x1007d15b7: xor ecx, ecx
0x1007d15b9: cmp byte ptr [rip + 0x1877a08], 0
0x1007d15c0: sete cl
0x1007d15c3: lea r8, [rbp - 0x30060]
0x1007d15ca: mov r9d, 0x30000
0x1007d15d0: vzeroupper 
0x1007d15d3: call 0x1007d1150
0x1007d15d8: mov dword ptr [rbp - 0x60064], eax
0x1007d15de: mov rdi, qword ptr [r12 + 0x10]
0x1007d15e3: test byte ptr [r14 + 0x88], 1
0x1007d15eb: jne 0x1007d1607
0x1007d15ed: lea rsi, [r14 + 0x88]
0x1007d15f4: inc rsi
0x1007d15f7: test byte ptr [r13], 1
0x1007d15fc: je 0x1007d1615
0x1007d15fe: mov r13, qword ptr [r14 + 0xe0]
0x1007d1605: jmp 0x1007d1618
0x1007d1607: mov rsi, qword ptr [r14 + 0x98]
0x1007d160e: test byte ptr [r13], 1
0x1007d1613: jne 0x1007d15fe
0x1007d1615: inc r13
0x1007d1618: xor ecx, ecx
0x1007d161a: cmp byte ptr [rip + 0x18779a7], 0
0x1007d1621: sete cl
0x1007d1624: lea r8, [rbp - 0x60060]
0x1007d162b: mov r9d, 0x30000
0x1007d1631: mov rdx, r13
0x1007d1634: call 0x1007d1150
0x1007d1639: mov r13d, eax
0x1007d163c: test byte ptr [r14 + 0x10], 1
0x1007d1641: jne 0x1007d1658
0x1007d1643: lea r12, [r14 + 0x10]
0x1007d1647: inc r12
0x1007d164a: mov bl, byte ptr [rip + 0x1877978]
0x1007d1650: cmp dword ptr [rbp - 0x58], -1
0x1007d1654: jne 0x1007d1668
0x1007d1656: jmp 0x1007d1683
0x1007d1658: mov r12, qword ptr [r14 + 0x20]
0x1007d165c: mov bl, byte ptr [rip + 0x1877966]
0x1007d1662: cmp dword ptr [rbp - 0x58], -1
0x1007d1666: je 0x1007d1683
0x1007d1668: call 0x1007c1470
0x1007d166d: mov rcx, qword ptr [rax]
0x1007d1670: mov esi, dword ptr [rbp - 0x58]
0x1007d1673: mov rdi, rax
0x1007d1676: call qword ptr [rcx + 0x90]
0x1007d167c: mov dword ptr [rbp - 0x58], 0xffffffff
0x1007d1683: xor r15d, r15d
0x1007d1686: test bl, bl
0x1007d1688: sete r15b
0x1007d168c: call 0x1007c1470
0x1007d1691: mov rbx, qword ptr [rax]
0x1007d1694: mov dword ptr [rsp], r15d
0x1007d1698: lea rdx, [rbp - 0x30060]
0x1007d169f: lea rcx, [rbp - 0x60060]
0x1007d16a6: mov rdi, rax
0x1007d16a9: mov rsi, r12
0x1007d16ac: mov r8d, dword ptr [rbp - 0x60064]
0x1007d16b3: mov r9d, r13d
0x1007d16b6: call qword ptr [rbx + 0x78]
0x1007d16b9: mov dword ptr [rbp - 0x58], eax
0x1007d16bc: mov rdi, r12
0x1007d16bf: call 0x100aa2c7e
0x1007d16c4: inc eax
0x1007d16c6: cmp eax, 0x21
0x1007d16c9: jae 0x1007d172e
0x1007d16cb: lea rdi, [rbp - 0x54]
0x1007d16cf: mov rsi, r12
0x1007d16d2: call 0x100aa2c5a
0x1007d16d7: lea rax, [r14 + 0x124]
0x1007d16de: cmp dword ptr [rbp - 0x58], 0
0x1007d16e2: lea rcx, [rbp - 0x58]
0x1007d16e6: cmovs rcx, rax
0x1007d16ea: mov eax, dword ptr [rcx + 0x20]
0x1007d16ed: mov dword ptr [r14 + 0x120], eax
0x1007d16f4: vmovups ymm0, ymmword ptr [rcx]
0x1007d16f8: vmovups ymmword ptr [r14 + 0x100], ymm0
0x1007d1701: mov rax, qword ptr [rip + 0x43c1d0]
0x1007d1708: mov rax, qword ptr [rax]
0x1007d170b: cmp rax, qword ptr [rbp - 0x30]
0x1007d170f: jne 0x1007d1726
0x1007d1711: add rsp, 0x60048
0x1007d1718: pop rbx
0x1007d1719: pop r12
0x1007d171b: pop r13
0x1007d171d: pop r14
0x1007d171f: pop r15
0x1007d1721: pop rbp
0x1007d1722: vzeroupper 
0x1007d1725: ret 
0x1007d1726: vzeroupper 
0x1007d1729: call 0x100aa251c
0x1007d172e: lea rdi, [rip + 0x393727]
0x1007d1735: lea rsi, [rip + 0x3d0d1b]
0x1007d173c: mov edx, 0x30
0x1007d1741: mov ecx, 3
0x1007d1746: call 0x1007e5f70
0x1007d174b: ud2 
0x1007d174d: nop dword ptr [rax]
0x1007d1750: push rbp
0x1007d1751: mov rbp, rsp
0x1007d1754: push r15
0x1007d1756: push r14
0x1007d1758: push r13
0x1007d175a: push r12
0x1007d175c: push rbx
0x1007d175d: push rax
0x1007d175e: mov r15d, r9d
0x1007d1761: mov qword ptr [rbp - 0x30], r8
0x1007d1765: mov r12d, ecx
0x1007d1768: mov r13, rdx
0x1007d176b: mov r14, rsi
0x1007d176e: mov rbx, rdi
0x1007d1771: cmp dword ptr [rbx], -1
0x1007d1774: je 0x1007d178f
0x1007d1776: call 0x1007c1470
0x1007d177b: mov rcx, qword ptr [rax]
0x1007d177e: mov esi, dword ptr [rbx]
0x1007d1780: mov rdi, rax
0x1007d1783: call qword ptr [rcx + 0x90]
0x1007d1789: mov dword ptr [rbx], 0xffffffff
0x1007d178f: call 0x1007c1470
0x1007d1794: mov r10, qword ptr [rax]
0x1007d1797: movzx r9d, r15b
0x1007d179b: mov rdi, rax
0x1007d179e: mov rsi, r14
0x1007d17a1: mov rdx, r13
0x1007d17a4: mov ecx, r12d
0x1007d17a7: mov r8, qword ptr [rbp - 0x30]
0x1007d17ab: call qword ptr [r10 + 0x80]
0x1007d17b2: mov dword ptr [rbx], eax
0x1007d17b4: mov rdi, r14
0x1007d17b7: call 0x100aa2c7e
0x1007d17bc: inc eax
0x1007d17be: cmp eax, 0x21
0x1007d17c1: jae 0x1007d17e0
0x1007d17c3: add rbx, 4
0x1007d17c7: mov rdi, rbx
0x1007d17ca: mov rsi, r14
0x1007d17cd: add rsp, 8
0x1007d17d1: pop rbx
0x1007d17d2: pop r12
0x1007d17d4: pop r13
0x1007d17d6: pop r14
0x1007d17d8: pop r15
0x1007d17da: pop rbp
0x1007d17db: jmp 0x100aa2c5a
0x1007d17e0: lea rdi, [rip + 0x393675]
0x1007d17e7: lea rsi, [rip + 0x3d0c69]
0x1007d17ee: mov edx, 0x30
0x1007d17f3: mov ecx, 3
0x1007d17f8: call 0x1007e5f70
0x1007d17fd: ud2 
0x1007d17ff: nop 
0x1007d1800: push rbp
0x1007d1801: mov rbp, rsp
0x1007d1804: push r15
0x1007d1806: push r14
0x1007d1808: push r13
0x1007d180a: push r12
0x1007d180c: push rbx
0x1007d180d: sub rsp, 0x18
0x1007d1811: mov dword ptr [rbp - 0x30], r9d
0x1007d1815: mov dword ptr [rbp - 0x2c], r8d
0x1007d1819: mov r13, rcx
0x1007d181c: mov r15, rdx
0x1007d181f: mov r14, rsi
0x1007d1822: mov rbx, rdi
0x1007d1825: mov r12b, byte ptr [rbp + 0x10]
0x1007d1829: cmp dword ptr [rbx], -1
0x1007d182c: je 0x1007d1847
0x1007d182e: call 0x1007c1470
0x1007d1833: mov rcx, qword ptr [rax]
0x1007d1836: mov esi, dword ptr [rbx]
0x1007d1838: mov rdi, rax
0x1007d183b: call qword ptr [rcx + 0x90]
0x1007d1841: mov dword ptr [rbx], 0xffffffff
0x1007d1847: call 0x1007c1470
0x1007d184c: mov r10, qword ptr [rax]
0x1007d184f: movzx ecx, r12b
0x1007d1853: mov dword ptr [rsp], ecx
0x1007d1856: mov rdi, rax
0x1007d1859: mov rsi, r14
0x1007d185c: mov rdx, r15
0x1007d185f: mov rcx, r13
0x1007d1862: mov r8d, dword ptr [rbp - 0x2c]
0x1007d1866: mov r9d, dword ptr [rbp - 0x30]
0x1007d186a: call qword ptr [r10 + 0x78]
0x1007d186e: mov dword ptr [rbx], eax
0x1007d1870: mov rdi, r14
0x1007d1873: call 0x100aa2c7e
0x1007d1878: inc eax
0x1007d187a: cmp eax, 0x21
0x1007d187d: jae 0x1007d189c
0x1007d187f: add rbx, 4
0x1007d1883: mov rdi, rbx
0x1007d1886: mov rsi, r14
0x1007d1889: add rsp, 0x18
0x1007d188d: pop rbx
0x1007d188e: pop r12
0x1007d1890: pop r13
0x1007d1892: pop r14
0x1007d1894: pop r15
0x1007d1896: pop rbp
0x1007d1897: jmp 0x100aa2c5a
0x1007d189c: lea rdi, [rip + 0x3935b9]
0x1007d18a3: lea rsi, [rip + 0x3d0bad]
0x1007d18aa: mov edx, 0x30
0x1007d18af: mov ecx, 3
0x1007d18b4: call 0x1007e5f70
0x1007d18b9: ud2 
0x1007d18bb: nop dword ptr [rax + rax]