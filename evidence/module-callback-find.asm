0x1007b17e0: push rbp
0x1007b17e1: mov rbp, rsp
0x1007b17e4: push r15
0x1007b17e6: push r14
0x1007b17e8: push r13
0x1007b17ea: push r12
0x1007b17ec: push rbx
0x1007b17ed: sub rsp, 0x58
0x1007b17f1: mov r12, rdx
0x1007b17f4: mov r15, rdi
0x1007b17f7: mov rax, qword ptr [rip + 0x45c0da] ; 0x100c0d8d8
0x1007b17fe: mov rax, qword ptr [rax]
0x1007b1801: mov qword ptr [rbp - 0x30], rax
0x1007b1805: lea rdi, [rbp - 0x68]
0x1007b1809: mov edx, 0x20
0x1007b180e: mov qword ptr [rbp - 0x80], rsi
0x1007b1812: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007b1817: mov rbx, qword ptr [r15 + 0x40]
0x1007b181b: mov r14d, dword ptr [r15 + 0x48]
0x1007b181f: imul rax, r14, 0x38
0x1007b1823: add rax, rbx
0x1007b1826: mov qword ptr [rbp - 0x78], rax
0x1007b182a: test r14, r14
0x1007b182d: mov qword ptr [rbp - 0x70], r15
0x1007b1831: je 0x1007b1883
0x1007b1833: mov r15, r14
0x1007b1836: nop word ptr cs:[rax + rax]
0x1007b1840: shr r15, 0x3f
0x1007b1844: add r15, r14
0x1007b1847: sar r15, 1
0x1007b184a: imul r13, r15, 0x38
0x1007b184e: lea rdi, [rbx + r13]
0x1007b1852: lea rsi, [rbp - 0x68]
0x1007b1856: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b185b: test eax, eax
0x1007b185d: js 0x1007b1870
0x1007b185f: mov r14, r15
0x1007b1862: test r15, r15
0x1007b1865: jne 0x1007b1840
0x1007b1867: jmp 0x1007b1883 ; 0x1007b1883
0x1007b1869: nop dword ptr [rax]
0x1007b1870: dec r14
0x1007b1873: sub r14, r15
0x1007b1876: lea rbx, [rbx + r13 + 0x38]
0x1007b187b: mov r15, r14
0x1007b187e: test r15, r15
0x1007b1881: jne 0x1007b1840
0x1007b1883: cmp rbx, qword ptr [rbp - 0x78]
0x1007b1887: mov r13, qword ptr [rbp - 0x80]
0x1007b188b: je 0x1007b1944
0x1007b1891: mov rdi, rbx
0x1007b1894: mov rsi, r13
0x1007b1897: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b189c: test eax, eax
0x1007b189e: jne 0x1007b1944
0x1007b18a4: mov r14d, dword ptr [rbx + 0x30]
0x1007b18a8: test r14d, r14d
0x1007b18ab: je 0x1007b18e1
0x1007b18ad: mov r15, qword ptr [rbx + 0x28]
0x1007b18b1: xor ebx, ebx
0x1007b18b3: nop word ptr cs:[rax + rax]
0x1007b18c0: mov rax, qword ptr [r15]
0x1007b18c3: mov rax, qword ptr [rax + 0x10]
0x1007b18c7: mov rdi, qword ptr [rax]
0x1007b18ca: mov rsi, r12
0x1007b18cd: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b18d2: test eax, eax
0x1007b18d4: je 0x1007b191d
0x1007b18d6: inc ebx
0x1007b18d8: add r15, 0x20
0x1007b18dc: cmp ebx, r14d
0x1007b18df: jb 0x1007b18c0
0x1007b18e1: mov rax, qword ptr [rbp - 0x70]
0x1007b18e5: mov rax, qword ptr [rax + 0x18]
0x1007b18e9: mov r9, qword ptr [rax + 8]
0x1007b18ed: lea rdi, [rip + 0x3f1738] ; 0x100ba302c false
0x1007b18f4: lea rsi, [rip + 0x3f18bb] ; 0x100ba31b6 Module.cpp
0x1007b18fb: lea r8, [rip + 0x3f1bba] ; 0x100ba34bc No module %s::%s for function %s
0x1007b1902: mov edx, 0x1bc
0x1007b1907: mov ecx, 4
0x1007b190c: xor eax, eax
0x1007b190e: push r13
0x1007b1910: push r12
0x1007b1912: call 0x1007e6030 ; 0x1007e6030
0x1007b1917: add rsp, 0x10
0x1007b191b: ud2 
0x1007b191d: mov rax, qword ptr [rip + 0x45bfb4] ; 0x100c0d8d8
0x1007b1924: mov rax, qword ptr [rax]
0x1007b1927: cmp rax, qword ptr [rbp - 0x30]
0x1007b192b: jne 0x1007b193f
0x1007b192d: mov rax, r15
0x1007b1930: add rsp, 0x58
0x1007b1934: pop rbx
0x1007b1935: pop r12
0x1007b1937: pop r13
0x1007b1939: pop r14
0x1007b193b: pop r15
0x1007b193d: pop rbp
0x1007b193e: ret 
0x1007b193f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007b1944: lea rdi, [rip + 0x3f19bd] ; 0x100ba3308 fs != fsEnd && strcmp( fs->name, functionName ) == 0
0x1007b194b: lea rsi, [rip + 0x3f1864] ; 0x100ba31b6 Module.cpp
0x1007b1952: lea r8, [rip + 0x3f19e4] ; 0x100ba333d No function called '%s' registered with ModuleBarn
0x1007b1959: mov edx, 0x1b4
0x1007b195e: mov ecx, 4
0x1007b1963: xor eax, eax
0x1007b1965: mov r9, r13
0x1007b1968: call 0x1007e6030 ; 0x1007e6030
0x1007b196d: ud2 
0x1007b196f: nop 
