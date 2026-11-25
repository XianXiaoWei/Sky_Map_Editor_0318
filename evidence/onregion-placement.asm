0x1004df970: push rbp
0x1004df971: mov rbp, rsp
0x1004df974: push rbx
0x1004df975: push rax
0x1004df976: mov rbx, rsi
0x1004df979: mov rdi, rbx
0x1004df97c: call 0x10032eea0 ; 0x10032eea0
0x1004df981: mov rax, qword ptr [rip + 0x1b335d0] ; 0x102012f58
0x1004df988: mov eax, dword ptr [rax + 0x38]
0x1004df98b: mov dword ptr [rbx + 8], eax
0x1004df98e: mov rax, qword ptr [rip + 0x72db93] ; 0x100c0d528
0x1004df995: add rax, 0x10
0x1004df999: mov qword ptr [rbx], rax
0x1004df99c: mov byte ptr [rbx + 0x5e], 0
0x1004df9a0: mov dword ptr [rbx + 0x60], 0
0x1004df9a7: mov byte ptr [rbx + 0x68], 0
0x1004df9ab: mov rax, rbx
0x1004df9ae: add rsp, 8
0x1004df9b2: pop rbx
0x1004df9b3: pop rbp
0x1004df9b4: ret 
0x1004df9b5: nop word ptr cs:[rax + rax]
