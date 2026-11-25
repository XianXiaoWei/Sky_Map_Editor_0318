0x10032ea90: push rbp
0x10032ea91: mov rbp, rsp
0x10032ea94: push r15
0x10032ea96: push r14
0x10032ea98: push r13
0x10032ea9a: push r12
0x10032ea9c: push rbx
0x10032ea9d: sub rsp, 0x28
0x10032eaa1: mov qword ptr [rbp - 0x30], rsi
0x10032eaa5: mov r14, rdi
0x10032eaa8: call 0x1007c6c20 ; 0x1007c6c20
0x10032eaad: lea rcx, [rip + 0x1d1a09c] ; 0x102048b50
0x10032eab4: mov rdx, qword ptr [rcx]
0x10032eab7: mov esi, 0x2800
0x10032eabc: mov ecx, 8
0x10032eac1: mov rdi, rax
0x10032eac4: call 0x100795530 ; 0x100795530
0x10032eac9: mov r12, rax
0x10032eacc: xor ebx, ebx
0x10032eace: mov eax, 0x30
0x10032ead3: nop word ptr cs:[rax + rax]
0x10032eae0: mov rcx, qword ptr [r14 + rax]
0x10032eae4: test rcx, rcx
0x10032eae7: je 0x10032eb01
0x10032eae9: cmp byte ptr [rcx + 0x24], 0
0x10032eaed: jne 0x10032eaf5
0x10032eaef: cmp dword ptr [rcx + 0x28], 1
0x10032eaf3: je 0x10032eb01
0x10032eaf5: lea rcx, [r14 + rax]
0x10032eaf9: mov edx, ebx
0x10032eafb: inc ebx
0x10032eafd: mov qword ptr [r12 + rdx*8], rcx
0x10032eb01: add rax, 0x10
0x10032eb05: cmp rax, 0x5030
0x10032eb0b: jne 0x10032eae0
0x10032eb0d: mov eax, ebx
0x10032eb0f: mov qword ptr [rbp - 0x48], rax
0x10032eb13: lea rsi, [r12 + rax*8]
0x10032eb17: mov rdi, r12
0x10032eb1a: call 0x1003315d0 ; 0x1003315d0
0x10032eb1f: test ebx, ebx
0x10032eb21: je 0x10032ebd0
0x10032eb27: lea rax, [r14 + 0x5040]
0x10032eb2e: mov qword ptr [rbp - 0x40], rax
0x10032eb32: lea rax, [r14 + 0x85098]
0x10032eb39: mov qword ptr [rbp - 0x38], rax
0x10032eb3d: xor r15d, r15d
0x10032eb40: mov rbx, r12
0x10032eb43: mov r12, qword ptr [r12 + r15*8]
0x10032eb47: mov r13, qword ptr [r12]
0x10032eb4b: mov rdi, r14
0x10032eb4e: mov rsi, r13
0x10032eb51: mov rdx, qword ptr [rbp - 0x30]
0x10032eb55: call 0x10032f5b0 ; 0x10032f5b0
0x10032eb5a: cmp byte ptr [r13 + 0x24], 0
0x10032eb5f: jne 0x10032ebc0
0x10032eb61: cmp dword ptr [r13 + 0x28], 1
0x10032eb66: je 0x10032ebc0
0x10032eb68: test r12, r12
0x10032eb6b: je 0x10032ebf7
0x10032eb71: mov rdi, qword ptr [r12]
0x10032eb75: test rdi, rdi
0x10032eb78: je 0x10032ebac
0x10032eb7a: cmp byte ptr [rdi + 0x20], 0
0x10032eb7e: je 0x10032eb92
0x10032eb80: mov rax, qword ptr [rdi]
0x10032eb83: mov rsi, qword ptr [rbp - 0x30]
0x10032eb87: mov rdx, qword ptr [rbp - 0x38]
0x10032eb8b: call qword ptr [rax + 0x18]
0x10032eb8e: mov rdi, qword ptr [r12]
0x10032eb92: mov rax, qword ptr [rdi]
0x10032eb95: call qword ptr [rax]
0x10032eb97: mov rsi, qword ptr [r12]
0x10032eb9b: mov rdi, qword ptr [rbp - 0x40]
0x10032eb9f: call 0x100795a70 ; 0x100795a70
0x10032eba4: mov qword ptr [r12], 0
0x10032ebac: mov rax, qword ptr [r14 + 0x5030]
0x10032ebb3: mov qword ptr [r12 + 8], rax
0x10032ebb8: mov qword ptr [r14 + 0x5030], r12
0x10032ebbf: nop 
0x10032ebc0: inc r15
0x10032ebc3: cmp r15, qword ptr [rbp - 0x48]
0x10032ebc7: mov r12, rbx
0x10032ebca: jb 0x10032eb40
0x10032ebd0: mov dword ptr [r14 + 0x10], 0
0x10032ebd8: call 0x1007c6c20 ; 0x1007c6c20
0x10032ebdd: mov rdi, rax
0x10032ebe0: mov rsi, r12
0x10032ebe3: call 0x100795a70 ; 0x100795a70
0x10032ebe8: add rsp, 0x28
0x10032ebec: pop rbx
0x10032ebed: pop r12
0x10032ebef: pop r13
0x10032ebf1: pop r14
0x10032ebf3: pop r15
0x10032ebf5: pop rbp
0x10032ebf6: ret 
0x10032ebf7: lea rdi, [rip + 0x852736] ; 0x100b81334 eventNode
0x10032ebfe: lea rsi, [rip + 0x852546] ; 0x100b8114b Event.cpp
0x10032ec05: mov edx, 0x19f
0x10032ec0a: mov ecx, 3
0x10032ec0f: call 0x1007e5f70 ; 0x1007e5f70
0x10032ec14: ud2 
0x10032ec16: jmp 0x10032ec20 ; 0x10032ec20
0x10032ec18: mov rdi, rax
0x10032ec1b: call 0x100011bf0 ; 0x100011bf0
0x10032ec20: mov r14, rax
0x10032ec23: call 0x1007c6c20 ; 0x1007c6c20
0x10032ec28: mov rdi, rax
0x10032ec2b: mov rsi, rbx
0x10032ec2e: call 0x100795a70 ; 0x100795a70
0x10032ec33: mov rdi, r14
0x10032ec36: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10032ec3b: mov rdi, rax
0x10032ec3e: call 0x100011bf0 ; 0x100011bf0
0x10032ec43: nop word ptr cs:[rax + rax]
