0x1005409b0: push rbp
0x1005409b1: mov rbp, rsp
0x1005409b4: xor eax, eax
0x1005409b6: nop word ptr cs:[rax + rax]
0x1005409c0: cmp byte ptr [rdi + rax + 0x60], 0
0x1005409c5: je 0x1005409e4
0x1005409c7: lea rcx, [rdi + rax + 0x10]
0x1005409cc: mov byte ptr [rdi + rax + 0x60], 0
0x1005409d1: mov rdx, qword ptr [rdi + 0x6010]
0x1005409d8: mov qword ptr [rdi + rax + 0x10], rdx
0x1005409dd: mov qword ptr [rdi + 0x6010], rcx
0x1005409e4: cmp byte ptr [rdi + rax + 0xc0], 0
0x1005409ec: je 0x100540a0e
0x1005409ee: lea rcx, [rdi + rax + 0x70]
0x1005409f3: mov byte ptr [rdi + rax + 0xc0], 0
0x1005409fb: mov rdx, qword ptr [rdi + 0x6010]
0x100540a02: mov qword ptr [rdi + rax + 0x70], rdx
0x100540a07: mov qword ptr [rdi + 0x6010], rcx
0x100540a0e: add rax, 0xc0
0x100540a14: cmp rax, 0x6000
0x100540a1a: jne 0x1005409c0
0x100540a1c: pop rbp
0x100540a1d: ret 
0x100540a1e: nop 
