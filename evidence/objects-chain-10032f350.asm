0x10032f350: push rbp
0x10032f351: mov rbp, rsp
0x10032f354: push r14
0x10032f356: push rbx
0x10032f357: mov rbx, rsi
0x10032f35a: mov r14, rdi
0x10032f35d: test rbx, rbx
0x10032f360: je 0x10032f3b8
0x10032f362: mov rdi, qword ptr [rbx]
0x10032f365: test rdi, rdi
0x10032f368: je 0x10032f3a1
0x10032f36a: cmp byte ptr [rdi + 0x20], 0
0x10032f36e: je 0x10032f386
0x10032f370: mov rcx, qword ptr [rdi]
0x10032f373: lea rax, [r14 + 0x85098]
0x10032f37a: mov rsi, rdx
0x10032f37d: mov rdx, rax
0x10032f380: call qword ptr [rcx + 0x18]
0x10032f383: mov rdi, qword ptr [rbx]
0x10032f386: mov rax, qword ptr [rdi]
0x10032f389: call qword ptr [rax]
0x10032f38b: lea rdi, [r14 + 0x5040]
0x10032f392: mov rsi, qword ptr [rbx]
0x10032f395: call 0x100795a70 ; 0x100795a70
0x10032f39a: mov qword ptr [rbx], 0
0x10032f3a1: mov rax, qword ptr [r14 + 0x5030]
0x10032f3a8: mov qword ptr [rbx + 8], rax
0x10032f3ac: mov qword ptr [r14 + 0x5030], rbx
0x10032f3b3: pop rbx
0x10032f3b4: pop r14
0x10032f3b6: pop rbp
0x10032f3b7: ret 
0x10032f3b8: lea rdi, [rip + 0x851f75] ; 0x100b81334 eventNode
0x10032f3bf: lea rsi, [rip + 0x851d85] ; 0x100b8114b Event.cpp
0x10032f3c6: mov edx, 0x19f
0x10032f3cb: mov ecx, 3
0x10032f3d0: call 0x1007e5f70 ; 0x1007e5f70
0x10032f3d5: ud2 
0x10032f3d7: nop word ptr [rax + rax]
