0x1001b2110: push rbp
0x1001b2111: mov rbp, rsp
0x1001b2114: push rbx
0x1001b2115: sub rsp, 0x48
0x1001b2119: mov rbx, rdi
0x1001b211c: lea rdi, [rbp - 0x50]
0x1001b2120: call 0x1007fa3b0 ; 0x1007fa3b0
0x1001b2125: mov qword ptr [rbx], rax
0x1001b2128: mov dword ptr [rbx + 0x10], 0
0x1001b212f: add rsp, 0x48
0x1001b2133: pop rbx
0x1001b2134: pop rbp
0x1001b2135: ret 
0x1001b2136: nop word ptr cs:[rax + rax]
