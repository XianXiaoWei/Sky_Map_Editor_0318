0x1005227a0: push rbp
0x1005227a1: mov rbp, rsp
0x1005227a4: push r15
0x1005227a6: push r14
0x1005227a8: push rbx
0x1005227a9: push rax
0x1005227aa: mov rbx, rsi
0x1005227ad: mov r14, rdi
0x1005227b0: test rbx, rbx
0x1005227b3: je 0x100522857
0x1005227b9: cmp byte ptr [rbx + 0x89], 0
0x1005227c0: je 0x100522857
0x1005227c6: mov rdi, qword ptr [rbx + 0x58]
0x1005227ca: mov rsi, qword ptr [rbx + 0x60]
0x1005227ce: call 0x100795a70 ; 0x100795a70
0x1005227d3: mov rdi, qword ptr [rbx + 0x58]
0x1005227d7: mov rsi, qword ptr [rbx + 0x68]
0x1005227db: call 0x100795a70 ; 0x100795a70
0x1005227e0: mov rdi, qword ptr [rbx + 0x58]
0x1005227e4: mov rsi, qword ptr [rbx + 0x70]
0x1005227e8: call 0x100795a70 ; 0x100795a70
0x1005227ed: mov rdi, qword ptr [rbx + 0x58]
0x1005227f1: mov rsi, qword ptr [rbx + 0x78]
0x1005227f5: call 0x100795a70 ; 0x100795a70
0x1005227fa: mov rdi, qword ptr [rbx + 0x58]
0x1005227fe: mov rsi, qword ptr [rbx + 0x80]
0x100522805: call 0x100795a70 ; 0x100795a70
0x10052280a: vxorps ymm0, ymm0, ymm0
0x10052280e: vmovups ymmword ptr [rbx + 0x60], ymm0
0x100522813: mov qword ptr [rbx + 0x80], 0
0x10052281e: mov byte ptr [rbx + 0x89], 0
0x100522825: mov byte ptr [rbx + 0x18], 0
0x100522829: test byte ptr [rbx + 0x20], 1
0x10052282d: je 0x100522846
0x10052282f: mov r15, qword ptr [rbx + 0x30]
0x100522833: vzeroupper 
0x100522836: call 0x1007e50d0 ; 0x1007e50d0
0x10052283b: mov rdi, rax
0x10052283e: mov rsi, r15
0x100522841: call 0x1007e5db0 ; 0x1007e5db0
0x100522846: mov rax, qword ptr [r14 + 0x4810]
0x10052284d: mov qword ptr [rbx], rax
0x100522850: mov qword ptr [r14 + 0x4810], rbx
0x100522857: add rsp, 8
0x10052285b: pop rbx
0x10052285c: pop r14
0x10052285e: pop r15
0x100522860: pop rbp
0x100522861: vzeroupper 
0x100522864: ret 
0x100522865: mov rdi, rax
0x100522868: call 0x100011bf0 ; 0x100011bf0
0x10052286d: nop dword ptr [rax]
