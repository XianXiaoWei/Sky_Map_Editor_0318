0x1005313d0: push rbp
0x1005313d1: mov rbp, rsp
0x1005313d4: push r15
0x1005313d6: push r14
0x1005313d8: push r13
0x1005313da: push r12
0x1005313dc: push rbx
0x1005313dd: sub rsp, 0x38
0x1005313e1: mov r13, rdi
0x1005313e4: mov rax, qword ptr [r13 + 0x38]
0x1005313e8: cmp dword ptr [rax + 0x10], 0
0x1005313ec: je 0x100531601
0x1005313f2: lea rcx, [r13 + 0x40]
0x1005313f6: mov qword ptr [rbp - 0x58], rcx
0x1005313fa: lea rcx, [r13 + 0x58]
0x1005313fe: mov qword ptr [rbp - 0x50], rcx
0x100531402: lea rcx, [r13 + 0x59]
0x100531406: mov qword ptr [rbp - 0x40], rcx
0x10053140a: lea rcx, [r13 + 0x41]
0x10053140e: mov qword ptr [rbp - 0x48], rcx
0x100531412: xor r14d, r14d
0x100531415: nop word ptr cs:[rax + rax]
0x100531420: mov rax, qword ptr [rax + 8]
0x100531424: mov r15d, r14d
0x100531427: mov rax, qword ptr [rax + r15*8]
0x10053142b: mov qword ptr [rbp - 0x60], rax
0x10053142f: call 0x1007abc10 ; 0x1007abc10
0x100531434: mov r12, rax
0x100531437: mov qword ptr [rbp - 0x38], 0
0x10053143f: call 0x1003ffcf0 ; 0x1003ffcf0
0x100531444: mov rbx, qword ptr [rax]
0x100531447: mov rdi, rax
0x10053144a: lea rsi, [rbp - 0x38]
0x10053144e: lea rdx, [rbp - 0x60]
0x100531452: mov rcx, r12
0x100531455: call qword ptr [rbx + 0x40]
0x100531458: mov rbx, qword ptr [rbp - 0x38]
0x10053145c: test rbx, rbx
0x10053145f: je 0x100531620
0x100531465: mov r12, qword ptr [rbx + 0x228]
0x10053146c: vcvtsi2ss xmm0, xmm2, r15
0x100531471: mov rcx, qword ptr [r13 + 0x38]
0x100531475: mov rax, qword ptr [r13 + 0x78]
0x100531479: mov ecx, dword ptr [rcx + 0x10]
0x10053147c: vcvtsi2ss xmm1, xmm2, rcx
0x100531481: vdivss xmm0, xmm0, xmm1
0x100531485: vaddss xmm0, xmm0, dword ptr [rip + 0x573c33] ; 0x100aa50c0
0x10053148d: test rax, rax
0x100531490: je 0x1005314f0
0x100531492: vmovss xmm1, dword ptr [rax + 0x10]
0x100531497: vmulss xmm1, xmm1, dword ptr [r13 + 0x74]
0x10053149d: vmulss xmm0, xmm0, xmm1
0x1005314a1: cmp byte ptr [r13 + 0x81], 0
0x1005314a9: je 0x100531504
0x1005314ab: mov r12, qword ptr [r12 + 0x68]
0x1005314b0: test r12, r12
0x1005314b3: je 0x10053163f
0x1005314b9: cmp byte ptr [r13 + 0x70], 0
0x1005314be: je 0x100531550
0x1005314c4: vmovss dword ptr [rbp - 0x2c], xmm0
0x1005314c9: mov rdi, r12
0x1005314cc: call 0x100096120 ; 0x100096120
0x1005314d1: cmp byte ptr [r13 + 0x80], 0
0x1005314d9: je 0x1005315f0
0x1005314df: mov rdi, r12
0x1005314e2: jmp 0x10053153d ; 0x10053153d
0x1005314e4: nop word ptr cs:[rax + rax]
0x1005314f0: vmovss xmm1, dword ptr [r13 + 0x74]
0x1005314f6: vmulss xmm0, xmm0, xmm1
0x1005314fa: cmp byte ptr [r13 + 0x81], 0
0x100531502: jne 0x1005314ab
0x100531504: vmovss dword ptr [rbp - 0x2c], xmm0
0x100531509: cmp byte ptr [r13 + 0x80], 0
0x100531511: je 0x1005315f0
0x100531517: mov rdi, qword ptr [r12 + 0x68]
0x10053151c: mov esi, 1
0x100531521: call 0x10009d520 ; 0x10009d520
0x100531526: test eax, eax
0x100531528: jns 0x100531538
0x10053152a: mov eax, dword ptr [rbx + 0xa34]
0x100531530: test eax, eax
0x100531532: js 0x1005315f0
0x100531538: mov rdi, qword ptr [r12 + 0x68]
0x10053153d: mov esi, eax
0x10053153f: vmovss xmm0, dword ptr [rbp - 0x2c]
0x100531544: call 0x100097c80 ; 0x100097c80
0x100531549: jmp 0x1005315f0 ; 0x1005315f0
0x10053154e: nop 
0x100531550: mov rax, qword ptr [rbp - 0x58]
0x100531554: movzx eax, byte ptr [rax]
0x100531557: test al, 1
0x100531559: jne 0x100531563
0x10053155b: mov rdx, rax
0x10053155e: shr rdx, 1
0x100531561: jmp 0x100531567 ; 0x100531567
0x100531563: mov rdx, qword ptr [r13 + 0x48]
0x100531567: mov rcx, qword ptr [rbp - 0x50]
0x10053156b: movzx ecx, byte ptr [rcx]
0x10053156e: test rdx, rdx
0x100531571: je 0x100531585
0x100531573: test cl, 1
0x100531576: jne 0x1005315a4
0x100531578: shr rcx, 1
0x10053157b: test rcx, rcx
0x10053157e: je 0x1005315b1
0x100531580: jmp 0x10053165e ; 0x10053165e
0x100531585: mov rsi, qword ptr [rbp - 0x40]
0x100531589: test cl, 1
0x10053158c: je 0x100531592
0x10053158e: mov rsi, qword ptr [r13 + 0x68]
0x100531592: mov rdi, r12
0x100531595: vmovss xmm0, dword ptr [rip + 0x573b23] ; 0x100aa50c0
0x10053159d: call 0x1000959b0 ; 0x1000959b0
0x1005315a2: jmp 0x1005315f0 ; 0x1005315f0
0x1005315a4: mov rcx, qword ptr [r13 + 0x60]
0x1005315a8: test rcx, rcx
0x1005315ab: jne 0x10053165e
0x1005315b1: mov rsi, qword ptr [rbp - 0x48]
0x1005315b5: test al, 1
0x1005315b7: je 0x1005315bd
0x1005315b9: mov rsi, qword ptr [r13 + 0x50]
0x1005315bd: cmp byte ptr [r13 + 0x80], 0
0x1005315c5: vmovss xmm1, dword ptr [rip + 0x573af3] ; 0x100aa50c0
0x1005315cd: je 0x1005315d3
0x1005315cf: vmovaps xmm1, xmm0
0x1005315d3: xor edx, edx
0x1005315d5: mov rdi, r12
0x1005315d8: vmovss xmm0, dword ptr [rip + 0x573ae0] ; 0x100aa50c0
0x1005315e0: call 0x1000967b0 ; 0x1000967b0
0x1005315e5: nop word ptr cs:[rax + rax]
0x1005315f0: inc r14d
0x1005315f3: mov rax, qword ptr [r13 + 0x38]
0x1005315f7: cmp r14d, dword ptr [rax + 0x10]
0x1005315fb: jb 0x100531420
0x100531601: mov byte ptr [r13 + 0x82], 1
0x100531609: mov rdi, r13
0x10053160c: call 0x10032ef60 ; 0x10032ef60
0x100531611: add rsp, 0x38
0x100531615: pop rbx
0x100531616: pop r12
0x100531618: pop r13
0x10053161a: pop r14
0x10053161c: pop r15
0x10053161e: pop rbp
0x10053161f: ret 
0x100531620: lea rdi, [rip + 0x6304d1] ; 0x100b61af8 ret
0x100531627: lea rsi, [rip + 0x630335] ; 0x100b61963 ./Clump.h
0x10053162e: mov edx, 0x47
0x100531633: mov ecx, 3
0x100531638: call 0x1007e5f70 ; 0x1007e5f70
0x10053163d: ud2 
0x10053163f: lea rdi, [rip + 0x65eccb] ; 0x100b90311 animInst != nullptr
0x100531646: lea rsi, [rip + 0x65ecb2] ; 0x100b902ff PlayAnimation.cpp
0x10053164d: mov edx, 0x32
0x100531652: mov ecx, 3
0x100531657: call 0x1007e5f70 ; 0x1007e5f70
0x10053165c: ud2 
0x10053165e: lea rdi, [rip + 0x65ecc0] ; 0x100b90325 animName.empty()
0x100531665: lea rsi, [rip + 0x65ec93] ; 0x100b902ff PlayAnimation.cpp
0x10053166c: mov edx, 0x3b
0x100531671: mov ecx, 3
0x100531676: call 0x1007e5f70 ; 0x1007e5f70
0x10053167b: ud2 
0x10053167d: nop dword ptr [rax]
