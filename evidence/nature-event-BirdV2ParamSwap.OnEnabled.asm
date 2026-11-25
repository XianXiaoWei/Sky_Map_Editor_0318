0x1001aa160: push rbp
0x1001aa161: mov rbp, rsp
0x1001aa164: push rbx
0x1001aa165: push rax
0x1001aa166: mov rbx, rdi
0x1001aa169: mov rax, qword ptr [rbx + 0x38]
0x1001aa16d: test rax, rax
0x1001aa170: je 0x1001aa19d
0x1001aa172: mov rcx, qword ptr [rbx + 0x40]
0x1001aa176: mov qword ptr [rcx + 0x78], rax
0x1001aa17a: cmp byte ptr [rcx + 0x440], 0
0x1001aa181: je 0x1001aa19d
0x1001aa183: mov byte ptr [rcx + 0x440], 1
0x1001aa18a: mov rdi, qword ptr [rax + 0x48]
0x1001aa18e: test rdi, rdi
0x1001aa191: je 0x1001aa19d
0x1001aa193: mov esi, 1
0x1001aa198: call 0x1004d1f60 ; 0x1004d1f60
0x1001aa19d: mov rdi, rbx
0x1001aa1a0: add rsp, 8
0x1001aa1a4: pop rbx
0x1001aa1a5: pop rbp
0x1001aa1a6: jmp 0x10032ef60 ; 0x10032ef60
0x1001aa1ab: nop dword ptr [rax + rax]
