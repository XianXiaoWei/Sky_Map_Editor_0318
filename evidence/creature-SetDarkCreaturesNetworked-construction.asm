0x100273f60: push rbp
0x100273f61: mov rbp, rsp
0x100273f64: push rbx
0x100273f65: push rax
0x100273f66: mov rbx, rsi
0x100273f69: mov rdi, rbx
0x100273f6c: call 0x10032eea0 ; 0x10032eea0
0x100273f71: mov rax, qword ptr [rip + 0x1b738e8] ; 0x101de7860
0x100273f78: mov eax, dword ptr [rax + 0x38]
0x100273f7b: mov dword ptr [rbx + 8], eax
0x100273f7e: mov rax, qword ptr [rip + 0x99946b] ; 0x100c0d3f0
0x100273f85: add rax, 0x10
0x100273f89: mov qword ptr [rbx], rax
0x100273f8c: mov qword ptr [rbx + 0x38], 0
0x100273f94: mov byte ptr [rbx + 0x40], 1
0x100273f98: mov rax, rbx
0x100273f9b: add rsp, 8
0x100273f9f: pop rbx
0x100273fa0: pop rbp
0x100273fa1: ret 
