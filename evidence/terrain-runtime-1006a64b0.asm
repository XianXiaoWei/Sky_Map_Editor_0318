0x1006a64b0: push rbp
0x1006a64b1: mov rbp, rsp
0x1006a64b4: push r15
0x1006a64b6: push r14
0x1006a64b8: push rbx
0x1006a64b9: sub rsp, 0x48
0x1006a64bd: mov r14, rdi
0x1006a64c0: mov rsi, qword ptr [r14 + 0x298]
0x1006a64c7: lea rdi, [rbp - 0x40]
0x1006a64cb: mov edx, 3
0x1006a64d0: call 0x1001e2ac0 ; 0x1001e2ac0
0x1006a64d5: mov rax, qword ptr [rbp - 0x40]
0x1006a64d9: test rax, rax
0x1006a64dc: je 0x1006a64e4
0x1006a64de: mov rax, qword ptr [rax + 0x10]
0x1006a64e2: jmp 0x1006a64e6 ; 0x1006a64e6
0x1006a64e4: xor eax, eax
0x1006a64e6: mov qword ptr [rbp - 0x50], rax
0x1006a64ea: call 0x1001ddff0 ; 0x1001ddff0
0x1006a64ef: mov r15, rax
0x1006a64f2: mov qword ptr [rbp - 0x48], 0
0x1006a64fa: call 0x10029fea0 ; 0x10029fea0
0x1006a64ff: mov rbx, qword ptr [rax]
0x1006a6502: lea rsi, [rbp - 0x48]
0x1006a6506: lea rdx, [rbp - 0x50]
0x1006a650a: mov rdi, rax
0x1006a650d: mov rcx, r15
0x1006a6510: call qword ptr [rbx + 0x40]
0x1006a6513: mov rax, qword ptr [rbp - 0x48]
0x1006a6517: mov rcx, qword ptr [rbp - 0x40]
0x1006a651b: test rcx, rcx
0x1006a651e: je 0x1006a6561
0x1006a6520: mov rdx, qword ptr [rbp - 0x38]
0x1006a6524: mov rsi, qword ptr [rbp - 0x30]
0x1006a6528: test rsi, rsi
0x1006a652b: lea rsi, [rsi + 8]
0x1006a652f: cmove rsi, rcx
0x1006a6533: mov qword ptr [rsi], rdx
0x1006a6536: mov rdx, qword ptr [rbp - 0x38]
0x1006a653a: mov rsi, qword ptr [rbp - 0x30]
0x1006a653e: add rcx, 8
0x1006a6542: test rdx, rdx
0x1006a6545: lea rdx, [rdx + 0x10]
0x1006a6549: cmove rdx, rcx
0x1006a654d: mov qword ptr [rdx], rsi
0x1006a6550: vxorps xmm0, xmm0, xmm0
0x1006a6554: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1006a6559: mov qword ptr [rbp - 0x30], 0
0x1006a6561: test rax, rax
0x1006a6564: je 0x1006a6583
0x1006a6566: vmovaps xmm0, xmmword ptr [rax + 0x190]
0x1006a656e: mov rdi, qword ptr [r14 + 0x328]
0x1006a6575: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1006a657a: lea rsi, [rbp - 0x60]
0x1006a657e: call 0x1006a65e0 ; 0x1006a65e0
0x1006a6583: add rsp, 0x48
0x1006a6587: pop rbx
0x1006a6588: pop r14
0x1006a658a: pop r15
0x1006a658c: pop rbp
0x1006a658d: ret 
0x1006a658e: mov rcx, qword ptr [rbp - 0x40]
0x1006a6592: test rcx, rcx
0x1006a6595: je 0x1006a65d8
0x1006a6597: mov rdx, qword ptr [rbp - 0x38]
0x1006a659b: mov rsi, qword ptr [rbp - 0x30]
0x1006a659f: test rsi, rsi
0x1006a65a2: lea rsi, [rsi + 8]
0x1006a65a6: cmove rsi, rcx
0x1006a65aa: mov qword ptr [rsi], rdx
0x1006a65ad: mov rdx, qword ptr [rbp - 0x38]
0x1006a65b1: mov rsi, qword ptr [rbp - 0x30]
0x1006a65b5: add rcx, 8
0x1006a65b9: test rdx, rdx
0x1006a65bc: lea rdx, [rdx + 0x10]
0x1006a65c0: cmove rdx, rcx
0x1006a65c4: mov qword ptr [rdx], rsi
0x1006a65c7: vxorps xmm0, xmm0, xmm0
0x1006a65cb: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1006a65d0: mov qword ptr [rbp - 0x30], 0
0x1006a65d8: mov rdi, rax
0x1006a65db: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
