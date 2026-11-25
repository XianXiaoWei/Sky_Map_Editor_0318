0x1001d3b60: push rbp
0x1001d3b61: mov rbp, rsp
0x1001d3b64: push rbx
0x1001d3b65: push rax
0x1001d3b66: mov rbx, rsi
0x1001d3b69: call 0x1007abc10 ; 0x1007abc10
0x1001d3b6e: mov eax, dword ptr [rax + 0x38]
0x1001d3b71: mov dword ptr [rbx], eax
0x1001d3b73: call 0x1003f0590 ; 0x1003f0590
0x1001d3b78: mov rax, qword ptr [rip + 0x1c08a59] ; 0x101ddc5d8
0x1001d3b7f: mov eax, dword ptr [rax + 0x38]
0x1001d3b82: mov dword ptr [rbx], eax
0x1001d3b84: vxorps xmm0, xmm0, xmm0
0x1001d3b88: vmovups xmmword ptr [rbx + 0x10], xmm0
0x1001d3b8d: mov qword ptr [rbx + 0x20], 0
0x1001d3b95: mov byte ptr [rbx + 0x3c], 0
0x1001d3b99: mov rax, rbx
0x1001d3b9c: add rsp, 8
0x1001d3ba0: pop rbx
0x1001d3ba1: pop rbp
0x1001d3ba2: ret 
