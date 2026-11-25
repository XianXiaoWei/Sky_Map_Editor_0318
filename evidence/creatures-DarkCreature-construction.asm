0x100273460: push rbp
0x100273461: mov rbp, rsp
0x100273464: push rbx
0x100273465: push rax
0x100273466: mov rbx, rsi
0x100273469: call 0x1007abc10 ; 0x1007abc10
0x10027346e: mov rax, qword ptr [rip + 0x1b7422b] ; 0x101de76a0
0x100273475: mov eax, dword ptr [rax + 0x38]
0x100273478: mov dword ptr [rbx], eax
0x10027347a: mov dword ptr [rbx + 0x128], 0
0x100273484: mov dword ptr [rbx + 0x140], 0
0x10027348e: mov dword ptr [rbx + 0x170], 0
0x100273498: mov byte ptr [rbx + 0x174], 0
0x10027349f: mov qword ptr [rbx + 0x178], 0
0x1002734aa: mov dword ptr [rbx + 0x180], 0
0x1002734b4: mov dword ptr [rbx + 0x1a0], 0
0x1002734be: mov dword ptr [rbx + 0x1d0], 0x40a00000
0x1002734c8: mov qword ptr [rbx + 0x250], 0
0x1002734d3: mov qword ptr [rbx + 0x260], 0
0x1002734de: mov qword ptr [rbx + 0x270], 0
0x1002734e9: mov qword ptr [rbx + 0x280], 0
0x1002734f4: mov qword ptr [rbx + 0x290], 0
0x1002734ff: mov qword ptr [rbx + 0x2a0], 0
0x10027350a: mov qword ptr [rbx + 0x2b0], 0
0x100273515: mov byte ptr [rbx + 0x2c3], 0
0x10027351c: mov byte ptr [rbx + 0x2c4], 0
0x100273523: mov byte ptr [rbx + 0x2c5], 0
0x10027352a: vxorps ymm0, ymm0, ymm0
0x10027352e: vmovups ymmword ptr [rbx + 0x1e0], ymm0
0x100273536: mov dword ptr [rbx + 0x200], 0
0x100273540: vmovups ymmword ptr [rbx + 0x228], ymm0
0x100273548: vmovups ymmword ptr [rbx + 0x208], ymm0
0x100273550: mov byte ptr [rbx + 0x2c6], 1
0x100273557: mov byte ptr [rbx + 0x2c7], 0
0x10027355e: mov eax, dword ptr [rip + 0xab7ebc] ; 0x100d2b420
0x100273564: mov dword ptr [rbx + 0x2c8], eax
0x10027356a: mov dword ptr [rbx + 0x2cc], 0
0x100273574: mov byte ptr [rbx + 0x2d0], 0
0x10027357b: mov qword ptr [rbx + 0x2d4], 0
0x100273586: mov byte ptr [rbx + 0x2dc], 1
0x10027358d: mov dword ptr [rbx + 0x2e0], 0
0x100273597: mov rax, rbx
0x10027359a: add rsp, 8
0x10027359e: pop rbx
0x10027359f: pop rbp
0x1002735a0: vzeroupper 
0x1002735a3: ret 
0x1002735a4: nop word ptr cs:[rax + rax]
