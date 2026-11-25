0x10022b7f0: push rbp
0x10022b7f1: mov rbp, rsp
0x10022b7f4: push r15
0x10022b7f6: push r14
0x10022b7f8: push rbx
0x10022b7f9: push rax
0x10022b7fa: mov r15, rdi
0x10022b7fd: cmp dword ptr [r15 + 0x10], 0
0x10022b802: je 0x10022b82a
0x10022b804: xor ebx, ebx
0x10022b806: movzx r14d, sil
0x10022b80a: nop word ptr [rax + rax]
0x10022b810: mov rax, qword ptr [r15 + 8]
0x10022b814: mov ecx, ebx
0x10022b816: mov rdi, qword ptr [rax + rcx*8]
0x10022b81a: mov esi, r14d
0x10022b81d: call 0x1004d1f60 ; 0x1004d1f60
0x10022b822: inc ebx
0x10022b824: cmp ebx, dword ptr [r15 + 0x10]
0x10022b828: jb 0x10022b810
0x10022b82a: add rsp, 8
0x10022b82e: pop rbx
0x10022b82f: pop r14
0x10022b831: pop r15
0x10022b833: pop rbp
0x10022b834: ret 
0x10022b835: nop word ptr cs:[rax + rax]
