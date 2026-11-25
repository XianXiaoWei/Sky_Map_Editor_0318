0x1007f6ca0: push rbp
0x1007f6ca1: mov rbp, rsp
0x1007f6ca4: push rbx
0x1007f6ca5: push rax
0x1007f6ca6: mov rbx, rdi
0x1007f6ca9: mov rsi, qword ptr [rip + 0x1852d98] ; 0x102049a48
0x1007f6cb0: lea rdi, [rbp - 0x10]
0x1007f6cb4: call 0x1007e9360 ; 0x1007e9360
0x1007f6cb9: mov rcx, qword ptr [rip + 0x1852d88] ; 0x102049a48
0x1007f6cc0: test rcx, rcx
0x1007f6cc3: je 0x1007f6d01
0x1007f6cc5: mov rax, qword ptr [rcx + 0x48]
0x1007f6cc9: test rax, rax
0x1007f6ccc: je 0x1007f6cd6
0x1007f6cce: mov qword ptr [rax + 8], rbx
0x1007f6cd2: mov rax, qword ptr [rcx + 0x48]
0x1007f6cd6: mov qword ptr [rbx], rax
0x1007f6cd9: mov rax, qword ptr [rip + 0x1852d68] ; 0x102049a48
0x1007f6ce0: test rax, rax
0x1007f6ce3: je 0x1007f6d20
0x1007f6ce5: mov qword ptr [rax + 0x48], rbx
0x1007f6ce9: mov qword ptr [rbx + 8], 0
0x1007f6cf1: lea rdi, [rbp - 0x10]
0x1007f6cf5: call 0x1007e9480 ; 0x1007e9480
0x1007f6cfa: add rsp, 8
0x1007f6cfe: pop rbx
0x1007f6cff: pop rbp
0x1007f6d00: ret 
0x1007f6d01: lea rdi, [rip + 0x36b5b8] ; 0x100b622c0 ms_vars
0x1007f6d08: lea rsi, [rip + 0x3ab19c] ; 0x100ba1eab ../../Code/Base/AutoLister.h
0x1007f6d0f: mov edx, 0x38
0x1007f6d14: mov ecx, 3
0x1007f6d19: call 0x1007e5f70 ; 0x1007e5f70
0x1007f6d1e: jmp 0x1007f6d3d ; 0x1007f6d3d
0x1007f6d20: lea rdi, [rip + 0x36b599] ; 0x100b622c0 ms_vars
0x1007f6d27: lea rsi, [rip + 0x3ab17d] ; 0x100ba1eab ../../Code/Base/AutoLister.h
0x1007f6d2e: mov edx, 0x38
0x1007f6d33: mov ecx, 3
0x1007f6d38: call 0x1007e5f70 ; 0x1007e5f70
0x1007f6d3d: ud2 
0x1007f6d3f: mov rbx, rax
0x1007f6d42: lea rdi, [rbp - 0x10]
0x1007f6d46: call 0x1007e9480 ; 0x1007e9480
0x1007f6d4b: mov rdi, rbx
0x1007f6d4e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007f6d53: nop word ptr cs:[rax + rax]
