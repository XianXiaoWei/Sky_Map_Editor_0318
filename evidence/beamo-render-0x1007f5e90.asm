0x1007f5e90: push rbp
0x1007f5e91: mov rbp, rsp
0x1007f5e94: push r15
0x1007f5e96: push r14
0x1007f5e98: push r13
0x1007f5e9a: push r12
0x1007f5e9c: push rbx
0x1007f5e9d: and rsp, 0xffffffffffffffe0
0x1007f5ea1: sub rsp, 0x60
0x1007f5ea5: mov r14d, r8d
0x1007f5ea8: mov r13, rcx
0x1007f5eab: mov r15, rdx
0x1007f5eae: mov r12, rsi
0x1007f5eb1: mov rbx, rdi
0x1007f5eb4: cmp byte ptr [rbx + 0x538], 1
0x1007f5ebb: je 0x1007f5f42
0x1007f5ec1: test r13, r13
0x1007f5ec4: je 0x1007f5f61
0x1007f5eca: mov qword ptr [rbx + 0x500], r13
0x1007f5ed1: mov rdi, r13
0x1007f5ed4: mov rsi, rbx
0x1007f5ed7: call 0x1007b97b0 ; 0x1007b97b0
0x1007f5edc: vxorps ymm0, ymm0, ymm0
0x1007f5ee0: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x1007f5ee6: lea rax, [rsp + 0x20]
0x1007f5eeb: mov qword ptr [rsp + 0x18], rax
0x1007f5ef0: mov qword ptr [rsp + 0x10], 0
0x1007f5ef9: mov rdi, qword ptr [rbx + 0x500]
0x1007f5f00: lea rsi, [rsp + 0x18]
0x1007f5f05: lea rdx, [rsp + 0x10]
0x1007f5f0a: xor ecx, ecx
0x1007f5f0c: vzeroupper 
0x1007f5f0f: call 0x1007ba080 ; 0x1007ba080
0x1007f5f14: test al, al
0x1007f5f16: je 0x1007f5f80
0x1007f5f18: mov rcx, qword ptr [rsp + 0x18]
0x1007f5f1d: mov r8, qword ptr [rsp + 0x10]
0x1007f5f22: mov rdi, rbx
0x1007f5f25: mov rsi, r12
0x1007f5f28: mov rdx, r15
0x1007f5f2b: mov r9d, r14d
0x1007f5f2e: call 0x1007f5fb0 ; 0x1007f5fb0
0x1007f5f33: lea rsp, [rbp - 0x28]
0x1007f5f37: pop rbx
0x1007f5f38: pop r12
0x1007f5f3a: pop r13
0x1007f5f3c: pop r14
0x1007f5f3e: pop r15
0x1007f5f40: pop rbp
0x1007f5f41: ret 
0x1007f5f42: lea rdi, [rip + 0x3b1d24] ; 0x100ba7c6d !m_isInitialized
0x1007f5f49: lea rsi, [rip + 0x3b1b94] ; 0x100ba7ae4 Vertex.cpp
0x1007f5f50: mov edx, 0xce
0x1007f5f55: mov ecx, 3
0x1007f5f5a: call 0x1007e5f70 ; 0x1007e5f70
0x1007f5f5f: ud2 
0x1007f5f61: lea rdi, [rip + 0x380b18] ; 0x100b76a80 renderList
0x1007f5f68: lea rsi, [rip + 0x3b1b75] ; 0x100ba7ae4 Vertex.cpp
0x1007f5f6f: mov edx, 0xd1
0x1007f5f74: mov ecx, 3
0x1007f5f79: call 0x1007e5f70 ; 0x1007e5f70
0x1007f5f7e: ud2 
0x1007f5f80: add r13, 0x20
0x1007f5f84: lea rdi, [rip + 0x3b1cf3] ; 0x100ba7c7e foundContext
0x1007f5f8b: lea rsi, [rip + 0x3b1b52] ; 0x100ba7ae4 Vertex.cpp
0x1007f5f92: lea r8, [rip + 0x3b1cf2] ; 0x100ba7c8b Failed to find render context for RenderList "%s". Is it in the Outline?
0x1007f5f99: mov edx, 0xda
0x1007f5f9e: mov ecx, 4
0x1007f5fa3: xor eax, eax
0x1007f5fa5: mov r9, r13
0x1007f5fa8: call 0x1007e6030 ; 0x1007e6030
0x1007f5fad: ud2 
0x1007f5faf: nop 

