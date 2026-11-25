0x1007c3d20: push rbp
0x1007c3d21: mov rbp, rsp
0x1007c3d24: push r15
0x1007c3d26: push r14
0x1007c3d28: push rbx
0x1007c3d29: push rax
0x1007c3d2a: mov r15d, esi
0x1007c3d2d: mov r14, rdi
0x1007c3d30: lea rax, [r14 + 0x4c0]
0x1007c3d37: mov rcx, qword ptr [r14 + 0x4c0]
0x1007c3d3e: test rcx, rcx
0x1007c3d41: je 0x1007c3de2
0x1007c3d47: xor ebx, ebx
0x1007c3d49: nop dword ptr [rax]
0x1007c3d50: mov rdx, rbx
0x1007c3d53: mov rbx, rcx
0x1007c3d56: mov rcx, qword ptr [rbx + 0x60]
0x1007c3d5a: test rcx, rcx
0x1007c3d5d: jne 0x1007c3d50
0x1007c3d5f: test rdx, rdx
0x1007c3d62: lea rcx, [rdx + 0x60]
0x1007c3d66: cmove rcx, rax
0x1007c3d6a: mov qword ptr [rcx], 0
0x1007c3d71: mov rdi, r14
0x1007c3d74: mov rsi, rbx
0x1007c3d77: call 0x1007c3e30 ; 0x1007c3e30
0x1007c3d7c: mov dword ptr [rbx + 0x38], 0
0x1007c3d83: cmp qword ptr [rbx + 0x30], 0
0x1007c3d88: je 0x1007c3e08
0x1007c3d8a: mov rax, qword ptr [rbx]
0x1007c3d8d: mov rsi, qword ptr [r14 + 0x10]
0x1007c3d91: mov rdi, rbx
0x1007c3d94: call qword ptr [rax + 0x10]
0x1007c3d97: cmp byte ptr [rbx + 0x3b], 0
0x1007c3d9b: je 0x1007c3dd7
0x1007c3d9d: cmp byte ptr [rbx + 0x28], 0
0x1007c3da1: jne 0x1007c3dc0
0x1007c3da3: test r15b, r15b
0x1007c3da6: je 0x1007c3dc0
0x1007c3da8: mov rax, qword ptr [r14 + 0x4c8]
0x1007c3daf: mov qword ptr [rbx + 0x60], rax
0x1007c3db3: mov qword ptr [r14 + 0x4c8], rbx
0x1007c3dba: jmp 0x1007c3dd7 ; 0x1007c3dd7
0x1007c3dbc: nop dword ptr [rax]
0x1007c3dc0: xor byte ptr [rbx + 0x3a], 1
0x1007c3dc4: mov rax, qword ptr [rbx]
0x1007c3dc7: mov rsi, qword ptr [r14 + 0x10]
0x1007c3dcb: mov rdi, rbx
0x1007c3dce: call qword ptr [rax + 0x10]
0x1007c3dd1: cmp byte ptr [rbx + 0x3b], 0
0x1007c3dd5: jne 0x1007c3dc0
0x1007c3dd7: add rsp, 8
0x1007c3ddb: pop rbx
0x1007c3ddc: pop r14
0x1007c3dde: pop r15
0x1007c3de0: pop rbp
0x1007c3de1: ret 
0x1007c3de2: mov qword ptr [rax], 0
0x1007c3de9: lea rdi, [rip + 0x3e0966] ; 0x100ba4756 toLoad
0x1007c3df0: lea rsi, [rip + 0x3e0797] ; 0x100ba458e Resource.cpp
0x1007c3df7: mov edx, 0x12b
0x1007c3dfc: mov ecx, 3
0x1007c3e01: call 0x1007e5f70 ; 0x1007e5f70
0x1007c3e06: ud2 
0x1007c3e08: lea rdi, [rip + 0x3e094e] ; 0x100ba475d toLoad->heap
0x1007c3e0f: lea rsi, [rip + 0x3e0778] ; 0x100ba458e Resource.cpp
0x1007c3e16: mov edx, 0x12f
0x1007c3e1b: mov ecx, 3
0x1007c3e20: call 0x1007e5f70 ; 0x1007e5f70
0x1007c3e25: ud2 
0x1007c3e27: nop word ptr [rax + rax]
