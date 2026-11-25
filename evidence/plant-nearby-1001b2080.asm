0x1001b2080: push rbp
0x1001b2081: mov rbp, rsp
0x1001b2084: push r15
0x1001b2086: push r14
0x1001b2088: push r12
0x1001b208a: push rbx
0x1001b208b: sub rsp, 0x80
0x1001b2092: mov r12, r8
0x1001b2095: mov r14, rcx
0x1001b2098: mov rax, rdi
0x1001b209b: cmp dword ptr [rbp + 0x10], 0
0x1001b209f: jne 0x1001b20ee
0x1001b20a1: add rdx, rsi
0x1001b20a4: test al, 1
0x1001b20a6: je 0x1001b20b0
0x1001b20a8: mov rcx, qword ptr [rdx]
0x1001b20ab: mov rax, qword ptr [rcx + rax - 1]
0x1001b20b0: lea r15, [rbp - 0x60]
0x1001b20b4: mov rdi, r15
0x1001b20b7: mov rsi, rdx
0x1001b20ba: call rax
0x1001b20bc: mov rax, qword ptr [r12]
0x1001b20c0: mov rbx, qword ptr [rax + 0x40]
0x1001b20c4: lea rdi, [rbp - 0xa0]
0x1001b20cb: call 0x1007fa3b0 ; 0x1007fa3b0
0x1001b20d0: mov rdi, r12
0x1001b20d3: mov rsi, r14
0x1001b20d6: mov rdx, r15
0x1001b20d9: mov rcx, rax
0x1001b20dc: call rbx
0x1001b20de: add rsp, 0x80
0x1001b20e5: pop rbx
0x1001b20e6: pop r12
0x1001b20e8: pop r14
0x1001b20ea: pop r15
0x1001b20ec: pop rbp
0x1001b20ed: ret 
0x1001b20ee: lea rdi, [rip + 0x9ab527] ; 0x100b5d61c 0 == argCount
0x1001b20f5: lea rsi, [rip + 0x9ab4dc] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b20fc: mov edx, 0x23d
0x1001b2101: mov ecx, 3
0x1001b2106: call 0x1007e5f70 ; 0x1007e5f70
0x1001b210b: ud2 
0x1001b210d: nop dword ptr [rax]
