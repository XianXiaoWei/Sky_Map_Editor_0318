0x1005311f0: push rbp
0x1005311f1: mov rbp, rsp
0x1005311f4: push rbx
0x1005311f5: push rax
0x1005311f6: mov rbx, rsi
0x1005311f9: mov rdi, rbx
0x1005311fc: call 0x10032eea0 ; 0x10032eea0
0x100531201: mov rax, qword ptr [rip + 0x1ae7dc0] ; 0x102018fc8
0x100531208: mov eax, dword ptr [rax + 0x38]
0x10053120b: mov dword ptr [rbx + 8], eax
0x10053120e: mov rax, qword ptr [rip + 0x6db853] ; 0x100c0ca68
0x100531215: add rax, 0x10
0x100531219: mov qword ptr [rbx], rax
0x10053121c: mov byte ptr [rbx + 0x82], 0
0x100531223: vxorps ymm0, ymm0, ymm0
0x100531227: vmovups ymmword ptr [rbx + 0x50], ymm0
0x10053122c: vmovups ymmword ptr [rbx + 0x38], ymm0
0x100531231: mov rax, rbx
0x100531234: add rsp, 8
0x100531238: pop rbx
0x100531239: pop rbp
0x10053123a: vzeroupper 
0x10053123d: ret 
0x10053123e: nop 
