0x1001a99e0: push rbp
0x1001a99e1: mov rbp, rsp
0x1001a99e4: push r15
0x1001a99e6: push r14
0x1001a99e8: push r13
0x1001a99ea: push r12
0x1001a99ec: push rbx
0x1001a99ed: sub rsp, 0x18
0x1001a99f1: mov r13, rdi
0x1001a99f4: mov rax, qword ptr [r13 + 0x38]
0x1001a99f8: test rax, rax
0x1001a99fb: je 0x1001a9ace
0x1001a9a01: mov r12d, dword ptr [rax + 0x10]
0x1001a9a05: test r12, r12
0x1001a9a08: je 0x1001a9a98
0x1001a9a0e: xor ebx, ebx
0x1001a9a10: lea r14, [rbp - 0x30]
0x1001a9a14: lea r15, [rbp - 0x38]
0x1001a9a18: nop dword ptr [rax + rax]
0x1001a9a20: mov rax, qword ptr [rax + 8]
0x1001a9a24: mov rax, qword ptr [rax + rbx*8]
0x1001a9a28: mov qword ptr [rbp - 0x38], rax
0x1001a9a2c: call 0x1007abc10 ; 0x1007abc10
0x1001a9a31: mov qword ptr [rbp - 0x30], 0
0x1001a9a39: mov rdi, qword ptr [rip + 0x1c30d90] ; 0x101dda7d0
0x1001a9a40: mov r8, qword ptr [rdi]
0x1001a9a43: mov rsi, r14
0x1001a9a46: mov rdx, r15
0x1001a9a49: mov rcx, rax
0x1001a9a4c: call qword ptr [r8 + 0x40]
0x1001a9a50: mov rax, qword ptr [rbp - 0x30]
0x1001a9a54: test rax, rax
0x1001a9a57: je 0x1001a9aaf
0x1001a9a59: movzx ecx, byte ptr [r13 + 0x40]
0x1001a9a5e: mov rax, qword ptr [rax + 0x78]
0x1001a9a62: mov byte ptr [rax + 0x2a], cl
0x1001a9a65: inc rbx
0x1001a9a68: cmp rbx, r12
0x1001a9a6b: jae 0x1001a9a98
0x1001a9a6d: mov rax, qword ptr [r13 + 0x38]
0x1001a9a71: mov ecx, dword ptr [rax + 0x10]
0x1001a9a74: cmp rbx, rcx
0x1001a9a77: jb 0x1001a9a20
0x1001a9a79: lea rdi, [rip + 0x9b7ed8] ; 0x100b61958 idx < size
0x1001a9a80: lea rsi, [rip + 0x9b7edc] ; 0x100b61963 ./Clump.h
0x1001a9a87: mov edx, 0x36
0x1001a9a8c: mov ecx, 3
0x1001a9a91: call 0x1007e5f70 ; 0x1007e5f70
0x1001a9a96: ud2 
0x1001a9a98: mov rdi, r13
0x1001a9a9b: call 0x10032ef60 ; 0x10032ef60
0x1001a9aa0: add rsp, 0x18
0x1001a9aa4: pop rbx
0x1001a9aa5: pop r12
0x1001a9aa7: pop r13
0x1001a9aa9: pop r14
0x1001a9aab: pop r15
0x1001a9aad: pop rbp
0x1001a9aae: ret 
0x1001a9aaf: lea rdi, [rip + 0x9b8042] ; 0x100b61af8 ret
0x1001a9ab6: lea rsi, [rip + 0x9b7ea6] ; 0x100b61963 ./Clump.h
0x1001a9abd: mov edx, 0x47
0x1001a9ac2: mov ecx, 3
0x1001a9ac7: call 0x1007e5f70 ; 0x1007e5f70
0x1001a9acc: ud2 
0x1001a9ace: lea rdi, [rip + 0x9ce2a6] ; 0x100b77d7b birds
0x1001a9ad5: lea rsi, [rip + 0x9ce1a7] ; 0x100b77c83 BirdV2.cpp
0x1001a9adc: mov edx, 0x7e3
0x1001a9ae1: mov ecx, 3
0x1001a9ae6: call 0x1007e5f70 ; 0x1007e5f70
0x1001a9aeb: ud2 
0x1001a9aed: nop dword ptr [rax]
