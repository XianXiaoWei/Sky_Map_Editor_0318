0x100198690: push rbp
0x100198691: mov rbp, rsp
0x100198694: push rbx
0x100198695: push rax
0x100198696: lea rax, [rip + 0xa7a0bb] ; 0x100c12758
0x10019869d: mov qword ptr [rdi], rax
0x1001986a0: test byte ptr [rdi + 0x58], 1
0x1001986a4: je 0x1001986ba
0x1001986a6: mov rbx, qword ptr [rdi + 0x68]
0x1001986aa: call 0x1007e50d0 ; 0x1007e50d0
0x1001986af: mov rdi, rax
0x1001986b2: mov rsi, rbx
0x1001986b5: call 0x1007e5db0 ; 0x1007e5db0
0x1001986ba: add rsp, 8
0x1001986be: pop rbx
0x1001986bf: pop rbp
0x1001986c0: ret 
0x1001986c1: mov rdi, rax
0x1001986c4: call 0x100011bf0 ; 0x100011bf0
0x1001986c9: nop dword ptr [rax]
