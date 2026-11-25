0x1007331f0: push rbp
0x1007331f1: mov rbp, rsp
0x1007331f4: push rbx
0x1007331f5: push rax
0x1007331f6: mov rbx, rdi
0x1007331f9: mov esi, 0x824
0x1007331fe: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100733203: vxorps ymm0, ymm0, ymm0
0x100733207: vmovups ymmword ptr [rbx + 0x828], ymm0
0x10073320f: mov qword ptr [rbx + 0x848], 0
0x10073321a: mov dword ptr [rbx + 0x850], 0x7f7fffff
0x100733224: add rsp, 8
0x100733228: pop rbx
0x100733229: pop rbp
0x10073322a: vzeroupper 
0x10073322d: ret 
0x10073322e: nop 
