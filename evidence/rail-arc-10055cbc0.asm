0x10055cbc0: push rbp
0x10055cbc1: mov rbp, rsp
0x10055cbc4: push rbx
0x10055cbc5: push rax
0x10055cbc6: mov rbx, rdi
0x10055cbc9: call 0x1007abc10 ; 0x1007abc10
0x10055cbce: mov rax, qword ptr [rip + 0x1abfcb3] ; 0x10201c888
0x10055cbd5: mov eax, dword ptr [rax + 0x38]
0x10055cbd8: mov dword ptr [rbx], eax
0x10055cbda: mov qword ptr [rbx + 8], 0
0x10055cbe2: mov qword ptr [rbx + 0x10], 0x10
0x10055cbea: mov dword ptr [rbx + 0x18], 0
0x10055cbf1: mov qword ptr [rbx + 0x20], 0
0x10055cbf9: mov dword ptr [rbx + 0x28], 0
0x10055cc00: mov byte ptr [rbx + 0x2c], 0
0x10055cc04: lea rax, [rip + 0x1ae2a55] ; 0x10203f660
0x10055cc0b: vmovaps xmm0, xmmword ptr [rax]
0x10055cc0f: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10055cc14: mov byte ptr [rbx + 0x40], 0
0x10055cc18: vxorps ymm0, ymm0, ymm0
0x10055cc1c: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x10055cc24: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10055cc2c: mov byte ptr [rbx + 0xe0], 1
0x10055cc33: mov dword ptr [rbx + 0xec], 0
0x10055cc3d: mov qword ptr [rbx + 0xf0], 0
0x10055cc48: add rsp, 8
0x10055cc4c: pop rbx
0x10055cc4d: pop rbp
0x10055cc4e: vzeroupper 
0x10055cc51: ret 
0x10055cc52: nop word ptr cs:[rax + rax]
