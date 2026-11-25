0x10025f030: push rbp
0x10025f031: mov rbp, rsp
0x10025f034: mov r8d, edx
0x10025f037: cmp dword ptr [rdi + 0x410], 0
0x10025f03e: je 0x10025f08c
0x10025f040: xor ecx, ecx
0x10025f042: mov r9d, dword ptr [rip + 0xacc367] ; 0x100d2b3b0
0x10025f049: nop dword ptr [rax]
0x10025f050: mov eax, ecx
0x10025f052: mov r10, qword ptr [rdi + rax*8 + 0x10]
0x10025f057: mov r11d, dword ptr [r10 + 0x500]
0x10025f05e: mov eax, r11d
0x10025f061: cmp r11d, r9d
0x10025f064: jne 0x10025f070
0x10025f066: xor edx, edx
0x10025f068: mov eax, ecx
0x10025f06a: div r8d
0x10025f06d: mov eax, dword ptr [rsi + rdx*4]
0x10025f070: cmp r11d, r9d
0x10025f073: mov dword ptr [r10 + 0x598], eax
0x10025f07a: setne byte ptr [r10 + 0x59c]
0x10025f082: inc ecx
0x10025f084: cmp ecx, dword ptr [rdi + 0x410]
0x10025f08a: jb 0x10025f050
0x10025f08c: pop rbp
0x10025f08d: ret 
0x10025f08e: nop 
