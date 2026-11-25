0x100266350: push rbp
0x100266351: mov rbp, rsp
0x100266354: push r15
0x100266356: push r14
0x100266358: push r13
0x10026635a: push r12
0x10026635c: push rbx
0x10026635d: sub rsp, 0x18
0x100266361: mov qword ptr [rbp - 0x38], rsi
0x100266365: mov r13, rdi
0x100266368: mov rax, qword ptr [r13 + 0x38]
0x10026636c: test rax, rax
0x10026636f: je 0x100266452
0x100266375: mov r15d, dword ptr [rax + 0x10]
0x100266379: test r15, r15
0x10026637c: je 0x10026641c
0x100266382: xor r12d, r12d
0x100266385: nop word ptr cs:[rax + rax]
0x100266390: mov rax, qword ptr [rax + 8]
0x100266394: mov rax, qword ptr [rax + r12*8]
0x100266398: mov qword ptr [rbp - 0x40], rax
0x10026639c: call 0x1007abc10 ; 0x1007abc10
0x1002663a1: mov r14, rax
0x1002663a4: mov qword ptr [rbp - 0x30], 0
0x1002663ac: call 0x100262d70 ; 0x100262d70
0x1002663b1: mov rbx, qword ptr [rax]
0x1002663b4: mov rdi, rax
0x1002663b7: lea rsi, [rbp - 0x30]
0x1002663bb: lea rdx, [rbp - 0x40]
0x1002663bf: mov rcx, r14
0x1002663c2: call qword ptr [rbx + 0x40]
0x1002663c5: mov rdi, qword ptr [rbp - 0x30]
0x1002663c9: test rdi, rdi
0x1002663cc: je 0x100266433
0x1002663ce: mov rax, qword ptr [rdi]
0x1002663d1: mov rcx, qword ptr [rbp - 0x38]
0x1002663d5: mov rsi, qword ptr [rcx + 0x3c8]
0x1002663dc: movzx ecx, byte ptr [r13 + 0x41]
0x1002663e1: movzx edx, byte ptr [r13 + 0x40]
0x1002663e6: call qword ptr [rax + 0x68]
0x1002663e9: inc r12
0x1002663ec: cmp r12, r15
0x1002663ef: jae 0x10026641c
0x1002663f1: mov rax, qword ptr [r13 + 0x38]
0x1002663f5: mov ecx, dword ptr [rax + 0x10]
0x1002663f8: cmp r12, rcx
0x1002663fb: jb 0x100266390
0x1002663fd: lea rdi, [rip + 0x8fb554] ; 0x100b61958 idx < size
0x100266404: lea rsi, [rip + 0x8fb558] ; 0x100b61963 ./Clump.h
0x10026640b: mov edx, 0x36
0x100266410: mov ecx, 3
0x100266415: call 0x1007e5f70 ; 0x1007e5f70
0x10026641a: ud2 
0x10026641c: mov rdi, r13
0x10026641f: call 0x10032ef60 ; 0x10032ef60
0x100266424: add rsp, 0x18
0x100266428: pop rbx
0x100266429: pop r12
0x10026642b: pop r13
0x10026642d: pop r14
0x10026642f: pop r15
0x100266431: pop rbp
0x100266432: ret 
0x100266433: lea rdi, [rip + 0x8fb6be] ; 0x100b61af8 ret
0x10026643a: lea rsi, [rip + 0x8fb522] ; 0x100b61963 ./Clump.h
0x100266441: mov edx, 0x47
0x100266446: mov ecx, 3
0x10026644b: call 0x1007e5f70 ; 0x1007e5f70
0x100266450: ud2 
0x100266452: lea rdi, [rip + 0x9162f0] ; 0x100b7c749 critters
0x100266459: lea rsi, [rip + 0x916314] ; 0x100b7c774 CritterV2Events.cpp
0x100266460: mov edx, 0x1a0
0x100266465: mov ecx, 3
0x10026646a: call 0x1007e5f70 ; 0x1007e5f70
0x10026646f: ud2 
0x100266471: nop word ptr cs:[rax + rax]
