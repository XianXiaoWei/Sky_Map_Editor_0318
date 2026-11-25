0x10077e4b0: push rbp
0x10077e4b1: mov rbp, rsp
0x10077e4b4: mov r9, qword ptr [rdi + 0x28]
0x10077e4b8: mov r8d, dword ptr [rdi + 0x30]
0x10077e4bc: mov rax, r8
0x10077e4bf: shl rax, 4
0x10077e4c3: lea r10, [r9 + rax]
0x10077e4c7: mov rcx, r9
0x10077e4ca: test r8, r8
0x10077e4cd: je 0x10077e4f4
0x10077e4cf: mov rcx, r9
0x10077e4d2: nop word ptr cs:[rax + rax]
0x10077e4e0: cmp qword ptr [rcx], rsi
0x10077e4e3: je 0x10077e4f4
0x10077e4e5: add rcx, 0x10
0x10077e4e9: add rax, -0x10
0x10077e4ed: jne 0x10077e4e0
0x10077e4ef: jmp 0x10077e5ae ; 0x10077e5ae
0x10077e4f4: cmp rcx, r10
0x10077e4f7: je 0x10077e5ae
0x10077e4fd: lea rdx, [rcx + 0x10]
0x10077e501: cmp rdx, r10
0x10077e504: je 0x10077e5ab
0x10077e50a: shl r8, 4
0x10077e50e: lea r8, [r9 + r8 - 0x20]
0x10077e513: sub r8, rcx
0x10077e516: mov eax, r8d
0x10077e519: shr eax, 4
0x10077e51c: inc eax
0x10077e51e: and rax, 3
0x10077e522: je 0x10077e54a
0x10077e524: neg rax
0x10077e527: nop word ptr [rax + rax]
0x10077e530: cmp qword ptr [rdx], rsi
0x10077e533: je 0x10077e541
0x10077e535: vmovups xmm0, xmmword ptr [rdx]
0x10077e539: vmovups xmmword ptr [rcx], xmm0
0x10077e53d: add rcx, 0x10
0x10077e541: add rdx, 0x10
0x10077e545: inc rax
0x10077e548: jne 0x10077e530
0x10077e54a: cmp r8, 0x30
0x10077e54e: jb 0x10077e5a3
0x10077e550: cmp qword ptr [rdx], rsi
0x10077e553: je 0x10077e561
0x10077e555: vmovups xmm0, xmmword ptr [rdx]
0x10077e559: vmovups xmmword ptr [rcx], xmm0
0x10077e55d: add rcx, 0x10
0x10077e561: cmp qword ptr [rdx + 0x10], rsi
0x10077e565: je 0x10077e574
0x10077e567: vmovups xmm0, xmmword ptr [rdx + 0x10]
0x10077e56c: vmovups xmmword ptr [rcx], xmm0
0x10077e570: add rcx, 0x10
0x10077e574: cmp qword ptr [rdx + 0x20], rsi
0x10077e578: je 0x10077e587
0x10077e57a: vmovups xmm0, xmmword ptr [rdx + 0x20]
0x10077e57f: vmovups xmmword ptr [rcx], xmm0
0x10077e583: add rcx, 0x10
0x10077e587: cmp qword ptr [rdx + 0x30], rsi
0x10077e58b: je 0x10077e59a
0x10077e58d: vmovups xmm0, xmmword ptr [rdx + 0x30]
0x10077e592: vmovups xmmword ptr [rcx], xmm0
0x10077e596: add rcx, 0x10
0x10077e59a: add rdx, 0x40
0x10077e59e: cmp rdx, r10
0x10077e5a1: jne 0x10077e550
0x10077e5a3: mov r9, qword ptr [rdi + 0x28]
0x10077e5a7: mov r8d, dword ptr [rdi + 0x30]
0x10077e5ab: mov r10, rcx
0x10077e5ae: sub r10, r9
0x10077e5b1: sar r10, 4
0x10077e5b5: mov eax, r8d
0x10077e5b8: cmp r10, rax
0x10077e5bb: je 0x10077e5c1
0x10077e5bd: mov dword ptr [rdi + 0x30], r10d
0x10077e5c1: pop rbp
0x10077e5c2: ret 
0x10077e5c3: nop word ptr cs:[rax + rax]
