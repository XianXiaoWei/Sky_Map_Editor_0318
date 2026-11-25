0x10032fa30: push rbp
0x10032fa31: mov rbp, rsp
0x10032fa34: push r14
0x10032fa36: push rbx
0x10032fa37: mov rbx, rsi
0x10032fa3a: mov r14, rdi
0x10032fa3d: test rbx, rbx
0x10032fa40: je 0x10032fa69
0x10032fa42: mov rsi, qword ptr [rbx]
0x10032fa45: mov rdi, r14
0x10032fa48: call 0x10032fa30 ; 0x10032fa30
0x10032fa4d: mov rsi, qword ptr [rbx + 8]
0x10032fa51: mov rdi, r14
0x10032fa54: call 0x10032fa30 ; 0x10032fa30
0x10032fa59: call 0x1007e50d0 ; 0x1007e50d0
0x10032fa5e: mov rdi, rax
0x10032fa61: mov rsi, rbx
0x10032fa64: call 0x1007e5db0 ; 0x1007e5db0
0x10032fa69: pop rbx
0x10032fa6a: pop r14
0x10032fa6c: pop rbp
0x10032fa6d: ret 
0x10032fa6e: mov rdi, rax
0x10032fa71: call 0x100011bf0 ; 0x100011bf0
0x10032fa76: nop word ptr cs:[rax + rax]
