0x10019e2e0: push rbp
0x10019e2e1: mov rbp, rsp
0x10019e2e4: push rbx
0x10019e2e5: push rax
0x10019e2e6: mov rbx, rsi
0x10019e2e9: call 0x1007abc10 ; 0x1007abc10
0x10019e2ee: mov rax, qword ptr [rip + 0x1c3b233] ; 0x101dd9528
0x10019e2f5: mov eax, dword ptr [rax + 0x38]
0x10019e2f8: mov dword ptr [rbx + 8], eax
0x10019e2fb: mov rax, qword ptr [rip + 0xa6f27e] ; 0x100c0d580
0x10019e302: add rax, 0x10
0x10019e306: mov qword ptr [rbx], rax
0x10019e309: vxorps ymm0, ymm0, ymm0
0x10019e30d: vmovups ymmword ptr [rbx + 0x28], ymm0
0x10019e312: vmovups ymmword ptr [rbx + 0x38], ymm0
0x10019e317: mov word ptr [rbx + 0xc], 0x101
0x10019e31d: mov qword ptr [rbx + 0x10], 0
0x10019e325: movabs rax, 0x40a00000000003e8
0x10019e32f: mov qword ptr [rbx + 0x18], rax
0x10019e333: movabs rax, 0x3f80000040800000
0x10019e33d: mov qword ptr [rbx + 0x20], rax
0x10019e341: movabs rax, 0x420c000040400000
0x10019e34b: mov qword ptr [rbx + 0x60], rax
0x10019e34f: mov qword ptr [rbx + 0x68], 0
0x10019e357: mov dword ptr [rbx + 0x70], 0
0x10019e35e: mov qword ptr [rbx + 0x78], 0
0x10019e366: mov dword ptr [rbx + 0x80], 0
0x10019e370: vxorps xmm0, xmm0, xmm0
0x10019e374: vmovups xmmword ptr [rbx + 0xa0], xmm0
0x10019e37c: mov qword ptr [rbx + 0xb8], 0
0x10019e387: mov dword ptr [rbx + 0xc0], 0
0x10019e391: vmovups xmmword ptr [rbx + 0x88], xmm0
0x10019e399: mov dword ptr [rbx + 0x98], 0
0x10019e3a3: mov rax, rbx
0x10019e3a6: add rsp, 8
0x10019e3aa: pop rbx
0x10019e3ab: pop rbp
0x10019e3ac: vzeroupper 
0x10019e3af: ret 
