0x10009f4a0: push rbp
0x10009f4a1: mov rbp, rsp
0x10009f4a4: push r15
0x10009f4a6: push r14
0x10009f4a8: push r13
0x10009f4aa: push r12
0x10009f4ac: push rbx
0x10009f4ad: sub rsp, 0x28
0x10009f4b1: mov r14, r9
0x10009f4b4: mov rbx, r8
0x10009f4b7: mov r15, rcx
0x10009f4ba: mov qword ptr [rbp - 0x40], rdi
0x10009f4be: mov qword ptr [rbp - 0x48], rsi
0x10009f4c2: mov qword ptr [rbp - 0x30], rdx
0x10009f4c6: mov r8, r14
0x10009f4c9: call 0x10009f380 ; 0x10009f380
0x10009f4ce: mov r12d, eax
0x10009f4d1: mov qword ptr [rbp - 0x50], rbx
0x10009f4d5: movzx r13d, word ptr [rbx]
0x10009f4d9: mov rbx, r15
0x10009f4dc: movzx r15d, word ptr [rbx]
0x10009f4e0: mov rcx, qword ptr [r14]
0x10009f4e3: mov rax, qword ptr [r14 + 8]
0x10009f4e7: mov r14d, dword ptr [rax + 0x5810]
0x10009f4ee: imul rdi, r13, 0x44
0x10009f4f2: add rdi, rcx
0x10009f4f5: add rdi, r14
0x10009f4f8: imul rsi, r15, 0x44
0x10009f4fc: mov qword ptr [rbp - 0x38], rcx
0x10009f500: add rsi, rcx
0x10009f503: add rsi, r14
0x10009f506: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f50b: test eax, eax
0x10009f50d: jns 0x10009f5ea
0x10009f513: mov word ptr [rbx], r13w
0x10009f517: mov rax, qword ptr [rbp - 0x50]
0x10009f51b: mov word ptr [rax], r15w
0x10009f51f: movzx r15d, word ptr [rbx]
0x10009f523: mov rax, qword ptr [rbp - 0x30]
0x10009f527: movzx r13d, word ptr [rax]
0x10009f52b: imul rdi, r15, 0x44
0x10009f52f: mov rax, qword ptr [rbp - 0x38]
0x10009f533: add rdi, rax
0x10009f536: add rdi, r14
0x10009f539: imul rsi, r13, 0x44
0x10009f53d: add rsi, rax
0x10009f540: add rsi, r14
0x10009f543: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f548: test eax, eax
0x10009f54a: jns 0x10009f5db
0x10009f550: mov rax, qword ptr [rbp - 0x30]
0x10009f554: mov word ptr [rax], r15w
0x10009f558: mov word ptr [rbx], r13w
0x10009f55c: movzx r15d, word ptr [rax]
0x10009f560: mov r13, qword ptr [rbp - 0x48]
0x10009f564: movzx ebx, word ptr [r13]
0x10009f569: imul rdi, r15, 0x44
0x10009f56d: mov rax, qword ptr [rbp - 0x38]
0x10009f571: add rdi, rax
0x10009f574: add rdi, r14
0x10009f577: imul rsi, rbx, 0x44
0x10009f57b: add rsi, rax
0x10009f57e: add rsi, r14
0x10009f581: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f586: test eax, eax
0x10009f588: jns 0x10009f5e0
0x10009f58a: mov word ptr [r13], r15w
0x10009f58f: mov rax, qword ptr [rbp - 0x30]
0x10009f593: mov word ptr [rax], bx
0x10009f596: movzx eax, word ptr [r13]
0x10009f59b: mov r15, qword ptr [rbp - 0x40]
0x10009f59f: movzx ebx, word ptr [r15]
0x10009f5a3: mov qword ptr [rbp - 0x30], rax
0x10009f5a7: imul rdi, rax, 0x44
0x10009f5ab: mov rax, qword ptr [rbp - 0x38]
0x10009f5af: add rdi, rax
0x10009f5b2: add rdi, r14
0x10009f5b5: imul rsi, rbx, 0x44
0x10009f5b9: add rsi, rax
0x10009f5bc: add rsi, r14
0x10009f5bf: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f5c4: test eax, eax
0x10009f5c6: jns 0x10009f5e6
0x10009f5c8: mov rax, qword ptr [rbp - 0x30]
0x10009f5cc: mov word ptr [r15], ax
0x10009f5d0: mov word ptr [r13], bx
0x10009f5d5: add r12d, 4
0x10009f5d9: jmp 0x10009f5ea ; 0x10009f5ea
0x10009f5db: inc r12d
0x10009f5de: jmp 0x10009f5ea ; 0x10009f5ea
0x10009f5e0: add r12d, 2
0x10009f5e4: jmp 0x10009f5ea ; 0x10009f5ea
0x10009f5e6: add r12d, 3
0x10009f5ea: mov eax, r12d
0x10009f5ed: add rsp, 0x28
0x10009f5f1: pop rbx
0x10009f5f2: pop r12
0x10009f5f4: pop r13
0x10009f5f6: pop r14
0x10009f5f8: pop r15
0x10009f5fa: pop rbp
0x10009f5fb: ret 
0x10009f5fc: nop dword ptr [rax]
