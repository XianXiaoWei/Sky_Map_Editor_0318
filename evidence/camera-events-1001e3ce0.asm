0x1001e3ce0: push rbp
0x1001e3ce1: mov rbp, rsp
0x1001e3ce4: push r15
0x1001e3ce6: push r14
0x1001e3ce8: push r13
0x1001e3cea: push r12
0x1001e3cec: push rbx
0x1001e3ced: sub rsp, 0x18
0x1001e3cf1: mov r14, r9
0x1001e3cf4: mov r15, rdx
0x1001e3cf7: mov r12, rsi
0x1001e3cfa: mov rbx, rdi
0x1001e3cfd: cmp dword ptr [rbp + 0x10], 3
0x1001e3d01: jne 0x1001e3dc5
0x1001e3d07: call 0x1007abbf0 ; 0x1007abbf0
0x1001e3d0c: add r15, r12
0x1001e3d0f: test bl, 1
0x1001e3d12: je 0x1001e3d1c
0x1001e3d14: mov rax, qword ptr [r15]
0x1001e3d17: mov rbx, qword ptr [rax + rbx - 1]
0x1001e3d1c: mov qword ptr [rbp - 0x38], rbx
0x1001e3d20: mov r12, qword ptr [r14]
0x1001e3d23: mov r13, qword ptr [r14 + 8]
0x1001e3d27: mov qword ptr [rbp - 0x30], 0
0x1001e3d2f: call 0x10076bba0 ; 0x10076bba0
0x1001e3d34: mov r8, qword ptr [rax]
0x1001e3d37: lea rsi, [rbp - 0x30]
0x1001e3d3b: mov rdi, rax
0x1001e3d3e: mov rdx, r12
0x1001e3d41: mov rcx, r13
0x1001e3d44: call qword ptr [r8 + 0x40]
0x1001e3d48: mov rax, qword ptr [rbp - 0x30]
0x1001e3d4c: mov qword ptr [rbp - 0x40], rax
0x1001e3d50: mov r13, qword ptr [r14 + 0x10]
0x1001e3d54: mov r12, qword ptr [r14 + 0x18]
0x1001e3d58: mov qword ptr [rbp - 0x30], 0
0x1001e3d60: call 0x100595a40 ; 0x100595a40
0x1001e3d65: mov r8, qword ptr [rax]
0x1001e3d68: lea rsi, [rbp - 0x30]
0x1001e3d6c: mov rdi, rax
0x1001e3d6f: mov rdx, r13
0x1001e3d72: mov rcx, r12
0x1001e3d75: call qword ptr [r8 + 0x40]
0x1001e3d79: mov r12, qword ptr [rbp - 0x30]
0x1001e3d7d: mov r13, qword ptr [r14 + 0x20]
0x1001e3d81: mov r14, qword ptr [r14 + 0x28]
0x1001e3d85: mov qword ptr [rbp - 0x30], 0
0x1001e3d8d: call 0x100375c20 ; 0x100375c20
0x1001e3d92: mov rbx, qword ptr [rax]
0x1001e3d95: lea rsi, [rbp - 0x30]
0x1001e3d99: mov rdi, rax
0x1001e3d9c: mov rdx, r13
0x1001e3d9f: mov rcx, r14
0x1001e3da2: call qword ptr [rbx + 0x40]
0x1001e3da5: mov rcx, qword ptr [rbp - 0x30]
0x1001e3da9: mov rdi, r15
0x1001e3dac: mov rsi, qword ptr [rbp - 0x40]
0x1001e3db0: mov rdx, r12
0x1001e3db3: call qword ptr [rbp - 0x38]
0x1001e3db6: add rsp, 0x18
0x1001e3dba: pop rbx
0x1001e3dbb: pop r12
0x1001e3dbd: pop r13
0x1001e3dbf: pop r14
0x1001e3dc1: pop r15
0x1001e3dc3: pop rbp
0x1001e3dc4: ret 
0x1001e3dc5: lea rdi, [rip + 0x97bdfe] ; 0x100b5fbca 3 == argCount
0x1001e3dcc: lea rsi, [rip + 0x979805] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001e3dd3: mov edx, 0x23d
0x1001e3dd8: mov ecx, 3
0x1001e3ddd: call 0x1007e5f70 ; 0x1007e5f70
0x1001e3de2: ud2 
0x1001e3de4: nop word ptr cs:[rax + rax]
