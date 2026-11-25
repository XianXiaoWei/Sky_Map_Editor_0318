0x1001d3e90: push rbp
0x1001d3e91: mov rbp, rsp
0x1001d3e94: push rbx
0x1001d3e95: push rax
0x1001d3e96: mov rbx, rsi
0x1001d3e99: call 0x1007abc10 ; 0x1007abc10
0x1001d3e9e: mov eax, dword ptr [rax + 0x38]
0x1001d3ea1: mov dword ptr [rbx + 8], eax
0x1001d3ea4: call 0x10074a170 ; 0x10074a170
0x1001d3ea9: mov eax, dword ptr [rax + 0x38]
0x1001d3eac: mov dword ptr [rbx + 8], eax
0x1001d3eaf: mov rax, qword ptr [rip + 0xa39992] ; 0x100c0d848
0x1001d3eb6: add rax, 0x10
0x1001d3eba: mov qword ptr [rbx], rax
0x1001d3ebd: call 0x100262d70 ; 0x100262d70
0x1001d3ec2: mov rax, qword ptr [rip + 0x1c089a7] ; 0x101ddc870
0x1001d3ec9: mov eax, dword ptr [rax + 0x38]
0x1001d3ecc: mov dword ptr [rbx + 8], eax
0x1001d3ecf: lea rax, [rip + 0xa3ec0a] ; 0x100c12ae0
0x1001d3ed6: mov qword ptr [rbx], rax
0x1001d3ed9: mov dword ptr [rbx + 0xe0], 0
0x1001d3ee3: mov qword ptr [rbx + 0xe8], 0
0x1001d3eee: vxorps xmm0, xmm0, xmm0
0x1001d3ef2: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001d3efa: mov dword ptr [rbx + 0x100], 0
0x1001d3f04: mov dword ptr [rbx + 0xac0], 0
0x1001d3f0e: mov dword ptr [rbx + 0xae0], 0
0x1001d3f18: mov dword ptr [rbx + 0xb28], 0
0x1001d3f22: mov dword ptr [rbx + 0xb60], 0
0x1001d3f2c: mov rax, rbx
0x1001d3f2f: add rsp, 8
0x1001d3f33: pop rbx
0x1001d3f34: pop rbp
0x1001d3f35: ret 
