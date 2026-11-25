0x10027c8b5: vxorps xmm0, xmm0, xmm0
0x10027c8b9: vmovsd xmm1, qword ptr [rsp + 0x68]
0x10027c8bf: vucomiss xmm1, xmm0
0x10027c8c3: mov qword ptr [rsp + 0x30], r12
0x10027c8c8: vmovss dword ptr [rsp + 0x40], xmm2
0x10027c8ce: jbe 0x10027c955
0x10027c8d4: mov r13, qword ptr [rsp + 0x80]
0x10027c8dc: vmovss xmm1, dword ptr [r13 + 0x184]
0x10027c8e5: vsubss xmm1, xmm1, dword ptr [rsp + 0x60]
0x10027c8eb: vmaxss xmm0, xmm0, xmm1
0x10027c8ef: vmovss xmm1, dword ptr [rip + 0x82aef9] ; 0x100aa77f0
0x10027c8f7: vminss xmm0, xmm1, xmm0
0x10027c8fb: vmovss dword ptr [r13 + 0x184], xmm0
0x10027c904: mov al, 1
0x10027c906: mov dword ptr [rsp + 0xa0], eax
0x10027c90d: jmp 0x10027c968 ; 0x10027c968
0x10027c90f: vmovss xmm0, dword ptr [rip + 0x82afa1] ; 0x100aa78b8
0x10027c917: vmovss dword ptr [rsp + 0x40], xmm0
0x10027c91d: xor eax, eax
0x10027c91f: mov qword ptr [rsp + 0x30], rax
0x10027c924: vxorps xmm0, xmm0, xmm0
0x10027c928: vmovsd qword ptr [rsp + 0x68], xmm0
0x10027c92e: mov dword ptr [rsp + 0xc0], 0
0x10027c939: mov dword ptr [rsp + 0xf0], 0
0x10027c944: xor eax, eax
0x10027c946: xor edx, edx
0x10027c948: mov dword ptr [rsp + 0xa0], 0
0x10027c953: jmp 0x10027c96c ; 0x10027c96c
0x10027c955: mov dword ptr [rsp + 0xa0], 0
0x10027c960: mov r13, qword ptr [rsp + 0x80]
0x10027c968: mov eax, dword ptr [rsp + 0x2c]
0x10027c96c: mov dword ptr [rsp + 0x2c], eax
0x10027c970: cmp eax, dword ptr [r13 + 0x140]
0x10027c977: mov r14, qword ptr [rsp + 0x100]
0x10027c97f: jb 0x10027ca90
0x10027c985: mov rax, qword ptr [rsp + 0x80]
0x10027c98d: vmovss xmm0, dword ptr [rax + 0xd0]
0x10027c995: vsubss xmm0, xmm0, dword ptr [rsp + 0x68]
0x10027c99b: vmovss xmm1, dword ptr [rip + 0x83870d] ; 0x100ab50b0
0x10027c9a3: vmaxss xmm0, xmm1, xmm0
0x10027c9a7: vmovss xmm1, dword ptr [rip + 0x828711] ; 0x100aa50c0
0x10027c9af: vminss xmm0, xmm1, xmm0
0x10027c9b3: vmovss dword ptr [rax + 0xd0], xmm0
