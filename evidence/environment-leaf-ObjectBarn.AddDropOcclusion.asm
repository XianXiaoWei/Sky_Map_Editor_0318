0x1004d3940: cmp esi, 2
0x1004d3943: jne 0x1004d396a
0x1004d3945: push rbp
0x1004d3946: mov rbp, rsp
0x1004d3949: mov rdi, qword ptr [rdi + 0x10]
0x1004d394d: vmulss xmm2, xmm2, dword ptr [rip + 0x5d4ccb] ; 0x100aa8620
0x1004d3955: mov rsi, rcx
0x1004d3958: vmovaps xmm0, xmm1
0x1004d395c: vmovaps xmm1, xmm2
0x1004d3960: vmovaps xmm2, xmm3
0x1004d3964: call 0x100416140 ; 0x100416140
0x1004d3969: pop rbp
0x1004d396a: ret 
0x1004d396b: nop dword ptr [rax + rax]
