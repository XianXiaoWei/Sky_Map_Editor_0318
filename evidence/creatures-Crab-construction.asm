0x10025fe70: push rbp
0x10025fe71: mov rbp, rsp
0x10025fe74: push rbx
0x10025fe75: push rax
0x10025fe76: mov rbx, rsi
0x10025fe79: call 0x1007abc10 ; 0x1007abc10
0x10025fe7e: mov eax, dword ptr [rax + 0x38]
0x10025fe81: mov dword ptr [rbx + 8], eax
0x10025fe84: call 0x10074a170 ; 0x10074a170
0x10025fe89: mov eax, dword ptr [rax + 0x38]
0x10025fe8c: mov dword ptr [rbx + 8], eax
0x10025fe8f: mov rax, qword ptr [rip + 0x9ad9b2] ; 0x100c0d848
0x10025fe96: add rax, 0x10
0x10025fe9a: mov qword ptr [rbx], rax
0x10025fe9d: call 0x100262d70 ; 0x100262d70
0x10025fea2: mov rax, qword ptr [rip + 0x1b85db7] ; 0x101de5c60
0x10025fea9: mov eax, dword ptr [rax + 0x38]
0x10025feac: mov dword ptr [rbx + 8], eax
0x10025feaf: lea rax, [rip + 0x9b3cba] ; 0x100c13b70
0x10025feb6: mov qword ptr [rbx], rax
0x10025feb9: call 0x1007abc10 ; 0x1007abc10
0x10025febe: mov rax, qword ptr [rip + 0x1b85a23] ; 0x101de58e8
0x10025fec5: mov eax, dword ptr [rax + 0x38]
0x10025fec8: mov dword ptr [rbx + 0xf0], eax
0x10025fece: mov dword ptr [rbx + 0x140], 0
0x10025fed8: vxorps xmm0, xmm0, xmm0
0x10025fedc: vmovups xmmword ptr [rbx + 0x148], xmm0
0x10025fee4: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x10025feec: mov dword ptr [rbx + 0x170], 0
0x10025fef6: vmovups xmmword ptr [rbx + 0x4b8], xmm0
0x10025fefe: mov qword ptr [rbx + 0x4c8], 0
0x10025ff09: mov dword ptr [rbx + 0x500], 0
0x10025ff13: mov dword ptr [rbx + 0x520], 0
0x10025ff1d: mov dword ptr [rbx + 0x584], 0
0x10025ff27: mov dword ptr [rbx + 0x598], 0
0x10025ff31: mov rax, rbx
0x10025ff34: add rsp, 8
0x10025ff38: pop rbx
0x10025ff39: pop rbp
0x10025ff3a: ret 
0x10025ff3b: nop dword ptr [rax + rax]
