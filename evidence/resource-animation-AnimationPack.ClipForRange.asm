0x1000e49e0: push rbp
0x1000e49e1: mov rbp, rsp
0x1000e49e4: mov r8d, dword ptr [rdi + 0x78]
0x1000e49e8: mov eax, 0xffffffff
0x1000e49ed: test r8d, r8d
0x1000e49f0: je 0x1000e4a14
0x1000e49f2: mov rdi, qword ptr [rdi + 0x70]
0x1000e49f6: add rdi, 4
0x1000e49fa: xor ecx, ecx
0x1000e49fc: nop dword ptr [rax]
0x1000e4a00: cmp dword ptr [rdi - 4], esi
0x1000e4a03: jne 0x1000e4a09
0x1000e4a05: cmp dword ptr [rdi], edx
0x1000e4a07: je 0x1000e4a16
0x1000e4a09: inc ecx
0x1000e4a0b: sub rdi, -0x80
0x1000e4a0f: cmp r8d, ecx
0x1000e4a12: ja 0x1000e4a00
0x1000e4a14: pop rbp
0x1000e4a15: ret 
0x1000e4a16: mov eax, ecx
0x1000e4a18: pop rbp
0x1000e4a19: ret 
0x1000e4a1a: nop word ptr [rax + rax]
