0x1007f04d0: push rbp
0x1007f04d1: mov rbp, rsp
0x1007f04d4: push r14
0x1007f04d6: push rbx
0x1007f04d7: mov rbx, rsi
0x1007f04da: mov r14, rdi
0x1007f04dd: mov eax, dword ptr [rbx + 0x20]
0x1007f04e0: mov dword ptr [r14 + 0x20], eax
0x1007f04e4: vmovups ymm0, ymmword ptr [rbx]
0x1007f04e8: vmovups ymmword ptr [r14], ymm0
0x1007f04ed: vzeroupper 
0x1007f04f0: call 0x1007c1470 ; 0x1007c1470
0x1007f04f5: mov rcx, qword ptr [rax]
0x1007f04f8: mov rdi, rax
0x1007f04fb: mov rsi, rbx
0x1007f04fe: call qword ptr [rcx + 0x100]
0x1007f0504: mov dword ptr [r14 + 0x24], eax
0x1007f0508: pop rbx
0x1007f0509: pop r14
0x1007f050b: pop rbp
0x1007f050c: ret 
0x1007f050d: nop dword ptr [rax]
