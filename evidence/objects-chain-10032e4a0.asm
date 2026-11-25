0x10032e4a0: push rbp
0x10032e4a1: mov rbp, rsp
0x10032e4a4: push r14
0x10032e4a6: push rbx
0x10032e4a7: mov rbx, rdi
0x10032e4aa: lea r14, [rbx + 0x30]
0x10032e4ae: mov esi, 0x5000
0x10032e4b3: mov rdi, r14
0x10032e4b6: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10032e4bb: xor eax, eax
0x10032e4bd: jmp 0x10032e4ce ; 0x10032e4ce
0x10032e4bf: nop 
0x10032e4c0: lea rcx, [rbx + rax + 0x70]
0x10032e4c5: mov qword ptr [rbx + rax + 0x68], rcx
0x10032e4ca: add rax, 0x40
0x10032e4ce: lea rcx, [rbx + rax + 0x40]
0x10032e4d3: mov qword ptr [rbx + rax + 0x38], rcx
0x10032e4d8: lea rcx, [rbx + rax + 0x50]
0x10032e4dd: mov qword ptr [rbx + rax + 0x48], rcx
0x10032e4e2: lea rcx, [rbx + rax + 0x60]
0x10032e4e7: mov qword ptr [rbx + rax + 0x58], rcx
0x10032e4ec: cmp rax, 0x4fc0
0x10032e4f2: jne 0x10032e4c0
0x10032e4f4: mov qword ptr [rbx + 0x5028], 0
0x10032e4ff: mov qword ptr [rbx + 0x5030], r14
0x10032e506: mov word ptr [rbx + 0xc], 0
0x10032e50c: lea rdi, [rbx + 0x18]
0x10032e510: lea r14, [rbx + 0x20]
0x10032e514: mov rsi, qword ptr [rbx + 0x20]
0x10032e518: call 0x10032fa30 ; 0x10032fa30
0x10032e51d: mov qword ptr [rbx + 0x18], r14
0x10032e521: vxorps xmm0, xmm0, xmm0
0x10032e525: vmovups xmmword ptr [rbx + 0x20], xmm0
0x10032e52a: mov byte ptr [rbx + 0x5038], 0
0x10032e531: pop rbx
0x10032e532: pop r14
0x10032e534: pop rbp
0x10032e535: ret 
0x10032e536: nop word ptr cs:[rax + rax]
