0x1006b0f30: push rbp
0x1006b0f31: mov rbp, rsp
0x1006b0f34: push rbx
0x1006b0f35: push rax
0x1006b0f36: mov rbx, rsi
0x1006b0f39: call 0x1007abc10 ; 0x1007abc10
0x1006b0f3e: mov rax, qword ptr [rip + 0x198321b] ; 0x102034160
0x1006b0f45: mov eax, dword ptr [rax + 0x38]
0x1006b0f48: mov dword ptr [rbx], eax
0x1006b0f4a: mov qword ptr [rbx + 0x1e8], 0
0x1006b0f55: mov byte ptr [rbx + 0x1f0], 0
0x1006b0f5c: vmovaps xmm0, xmmword ptr [rip + 0x40861c] ; 0x100ab9580
0x1006b0f64: vmovups xmmword ptr [rbx + 0x1f4], xmm0
0x1006b0f6c: mov rax, rbx
0x1006b0f6f: add rsp, 8
0x1006b0f73: pop rbx
0x1006b0f74: pop rbp
0x1006b0f75: ret 
0x1006b0f76: nop word ptr cs:[rax + rax]
