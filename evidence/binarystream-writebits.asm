0x1007692c0: push rbp
0x1007692c1: mov rbp, rsp
0x1007692c4: mov rax, qword ptr [rdi + 8]
0x1007692c8: test rax, rax
0x1007692cb: je 0x10076939e
0x1007692d1: cmp byte ptr [rdi], 0
0x1007692d4: je 0x100769391
0x1007692da: lea ecx, [rdx - 1]
0x1007692dd: cmp ecx, 0x20
0x1007692e0: jb 0x10076930b
0x1007692e2: cmp byte ptr [rdi + 0x24], 1
0x1007692e6: jne 0x100769399
0x1007692ec: lea rdi, [rip + 0x434cdf] ; 0x100b9dfd2 !m_assert
0x1007692f3: lea rsi, [rip + 0x434cc7] ; 0x100b9dfc1 BinaryStream.cpp
0x1007692fa: lea r8, [rip + 0x434cdb] ; 0x100b9dfdc Invalid bit write count
0x100769301: mov edx, 0x34
0x100769306: jmp 0x1007693d7 ; 0x1007693d7
0x10076930b: cmp edx, 0x1f
0x10076930e: jg 0x100769321
0x100769310: mov r8d, 1
0x100769316: mov ecx, edx
0x100769318: shl r8d, cl
0x10076931b: dec r8d
0x10076931e: and esi, r8d
0x100769321: mov r8, qword ptr [rdi + 0x18]
0x100769325: mov ecx, dword ptr [rdi + 0x10]
0x100769328: add rax, rcx
0x10076932b: cmp r8, rax
0x10076932e: jb 0x100769350
0x100769330: jmp 0x100769393 ; 0x100769393
0x100769332: nop word ptr cs:[rax + rax]
0x100769340: mov r8, qword ptr [rdi + 0x18]
0x100769344: mov eax, dword ptr [rdi + 0x10]
0x100769347: add rax, qword ptr [rdi + 8]
0x10076934b: cmp r8, rax
0x10076934e: jae 0x100769393
0x100769350: mov ecx, dword ptr [rdi + 0x20]
0x100769353: mov eax, 8
0x100769358: sub eax, ecx
0x10076935a: cmp eax, edx
0x10076935c: cmovg eax, edx
0x10076935f: mov r9d, esi
0x100769362: shl r9d, cl
0x100769365: movzx ecx, byte ptr [r8]
0x100769369: or ecx, r9d
0x10076936c: mov byte ptr [r8], cl
0x10076936f: sub edx, eax
0x100769371: mov ecx, dword ptr [rdi + 0x20]
0x100769374: add ecx, eax
0x100769376: mov dword ptr [rdi + 0x20], ecx
0x100769379: cmp ecx, 8
0x10076937c: jb 0x10076938d
0x10076937e: mov dword ptr [rdi + 0x20], 0
0x100769385: inc qword ptr [rdi + 0x18]
0x100769389: mov ecx, eax
0x10076938b: shr esi, cl
0x10076938d: test edx, edx
0x10076938f: jg 0x100769340
0x100769391: pop rbp
0x100769392: ret 
0x100769393: cmp byte ptr [rdi + 0x24], 1
0x100769397: je 0x1007693bd
0x100769399: mov byte ptr [rdi], 0
0x10076939c: pop rbp
0x10076939d: ret 
0x10076939e: lea rdi, [rip + 0x434c13] ; 0x100b9dfb8 m_buffer
0x1007693a5: lea rsi, [rip + 0x434c15] ; 0x100b9dfc1 BinaryStream.cpp
0x1007693ac: mov edx, 0x2f
0x1007693b1: mov ecx, 3
0x1007693b6: call 0x1007e5f70 ; 0x1007e5f70
0x1007693bb: ud2 
0x1007693bd: lea rdi, [rip + 0x434c0e] ; 0x100b9dfd2 !m_assert
0x1007693c4: lea rsi, [rip + 0x434bf6] ; 0x100b9dfc1 BinaryStream.cpp
0x1007693cb: lea r8, [rip + 0x434c22] ; 0x100b9dff4 Write past end of bit stream
0x1007693d2: mov edx, 0x43
0x1007693d7: mov ecx, 4
0x1007693dc: xor eax, eax
0x1007693de: call 0x1007e6030 ; 0x1007e6030
0x1007693e3: ud2 
0x1007693e5: nop word ptr cs:[rax + rax]
