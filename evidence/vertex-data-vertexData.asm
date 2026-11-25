0x1007f5010: push rbp
0x1007f5011: mov rbp, rsp
0x1007f5014: push r15
0x1007f5016: push r14
0x1007f5018: push rbx
0x1007f5019: push rax
0x1007f501a: mov rbx, rdi
0x1007f501d: mov qword ptr [rbx + 0x134], 0
0x1007f5028: mov dword ptr [rbx + 0x140], 0
0x1007f5032: lea r14, [rbx + 0x148]
0x1007f5039: mov qword ptr [rbx + 0x150], 0
0x1007f5044: mov dword ptr [rbx + 0x160], 0
0x1007f504e: mov qword ptr [rbx + 0x178], 0
0x1007f5059: mov dword ptr [rbx + 0x188], 0
0x1007f5063: mov qword ptr [rbx + 0x1a0], 0
0x1007f506e: mov dword ptr [rbx + 0x1b0], 0
0x1007f5078: mov qword ptr [rbx + 0x1c8], 0
0x1007f5083: mov dword ptr [rbx + 0x1d8], 0
0x1007f508d: mov qword ptr [rbx + 0x1f0], 0
0x1007f5098: mov dword ptr [rbx + 0x200], 0
0x1007f50a2: mov qword ptr [rbx + 0x218], 0
0x1007f50ad: mov dword ptr [rbx + 0x228], 0
0x1007f50b7: mov qword ptr [rbx + 0x250], 0
0x1007f50c2: mov dword ptr [rbx + 0x260], 0
0x1007f50cc: mov qword ptr [rbx + 0x288], 0
0x1007f50d7: mov dword ptr [rbx + 0x298], 0
0x1007f50e1: mov qword ptr [rbx + 0x2c0], 0
0x1007f50ec: mov dword ptr [rbx + 0x2d0], 0
0x1007f50f6: mov qword ptr [rbx + 0x2f8], 0
0x1007f5101: mov dword ptr [rbx + 0x308], 0
0x1007f510b: mov qword ptr [rbx + 0x330], 0
0x1007f5116: mov dword ptr [rbx + 0x340], 0
0x1007f5120: mov qword ptr [rbx + 0x368], 0
0x1007f512b: mov dword ptr [rbx + 0x378], 0
0x1007f5135: mov qword ptr [rbx + 0x3a0], 0
0x1007f5140: mov dword ptr [rbx + 0x3b0], 0
0x1007f514a: mov qword ptr [rbx + 0x3d8], 0
0x1007f5155: mov dword ptr [rbx + 0x3e8], 0
0x1007f515f: mov byte ptr [rbx + 0x3f8], 0
0x1007f5166: lea rdi, [rbx + 0x400]
0x1007f516d: call 0x1007f6ca0 ; 0x1007f6ca0
0x1007f5172: vxorps ymm0, ymm0, ymm0
0x1007f5176: vmovups ymmword ptr [rbx + 0x114], ymm0
0x1007f517e: vmovups ymmword ptr [rbx + 0x100], ymm0
0x1007f5186: vmovups ymmword ptr [rbx + 0xe0], ymm0
0x1007f518e: vmovups ymmword ptr [rbx + 0xc0], ymm0
0x1007f5196: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x1007f519e: vmovups ymmword ptr [rbx + 0x80], ymm0
0x1007f51a6: vmovups ymmword ptr [rbx + 0x60], ymm0
0x1007f51ab: vmovups ymmword ptr [rbx + 0x40], ymm0
0x1007f51b0: vmovups ymmword ptr [rbx + 0x20], ymm0
0x1007f51b5: vmovups ymmword ptr [rbx], ymm0
0x1007f51b9: lea r15, [rbx + 0x418]
0x1007f51c0: mov esi, 0x2b0
0x1007f51c5: mov rdi, r14
0x1007f51c8: vzeroupper 
0x1007f51cb: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1007f51d0: lea rsi, [rip + 0x3b23fb] ; 0x100ba75d2 Unnamed
0x1007f51d7: mov edx, 0x1b
0x1007f51dc: mov rdi, r15
0x1007f51df: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007f51e4: mov byte ptr [rbx + 0x433], 0
0x1007f51eb: mov qword ptr [rbx + 0x410], rbx
0x1007f51f2: add rsp, 8
0x1007f51f6: pop rbx
0x1007f51f7: pop r14
0x1007f51f9: pop r15
0x1007f51fb: pop rbp
0x1007f51fc: ret 
0x1007f51fd: nop dword ptr [rax]
