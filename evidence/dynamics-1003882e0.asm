0x1003882e0: push rbp
0x1003882e1: mov rbp, rsp
0x1003882e4: push r15
0x1003882e6: push r14
0x1003882e8: push rbx
0x1003882e9: push rax
0x1003882ea: mov rbx, rdx
0x1003882ed: mov r14, rsi
0x1003882f0: mov r15, rdi
0x1003882f3: cmp dword ptr [rbp + 0x10], 0
0x1003882f7: jne 0x100388321
0x1003882f9: call 0x1007abbf0 ; 0x1007abbf0
0x1003882fe: add rbx, r14
0x100388301: test r15b, 1
0x100388305: mov rcx, r15
0x100388308: je 0x100388312
0x10038830a: mov rax, qword ptr [rbx]
0x10038830d: mov rcx, qword ptr [rax + rcx - 1]
0x100388312: mov rdi, rbx
0x100388315: add rsp, 8
0x100388319: pop rbx
0x10038831a: pop r14
0x10038831c: pop r15
0x10038831e: pop rbp
0x10038831f: jmp rcx
0x100388321: lea rdi, [rip + 0x7d52f4] ; 0x100b5d61c 0 == argCount
0x100388328: lea rsi, [rip + 0x7d52a9] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10038832f: mov edx, 0x23d
0x100388334: mov ecx, 3
0x100388339: call 0x1007e5f70 ; 0x1007e5f70
0x10038833e: ud2 
