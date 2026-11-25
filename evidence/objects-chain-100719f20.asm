0x100719f20: push rbp
0x100719f21: mov rbp, rsp
0x100719f24: push rbx
0x100719f25: push rax
0x100719f26: mov rax, qword ptr [rip + 0x4f35a3] ; 0x100c0d4d0
0x100719f2d: add rax, 0x10
0x100719f31: mov qword ptr [rdi], rax
0x100719f34: test byte ptr [rdi + 0x60], 1
0x100719f38: je 0x100719f4e
0x100719f3a: mov rbx, qword ptr [rdi + 0x70]
0x100719f3e: call 0x1007e50d0 ; 0x1007e50d0
0x100719f43: mov rdi, rax
0x100719f46: mov rsi, rbx
0x100719f49: call 0x1007e5db0 ; 0x1007e5db0
0x100719f4e: add rsp, 8
0x100719f52: pop rbx
0x100719f53: pop rbp
0x100719f54: ret 
0x100719f55: mov rdi, rax
0x100719f58: call 0x100011bf0 ; 0x100011bf0
0x100719f5d: nop dword ptr [rax]
