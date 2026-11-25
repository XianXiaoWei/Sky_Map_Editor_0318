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