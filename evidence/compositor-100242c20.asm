0x100242c20: push rbp
0x100242c21: mov rbp, rsp
0x100242c24: push r15
0x100242c26: push r14
0x100242c28: push r13
0x100242c2a: push r12
0x100242c2c: push rbx
0x100242c2d: sub rsp, 0x18
0x100242c31: mov dword ptr [rbp - 0x38], r9d
0x100242c35: mov dword ptr [rbp - 0x34], r8d
0x100242c39: mov dword ptr [rbp - 0x30], ecx
0x100242c3c: mov dword ptr [rbp - 0x2c], edx
0x100242c3f: mov qword ptr [rbp - 0x40], rsi
0x100242c43: mov r14, rdi
0x100242c46: mov al, byte ptr [rbp + 0x28]
0x100242c49: mov cl, byte ptr [rbp + 0x20]
0x100242c4c: movzx edx, byte ptr [rbp + 0x18]
0x100242c50: inc edx
0x100242c52: mov dword ptr [r14], edx
0x100242c55: mov byte ptr [r14 + 4], cl
0x100242c59: xor r15d, r15d
0x100242c5c: movzx r12d, al
0x100242c60: movzx r13d, cl
0x100242c64: nop word ptr cs:[rax + rax]
0x100242c70: mov eax, r15d
0x100242c73: imul rbx, rax, 0x78
0x100242c77: lea rdi, [r14 + rbx + 8]
0x100242c7c: mov rsi, qword ptr [rbp - 0x40]
0x100242c80: mov edx, dword ptr [rbp - 0x38]
0x100242c83: mov ecx, dword ptr [rbp - 0x2c]
0x100242c86: mov r8d, dword ptr [rbp - 0x30]
0x100242c8a: mov r9d, dword ptr [rbp - 0x34]
0x100242c8e: push r12
0x100242c90: push r13
0x100242c92: call 0x1007f0b50 ; 0x1007f0b50
0x100242c97: add rsp, 0x10
0x100242c9b: mov rax, qword ptr [rbp + 0x10]
0x100242c9f: mov qword ptr [r14 + rbx + 0x10], rax
0x100242ca4: inc r15d
0x100242ca7: cmp r15d, dword ptr [r14]
0x100242caa: jb 0x100242c70
0x100242cac: add rsp, 0x18
0x100242cb0: pop rbx
0x100242cb1: pop r12
0x100242cb3: pop r13
0x100242cb5: pop r14
0x100242cb7: pop r15
0x100242cb9: pop rbp
0x100242cba: ret 
0x100242cbb: nop dword ptr [rax + rax]
