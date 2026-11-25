0x1001aa050: push rbp
0x1001aa051: mov rbp, rsp
0x1001aa054: push rbx
0x1001aa055: push rax
0x1001aa056: mov rbx, rsi
0x1001aa059: mov rdi, rbx
0x1001aa05c: call 0x10032eea0 ; 0x10032eea0
0x1001aa061: mov rax, qword ptr [rip + 0x1c30b88] ; 0x101ddabf0
0x1001aa068: mov eax, dword ptr [rax + 0x38]
0x1001aa06b: mov dword ptr [rbx + 8], eax
0x1001aa06e: mov rax, qword ptr [rip + 0xa62e2b] ; 0x100c0cea0
0x1001aa075: add rax, 0x10
0x1001aa079: mov qword ptr [rbx], rax
0x1001aa07c: mov rax, rbx
0x1001aa07f: add rsp, 8
0x1001aa083: pop rbx
0x1001aa084: pop rbp
0x1001aa085: ret 
0x1001aa086: nop word ptr cs:[rax + rax]
