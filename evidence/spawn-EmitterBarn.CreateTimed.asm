0x1002de9e0: push rbp
0x1002de9e1: mov rbp, rsp
0x1002de9e4: push r15
0x1002de9e6: push r14
0x1002de9e8: push r13
0x1002de9ea: push r12
0x1002de9ec: push rbx
0x1002de9ed: sub rsp, 0x48
0x1002de9f1: mov r15d, r8d
0x1002de9f4: mov qword ptr [rbp - 0x38], rcx
0x1002de9f8: mov r12, rdx
0x1002de9fb: mov r13, rsi
0x1002de9fe: vmovss dword ptr [rbp - 0x2c], xmm0
0x1002dea03: mov r14, rdi
0x1002dea06: lea rdi, [r14 + 0x100010]
0x1002dea0d: call 0x1002de850 ; 0x1002de850
0x1002dea12: mov rbx, rax
0x1002dea15: mov rdi, rbx
0x1002dea18: call 0x1002da1e0 ; 0x1002da1e0
0x1002dea1d: mov edx, dword ptr [r14 + 0x100020]
0x1002dea24: lea eax, [rdx + 1]
0x1002dea27: cmp eax, 1
0x1002dea2a: adc eax, 0
0x1002dea2d: mov dword ptr [r14 + 0x100020], eax
0x1002dea34: vmovaps xmm0, xmmword ptr [r13]
0x1002dea3a: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1002dea3f: vmovaps xmm0, xmmword ptr [r12]
0x1002dea45: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1002dea4a: movzx eax, r15b
0x1002dea4e: mov dword ptr [rsp], eax
0x1002dea51: lea rcx, [rbp - 0x60]
0x1002dea55: lea r8, [rbp - 0x50]
0x1002dea59: mov rdi, rbx
0x1002dea5c: mov rsi, r14
0x1002dea5f: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1002dea64: mov r9, qword ptr [rbp - 0x38]
0x1002dea68: call 0x1002d9f10 ; 0x1002d9f10
0x1002dea6d: vxorps xmm0, xmm0, xmm0
0x1002dea71: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1002dea76: vucomiss xmm1, xmm0
0x1002dea7a: jbe 0x1002dea85
0x1002dea7c: mov byte ptr [rbx + 0xb1], 1
0x1002dea83: jmp 0x1002dea8a ; 0x1002dea8a
0x1002dea85: test rbx, rbx
0x1002dea88: je 0x1002dea92
0x1002dea8a: mov edx, dword ptr [rbx + 0x1f0]
0x1002dea90: jmp 0x1002dea94 ; 0x1002dea94
0x1002dea92: xor edx, edx
0x1002dea94: mov rax, rbx
0x1002dea97: add rsp, 0x48
0x1002dea9b: pop rbx
0x1002dea9c: pop r12
0x1002dea9e: pop r13
0x1002deaa0: pop r14
0x1002deaa2: pop r15
0x1002deaa4: pop rbp
0x1002deaa5: ret 
0x1002deaa6: nop word ptr cs:[rax + rax]
