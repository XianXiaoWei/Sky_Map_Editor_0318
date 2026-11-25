0x1007c2250: push rbp
0x1007c2251: mov rbp, rsp
0x1007c2254: push r14
0x1007c2256: push rbx
0x1007c2257: mov r14, rsi
0x1007c225a: mov rbx, rdi
0x1007c225d: call 0x1007c41e0 ; 0x1007c41e0
0x1007c2262: mov rax, qword ptr [rbx + 0x4d0]
0x1007c2269: mov qword ptr [r14 + 0x68], rax
0x1007c226d: mov qword ptr [rbx + 0x4d0], r14
0x1007c2274: pop rbx
0x1007c2275: pop r14
0x1007c2277: pop rbp
0x1007c2278: ret 
0x1007c2279: nop dword ptr [rax]
