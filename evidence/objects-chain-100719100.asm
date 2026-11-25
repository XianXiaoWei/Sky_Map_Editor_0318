0x100719100: push rbp
0x100719101: mov rbp, rsp
0x100719104: mov rcx, qword ptr [rsi]
0x100719107: lea rax, [rcx - 8]
0x10071910b: test rcx, rcx
0x10071910e: cmove rax, rcx
0x100719112: pop rbp
0x100719113: ret 
0x100719114: nop word ptr cs:[rax + rax]
