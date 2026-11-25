0x1000e62a0: push rbp
0x1000e62a1: mov rbp, rsp
0x1000e62a4: push r15
0x1000e62a6: push r14
0x1000e62a8: push r13
0x1000e62aa: push r12
0x1000e62ac: push rbx
0x1000e62ad: sub rsp, 0x38
0x1000e62b1: mov rbx, rdi
0x1000e62b4: cmp byte ptr [rbx + 0xd8], 0
0x1000e62bb: je 0x1000e62cc
0x1000e62bd: add rsp, 0x38
0x1000e62c1: pop rbx
0x1000e62c2: pop r12
0x1000e62c4: pop r13
0x1000e62c6: pop r14
0x1000e62c8: pop r15
0x1000e62ca: pop rbp
0x1000e62cb: ret 
0x1000e62cc: call 0x10009fcd0 ; 0x10009fcd0
0x1000e62d1: test rax, rax
0x1000e62d4: je 0x1000e62bd
0x1000e62d6: call 0x10009fcd0 ; 0x10009fcd0
0x1000e62db: xor edx, edx
0x1000e62dd: mov rdi, rax
0x1000e62e0: mov rsi, rbx
0x1000e62e3: call 0x1000dd230 ; 0x1000dd230
0x1000e62e8: mov r14, rax
0x1000e62eb: test r14, r14
0x1000e62ee: je 0x1000e62bd
0x1000e62f0: cmp dword ptr [r14 + 0x20], 0
0x1000e62f5: mov rdx, rbx
0x1000e62f8: jle 0x1000e6488
0x1000e62fe: mov qword ptr [rbp - 0x30], rdx
0x1000e6302: xor r15d, r15d
0x1000e6305: xor ebx, ebx
0x1000e6307: xor r13d, r13d
0x1000e630a: nop word ptr [rax + rax]
0x1000e6310: call 0x10009fcd0 ; 0x10009fcd0
0x1000e6315: mov rdi, rax
0x1000e6318: mov rsi, r14
0x1000e631b: mov edx, ebx
0x1000e631d: call 0x1000dd350 ; 0x1000dd350
0x1000e6322: cmp byte ptr [rax + 0x40], 0
0x1000e6326: mov r12b, 1
0x1000e6329: je 0x1000e632e
0x1000e632b: mov r15b, 1
0x1000e632e: cmp dword ptr [rax + 0x30], 2
0x1000e6332: je 0x1000e6337
0x1000e6334: mov r12d, r13d
0x1000e6337: inc ebx
0x1000e6339: mov r13b, r12b
0x1000e633c: cmp ebx, dword ptr [r14 + 0x20]
0x1000e6340: jl 0x1000e6310
0x1000e6342: test r15b, 1
0x1000e6346: mov rdx, qword ptr [rbp - 0x30]
0x1000e634a: je 0x1000e6488
0x1000e6350: mov rax, qword ptr [rbp - 0x30]
0x1000e6354: mov rsi, qword ptr [rax + 0xd0]
0x1000e635b: mov rdi, qword ptr [rbp - 0x30]
0x1000e635f: call 0x1000e6a40 ; 0x1000e6a40
0x1000e6364: mov rax, qword ptr [rbp - 0x30]
0x1000e6368: mov rdi, qword ptr [rax + 0xd0]
0x1000e636f: mov rax, qword ptr [rbp - 0x30]
0x1000e6373: movsxd rax, dword ptr [rax + 0x54]
0x1000e6377: shl rax, 4
0x1000e637b: lea rsi, [rax + rax*2]
0x1000e637f: mov rdx, qword ptr [rip + 0x1cec7e2] ; 0x101dd2b68
0x1000e6386: mov ecx, 0x10
0x1000e638b: call 0x100795530 ; 0x100795530
0x1000e6390: mov rdx, qword ptr [rbp - 0x30]
0x1000e6394: mov qword ptr [rdx + 0x90], rax
0x1000e639b: cmp dword ptr [rdx + 0x54], 0
0x1000e639f: jle 0x1000e6488
0x1000e63a5: mov r13d, 0x20
0x1000e63ab: xor r15d, r15d
0x1000e63ae: and r12b, 1
0x1000e63b2: movzx eax, r12b
0x1000e63b6: mov dword ptr [rbp - 0x34], eax
0x1000e63b9: xor ebx, ebx
0x1000e63bb: nop dword ptr [rax + rax]
0x1000e63c0: mov r12, qword ptr [rdx + 0x88]
0x1000e63c7: mov rax, qword ptr [rdx + 0xe0]
0x1000e63ce: mov eax, dword ptr [rax + r15 + 0x80]
0x1000e63d6: lea r14, [rax + rax*2]
0x1000e63da: shl r14, 4
0x1000e63de: vmovaps xmm0, xmmword ptr [r12 + r14]
0x1000e63e4: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1000e63e9: lea rdx, [r12 + r14 + 0x10]
0x1000e63ee: lea rdi, [rbp - 0x60]
0x1000e63f2: mov rsi, qword ptr [rbp - 0x30]
0x1000e63f6: mov ecx, ebx
0x1000e63f8: mov r8d, dword ptr [rbp - 0x34]
0x1000e63fc: call 0x1000e5ac0 ; 0x1000e5ac0
0x1000e6401: mov rdx, qword ptr [rbp - 0x30]
0x1000e6405: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1000e640a: mov rax, qword ptr [rdx + 0x90]
0x1000e6411: mov rcx, qword ptr [rdx + 0xe0]
0x1000e6418: vmovaps xmm1, xmmword ptr [r12 + r14 + 0x20]
0x1000e641f: vpermilps xmm2, xmm1, 0
0x1000e6425: vmulps xmm2, xmm2, xmmword ptr [rcx + r15]
0x1000e642b: vpermilps xmm3, xmm1, 0x55
0x1000e6431: vmulps xmm3, xmm3, xmmword ptr [rcx + r15 + 0x10]
0x1000e6438: vaddps xmm2, xmm2, xmm3
0x1000e643c: vpermilps xmm1, xmm1, 0xaa
0x1000e6442: vmulps xmm1, xmm1, xmmword ptr [rcx + r15 + 0x20]
0x1000e6449: vaddps xmm1, xmm2, xmm1
0x1000e644d: vaddps xmm1, xmm1, xmmword ptr [rcx + r15 + 0x30]
0x1000e6454: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x1000e6459: vmovaps xmmword ptr [rax + r13 - 0x20], xmm2
0x1000e6460: vmovaps xmmword ptr [rax + r13 - 0x10], xmm0
0x1000e6467: vmovaps xmmword ptr [rax + r13], xmm1
0x1000e646d: inc rbx
0x1000e6470: movsxd rax, dword ptr [rdx + 0x54]
0x1000e6474: add r13, 0x30
0x1000e6478: add r15, 0x90
0x1000e647f: cmp rbx, rax
0x1000e6482: jl 0x1000e63c0
0x1000e6488: mov byte ptr [rdx + 0xd8], 1
0x1000e648f: jmp 0x1000e62bd ; 0x1000e62bd
0x1000e6494: nop word ptr cs:[rax + rax]
