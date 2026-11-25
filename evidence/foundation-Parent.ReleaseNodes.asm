0x100523480: push rbp
0x100523481: mov rbp, rsp
0x100523484: push rbx
0x100523485: push rax
0x100523486: mov rbx, rdi
0x100523489: mov rdi, qword ptr [rbx + 0x58]
0x10052348d: mov rsi, qword ptr [rbx + 0x60]
0x100523491: call 0x100795a70 ; 0x100795a70
0x100523496: mov rdi, qword ptr [rbx + 0x58]
0x10052349a: mov rsi, qword ptr [rbx + 0x68]
0x10052349e: call 0x100795a70 ; 0x100795a70
0x1005234a3: mov rdi, qword ptr [rbx + 0x58]
0x1005234a7: mov rsi, qword ptr [rbx + 0x70]
0x1005234ab: call 0x100795a70 ; 0x100795a70
0x1005234b0: mov rdi, qword ptr [rbx + 0x58]
0x1005234b4: mov rsi, qword ptr [rbx + 0x78]
0x1005234b8: call 0x100795a70 ; 0x100795a70
0x1005234bd: mov rdi, qword ptr [rbx + 0x58]
0x1005234c1: mov rsi, qword ptr [rbx + 0x80]
0x1005234c8: call 0x100795a70 ; 0x100795a70
0x1005234cd: vxorps ymm0, ymm0, ymm0
0x1005234d1: vmovups ymmword ptr [rbx + 0x60], ymm0
0x1005234d6: mov qword ptr [rbx + 0x80], 0
0x1005234e1: add rsp, 8
0x1005234e5: pop rbx
0x1005234e6: pop rbp
0x1005234e7: vzeroupper 
0x1005234ea: ret 
0x1005234eb: nop dword ptr [rax + rax]
