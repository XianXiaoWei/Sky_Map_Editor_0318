0x10076aae0: push rbp
0x10076aae1: mov rbp, rsp
0x10076aae4: push r15
0x10076aae6: push r14
0x10076aae8: push rbx
0x10076aae9: push rax
0x10076aaea: mov r14, rsi
0x10076aaed: mov r9, rdi
0x10076aaf0: lea rdi, [r9 + 8]
0x10076aaf4: cmp dword ptr [r9], 1
0x10076aaf8: jne 0x10076ab10
0x10076aafa: movzx r15d, byte ptr [r14]
0x10076aafe: mov edx, 1
0x10076ab03: mov esi, r15d
0x10076ab06: call 0x1007692c0
0x10076ab0b: jmp 0x10076ab9d
0x10076ab10: mov r8, qword ptr [r9 + 0x10]
0x10076ab14: test r8, r8
0x10076ab17: je 0x10076abaf
0x10076ab1d: cmp byte ptr [rdi], 0
0x10076ab20: je 0x10076ab9a
0x10076ab22: mov r10, qword ptr [r9 + 0x20]
0x10076ab26: mov eax, dword ptr [r9 + 0x18]
0x10076ab2a: add r8, rax
0x10076ab2d: xor edx, edx
0x10076ab2f: mov r11d, 1
0x10076ab35: xor r15d, r15d
0x10076ab38: nop dword ptr [rax + rax]
0x10076ab40: cmp r10, r8
0x10076ab43: jae 0x10076ab90
0x10076ab45: mov esi, dword ptr [r9 + 0x28]
0x10076ab49: mov eax, 8
0x10076ab4e: sub eax, esi
0x10076ab50: cmp eax, r11d
0x10076ab53: cmovg eax, r11d
0x10076ab57: movzx ebx, byte ptr [r10]
0x10076ab5b: mov ecx, esi
0x10076ab5d: shr ebx, cl
0x10076ab5f: mov ecx, edx
0x10076ab61: shl ebx, cl
0x10076ab63: sub r11d, eax
0x10076ab66: add esi, eax
0x10076ab68: mov dword ptr [r9 + 0x28], esi
0x10076ab6c: cmp esi, 8
0x10076ab6f: jb 0x10076ab80
0x10076ab71: mov dword ptr [r9 + 0x28], 0
0x10076ab79: inc r10
0x10076ab7c: mov qword ptr [r9 + 0x20], r10
0x10076ab80: or r15d, ebx
0x10076ab83: add edx, eax
0x10076ab85: test r11d, r11d
0x10076ab88: jg 0x10076ab40
0x10076ab8a: and r15d, 1
0x10076ab8e: jmp 0x10076ab9d
0x10076ab90: cmp byte ptr [r9 + 0x2c], 1
0x10076ab95: je 0x10076abce
0x10076ab97: mov byte ptr [rdi], 0
0x10076ab9a: xor r15d, r15d
0x10076ab9d: test r15d, r15d
0x10076aba0: setne byte ptr [r14]
0x10076aba4: add rsp, 8
0x10076aba8: pop rbx
0x10076aba9: pop r14
0x10076abab: pop r15
0x10076abad: pop rbp
0x10076abae: ret 
0x10076abaf: lea rdi, [rip + 0x433402]
0x10076abb6: lea rsi, [rip + 0x433404]
0x10076abbd: mov edx, 0x59
0x10076abc2: mov ecx, 3
0x10076abc7: call 0x1007e5f70
0x10076abcc: ud2 
0x10076abce: lea rdi, [rip + 0x4333fd]
0x10076abd5: lea rsi, [rip + 0x4333e5]
0x10076abdc: lea r8, [rip + 0x433445]
0x10076abe3: mov edx, 0x6a
0x10076abe8: mov ecx, 4
0x10076abed: xor eax, eax
0x10076abef: call 0x1007e6030
0x10076abf4: ud2 
0x10076abf6: nop word ptr cs:[rax + rax]