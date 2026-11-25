0x10043e640: push rbp
0x10043e641: mov rbp, rsp
0x10043e644: push r15
0x10043e646: push r14
0x10043e648: push r12
0x10043e64a: push rbx
0x10043e64b: sub rsp, 0x80
0x10043e652: mov r12, r8
0x10043e655: mov r14, rcx
0x10043e658: mov rax, rdi
0x10043e65b: cmp dword ptr [rbp + 0x10], 0
0x10043e65f: jne 0x10043e6ae
0x10043e661: add rdx, rsi
0x10043e664: test al, 1
0x10043e666: je 0x10043e670
0x10043e668: mov rcx, qword ptr [rdx]
0x10043e66b: mov rax, qword ptr [rcx + rax - 1]
0x10043e670: lea r15, [rbp - 0x60]
0x10043e674: mov rdi, r15
0x10043e677: mov rsi, rdx
0x10043e67a: call rax
0x10043e67c: mov rax, qword ptr [r12]
0x10043e680: mov rbx, qword ptr [rax + 0x40]
0x10043e684: lea rdi, [rbp - 0xa0]
0x10043e68b: call 0x1007fa3b0 ; 0x1007fa3b0
0x10043e690: mov rdi, r12
0x10043e693: mov rsi, r14
0x10043e696: mov rdx, r15
0x10043e699: mov rcx, rax
0x10043e69c: call rbx
0x10043e69e: add rsp, 0x80
0x10043e6a5: pop rbx
0x10043e6a6: pop r12
0x10043e6a8: pop r14
0x10043e6aa: pop r15
0x10043e6ac: pop rbp
0x10043e6ad: ret 
0x10043e6ae: lea rdi, [rip + 0x71ef67] ; 0x100b5d61c 0 == argCount
0x10043e6b5: lea rsi, [rip + 0x71ef1c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10043e6bc: mov edx, 0x23d
0x10043e6c1: mov ecx, 3
0x10043e6c6: call 0x1007e5f70 ; 0x1007e5f70
0x10043e6cb: ud2 
0x10043e6cd: nop dword ptr [rax]
