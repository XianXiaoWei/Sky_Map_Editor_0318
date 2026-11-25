0x100591c80: push rbp
0x100591c81: mov rbp, rsp
0x100591c84: push rbx
0x100591c85: push rax
0x100591c86: mov rbx, rsi
0x100591c89: mov rdi, rbx
0x100591c8c: call 0x10032eea0 ; 0x10032eea0
0x100591c91: mov rax, qword ptr [rip + 0x1a8e890] ; 0x102020528
0x100591c98: mov eax, dword ptr [rax + 0x38]
0x100591c9b: mov dword ptr [rbx + 8], eax
0x100591c9e: mov rax, qword ptr [rip + 0x67b693] ; 0x100c0d338
0x100591ca5: add rax, 0x10
0x100591ca9: mov qword ptr [rbx], rax
0x100591cac: mov rax, rbx
0x100591caf: add rsp, 8
0x100591cb3: pop rbx
0x100591cb4: pop rbp
0x100591cb5: ret 
0x100591cb6: nop word ptr cs:[rax + rax]
