0x1002de780: push rbp
0x1002de781: mov rbp, rsp
0x1002de784: cmp byte ptr [rdi + 0x220], 0
0x1002de78b: je 0x1002de81f
0x1002de791: mov byte ptr [rdi + 0x220], 0
0x1002de798: movsxd rcx, dword ptr [rdi + 0x14]
0x1002de79c: test rcx, rcx
0x1002de79f: jle 0x1002de81f
0x1002de7a5: mov eax, ecx
0x1002de7a7: and eax, 1
0x1002de7aa: cmp ecx, 1
0x1002de7ad: jne 0x1002de7b8
0x1002de7af: xor edx, edx
0x1002de7b1: test rax, rax
0x1002de7b4: jne 0x1002de804
0x1002de7b6: jmp 0x1002de81f ; 0x1002de81f
0x1002de7b8: sub rcx, rax
0x1002de7bb: xor edx, edx
0x1002de7bd: nop dword ptr [rax]
0x1002de7c0: mov rsi, qword ptr [rdi + rdx*8 + 0x20]
0x1002de7c5: test rsi, rsi
0x1002de7c8: je 0x1002de7db
0x1002de7ca: mov dword ptr [rsi + 0x170], 0x47c35000
0x1002de7d4: mov byte ptr [rsi + 0xb1], 1
0x1002de7db: mov rsi, qword ptr [rdi + rdx*8 + 0x28]
0x1002de7e0: test rsi, rsi
0x1002de7e3: je 0x1002de7f6
0x1002de7e5: mov dword ptr [rsi + 0x170], 0x47c35000
0x1002de7ef: mov byte ptr [rsi + 0xb1], 1
0x1002de7f6: add rdx, 2
0x1002de7fa: cmp rcx, rdx
0x1002de7fd: jne 0x1002de7c0
0x1002de7ff: test rax, rax
0x1002de802: je 0x1002de81f
0x1002de804: mov rax, qword ptr [rdi + rdx*8 + 0x20]
0x1002de809: test rax, rax
0x1002de80c: je 0x1002de81f
0x1002de80e: mov dword ptr [rax + 0x170], 0x47c35000
0x1002de818: mov byte ptr [rax + 0xb1], 1
0x1002de81f: pop rbp
0x1002de820: ret 
0x1002de821: nop word ptr cs:[rax + rax]
