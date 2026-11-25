0x1001a8830: push rbp
0x1001a8831: mov rbp, rsp
0x1001a8834: push rbx
0x1001a8835: push rax
0x1001a8836: mov rbx, rsi
0x1001a8839: call 0x1007abc10 ; 0x1007abc10
0x1001a883e: mov eax, dword ptr [rax + 0x38]
0x1001a8841: mov dword ptr [rbx + 8], eax
0x1001a8844: call 0x10074a170 ; 0x10074a170
0x1001a8849: mov eax, dword ptr [rax + 0x38]
0x1001a884c: mov dword ptr [rbx + 8], eax
0x1001a884f: mov rax, qword ptr [rip + 0xa64ff2] ; 0x100c0d848
0x1001a8856: add rax, 0x10
0x1001a885a: mov qword ptr [rbx], rax
0x1001a885d: call 0x100262d70 ; 0x100262d70
0x1001a8862: mov rax, qword ptr [rip + 0x1c31f67] ; 0x101dda7d0
0x1001a8869: mov eax, dword ptr [rax + 0x38]
0x1001a886c: mov dword ptr [rbx + 8], eax
0x1001a886f: lea rax, [rip + 0xa69f7a] ; 0x100c127f0
0x1001a8876: mov qword ptr [rbx], rax
0x1001a8879: call 0x1007abc10 ; 0x1007abc10
0x1001a887e: mov rax, qword ptr [rip + 0x1c31e1b] ; 0x101dda6a0
0x1001a8885: mov eax, dword ptr [rax + 0x38]
0x1001a8888: mov dword ptr [rbx + 0xe0], eax
0x1001a888e: mov dword ptr [rbx + 0x12c], 1
0x1001a8898: vxorps xmm0, xmm0, xmm0
0x1001a889c: vmovlps qword ptr [rbx + 0x150], xmm0
0x1001a88a4: mov dword ptr [rbx + 0x158], 0
0x1001a88ae: mov dword ptr [rbx + 0x160], 0
0x1001a88b8: mov byte ptr [rbx + 0x164], 0
0x1001a88bf: vmovups xmmword ptr [rbx + 0x138], xmm0
0x1001a88c7: mov dword ptr [rbx + 0x514], 0
0x1001a88d1: vxorps ymm0, ymm0, ymm0
0x1001a88d5: vmovups ymmword ptr [rbx + 0x421], ymm0
0x1001a88dd: vmovups ymmword ptr [rbx + 0x410], ymm0
0x1001a88e5: vmovups ymmword ptr [rbx + 0x3f0], ymm0
0x1001a88ed: vmovups ymmword ptr [rbx + 0x3d0], ymm0
0x1001a88f5: vmovups ymmword ptr [rbx + 0x448], ymm0
0x1001a88fd: mov rax, rbx
0x1001a8900: add rsp, 8
0x1001a8904: pop rbx
0x1001a8905: pop rbp
0x1001a8906: vzeroupper 
0x1001a8909: ret 
