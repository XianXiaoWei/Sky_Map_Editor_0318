0x100719e20: push rbp
0x100719e21: mov rbp, rsp
0x100719e24: push rbx
0x100719e25: push rax
0x100719e26: mov rbx, rsi
0x100719e29: mov rdi, rbx
0x100719e2c: call 0x10032eea0 ; 0x10032eea0
0x100719e31: mov rax, qword ptr [rip + 0x1921958] ; 0x10203b790
0x100719e38: mov eax, dword ptr [rax + 0x38]
0x100719e3b: mov dword ptr [rbx + 8], eax
0x100719e3e: mov rax, qword ptr [rip + 0x4f368b] ; 0x100c0d4d0
0x100719e45: add rax, 0x10
0x100719e49: mov qword ptr [rbx], rax
0x100719e4c: vxorps xmm0, xmm0, xmm0
0x100719e50: vmovups xmmword ptr [rbx + 0x60], xmm0
0x100719e55: mov qword ptr [rbx + 0x70], 0
0x100719e5d: mov rax, rbx
0x100719e60: add rsp, 8
0x100719e64: pop rbx
0x100719e65: pop rbp
0x100719e66: ret 
0x100719e67: nop word ptr [rax + rax]
