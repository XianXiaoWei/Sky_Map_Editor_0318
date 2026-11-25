0x1003a1430: push rbp
0x1003a1431: mov rbp, rsp
0x1003a1434: mov rcx, qword ptr [rsi]
0x1003a1437: lea rax, [rcx + 8]
0x1003a143b: test rcx, rcx
0x1003a143e: cmove rax, rcx
0x1003a1442: pop rbp
0x1003a1443: ret 
0x1003a1444: nop word ptr cs:[rax + rax]
