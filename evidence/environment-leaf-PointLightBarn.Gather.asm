0x100540c10: cmp rdx, 0x100
0x100540c17: jb 0x100540c6e
0x100540c19: xor eax, eax
0x100540c1b: mov rcx, 0xffffffffffffa000
0x100540c22: nop word ptr cs:[rax + rax]
0x100540c30: cmp byte ptr [rdi + rcx + 0x6060], 0
0x100540c38: je 0x100540c4a
0x100540c3a: lea r8, [rdi + rcx + 0x6010]
0x100540c42: mov edx, eax
0x100540c44: inc eax
0x100540c46: mov qword ptr [rsi + rdx*8], r8
0x100540c4a: cmp byte ptr [rdi + rcx + 0x60c0], 0
0x100540c52: je 0x100540c64
0x100540c54: lea r8, [rdi + rcx + 0x6070]
0x100540c5c: mov edx, eax
0x100540c5e: inc eax
0x100540c60: mov qword ptr [rsi + rdx*8], r8
0x100540c64: add rcx, 0xc0
0x100540c6b: jne 0x100540c30
0x100540c6d: ret 
0x100540c6e: push rbp
0x100540c6f: mov rbp, rsp
0x100540c72: lea rdi, [rip + 0x64fcf9] ; 0x100b90972 size >= kMaxLights
0x100540c79: lea rsi, [rip + 0x64fce3] ; 0x100b90963 PointLight.cpp
0x100540c80: lea r8, [rip + 0x64fcfe] ; 0x100b90985 Point light array is too small!
0x100540c87: mov edx, 0x5e
0x100540c8c: mov ecx, 4
0x100540c91: xor eax, eax
0x100540c93: call 0x1007e6030 ; 0x1007e6030
0x100540c98: ud2 
0x100540c9a: nop word ptr [rax + rax]
