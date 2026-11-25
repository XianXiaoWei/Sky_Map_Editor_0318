0x10052b080: push rbp
0x10052b081: mov rbp, rsp
0x10052b084: push rbx
0x10052b085: push rax
0x10052b086: mov rbx, rsi
0x10052b089: mov rdi, rbx
0x10052b08c: call 0x10032eea0 ; 0x10032eea0
0x10052b091: mov rax, qword ptr [rip + 0x1aed6e0] ; 0x102018778
0x10052b098: mov eax, dword ptr [rax + 0x38]
0x10052b09b: mov dword ptr [rbx + 8], eax
0x10052b09e: mov rax, qword ptr [rip + 0x6e210b] ; 0x100c0d1b0
0x10052b0a5: add rax, 0x10
0x10052b0a9: mov qword ptr [rbx], rax
0x10052b0ac: mov qword ptr [rbx + 0x40], 0
0x10052b0b4: mov word ptr [rbx + 0x48], 0
0x10052b0ba: mov rax, rbx
0x10052b0bd: add rsp, 8
0x10052b0c1: pop rbx
0x10052b0c2: pop rbp
0x10052b0c3: ret 
