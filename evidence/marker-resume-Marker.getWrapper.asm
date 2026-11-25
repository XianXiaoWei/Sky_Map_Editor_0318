0x10043e820: push rbp
0x10043e821: mov rbp, rsp
0x10043e824: push r15
0x10043e826: push r14
0x10043e828: push rbx
0x10043e829: push rax
0x10043e82a: mov r15, r8
0x10043e82d: mov r14, rcx
0x10043e830: mov rax, rdi
0x10043e833: cmp dword ptr [rbp + 0x10], 0
0x10043e837: jne 0x10043e87e
0x10043e839: add rdx, rsi
0x10043e83c: test al, 1
0x10043e83e: je 0x10043e848
0x10043e840: mov rcx, qword ptr [rdx]
0x10043e843: mov rax, qword ptr [rcx + rax - 1]
0x10043e848: mov rdi, rdx
0x10043e84b: call rax
0x10043e84d: mov byte ptr [rbp - 0x19], al
0x10043e850: mov rax, qword ptr [r15]
0x10043e853: mov rbx, qword ptr [rax + 0x40]
0x10043e857: mov byte ptr [rbp - 0x1a], 0
0x10043e85b: lea rdi, [rbp - 0x1a]
0x10043e85f: call 0x1007abbd0 ; 0x1007abbd0
0x10043e864: lea rdx, [rbp - 0x19]
0x10043e868: mov rdi, r15
0x10043e86b: mov rsi, r14
0x10043e86e: mov rcx, rax
0x10043e871: call rbx
0x10043e873: add rsp, 8
0x10043e877: pop rbx
0x10043e878: pop r14
0x10043e87a: pop r15
0x10043e87c: pop rbp
0x10043e87d: ret 
0x10043e87e: lea rdi, [rip + 0x71ed97] ; 0x100b5d61c 0 == argCount
0x10043e885: lea rsi, [rip + 0x71ed4c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10043e88c: mov edx, 0x23d
0x10043e891: mov ecx, 3
0x10043e896: call 0x1007e5f70 ; 0x1007e5f70
0x10043e89b: ud2 
0x10043e89d: nop dword ptr [rax]
