0x1001b1e20: push rbp
0x1001b1e21: mov rbp, rsp
0x1001b1e24: push rbx
0x1001b1e25: push rax
0x1001b1e26: mov rbx, rsi
0x1001b1e29: call 0x1007abc10 ; 0x1007abc10
0x1001b1e2e: mov rax, qword ptr [rip + 0x1c28fcb] ; 0x101ddae00
0x1001b1e35: mov eax, dword ptr [rax + 0x38]
0x1001b1e38: mov dword ptr [rbx], eax
0x1001b1e3a: mov dword ptr [rbx + 0x50], 0
0x1001b1e41: mov dword ptr [rbx + 0x78], 0
0x1001b1e48: mov byte ptr [rbx + 0x7c], 0
0x1001b1e4c: vxorps xmm0, xmm0, xmm0
0x1001b1e50: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001b1e58: mov word ptr [rbx + 0x90], 0
0x1001b1e61: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001b1e6b: mov byte ptr [rbx + 0x98], 1
0x1001b1e72: mov qword ptr [rbx + 0x100], 0
0x1001b1e7d: vmovss xmm0, dword ptr [rip + 0x8f323b] ; 0x100aa50c0
0x1001b1e85: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001b1e8a: vmovaps xmm0, xmmword ptr [rip + 0x8f620e] ; 0x100aa80a0
0x1001b1e92: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001b1e97: vmovaps xmm0, xmmword ptr [rip + 0x8f6b91] ; 0x100aa8a30
0x1001b1e9f: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001b1ea4: vmovaps xmm0, xmmword ptr [rip + 0x8f6b54] ; 0x100aa8a00
0x1001b1eac: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001b1eb1: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001b1eb8: mov byte ptr [rbx + 0xa1], 0
0x1001b1ebf: mov rax, rbx
0x1001b1ec2: add rsp, 8
0x1001b1ec6: pop rbx
0x1001b1ec7: pop rbp
0x1001b1ec8: ret 
0x1001b1ec9: nop dword ptr [rax]
