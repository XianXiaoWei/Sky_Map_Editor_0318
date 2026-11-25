0x100329f90: push rbp
0x100329f91: mov rbp, rsp
0x100329f94: push rbx
0x100329f95: push rax
0x100329f96: mov rbx, rsi
0x100329f99: call 0x1007abc10 ; 0x1007abc10
0x100329f9e: mov rax, qword ptr [rip + 0x1ac94db] ; 0x101df3480
0x100329fa5: mov eax, dword ptr [rax + 0x38]
0x100329fa8: mov dword ptr [rbx], eax
0x100329faa: vxorps xmm0, xmm0, xmm0
0x100329fae: vmovups xmmword ptr [rbx + 0x88], xmm0
0x100329fb6: mov qword ptr [rbx + 0x98], 0
0x100329fc1: mov qword ptr [rbx + 0xa8], 0
0x100329fcc: mov dword ptr [rbx + 0xb0], 0
0x100329fd6: mov qword ptr [rbx + 0xb8], 0
0x100329fe1: mov dword ptr [rbx + 0xc0], 0
0x100329feb: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x100329ff0: mov rax, rbx
0x100329ff3: add rsp, 8
0x100329ff7: pop rbx
0x100329ff8: pop rbp
0x100329ff9: ret 
0x100329ffa: nop word ptr [rax + rax]
