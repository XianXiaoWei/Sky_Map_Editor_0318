0x100522700: push rbp
0x100522701: mov rbp, rsp
0x100522704: push r14
0x100522706: push rbx
0x100522707: mov r14, rdi
0x10052270a: mov rbx, qword ptr [r14 + 0x4810]
0x100522711: test rbx, rbx
0x100522714: je 0x100522775
0x100522716: mov rax, qword ptr [rbx]
0x100522719: mov qword ptr [r14 + 0x4810], rax
0x100522720: call 0x1007abc10 ; 0x1007abc10
0x100522725: mov rax, qword ptr [rip + 0x1af558c] ; 0x102017cb8
0x10052272c: mov eax, dword ptr [rax + 0x38]
0x10052272f: mov dword ptr [rbx], eax
0x100522731: vxorps xmm0, xmm0, xmm0
0x100522735: vmovups xmmword ptr [rbx + 0x20], xmm0
0x10052273a: mov qword ptr [rbx + 0x30], 0
0x100522742: vxorps ymm0, ymm0, ymm0
0x100522746: vmovups ymmword ptr [rbx + 0x69], ymm0
0x10052274b: vmovups ymmword ptr [rbx + 0x60], ymm0
0x100522750: mov byte ptr [rbx + 0x89], 1
0x100522757: lea rax, [r14 + 0x4c20]
0x10052275e: mov qword ptr [rbx + 0x58], rax
0x100522762: mov byte ptr [r14 + 0x4c1c], 1
0x10052276a: mov rax, rbx
0x10052276d: pop rbx
0x10052276e: pop r14
0x100522770: pop rbp
0x100522771: vzeroupper 
0x100522774: ret 
0x100522775: lea rdi, [rip + 0x66a0eb] ; 0x100b8c867 p
0x10052277c: lea rsi, [rip + 0x66d54a] ; 0x100b8fccd Parent.cpp
0x100522783: mov edx, 0x1ca
0x100522788: mov ecx, 3
0x10052278d: call 0x1007e5f70 ; 0x1007e5f70
0x100522792: ud2 
0x100522794: nop word ptr cs:[rax + rax]
