0x1001ad6d0: push rbp
0x1001ad6d1: mov rbp, rsp
0x1001ad6d4: push r15
0x1001ad6d6: push r14
0x1001ad6d8: push r13
0x1001ad6da: push r12
0x1001ad6dc: push rbx
0x1001ad6dd: push rax
0x1001ad6de: mov r14, rdi
0x1001ad6e1: lea r15, [r14 + 0x10]
0x1001ad6e5: xor ebx, ebx
0x1001ad6e7: nop word ptr [rax + rax]
0x1001ad6f0: cmp byte ptr [r15 + rbx + 0xa1], 0
0x1001ad6f9: je 0x1001ad763
0x1001ad6fb: lea r12, [r15 + rbx]
0x1001ad6ff: mov byte ptr [r15 + rbx + 0xa1], 0
0x1001ad708: mov byte ptr [r15 + rbx + 0x56], 0
0x1001ad70e: mov rdi, qword ptr [r15 + rbx + 0x100]
0x1001ad716: test rdi, rdi
0x1001ad719: je 0x1001ad750
0x1001ad71b: mov r13, qword ptr [r15 + rbx + 0x108]
0x1001ad723: test r13, r13
0x1001ad726: je 0x1001ad750
0x1001ad728: mov rax, qword ptr [rdi]
0x1001ad72b: call qword ptr [rax]
0x1001ad72d: cmp r13, rax
0x1001ad730: jne 0x1001ad750
0x1001ad732: mov rdi, qword ptr [r15 + rbx + 0x100]
0x1001ad73a: mov rax, qword ptr [rdi]
0x1001ad73d: xor esi, esi
0x1001ad73f: call qword ptr [rax + 0x30]
0x1001ad742: nop word ptr cs:[rax + rax]
0x1001ad750: mov rax, qword ptr [r14 + 0x12010]
0x1001ad757: mov qword ptr [r14 + rbx + 0x10], rax
0x1001ad75c: mov qword ptr [r14 + 0x12010], r12
0x1001ad763: add rbx, 0x120
0x1001ad76a: cmp rbx, 0x12000
0x1001ad771: jne 0x1001ad6f0
0x1001ad777: mov byte ptr [r14 + 0xc], 0
0x1001ad77c: add rsp, 8
0x1001ad780: pop rbx
0x1001ad781: pop r12
0x1001ad783: pop r13
0x1001ad785: pop r14
0x1001ad787: pop r15
0x1001ad789: pop rbp
0x1001ad78a: ret 
0x1001ad78b: nop dword ptr [rax + rax]
