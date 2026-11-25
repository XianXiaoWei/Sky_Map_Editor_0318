0x100466e30: push rbp
0x100466e31: mov rbp, rsp
0x100466e34: push r15
0x100466e36: push r14
0x100466e38: push r13
0x100466e3a: push r12
0x100466e3c: push rbx
0x100466e3d: push rax
0x100466e3e: mov qword ptr [rbp - 0x30], r8
0x100466e42: mov r15, rcx
0x100466e45: mov r12d, edx
0x100466e48: mov rbx, rdi
0x100466e4b: mov eax, dword ptr [rbx + 0x8c]
0x100466e51: test eax, eax
0x100466e53: je 0x100466ea7
0x100466e55: mov r13d, esi
0x100466e58: xor r14d, r14d
0x100466e5b: nop dword ptr [rax + rax]
0x100466e60: mov rcx, qword ptr [rbx + 8]
0x100466e64: mov r14d, r14d
0x100466e67: mov rcx, qword ptr [rcx + r14*8]
0x100466e6b: cmp byte ptr [rcx + 0x14], 0
0x100466e6f: je 0x100466e9f
0x100466e71: mov rax, qword ptr [rbx + r13*8 + 0x28]
0x100466e76: mov rdi, qword ptr [rax + r14*8]
0x100466e7a: cmp byte ptr [rdi + 0x538], 0
0x100466e81: je 0x100466eb6
0x100466e83: add rdi, 0x270
0x100466e8a: mov esi, r12d
0x100466e8d: mov rdx, r15
0x100466e90: mov rcx, qword ptr [rbp - 0x30]
0x100466e94: call 0x1007be9c0 ; 0x1007be9c0
0x100466e99: mov eax, dword ptr [rbx + 0x8c]
0x100466e9f: inc r14d
0x100466ea2: cmp r14d, eax
0x100466ea5: jb 0x100466e60
0x100466ea7: add rsp, 8
0x100466eab: pop rbx
0x100466eac: pop r12
0x100466eae: pop r13
0x100466eb0: pop r14
0x100466eb2: pop r15
0x100466eb4: pop rbp
0x100466eb5: ret 
0x100466eb6: lea rdi, [rip + 0x70fe2d] ; 0x100b76cea IsInitialized()
0x100466ebd: lea rsi, [rip + 0x6fb3b7] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100466ec4: mov edx, 0xa8
0x100466ec9: mov ecx, 3
0x100466ece: call 0x1007e5f70 ; 0x1007e5f70
0x100466ed3: ud2 
0x100466ed5: nop word ptr cs:[rax + rax]
