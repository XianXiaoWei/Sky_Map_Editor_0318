0x1001b2260: push rbp
0x1001b2261: mov rbp, rsp
0x1001b2264: push r15
0x1001b2266: push r14
0x1001b2268: push rbx
0x1001b2269: push rax
0x1001b226a: mov r15, r8
0x1001b226d: mov r14, rcx
0x1001b2270: mov rax, rdi
0x1001b2273: cmp dword ptr [rbp + 0x10], 0
0x1001b2277: jne 0x1001b22be
0x1001b2279: add rdx, rsi
0x1001b227c: test al, 1
0x1001b227e: je 0x1001b2288
0x1001b2280: mov rcx, qword ptr [rdx]
0x1001b2283: mov rax, qword ptr [rcx + rax - 1]
0x1001b2288: mov rdi, rdx
0x1001b228b: call rax
0x1001b228d: mov byte ptr [rbp - 0x19], al
0x1001b2290: mov rax, qword ptr [r15]
0x1001b2293: mov rbx, qword ptr [rax + 0x40]
0x1001b2297: mov byte ptr [rbp - 0x1a], 0
0x1001b229b: lea rdi, [rbp - 0x1a]
0x1001b229f: call 0x1007abbd0 ; 0x1007abbd0
0x1001b22a4: lea rdx, [rbp - 0x19]
0x1001b22a8: mov rdi, r15
0x1001b22ab: mov rsi, r14
0x1001b22ae: mov rcx, rax
0x1001b22b1: call rbx
0x1001b22b3: add rsp, 8
0x1001b22b7: pop rbx
0x1001b22b8: pop r14
0x1001b22ba: pop r15
0x1001b22bc: pop rbp
0x1001b22bd: ret 
0x1001b22be: lea rdi, [rip + 0x9ab357] ; 0x100b5d61c 0 == argCount
0x1001b22c5: lea rsi, [rip + 0x9ab30c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b22cc: mov edx, 0x23d
0x1001b22d1: mov ecx, 3
0x1001b22d6: call 0x1007e5f70 ; 0x1007e5f70
0x1001b22db: ud2 
0x1001b22dd: nop dword ptr [rax]
