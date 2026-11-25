0x1000967b0: push rbp
0x1000967b1: mov rbp, rsp
0x1000967b4: push rbx
0x1000967b5: push rax
0x1000967b6: mov r9, rsi
0x1000967b9: mov r8, qword ptr [rdi + 0x6018]
0x1000967c0: test r8, r8
0x1000967c3: je 0x1000968b2
0x1000967c9: movabs r11, 0xcbf29ce484222325
0x1000967d3: movabs r10, 0x100000001b3
0x1000967dd: mov al, byte ptr [r9]
0x1000967e0: mov rcx, r11
0x1000967e3: test al, al
0x1000967e5: je 0x100096808
0x1000967e7: lea rsi, [r9 + 1]
0x1000967eb: mov rbx, r11
0x1000967ee: nop 
0x1000967f0: movsx rcx, al
0x1000967f4: xor rcx, rbx
0x1000967f7: imul rcx, r10
0x1000967fb: movzx eax, byte ptr [rsi]
0x1000967fe: inc rsi
0x100096801: mov rbx, rcx
0x100096804: test al, al
0x100096806: jne 0x1000967f0
0x100096808: mov bl, byte ptr [r8]
0x10009680b: test bl, bl
0x10009680d: je 0x10009683a
0x10009680f: lea rsi, [r8 + 1]
0x100096813: nop word ptr cs:[rax + rax]
0x100096820: movsx rax, bl
0x100096824: xor rax, r11
0x100096827: imul rax, r10
0x10009682b: movzx ebx, byte ptr [rsi]
0x10009682e: inc rsi
0x100096831: mov r11, rax
0x100096834: test bl, bl
0x100096836: jne 0x100096820
0x100096838: jmp 0x10009683d ; 0x10009683d
0x10009683a: mov rax, r11
0x10009683d: lea r10, [rip + 0x1d396ec] ; 0x101dcff30
0x100096844: movsxd r11, dword ptr [r10]
0x100096847: test r11, r11
0x10009684a: jle 0x100096871
0x10009684c: xor ebx, ebx
0x10009684e: nop 
0x100096850: mov rsi, qword ptr [r10 + rbx*8 + 8]
0x100096855: cmp qword ptr [rsi + 8], rcx
0x100096859: jne 0x100096869
0x10009685b: mov rsi, qword ptr [rsi + 0x10]
0x10009685f: test rsi, rsi
0x100096862: je 0x10009689d
0x100096864: cmp rsi, rax
0x100096867: je 0x10009689d
0x100096869: inc rbx
0x10009686c: cmp rbx, r11
0x10009686f: jl 0x100096850
0x100096871: mov qword ptr [rsp], r8
0x100096875: lea rdi, [rip + 0xacf278] ; 0x100b65af4 id != -1
0x10009687c: lea rsi, [rip + 0xaced71] ; 0x100b655f4 AnimationInstance.cpp
0x100096883: lea r8, [rip + 0xacf273] ; 0x100b65afd Animation Sequence %s not found in %s.
0x10009688a: mov edx, 0x2d2
0x10009688f: mov ecx, 4
0x100096894: xor eax, eax
0x100096896: call 0x1007e6030 ; 0x1007e6030
0x10009689b: ud2 
0x10009689d: cmp ebx, -1
0x1000968a0: je 0x100096871
0x1000968a2: mov esi, ebx
0x1000968a4: call 0x1000968e0 ; 0x1000968e0
0x1000968a9: mov eax, ebx
0x1000968ab: add rsp, 8
0x1000968af: pop rbx
0x1000968b0: pop rbp
0x1000968b1: ret 
0x1000968b2: lea rdi, [rip + 0xacf2a1] ; 0x100b65b5a m_baseSkeleton != nullptr
0x1000968b9: lea rsi, [rip + 0xaced34] ; 0x100b655f4 AnimationInstance.cpp
0x1000968c0: mov edx, 0x31a
0x1000968c5: mov ecx, 3
0x1000968ca: call 0x1007e5f70 ; 0x1007e5f70
0x1000968cf: ud2 
0x1000968d1: nop word ptr cs:[rax + rax]
