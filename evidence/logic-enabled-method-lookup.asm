0x1004d2330: push rbp
0x1004d2331: mov rbp, rsp
0x1004d2334: push r15
0x1004d2336: push r14
0x1004d2338: push r13
0x1004d233a: push r12
0x1004d233c: push rbx
0x1004d233d: push rax
0x1004d233e: mov r12, rsi
0x1004d2341: mov r14, rdi
0x1004d2344: test dl, dl
0x1004d2346: je 0x1004d23b9
0x1004d2348: mov rdi, qword ptr [r14 + 0x50]
0x1004d234c: mov rsi, r12
0x1004d234f: call 0x1004d2d70 ; 0x1004d2d70
0x1004d2354: mov r15, rax
0x1004d2357: test r15, r15
0x1004d235a: jne 0x1004d2424
0x1004d2360: xor r15d, r15d
0x1004d2363: nop word ptr cs:[rax + rax]
0x1004d2370: mov rcx, qword ptr [r14 + 0x30]
0x1004d2374: test rcx, rcx
0x1004d2377: je 0x1004d2424
0x1004d237d: call rcx
0x1004d237f: mov rcx, qword ptr [r14 + 0x30]
0x1004d2383: test rcx, rcx
0x1004d2386: je 0x1004d2390
0x1004d2388: call rcx
0x1004d238a: mov r14, rax
0x1004d238d: jmp 0x1004d2393 ; 0x1004d2393
0x1004d238f: nop 
0x1004d2390: xor r14d, r14d
0x1004d2393: mov rdi, qword ptr [r14 + 0x50]
0x1004d2397: mov rsi, r12
0x1004d239a: call 0x1004d2d70 ; 0x1004d2d70
0x1004d239f: test rax, rax
0x1004d23a2: je 0x1004d2370
0x1004d23a4: mov r15, rax
0x1004d23a7: jmp 0x1004d2424 ; 0x1004d2424
0x1004d23a9: nop dword ptr [rax]
0x1004d23b0: call rcx
0x1004d23b2: call qword ptr [r14 + 0x30]
0x1004d23b6: mov r14, rax
0x1004d23b9: mov r15, qword ptr [r14 + 0x50]
0x1004d23bd: mov rbx, qword ptr [r15 + 8]
0x1004d23c1: add r15, 8
0x1004d23c5: test rbx, rbx
0x1004d23c8: je 0x1004d2407
0x1004d23ca: mov r13, r15
0x1004d23cd: nop dword ptr [rax]
0x1004d23d0: mov rdi, qword ptr [rbx + 0x20]
0x1004d23d4: mov rsi, r12
0x1004d23d7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d23dc: lea rcx, [rbx + 8]
0x1004d23e0: test eax, eax
0x1004d23e2: cmovns rcx, rbx
0x1004d23e6: cmovns r13, rbx
0x1004d23ea: mov rbx, qword ptr [rcx]
0x1004d23ed: test rbx, rbx
0x1004d23f0: jne 0x1004d23d0
0x1004d23f2: cmp r13, r15
0x1004d23f5: je 0x1004d2407
0x1004d23f7: mov rsi, qword ptr [r13 + 0x20]
0x1004d23fb: mov rdi, r12
0x1004d23fe: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d2403: test eax, eax
0x1004d2405: jns 0x1004d240a
0x1004d2407: mov r13, r15
0x1004d240a: cmp r15, r13
0x1004d240d: je 0x1004d2418
0x1004d240f: mov r15, qword ptr [r13 + 0x28]
0x1004d2413: test r15, r15
0x1004d2416: jne 0x1004d2424
0x1004d2418: mov rcx, qword ptr [r14 + 0x30]
0x1004d241c: test rcx, rcx
0x1004d241f: jne 0x1004d23b0
0x1004d2421: xor r15d, r15d
0x1004d2424: mov rax, r15
0x1004d2427: add rsp, 8
0x1004d242b: pop rbx
0x1004d242c: pop r12
0x1004d242e: pop r13
0x1004d2430: pop r14
0x1004d2432: pop r15
0x1004d2434: pop rbp
0x1004d2435: ret 
0x1004d2436: nop word ptr cs:[rax + rax]
