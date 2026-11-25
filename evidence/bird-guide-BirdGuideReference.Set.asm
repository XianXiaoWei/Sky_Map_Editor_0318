0x100133b50: push rbp
0x100133b51: mov rbp, rsp
0x100133b54: mov dword ptr [rdi + 0x18], 0
0x100133b5b: mov qword ptr [rdi + 0x10], rsi
0x100133b5f: test rsi, rsi
0x100133b62: je 0x100133b6d
0x100133b64: mov eax, dword ptr [rsi + 0xc4]
0x100133b6a: mov dword ptr [rdi + 0x18], eax
0x100133b6d: mov byte ptr [rdi + 0x3c], 0
0x100133b71: mov eax, dword ptr [rdi + 0x2c]
0x100133b74: inc eax
0x100133b76: mov dword ptr [rdi + 0x2c], eax
0x100133b79: mov dword ptr [rdi + 0x28], eax
0x100133b7c: mov qword ptr [rdi + 0x20], 0x40f00000
0x100133b84: pop rbp
0x100133b85: ret 
0x100133b86: nop word ptr cs:[rax + rax]
