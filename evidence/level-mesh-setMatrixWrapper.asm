0x1004037c0: push rbp
0x1004037c1: mov rbp, rsp
0x1004037c4: push r15
0x1004037c6: push r14
0x1004037c8: push r13
0x1004037ca: push r12
0x1004037cc: push rbx
0x1004037cd: sub rsp, 0x48
0x1004037d1: mov r15, r9
0x1004037d4: mov rbx, rdx
0x1004037d7: mov r12, rsi
0x1004037da: mov r14, rdi
0x1004037dd: cmp dword ptr [rbp + 0x10], 1
0x1004037e1: jne 0x100403838
0x1004037e3: call 0x1007abbf0 ; 0x1007abbf0
0x1004037e8: add rbx, r12
0x1004037eb: test r14b, 1
0x1004037ef: je 0x1004037f9
0x1004037f1: mov rax, qword ptr [rbx]
0x1004037f4: mov r14, qword ptr [rax + r14 - 1]
0x1004037f9: mov r12, qword ptr [r15]
0x1004037fc: mov r15, qword ptr [r15 + 8]
0x100403800: lea rdi, [rbp - 0x70]
0x100403804: call 0x1007fa3b0 ; 0x1007fa3b0
0x100403809: mov r8, qword ptr [rax]
0x10040380c: lea r13, [rbp - 0x70]
0x100403810: mov rdi, rax
0x100403813: mov rsi, r13
0x100403816: mov rdx, r12
0x100403819: mov rcx, r15
0x10040381c: call qword ptr [r8 + 0x40]
0x100403820: mov rdi, rbx
0x100403823: mov rsi, r13
0x100403826: call r14
0x100403829: add rsp, 0x48
0x10040382d: pop rbx
0x10040382e: pop r12
0x100403830: pop r13
0x100403832: pop r14
0x100403834: pop r15
0x100403836: pop rbp
0x100403837: ret 
0x100403838: lea rdi, [rip + 0x759dc1] ; 0x100b5d600 1 == argCount
0x10040383f: lea rsi, [rip + 0x759d92] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100403846: mov edx, 0x23d
0x10040384b: mov ecx, 3
0x100403850: call 0x1007e5f70 ; 0x1007e5f70
0x100403855: ud2 
0x100403857: nop word ptr [rax + rax]
