0x1000e4a20: push rbp
0x1000e4a21: mov rbp, rsp
0x1000e4a24: push r15
0x1000e4a26: push r14
0x1000e4a28: push r13
0x1000e4a2a: push r12
0x1000e4a2c: push rbx
0x1000e4a2d: sub rsp, 0x48
0x1000e4a31: mov dword ptr [rbp - 0x3c], r8d
0x1000e4a35: mov r12, rcx
0x1000e4a38: mov r15, rdx
0x1000e4a3b: mov dword ptr [rbp - 0x2c], esi
0x1000e4a3e: mov r14, rdi
0x1000e4a41: lea rsi, [r14 + 0x78]
0x1000e4a45: mov rdi, r12
0x1000e4a48: mov qword ptr [rbp - 0x38], rsi
0x1000e4a4c: call 0x10076a280 ; 0x10076a280
0x1000e4a51: lea rsi, [rbp - 0x4c]
0x1000e4a55: mov rdi, r12
0x1000e4a58: call 0x10076a280 ; 0x10076a280
0x1000e4a5d: lea rsi, [rbp - 0x48]
0x1000e4a61: mov rdi, r12
0x1000e4a64: call 0x10076a280 ; 0x10076a280
0x1000e4a69: lea rsi, [rbp - 0x44]
0x1000e4a6d: mov rdi, r12
0x1000e4a70: call 0x10076a280 ; 0x10076a280
0x1000e4a75: lea rsi, [rbp - 0x40]
0x1000e4a79: mov rdi, r12
0x1000e4a7c: call 0x10076a280 ; 0x10076a280
0x1000e4a81: mov esi, dword ptr [r14 + 0x78]
0x1000e4a85: shl rsi, 7
0x1000e4a89: mov rdx, qword ptr [rip + 0x1cee0d8] ; 0x101dd2b68
0x1000e4a90: mov ecx, 0x10
0x1000e4a95: mov rdi, r15
0x1000e4a98: call 0x100795530 ; 0x100795530
0x1000e4a9d: mov qword ptr [r14 + 0x70], rax
0x1000e4aa1: mov r13d, dword ptr [r14 + 0x78]
0x1000e4aa5: mov eax, dword ptr [rbp - 0x2c]
0x1000e4aa8: imul r13d, eax
0x1000e4aac: add r13d, dword ptr [rbp - 0x40]
0x1000e4ab0: mov ebx, dword ptr [rbp - 0x4c]
0x1000e4ab3: mov ecx, dword ptr [rbp - 0x48]
0x1000e4ab6: mov qword ptr [rbp - 0x58], rcx
0x1000e4aba: mov ecx, dword ptr [rbp - 0x44]
0x1000e4abd: mov qword ptr [rbp - 0x60], rcx
0x1000e4ac1: mov dword ptr [r14 + 0x80], eax
0x1000e4ac8: movsxd rcx, eax
0x1000e4acb: mov qword ptr [rbp - 0x68], rcx
0x1000e4acf: mov rax, rcx
0x1000e4ad2: shl rax, 4
0x1000e4ad6: lea rsi, [rax + rax*2]
0x1000e4ada: mov rdx, qword ptr [rip + 0x1cee087] ; 0x101dd2b68
0x1000e4ae1: mov ecx, 0x10
0x1000e4ae6: mov rdi, r15
0x1000e4ae9: call 0x100795530 ; 0x100795530
0x1000e4aee: mov qword ptr [r14 + 0x88], rax
0x1000e4af5: shl rbx, 2
0x1000e4af9: lea rsi, [rbx + rbx*2]
0x1000e4afd: mov rdx, qword ptr [rip + 0x1cee064] ; 0x101dd2b68
0x1000e4b04: mov ecx, 0x10
0x1000e4b09: mov rbx, r15
0x1000e4b0c: mov r15d, dword ptr [rbp - 0x2c]
0x1000e4b10: mov rdi, rbx
0x1000e4b13: call 0x100795530 ; 0x100795530
0x1000e4b18: mov qword ptr [r14 + 0xa0], rax
0x1000e4b1f: mov rsi, qword ptr [rbp - 0x58]
0x1000e4b23: shl rsi, 4
0x1000e4b27: mov rdx, qword ptr [rip + 0x1cee03a] ; 0x101dd2b68
0x1000e4b2e: mov ecx, 0x10
0x1000e4b33: mov rdi, rbx
0x1000e4b36: call 0x100795530 ; 0x100795530
0x1000e4b3b: mov qword ptr [r14 + 0x98], rax
0x1000e4b42: mov rax, qword ptr [rbp - 0x60]
0x1000e4b46: shl rax, 2
0x1000e4b4a: lea rsi, [rax + rax*2]
0x1000e4b4e: mov rdx, qword ptr [rip + 0x1cee013] ; 0x101dd2b68
0x1000e4b55: mov ecx, 0x10
0x1000e4b5a: mov rdi, rbx
0x1000e4b5d: call 0x100795530 ; 0x100795530
0x1000e4b62: mov qword ptr [r14 + 0xa8], rax
0x1000e4b69: mov rdx, qword ptr [rip + 0x1cedff8] ; 0x101dd2b68
0x1000e4b70: mov ecx, 0x10
0x1000e4b75: mov rdi, rbx
0x1000e4b78: mov rsi, r13
0x1000e4b7b: call 0x100795530 ; 0x100795530
0x1000e4b80: mov qword ptr [r14 + 0xb0], rax
0x1000e4b87: mov byte ptr [r14 + 0xc8], 1
0x1000e4b8f: cmp dword ptr [rbp - 0x68], 0
0x1000e4b93: jle 0x1000e4be3
0x1000e4b95: mov r13d, r15d
0x1000e4b98: xor ebx, ebx
0x1000e4b9a: nop word ptr [rax + rax]
0x1000e4ba0: mov rsi, qword ptr [r14 + 0x88]
0x1000e4ba7: add rsi, rbx
0x1000e4baa: mov rdi, r12
0x1000e4bad: call 0x10076a360 ; 0x10076a360
0x1000e4bb2: mov rax, qword ptr [r14 + 0x88]
0x1000e4bb9: lea rsi, [rax + rbx + 0x10]
0x1000e4bbe: mov rdi, r12
0x1000e4bc1: call 0x10076a4f0 ; 0x10076a4f0
0x1000e4bc6: mov rax, qword ptr [r14 + 0x88]
0x1000e4bcd: lea rsi, [rax + rbx + 0x20]
0x1000e4bd2: mov rdi, r12
0x1000e4bd5: call 0x10076a360 ; 0x10076a360
0x1000e4bda: add rbx, 0x30
0x1000e4bde: dec r13
0x1000e4be1: jne 0x1000e4ba0
0x1000e4be3: mov rax, qword ptr [rbp - 0x38]
0x1000e4be7: cmp dword ptr [rax], 0
0x1000e4bea: mov r13, r12
0x1000e4bed: mov r12d, dword ptr [rbp - 0x3c]
0x1000e4bf1: je 0x1000e4c24
0x1000e4bf3: mov rax, r14
0x1000e4bf6: sub rax, -0x80
0x1000e4bfa: mov qword ptr [rbp - 0x38], rax
0x1000e4bfe: xor ebx, ebx
0x1000e4c00: mov edi, ebx
0x1000e4c02: shl rdi, 7
0x1000e4c06: add rdi, qword ptr [r14 + 0x70]
0x1000e4c0a: mov rsi, r13
0x1000e4c0d: mov edx, r15d
0x1000e4c10: mov rcx, qword ptr [rbp - 0x38]
0x1000e4c14: mov r9d, r12d
0x1000e4c17: call 0x1000e4c40 ; 0x1000e4c40
0x1000e4c1c: inc ebx
0x1000e4c1e: cmp ebx, dword ptr [r14 + 0x78]
0x1000e4c22: jb 0x1000e4c00
0x1000e4c24: add rsp, 0x48
0x1000e4c28: pop rbx
0x1000e4c29: pop r12
0x1000e4c2b: pop r13
0x1000e4c2d: pop r14
0x1000e4c2f: pop r15
0x1000e4c31: pop rbp
0x1000e4c32: ret 
0x1000e4c33: nop word ptr cs:[rax + rax]
