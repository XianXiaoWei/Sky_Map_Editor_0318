0x10073af30: push rbp
0x10073af31: mov rbp, rsp
0x10073af34: mov dword ptr [rdi + 0x21c], 0
0x10073af3e: mov byte ptr [rdi + 0x220], 0
0x10073af45: mov word ptr [rdi + 0x1fc], 0
0x10073af4e: mov qword ptr [rdi + 0x1f4], 0
0x10073af59: mov word ptr [rdi + 0x208], 0
0x10073af62: mov qword ptr [rdi + 0x200], 0
0x10073af6d: mov qword ptr [rdi + 0x211], 0
0x10073af78: mov qword ptr [rdi + 0x20c], 0
0x10073af83: vmovaps xmm0, xmmword ptr [rip + 0x39f375] ; 0x100ada300
0x10073af8b: vmovups xmmword ptr [rdi + 0x224], xmm0
0x10073af93: movabs rax, 0x3f80000044fa0000
0x10073af9d: mov qword ptr [rdi + 0x234], rax
0x10073afa4: mov byte ptr [rdi + 0x1f0], 0
0x10073afab: mov word ptr [rdi + 0x23c], 0
0x10073afb4: vxorps xmm0, xmm0, xmm0
0x10073afb8: vmovaps xmmword ptr [rdi + 0x390], xmm0
0x10073afc0: mov dword ptr [rdi + 0x3a0], 0
0x10073afca: pop rbp
0x10073afcb: ret 
0x10073afcc: nop dword ptr [rax]
