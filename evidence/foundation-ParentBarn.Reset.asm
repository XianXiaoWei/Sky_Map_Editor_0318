0x100522290: push rbp
0x100522291: mov rbp, rsp
0x100522294: push r15
0x100522296: push r14
0x100522298: push r12
0x10052229a: push rbx
0x10052229b: mov rbx, rdi
0x10052229e: mov eax, 0x489
0x1005222a3: nop word ptr cs:[rax + rax]
0x1005222b0: mov byte ptr [rbx + rax - 0x3f0], 0
0x1005222b8: mov byte ptr [rbx + rax - 0x360], 0
0x1005222c0: mov byte ptr [rbx + rax - 0x2d0], 0
0x1005222c8: mov byte ptr [rbx + rax - 0x240], 0
0x1005222d0: mov byte ptr [rbx + rax - 0x1b0], 0
0x1005222d8: mov byte ptr [rbx + rax - 0x120], 0
0x1005222e0: mov byte ptr [rbx + rax - 0x90], 0
0x1005222e8: mov byte ptr [rbx + rax], 0
0x1005222ec: add rax, 0x480
0x1005222f2: cmp rax, 0x4c89
0x1005222f8: jne 0x1005222b0
0x1005222fa: xor r15d, r15d
0x1005222fd: xor eax, eax
0x1005222ff: call 0x100011c10 ; 0x100011c10
0x100522304: xor r12d, r12d
0x100522307: nop word ptr [rax + rax]
0x100522310: test byte ptr [rbx + r15 + 0x47a0], 1
0x100522319: je 0x100522333
0x10052231b: mov r14, qword ptr [rbx + r15 + 0x47b0]
0x100522323: call 0x1007e50d0 ; 0x1007e50d0
0x100522328: mov rdi, rax
0x10052232b: mov rsi, r14
0x10052232e: call 0x1007e5db0 ; 0x1007e5db0
0x100522333: mov qword ptr [rbx + r15 + 0x4780], r12
0x10052233b: lea r12, [rbx + r15 + 0x4780]
0x100522343: add r15, -0x90
0x10052234a: cmp r15d, 0xffffb800
0x100522351: jne 0x100522310
0x100522353: lea rax, [rbx + r15 + 0x4810]
0x10052235b: mov qword ptr [rbx + 0x4810], rax
0x100522362: mov dword ptr [rbx + 0x4c18], 0
0x10052236c: pop rbx
0x10052236d: pop r12
0x10052236f: pop r14
0x100522371: pop r15
0x100522373: pop rbp
0x100522374: ret 
0x100522375: mov rdi, rax
0x100522378: call 0x100011bf0 ; 0x100011bf0
0x10052237d: nop dword ptr [rax]
