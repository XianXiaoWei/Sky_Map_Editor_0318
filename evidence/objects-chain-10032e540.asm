0x10032e540: push rbp
0x10032e541: mov rbp, rsp
0x10032e544: push r15
0x10032e546: push r14
0x10032e548: push r13
0x10032e54a: push r12
0x10032e54c: push rbx
0x10032e54d: sub rsp, 0x2818
0x10032e554: mov qword ptr [rbp - 0x2838], rsi
0x10032e55b: mov rbx, rdi
0x10032e55e: mov rax, qword ptr [rip + 0x8df373] ; 0x100c0d8d8
0x10032e565: mov rax, qword ptr [rax]
0x10032e568: mov qword ptr [rbp - 0x30], rax
0x10032e56c: mov dword ptr [rbx + 0x10], 0
0x10032e573: lea r15, [rbx + 0x85098]
0x10032e57a: mov rdi, r15
0x10032e57d: call 0x100795b00 ; 0x100795b00
0x10032e582: mov dword ptr [rbx + 0x1050f0], eax
0x10032e588: mov byte ptr [rbx + 0x5038], 0
0x10032e58f: xor r13d, r13d
0x10032e592: mov eax, 0x40
0x10032e597: nop word ptr [rax + rax]
0x10032e5a0: mov rcx, qword ptr [rbx + rax - 0x10]
0x10032e5a5: test rcx, rcx
0x10032e5a8: je 0x10032e5be
0x10032e5aa: cmp dword ptr [rcx + 0x28], 1
0x10032e5ae: jne 0x10032e5be
0x10032e5b0: mov edx, r13d
0x10032e5b3: mov qword ptr [rbp + rdx*8 - 0x2830], rcx
0x10032e5bb: inc r13d
0x10032e5be: mov rcx, qword ptr [rbx + rax]
0x10032e5c2: test rcx, rcx
0x10032e5c5: je 0x10032e5db
0x10032e5c7: cmp dword ptr [rcx + 0x28], 1
0x10032e5cb: jne 0x10032e5db
0x10032e5cd: mov edx, r13d
0x10032e5d0: mov qword ptr [rbp + rdx*8 - 0x2830], rcx
0x10032e5d8: inc r13d
0x10032e5db: add rax, 0x20
0x10032e5df: cmp rax, 0x5040
0x10032e5e5: jne 0x10032e5a0
0x10032e5e7: mov r14d, r13d
0x10032e5ea: lea rsi, [rbp + r14*8 - 0x2830]
0x10032e5f2: lea r12, [rbp - 0x2830]
0x10032e5f9: mov rdi, r12
0x10032e5fc: call 0x100330980 ; 0x100330980
0x10032e601: test r13d, r13d
0x10032e604: mov r13, qword ptr [rbp - 0x2838]
0x10032e60b: je 0x10032e644
0x10032e60d: nop dword ptr [rax]
0x10032e610: mov rbx, qword ptr [r12]
0x10032e614: cmp byte ptr [rbx + 0xc], 0
0x10032e618: je 0x10032e622
0x10032e61a: mov rdi, rbx
0x10032e61d: call 0x10032e2f0 ; 0x10032e2f0
0x10032e622: cmp byte ptr [rbx + 0x20], 0
0x10032e626: jne 0x10032e63b
0x10032e628: mov byte ptr [rbx + 0x20], 1
0x10032e62c: mov rax, qword ptr [rbx]
0x10032e62f: mov rdi, rbx
0x10032e632: mov rsi, r13
0x10032e635: mov rdx, r15
0x10032e638: call qword ptr [rax + 0x10]
0x10032e63b: add r12, 8
0x10032e63f: dec r14
0x10032e642: jne 0x10032e610
0x10032e644: mov rax, qword ptr [rip + 0x8df28d] ; 0x100c0d8d8
0x10032e64b: mov rax, qword ptr [rax]
0x10032e64e: cmp rax, qword ptr [rbp - 0x30]
0x10032e652: jne 0x10032e666
0x10032e654: add rsp, 0x2818
0x10032e65b: pop rbx
0x10032e65c: pop r12
0x10032e65e: pop r13
0x10032e660: pop r14
0x10032e662: pop r15
0x10032e664: pop rbp
0x10032e665: ret 
0x10032e666: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032e66b: nop dword ptr [rax + rax]
