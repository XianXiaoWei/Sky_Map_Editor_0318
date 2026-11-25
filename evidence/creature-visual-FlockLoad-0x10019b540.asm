0x10019b540: push rbp
0x10019b541: mov rbp, rsp
0x10019b544: push rbx
0x10019b545: and rsp, 0xffffffffffffffe0
0x10019b549: sub rsp, 0x60
0x10019b54d: mov rbx, rdi
0x10019b550: mov rax, qword ptr [rip + 0xa72381] ; 0x100c0d8d8
0x10019b557: mov rax, qword ptr [rax]
0x10019b55a: mov qword ptr [rsp + 0x40], rax
0x10019b55f: vmovaps ymm0, ymmword ptr [rip + 0x912299] ; 0x100aad800
0x10019b567: vmovaps ymmword ptr [rsp], ymm0
0x10019b56c: mov rax, qword ptr [rip + 0x9122bd] ; 0x100aad830
0x10019b573: mov qword ptr [rsp + 0x30], rax
0x10019b578: vmovaps xmm0, xmmword ptr [rip + 0x9122a0] ; 0x100aad820
0x10019b580: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10019b586: sub rsp, 8
0x10019b58a: lea rsi, [rip + 0x9dc051] ; 0x100b775e2 BirdFlock
0x10019b591: lea rax, [rsp + 8]
0x10019b596: lea r9, [rsp + 0x28]
0x10019b59b: mov edx, 5
0x10019b5a0: mov r8d, 8
0x10019b5a6: mov rdi, rcx
0x10019b5a9: mov rcx, rax
0x10019b5ac: push 1
0x10019b5ae: push 0x2800
0x10019b5b3: push 0xc
0x10019b5b5: vzeroupper 
0x10019b5b8: call 0x10019dd60 ; 0x10019dd60
0x10019b5bd: add rsp, 0x20
0x10019b5c1: mov qword ptr [rbx + 0x80068], rax
0x10019b5c8: mov rax, qword ptr [rip + 0xa72309] ; 0x100c0d8d8
0x10019b5cf: mov rax, qword ptr [rax]
0x10019b5d2: cmp rax, qword ptr [rsp + 0x40]
0x10019b5d7: jne 0x10019b5e0
0x10019b5d9: lea rsp, [rbp - 8]
0x10019b5dd: pop rbx
0x10019b5de: pop rbp
0x10019b5df: ret 
0x10019b5e0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10019b5e5: nop word ptr cs:[rax + rax]
