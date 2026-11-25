0x100342800: push rbp
0x100342801: mov rbp, rsp
0x100342804: push rbx
0x100342805: push rax
0x100342806: mov rbx, rsi
0x100342809: mov rdi, rbx
0x10034280c: call 0x10032eea0 ; 0x10032eea0
0x100342811: mov rax, qword ptr [rip + 0x1ab3548] ; 0x101df5d60
0x100342818: mov eax, dword ptr [rax + 0x38]
0x10034281b: mov dword ptr [rbx + 8], eax
0x10034281e: mov rax, qword ptr [rip + 0x8caca3] ; 0x100c0d4c8
0x100342825: add rax, 0x10
0x100342829: mov qword ptr [rbx], rax
0x10034282c: mov byte ptr [rbx + 0x54], 0
0x100342830: mov rax, rbx
0x100342833: add rsp, 8
0x100342837: pop rbx
0x100342838: pop rbp
0x100342839: ret 
