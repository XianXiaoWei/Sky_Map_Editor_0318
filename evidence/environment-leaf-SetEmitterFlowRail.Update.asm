0x10052b280: push rbp
0x10052b281: mov rbp, rsp
0x10052b284: push r15
0x10052b286: push r14
0x10052b288: push r13
0x10052b28a: push r12
0x10052b28c: push rbx
0x10052b28d: sub rsp, 0x18
0x10052b291: mov r12, rdi
0x10052b294: cmp byte ptr [r12 + 0x48], 0
0x10052b29a: je 0x10052b2b2
0x10052b29c: mov rdi, r12
0x10052b29f: add rsp, 0x18
0x10052b2a3: pop rbx
0x10052b2a4: pop r12
0x10052b2a6: pop r13
0x10052b2a8: pop r14
0x10052b2aa: pop r15
0x10052b2ac: pop rbp
0x10052b2ad: jmp 0x10032ef60 ; 0x10032ef60
0x10052b2b2: mov rax, qword ptr [r12 + 0x38]
0x10052b2b7: mov r13d, dword ptr [rax + 0x10]
0x10052b2bb: test r13, r13
0x10052b2be: je 0x10052b34e
0x10052b2c4: dec r13
0x10052b2c7: xor r14d, r14d
0x10052b2ca: nop word ptr [rax + rax]
0x10052b2d0: mov rax, qword ptr [rax + 8]
0x10052b2d4: mov rax, qword ptr [rax + r14*8]
0x10052b2d8: mov qword ptr [rbp - 0x38], rax
0x10052b2dc: call 0x1007abc10 ; 0x1007abc10
0x10052b2e1: mov r15, rax
0x10052b2e4: mov qword ptr [rbp - 0x30], 0
0x10052b2ec: call 0x1002d9a80 ; 0x1002d9a80
0x10052b2f1: mov rbx, qword ptr [rax]
0x10052b2f4: mov rdi, rax
0x10052b2f7: lea rsi, [rbp - 0x30]
0x10052b2fb: lea rdx, [rbp - 0x38]
0x10052b2ff: mov rcx, r15
0x10052b302: call qword ptr [rbx + 0x40]
0x10052b305: mov rax, qword ptr [rbp - 0x30]
0x10052b309: test rax, rax
0x10052b30c: je 0x10052b35d
0x10052b30e: mov rcx, qword ptr [r12 + 0x40]
0x10052b313: mov qword ptr [rax + 0x190], rcx
0x10052b31a: cmp r13, r14
0x10052b31d: je 0x10052b34e
0x10052b31f: inc r14
0x10052b322: mov rax, qword ptr [r12 + 0x38]
0x10052b327: mov ecx, dword ptr [rax + 0x10]
0x10052b32a: cmp r14, rcx
0x10052b32d: jb 0x10052b2d0
0x10052b32f: lea rdi, [rip + 0x636622] ; 0x100b61958 idx < size
0x10052b336: lea rsi, [rip + 0x636626] ; 0x100b61963 ./Clump.h
0x10052b33d: mov edx, 0x36
0x10052b342: mov ecx, 3
0x10052b347: call 0x1007e5f70 ; 0x1007e5f70
0x10052b34c: ud2 
0x10052b34e: add rsp, 0x18
0x10052b352: pop rbx
0x10052b353: pop r12
0x10052b355: pop r13
0x10052b357: pop r14
0x10052b359: pop r15
0x10052b35b: pop rbp
0x10052b35c: ret 
0x10052b35d: lea rdi, [rip + 0x636794] ; 0x100b61af8 ret
0x10052b364: lea rsi, [rip + 0x6365f8] ; 0x100b61963 ./Clump.h
0x10052b36b: mov edx, 0x47
0x10052b370: mov ecx, 3
0x10052b375: call 0x1007e5f70 ; 0x1007e5f70
0x10052b37a: ud2 
0x10052b37c: nop dword ptr [rax]
