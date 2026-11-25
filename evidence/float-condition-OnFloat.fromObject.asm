0x100719ea0: push rbp
0x100719ea1: mov rbp, rsp
0x100719ea4: mov rcx, qword ptr [rsi]
0x100719ea7: lea rax, [rcx - 8]
0x100719eab: test rcx, rcx
0x100719eae: cmove rax, rcx
0x100719eb2: pop rbp
0x100719eb3: ret 
0x100719eb4: nop word ptr cs:[rax + rax]
