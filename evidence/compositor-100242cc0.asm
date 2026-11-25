0x100242cc0: push rbp
0x100242cc1: mov rbp, rsp
0x100242cc4: push r14
0x100242cc6: push rbx
0x100242cc7: mov r14, rdi
0x100242cca: cmp dword ptr [r14], 0
0x100242cce: je 0x100242cf7
0x100242cd0: xor ebx, ebx
0x100242cd2: nop word ptr cs:[rax + rax]
0x100242ce0: mov eax, ebx
0x100242ce2: imul rax, rax, 0x78
0x100242ce6: lea rdi, [r14 + rax + 8]
0x100242ceb: call 0x1007f0c90 ; 0x1007f0c90
0x100242cf0: inc ebx
0x100242cf2: cmp ebx, dword ptr [r14]
0x100242cf5: jb 0x100242ce0
0x100242cf7: mov byte ptr [r14 + 4], 1
0x100242cfc: mov dword ptr [r14], 0
0x100242d03: pop rbx
0x100242d04: pop r14
0x100242d06: pop rbp
0x100242d07: ret 
0x100242d08: nop dword ptr [rax + rax]
