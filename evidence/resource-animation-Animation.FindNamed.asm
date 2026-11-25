0x100095690: push rbp
0x100095691: mov rbp, rsp
0x100095694: push r15
0x100095696: push r14
0x100095698: push r13
0x10009569a: push r12
0x10009569c: push rbx
0x10009569d: sub rsp, 0x28
0x1000956a1: mov r12, rdi
0x1000956a4: movabs rdi, 0xcbf29ce484222325
0x1000956ae: mov r10b, byte ptr [rsi]
0x1000956b1: test r10b, r10b
0x1000956b4: mov qword ptr [rbp - 0x38], rsi
0x1000956b8: mov qword ptr [rbp - 0x50], r8
0x1000956bc: mov qword ptr [rbp - 0x48], rcx
0x1000956c0: mov dword ptr [rbp - 0x30], r9d
0x1000956c4: mov qword ptr [rbp - 0x40], rdx
0x1000956c8: je 0x100095707
0x1000956ca: lea rax, [rsi + 1]
0x1000956ce: movabs rcx, 0x100000001b3
0x1000956d8: nop dword ptr [rax + rax]
0x1000956e0: movsx rbx, r10b
0x1000956e4: xor rbx, rdi
0x1000956e7: imul rbx, rcx
0x1000956eb: movzx r10d, byte ptr [rax]
0x1000956ef: inc rax
0x1000956f2: mov rdi, rbx
0x1000956f5: test r10b, r10b
0x1000956f8: jne 0x1000956e0
0x1000956fa: cmp dword ptr [r12 + 0x6220], 0
0x100095703: jg 0x100095715
0x100095705: jmp 0x100095782 ; 0x100095782
0x100095707: mov rbx, rdi
0x10009570a: cmp dword ptr [r12 + 0x6220], 0
0x100095713: jle 0x100095782
0x100095715: xor r14d, r14d
0x100095718: mov dword ptr [rbp - 0x2c], 0
0x10009571f: call 0x10009fcd0 ; 0x10009fcd0
0x100095724: mov rsi, qword ptr [r12 + r14*8 + 0x6020]
0x10009572c: mov rdi, rax
0x10009572f: lea rdx, [rbp - 0x2c]
0x100095733: call 0x1000dd230 ; 0x1000dd230
0x100095738: mov r15, rax
0x10009573b: test r15, r15
0x10009573e: je 0x100095772
0x100095740: cmp dword ptr [r15 + 0x20], 0
0x100095745: jle 0x100095772
0x100095747: xor r13d, r13d
0x10009574a: nop word ptr [rax + rax]
0x100095750: call 0x10009fcd0 ; 0x10009fcd0
0x100095755: mov rdi, rax
0x100095758: mov rsi, r15
0x10009575b: mov edx, r13d
0x10009575e: call 0x1000dd350 ; 0x1000dd350
0x100095763: cmp qword ptr [rax + 0x28], rbx
0x100095767: je 0x10009578c
0x100095769: inc r13d
0x10009576c: cmp r13d, dword ptr [r15 + 0x20]
0x100095770: jl 0x100095750
0x100095772: inc r14
0x100095775: movsxd rax, dword ptr [r12 + 0x6220]
0x10009577d: cmp r14, rax
0x100095780: jl 0x100095718
0x100095782: cmp byte ptr [rbp - 0x30], 0
0x100095786: jne 0x1000957b2
0x100095788: xor eax, eax
0x10009578a: jmp 0x1000957a3 ; 0x1000957a3
0x10009578c: mov rcx, qword ptr [rbp - 0x40]
0x100095790: mov dword ptr [rcx], r14d
0x100095793: mov ecx, dword ptr [rbp - 0x2c]
0x100095796: mov rdx, qword ptr [rbp - 0x48]
0x10009579a: mov dword ptr [rdx], ecx
0x10009579c: mov rcx, qword ptr [rbp - 0x50]
0x1000957a0: mov dword ptr [rcx], r13d
0x1000957a3: add rsp, 0x28
0x1000957a7: pop rbx
0x1000957a8: pop r12
0x1000957aa: pop r13
0x1000957ac: pop r14
0x1000957ae: pop r15
0x1000957b0: pop rbp
0x1000957b1: ret 
0x1000957b2: lea rdi, [rip + 0xb0d873] ; 0x100ba302c false
0x1000957b9: lea rsi, [rip + 0xacfe34] ; 0x100b655f4 AnimationInstance.cpp
0x1000957c0: lea r8, [rip + 0xad01ea] ; 0x100b659b1 Could not find animation named "%s"
0x1000957c7: mov edx, 0x201
0x1000957cc: mov ecx, 4
0x1000957d1: xor eax, eax
0x1000957d3: mov r9, qword ptr [rbp - 0x38]
0x1000957d7: call 0x1007e6030 ; 0x1007e6030
0x1000957dc: ud2 
0x1000957de: nop 
