0x1003413a0: push rbp
0x1003413a1: mov rbp, rsp
0x1003413a4: push rbx
0x1003413a5: push rax
0x1003413a6: mov rbx, rsi
0x1003413a9: call 0x1007abc10 ; 0x1007abc10
0x1003413ae: mov eax, dword ptr [rax + 0x38]
0x1003413b1: mov dword ptr [rbx + 8], eax
0x1003413b4: call 0x10074a170 ; 0x10074a170
0x1003413b9: mov rax, qword ptr [rip + 0x1ab40d0] ; 0x101df5490
0x1003413c0: mov eax, dword ptr [rax + 0x38]
0x1003413c3: mov dword ptr [rbx + 8], eax
0x1003413c6: lea rax, [rip + 0x8d3cc3] ; 0x100c15090
0x1003413cd: mov qword ptr [rbx], rax
0x1003413d0: vxorps xmm0, xmm0, xmm0
0x1003413d4: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x1003413dc: mov dword ptr [rbx + 0xa0], 0x41f00000
0x1003413e6: mov qword ptr [rbx + 0xa8], 0x41a00000
0x1003413f1: mov byte ptr [rbx + 0xb4], 1
0x1003413f8: mov byte ptr [rbx + 0xb6], 0
0x1003413ff: mov byte ptr [rbx + 0xb8], 0
0x100341406: mov byte ptr [rbx + 0xbb], 0
0x10034140d: mov dword ptr [rbx + 0xbc], 0
0x100341417: mov dword ptr [rbx + 0x11c], 0
0x100341421: mov byte ptr [rbx + 0x13e], 0
0x100341428: mov byte ptr [rbx + 0x140], 0
0x10034142f: mov dword ptr [rbx + 0x150], 0
0x100341439: mov qword ptr [rbx + 0x158], 0
0x100341444: mov qword ptr [rbx + 0x168], 0
0x10034144f: mov qword ptr [rbx + 0x178], 0
0x10034145a: mov qword ptr [rbx + 0x188], 0
0x100341465: mov qword ptr [rbx + 0x198], 0
0x100341470: mov dword ptr [rbx + 0x1a0], 0
0x10034147a: vmovaps xmmword ptr [rbx + 0xe0], xmm0
0x100341482: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x10034148a: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x100341492: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x10034149a: mov rax, rbx
0x10034149d: add rsp, 8
0x1003414a1: pop rbx
0x1003414a2: pop rbp
0x1003414a3: ret 
