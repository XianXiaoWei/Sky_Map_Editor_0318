0x10032e920: push rbp
0x10032e921: mov rbp, rsp
0x10032e924: push r15
0x10032e926: push r14
0x10032e928: push r13
0x10032e92a: push r12
0x10032e92c: push rbx
0x10032e92d: sub rsp, 0x18
0x10032e931: mov qword ptr [rbp - 0x38], rsi
0x10032e935: mov r13, rdi
0x10032e938: lea r15, [r13 + 0x5040]
0x10032e93f: lea rax, [r13 + 0x85098]
0x10032e946: mov qword ptr [rbp - 0x30], rax
0x10032e94a: lea rbx, [r13 + 0x30]
0x10032e94e: xor r14d, r14d
0x10032e951: nop word ptr cs:[rax + rax]
0x10032e960: lea r12, [rbx + r14]
0x10032e964: mov rdi, qword ptr [rbx + r14]
0x10032e968: test rdi, rdi
0x10032e96b: je 0x10032e99e
0x10032e96d: cmp byte ptr [rdi + 0x20], 0
0x10032e971: je 0x10032e985
0x10032e973: mov rax, qword ptr [rdi]
0x10032e976: mov rsi, qword ptr [rbp - 0x38]
0x10032e97a: mov rdx, qword ptr [rbp - 0x30]
0x10032e97e: call qword ptr [rax + 0x18]
0x10032e981: mov rdi, qword ptr [rbx + r14]
0x10032e985: mov rax, qword ptr [rdi]
0x10032e988: call qword ptr [rax]
0x10032e98a: mov rsi, qword ptr [rbx + r14]
0x10032e98e: mov rdi, r15
0x10032e991: call 0x100795a70 ; 0x100795a70
0x10032e996: mov qword ptr [rbx + r14], 0
0x10032e99e: mov rax, qword ptr [r13 + 0x5030]
0x10032e9a5: mov qword ptr [r13 + r14 + 0x38], rax
0x10032e9aa: mov qword ptr [r13 + 0x5030], r12
0x10032e9b1: add r14, 0x10
0x10032e9b5: cmp r14, 0x5000
0x10032e9bc: jne 0x10032e960
0x10032e9be: mov byte ptr [r13 + 0x5038], 1
0x10032e9c6: mov qword ptr [r13 + 0x5030], 0
0x10032e9d1: add rsp, 0x18
0x10032e9d5: pop rbx
0x10032e9d6: pop r12
0x10032e9d8: pop r13
0x10032e9da: pop r14
0x10032e9dc: pop r15
0x10032e9de: pop rbp
0x10032e9df: ret 
