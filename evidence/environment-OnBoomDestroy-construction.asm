0x1004e2bc0: push rbp
0x1004e2bc1: mov rbp, rsp
0x1004e2bc4: push rbx
0x1004e2bc5: push rax
0x1004e2bc6: mov rbx, rsi
0x1004e2bc9: mov rdi, rbx
0x1004e2bcc: call 0x10032eea0 ; 0x10032eea0
0x1004e2bd1: mov rax, qword ptr [rip + 0x1b30ca0] ; 0x102013878
0x1004e2bd8: mov eax, dword ptr [rax + 0x38]
0x1004e2bdb: mov dword ptr [rbx + 8], eax
0x1004e2bde: mov rax, qword ptr [rip + 0x729e43] ; 0x100c0ca28
0x1004e2be5: add rax, 0x10
0x1004e2be9: mov qword ptr [rbx], rax
0x1004e2bec: vxorps xmm0, xmm0, xmm0
0x1004e2bf0: vmovups xmmword ptr [rbx + 0x40], xmm0
0x1004e2bf5: mov qword ptr [rbx + 0x50], 0
0x1004e2bfd: vmovups xmmword ptr [rbx + 0x60], xmm0
0x1004e2c02: mov qword ptr [rbx + 0x70], 0
0x1004e2c0a: mov qword ptr [rbx + 0x80], 0
0x1004e2c15: mov rax, rbx
0x1004e2c18: add rsp, 8
0x1004e2c1c: pop rbx
0x1004e2c1d: pop rbp
0x1004e2c1e: ret 
