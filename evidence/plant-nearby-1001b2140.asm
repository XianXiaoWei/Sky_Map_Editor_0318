0x1001b2140: push rbp
0x1001b2141: mov rbp, rsp
0x1001b2144: push r15
0x1001b2146: push r14
0x1001b2148: push r12
0x1001b214a: push rbx
0x1001b214b: sub rsp, 0x10
0x1001b214f: mov r15, r9
0x1001b2152: mov rbx, rdx
0x1001b2155: mov r12, rsi
0x1001b2158: mov r14, rdi
0x1001b215b: cmp dword ptr [rbp + 0x10], 1
0x1001b215f: jne 0x1001b21ba
0x1001b2161: call 0x1007abbf0 ; 0x1007abbf0
0x1001b2166: add rbx, r12
0x1001b2169: test r14b, 1
0x1001b216d: je 0x1001b2177
0x1001b216f: mov rax, qword ptr [rbx]
0x1001b2172: mov r14, qword ptr [rax + r14 - 1]
0x1001b2177: mov r12, qword ptr [r15]
0x1001b217a: mov r15, qword ptr [r15 + 8]
0x1001b217e: mov byte ptr [rbp - 0x21], 0
0x1001b2182: mov byte ptr [rbp - 0x22], 0
0x1001b2186: lea rdi, [rbp - 0x22]
0x1001b218a: call 0x1007abbd0 ; 0x1007abbd0
0x1001b218f: mov r8, qword ptr [rax]
0x1001b2192: lea rsi, [rbp - 0x21]
0x1001b2196: mov rdi, rax
0x1001b2199: mov rdx, r12
0x1001b219c: mov rcx, r15
0x1001b219f: call qword ptr [r8 + 0x40]
0x1001b21a3: movzx esi, byte ptr [rbp - 0x21]
0x1001b21a7: mov rdi, rbx
0x1001b21aa: call r14
0x1001b21ad: add rsp, 0x10
0x1001b21b1: pop rbx
0x1001b21b2: pop r12
0x1001b21b4: pop r14
0x1001b21b6: pop r15
0x1001b21b8: pop rbp
0x1001b21b9: ret 
0x1001b21ba: lea rdi, [rip + 0x9ab43f] ; 0x100b5d600 1 == argCount
0x1001b21c1: lea rsi, [rip + 0x9ab410] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b21c8: mov edx, 0x23d
0x1001b21cd: mov ecx, 3
0x1001b21d2: call 0x1007e5f70 ; 0x1007e5f70
0x1001b21d7: ud2 
0x1001b21d9: nop dword ptr [rax]
