0x10076ad40: push rbp
0x10076ad41: mov rbp, rsp
0x10076ad44: push r15
0x10076ad46: push r14
0x10076ad48: push r13
0x10076ad4a: push r12
0x10076ad4c: push rbx
0x10076ad4d: push rax
0x10076ad4e: mov r14d, ecx
0x10076ad51: mov r15d, edx
0x10076ad54: mov r13, rsi
0x10076ad57: mov r12, rdi
0x10076ad5a: cmp r14d, r15d
0x10076ad5d: jbe 0x10076adf3
0x10076ad63: mov ebx, dword ptr [r13]
0x10076ad67: mov edx, r14d
0x10076ad6a: xor eax, eax
0x10076ad6c: sub edx, r15d
0x10076ad6f: je 0x10076ad86
0x10076ad71: nop word ptr cs:[rax + rax]
0x10076ad80: inc eax
0x10076ad82: shr edx, 1
0x10076ad84: jne 0x10076ad80
0x10076ad86: lea rdi, [r12 + 8]
0x10076ad8b: cmp dword ptr [r12], 1
0x10076ad90: mov qword ptr [rbp - 0x30], rdi
0x10076ad94: jne 0x10076adb9
0x10076ad96: sub ebx, r15d
0x10076ad99: mov esi, ebx
0x10076ad9b: mov edx, eax
0x10076ad9d: call 0x1007692c0 ; 0x1007692c0
0x10076ada2: cmp dword ptr [r12], 0
0x10076ada7: je 0x10076adc9
0x10076ada9: mov ebx, dword ptr [r13]
0x10076adad: cmp ebx, r15d
0x10076adb0: jb 0x10076add5
0x10076adb2: cmp ebx, r14d
0x10076adb5: jbe 0x10076ade4
0x10076adb7: jmp 0x10076add5 ; 0x10076add5
0x10076adb9: mov esi, eax
0x10076adbb: call 0x1007693f0 ; 0x1007693f0
0x10076adc0: mov ebx, eax
0x10076adc2: cmp dword ptr [r12], 0
0x10076adc7: jne 0x10076ada9
0x10076adc9: add ebx, r15d
0x10076adcc: mov dword ptr [r13], ebx
0x10076add0: cmp ebx, r15d
0x10076add3: jae 0x10076adb2
0x10076add5: cmp byte ptr [r12 + 0x30], 1
0x10076addb: je 0x10076ae12
0x10076addd: mov rax, qword ptr [rbp - 0x30]
0x10076ade1: mov byte ptr [rax], 0
0x10076ade4: add rsp, 8
0x10076ade8: pop rbx
0x10076ade9: pop r12
0x10076adeb: pop r13
0x10076aded: pop r14
0x10076adef: pop r15
0x10076adf1: pop rbp
0x10076adf2: ret 
0x10076adf3: lea rdi, [rip + 0x433325] ; 0x100b9e11f min < max && max > 0
0x10076adfa: lea rsi, [rip + 0x4331c0] ; 0x100b9dfc1 BinaryStream.cpp
0x10076ae01: mov edx, 0x1e8
0x10076ae06: mov ecx, 3
0x10076ae0b: call 0x1007e5f70 ; 0x1007e5f70
0x10076ae10: ud2 
0x10076ae12: lea rdi, [rip + 0x4331b9] ; 0x100b9dfd2 !m_assert
0x10076ae19: lea rsi, [rip + 0x4331a1] ; 0x100b9dfc1 BinaryStream.cpp
0x10076ae20: lea r8, [rip + 0x43330d] ; 0x100b9e134 val out of range: %i in [%i, %i]
0x10076ae27: mov edx, 0x1f1
0x10076ae2c: mov ecx, 4
0x10076ae31: xor eax, eax
0x10076ae33: mov r9d, ebx
0x10076ae36: push r14
0x10076ae38: push r15
0x10076ae3a: call 0x1007e6030 ; 0x1007e6030
0x10076ae3f: add rsp, 0x10
0x10076ae43: ud2 
0x10076ae45: nop word ptr cs:[rax + rax]
