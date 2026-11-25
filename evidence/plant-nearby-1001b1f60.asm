0x1001b1f60: push rbp
0x1001b1f61: mov rbp, rsp
0x1001b1f64: push r15
0x1001b1f66: push r14
0x1001b1f68: push r13
0x1001b1f6a: push r12
0x1001b1f6c: push rbx
0x1001b1f6d: sub rsp, 0x48
0x1001b1f71: mov r15, r9
0x1001b1f74: mov rbx, rdx
0x1001b1f77: mov r12, rsi
0x1001b1f7a: mov r14, rdi
0x1001b1f7d: cmp dword ptr [rbp + 0x10], 1
0x1001b1f81: jne 0x1001b1fd8
0x1001b1f83: call 0x1007abbf0 ; 0x1007abbf0
0x1001b1f88: add rbx, r12
0x1001b1f8b: test r14b, 1
0x1001b1f8f: je 0x1001b1f99
0x1001b1f91: mov rax, qword ptr [rbx]
0x1001b1f94: mov r14, qword ptr [rax + r14 - 1]
0x1001b1f99: mov r12, qword ptr [r15]
0x1001b1f9c: mov r15, qword ptr [r15 + 8]
0x1001b1fa0: lea rdi, [rbp - 0x70]
0x1001b1fa4: call 0x1007fa3b0 ; 0x1007fa3b0
0x1001b1fa9: mov r8, qword ptr [rax]
0x1001b1fac: lea r13, [rbp - 0x70]
0x1001b1fb0: mov rdi, rax
0x1001b1fb3: mov rsi, r13
0x1001b1fb6: mov rdx, r12
0x1001b1fb9: mov rcx, r15
0x1001b1fbc: call qword ptr [r8 + 0x40]
0x1001b1fc0: mov rdi, rbx
0x1001b1fc3: mov rsi, r13
0x1001b1fc6: call r14
0x1001b1fc9: add rsp, 0x48
0x1001b1fcd: pop rbx
0x1001b1fce: pop r12
0x1001b1fd0: pop r13
0x1001b1fd2: pop r14
0x1001b1fd4: pop r15
0x1001b1fd6: pop rbp
0x1001b1fd7: ret 
0x1001b1fd8: lea rdi, [rip + 0x9ab621] ; 0x100b5d600 1 == argCount
0x1001b1fdf: lea rsi, [rip + 0x9ab5f2] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b1fe6: mov edx, 0x23d
0x1001b1feb: mov ecx, 3
0x1001b1ff0: call 0x1007e5f70 ; 0x1007e5f70
0x1001b1ff5: ud2 
0x1001b1ff7: nop word ptr [rax + rax]
