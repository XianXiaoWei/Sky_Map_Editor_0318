0x1003a1450: push rbp
0x1003a1451: mov rbp, rsp
0x1003a1454: mov rcx, qword ptr [rsi]
0x1003a1457: lea rax, [rcx - 8]
0x1003a145b: test rcx, rcx
0x1003a145e: cmove rax, rcx
0x1003a1462: pop rbp
0x1003a1463: ret 
0x1003a1464: nop word ptr cs:[rax + rax]
