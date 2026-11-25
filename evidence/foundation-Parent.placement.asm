0x100523e80: push rbp
0x100523e81: mov rbp, rsp
0x100523e84: push rbx
0x100523e85: push rax
0x100523e86: mov rbx, rsi
0x100523e89: call 0x1007abc10 ; 0x1007abc10
0x100523e8e: mov rax, qword ptr [rip + 0x1af3e23] ; 0x102017cb8
0x100523e95: mov eax, dword ptr [rax + 0x38]
0x100523e98: mov dword ptr [rbx], eax
0x100523e9a: vxorps xmm0, xmm0, xmm0
0x100523e9e: vmovups xmmword ptr [rbx + 0x20], xmm0
0x100523ea3: mov qword ptr [rbx + 0x30], 0
0x100523eab: vxorps ymm0, ymm0, ymm0
0x100523eaf: vmovups ymmword ptr [rbx + 0x69], ymm0
0x100523eb4: vmovups ymmword ptr [rbx + 0x60], ymm0
0x100523eb9: mov rax, rbx
0x100523ebc: add rsp, 8
0x100523ec0: pop rbx
0x100523ec1: pop rbp
0x100523ec2: vzeroupper 
0x100523ec5: ret 
0x100523ec6: nop word ptr cs:[rax + rax]
