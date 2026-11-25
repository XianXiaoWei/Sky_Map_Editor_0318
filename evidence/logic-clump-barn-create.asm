0x10022c960: push rbp
0x10022c961: mov rbp, rsp
0x10022c964: push r15
0x10022c966: push r14
0x10022c968: push rbx
0x10022c969: push rax
0x10022c96a: mov rbx, rdx
0x10022c96d: mov r14, rsi
0x10022c970: mov r15, rdi
0x10022c973: cmp dword ptr [rbp + 0x10], 0
0x10022c977: jne 0x10022c9a1
0x10022c979: call 0x1007abbf0 ; 0x1007abbf0
0x10022c97e: add rbx, r14
0x10022c981: test r15b, 1
0x10022c985: mov rcx, r15
0x10022c988: je 0x10022c992
0x10022c98a: mov rax, qword ptr [rbx]
0x10022c98d: mov rcx, qword ptr [rax + rcx - 1]
0x10022c992: mov rdi, rbx
0x10022c995: add rsp, 8
0x10022c999: pop rbx
0x10022c99a: pop r14
0x10022c99c: pop r15
0x10022c99e: pop rbp
0x10022c99f: jmp rcx
0x10022c9a1: lea rdi, [rip + 0x930c74] ; 0x100b5d61c 0 == argCount
0x10022c9a8: lea rsi, [rip + 0x930c29] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10022c9af: mov edx, 0x23d
0x10022c9b4: mov ecx, 3
0x10022c9b9: call 0x1007e5f70 ; 0x1007e5f70
0x10022c9be: ud2 
