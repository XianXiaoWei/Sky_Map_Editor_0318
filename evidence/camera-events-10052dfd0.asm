0x10052dfd0: push rbp
0x10052dfd1: mov rbp, rsp
0x10052dfd4: push rbx
0x10052dfd5: push rax
0x10052dfd6: mov rbx, rdi
0x10052dfd9: mov edi, 0x60
0x10052dfde: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10052dfe3: vmovups ymm0, ymmword ptr [rbx + 8]
0x10052dfe8: vmovups ymmword ptr [rax + 8], ymm0
0x10052dfed: mov rcx, qword ptr [rbx + 0x28]
0x10052dff1: mov qword ptr [rax + 0x28], rcx
0x10052dff5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x10052dffa: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x10052dfff: vmovups ymmword ptr [rax + 0x40], ymm1
0x10052e004: vmovups ymmword ptr [rax + 0x30], ymm0
0x10052e009: mov rcx, qword ptr [rip + 0x6ddb60] ; 0x100c0bb70
0x10052e010: add rcx, 0x10
0x10052e014: mov qword ptr [rax], rcx
0x10052e017: add rsp, 8
0x10052e01b: pop rbx
0x10052e01c: pop rbp
0x10052e01d: vzeroupper 
0x10052e020: ret 
0x10052e021: nop word ptr cs:[rax + rax]
