0x1005347f0: push rbp
0x1005347f1: mov rbp, rsp
0x1005347f4: push r14
0x1005347f6: push rbx
0x1005347f7: mov rbx, rdi
0x1005347fa: mov rdi, qword ptr [rbx + 0x78]
0x1005347fe: test rdi, rdi
0x100534801: je 0x100534825
0x100534803: mov r14, qword ptr [rbx + 0x80]
0x10053480a: test r14, r14
0x10053480d: je 0x100534825
0x10053480f: mov rax, qword ptr [rdi]
0x100534812: call qword ptr [rax]
0x100534814: cmp r14, rax
0x100534817: jne 0x100534825
0x100534819: mov rdi, qword ptr [rbx + 0x78]
0x10053481d: mov rax, qword ptr [rdi]
0x100534820: xor esi, esi
0x100534822: call qword ptr [rax + 0x30]
0x100534825: mov rdi, rbx
0x100534828: pop rbx
0x100534829: pop r14
0x10053482b: pop rbp
0x10053482c: jmp 0x10032ef60 ; 0x10032ef60
0x100534831: nop word ptr cs:[rax + rax]
