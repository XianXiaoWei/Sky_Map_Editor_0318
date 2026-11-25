0x1000e69e0: push rbp
0x1000e69e1: mov rbp, rsp
0x1000e69e4: mov r8d, dword ptr [rdi + 0x78]
0x1000e69e8: test r8d, r8d
0x1000e69eb: je 0x1000e6a24
0x1000e69ed: cmp r8d, 1
0x1000e69f1: jne 0x1000e69f9
0x1000e69f3: test esi, esi
0x1000e69f5: jns 0x1000e6a31
0x1000e69f7: jmp 0x1000e6a24 ; 0x1000e6a24
0x1000e69f9: mov rax, qword ptr [rdi + 0x70]
0x1000e69fd: add rax, 4
0x1000e6a01: xor ecx, ecx
0x1000e6a03: nop word ptr cs:[rax + rax]
0x1000e6a10: cmp dword ptr [rax - 4], esi
0x1000e6a13: jne 0x1000e6a19
0x1000e6a15: cmp dword ptr [rax], edx
0x1000e6a17: je 0x1000e6a28
0x1000e6a19: inc ecx
0x1000e6a1b: sub rax, -0x80
0x1000e6a1f: cmp r8d, ecx
0x1000e6a22: ja 0x1000e6a10
0x1000e6a24: xor eax, eax
0x1000e6a26: pop rbp
0x1000e6a27: ret 
0x1000e6a28: test esi, esi
0x1000e6a2a: js 0x1000e6a24
0x1000e6a2c: cmp ecx, -1
0x1000e6a2f: je 0x1000e6a24
0x1000e6a31: cmp dword ptr [rdi + 0x48], edx
0x1000e6a34: setg cl
0x1000e6a37: cmp esi, edx
0x1000e6a39: setle al
0x1000e6a3c: and al, cl
0x1000e6a3e: pop rbp
0x1000e6a3f: ret 
