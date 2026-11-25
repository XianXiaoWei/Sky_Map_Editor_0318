0x100274080: push rbp
0x100274081: mov rbp, rsp
0x100274084: push r15
0x100274086: push r14
0x100274088: push r13
0x10027408a: push r12
0x10027408c: push rbx
0x10027408d: sub rsp, 0x18
0x100274091: mov r13, rdi
0x100274094: mov rax, qword ptr [r13 + 0x38]
0x100274098: test rax, rax
0x10027409b: je 0x10027416d
0x1002740a1: mov r12d, dword ptr [rax + 0x10]
0x1002740a5: test r12, r12
0x1002740a8: je 0x100274137
0x1002740ae: xor ebx, ebx
0x1002740b0: lea r14, [rbp - 0x30]
0x1002740b4: lea r15, [rbp - 0x38]
0x1002740b8: nop dword ptr [rax + rax]
0x1002740c0: mov rax, qword ptr [rax + 8]
0x1002740c4: mov rax, qword ptr [rax + rbx*8]
0x1002740c8: mov qword ptr [rbp - 0x38], rax
0x1002740cc: call 0x1007abc10 ; 0x1007abc10
0x1002740d1: mov qword ptr [rbp - 0x30], 0
0x1002740d9: mov rdi, qword ptr [rip + 0x1b735c0] ; 0x101de76a0
0x1002740e0: mov r8, qword ptr [rdi]
0x1002740e3: mov rsi, r14
0x1002740e6: mov rdx, r15
0x1002740e9: mov rcx, rax
0x1002740ec: call qword ptr [r8 + 0x40]
0x1002740f0: mov rax, qword ptr [rbp - 0x30]
0x1002740f4: test rax, rax
0x1002740f7: je 0x10027414e
0x1002740f9: movzx ecx, byte ptr [r13 + 0x40]
0x1002740fe: mov byte ptr [rax + 0x2dc], cl
0x100274104: inc rbx
0x100274107: cmp rbx, r12
0x10027410a: jae 0x100274137
0x10027410c: mov rax, qword ptr [r13 + 0x38]
0x100274110: mov ecx, dword ptr [rax + 0x10]
0x100274113: cmp rbx, rcx
0x100274116: jb 0x1002740c0
0x100274118: lea rdi, [rip + 0x8ed839] ; 0x100b61958 idx < size
0x10027411f: lea rsi, [rip + 0x8ed83d] ; 0x100b61963 ./Clump.h
0x100274126: mov edx, 0x36
0x10027412b: mov ecx, 3
0x100274130: call 0x1007e5f70 ; 0x1007e5f70
0x100274135: ud2 
0x100274137: mov rdi, r13
0x10027413a: call 0x10032ef60 ; 0x10032ef60
0x10027413f: add rsp, 0x18
0x100274143: pop rbx
0x100274144: pop r12
0x100274146: pop r13
0x100274148: pop r14
0x10027414a: pop r15
0x10027414c: pop rbp
0x10027414d: ret 
0x10027414e: lea rdi, [rip + 0x8ed9a3] ; 0x100b61af8 ret
0x100274155: lea rsi, [rip + 0x8ed807] ; 0x100b61963 ./Clump.h
0x10027415c: mov edx, 0x47
0x100274161: mov ecx, 3
0x100274166: call 0x1007e5f70 ; 0x1007e5f70
0x10027416b: ud2 
0x10027416d: lea rdi, [rip + 0x908c2b] ; 0x100b7cd9f creatures
0x100274174: lea rsi, [rip + 0x908a8b] ; 0x100b7cc06 DarkCreature.cpp
0x10027417b: mov edx, 0x5c6
0x100274180: mov ecx, 3
0x100274185: call 0x1007e5f70 ; 0x1007e5f70
0x10027418a: ud2 
0x10027418c: nop dword ptr [rax]
