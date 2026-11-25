0x100285be0: push rbp
0x100285be1: mov rbp, rsp
0x100285be4: push rbx
0x100285be5: push rax
0x100285be6: mov rbx, rsi
0x100285be9: mov rdi, rbx
0x100285bec: call 0x10032eea0 ; 0x10032eea0
0x100285bf1: mov rax, qword ptr [rip + 0x1b62de0] ; 0x101de89d8
0x100285bf8: mov eax, dword ptr [rax + 0x38]
0x100285bfb: mov dword ptr [rbx + 8], eax
0x100285bfe: mov rax, qword ptr [rip + 0x9875f3] ; 0x100c0d1f8
0x100285c05: add rax, 0x10
0x100285c09: mov qword ptr [rbx], rax
0x100285c0c: mov qword ptr [rbx + 0x54], 0
0x100285c14: mov rax, rbx
0x100285c17: add rsp, 8
0x100285c1b: pop rbx
0x100285c1c: pop rbp
0x100285c1d: ret 
