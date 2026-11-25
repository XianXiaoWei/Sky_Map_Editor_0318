0x1001e3f10: push rbp
0x1001e3f11: mov rbp, rsp
0x1001e3f14: push r15
0x1001e3f16: push r14
0x1001e3f18: push r13
0x1001e3f1a: push r12
0x1001e3f1c: push rbx
0x1001e3f1d: sub rsp, 0x18
0x1001e3f21: mov r14, r9
0x1001e3f24: mov r15, rdx
0x1001e3f27: mov r12, rsi
0x1001e3f2a: mov rbx, rdi
0x1001e3f2d: cmp dword ptr [rbp + 0x10], 3
0x1001e3f31: jne 0x1001e3ff5
0x1001e3f37: call 0x1007abbf0 ; 0x1007abbf0
0x1001e3f3c: add r15, r12
0x1001e3f3f: test bl, 1
0x1001e3f42: je 0x1001e3f4c
0x1001e3f44: mov rax, qword ptr [r15]
0x1001e3f47: mov rbx, qword ptr [rax + rbx - 1]
0x1001e3f4c: mov qword ptr [rbp - 0x38], rbx
0x1001e3f50: mov r12, qword ptr [r14]
0x1001e3f53: mov r13, qword ptr [r14 + 8]
0x1001e3f57: mov qword ptr [rbp - 0x30], 0
0x1001e3f5f: call 0x100375c20 ; 0x100375c20
0x1001e3f64: mov r8, qword ptr [rax]
0x1001e3f67: lea rsi, [rbp - 0x30]
0x1001e3f6b: mov rdi, rax
0x1001e3f6e: mov rdx, r12
0x1001e3f71: mov rcx, r13
0x1001e3f74: call qword ptr [r8 + 0x40]
0x1001e3f78: mov rax, qword ptr [rbp - 0x30]
0x1001e3f7c: mov qword ptr [rbp - 0x40], rax
0x1001e3f80: mov r13, qword ptr [r14 + 0x10]
0x1001e3f84: mov r12, qword ptr [r14 + 0x18]
0x1001e3f88: mov qword ptr [rbp - 0x30], 0
0x1001e3f90: call 0x100375c70 ; 0x100375c70
0x1001e3f95: mov r8, qword ptr [rax]
0x1001e3f98: lea rsi, [rbp - 0x30]
0x1001e3f9c: mov rdi, rax
0x1001e3f9f: mov rdx, r13
0x1001e3fa2: mov rcx, r12
0x1001e3fa5: call qword ptr [r8 + 0x40]
0x1001e3fa9: mov r12, qword ptr [rbp - 0x30]
0x1001e3fad: mov r13, qword ptr [r14 + 0x20]
0x1001e3fb1: mov r14, qword ptr [r14 + 0x28]
0x1001e3fb5: mov qword ptr [rbp - 0x30], 0
0x1001e3fbd: call 0x10023d340 ; 0x10023d340
0x1001e3fc2: mov rbx, qword ptr [rax]
0x1001e3fc5: lea rsi, [rbp - 0x30]
0x1001e3fc9: mov rdi, rax
0x1001e3fcc: mov rdx, r13
0x1001e3fcf: mov rcx, r14
0x1001e3fd2: call qword ptr [rbx + 0x40]
0x1001e3fd5: mov rcx, qword ptr [rbp - 0x30]
0x1001e3fd9: mov rdi, r15
0x1001e3fdc: mov rsi, qword ptr [rbp - 0x40]
0x1001e3fe0: mov rdx, r12
0x1001e3fe3: call qword ptr [rbp - 0x38]
0x1001e3fe6: add rsp, 0x18
0x1001e3fea: pop rbx
0x1001e3feb: pop r12
0x1001e3fed: pop r13
0x1001e3fef: pop r14
0x1001e3ff1: pop r15
0x1001e3ff3: pop rbp
0x1001e3ff4: ret 
0x1001e3ff5: lea rdi, [rip + 0x97bbce] ; 0x100b5fbca 3 == argCount
0x1001e3ffc: lea rsi, [rip + 0x9795d5] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001e4003: mov edx, 0x23d
0x1001e4008: mov ecx, 3
0x1001e400d: call 0x1007e5f70 ; 0x1007e5f70
0x1001e4012: ud2 
0x1001e4014: nop word ptr cs:[rax + rax]
