0x1009ad192: push rbp
0x1009ad193: mov rbp, rsp
0x1009ad196: push r14
0x1009ad198: push rbx
0x1009ad199: sub rsp, 0x30
0x1009ad19d: mov r14, rsi
0x1009ad1a0: mov rax, qword ptr [rip + 0x260731] ; 0x100c0d8d8
0x1009ad1a7: mov rax, qword ptr [rax]
0x1009ad1aa: mov qword ptr [rbp - 0x18], rax
0x1009ad1ae: mov rdi, qword ptr [rdi]
0x1009ad1b1: mov rax, qword ptr [rdi]
0x1009ad1b4: mov edx, 1
0x1009ad1b9: call qword ptr [rax + 0x168]
0x1009ad1bf: mov rbx, rax
0x1009ad1c2: test rbx, rbx
0x1009ad1c5: jne 0x1009ad1d3
0x1009ad1c7: lea rsi, [rbp - 0x40]
0x1009ad1cb: mov rdi, r14
0x1009ad1ce: call 0x100988c54 ; 0x100988c54
0x1009ad1d3: mov rax, qword ptr [rip + 0x2606fe] ; 0x100c0d8d8
0x1009ad1da: mov rax, qword ptr [rax]
0x1009ad1dd: cmp rax, qword ptr [rbp - 0x18]
0x1009ad1e1: jne 0x1009ad1ef
0x1009ad1e3: mov rax, rbx
0x1009ad1e6: add rsp, 0x30
0x1009ad1ea: pop rbx
0x1009ad1eb: pop r14
0x1009ad1ed: pop rbp
0x1009ad1ee: ret 
0x1009ad1ef: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
