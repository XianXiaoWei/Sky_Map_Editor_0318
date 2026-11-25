0x1006c3920: push rbp
0x1006c3921: mov rbp, rsp
0x1006c3924: push r15
0x1006c3926: push r14
0x1006c3928: push rbx
0x1006c3929: push rax
0x1006c392a: mov rbx, rsi
0x1006c392d: mov r14, rdi
0x1006c3930: test rbx, rbx
0x1006c3933: je 0x1006c3989
0x1006c3935: cmp byte ptr [rbx + 0x1094], 0
0x1006c393c: je 0x1006c3989
0x1006c393e: mov dword ptr [rbx + 0x480], 0
0x1006c3948: mov eax, dword ptr [rbx + 0x18]
0x1006c394b: mov dword ptr [rbx + 0x1090], eax
0x1006c3951: mov dword ptr [rbx + 0x108c], eax
0x1006c3957: mov byte ptr [rbx + 0x1094], 0
0x1006c395e: test byte ptr [rbx + 0x20], 1
0x1006c3962: je 0x1006c3978
0x1006c3964: mov r15, qword ptr [rbx + 0x30]
0x1006c3968: call 0x1007e50d0 ; 0x1007e50d0
0x1006c396d: mov rdi, rax
0x1006c3970: mov rsi, r15
0x1006c3973: call 0x1007e5db0 ; 0x1007e5db0
0x1006c3978: mov rax, qword ptr [r14 + 0x42810]
0x1006c397f: mov qword ptr [rbx], rax
0x1006c3982: mov qword ptr [r14 + 0x42810], rbx
0x1006c3989: add rsp, 8
0x1006c398d: pop rbx
0x1006c398e: pop r14
0x1006c3990: pop r15
0x1006c3992: pop rbp
0x1006c3993: ret 
0x1006c3994: mov rdi, rax
0x1006c3997: call 0x100011bf0 ; 0x100011bf0
0x1006c399c: nop dword ptr [rax]
