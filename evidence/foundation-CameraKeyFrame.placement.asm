0x1001e2eb0: push rbp
0x1001e2eb1: mov rbp, rsp
0x1001e2eb4: push rbx
0x1001e2eb5: push rax
0x1001e2eb6: mov rbx, rsi
0x1001e2eb9: call 0x1007abc10 ; 0x1007abc10
0x1001e2ebe: mov rax, qword ptr [rip + 0x1bfac93] ; 0x101dddb58
0x1001e2ec5: mov eax, dword ptr [rax + 0x38]
0x1001e2ec8: mov dword ptr [rbx], eax
0x1001e2eca: vmovss xmm0, dword ptr [rip + 0x8c21ee] ; 0x100aa50c0
0x1001e2ed2: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001e2ed7: vmovaps xmm0, xmmword ptr [rip + 0x8c51c1] ; 0x100aa80a0
0x1001e2edf: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001e2ee4: vmovaps xmm0, xmmword ptr [rip + 0x8c5b44] ; 0x100aa8a30
0x1001e2eec: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001e2ef1: vmovaps xmm0, xmmword ptr [rip + 0x8c5b07] ; 0x100aa8a00
0x1001e2ef9: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001e2efe: movabs rax, 0x4270000000000000
0x1001e2f08: mov qword ptr [rbx + 0x50], rax
0x1001e2f0c: mov rax, qword ptr [rip + 0x8c5b1d] ; 0x100aa8a30
0x1001e2f13: mov qword ptr [rbx + 0x60], rax
0x1001e2f17: mov dword ptr [rbx + 0x68], 0x3f800000
0x1001e2f1e: vxorps xmm0, xmm0, xmm0
0x1001e2f22: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x1001e2f27: mov qword ptr [rbx + 0x7d], 0
0x1001e2f2f: mov rax, rbx
0x1001e2f32: add rsp, 8
0x1001e2f36: pop rbx
0x1001e2f37: pop rbp
0x1001e2f38: ret 
0x1001e2f39: nop dword ptr [rax]
