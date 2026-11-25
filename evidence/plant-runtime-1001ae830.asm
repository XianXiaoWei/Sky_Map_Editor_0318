0x1001ae830: push rbp
0x1001ae831: mov rbp, rsp
0x1001ae834: push rbx
0x1001ae835: push rax
0x1001ae836: mov rbx, rdi
0x1001ae839: call 0x1007abc10 ; 0x1007abc10
0x1001ae83e: mov rax, qword ptr [rip + 0x1c2c5bb] ; 0x101ddae00
0x1001ae845: mov eax, dword ptr [rax + 0x38]
0x1001ae848: mov dword ptr [rbx], eax
0x1001ae84a: mov dword ptr [rbx + 0x50], 0
0x1001ae851: mov dword ptr [rbx + 0x78], 0
0x1001ae858: mov byte ptr [rbx + 0x7c], 0
0x1001ae85c: vxorps xmm0, xmm0, xmm0
0x1001ae860: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001ae868: mov word ptr [rbx + 0x90], 0
0x1001ae871: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001ae87b: mov byte ptr [rbx + 0x98], 1
0x1001ae882: mov qword ptr [rbx + 0x100], 0
0x1001ae88d: vmovss xmm0, dword ptr [rip + 0x8f682b] ; 0x100aa50c0
0x1001ae895: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001ae89a: vmovaps xmm0, xmmword ptr [rip + 0x8f97fe] ; 0x100aa80a0
0x1001ae8a2: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001ae8a7: vmovaps xmm0, xmmword ptr [rip + 0x8fa181] ; 0x100aa8a30
0x1001ae8af: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001ae8b4: vmovaps xmm0, xmmword ptr [rip + 0x8fa144] ; 0x100aa8a00
0x1001ae8bc: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001ae8c1: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001ae8c8: mov byte ptr [rbx + 0xa1], 0
0x1001ae8cf: add rsp, 8
0x1001ae8d3: pop rbx
0x1001ae8d4: pop rbp
0x1001ae8d5: ret 
0x1001ae8d6: nop word ptr cs:[rax + rax]
