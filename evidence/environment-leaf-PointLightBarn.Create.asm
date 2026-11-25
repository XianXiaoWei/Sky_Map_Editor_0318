0x100540a20: push rbp
0x100540a21: mov rbp, rsp
0x100540a24: push rbx
0x100540a25: push rax
0x100540a26: mov rbx, qword ptr [rdi + 0x6010]
0x100540a2d: test rbx, rbx
0x100540a30: je 0x100540a70
0x100540a32: mov rax, qword ptr [rbx]
0x100540a35: mov qword ptr [rdi + 0x6010], rax
0x100540a3c: vxorps ymm0, ymm0, ymm0
0x100540a40: vmovups ymmword ptr [rbx + 0x40], ymm0
0x100540a45: vmovups ymmword ptr [rbx + 0x20], ymm0
0x100540a4a: vmovups ymmword ptr [rbx], ymm0
0x100540a4e: vzeroupper 
0x100540a51: call 0x1007abc10 ; 0x1007abc10
0x100540a56: mov rax, qword ptr [rip + 0x1ad9ccb] ; 0x10201a728
0x100540a5d: mov eax, dword ptr [rax + 0x38]
0x100540a60: mov dword ptr [rbx], eax
0x100540a62: mov byte ptr [rbx + 0x50], 1
0x100540a66: mov rax, rbx
0x100540a69: add rsp, 8
0x100540a6d: pop rbx
0x100540a6e: pop rbp
0x100540a6f: ret 
0x100540a70: lea rdi, [rip + 0x64fee6] ; 0x100b9095d light
0x100540a77: lea rsi, [rip + 0x64fee5] ; 0x100b90963 PointLight.cpp
0x100540a7e: mov edx, 0x4e
0x100540a83: mov ecx, 3
0x100540a88: call 0x1007e5f70 ; 0x1007e5f70
0x100540a8d: ud2 
0x100540a8f: nop 
