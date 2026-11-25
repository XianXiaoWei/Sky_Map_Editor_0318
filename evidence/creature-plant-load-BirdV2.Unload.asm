0x1001a20f0: push rbp
0x1001a20f1: mov rbp, rsp
0x1001a20f4: push r15
0x1001a20f6: push r14
0x1001a20f8: push r12
0x1001a20fa: push rbx
0x1001a20fb: mov r14, rdx
0x1001a20fe: mov r12, rdi
0x1001a2101: mov r15, qword ptr [r14 + 0x3f0]
0x1001a2108: mov rsi, qword ptr [r12 + 0x420]
0x1001a2110: mov rdi, r15
0x1001a2113: call 0x10039a780 ; 0x10039a780
0x1001a2118: mov qword ptr [r12 + 0x420], 0
0x1001a2124: mov rsi, qword ptr [r12 + 0x428]
0x1001a212c: mov rdi, r15
0x1001a212f: call 0x10039a780 ; 0x10039a780
0x1001a2134: mov qword ptr [r12 + 0x428], 0
0x1001a2140: mov rsi, qword ptr [r12 + 0x430]
0x1001a2148: mov rdi, r15
0x1001a214b: call 0x10039a780 ; 0x10039a780
0x1001a2150: mov qword ptr [r12 + 0x430], 0
0x1001a215c: mov rsi, qword ptr [r12 + 0x438]
0x1001a2164: mov rdi, r15
0x1001a2167: call 0x10039a780 ; 0x10039a780
0x1001a216c: mov qword ptr [r12 + 0x438], 0
0x1001a2178: mov rax, qword ptr [r12 + 0x448]
0x1001a2180: test rax, rax
0x1001a2183: je 0x1001a218c
0x1001a2185: mov byte ptr [rax + 0xb1], 1
0x1001a218c: mov rax, qword ptr [r12 + 0x450]
0x1001a2194: test rax, rax
0x1001a2197: je 0x1001a21a0
0x1001a2199: mov byte ptr [rax + 0xb1], 1
0x1001a21a0: mov rdi, qword ptr [r12 + 0x3a0]
0x1001a21a8: xor ebx, ebx
0x1001a21aa: xor esi, esi
0x1001a21ac: call 0x1004636d0 ; 0x1004636d0
0x1001a21b1: mov byte ptr [r12 + 0xd0], 0
0x1001a21ba: mov rax, qword ptr [r14 + 0x380]
0x1001a21c1: mov ecx, dword ptr [rax + 0x210]
0x1001a21c7: test rcx, rcx
0x1001a21ca: je 0x1001a21fd
0x1001a21cc: nop dword ptr [rax]
0x1001a21d0: mov edx, ebx
0x1001a21d2: cmp qword ptr [rax + rdx*8 + 0x10], r12
0x1001a21d7: je 0x1001a21e1
0x1001a21d9: inc ebx
0x1001a21db: cmp ebx, ecx
0x1001a21dd: jb 0x1001a21d0
0x1001a21df: jmp 0x1001a21fd ; 0x1001a21fd
0x1001a21e1: lea edx, [rcx - 1]
0x1001a21e4: mov rsi, qword ptr [rax + rdx*8 + 0x10]
0x1001a21e9: mov qword ptr [rax + rcx*8 + 0x10], rsi
0x1001a21ee: mov dword ptr [rax + 0x210], edx
0x1001a21f4: mov qword ptr [rax + rdx*8 + 0x10], 0
0x1001a21fd: pop rbx
0x1001a21fe: pop r12
0x1001a2200: pop r14
0x1001a2202: pop r15
0x1001a2204: pop rbp
0x1001a2205: ret 
0x1001a2206: nop word ptr cs:[rax + rax]
