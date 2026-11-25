0x10055cb20: push rbp
0x10055cb21: mov rbp, rsp
0x10055cb24: push rbx
0x10055cb25: push rax
0x10055cb26: mov rbx, rdi
0x10055cb29: call 0x1007abc10 ; 0x1007abc10
0x10055cb2e: mov rax, qword ptr [rip + 0x1abfd53] ; 0x10201c888
0x10055cb35: mov eax, dword ptr [rax + 0x38]
0x10055cb38: mov dword ptr [rbx], eax
0x10055cb3a: mov qword ptr [rbx + 8], 0
0x10055cb42: mov qword ptr [rbx + 0x10], 0x10
0x10055cb4a: mov dword ptr [rbx + 0x18], 0
0x10055cb51: mov qword ptr [rbx + 0x20], 0
0x10055cb59: mov dword ptr [rbx + 0x28], 0
0x10055cb60: mov byte ptr [rbx + 0x2c], 0
0x10055cb64: lea rax, [rip + 0x1ae2af5] ; 0x10203f660
0x10055cb6b: vmovaps xmm0, xmmword ptr [rax]
0x10055cb6f: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10055cb74: mov byte ptr [rbx + 0x40], 0
0x10055cb78: vxorps ymm0, ymm0, ymm0
0x10055cb7c: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x10055cb84: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10055cb8c: mov byte ptr [rbx + 0xe0], 1
0x10055cb93: mov dword ptr [rbx + 0xec], 0
0x10055cb9d: mov qword ptr [rbx + 0xf0], 0
0x10055cba8: add rsp, 8
0x10055cbac: pop rbx
0x10055cbad: pop rbp
0x10055cbae: vzeroupper 
0x10055cbb1: ret 
0x10055cbb2: nop word ptr cs:[rax + rax]
