0x1006d9160: push rbp
0x1006d9161: mov rbp, rsp
0x1006d9164: push rbx
0x1006d9165: push rax
0x1006d9166: mov rbx, rdi
0x1006d9169: cmp byte ptr [rbx + 0xc], 0
0x1006d916d: je 0x1006d9173
0x1006d916f: mov byte ptr [rbx + 0x21], 0
0x1006d9173: mov rdi, rbx
0x1006d9176: call 0x10032e2f0 ; 0x10032e2f0
0x1006d917b: mov eax, dword ptr [rbx + 0x68]
0x1006d917e: mov dword ptr [rbx + 0x9c], eax
0x1006d9184: cmp byte ptr [rbx + 0xc], 0
0x1006d9188: je 0x1006d9194
0x1006d918a: cmp byte ptr [rbx + 0x7d], 0
0x1006d918e: je 0x1006d9194
0x1006d9190: mov byte ptr [rbx + 0x7d], 0
0x1006d9194: add rsp, 8
0x1006d9198: pop rbx
0x1006d9199: pop rbp
0x1006d919a: ret 
0x1006d919b: nop dword ptr [rax + rax]
