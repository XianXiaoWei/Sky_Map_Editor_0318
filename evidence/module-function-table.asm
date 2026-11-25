0x1007b1330: push rbp
0x1007b1331: mov rbp, rsp
0x1007b1334: push r15
0x1007b1336: push r14
0x1007b1338: push r13
0x1007b133a: push r12
0x1007b133c: push rbx
0x1007b133d: sub rsp, 0x7e8
0x1007b1344: mov rbx, rdx
0x1007b1347: mov qword ptr [rbp - 0x808], rsi
0x1007b134e: mov rax, qword ptr [rip + 0x45c583] ; 0x100c0d8d8
0x1007b1355: mov rax, qword ptr [rax]
0x1007b1358: mov qword ptr [rbp - 0x30], rax
0x1007b135c: mov eax, dword ptr [rdi + 0x38]
0x1007b135f: cmp eax, 0xa5
0x1007b1364: jae 0x1007b16f5
0x1007b136a: test eax, eax
0x1007b136c: mov qword ptr [rbp - 0x800], rdi
0x1007b1373: je 0x1007b149a
0x1007b1379: xor eax, eax
0x1007b137b: mov qword ptr [rbp - 0x7f0], rax
0x1007b1382: mov dword ptr [rbp - 0x7e8], 0
0x1007b138c: xor esi, esi
0x1007b138e: nop 
0x1007b1390: mov rax, qword ptr [rdi + 0x30]
0x1007b1394: mov dword ptr [rbp - 0x7f8], esi
0x1007b139a: mov ecx, esi
0x1007b139c: mov rax, qword ptr [rax + rcx*8]
0x1007b13a0: mov rdi, qword ptr [rax + 8]
0x1007b13a4: mov rax, qword ptr [rdi]
0x1007b13a7: call qword ptr [rax + 0x68]
0x1007b13aa: jmp 0x1007b13b2 ; 0x1007b13b2
0x1007b13ac: nop dword ptr [rax]
0x1007b13b0: call rax
0x1007b13b2: mov r12, rax
0x1007b13b5: mov r14, qword ptr [r12 + 0x50]
0x1007b13ba: mov r15, qword ptr [r14 + 8]
0x1007b13be: add r14, 8
0x1007b13c2: test r15, r15
0x1007b13c5: je 0x1007b1407
0x1007b13c7: mov r13, r14
0x1007b13ca: nop word ptr [rax + rax]
0x1007b13d0: mov rdi, qword ptr [r15 + 0x20]
0x1007b13d4: mov rsi, rbx
0x1007b13d7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b13dc: lea rcx, [r15 + 8]
0x1007b13e0: test eax, eax
0x1007b13e2: cmovns rcx, r15
0x1007b13e6: cmovns r13, r15
0x1007b13ea: mov r15, qword ptr [rcx]
0x1007b13ed: test r15, r15
0x1007b13f0: jne 0x1007b13d0
0x1007b13f2: cmp r13, r14
0x1007b13f5: je 0x1007b1407
0x1007b13f7: mov rsi, qword ptr [r13 + 0x20]
0x1007b13fb: mov rdi, rbx
0x1007b13fe: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b1403: test eax, eax
0x1007b1405: jns 0x1007b140a
0x1007b1407: mov r13, r14
0x1007b140a: cmp r14, r13
0x1007b140d: je 0x1007b1418
0x1007b140f: mov rax, qword ptr [r13 + 0x28]
0x1007b1413: test rax, rax
0x1007b1416: jne 0x1007b1450
0x1007b1418: mov rcx, qword ptr [r12 + 0x30]
0x1007b141d: test rcx, rcx
0x1007b1420: je 0x1007b1440
0x1007b1422: call rcx
0x1007b1424: mov rax, qword ptr [r12 + 0x30]
0x1007b1429: mov r12d, 0
0x1007b142f: test rax, rax
0x1007b1432: je 0x1007b13b5
0x1007b1434: jmp 0x1007b13b0 ; 0x1007b13b0
0x1007b1439: nop dword ptr [rax]
0x1007b1440: mov esi, dword ptr [rbp - 0x7f8]
0x1007b1446: jmp 0x1007b1486 ; 0x1007b1486
0x1007b1448: nop dword ptr [rax + rax]
0x1007b1450: mov rdx, qword ptr [rbp - 0x7f0]
0x1007b1457: mov ecx, edx
0x1007b1459: mov qword ptr [rbp + rcx*8 - 0x550], rax
0x1007b1461: mov esi, dword ptr [rbp - 0x7f8]
0x1007b1467: mov dword ptr [rbp + rcx*4 - 0x7e0], esi
0x1007b146e: inc edx
0x1007b1470: mov qword ptr [rbp - 0x7f0], rdx
0x1007b1477: mov ecx, dword ptr [rbp - 0x7e8]
0x1007b147d: add ecx, dword ptr [rax + 0x30]
0x1007b1480: mov dword ptr [rbp - 0x7e8], ecx
0x1007b1486: inc esi
0x1007b1488: mov rdi, qword ptr [rbp - 0x800]
0x1007b148f: cmp esi, dword ptr [rdi + 0x38]
0x1007b1492: jb 0x1007b1390
0x1007b1498: jmp 0x1007b14ad ; 0x1007b14ad
0x1007b149a: mov dword ptr [rbp - 0x7e8], 0
0x1007b14a4: xor eax, eax
0x1007b14a6: mov qword ptr [rbp - 0x7f0], rax
0x1007b14ad: mov rdi, rbx
0x1007b14b0: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007b14b5: cmp rax, 0x20
0x1007b14b9: jae 0x1007b1714
0x1007b14bf: mov r14, qword ptr [rbp - 0x808]
0x1007b14c6: mov rdi, r14
0x1007b14c9: mov rsi, rbx
0x1007b14cc: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1007b14d1: mov r15, qword ptr [rbp - 0x800]
0x1007b14d8: mov rdi, qword ptr [r15]
0x1007b14db: mov esi, dword ptr [rbp - 0x7e8]
0x1007b14e1: shl rsi, 4
0x1007b14e5: mov rdx, qword ptr [rip + 0x1896bdc] ; 0x1020480c8
0x1007b14ec: mov ecx, 0x10
0x1007b14f1: call 0x100795530 ; 0x100795530
0x1007b14f6: mov qword ptr [r14 + 0x20], rax
0x1007b14fa: mov rdi, qword ptr [r15]
0x1007b14fd: mov rbx, qword ptr [rbp - 0x7f0]
0x1007b1504: mov esi, ebx
0x1007b1506: mov qword ptr [rbp - 0x810], rsi
0x1007b150d: shl rsi, 5
0x1007b1511: mov rdx, qword ptr [rip + 0x1896bb0] ; 0x1020480c8
0x1007b1518: mov ecx, 0x10
0x1007b151d: call 0x100795530 ; 0x100795530
0x1007b1522: mov rdi, r15
0x1007b1525: mov qword ptr [r14 + 0x28], rax
0x1007b1529: mov dword ptr [r14 + 0x30], ebx
0x1007b152d: test ebx, ebx
0x1007b152f: je 0x1007b165b
0x1007b1535: mov rcx, qword ptr [rbp - 0x808]
0x1007b153c: mov r8, qword ptr [rcx + 0x20]
0x1007b1540: lea rcx, [rdi + 0x10]
0x1007b1544: mov qword ptr [rbp - 0x7f8], rcx
0x1007b154b: xor ebx, ebx
0x1007b154d: jmp 0x1007b1580 ; 0x1007b1580
0x1007b154f: nop 
0x1007b1550: mov rbx, qword ptr [rbp - 0x7f0]
0x1007b1557: inc rbx
0x1007b155a: cmp rbx, qword ptr [rbp - 0x810]
0x1007b1561: jae 0x1007b165b
0x1007b1567: shl r15, 4
0x1007b156b: mov r8, qword ptr [rbp - 0x7e8]
0x1007b1572: add r8, r15
0x1007b1575: mov rax, qword ptr [rbp - 0x808]
0x1007b157c: mov rax, qword ptr [rax + 0x28]
0x1007b1580: mov rdx, rbx
0x1007b1583: shl rdx, 5
0x1007b1587: mov rcx, qword ptr [rdi + 0x30]
0x1007b158b: mov esi, dword ptr [rbp + rbx*4 - 0x7e0]
0x1007b1592: mov rcx, qword ptr [rcx + rsi*8]
0x1007b1596: mov qword ptr [rax + rdx], rcx
0x1007b159a: mov qword ptr [rbp - 0x7f0], rbx
0x1007b15a1: mov rcx, qword ptr [rbp + rbx*8 - 0x550]
0x1007b15a9: mov qword ptr [rax + rdx + 8], rcx
0x1007b15ae: mov qword ptr [rbp - 0x7e8], r8
0x1007b15b5: mov qword ptr [rax + rdx + 0x10], r8
0x1007b15ba: mov esi, dword ptr [rcx + 0x30]
0x1007b15bd: mov qword ptr [rax + rdx + 0x18], 0
0x1007b15c6: mov r15, rsi
0x1007b15c9: test rsi, rsi
0x1007b15cc: je 0x1007b1550
0x1007b15ce: lea r12, [rax + rdx]
0x1007b15d2: lea r14, [rax + rdx + 8]
0x1007b15d7: xor ebx, ebx
0x1007b15d9: mov eax, r15d
0x1007b15dc: nop dword ptr [rax]
0x1007b15e0: cmp eax, ebx
0x1007b15e2: jle 0x1007b1682
0x1007b15e8: mov rax, qword ptr [rcx + 0x28]
0x1007b15ec: movsxd rcx, ebx
0x1007b15ef: mov r13, qword ptr [rax + rcx*8]
0x1007b15f3: cmp qword ptr [rdi + 0x18], r13
0x1007b15f7: je 0x1007b1630
0x1007b15f9: mov rsi, r12
0x1007b15fc: mov edx, ebx
0x1007b15fe: call 0x1007b2260 ; 0x1007b2260
0x1007b1603: test rax, rax
0x1007b1606: je 0x1007b16a1
0x1007b160c: mov rcx, qword ptr [r14 + 8]
0x1007b1610: mov edx, ebx
0x1007b1612: shl rdx, 4
0x1007b1616: vmovups xmm0, xmmword ptr [rax]
0x1007b161a: vmovups xmmword ptr [rcx + rdx], xmm0
0x1007b161f: mov rdi, qword ptr [rbp - 0x800]
0x1007b1626: jmp 0x1007b164a ; 0x1007b164a
0x1007b1628: nop dword ptr [rax + rax]
0x1007b1630: mov rax, qword ptr [r14 + 8]
0x1007b1634: mov ecx, ebx
0x1007b1636: shl rcx, 4
0x1007b163a: mov rdx, qword ptr [rbp - 0x7f8]
0x1007b1641: vmovups xmm0, xmmword ptr [rdx]
0x1007b1645: vmovups xmmword ptr [rax + rcx], xmm0
0x1007b164a: inc ebx
0x1007b164c: mov rcx, qword ptr [r14]
0x1007b164f: mov eax, dword ptr [rcx + 0x30]
0x1007b1652: cmp ebx, eax
0x1007b1654: jb 0x1007b15e0
0x1007b1656: jmp 0x1007b1550 ; 0x1007b1550
0x1007b165b: mov rax, qword ptr [rip + 0x45c276] ; 0x100c0d8d8
0x1007b1662: mov rax, qword ptr [rax]
0x1007b1665: cmp rax, qword ptr [rbp - 0x30]
0x1007b1669: jne 0x1007b167d
0x1007b166b: add rsp, 0x7e8
0x1007b1672: pop rbx
0x1007b1673: pop r12
0x1007b1675: pop r13
0x1007b1677: pop r14
0x1007b1679: pop r15
0x1007b167b: pop rbp
0x1007b167c: ret 
0x1007b167d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007b1682: lea rdi, [rip + 0x3f162f] ; 0x100ba2cb8 idx < m_argCount
0x1007b1689: lea rsi, [rip + 0x3f19de] ; 0x100ba306e ../../Code/Base/Meta.h
0x1007b1690: mov edx, 0x256
0x1007b1695: mov ecx, 3
0x1007b169a: call 0x1007e5f70 ; 0x1007e5f70
0x1007b169f: ud2 
0x1007b16a1: mov rax, qword ptr [rbp - 0x800]
0x1007b16a8: mov rax, qword ptr [rax + 0x18]
0x1007b16ac: mov r9, qword ptr [rax + 8]
0x1007b16b0: mov rax, qword ptr [r12]
0x1007b16b4: mov r10, qword ptr [rax + 8]
0x1007b16b8: mov rbx, qword ptr [r14]
0x1007b16bb: sub rsp, 8
0x1007b16bf: lea rdi, [rip + 0x3f1d22] ; 0x100ba33e8 field
0x1007b16c6: lea rsi, [rip + 0x3f1ae9] ; 0x100ba31b6 Module.cpp
0x1007b16cd: lea r8, [rip + 0x3f1d1a] ; 0x100ba33ee Could not find %s::%s field for %s::%s()
0x1007b16d4: mov edx, 0x189
0x1007b16d9: mov ecx, 4
0x1007b16de: xor eax, eax
0x1007b16e0: push qword ptr [rbx]
0x1007b16e2: push qword ptr [r10 + 8]
0x1007b16e6: push qword ptr [r13 + 8]
0x1007b16ea: call 0x1007e6030 ; 0x1007e6030
0x1007b16ef: add rsp, 0x20
0x1007b16f3: ud2 
0x1007b16f5: lea rdi, [rip + 0x3f1ca1] ; 0x100ba339d m_moduleCount <= kMaxFunctions
0x1007b16fc: lea rsi, [rip + 0x3f1ab3] ; 0x100ba31b6 Module.cpp
0x1007b1703: mov edx, 0x15a
0x1007b1708: mov ecx, 3
0x1007b170d: call 0x1007e5f70 ; 0x1007e5f70
0x1007b1712: ud2 
0x1007b1714: lea rdi, [rip + 0x3f1ca1] ; 0x100ba33bc strlen( functionName ) < sizeof( fs->name )
0x1007b171b: lea rsi, [rip + 0x3f1a94] ; 0x100ba31b6 Module.cpp
0x1007b1722: mov edx, 0x16c
0x1007b1727: mov ecx, 3
0x1007b172c: call 0x1007e5f70 ; 0x1007e5f70
0x1007b1731: ud2 
0x1007b1733: nop word ptr cs:[rax + rax]
