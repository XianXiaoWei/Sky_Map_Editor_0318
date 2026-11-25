0x1001ae780: push rbp
0x1001ae781: mov rbp, rsp
0x1001ae784: push rbx
0x1001ae785: push rax
0x1001ae786: mov rbx, rdi
0x1001ae789: call 0x1007abc10 ; 0x1007abc10
0x1001ae78e: mov rax, qword ptr [rip + 0x1c2c66b] ; 0x101ddae00
0x1001ae795: mov eax, dword ptr [rax + 0x38]
0x1001ae798: mov dword ptr [rbx], eax
0x1001ae79a: mov dword ptr [rbx + 0x50], 0
0x1001ae7a1: mov dword ptr [rbx + 0x78], 0
0x1001ae7a8: mov byte ptr [rbx + 0x7c], 0
0x1001ae7ac: vxorps xmm0, xmm0, xmm0
0x1001ae7b0: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001ae7b8: mov word ptr [rbx + 0x90], 0
0x1001ae7c1: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001ae7cb: mov byte ptr [rbx + 0x98], 1
0x1001ae7d2: mov qword ptr [rbx + 0x100], 0
0x1001ae7dd: vmovss xmm0, dword ptr [rip + 0x8f68db] ; 0x100aa50c0
0x1001ae7e5: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001ae7ea: vmovaps xmm0, xmmword ptr [rip + 0x8f98ae] ; 0x100aa80a0
0x1001ae7f2: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001ae7f7: vmovaps xmm0, xmmword ptr [rip + 0x8fa231] ; 0x100aa8a30
0x1001ae7ff: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001ae804: vmovaps xmm0, xmmword ptr [rip + 0x8fa1f4] ; 0x100aa8a00
0x1001ae80c: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001ae811: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001ae818: mov byte ptr [rbx + 0xa1], 0
0x1001ae81f: add rsp, 8
0x1001ae823: pop rbx
0x1001ae824: pop rbp
0x1001ae825: ret 
0x1001ae826: nop word ptr cs:[rax + rax]
