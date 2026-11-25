0x100264fd0: push rbp
0x100264fd1: mov rbp, rsp
0x100264fd4: push r15
0x100264fd6: push r14
0x100264fd8: push r13
0x100264fda: push r12
0x100264fdc: push rbx
0x100264fdd: sub rsp, 0x28
0x100264fe1: mov qword ptr [rbp - 0x30], rdi
0x100264fe5: mov eax, dword ptr [rdi + 0x48]
0x100264fe8: test eax, eax
0x100264fea: je 0x1002650e4
0x100264ff0: xor esi, esi
0x100264ff2: lea r12, [rbp - 0x38]
0x100264ff6: lea r14, [rbp - 0x48]
0x100264ffa: nop word ptr [rax + rax]
0x100265000: mov rcx, qword ptr [rbp - 0x30]
0x100265004: mov rcx, qword ptr [rcx + 0x40]
0x100265008: test rcx, rcx
0x10026500b: je 0x10026511b
0x100265011: mov edx, esi
0x100265013: mov rcx, qword ptr [rcx + rdx*8]
0x100265017: mov qword ptr [rbp - 0x50], rcx
0x10026501b: test rcx, rcx
0x10026501e: je 0x10026513a
0x100265024: mov rcx, qword ptr [rbp - 0x30]
0x100265028: mov rcx, qword ptr [rcx + 0x58]
0x10026502c: cmp dword ptr [rcx + 0x10], 0
0x100265030: je 0x1002650da
0x100265036: mov dword ptr [rbp - 0x3c], esi
0x100265039: xor r15d, r15d
0x10026503c: nop dword ptr [rax]
0x100265040: mov rax, qword ptr [rcx + 8]
0x100265044: mov ecx, r15d
0x100265047: mov rax, qword ptr [rax + rcx*8]
0x10026504b: mov qword ptr [rbp - 0x48], rax
0x10026504f: call 0x1007abc10 ; 0x1007abc10
0x100265054: mov r13, rax
0x100265057: mov qword ptr [rbp - 0x38], 0
0x10026505f: call 0x100268810 ; 0x100268810
0x100265064: mov rbx, qword ptr [rax]
0x100265067: mov rdi, rax
0x10026506a: mov rsi, r12
0x10026506d: mov rdx, r14
0x100265070: mov rcx, r13
0x100265073: call qword ptr [rbx + 0x40]
0x100265076: mov rbx, qword ptr [rbp - 0x38]
0x10026507a: test rbx, rbx
0x10026507d: je 0x1002650fc
0x10026507f: mov rax, qword ptr [rbp - 0x50]
0x100265083: mov qword ptr [rbp - 0x48], rax
0x100265087: call 0x100262d70 ; 0x100262d70
0x10026508c: mov r13, rax
0x10026508f: mov qword ptr [rbp - 0x38], 0
0x100265097: call 0x1007abc10 ; 0x1007abc10
0x10026509c: mov r8, qword ptr [rax]
0x10026509f: mov rdi, rax
0x1002650a2: mov rsi, r12
0x1002650a5: mov rdx, r14
0x1002650a8: mov rcx, r13
0x1002650ab: call qword ptr [r8 + 0x40]
0x1002650af: mov rdi, qword ptr [rbp - 0x38]
0x1002650b3: mov rsi, rbx
0x1002650b6: call 0x100460020 ; 0x100460020
0x1002650bb: inc r15d
0x1002650be: mov rax, qword ptr [rbp - 0x30]
0x1002650c2: mov rcx, qword ptr [rax + 0x58]
0x1002650c6: cmp r15d, dword ptr [rcx + 0x10]
0x1002650ca: jb 0x100265040
0x1002650d0: mov rax, qword ptr [rbp - 0x30]
0x1002650d4: mov eax, dword ptr [rax + 0x48]
0x1002650d7: mov esi, dword ptr [rbp - 0x3c]
0x1002650da: inc esi
0x1002650dc: cmp esi, eax
0x1002650de: jb 0x100265000
0x1002650e4: mov rdi, qword ptr [rbp - 0x30]
0x1002650e8: call 0x10032ef60 ; 0x10032ef60
0x1002650ed: add rsp, 0x28
0x1002650f1: pop rbx
0x1002650f2: pop r12
0x1002650f4: pop r13
0x1002650f6: pop r14
0x1002650f8: pop r15
0x1002650fa: pop rbp
0x1002650fb: ret 
0x1002650fc: lea rdi, [rip + 0x8fc9f5] ; 0x100b61af8 ret
0x100265103: lea rsi, [rip + 0x8fc859] ; 0x100b61963 ./Clump.h
0x10026510a: mov edx, 0x47
0x10026510f: mov ecx, 3
0x100265114: call 0x1007e5f70 ; 0x1007e5f70
0x100265119: ud2 
0x10026511b: lea rdi, [rip + 0x917630] ; 0x100b7c752 m_critters && idx < m_numCritters
0x100265122: lea rsi, [rip + 0x91764b] ; 0x100b7c774 CritterV2Events.cpp
0x100265129: mov edx, 0x56
0x10026512e: mov ecx, 3
0x100265133: call 0x1007e5f70 ; 0x1007e5f70
0x100265138: ud2 
0x10026513a: lea rdi, [rip + 0x917647] ; 0x100b7c788 critter
0x100265141: lea rsi, [rip + 0x91762c] ; 0x100b7c774 CritterV2Events.cpp
0x100265148: mov edx, 0x58
0x10026514d: mov ecx, 3
0x100265152: call 0x1007e5f70 ; 0x1007e5f70
0x100265157: ud2 
0x100265159: nop dword ptr [rax]
