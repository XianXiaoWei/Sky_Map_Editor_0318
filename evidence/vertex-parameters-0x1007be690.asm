0x1007be690: push rbp
0x1007be691: mov rbp, rsp
0x1007be694: push r15
0x1007be696: push r14
0x1007be698: push r13
0x1007be69a: push r12
0x1007be69c: push rbx
0x1007be69d: sub rsp, 0x18
0x1007be6a1: mov qword ptr [rbp - 0x38], rdx
0x1007be6a5: mov r15, rdi
0x1007be6a8: mov edx, 1
0x1007be6ad: call 0x1007bdb70 ; 0x1007bdb70
0x1007be6b2: mov r13d, eax
0x1007be6b5: test r13d, r13d
0x1007be6b8: js 0x1007be72f
0x1007be6ba: mov rax, qword ptr [r15 + 0x158]
0x1007be6c1: mov rax, qword ptr [rax + 8]
0x1007be6c5: mov rcx, qword ptr [rax + 0x40]
0x1007be6c9: mov eax, dword ptr [rax + 0x38]
0x1007be6cc: mov dword ptr [rbp - 0x2c], eax
0x1007be6cf: movsxd r14, r13d
0x1007be6d2: lea rax, [r14 + r14*2]
0x1007be6d6: shl rax, 4
0x1007be6da: lea r12, [rcx + rax]
0x1007be6de: lea rbx, [rcx + rax + 0x30]
0x1007be6e3: inc r13d
0x1007be6e6: shl r14, 3
0x1007be6ea: nop word ptr [rax + rax]
0x1007be6f0: lea rsi, [rbx - 0x30]
0x1007be6f4: mov rdi, r15
0x1007be6f7: mov rdx, qword ptr [rbp - 0x38]
0x1007be6fb: call 0x1007bebc0 ; 0x1007bebc0
0x1007be700: mov rax, qword ptr [r15 + 0x148]
0x1007be707: mov qword ptr [rax + r14], 0
0x1007be70f: cmp dword ptr [rbp - 0x2c], r13d
0x1007be713: jbe 0x1007be72f
0x1007be715: mov rdi, rbx
0x1007be718: mov rsi, r12
0x1007be71b: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007be720: add rbx, 0x30
0x1007be724: inc r13d
0x1007be727: add r14, 8
0x1007be72b: test eax, eax
0x1007be72d: je 0x1007be6f0
0x1007be72f: add rsp, 0x18
0x1007be733: pop rbx
0x1007be734: pop r12
0x1007be736: pop r13
0x1007be738: pop r14
0x1007be73a: pop r15
0x1007be73c: pop rbp
0x1007be73d: ret 
0x1007be73e: nop 

