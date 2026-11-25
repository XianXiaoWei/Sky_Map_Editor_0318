0x1007c2570: push rbp
0x1007c2571: mov rbp, rsp
0x1007c2574: push r14
0x1007c2576: push rbx
0x1007c2577: mov rbx, rdi
0x1007c257a: mov rax, qword ptr [rbx]
0x1007c257d: test rax, rax
0x1007c2580: je 0x1007c2597
0x1007c2582: mov rdi, qword ptr [rax + 0x10]
0x1007c2586: test rdi, rdi
0x1007c2589: je 0x1007c259c
0x1007c258b: mov rax, qword ptr [rdi]
0x1007c258e: mov rsi, rbx
0x1007c2591: call qword ptr [rax + 0x30]
0x1007c2594: mov rax, qword ptr [rbx]
0x1007c2597: test rax, rax
0x1007c259a: je 0x1007c25dc
0x1007c259c: mov rcx, qword ptr [rbx + 8]
0x1007c25a0: mov rdx, qword ptr [rbx + 0x10]
0x1007c25a4: test rdx, rdx
0x1007c25a7: lea rdx, [rdx + 8]
0x1007c25ab: cmove rdx, rax
0x1007c25af: mov qword ptr [rdx], rcx
0x1007c25b2: mov rcx, qword ptr [rbx + 8]
0x1007c25b6: mov rdx, qword ptr [rbx + 0x10]
0x1007c25ba: add rax, 8
0x1007c25be: test rcx, rcx
0x1007c25c1: lea rcx, [rcx + 0x10]
0x1007c25c5: cmove rcx, rax
0x1007c25c9: mov qword ptr [rcx], rdx
0x1007c25cc: vxorps xmm0, xmm0, xmm0
0x1007c25d0: vmovups xmmword ptr [rbx], xmm0
0x1007c25d4: mov qword ptr [rbx + 0x10], 0
0x1007c25dc: pop rbx
0x1007c25dd: pop r14
0x1007c25df: pop rbp
0x1007c25e0: ret 
0x1007c25e1: mov r14, rax
0x1007c25e4: mov rdi, rbx
0x1007c25e7: call 0x1007c2600 ; 0x1007c2600
0x1007c25ec: mov rdi, r14
0x1007c25ef: call 0x100011bf0 ; 0x100011bf0
0x1007c25f4: nop word ptr cs:[rax + rax]
