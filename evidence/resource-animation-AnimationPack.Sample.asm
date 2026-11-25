0x1000e6900: push rbp
0x1000e6901: mov rbp, rsp
0x1000e6904: push r15
0x1000e6906: push r14
0x1000e6908: push rbx
0x1000e6909: sub rsp, 0x38
0x1000e690d: mov r14, rsi
0x1000e6910: mov rbx, rdi
0x1000e6913: mov r15b, byte ptr [rbp + 0x28]
0x1000e6917: mov al, byte ptr [rbp + 0x18]
0x1000e691a: mov r10d, dword ptr [rbp + 0x10]
0x1000e691e: movzx eax, al
0x1000e6921: lea rdi, [rbp - 0x50]
0x1000e6925: mov esi, edx
0x1000e6927: mov edx, ecx
0x1000e6929: mov ecx, r8d
0x1000e692c: mov r8d, r9d
0x1000e692f: mov r9d, eax
0x1000e6932: push rbx
0x1000e6933: push r10
0x1000e6935: call 0x1000e42d0 ; 0x1000e42d0
0x1000e693a: add rsp, 0x10
0x1000e693e: test r15b, r15b
0x1000e6941: je 0x1000e694c
0x1000e6943: mov rsi, qword ptr [rbx + 0x90]
0x1000e694a: jmp 0x1000e6953 ; 0x1000e6953
0x1000e694c: mov rsi, qword ptr [rbx + 0x88]
0x1000e6953: movsxd rax, dword ptr [rbx + 0x54]
0x1000e6957: shl rax, 4
0x1000e695b: lea rdx, [rax + rax*2]
0x1000e695f: mov rdi, r14
0x1000e6962: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000e6967: mov rdi, qword ptr [rbp - 0x20]
0x1000e696b: test rdi, rdi
0x1000e696e: je 0x1000e6987
0x1000e6970: mov rcx, qword ptr [rbp + 0x20]
0x1000e6974: movzx r9d, r15b
0x1000e6978: lea rdx, [rbp - 0x50]
0x1000e697c: mov rsi, r14
0x1000e697f: mov r8, rbx
0x1000e6982: call 0x1000e5020 ; 0x1000e5020
0x1000e6987: add rsp, 0x38
0x1000e698b: pop rbx
0x1000e698c: pop r14
0x1000e698e: pop r15
0x1000e6990: pop rbp
0x1000e6991: ret 
0x1000e6992: nop word ptr cs:[rax + rax]
