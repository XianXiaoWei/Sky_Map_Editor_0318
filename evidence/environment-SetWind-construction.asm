0x100593a90: push rbp
0x100593a91: mov rbp, rsp
0x100593a94: push rbx
0x100593a95: push rax
0x100593a96: mov rbx, rsi
0x100593a99: mov rdi, rbx
0x100593a9c: call 0x10032eea0 ; 0x10032eea0
0x100593aa1: mov rax, qword ptr [rip + 0x1a8cf38] ; 0x1020209e0
0x100593aa8: mov eax, dword ptr [rax + 0x38]
0x100593aab: mov dword ptr [rbx + 8], eax
0x100593aae: mov rax, qword ptr [rip + 0x679a2b] ; 0x100c0d4e0
0x100593ab5: add rax, 0x10
0x100593ab9: mov qword ptr [rbx], rax
0x100593abc: mov qword ptr [rbx + 0x58], 0
0x100593ac4: mov rax, rbx
0x100593ac7: add rsp, 8
0x100593acb: pop rbx
0x100593acc: pop rbp
0x100593acd: ret 
