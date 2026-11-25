0x1007be8b0: push rbp
0x1007be8b1: mov rbp, rsp
0x1007be8b4: push r15
0x1007be8b6: push r14
0x1007be8b8: push r13
0x1007be8ba: push r12
0x1007be8bc: push rbx
0x1007be8bd: sub rsp, 0x18
0x1007be8c1: mov qword ptr [rbp - 0x40], rcx
0x1007be8c5: mov r14, rdx
0x1007be8c8: mov rbx, rdi
0x1007be8cb: mov edx, 1
0x1007be8d0: call 0x1007bdb70 ; 0x1007bdb70
0x1007be8d5: cmp eax, 0x10
0x1007be8d8: jge 0x1007be977
0x1007be8de: test r14, r14
0x1007be8e1: je 0x1007be8ed
0x1007be8e3: cmp dword ptr [r14], -1
0x1007be8e7: je 0x1007be996
0x1007be8ed: mov qword ptr [rbp - 0x38], r14
0x1007be8f1: test eax, eax
0x1007be8f3: js 0x1007be968
0x1007be8f5: mov rcx, qword ptr [rbx + 0x158]
0x1007be8fc: mov rcx, qword ptr [rcx + 8]
0x1007be900: movsxd r14, eax
0x1007be903: mov r15, r14
0x1007be906: shl r15, 5
0x1007be90a: mov r12, qword ptr [rcx + 0x30]
0x1007be90e: add r12, r15
0x1007be911: mov qword ptr [rbp - 0x30], rcx
0x1007be915: movsxd r13, dword ptr [rcx + 0x28]
0x1007be919: add r15, 0x20
0x1007be91d: add r14, 0x10
0x1007be921: nop word ptr cs:[rax + rax]
0x1007be930: mov rax, qword ptr [rbp - 0x38]
0x1007be934: mov qword ptr [rbx + r14*8 - 0x80], rax
0x1007be939: mov rax, qword ptr [rbp - 0x40]
0x1007be93d: mov qword ptr [rbx + r14*8], rax
0x1007be941: lea rax, [r14 - 0xf]
0x1007be945: cmp rax, r13
0x1007be948: jge 0x1007be968
0x1007be94a: mov rax, qword ptr [rbp - 0x30]
0x1007be94e: mov rdi, qword ptr [rax + 0x30]
0x1007be952: add rdi, r15
0x1007be955: mov rsi, r12
0x1007be958: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007be95d: add r15, 0x20
0x1007be961: inc r14
0x1007be964: test eax, eax
0x1007be966: je 0x1007be930
0x1007be968: add rsp, 0x18
0x1007be96c: pop rbx
0x1007be96d: pop r12
0x1007be96f: pop r13
0x1007be971: pop r14
0x1007be973: pop r15
0x1007be975: pop rbp
0x1007be976: ret 
0x1007be977: lea rdi, [rip + 0x3e56d4] ; 0x100ba4052 idx < (int32_t)kMaxTextures
0x1007be97e: lea rsi, [rip + 0x3e5684] ; 0x100ba4009 RenderPipeline.cpp
0x1007be985: mov edx, 0x79
0x1007be98a: mov ecx, 3
0x1007be98f: call 0x1007e5f70 ; 0x1007e5f70
0x1007be994: ud2 
0x1007be996: lea rdi, [rip + 0x3e2626] ; 0x100ba0fc3 !texture || texture->IsInitialized()
0x1007be99d: lea rsi, [rip + 0x3e5665] ; 0x100ba4009 RenderPipeline.cpp
0x1007be9a4: mov edx, 0x7a
0x1007be9a9: mov ecx, 3
0x1007be9ae: call 0x1007e5f70 ; 0x1007e5f70
0x1007be9b3: ud2 
0x1007be9b5: nop word ptr cs:[rax + rax]

