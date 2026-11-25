0x10040b1d0: push rbp
0x10040b1d1: mov rbp, rsp
0x10040b1d4: push r15
0x10040b1d6: push r14
0x10040b1d8: push r13
0x10040b1da: push r12
0x10040b1dc: push rbx
0x10040b1dd: push rax
0x10040b1de: mov r15, rsi
0x10040b1e1: mov rbx, rdi
0x10040b1e4: mov r14d, dword ptr [rbx + 0x147c]
0x10040b1eb: add r14, qword ptr [rbx + 0x1470]
0x10040b1f2: test r15, r15
0x10040b1f5: je 0x10040b293
0x10040b1fb: mov rdi, r14
0x10040b1fe: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040b203: mov r12, rax
0x10040b206: movzx ecx, byte ptr [r15]
0x10040b20a: test cl, 1
0x10040b20d: jne 0x10040b22c
0x10040b20f: mov esi, 0x16
0x10040b214: mov rdx, r12
0x10040b217: sub rdx, rsi
0x10040b21a: ja 0x10040b23e
0x10040b21c: test cl, 1
0x10040b21f: jne 0x10040b248
0x10040b221: lea r13, [r15 + 1]
0x10040b225: test r12, r12
0x10040b228: jne 0x10040b251
0x10040b22a: jmp 0x10040b25f ; 0x10040b25f
0x10040b22c: mov rsi, qword ptr [r15]
0x10040b22f: and rsi, 0xfffffffffffffffe
0x10040b233: dec rsi
0x10040b236: mov rdx, r12
0x10040b239: sub rdx, rsi
0x10040b23c: jbe 0x10040b21c
0x10040b23e: test cl, 1
0x10040b241: jne 0x10040b273
0x10040b243: shr rcx, 1
0x10040b246: jmp 0x10040b277 ; 0x10040b277
0x10040b248: mov r13, qword ptr [r15 + 0x10]
0x10040b24c: test r12, r12
0x10040b24f: je 0x10040b25f
0x10040b251: mov rdi, r13
0x10040b254: mov rsi, r14
0x10040b257: mov rdx, r12
0x10040b25a: call 0x100aa28fa ; 0x100aa28fa _memmove
0x10040b25f: mov byte ptr [r13 + r12], 0
0x10040b265: test byte ptr [r15], 1
0x10040b269: jne 0x10040b28f
0x10040b26b: add r12b, r12b
0x10040b26e: mov byte ptr [r15], r12b
0x10040b271: jmp 0x10040b293 ; 0x10040b293
0x10040b273: mov rcx, qword ptr [r15 + 8]
0x10040b277: xor r8d, r8d
0x10040b27a: mov rdi, r15
0x10040b27d: mov r9, rcx
0x10040b280: push r14
0x10040b282: push r12
0x10040b284: call 0x1000198c0 ; 0x1000198c0
0x10040b289: add rsp, 0x10
0x10040b28d: jmp 0x10040b293 ; 0x10040b293
0x10040b28f: mov qword ptr [r15 + 8], r12
0x10040b293: mov rdi, r14
0x10040b296: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040b29b: mov ecx, dword ptr [rbx + 0x1478]
0x10040b2a1: mov edx, dword ptr [rbx + 0x147c]
0x10040b2a7: lea eax, [rax + rdx + 1]
0x10040b2ab: mov dword ptr [rbx + 0x147c], eax
0x10040b2b1: cmp ecx, eax
0x10040b2b3: jb 0x10040b2c4
0x10040b2b5: add rsp, 8
0x10040b2b9: pop rbx
0x10040b2ba: pop r12
0x10040b2bc: pop r13
0x10040b2be: pop r14
0x10040b2c0: pop r15
0x10040b2c2: pop rbp
0x10040b2c3: ret 
0x10040b2c4: lea rdi, [rip + 0x77c670] ; 0x100b8793b ctx->dataHead <= ctx->dataMax
0x10040b2cb: lea rsi, [rip + 0x77c658] ; 0x100b8792a LevelObjects.cpp
0x10040b2d2: mov edx, 0xa7
0x10040b2d7: mov ecx, 3
0x10040b2dc: call 0x1007e5f70 ; 0x1007e5f70
0x10040b2e1: ud2 
0x10040b2e3: nop word ptr cs:[rax + rax]
