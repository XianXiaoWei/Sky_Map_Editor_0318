0x1004844b0: push rbp
0x1004844b1: mov rbp, rsp
0x1004844b4: push r15
0x1004844b6: push r14
0x1004844b8: push rbx
0x1004844b9: push rax
0x1004844ba: mov r15, rdx
0x1004844bd: mov r14, rsi
0x1004844c0: mov rbx, rdi
0x1004844c3: mov rax, qword ptr [rbx + 0x40]
0x1004844c7: test rax, rax
0x1004844ca: je 0x10048456d
0x1004844d0: mov eax, dword ptr [rax + 0x10]
0x1004844d3: shl rax, 5
0x1004844d7: lea rsi, [rax + rax*2]
0x1004844db: mov rdx, qword ptr [rip + 0x1b84e6e] ; 0x102009350
0x1004844e2: mov ecx, 0x10
0x1004844e7: mov rdi, r15
0x1004844ea: call 0x100795530 ; 0x100795530
0x1004844ef: mov qword ptr [rbx + 0xb0], rax
0x1004844f6: mov rax, qword ptr [rbx + 0x40]
0x1004844fa: mov esi, dword ptr [rax + 0x10]
0x1004844fd: shl rsi, 5
0x100484501: mov rdx, qword ptr [rip + 0x1b84e48] ; 0x102009350
0x100484508: mov ecx, 0x10
0x10048450d: mov rdi, r15
0x100484510: call 0x100795530 ; 0x100795530
0x100484515: mov qword ptr [rbx + 0xc0], rax
0x10048451c: cmp byte ptr [rbx + 0xa0], 0
0x100484523: je 0x100484551
0x100484525: cmp byte ptr [rbx + 0xc], 0
0x100484529: je 0x10048458c
0x10048452b: mov rdi, qword ptr [r14 + 0x5d0]
0x100484532: call 0x100410c90 ; 0x100410c90
0x100484537: movzx ecx, byte ptr [rax + 0x168]
0x10048453e: cmp ecx, 0x10
0x100484541: jae 0x1004845b4
0x100484543: mov dword ptr [rbx + 0xf0], ecx
0x100484549: inc cl
0x10048454b: mov byte ptr [rax + 0x168], cl
0x100484551: mov byte ptr [rbx + 0xd8], 0
0x100484558: mov dword ptr [rbx + 0xdc], 0
0x100484562: add rsp, 8
0x100484566: pop rbx
0x100484567: pop r14
0x100484569: pop r15
0x10048456b: pop rbp
0x10048456c: ret 
0x10048456d: mov qword ptr [rbx + 0xb0], 0
0x100484578: xor eax, eax
0x10048457a: mov qword ptr [rbx + 0xc0], rax
0x100484581: cmp byte ptr [rbx + 0xa0], 0
0x100484588: jne 0x100484525
0x10048458a: jmp 0x100484551 ; 0x100484551
0x10048458c: lea rdi, [rip + 0x6fcafb] ; 0x100b8108e autoStart
0x100484593: lea rsi, [rip + 0x7061ec] ; 0x100b8a786 MoveObjectAlongRail.cpp
0x10048459a: lea r8, [rip + 0x7061fd] ; 0x100b8a79e Networked MoveObjectAlongRails must be marked autoStart
0x1004845a1: mov edx, 0xa5
0x1004845a6: mov ecx, 4
0x1004845ab: xor eax, eax
0x1004845ad: call 0x1007e6030 ; 0x1007e6030
0x1004845b2: ud2 
0x1004845b4: lea rdi, [rip + 0x70621b] ; 0x100b8a7d6 state.moveCount < LevelState::kMaxMoveObjects
0x1004845bb: lea rsi, [rip + 0x7061c4] ; 0x100b8a786 MoveObjectAlongRail.cpp
0x1004845c2: lea r8, [rip + 0x70623b] ; 0x100b8a804 Ran out of MoveObjectAlongRails! Max %u
0x1004845c9: mov edx, 0xa9
0x1004845ce: mov ecx, 4
0x1004845d3: mov r9d, 0x10
0x1004845d9: xor eax, eax
0x1004845db: call 0x1007e6030 ; 0x1007e6030
0x1004845e0: ud2 
0x1004845e2: nop word ptr cs:[rax + rax]
