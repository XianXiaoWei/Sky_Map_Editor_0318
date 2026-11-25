0x1003f68d0: push rbp
0x1003f68d1: mov rbp, rsp
0x1003f68d4: mov rax, qword ptr [rdi]
0x1003f68d7: test rax, rax
0x1003f68da: je 0x1003f6923
0x1003f68dc: mov rdi, qword ptr [rax + 0x10]
0x1003f68e0: test rdi, rdi
0x1003f68e3: je 0x1003f6927
0x1003f68e5: cmp dword ptr [rdi + 0x264], 0
0x1003f68ec: js 0x1003f692b
0x1003f68ee: mov ecx, dword ptr [rdi + 0xd0]
0x1003f68f4: xor eax, eax
0x1003f68f6: test ecx, ecx
0x1003f68f8: je 0x1003f6921
0x1003f68fa: mov rdi, qword ptr [rdi + 0xe8]
0x1003f6901: nop word ptr cs:[rax + rax]
0x1003f6910: cmp dword ptr [rdi + 0x18], esi
0x1003f6913: je 0x1003f692f
0x1003f6915: add rdi, 0x30
0x1003f6919: inc eax
0x1003f691b: cmp ecx, eax
0x1003f691d: ja 0x1003f6910
0x1003f691f: xor eax, eax
0x1003f6921: pop rbp
0x1003f6922: ret 
0x1003f6923: xor eax, eax
0x1003f6925: pop rbp
0x1003f6926: ret 
0x1003f6927: xor eax, eax
0x1003f6929: pop rbp
0x1003f692a: ret 
0x1003f692b: xor eax, eax
0x1003f692d: pop rbp
0x1003f692e: ret 
0x1003f692f: mov qword ptr [rdx], rdi
0x1003f6932: mov al, 1
0x1003f6934: pop rbp
0x1003f6935: ret 
0x1003f6936: nop word ptr cs:[rax + rax]
