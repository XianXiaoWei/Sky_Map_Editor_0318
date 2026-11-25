0x100407b20: push rbp
0x100407b21: mov rbp, rsp
0x100407b24: push r14
0x100407b26: push rbx
0x100407b27: mov r14, rdi
0x100407b2a: cmp dword ptr [r14 + 0x2028], 0
0x100407b32: je 0x100407b62
0x100407b34: xor ebx, ebx
0x100407b36: nop word ptr cs:[rax + rax]
0x100407b40: mov eax, ebx
0x100407b42: mov rax, qword ptr [r14 + rax*8 + 0x28]
0x100407b47: lea rdi, [rax + 8]
0x100407b4b: test rax, rax
0x100407b4e: cmove rdi, rax
0x100407b52: call 0x1007abd80 ; 0x1007abd80
0x100407b57: inc ebx
0x100407b59: cmp ebx, dword ptr [r14 + 0x2028]
0x100407b60: jb 0x100407b40
0x100407b62: pop rbx
0x100407b63: pop r14
0x100407b65: pop rbp
0x100407b66: ret 
0x100407b67: nop word ptr [rax + rax]
