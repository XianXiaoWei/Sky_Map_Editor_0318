0x1003162f0: push rbp
0x1003162f1: mov rbp, rsp
0x1003162f4: push r15
0x1003162f6: push r14
0x1003162f8: push r13
0x1003162fa: push r12
0x1003162fc: push rbx
0x1003162fd: sub rsp, 0x18
0x100316301: mov r12, rdi
0x100316304: mov rax, qword ptr [r12 + 0x38]
0x100316309: cmp dword ptr [rax + 0x10], 0
0x10031630d: je 0x1003163bc
0x100316313: xor ebx, ebx
0x100316315: lea r14, [rbp - 0x30]
0x100316319: lea r15, [rbp - 0x38]
0x10031631d: nop dword ptr [rax]
0x100316320: mov rax, qword ptr [rax + 8]
0x100316324: mov ecx, ebx
0x100316326: mov rax, qword ptr [rax + rcx*8]
0x10031632a: mov qword ptr [rbp - 0x38], rax
0x10031632e: call 0x1007abc10 ; 0x1007abc10
0x100316333: mov r13, rax
0x100316336: mov qword ptr [rbp - 0x30], 0
0x10031633e: call 0x1007abc10 ; 0x1007abc10
0x100316343: mov r8, qword ptr [rax]
0x100316346: mov rdi, rax
0x100316349: mov rsi, r14
0x10031634c: mov rdx, r15
0x10031634f: mov rcx, r13
0x100316352: call qword ptr [r8 + 0x40]
0x100316356: mov rdi, qword ptr [rbp - 0x30]
0x10031635a: test rdi, rdi
0x10031635d: je 0x1003163d9
0x10031635f: mov qword ptr [rbp - 0x38], rdi
0x100316363: movzx esi, byte ptr [r12 + 0x40]
0x100316369: call 0x1004d1f60 ; 0x1004d1f60
0x10031636e: call 0x1007abc10 ; 0x1007abc10
0x100316373: mov r13, rax
0x100316376: mov qword ptr [rbp - 0x30], 0
0x10031637e: call 0x10032e2b0 ; 0x10032e2b0
0x100316383: mov r8, qword ptr [rax]
0x100316386: mov rdi, rax
0x100316389: mov rsi, r14
0x10031638c: mov rdx, r15
0x10031638f: mov rcx, r13
0x100316392: call qword ptr [r8 + 0x40]
0x100316396: mov rdi, qword ptr [rbp - 0x30]
0x10031639a: test rdi, rdi
0x10031639d: je 0x1003163ac
0x10031639f: cmp byte ptr [r12 + 0x41], 0
0x1003163a5: je 0x1003163ac
0x1003163a7: call 0x10032f0f0 ; 0x10032f0f0
0x1003163ac: inc ebx
0x1003163ae: mov rax, qword ptr [r12 + 0x38]
0x1003163b3: cmp ebx, dword ptr [rax + 0x10]
0x1003163b6: jb 0x100316320
0x1003163bc: mov byte ptr [r12 + 0x42], 1
0x1003163c2: mov rdi, r12
0x1003163c5: call 0x10032ef60 ; 0x10032ef60
0x1003163ca: add rsp, 0x18
0x1003163ce: pop rbx
0x1003163cf: pop r12
0x1003163d1: pop r13
0x1003163d3: pop r14
0x1003163d5: pop r15
0x1003163d7: pop rbp
0x1003163d8: ret 
0x1003163d9: lea rdi, [rip + 0x84b718] ; 0x100b61af8 ret
0x1003163e0: lea rsi, [rip + 0x84b57c] ; 0x100b61963 ./Clump.h
0x1003163e7: mov edx, 0x47
0x1003163ec: mov ecx, 3
0x1003163f1: call 0x1007e5f70 ; 0x1007e5f70
0x1003163f6: ud2 
0x1003163f8: nop dword ptr [rax + rax]
