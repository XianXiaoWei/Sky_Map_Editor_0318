0x1007abd30: mov r9d, edi
0x1007abd33: cmp r9d, 0x500
0x1007abd3a: jae 0x1007abd4f
0x1007abd3c: mov rax, qword ptr [rip + 0x189bf2d] ; 0x102047c70
0x1007abd43: mov ecx, r9d
0x1007abd46: mov rax, qword ptr [rax + rcx*8 + 0x98]
0x1007abd4e: ret 
0x1007abd4f: push rbp
0x1007abd50: mov rbp, rsp
0x1007abd53: lea rdi, [rip + 0x3f70cd] ; 0x100ba2e27 id < MetaClass::kMaxClasses
0x1007abd5a: lea rsi, [rip + 0x3f70e2] ; 0x100ba2e43 Meta.cpp
0x1007abd61: lea r8, [rip + 0x3f70e4] ; 0x100ba2e4c Invalid meta class id: %u
0x1007abd68: mov edx, 0x87
0x1007abd6d: mov ecx, 4
0x1007abd72: xor eax, eax
0x1007abd74: call 0x1007e6030 ; 0x1007e6030
0x1007abd79: ud2 
0x1007abd7b: nop dword ptr [rax + rax]
