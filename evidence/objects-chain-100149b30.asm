0x100149b30: push rbp
0x100149b31: mov rbp, rsp
0x100149b34: push rbx
0x100149b35: push rax
0x100149b36: mov rbx, rsi
0x100149b39: mov rdi, rbx
0x100149b3c: call 0x10032eea0 ; 0x10032eea0
0x100149b41: mov rax, qword ptr [rip + 0x1c8cb08] ; 0x101dd6650
0x100149b48: mov eax, dword ptr [rax + 0x38]
0x100149b4b: mov dword ptr [rbx + 8], eax
0x100149b4e: mov rax, qword ptr [rip + 0xac0c33] ; 0x100c0a788
0x100149b55: add rax, 0x10
0x100149b59: mov qword ptr [rbx], rax
0x100149b5c: mov rax, rbx
0x100149b5f: add rsp, 8
0x100149b63: pop rbx
0x100149b64: pop rbp
0x100149b65: ret 
0x100149b66: nop word ptr cs:[rax + rax]
